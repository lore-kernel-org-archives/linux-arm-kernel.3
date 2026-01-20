Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17E5D262A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=; b=I7+Cwzcf1PYu9r1Wbv27JkOaEQ
	ckzFAgpOJACaUjWrw+soZXtgOlN3fobtIeMLQuALTFl1QiFMTriZ8B94Gw/oO25VyGisBMP32CIe7
	iq91+zUCN4H4U+BvVJiQyqEX97BXF+O4uJm2fVdZXvOJAX58gmYBuyM6gOOf+4Mrp3+sm0udGFngN
	/+G49SB7ix/d6YSD88F4td8MbkwG7hhd0C6EkOXmCgRFXjY7Z0no32zUsLzMfz2E5SIsApA1cdvhG
	Akpoa4ABWvlTs66CNbnyORMuDf1VL/X+dd/K0mud0wxJvB+Tu2k+c51Y4vWn/JWEi5mskhP6jllBQ
	bXLmGvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVM-00000004Rjv-2MFE;
	Tue, 20 Jan 2026 20:39:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIVJ-00000004Rip-0lKZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:39:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so53563595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 12:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941547; x=1769546347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
        b=luHwidJWy9orsiUW1ClUHM0j3GJvh/Ju+gSABA9CRKp4r/bWUo9aP/DGXQpAg02+O9
         Un11qHbFDw/e7obcn1R0ZIWNRPPPCqKZIZMilv3LPsRxgcFHjBJFqZ6Drq9sOglPYu/h
         LuYbN8b5O3oZu4gWwZeHd6KpgJCu7orU0dwcEOFY1/lmL61jGKzVXYpGkqmdMTAI7h+F
         bVII2q6qW9SkSlj2XC4FI6gxx1zb+KqU17cUG3XAKAO1nlNsBUcoSgOqqnd3xGQONAGX
         6+aUEuWWuKoNppLnyvFUpfqOKplh0d6RcSyk4eH+SFHcr9ewHVoP4hQE47f8Br5HWEmf
         WzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941547; x=1769546347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
        b=CeVulAA89Jqg7UmQiu7OCaKDF25JRNqNkh+fAx4XuVAEzXrlEZlslfbG7+ZWxOYWr1
         NQqmZgIi21ISMeV6qp79zZK8CRunkYM1yA2Tby3tZEWjA3PSP6DIQNTY8tRnM0xNAaCl
         zs/4LdtdYMJVkGqWNz+OBAnnizOeHc4Y6DW2F1Vf85prsrGnPtV5PxESS2A+FADW4tGd
         dTmRbQwDBhv5uGmj7+/dsEwEy5HAKsfFoophvGqangnHdYeEXyufv0OHYIx71z7ThE+A
         ScsaVIL7Kvbkzw/Xt2Bor4EXn2We4Sq5FGRK0FauTuAM7SiokJjIB56q3Bvx3rdhVEjP
         6uSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkJDgF/m6G+J4tyKJVRCGyjCOsxwBjFYiCDSkoYMRSnmyGPqeSa0seUbx9f9PemdWWnZPYv0m1kqRgGfRnGLQi@lists.infradead.org
X-Gm-Message-State: AOJu0YziCRlCrc6AJp+IsVuwlw5W5t4TqucuigKWXcxQpfa5hq5KVUBS
	A4RqG6SOOHA1FBtiUt9VEa+GDnuC8XT4WeOQrvdJxbQ4OhUa+zzDPY/W
X-Gm-Gg: AY/fxX4GJEslmiFoBXB3XodHntwBGsyy12ucmvm49PtFlID2gdXum39a50dGUGIr62l
	ZWREgH/YL+YnLqMFDSp/dC5UL0Kvt9Dbay1/o6TTQctOkZlOlkh8lFHbSOxzmhSHd8o98Gr2FXn
	2B3uFnvZpnYJxph5lTour9L2oz7OVF3mQ4irx5Naet9QYqD0INMpa/VEhOgMgs14a2SZBiZ1DoF
	bISAus18ns2Uqr/ZuQMeKjTNukfBKD2NXa1wvWrGSEHEVE2SZAZHr6ngGKByaaxtGU8xdZ33gYU
	yJvXj+UEqJvwecW7fQlJSkp5oCsRCQdYLSokZlp2n3cTfdDSq6OsIMwPi17fp3XQponSMuKATTm
	1yH6RjkMgAYFKnMD2iq3Dc3ApT1HfVeA4vdYH4evRGYv74rSxk7kQiP4HGdWTrah23iySIZUca5
	FnrL6UeMg/gyiZJabH
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48020f17c12mr160684545e9.31.1768941546639;
        Tue, 20 Jan 2026 12:39:06 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:06 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net: stmmac: dwmac: enforce preamble before SFD for i.MX8MP
Date: Tue, 20 Jan 2026 21:30:01 +0100
Message-ID: <20260120203905.23805-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123909_235930_D9832D1C 
X-CRM114-Status: GOOD (  14.47  )
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

This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
that allows a MAC driver to request to keep the preamble bytes before
the start frame delimiter (SFD) when receiving frames from the PHY.

This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
(ERR050694), which causes it to drop frames without a preamble.

The Micrel KSZ9131 PHY supports keeping the preamble before SFD by
setting an undocumented flag, that was confirmed by NXP and Micrel. This
new feature has been added to the Micrel PHY driver for the KSZ9131 PHY.

Changes since v2:
- Instead of using phy_register_fixup add a new phy_device::dev_flags
  flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD so that a MAC can request to keep
  the preamble before SFD if needed (Russell)
- Link to v2: https://lore.kernel.org/all/20260105100245.19317-1-eichest@gmail.com/

Changes since v1:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

Stefan Eichenberger (3):
  net: phy: add a new phy_device flag to keep preamble before sfd
  net: phy: micrel: add option to keep the preamble before sfd for
    KSZ9131
  net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
 drivers/net/phy/micrel.c                          | 14 +++++++++++++-
 include/linux/phy.h                               |  5 +++--
 include/linux/stmmac.h                            |  1 +
 5 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.51.0


