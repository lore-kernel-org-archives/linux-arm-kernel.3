Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BAEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gdvNoZdxI+TWENbSWz9hBd4EuJ//tH9knwU3HWPo67o=; b=0rtBo0aEqYe4Sx8NNbXFg8GYyi
	Z/KTSTCUjHieSNfvcWYtXthQSTsbJ+m7ze2EkwqJTvtpY6ALuTB/g2C24qhFArVaKeVvPstvm0sud
	HBrvby9gdPQyqDfVaeUm1alKn0UIao4B0DFmb9nIzDA1vHJjg7Xko9y6jjCoucr09yXgJInq3k5QX
	9nQ8EoRHx6mcsufljGbCHmANIHuZu9803DF/HLMSNOGAX+fv4vsAd8j669NcU2ilLYxKPFgrhd/UR
	4zXhp6gRxPTyEgDvxR+PQYUXFR73TZ7HHAvtVoeyo+rpNpVdcQBY2ZrWya9q2cBCXgputMzwcgA2y
	DYmLZwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMhZ-0000000CpEb-1MO7;
	Fri, 07 Mar 2025 01:40:37 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMKe-0000000CmIK-30gL;
	Fri, 07 Mar 2025 01:16:58 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso10893116d6.0;
        Thu, 06 Mar 2025 17:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310215; x=1741915015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdvNoZdxI+TWENbSWz9hBd4EuJ//tH9knwU3HWPo67o=;
        b=eJNRD21OFOyoR5FhMNJF83DymvAMQLHM1q2MT13bIIQf8bjEkEVD7ZO2CC5ZTN7E+W
         DZQF9CRILqsFJ01gA+3CO5jWFT1hiJRk+/AkegxIDWx+5s9FpgUd6GIjq/HNSaUJpLlc
         HEkvogUKLAPKhmIlq4WzMhVKuQE3MxWo/llHW4z70aVESl6ACjvAhKfT86NdkanpPTDu
         mfzVNL70p/8AOW2wc5cA6bzn/rNGUmS/jqYiG9//bxhcB7mQLNGrmqvCKaqNg+0liLXx
         WKTA8NfAUEj5vBAgyW9hAFWbsJRFGSAa4ITrgLMG/yXHKbBZMTkbJVDe7a+HXCwJeOCr
         PjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310215; x=1741915015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdvNoZdxI+TWENbSWz9hBd4EuJ//tH9knwU3HWPo67o=;
        b=Dx6eh4E8LlzXvF2iOYw8ZuJfaCd6ssdnY/nYQV7G91w5vdl1OX2DA45o5pq3jqrXJt
         p9/BDH/5NujzZj4g2oe6QmtWbYxo2NxH9qBIzsjOTztiqjW0qsYCieVEZOlwW6K0qdX3
         gbKQvvWEOtIRwosIhMuZJTfOXoycWR/64tnRzRkMrkeCSN++Rwqa491ZYFTsP1m8e7Fd
         jmEkjQNI1MBEAN6/Ta2m2b5ImURNe9k7UQP9UbXYxbWw6Bii6hIDLH/xiNBhew4lTFhL
         Y3vpOpclws3wX1J9vjnC4O8mhs8QY3zaukZ8H/GSUEZYUfoRrDtt4p+U9VUtX+UaBXnu
         tb8A==
X-Forwarded-Encrypted: i=1; AJvYcCWdp6LgU2kq1KxthkUaLIITlNk+VQgKBKyCChHeu1g555qBcYr0lblZ2Af+UGFk34Nk4Dac8JdJZJ6YSJs=@lists.infradead.org, AJvYcCXtfGKorD4QZJNS9219s4HaCeYG8CRijG00Dgn6SkBalpEm2gxd7oduppAG9zy+ESabmBNRVN6/yn/D+MYrLQOa@lists.infradead.org
X-Gm-Message-State: AOJu0YxP40/LvZW2fLeTH1xpT84f6V+Xxtmgprww/FqBbqovKMruaU8g
	ryH0o9y3ztysYdiBrc/pq3DHPwr1jmh5kghINbMD2CW5rbQDgc9z
X-Gm-Gg: ASbGncus7bRubZ4TBqdNaF8PkXjsLMxm6WDZvMYeFo82jU/8KilxDg5EhuxSrevRXVe
	5QEFacmuCzXOe6yX9jFGC9r1YL5Be2qBNFc+tkZA4JJAr0oymKTy1f8misY7fAToXJUlIajbu4W
	uM0SP+qCEkIkSx8omQ2wuDVAk7Fn3pQBqm6rl+URE9n4kO6Nyiu7WsqF4Aal328HuT/+GdU+QkE
	i1Teh2c04aUmvNPRh9/cFyaSdUXyHXHXFJwntJnSCEpsaInPpYTMBYapcKrdDYaXmQOPVXCdsKQ
	PCKNaRsSSh7lgRTB0e/P
X-Google-Smtp-Source: AGHT+IFF4yBb+hCS7ZBQCfCT1ORUYw/Gj0CKaqbDjWG3VtyoJXnhpEJioVXA7e3Pa/pLe1dzFKh+kA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fa72:be47 with SMTP id 6a1803df08f44-6e900604eaamr17244676d6.8.1741310215325;
        Thu, 06 Mar 2025 17:16:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f71724d4sm13217566d6.112.2025.03.06.17.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:16:41 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v7 0/4] riscv: sophgo: Add ethernet support for SG2044
Date: Fri,  7 Mar 2025 09:16:13 +0800
Message-ID: <20250307011623.440792-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171656_757111_31DA01EB 
X-CRM114-Status: GOOD (  13.34  )
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

Changed from v6:
- https://lore.kernel.org/netdev/20250305063920.803601-1-inochiama@gmail.com/
1. rebase against latest net-next/main

Changed from v5:
- https://lore.kernel.org/netdev/20250216123953.1252523-1-inochiama@gmail.com/
1. apply Andrew's tag for patch 2,3
3. patch 1: add dma-noncoherent property.
2. patch 2,3: separate original patch into 2 part
4. patch 4: adopt new stmmac_set_clk_tx_rate helper function

Changed from v4:
- https://lore.kernel.org/netdev/20250209013054.816580-1-inochiama@gmail.com/
1. apply Romain's tag
2. patch 3: use device variable to replace &pdev->dev.
3. patch 3: remove unused include.
4. patch 3: make error message more useful.

Changed from v3:
- https://lore.kernel.org/netdev/20241223005843.483805-1-inochiama@gmail.com/
1. rebase for 6.14.rc1
2. remove the dependency requirement as it was already merged
   into master.

Changed from RFC:
- https://lore.kernel.org/netdev/20241101014327.513732-1-inochiama@gmail.com/
1. patch 1: apply Krzysztof' tag

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

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Group GMAC4 compatible check
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  75 +++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  17 ++-
 6 files changed, 229 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.48.1


