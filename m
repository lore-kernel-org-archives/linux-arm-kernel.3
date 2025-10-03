Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AC6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=; b=RuYyOET8UHjOF29wCHITbpljuz
	LHdZ3q+7yA4GH3baWTtbZ9LN6Cq30jjkg7/ZM3iUoVh0MsruGH+s5zo2A8fWmXx5chFPYMD4fwmxr
	lvfeik9xP0B8Z45vIUkLDcJLxAKGn6oRAXWJgd0TRnio6CBtZolsuXW5Q9yzhFAa/Yuk80g7cRvNG
	EY1Xl/uL9VJuHaV5PO6b9Izj0Sit1yx4of1ZowHDarGd4AE4ti9DApSge18CNg/EdmMuPQN5A0m6g
	iBeO4Izz9dfdST/v5yaFDXNhSqqSu8iJc7YNWDxNfImQcj9ZYbIEA7kslpq+50jBhKBo/LlZKqrM0
	X159cXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4lt7-0000000D1dx-04Uw;
	Fri, 03 Oct 2025 19:56:21 +0000
Received: from mail-oa1-x64.google.com ([2001:4860:4864:20::64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4lt3-0000000D1dH-4228
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 19:56:19 +0000
Received: by mail-oa1-x64.google.com with SMTP id 586e51a60fabf-35bdcaf79e7so1813380fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 12:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759521377; x=1760126177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=;
        b=Ob8wePuWGZtcIorM1Y1NSeGrSV6sbyJv1prZfqIAP/FIIU02UszwJnuQY4Y0af5Hsi
         6pJmaUGwqJyl7XfO0HVXizRGOFCZyFNBpkSS/TRDffJlair0pcPK2eL1fw0UPtRA1HbS
         C0J53T2U0Gg+GesWsSuE0CI5NmNofJxlz4uoDbWDGoTmBAKuE2ukmnSCdMhZQB8M+vyN
         TgpZ1ZkT8ggJoy4u7iBHv8AUbxYHjyU74/5J4xeVvKDGlHeO9plvtoQg/7IVqFruQe9f
         OmpXCJyBOE4Wk3g+orfbPs88g3Yy/ghGefBwkwoUJ1Z9QDPgqiFyJWzPZ/2mTwxoZO71
         YMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVgkZT29OZrJMetesHCInIuXFUtqt92PJWk28zcRtkvxGIAozfuOpR17q6eN4KgXD4eVYHJwNz459MlAKC1q3I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Pesv+Y8vYOWACtAPVZwwT3GK9a9NtzSMHkhI8EOo984y/3Ce
	tca1IrksmOQ0FklBVeIaLG2tpIsMC/cG2VvwaphF0+q2F8+HzuaTgAHQ09A3BtuA8i3zE8+oYL2
	P7kCOwVExsxt2wlgpT0HbClqW2wT0O11yH3e6NKpHP45dQzpWk5lXBBKFGF9Z1rkAneTJU+yN07
	08tr/eKPcwInQ6dg5b11+qSgiEqw48zOnkhyvQ3YQDN1c6xXEacsBiZNAqls4JxRAPJ4wg8B7SA
	WyHT8wRkxAEg4hPSXU8Ee8tFUuwZWU=
X-Gm-Gg: ASbGncsgnpwpnDzrag97gHLAgAk5yuSFSx7pPgfXE0o9AfZroWGHuSTU7CmvwH7/gKm
	xKYUZF0/4ANTvSf6P0+MAjMbD3MZ/Mao1TBto/qVKzyBXtzzXdATtGHPe72EEtnbXReiFtlIV28
	mPGZnFVC/Wggtn1f/XWQJ6XGTwq5X4ykl3dJGUaOUSofAp1lD/zS3MVLyYlToDXqYkFxvWoOUs7
	m2Qya74/NrBAfZYOgYNMDcjx5l/nr3S+2lS8Rp+28df5F/Fibmbq6HqjIEKErHjSxJoBTtdjSH/
	SEOy+Bu0Du7gjd68nLw6XnEkOZbQVg0sVHtryVX3dfDfRvpJ6UExpCXBuvWnilWCY8BVESM21fm
	6m0ckSh2c7ORSiYAK9UjuTLlMHtuVoJ8k/MgplcExyTdXMI5Dpf7mZlIfRXB/4bqmlfQz/kjdc3
	0nY80Ztd1y
X-Google-Smtp-Source: AGHT+IG4xS8wmKcgDY0b4MPgensq51wXUTS1yQxH9uGVR3Xse9ynS2ChAaFG2MSNuOI0ticOUVSfmAsfbUZ5
X-Received: by 2002:a05:6870:810c:b0:372:9f7f:5812 with SMTP id 586e51a60fabf-3b0fa05c738mr2614419fac.34.1759521376834;
        Fri, 03 Oct 2025 12:56:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-126.dlp.protect.broadcom.com. [144.49.247.126])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-3ab917b50e2sm469856fac.16.2025.10.03.12.56.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 12:56:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781253de15aso4674399b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759521375; x=1760126175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=;
        b=I0t9qbDdG4SKHra7yieag8hCibfWJMCMwuLqWaGjdQF/ZG7DNBfR6Lao+71cGm+ScS
         T/cs+HDpuu058PDsSCXQ3oPklmMAkuU6SyShMV7N7mEh4fw5p7Vh/kK4Om0qEwRayp2a
         M9MER3FN82m6AuQOvlJI926No2YiyE5mVLGnc=
X-Forwarded-Encrypted: i=1; AJvYcCVbpjW/wtS7SvGSvL97DM4jgS39LxyLYxOcxTcpwxTekJ+bAjQjdXP1HyJ+IZU+le9u73P6Gs/h2Mk6K5LKHunh@lists.infradead.org
X-Received: by 2002:a05:6a20:2583:b0:2e5:c9ee:96fa with SMTP id adf61e73a8af0-32b6208e921mr6127484637.34.1759521375307;
        Fri, 03 Oct 2025 12:56:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:2e5:c9ee:96fa with SMTP id adf61e73a8af0-32b6208e921mr6127464637.34.1759521374911;
        Fri, 03 Oct 2025 12:56:14 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099add13esm5371162a12.8.2025.10.03.12.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:56:14 -0700 (PDT)
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
Subject: [PATCH v3 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is active
Date: Fri,  3 Oct 2025 15:56:06 -0400
Message-Id: <20251003195607.2009785-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003195607.2009785-1-james.quinlan@broadcom.com>
References: <20251003195607.2009785-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_125618_040278_0292C090 
X-CRM114-Status: GOOD (  23.28  )
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
index 9afbd02ded35..9f1f746091be 100644
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
+	bool			bridge_in_reset;
+	spinlock_t		bridge_lock;
 };
 
 static inline bool is_bmips(const struct brcm_pcie *pcie)
@@ -310,6 +314,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
 	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
 }
 
