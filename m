Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7806E67494
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 01:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CbOKOQ6cXn7wwdr6Ntm3B7T5w6pad7a2v3ZbayC5AN8=; b=u3Y6fyXgAPYFs8dHoGMTFWTmy4
	6jSTHJSdyhj6C0dnlQsR8mg4ojIT5nrhx8m1SKuoUO7sYzgijnGRqyBAh3cZlphjYvfLluaSM/7vk
	zZ+y1D54fDJ8CEu9wyrfq5ZLNzKgkVW1da/WIussp7LTISwu9HySeYKBg3NwmD9WQ6VX1JMioe6+0
	hDTqpUefVmLY2Vo7z45pwubfPV2WSZWwhJcIW8/4AY6rlEWN2yy/4QrJKYBOU4OGWdC/qRow9hfIO
	uTM38GoCdx5tRddHT3kouqbYurmYEWCPRoVFYm6aMik8oRU+X5vmnfq7qg3V4s+Z9gbHj8eRZpl7d
	ngUoembQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gjQ-00000005Skx-2yGR;
	Fri, 01 Nov 2024 01:45:44 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ghj-00000005SLU-2fbH;
	Fri, 01 Nov 2024 01:44:01 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5eb73ec1e1aso802844eaf.2;
        Thu, 31 Oct 2024 18:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730425438; x=1731030238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbOKOQ6cXn7wwdr6Ntm3B7T5w6pad7a2v3ZbayC5AN8=;
        b=THAVSt7cJY5iCP46ytdBL9sEPdCI95aU/HQYO3P6w5gIRy7DQvXRHI6vTwX0NhAiMc
         HfD4EGJjJQR1lVp8c789HQ0ZvBkz5ao8hCRyPCHp3w7bBRs0i4genADR8FM8RE/up0Dt
         8MiU0KdfpM/icKwFOUR6BQaAVZHT6B+6I6ZBWUExQnNQCAWti8Eh+y6x6mlopV4FvTS1
         jzMtvjBLAdVEaFZzBs6X+VlQG0d3uUvelNQdvIW07kExZIhnogExysKSNriEq8SKPQbs
         RwrqG4+qpNpoOzQ/rRfrqPDr5/FtKIiN2HjvHZYMnGWSfktA7oSDcExjfG3GZUXH+YXT
         3rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730425438; x=1731030238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbOKOQ6cXn7wwdr6Ntm3B7T5w6pad7a2v3ZbayC5AN8=;
        b=YoWXm4ZlQfo5PF2YFJp/d3oeiI10k+pOeD+qrUjGYKAeGbLmUS+KOUtb95tML40I8M
         j2hV17V63qyAXTadY/nNFinZ8ZL+AaKgp0sTm8r9lCkd8jIuur4i8D0caA4MCmFZPRni
         bG5m3KlHRrhSBPx4Ph+fuJDbZgFtwyMb3EobdR3pHXxmHgo9mZJUhenWQS4f152xSaJU
         ha50v2FV8oh/t/YyAGVqwn5/XnwlhM/N/uuUbUaHhDhjj8XhjAo39qjpGB6j8G5pTMju
         Nou+NTgrfKEMKw/Nfo1gp3MW8+YXDTZXczjIHoiO78YJdPKWkSmYgJ7bi+NWQNanOAdl
         HyoA==
X-Forwarded-Encrypted: i=1; AJvYcCWHpiVo7G+dweWplbFk0rPw/O60j+6cl04LVbiNwu3zyegaoXXlqbAAwJy+KUHH+K4NFTUIhisLzCV36qXMdiHr@lists.infradead.org, AJvYcCXdC+g4+ojhhez83owOEFc+fa4lPCZyHWsMWKFkEIgC7YKFvJWp/Gqt88ehwc+pEKc5oB651coJYgSD4WY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTQsPyehJVc4eeh0hQIs5SITsPldWqxIFrso8Dg+as77Skrrfx
	USihdkXMean205toLqoC5bTlhfq0OAmTyeptoiAKyGr+sYUcMEV/
X-Google-Smtp-Source: AGHT+IG2sb4YVVz0VFvLk0SRUEvu5cS8s5UH9lKMcZltZ6rlJph6ABKzjSAYEOkurbMSWKYOqwCwCw==
X-Received: by 2002:a05:6870:c8d:b0:288:6ce7:6d6b with SMTP id 586e51a60fabf-2949ed34d30mr1772814fac.5.1730425437875;
        Thu, 31 Oct 2024 18:43:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ed422sm1773674b3a.77.2024.10.31.18.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:43:57 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC net-next 0/3] riscv: sophgo: Add ethernet support for SG2044
Date: Fri,  1 Nov 2024 09:43:24 +0800
Message-ID: <20241101014327.513732-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_184359_703128_44D9FE3A 
X-CRM114-Status: GOOD (  13.69  )
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Since v2, these patch depends on that following patch that provides
helper function to compute rgmii clock, and this patch are marked as RFC:
https://lore.kernel.org/netdev/20241028-upstream_s32cc_gmac-v4-4-03618f10e3e2@oss.nxp.com/

Changed from v2:
- https://lore.kernel.org/netdev/20241025011000.244350-1-inochiama@gmail.com/
1. patch 1: merge the first and the second bindings patch to show the all
            compatible change.
2. patch 2: use of_device_compatible_match helper function to perform check.
2. patch 3: remove unused include and sort the left.
3. patch 3: fix wrong variable usage in sophgo_dwmac_fix_mac_speed
4. patch 3: drop unused variable in the patch.

Changed from v1:
- https://lore.kernel.org/netdev/20241021103617.653386-1-inochiama@gmail.com/
1. patch 2: remove sophgo,syscon as this mac delay is resolved.
2. patch 2: apply all the properties unconditionally.
3. patch 4: remove sophgo,syscon code as this mac delay is resolved.
4. patch 4: use the helper function to compute rgmii clock.
5. patch 4: use remove instead of remove_new for the platform driver.


Inochi Amaoto (3):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 105 +++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 257 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0


