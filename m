Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0ECC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meW30IDDO+azkqeYGaD+b0CQRVW934zmu7s9bUahNtU=; b=G8HdBcsCZUcz/qmihjLD2bVYb4
	Tdj6m7Mb4NDTFr8+LEYcwlZn5bHEEbtzc4gY354FOCJlbKVORuBtpbpWAOKIiFrY/HoIhEKWsLCAh
	Y7yFXX/HKXP9YzCn8K7Tta2BSgf0oWauJc3MVWBsHiiVgyy+lPlzURA//EySEQ/mGCVbpPa0lfBNk
	f5HXMfmTuzvPz7T2KRjrDojrlyb7AU4okKzYwcOSIK+yzheYdQ0GoOM8ibXvMF+rH3CtiHSf23Zgc
	Ob8uIW2/ZV5rG/PIboAiuj2z5B2ovlAAmAeC4GcgbHepIql/cGEVmCFtJlUvfOynq6IOScH1OpOJC
	F1A3807Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8TX-000000027LK-3aOO;
	Fri, 30 May 2025 22:45:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8PB-000000026Cl-0FtG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:40:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23539a1a421so8269075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644848; x=1749249648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meW30IDDO+azkqeYGaD+b0CQRVW934zmu7s9bUahNtU=;
        b=gha1uOGunv5UpA1ShvEHyzugdkWwm1WE8NMuVwXVjpM7qvy93yHt3wn7flM5XFnZVK
         L0fTUGFmy7DiYI6iBGxgeSwOkz+A3hphxNXgYADoHaJe01sQKw4uLUTYT9Twm61i/6nl
         YI0SrjnWPvA8p1LbTaakwSJZ4clmvWuPlgYBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644848; x=1749249648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meW30IDDO+azkqeYGaD+b0CQRVW934zmu7s9bUahNtU=;
        b=fNp/GcDmJY5kEDQ4RZ+QRmbytn+TwkW2g+KMdcpMfiFrrlVfPMlrRx8laQbsB6efTt
         /WJbJegAT+3AuwxZw0klsLm/tb7axbwVkRp6MeQNkIhUwngyCQGwX9biYS1SbvQvUdZk
         3Cq+rnxOU3eUxUzVawhtXvblloGPeY+F7VKuOtWiREdFcOBOT3rYbG2W1SKTqenxpqsU
         RbgwqCcudvAnZAV8ctdTdLz4hVQP0GTE+IRcgxA8Bjm3UCkGQooCxm+m8PRN5Yz3wUWj
         PxmpMVzbZABYjgHdnqGBtINiG47cKUhVH79ETEliEOaAuLVSjtdjkT3udnn+XjF1YVG9
         jd4w==
X-Forwarded-Encrypted: i=1; AJvYcCVgOn3JkeVL8tLGgvrnZNVZ5o1HhkRKKanDwRuhStlGVOEyBIeYUBUGmoJHpxXrcDX+w/0eANhK+M9nbko7IlLv@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCLKV+sscKZd3Apfvu8vVglGqkpK4MdaA2hay2O4etOmpne2u
	Ry4iHvWZ6W6b5rnyz0GSRLSZer+fCNQPdWsveSzAUP19WHzh7SpMu08AxQhUHTYLvg==
X-Gm-Gg: ASbGncsiNOMt7YyLRnnAzM2WJLLo9KFWdCEIg+cwWUxNLHgTQXBZMNL7YGZEZQGVz1K
	zZpS9w1lBCvFWTElkFY9ORsJVSpKPFFTXws2J2W79xWUfa7LCkq64DehMizbYPNxQFv7jrlPbOA
	3k1doHdvIkpOkVA/viKrkvxphaUy3wy0fq8hT4pIOvJCGzyYf9IFIu+7HmlCXMeooZnG7zxaLAb
	uMnVUHH9zjoTK+CF3rKAqOUVTG6594V9jXZiEJAMQbNrkeg4OBd8ZjPwpm9pjo5tSvh6BjD2+1H
	A1ze0iUX3YOFyWltsWvaDoQAvRFTL4G8v9b4J3RUgDwLzaxA5GAlJpq/YsMESOj3tDzIlVLgx68
	HAY6ael060B8wkrVYxc3ChVRACNZJtALulao5VJ+xHA==