+static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
+{
+	unsigned long flags;
+	int ret;
+
+	if (pcie->cfg->has_err_report)
+		spin_lock_irqsave(&pcie->bridge_lock, flags);
+
+	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
+	/* If we fail, assume the bridge is in reset (off) */
+	pcie->bridge_in_reset = ret ? true : val;
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
@@ -1081,7 +1103,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	int memc, ret;
 
 	/* Reset the bridge */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 	if (ret)
 		return ret;
 
@@ -1097,7 +1119,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	usleep_range(100, 200);
 
 	/* Take the bridge out of reset */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
 	if (ret)
 		return ret;
 
@@ -1565,7 +1587,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 
 	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
 		/* Shutdown PCIe bridge */
-		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
 	return ret;
 }
@@ -1653,7 +1675,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
 		goto err_reset;
 
 	/* Take bridge out of reset so we can access the SERDES reg */
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		goto err_reset;
 
 	/* SERDES_IDDQ = 0 */
 	tmp = readl(base + HARD_DEBUG(pcie));
@@ -1921,7 +1945,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
 
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not de-assert bridge reset\n");
 
 	if (pcie->swinit_reset) {
 		ret = reset_control_assert(pcie->swinit_reset);
@@ -1996,6 +2023,9 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (pcie->cfg->has_err_report)
+		spin_lock_init(&pcie->bridge_lock);
+
 	return 0;
 
 fail:
-- 
2.34.1


