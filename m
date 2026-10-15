Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26EACC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DerXhHtNp5KAS7b6YTtqVphbqoa4v22Zyi/1qyIXn6Y=; b=aJifahY8yYl0X9
	LLadvF+9fLHKn+EAMIR5nfxJFVYWQAfgZFM+y2210N7UsXUDkWAlZhDy+upf73En4AMke2H3M91Xp
	T+AkyDKpPKg0aoiQNTmfP0922Hd8q9FHt2OIcKzDe26lBgjSlrQndksNjoLtXdEizKFSTkrPGB6G9
	k+MxHZjTsJKV59ARtznLsTTpostJ6TrbVC/DHq1UI0yLv0dK0jZggXM+1/9tkLPsA9UWF4j7iGNj9
	XxPuswhMxOVD9VSlX4VQz0HaLYq7kNPheZX1CpSJb0Q4FiGlB4YgRr2aOJeLqME57FjzA5hApWsPF
	ge6sq5ICfwf12675fT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuR-00000000SXo-1ENk;
	Thu, 15 Oct 2026 14:58:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMuO-00000000SWo-0Lqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:58:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48870973bddso48321f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792076293; x=1792681093; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DerXhHtNp5KAS7b6YTtqVphbqoa4v22Zyi/1qyIXn6Y=;
        b=ea/LyWBiIV0CMWl4PnQHdk24yZHlurSXjFqrdnuxSd51zF+3Luk0Rj5PAssOf4zT5X
         cMr6D5J33giSLX2PubA87huq4r7s4LI6ku0WLLqqdTzRrnojgLxAmxxyey4uRLJ5+QJf
         GWGt1EnMe07TZlE/HXJ640PWh8F6T9GN+HwHynNMipasrfejbXNk0rxd7Ia9HjdTdFtD
         vzxQF1S83Y1RRH4FtleyTBlIrHFr8PA97Qn8RcY1UAB3sX/sBORiXlzmA4sEL2O/4RjY
         NUZdfycaXIpM+UysQxeemUBd10rKavmlbqOEfyAlnsEnqmjI5LLyK7oDVUAV5EDemL49
         RCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076293; x=1792681093;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DerXhHtNp5KAS7b6YTtqVphbqoa4v22Zyi/1qyIXn6Y=;
        b=oh/u/ozhuJgsFu1EagXhOFEJSf5QCwo0gK2WmVvaZgV4ZHhNikjXdBLJ+JMZKKnAh7
         XDRIFjF0pfsgaklFlueN3vJJ7AcmhGMhagBdNJSBqSWdMdo9uUChLxzVrGQgvwMjGVyx
         ldSciM76BeuWwPwMN1NjMP/n7uJ4GeTwRltJeqaGCTFz1YM3HI/oxHJXCuP7yxImGKPH
         UgSl6081qS5lx1m5LVuXl5ytTJ3DCH99LeTKeH7TiNgHSfTmVQodrnfdLMqQdLK55ovY
         BfsePQKfMomyev9qxjW3Jl6NDj593ADDwgcepy1wfa1MlQ6C8DOAlivcJd8/SPEwDI5+
         v3vw==
X-Forwarded-Encrypted: i=1; AKwUvBylUhRNbXAzmoiA0eWop6fgpcVbjB+or21oq1VuIDeSEH+Aw5ryx3rUyGeGZuDdx2GrWX5JVJxJ0G5WMX0piu6+@lists.infradead.org
X-Gm-Message-State: AFq9FYIAo86ZJ8V61H/x8UUgbHWSEsK7H2TIUA6mB/WwAwttXMVPtJKT
	gWS7jTyzOjh0eJI+p33dBXwqph6jzL8KB1beU4jm8i8b8Cp/t02XgW6MCHv6Xh1OQV4=
X-Gm-Gg: AYBFou1N5bB30k+z5XnD7Ykef7GdLS5bICIbzGlrnu6bRGyqUWGoeyFf6nLYLDV9C2G
	4GHRkVuqMKw6zZRHb6DWXIwKDGRusQKnALsCcqgSRDAqm7xsRsfXA46S4uDcvB+J+Nnh6G3mkWb
	QCeTQnhDUtuAFMyHihdpQ40vhMErErqiUwW6beQLIiPbUipWkDC2QstCOK35sPtzXekDu2NP69M
	imDeXeeLrUZAg5OaNq/0hToBW3bEz+RjJOsqIc/fIbSkOPLh+R4cr98ZIExpVrHa0KfVj5TMmN/
	QcQLm/L+UIv7HAJzsGQTwE1AR3N0QmyDFv9xzw3bCY6Vp7fRL/NBRI3+nB352jXTA8KcVNpwsJA
	11UUiobL+tKrX8Jt9YcqK6BoH76E75CfUIQamAhaqGJpecL0DaTCHH+Fzhw4dAomv1H9mhMK9Ty
	G0B3CYdUCVmSmCRwI87hC3BVFhDXKmQyWSiSAKxICcCRdb1mevtuBgVWFf2Dx79XeJCISKH9TFq
	LifV6QV0U4OlYoEi3ksyz7/qN1UyLq4RtIBwAaXdRcL9Fn4pT28zeL8/8y5kyi6VPmIoViQVxW9
	m1P9B54aGwYQ9PopANR86kLkd6uAH9BELx66tLpBf/jCyRA7OzUZ+GSrUlU=
