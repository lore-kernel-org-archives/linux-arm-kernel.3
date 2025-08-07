Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D733AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7aXLLLTdaewYlSZFKdW1YKq/QeHggS65uLCSdSCq1A=; b=o5boUKcw2lMtAgtw/M9pqCbMlN
	mEkA+fT4HKJ+KH7w3RUQ3nCTmDhA5Qr273zGFgxilolsJGNhZTtM1jyGLa8giVHhbcpqhghcdZ+Sl
	CEmYnIGmrWs9WG3MFuhox8kRZ6L20V4/9IIoxYVFE1lP+AfTM3Xa5uU7iLpcDh7DOfb4rFtpQt1D9
	ey3tdnhSUamKR0DJarzBL7UgHD1NJ6hXLMQ/n4OTjJZ+6n3AD4+ghBERWCA0+UmK3N7GIIpjImZ8R
	7CP/WIWZDVCNG++JF56Zzz5tVUkx07EKg8sN8KKEKArVFGiLkUFncge/vcL1dhUvzzF1g4UscfQYm
	4TxJzrLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8xn-00000001cRK-2kKI;
	Thu, 07 Aug 2025 22:19:55 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8tM-00000001c49-0T2d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 22:15:22 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4b08c56d838so19480551cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1754604918; x=1755209718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7aXLLLTdaewYlSZFKdW1YKq/QeHggS65uLCSdSCq1A=;
        b=DlPyWOm10O6UH2hMKAhWXbG9b197MdR3H/PfXroRznmWFdIGqLlimKVzBPPdpYKCJp
         aZeYjML7tkf9xrO/932uLBWBttg/mjsIQBOGk5IOamowXtAc8ZLdWqcGi/eY94o/ywzS
         sMB0ZZTCQTwCCPFM0/1AtWtlOD8MSxOj/aqps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754604918; x=1755209718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7aXLLLTdaewYlSZFKdW1YKq/QeHggS65uLCSdSCq1A=;
        b=IpWvgdMZ8aMZgJtXiLYu1vPbztV3dziQPlXVninXKmbstNxjqYfL1N/6nKumjGxWDI
         1P54bYiER8mZHHr/3KhUu2HijItHWA5fnPgY/+pvfCkize7PFMnh9LFf3EJjDJ8X3AS5
         lECvNHYJFl1X1g9h/ywlsXlkRlSgYw5CJXYoHa0Ze5IHEU653HOHTYvfYsdFUHXRocDV
         eUQYe/WXQxpMpwM+L2WhpSIUXEMwK6YTr038fvMR6K9e1jXeCShiBw4spVCC15jUwsm+
         xXpPxXasZtUws9gPbNAyifw/MxVKgGZUCrhpkaLINtIrOMIl/NEpcI6TFaxZFF6579ou
         lk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFLWFMNmKJ0Iw/Hmk4mON5MLa0ql0WxdU5riAIXi9cik6+GZMyo9RpXR5DA+dn4z122G2zaZm3aOAAU4cqVzXq@lists.infradead.org
X-Gm-Message-State: AOJu0YyZHH7Wlqdr4T0oaro14wRR6tOH9f0VqKu32ykq9w4tAWA2tQ1z
	Uy/L17UN4LtaLYwsMjIu1XpTdZAosywjBnPtPvE2qUka7LgxPjXHWtUFasEhHookdsKwlHUp0iq
	0toM=
X-Gm-Gg: ASbGncvPFlGaxntpSrB05aPLvTceNdEkt/FxhPFQD8TGqznawpIYTFXDHnxgQS9OtYP
	m/AeB5M3calpy6bRASGwDDZL8B31uQ6Kv0Y+jNgRJk/fnaz7IUTQHg68K4D3L3E/JUpYMucFxrG
	5US749UykoAVLftTguQE9Tq2n5UsZHhxi9qPQg2m6lBswFv4c60gTl9oWJPhpKoewBIsxSzAh/x
	TJMTgC8/DoCUFXPOywlADeKiF1iRubrJahqE/KGC4EawhTBAOq1QFXyYZ281dI8XSbS1RE70P0G
	9RPPDRSfRX6CzJKReshnIh+DBFlZoO7aBzdBCP4knA82mcyW3/p88QZ729J8HTe9pDkGt5I2ygh
	aEJr3DJDdNu9AOrPbefwrc10dWkAGueB1NnrcZaRwLNC63sg2i+RYH1YkXMmVwISnsMf/64W+hJ
	9dH+9ANn517ILt
