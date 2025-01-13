Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F28E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zKVl4ErJTsqC1L8EpP30Wrq/2TXXpHRlMyoxXlbIuI=; b=oE/Ita+EsxfYrD8hDXncEcYb4Q
	LDnsCs0cOOzBODQsZ21/MlTrUdYZZ4O0l6iDCrVLHPmlnyyNxDcOBE5fbYkNvfydqUFkNQxmzEP0+
	fhnnQxiHRQRKS5YsmvTCbx2++QbwE8jALEOEI2kQet+ZxfHyG0b0HG6wenlu91aSUyUshvUqtTT5/
	I72tKRnKzFQe8aznnWNBDmuFmnj6Grg77SRCfD1ST7rZ9aRoeTdu71KTR5FdePAB0/TNrQ/DMINpw
	nSTRkJb1CgPOHSN2W5sBqOZxyqjX+vvKcNp6a7JnLsgOXYIXhBQBg+KJhdn+R8bvNdekCKKxnmQW3
	ZNCDbSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGPc-00000004XcY-1ord;
	Mon, 13 Jan 2025 09:07:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJA-00000004Vee-1Qnt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jan 2025 09:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7zKVl4ErJTsqC1L8EpP30Wrq/2TXXpHRlMyoxXlbIuI=; b=UlJKqFjCx0t3blKbAVUHps3Mh1
	6N47T3khiTht1kMkPKjCNLXs2ZmuZ0/uSOM7Xicd1Dl2eNTAMwao7eC8hsgS0wyZx3Dj43pLLMefK
	/24to7M0haB/l0u43yrV+oOf4FhmbCT0uxXwgub7EqBeVRCj8+01PXNaH+ceyv6qIp2V2c19oHzET
	6INoOccEQloLeLLlMiJeNU7AVH+5cogXt4OTFsA6PbWjpGL7nv+PDjXThm4QLq9QwFwn6gCbfgGGv
	9y9xnXISq8c05Wcmx75rtHr2N8fD0BwyhwLAYFNLrYma4NERfjtgAW1l1Z+GPqbf+gUya026C5Yg9
	qGWBWudQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGJ3-0000000AGno-3PNl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:00:26 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5ko5m016842;
	Mon, 13 Jan 2025 10:00:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7zKVl4ErJTsqC1L8EpP30Wrq/2TXXpHRlMyoxXlbIuI=; b=CgA8BHsPISBFvnQa
	N46xWexhOa+nriF6gxZcYSeNRaKeVgfO2MwMA9qeDmd1yKXB+P3ol8ukbGWf/mck
	JYYuQ5zC6cI6p9oknPuO1ILpg43Vi35WyaQ1qODIkqNpuiGvdz60gIPffyrJg9VZ
	+W1r6NbtYcwdQCjycS9jJSiHIQeA6c+AjKYMc5VamnD+EUuW95Cn1iy2TG5p37n7
	0Axa5xnsWS6jo/VFa1QeuHhDHV2kxorLR0fvurMbqyEmOEDXTLuhiH4sCBpZaZEG
	jQFDhgESfUB5Rf2XKcJJdTmAy0CkhBskSbuvPin7UfYKxxXA73i5OSheDBwFtWxx
	ZkBIvg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4444fmub4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 10:00:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2ADF240051;
	Mon, 13 Jan 2025 09:59:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AF73234C2D;
	Mon, 13 Jan 2025 09:58:15 +0100 (CET)
Received: from localhost (10.129.178.39) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:58:15 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 13 Jan 2025 09:57:55 +0100
Subject: [PATCH v3 5/9] media: stm32: csi: use ARRAY_SIZE to search D-PHY
 table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-csi_dcmipp_mp25_enhancements-v3-5-33b96744df46@foss.st.com>
References: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
In-Reply-To: <20250113-csi_dcmipp_mp25_enhancements-v3-0-33b96744df46@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.129.178.39]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090022_518743_0C868A41 
X-CRM114-Status: GOOD (  16.63  )
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

Within stm32_csi_start, use ARRAY_SIZE loop in order to search
for the right setting.
Avoid useless init of lanes_ie / lanes_en.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 89fcd7d07904..3654f9895dbc 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -325,7 +325,6 @@ static const struct stm32_csi_mbps_phy_reg snps_stm32mp25[] = {
 	{ .mbps = 2400, .hsfreqrange = 0x47,	.osc_freq_target = 442 },
 	{ .mbps = 2450, .hsfreqrange = 0x48,	.osc_freq_target = 451 },
 	{ .mbps = 2500, .hsfreqrange = 0x49,	.osc_freq_target = 460 },
-	{ /* sentinel */ }
 };
 
 static const struct v4l2_mbus_framefmt fmt_default = {
@@ -444,13 +443,13 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	const struct stm32_csi_mbps_phy_reg *phy_regs;
+	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
 	unsigned long phy_clk_frate;
+	u32 lanes_ie, lanes_en;
 	unsigned int mbps;
-	u32 lanes_ie = 0;
-	u32 lanes_en = 0;
+	unsigned int i;
 	s64 link_freq;
 	int ret;
 	u32 ccfr;
@@ -474,11 +473,14 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	mbps = div_s64(link_freq, 500000);
 	dev_dbg(csidev->dev, "Computed Mbps: %u\n", mbps);
 
-	for (phy_regs = snps_stm32mp25; phy_regs->mbps != 0; phy_regs++)
-		if (phy_regs->mbps >= mbps)
+	for (i = 0; i < ARRAY_SIZE(snps_stm32mp25); i++) {
+		if (snps_stm32mp25[i].mbps >= mbps) {
+			phy_regs = &snps_stm32mp25[i];
 			break;
+		}
+	}
 
-	if (!phy_regs->mbps) {
+	if (!phy_regs) {
 		dev_err(csidev->dev, "Unsupported PHY speed (%u Mbps)", mbps);
 		return -ERANGE;
 	}
@@ -488,8 +490,8 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 		phy_regs->osc_freq_target);
 
 	/* Prepare lanes related configuration bits */
-	lanes_ie |= STM32_CSI_SR1_DL0_ERRORS;
-	lanes_en |= STM32_CSI_PCR_DL0EN;
+	lanes_ie = STM32_CSI_SR1_DL0_ERRORS;
+	lanes_en = STM32_CSI_PCR_DL0EN;
 	if (csidev->num_lanes == 2) {
 		lanes_ie |= STM32_CSI_SR1_DL1_ERRORS;
 		lanes_en |= STM32_CSI_PCR_DL1EN;

-- 
2.34.1


