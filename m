Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A573C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 00:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCyko1DNm6CUBVPrxQQ2z1EYUO69mTQyAaMPPkscKhk=; b=08Klp1KFa7bADSbDXZ16P4Zpow
	k+sWtBlTjMr2ewTFO/+z9OR0Qq6Fu9djfIiM8uq3h4Tv8MIb1UyQHs5FV88rHfojjgOiE2MSZuWap
	u2eoT6MmbGsnNOfaGWQINQnB6hBNP48M1NvtIClv+XWMocLG2evBbkEoR2rbC9fD7jMEVsSsR4jog
	tx2Izu0sbsl+LIX9QfJ0nOJOGtn34kV6lHxFgQL/OiS8D2YPPHWlnkcP8yDb5SvYfxGIjGxVOJ8xG
	ibY4+CyqzJxfFovdc5erw2M8C9C95Dr61XuZ/Gk4m/JLOUFEjkIAxHdzMo6P3tPH4/kDC6WdLAvvB
	z1nW1OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viifJ-00000006Djb-2Dnp;
	Thu, 22 Jan 2026 00:35:13 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viifG-00000006Dis-0Zin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 00:35:11 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9111CC0000F7;
	Wed, 21 Jan 2026 16:35:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9111CC0000F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769042108;
	bh=a5rp0+ArVuuxvfqqDoMyHMnwbym/xOh42uLAONTTNDQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vTKp/jPCbVn18JbnKs4AkR2t0cspyPms+kkF5XrVQCM5oTGfyrqDkpWwG9oK5RWHw
	 1RcvtQpFL9xo9N+aj2KCyB+BqHbpwM+cMNNGtYIJFra1haEl/vjtr2rkxZ4d1Ba+BO
	 bWnURFE9JqYwHtzVScR2lfMyNq10xGHQE5wcHW1s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7BD7C18F71;
	Wed, 21 Jan 2026 16:35:08 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH] memory: brcmstb_memc: Expand LPDDR4 check to cover for LPDDR5
Date: Wed, 21 Jan 2026 16:35:00 -0800
Message-ID: <20260122003501.1191059-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_163510_328474_F237EAFB 
X-CRM114-Status: GOOD (  12.80  )
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

The same limitations that apply to LPDDR4 also apply to LPDDR5. Expand
the check and rename accordingly.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/memory/brcmstb_memc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index ba73470b1b13..c28fe9093616 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -14,6 +14,7 @@
 
 #define REG_MEMC_CNTRLR_CONFIG		0x00
 #define  CNTRLR_CONFIG_LPDDR4_SHIFT	5
+#define  CNTRLR_CONFIG_LPDDR5_SHIFT	6
 #define  CNTRLR_CONFIG_MASK		0xf
 #define REG_MEMC_SRPD_CFG_21		0x20
 #define REG_MEMC_SRPD_CFG_20		0x34
@@ -34,14 +35,15 @@ struct brcmstb_memc {
 	u32 srpd_offset;
 };
 
-static int brcmstb_memc_uses_lpddr4(struct brcmstb_memc *memc)
+static int brcmstb_memc_uses_lpddr45(struct brcmstb_memc *memc)
 {
 	void __iomem *config = memc->ddr_ctrl + REG_MEMC_CNTRLR_CONFIG;
 	u32 reg;
 
 	reg = readl_relaxed(config) & CNTRLR_CONFIG_MASK;
 
-	return reg == CNTRLR_CONFIG_LPDDR4_SHIFT;
+	return reg == CNTRLR_CONFIG_LPDDR4_SHIFT ||
+	       reg == CNTRLR_CONFIG_LPDDR5_SHIFT;
 }
 
 static int brcmstb_memc_srpd_config(struct brcmstb_memc *memc,
@@ -95,7 +97,7 @@ static ssize_t srpd_store(struct device *dev, struct device_attribute *attr,
 	 * dynamic tuning process will also get affected by the inactivity
 	 * timeout, thus making it non functional.
 	 */
-	if (brcmstb_memc_uses_lpddr4(memc))
+	if (brcmstb_memc_uses_lpddr45(memc))
 		return -EOPNOTSUPP;
 
 	ret = kstrtouint(buf, 10, &val);
-- 
2.43.0


