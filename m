Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AECC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=; b=cSbhJ4Xr6xIR+f
	ndG2ENBd4Lv2B2yIojFy6+0Y/QnNAaDBe40vF7Yd3WRCZLS7VLuQbBPGp2ixIIPCa9o85n8M3+6Oi
	3z22F7dsWyaqxdTnRh+ci7FfiXcAm1b1jhUNjwHgQThTzJHtI/Qf4v9t+c65t4kp+il+heRzY6+e3
	UBcLcdRL2NSr+TTnw1j+Gd1558M/u8WhKrX8jYnTBzrYFEhHATPFsj4lryWErup56BfZt4/vhKWze
	2R4zak2Idz9F30GbLjwzpv5v7KGiXRXxctygYylTaqQHljUThNBw83bIyFZI7tin6dU+xIe6M8QQ/
	GuvSYxrRCp69lvXDOXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YRN-00000007oyq-31vG;
	Tue, 15 Sep 2026 19:03:37 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YRK-00000007oyD-2Ax7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:03:35 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a3ed715so146415b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 12:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499013; x=1790103813; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=nmfYixCFNSaeAAV2OebiA0rT+F8NzuJRVR6Z8IG68RKTRE0CgBfQIa1GUdSiGkg4kT
         r/1UebKKGm0fhQSNJG9inWIEzBB9yUaIWZREKbvCiHap7fcFtEH4FVY5faHtnrRDr9H9
         FrExxW6Rt1MCkqnY+3abHsKb3Rqs4/MUEOlHNnobjX+jtYDc8YWMM8s65jWrxQMu5ux3
         ukaudA/DoTTVApwNdrgWrh/A2daDrXtQpKroUTuUr/717IXMPIw756LESzSD7EJywTIL
         muqMFND4opxucjH69m9r8JxNogw+D9FGy9sexbHsrBUe9q9XABY16xlSmgpnL3o80C0O
         ATrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499013; x=1790103813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=0BaJq17pC9fbwR0B3sP8tA88dPzVyX04NQjLPjHyNYDyPpqphMumqGYs/LKoN6awTU
         ScxgTAgdizED9Tzk08aPY768VNhxpMf6wc//p8qZfNhTHPvo0QCT5w1wP6v0sxziYucR
         sVsNMp4bj5SHuAkbjKsgqWyrRRUJO6tjizV2t9xEp5mxtwa6CNTN6dL9R9DwPgeNsI5D
         f+X2hnT7I58T6V2mm4GV/C6fLNTJp1e8RoCZkPFJYZLBB6ANtLSvNRy5a5wSmhFsg6K2
         qj8/oVHt4Tl0QXrCbZ0EPP1EsdOIgzIrPlMJJBiG5tr9A73HsXEBm3xtVz2Dw4skvaX8
         qL1g==
X-Forwarded-Encrypted: i=1; AKwUvBzY3tR7c2MM32qhAsLT6FKPenAFbiK9a0Xb6jI5oai4/ZWwA2jHFclVKkLNkBEFNBjWWkrnkMpzlkWsLNeGdWrB@lists.infradead.org
X-Gm-Message-State: AFuF++mr/bOIpM3P6EJWC9o8EDfMe4iwTayMKkfqRTH6GJlv6Vb6ejMd
	NvfbASrTv5f3gqjQPXJLn5mAJpJesWNaMVoka2TCSResnMg+FOKkKcts
X-Gm-Gg: AYBFou35Yrk38YCMXGcO2M4+eO6jx9RxVVUaYjfYjk9w2VdQgZi2nodrdLKHJuoYUie
	owD56n4bezkbEDZCsEJ8hb3iOB9qDYI7gPBxok+GKX2knZk7eJTCbNNLvxHBbQXwQRnfqaGgsb5
	i7LkkMtgtlJmLYJxIW67+fCRkoDs/ybbWSVl9mxA+cQqjF2Yv0GQLboQYO1EFLps4tbZFOBdMQO
	BYcw/zVlQPoH8JCRnUr1Z+pHHbp/Kg79pFcw0GH50f9zpm84BqxNZpSHI0UBkUzPpl+Zmrg2D8n
	XUsRa+q5dEsEBmjl3aqmGPbQjU+Rq8U/aubEUs04dI2v90+Kz6/cAmkrerAe0E3mI/t3MvnE3HY
	jVuyKHRUULb3QHrjc/trT83oAnIp4go+3mrNsayb5f53Re0OKbNtTi6hKagE84O1t2nwcZzjNGo
	zRWikDOk2M8NXfkkzp1uXjGPeym2pHkju2Y8TwI89dFwRNXjRbV+BfjpzZPCn9/UpP/Jokmr0Y5
	UF0psosVlDchEWQNPd+rm3pfTJ+xgYL83Zie6AYbPtozZKHietFjVAQP+vHKMb0HY5T2f2P+UEi
	hg25KEEed2G3uJChafoNGftZaDf4Cm/m7WslgE8o/c7+UPOZIke2/PnPl1RjKdYRX6IpLobmJre
	n9Q+pNXRXOFEx0qDY4XtYOQ==
X-Received: by 2002:a05:6808:1929:b0:4c1:f40e:b697 with SMTP id 5614622812f47-4c7b61758c4mr7115389b6e.38.1789499013397;
        Tue, 15 Sep 2026 12:03:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: add Allwinner H616 EMAC1 support
Date: Tue, 15 Sep 2026 13:03:17 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgE0N6eZXSRZKOOgVjSVIRx
 Hdv1OXP4XwrZE7CGR7NColnyTLFGnRpIAwu9ozyrg1aaavuZDD//CgFB0sWeXSBcCYk015VezP
 aeQ/1+k3cyXKwT4hcMPJS4HUuVfhwKLsK2/YHmuTXGoIAAAA=
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_120334_578324_36D89FDC 
X-CRM114-Status: GOOD (  11.71  )
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

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

The PHY commonly connected to EMAC1 is in an AC200 or AC300 companion
package, not the H616 die. Leave its initialization to the PHY driver
instead of using the H3 internal-PHY controls. Retain the supported TX
and RX delay settings through the shared syscon setup.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml     | 18 ++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 21 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
---
base-commit: b8e9e7d82e7eefd5d2d528469d94ec20e96b38c3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