X-Google-Smtp-Source: AGHT+IGL4F0Y7fvmsQ/3UEqROCzrPd3eOAG4Vh0WKC1WvYBSk1U1yO1TsWce/E4di6e9o+pfZ3ki5g==
X-Received: by 2002:a17:902:d4c1:b0:234:8eeb:d82d with SMTP id d9443c01a7336-23528de8f60mr78383255ad.19.1748644848195;
        Fri, 30 May 2025 15:40:48 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:47 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
Date: Fri, 30 May 2025 18:40:33 -0400
Message-ID: <20250530224035.41886-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530224035.41886-1-james.quinlan@broadcom.com>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_154049_105527_3CBB590D 
X-CRM114-Status: GOOD (  14.23  )
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

By default, we use automatic HW negotiation to ascertain the number of
lanes of the PCIe connection.  If the "num-lanes" DT property is present,
assume that the chip's built-in capability information is incorrect or
undesired, and use the specified value instead.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e19628e13898..79fc6d00b7bc 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -46,6 +46,7 @@
 #define  PCIE_RC_CFG_PRIV1_ID_VAL3_CLASS_CODE_MASK	0xffffff
 
 #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
+#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
 #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
 
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
@@ -55,6 +56,9 @@
 #define PCIE_RC_DL_MDIO_WR_DATA				0x1104
 #define PCIE_RC_DL_MDIO_RD_DATA				0x1108
 
+#define PCIE_RC_PL_REG_PHY_CTL_1			0x1804
+#define  PCIE_RC_PL_REG_PHY_CTL_1_REG_P2_POWERDOWN_ENA_NOSYNC_MASK	0x8
+
 #define PCIE_RC_PL_PHY_CTL_15				0x184c
 #define  PCIE_RC_PL_PHY_CTL_15_DIS_PLL_PD_MASK		0x400000
 #define  PCIE_RC_PL_PHY_CTL_15_PM_CLK_PERIOD_MASK	0xff
@@ -1072,7 +1076,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	void __iomem *base = pcie->base;
 	struct pci_host_bridge *bridge;
 	struct resource_entry *entry;
-	u32 tmp, burst, aspm_support;
+	u32 tmp, burst, aspm_support, num_lanes, num_lanes_cap;
 	u8 num_out_wins = 0;
 	int num_inbound_wins = 0;
 	int memc, ret;
@@ -1180,6 +1184,26 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
 	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
+	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */
+	num_lanes_cap = u32_get_bits(tmp, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK);
+	num_lanes = 0;
+	/*
+	 * Use automatic num-lanes HW negotiation by default.  If the
+	 * "num-lanes" DT property is present, assume that the chip's
+	 * built-in link width capability information is
+	 * incorrect/undesired and use the specified value instead.
+	 */
+	if (!of_property_read_u32(pcie->np, "num-lanes", &num_lanes) &&
+	    num_lanes && num_lanes <= 4 && num_lanes_cap != num_lanes) {
+		u32p_replace_bits(&tmp, num_lanes,
+			PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK);
+		writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
+		tmp = readl(base + PCIE_RC_PL_REG_PHY_CTL_1);
+		u32p_replace_bits(&tmp, 1,
+			PCIE_RC_PL_REG_PHY_CTL_1_REG_P2_POWERDOWN_ENA_NOSYNC_MASK);
+		writel(tmp, base + PCIE_RC_PL_REG_PHY_CTL_1);
+	}
+
 	/*
 	 * For config space accesses on the RC, show the right class for
 	 * a PCIe-PCIe bridge (the default setting is to be EP mode).
-- 
2.43.0


