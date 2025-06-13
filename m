Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA5C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 22:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTOEPKoKv4ajHTNSTP84Hrxgzt+IR4WbeVWxtPlJWow=; b=oUAXMp5mScsIcLFNcWBgCQAnZV
	sq3n9gl4SX1K91aoE/G4PNSkvHERCmEXlm/VNUvdMxiszp5MGXXthIkhYBmiOMOeKW7bM60mOVtir
	mn/YvUt52UcSVZ56ATpbY9JoE9r7ghvtbuyGZ8bjtEqLhObfSqmcEdYzQrsK0/c+0o+4LDW2GbZh0
	b2VWsyrG+CArtmzPeDDpf4yMrNs1E00OR3kRTzVTcSq/Hw+7r+XnKiqQzEivLwETjeE3la1xGFpOz
	OI/JD72tord3XY+JA4Y4w39E/jhnbRWahQjdXrm/vNAmifiCnZG/mEgz1lnHSsrbCd+lXzMOPbSRf
	TRNZEGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCeH-00000000DHc-49Kl;
	Fri, 13 Jun 2025 22:13:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCZx-00000000Co7-2Mtj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 22:08:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235a3dd4f0dso18004665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749852533; x=1750457333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTOEPKoKv4ajHTNSTP84Hrxgzt+IR4WbeVWxtPlJWow=;
        b=WnXKJUl81YzYtcbdPkf03VDZwQXeEG1mCqCuOabXAjnGt2fj9tryQFnyo4Kj8aFDRy
         HjorAf1HsqGRbM9NvCGgMcX03IUiBlsmSH14AjGALl+jQ0WIag/GiieKh4nSKZGxX4fh
         Im0Sh7+ETI3BTlNWPQiGe8k6cc8GE4uBUzjyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749852533; x=1750457333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTOEPKoKv4ajHTNSTP84Hrxgzt+IR4WbeVWxtPlJWow=;
        b=viILMAVE+YolXFECVC/UpdKDCkUS6g7Dw4TY8G8DzSrxSA6y3W5nQV1rlwoEBUwnl8
         tRT4c+ouhJj48ca7y46w9FyXH0qlNWZBs6YpZ0QKkYlOnZejFxcKFRRCXigPZkuMcTx2
         IgbHvzWGW90JCe/m5kFE5dKlAs8VChfAJgbqrbonX/8lTHfufKaY9v3V4RZzcdJcuAhL
         ixOlhGWx9KjJvMRrOPNdT0c/6BxKrLEdbHM1HiHVljl62lSaIWnLQxtNms1FFwxo/k2k
         v7Z03bK4Dc1VIhp1tnrDehZ+zigfPDuthlU1sXS3ao9clZVPnqpZhckh/0ZugrEHmLes
         9DMg==
X-Forwarded-Encrypted: i=1; AJvYcCVLJ1FVYdRfG5qLO6Hk6dXtgChh2RgW3pgkVbck376P2G6cRvXb3cX78T7PtGC9rZXmpPQUfb1KBEdoP4GqrFAs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywra5rztDtt8OWtAHFNGR4bzLEliqSsSvh+a99fb9TIq2MlVbik
	Ip5GNvrtCuu2D1O2Kiwh0oGV1LUfSf9QJ1ssrbFmHzWMgnCVvV3tmmQ2mYYodBHoxw==
X-Gm-Gg: ASbGncsfsRTtXeBn0FaD+9xYJT+wkeBsy2hY3C7F/JUuplY2iY9w0cL2WPTDTKqHdON
	AkvMESpO9xJWIgL38XcZj4gtvPFryRakU7q5Z+nXsoWXPeJ5HAODCCA8ySrSA25a8XLKTH3Xqlj
	6+C7jhf5LFU5pnRyBbjNxI7lGrdTuKkdefQKaM7YWR2XLDqFMNj85G+qvtTskOg6rV97mhlVVX9
	ZlnA8shXRlBqW4hyo8dlhz4ut2aodWcMO7cuxXuE+sD88DIe9EUH91LtkhRSQDeU/t021AAKfNT
	VjF3AMbpTmW7yGXWEY7YE9BVeqoC1B0rsZWoV4pdv+JRgXiPVUJH4cGwBMcKiJkHQlUKBKMHt6g
	N/iTrTJkvJQlBz5SoqmDJFA7NUN2xw+EIbHdnqbddAA==
