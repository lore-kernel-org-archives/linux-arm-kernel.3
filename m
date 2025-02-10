Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91C4C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=013foi5X/BmKOy34Oh7COlZ1yi7o4IdG/96zL5C8KGQ=; b=LAnjUJjugDznVNwI1wsAjrjJHb
	oIEyKt7naNbN549bvogD8kg+5ViTtYRzKNfdYtMFsLB3QOwW/mbNhOh4VUls07ufkqxv8uZxnACLD
	tuz/hdaaKJngdPhAS6k8rmoBnvK/gs+aPA4d1kE89bHV44fa0gyLp3zVfW6/or3+a6ldN/yiAjWCv
	cKYXXtkPdJ5J+JdmxqxmUEtE9QHPvA1W7RqnTn9e8gnB1SXsmibee0uyc0+qCqIjuS4C5XFJHG42e
	GRbofyRGb3mJEwyDHa1oMKi03/pnCKskeFG7O7aZYE+oF4wnWmmpLtHb70QbNFxbK02cET4NZV+k3
	y4/USdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRVK-0000000H7Pf-1DN8;
	Mon, 10 Feb 2025 10:59:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRDh-0000000H3Vh-2GmL;
	Mon, 10 Feb 2025 10:40:54 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9ephh012591;
	Mon, 10 Feb 2025 11:40:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=013foi5X/BmKOy34Oh7COl
	Z1yi7o4IdG/96zL5C8KGQ=; b=5tbsMe9961Urpjp7ew3gfM2vAbInvhgoqHnxY6
	RURES+8kRO/+4Cwn2zkAeyeo5GVOssn2sfqvtZ13sskE/dvtgNL9yIgvc875fsDk
	YsVb22vPaFe0m2ciuMXlR2Y/s9AY61DepEL2l3Vy3rAehXekrcYOoBkjZq+b9h5Y
	LQK5jIue4FxRPbAKa9j4b9nwbyrsfYUPxI4ku4PxLVCzrqmVUw4pDEA4+OsSB1NR
	cL+ELlOnelNVL6UUKBje/h49DtiYzxPCNeQSS/mRiF3FlSSb5StRsFaEAg/8QNMB
	PSNYGa6dM0fuSSOcYVvh5i94jgkjLRCxZX/8Y4sBbkJCDwnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wswvcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:40:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8EB2C40058;
	Mon, 10 Feb 2025 11:39:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92A8B2FD8A0;
	Mon, 10 Feb 2025 11:35:22 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:35:22 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <arnd@arndb.de>, <fabrice.gasnier@foss.st.com>,
        <linux-phy@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 RESEND] phy: stm32: Fix constant-value overflow assertion
Date: Mon, 10 Feb 2025 11:35:15 +0100
Message-ID: <20250210103515.2598377-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_024053_871048_ED7F4FC4 
X-CRM114-Status: GOOD (  15.36  )
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

Rework the workaround as the lookup tables always fits into the bitfield,
and the default values are defined by the hardware and cannot be 0: 

Guard against false positive with a WARN_ON check to make the compiler
happy: The offset range is pre-checked against the sorted imp_lookup_table
values and overflow should not happen and would be caught by a warning and
return in error.

Also guard against a true positive found during the max_vswing lookup, as a
max vswing value can be 802000 or 803000 microvolt depending on the current
impedance. Therefore set the default impedence index.

Fixes: 2de679ecd724 ("phy: stm32: work around constant-value overflow assertion")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
v2: Change title and Fixes tag
---
 drivers/phy/st/phy-stm32-combophy.c | 38 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 49e9fa90a681..607b4d607eb5 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -111,6 +111,7 @@ static const struct clk_impedance imp_lookup[] = {
 	{ 4204000, { 511000, 609000, 706000, 802000 } },
 	{ 3999000, { 571000, 648000, 726000, 803000 } }
 };
+#define DEFAULT_IMP_INDEX 3 /* Default impedance is 50 Ohm */
 
 static int stm32_impedance_tune(struct stm32_combophy *combophy)
 {
@@ -119,10 +120,9 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 	u8 imp_of, vswing_of;
 	u32 max_imp = imp_lookup[0].microohm;
 	u32 min_imp = imp_lookup[imp_size - 1].microohm;
-	u32 max_vswing = imp_lookup[imp_size - 1].vswing[vswing_size - 1];
+	u32 max_vswing;
 	u32 min_vswing = imp_lookup[0].vswing[0];
 	u32 val;
-	u32 regval;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-micro-ohms", &val)) {
 		if (val < min_imp || val > max_imp) {
@@ -130,45 +130,43 @@ static int stm32_impedance_tune(struct stm32_combophy *combophy)
 			return -EINVAL;
 		}
 
-		regval = 0;
-		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
-			if (imp_lookup[imp_of].microohm <= val) {
-				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
+		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++)
+			if (imp_lookup[imp_of].microohm <= val)
 				break;
-			}
-		}
+
+		if (WARN_ON(imp_of == ARRAY_SIZE(imp_lookup)))
+			return -EINVAL;
 
 		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
 			imp_lookup[imp_of].microohm);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
-				   regval);
-	} else {
-		regmap_read(combophy->regmap, SYSCFG_PCIEPRGCR, &val);
-		imp_of = FIELD_GET(STM32MP25_PCIEPRG_IMPCTRL_OHM, val);
-	}
+				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of));
+	} else
+		imp_of = DEFAULT_IMP_INDEX;
 
 	if (!of_property_read_u32(combophy->dev->of_node, "st,output-vswing-microvolt", &val)) {
+		max_vswing = imp_lookup[imp_of].vswing[vswing_size - 1];
+
 		if (val < min_vswing || val > max_vswing) {
 			dev_err(combophy->dev, "Invalid value %u for output vswing\n", val);
 			return -EINVAL;
 		}
 
-		regval = 0;
-		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
-			if (imp_lookup[imp_of].vswing[vswing_of] >= val) {
-				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
+		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++)
+			if (imp_lookup[imp_of].vswing[vswing_of] >= val)
 				break;
-			}
-		}
+
+		if (WARN_ON(vswing_of == ARRAY_SIZE(imp_lookup[imp_of].vswing)))
+			return -EINVAL;
 
 		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
 			 imp_lookup[imp_of].vswing[vswing_of]);
 
 		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
 				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
-				   regval);
+				   FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
 	}
 
 	return 0;
-- 
2.34.1