X-Received: by 2002:a05:6000:2488:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48dfae552eemr686896f8f.7.1792076292078;
        Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm19738293f8f.40.2026.10.15.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:11 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
Date: Thu, 15 Oct 2026 15:55:00 +0100
Message-Id: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETp0GoC/43NsQ7CIBSF4VdpmMXAxdLi5HsY01CgylBQIFjT9
 N0lTMZFx5M/+c6KognWRHRsVhRMttF6VwbbNUjdpLsabHXZCAhw0hGOkxItX3BM8ywVdn6w4TE
 kI4P2T4d72bUCRjH1iqJi3IOZ7FL9M3ImYWeWhC6l3GxMPrzqcaa1//mRKaZYT4QITaCDcToFG
 1VMMuyVnyue4QNk5BcIBZRcMSoYjLI/fIHbtr0B8coxUSgBAAA=
X-Change-ID: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Eric Dumazet <edumazet@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=Q4wFPJGMnZj3CekJ0BbunBaPUViZ/ENfbpq0d6PkpF0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBq0OnWOTQqxxX7nMcfeGzROflkt4bY/QjQzVNnM
 T0WFB3avd+JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCatDp1gAKCRB84yVdOfeI
 oePkD/94qvwD54AknAWsteA5RKgdf3ycF1CoudrTwIUffTO+WlKSyjZf1IXhPyPGBv+rc5D0h0j
 134nan8y/SxRaisB4DG5I3QW/dfqHl1EsDIaXOlH3508Ejf85X8ldB8SYfMVXXfkfmzPaRtPnQF
 yhL1dHBAzxc0YvhbZbi0cFblL5FsAgtiRou5gSw8EJu3kPuRA2No9BKQAI4nRx7OC2DT120Zzid
 yS3+GFS5RCf7eJFv/B+EVVkQVvA2h8GLXlgOPxHCADMJprcgN9zBApQUVQ9/aidBXGy0Al3krY1
 ZCMoaLvOwNZGxhQ+SHI2oHP89pIMSvtw8Fqv4o4ZhX6Hs+6iUetprT+ZnBCNCjYH0tmGN7nDbhC
 GSs3NrUhy4zypAo1dtW3o3z0haqZrV6Y4R/yhdvXmF5s59qXkWIzaJc2JYKillkU9In4CFjOLeO
 QoipTKFtxxYOabsRledtwFrOxj7mRmpQZvgOC1YRSt1CPi0LHrQsYqac3uty/ITTwE2AyjE4s4n
 TzRONiTtBea07NtkLqyBhr8h0XaNpJsfI4DfKpD5NklWO6aiBNbzvrpIn891O0fSapIVzrXVi9X
 NCdoE2zwepxIN5q4AFleujozFjVaOkHOFYaNHhdWxNPFgIGlIXELUFgTHv9CLMVeN/ykoCxIH4q
 fWs8gQZruCYQHRQ==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075816_279365_7EC9E8D4 
X-CRM114-Status: GOOD (  12.19  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently stmmac will run a full cycle of IRQ tear down and setup when
setting up a new XDP program. This makes tuning TSN systems difficult
because whenever a new XDP program is installed then the irq threads will
be stopped and restarted which will undo any thread tuning.

This series addresses this issue by replacing the free_irq() with a disable of
DMA interrupts in the XDP paths. The series consists of a preparative patch that
extends the DMA interrupt enable/disable functions and then follows with the
meaningful change.

These changes were developed (and tested) as part of the TC956x work that
Alex Elder and I have been working on. However the change should work with
any driver that uses the stmmac core and there is no dependency between these
changes that that work.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
Changes in v3:
- Switch to more aggressive interrupt masking to avoid problems with
  concurrent normal/abnormal DMA interrupts.
- Changed the enable_dma_irq/disable_dma_irq ops prototype (to support the
  above)
- Link to v2: https://lore.kernel.org/r/20260730-tc956x-stmmac-no_irq_teardown-v2-1-a6c31932ba84@riscstar.com

Changes in v2:
- Added net-next prefix
- Remove stmmac_init_chan() from stmmac_xdp_open() because it will re-enable
  interrupts
- Link to v1: https://lore.kernel.org/r/20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com

---
Daniel Thompson (2):
      net: stmmac: Introduce group arguments for enable/disable_dma_irq
      net: stmmac: Avoid freeing and re-requesting IRQ during XDP set prog

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 12 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 10 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 89 +++++++++++++++-------
 8 files changed, 135 insertions(+), 71 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>