X-Google-Smtp-Source: AGHT+IG1F1gAsXiF14k7CbCxmhGYBAPiFDXrNRzZMFVz3m3N5XXoe66Nkc5F+9nou5STw5a0DP1o4Q==
X-Received: by 2002:a17:902:d54a:b0:235:eb8d:7fff with SMTP id d9443c01a7336-2366b1224d8mr18110485ad.28.1749852532769;
        Fri, 13 Jun 2025 15:08:52 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d74sm19593105ad.152.2025.06.13.15.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 15:08:52 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is active
Date: Fri, 13 Jun 2025 18:08:42 -0400
Message-Id: <20250613220843.698227-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613220843.698227-1-james.quinlan@broadcom.com>
References: <20250613220843.698227-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_150853_603162_BDDA2082 
X-CRM114-Status: GOOD (  22.50  )
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

In a future commit, a new handler will be introduced that in part does
reads and writes to some of the PCIe registers.  When this handler is
invoked, it is paramount that it does not do these register accesses when
the PCIe bridge is inactive, as this will cause CPU abort errors.

To solve this we keep a spinlock that guards a variable which indicates
whether the bridge is on or off.  When the bridge is on, access of the PCIe
HW registers may proceed.

Since there are multiple ways to reset the bridge, we introduce a general
function to obtain the spinlock, call the specific function that is used
for the specific SoC, sets the bridge active indicator variable, and
releases the spinlock.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 40 +++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 92887b394eb4..400854c893d8 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -29,6 +29,7 @@
 #include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -254,6 +255,7 @@ struct pcie_cfg_data {
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
+	bool has_err_report;
 };
 
 struct subdev_regulators {
@@ -299,6 +301,8 @@ struct brcm_pcie {
 	struct subdev_regulators *sr;
 	bool			ep_wakeup_capable;
 	const struct pcie_cfg_data	*cfg;
+	bool			bridge_on;
+	spinlock_t		bridge_lock;
 };
 
 static inline bool is_bmips(const struct brcm_pcie *pcie)
@@ -306,6 +310,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
 	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
 }
 
+static inline int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
+{
+	unsigned long flags;
+	int ret;
+
+	if (pcie->cfg->has_err_report)
+		spin_lock_irqsave(&pcie->bridge_lock, flags);
+
+	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
+	if (ret)
+		pcie->bridge_on = !val;
+
+	if (pcie->cfg->has_err_report)
+		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
+
+	return ret;
+}
+
 /*
  * This is to convert the size of the inbound "BAR" region to the
  * non-linear values of PCIE_X_MISC_RC_BAR[123]_CONFIG_LO.SIZE
@@ -1078,7 +1100,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	int memc, ret;
 
 	/* Reset the bridge */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 	if (ret)
 		return ret;
 
@@ -1094,7 +1116,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	usleep_range(100, 200);
 
 	/* Take the bridge out of reset */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
 	if (ret)
 		return ret;
 
@@ -1545,7 +1567,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 
 	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
 		/* Shutdown PCIe bridge */
-		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
 	return ret;
 }
@@ -1633,7 +1655,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
 		goto err_reset;
 
 	/* Take bridge out of reset so we can access the SERDES reg */
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		goto err_reset;
 
 	/* SERDES_IDDQ = 0 */
 	tmp = readl(base + HARD_DEBUG(pcie));
@@ -1901,7 +1925,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
 
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not un-reset the bridge\n");
 
 	if (pcie->swinit_reset) {
 		ret = reset_control_assert(pcie->swinit_reset);
@@ -1976,6 +2003,9 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (pcie->cfg->has_err_report)
+		spin_lock_init(&pcie->bridge_lock);
+
 	return 0;
 
 fail:
-- 
2.34.1