X-Google-Smtp-Source: AGHT+IFECAtHrfofLNszmttHHQwFVkK40S3ZHWrqpD2n3W0M30Gfsipiqbx2ZOcLlQJ+kKSkdKgcYg==
X-Received: by 2002:a05:622a:1a8a:b0:4a7:81f6:331e with SMTP id d75a77b69052e-4b0afd8200bmr6892381cf.6.1754604918375;
        Thu, 07 Aug 2025 15:15:18 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm9527421cf.8.2025.08.07.15.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 15:15:17 -0700 (PDT)
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
Subject: [PATCH v2 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is active
Date: Thu,  7 Aug 2025 18:15:12 -0400
Message-Id: <20250807221513.1439407-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807221513.1439407-1-james.quinlan@broadcom.com>
References: <20250807221513.1439407-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_151520_200710_1DE505BD 
X-CRM114-Status: GOOD (  24.64  )
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
 drivers/pci/controller/pcie-brcmstb.c | 51 +++++++++++++++++++++------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 9afbd02ded35..ceb431a252b7 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -259,6 +260,7 @@ struct pcie_cfg_data {
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
+	bool has_err_report;
 };
 
 struct subdev_regulators {
@@ -303,6 +305,8 @@ struct brcm_pcie {
 	struct subdev_regulators *sr;
 	bool			ep_wakeup_capable;
 	const struct pcie_cfg_data	*cfg;
+	bool			bridge_on;
+	spinlock_t		bridge_lock;
 };
 
 static inline bool is_bmips(const struct brcm_pcie *pcie)
@@ -310,6 +314,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
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
+	/* If we fail, assume the bridge is in reset (off) */
+	pcie->bridge_on = ret ? false : !val;
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
@@ -756,9 +778,8 @@ static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
 
 static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
 {
-	u32 tmp, mask = RGR1_SW_INIT_1_INIT_GENERIC_MASK;
-	u32 shift = RGR1_SW_INIT_1_INIT_GENERIC_SHIFT;
-	int ret = 0;
+	u32 tmp;
+	int ret;
 
 	if (pcie->bridge_reset) {
 		if (val)
@@ -774,10 +795,10 @@ static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
 	}
 
 	tmp = readl(pcie->base + PCIE_RGR1_SW_INIT_1(pcie));
-	tmp = (tmp & ~mask) | ((val << shift) & mask);
+	u32p_replace_bits(&tmp, val, RGR1_SW_INIT_1_INIT_GENERIC_MASK);
 	writel(tmp, pcie->base + PCIE_RGR1_SW_INIT_1(pcie));
 
-	return ret;
+	return 0;
 }
 
 static int brcm_pcie_bridge_sw_init_set_7278(struct brcm_pcie *pcie, u32 val)
@@ -1081,7 +1102,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	int memc, ret;
 
 	/* Reset the bridge */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 	if (ret)
 		return ret;
 
@@ -1097,7 +1118,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	usleep_range(100, 200);
 
 	/* Take the bridge out of reset */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
 	if (ret)
 		return ret;
 
@@ -1565,7 +1586,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 
 	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
 		/* Shutdown PCIe bridge */
-		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
 	return ret;
 }
@@ -1653,7 +1674,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
 		goto err_reset;
 
 	/* Take bridge out of reset so we can access the SERDES reg */
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		goto err_reset;
 
 	/* SERDES_IDDQ = 0 */
 	tmp = readl(base + HARD_DEBUG(pcie));
@@ -1921,7 +1944,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
 
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not un-reset the bridge\n");
 
 	if (pcie->swinit_reset) {
 		ret = reset_control_assert(pcie->swinit_reset);
@@ -1938,7 +1964,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		if (ret) {
 			clk_disable_unprepare(pcie->clk);
 			return dev_err_probe(&pdev->dev, ret,
-					     "could not de-assert reset 'swinit'\n");
+					     "could not deassert bridge reset\n");
 		}
 	}
 
@@ -1996,6 +2022,9 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (pcie->cfg->has_err_report)
+		spin_lock_init(&pcie->bridge_lock);
+
 	return 0;
 
 fail:
-- 
2.34.1


