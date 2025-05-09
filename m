Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=; b=KCmoKqO+v5i+Yjnf6rs7kQ0NpR
	6tf72Mb6frcEDZAX3sU+m2+4yJSrioCl9LPQ7mSCDOqYB2hBCtAKHNpHxxw1mw8DlQFpdeSBeyKU0
	o6WMB7pR5DMiH6D4Bwu1andq3xmfzCv+5Wwl3LMS3uFkC7i1EJDbI47jKpAncA1dUPl1kxMxkUY7A
	0nSS9shIZg1Ee7vo3z1iHWJAop1rdyYXtAWIm08h3HFs5bpz6ZUFdv+giRZA4msG6pOm0coTGhNHC
	NdWj20k7p4PIbwP7EoDgk4lXddL1ABP7aFWOcU7bE9mFlT1g3+Etj/KzLL4ZvrsYA7SKPwSI33KTR
	TXFKei9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWJF-000000054oi-0VSJ;
	Fri, 09 May 2025 22:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWDG-000000054M9-2CKj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 22:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=; b=VxO+/qeRzO+kPQeTwrSNIP8+EL
	s5+j2Uc09olHisGgHCjp1BehcjpPdATr2J0sfHsIVTAh7MoZwLlIh7YQySA/nZbgRtPGwH7Ks72Ll
	/FOQN4Ds8WZZexDQrAIu3l9b1HML/MS+LR99sqWcGG1iWsYPu/xes6Gez9Yg6Nf3nYfikkSWrdML2
	O+atMOdMNpOLMA5LbBF9h8eHr7A/nCaoyQ3x8hzGJPW8rI4k9v4X0Bx7MCHb9q8h8CRbdv03DzMPX
	NQ375CJOsfcHmhQMK/SwIjVu0XdWA2k2RUOl++XHDpC3VXmnlzBfNbzmRYytU//5lh8BOMNt9mufV
	4AssBzBg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDWD2-0000000GN4z-06rF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 22:28:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e45088d6eso35234505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746829712; x=1747434512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=;
        b=Hs3Qx++NnTdlt5NiuinI1dEiPv/DKSVB2SV9QgxJ+wi7TTjJKDKPZk7/yghZXeoroC
         70sNBY80S0P5Ge1LnP9YUjW+YCus8Fr6F4lLGmY497q3VqZaW7fUn0i+Ju1BbD0T44U2
         q9xkWGjfF/4SXl1C0p0wImmLMODCIzqhgyAZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829712; x=1747434512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r01UKsFQHMizWN+7NERjXgKGoiCMs947wub+Eu3dEZg=;
        b=Ri517rjT4NbOARLLVF8e2Rx5xtwIeY/U3aSOc5p/dTatHy0f7GADkRfQQq4s/Tudfz
         6S46VPb4dDNGQ9yLidLQmltwMy29GHEyWDwtUM7fZER65N4ipO9CZ1CPpSl/VhRNVPrq
         NYQqcC14P7tSZKi1PPqZ/IQjy+UuPJXJWhPdQb57L51siO+2An05jqhJ4f4FOTVEhB2D
         42zXa8Z3vnSzOS6ViigN2Kh6L3+HofF++mfj8FChs/AftmrjnrhIPQ0VVWTgNcLTxGeO
         kNRpgMRP9BvY5taNFsa44jGMwMr62sXKk9+McCj3LAnfgBZHIDtwT2kY5LfMvb4TIxdr
         V//w==
X-Forwarded-Encrypted: i=1; AJvYcCURGNtuHw/nn6sizGCcrcDvjyTHvHpo8EFLnS7Bcdg7HpMMKocw7BuBdpmQ0Dd83+WjwO/nn/qjoE9O/mAHmwIB@lists.infradead.org
X-Gm-Message-State: AOJu0YwHqLvdcuG0VOGhy08CWRqqzyvbMbNWF+NFP482gvw0fuo/AS7i
	2/ia0TLGoe+wm83wN9U7Ra9E7RTZYM1VpZF6O02bINSI45NxprpSkMXgY79U3w==
X-Gm-Gg: ASbGnctqQqPZHj5SooHMsAkwm5dl9JySS/1LekVHP+AEDN6igSEimF85t5s5NTtv3uA
	Yvmz0TI2IyRosqQZvAeqABjhPUZGHiw8el648OMtAMrY2r5hMqb0V4ry2em2yXdWlH4/sLsVjl6
	8CIiMTAIl+paw09Avw2flMC3AbGBDeeHEfXBL32bm7seAtGQ05tHyQIJvf67o4/1MjJOoxWk8hW
	WxHKVwIudLrBoo7Coy/jj062A2TULlNdU5pxsP5d2InS7alNuzQlnlrZUiGbgT4kWv2y77wSY63
	kLfIsb3yT7GSw6430M98SltdYkSsgSmFR6RWw9xtIwQIagfqH3f3p7lt2Vh2QXYD9sm3B3zyXCn
	gun1ZmReyPXX1UwfWSVVR04iVwc4oU57kk8MdYgrmHg==
X-Google-Smtp-Source: AGHT+IFuDBZRbVYjG0G4X/dCVr4J6+/l3hVYk/ScgrrBw/Yp2Kx+9CCGefV6GRrHSuO5N3jNQSf5cA==
X-Received: by 2002:a17:903:986:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22fc8e995b4mr83439675ad.38.1746829711780;
        Fri, 09 May 2025 15:28:31 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544fadsm22584465ad.24.2025.05.09.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:28:31 -0700 (PDT)
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
Date: Fri,  9 May 2025 18:28:13 -0400
Message-ID: <20250509222815.7082-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509222815.7082-1-james.quinlan@broadcom.com>
References: <20250509222815.7082-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_232848_155540_7E53CDA8 
X-CRM114-Status: GOOD (  14.29  )
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
index e19628e13898..76fd4f515898 100644
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
+	    num_lanes && num_lanes_cap != num_lanes) {
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


