Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220ABFEEF33
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=iqDU68FQGI8KkQFAIK9CjfBX26
	S14AdrkmcOpHgP+lzTtnfqeUn4h5Q86rfXVPW/ZzrOxGVDsDHK3G2WlW5L1xeGsjHtrssW5rX0dzi
	d+ovzJNZjNUjDwTHN51qc4j1vgedf3XCp/s7ZOUe0IAaNVmvf3vGa8ylIOYLI0/JVZVFEFoZA/XbX
	VPDdSzLRm/MjPVkF/es+Ib8ktjOJCIlYYQ1bb6fRc6B+I/cCSl590Px0rj606R70K0W9iy6w8uRSy
	sRVqc/44Hy0feECz0OwhFsMQ2RsDhbtIYrpDQTTXu4PV2ZxiRcZbNtP60RGCKY+scKPP2V9mBd/BO
	LqIzPToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65l-00000006TSE-2qKi;
	Tue, 07 Apr 2026 13:03:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65g-00000006TQi-49qN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637BbFtT1584596
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=; b=neYlXzffH3/tWdGL
	BP23zbmQhq3CKOr3rtHAP3Ji+bi/3KtGu97G5CY3SFnDVt8nGg8I30fSmHLF9elC
	d9Z1h5q3cvKELU2xZv0ObmZ2w0GUhPC/7o+mkJFGi7a7Wu33Xax2R5TjL1SlLrzm
	fH4uBzVFcenFQr1KGfEz1hzBEZTM9wivgAGYwqlE0gM+CbEhcRZTeXBS4M61bHk6
	765AIOAf5ZjTbzkqHSc746Ikw1jw8jlWeiTIwtQvAlXkMWmnr8YrDLVhKqLTp4FC
	3SLHHiQhwbmHCh6yLgfbyeQhmaAwZfpaR49e/KcxGcfqign5q1vLq9y+RoM2mQ9s
	o/2BDg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tthx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso10817282a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567015; x=1776171815; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=T/XFizxo26ZEGgL7OcJAoDckDFCigigi6ri1RWN+dGLAShG49bMd3ulYBmMgZdBpB5
         AGVFg9+8rYXjBGVXLq69xvQnZsL6wXSSD2C0RIQFm1Ob1r414KbUhYtGZAQB6EzO18DH
         Rpkp3R4zgKeNCokax8gzEJA8l76sfk9lbCRQ9nGQQlH60IA6zW1F1lYz7873K0VjnRCT
         TQI5tADBCtRe98Hwtiy2ZxNXFKsWAbd+pYUe33x4ymSuDGMmWhBU8v+7bJMtznw9MZ3G
         BeAWn43ZyP1k6lkHr8nsXFmTIuGZEoIw4+eMdiDPQsQI4SBf1esoBFCVJEMEWajQazrp
         aVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567015; x=1776171815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0dWYOeGxguS+2oLFAt3NGnKQOAcHpW8zVfBpqLuOnk=;
        b=YF7bqnH4zdJAdsNxW9eZ0N5dkSAjnH9xrc1EVBAtBk0latWgpNtWXcGOlRHY/PVjsZ
         l0gbDp1T1w68UbApkgrSN8eTpu9hq7Mlfquu+kwQxYpZOn35k/L9rrDzZOSa1GX9y1vl
         SagvjAJutLNj0jN6m6wT04Sxq3OgBooAEBytYbcP9LGb99tJTRZ7VN4ihlsDUqnI1/qx
         JoCLIGUHIgnLfC+2HW23WwNAPujVFPFf5BCfKEo3QEEbQpSKT8IzZXpOMLLwiRaRCfNF
         72tAMJaWDFw1aAjunnoHuQ22XgzEC7uiefbvjszbGleq9zLspTBukuwih4GKu56xXBvV
         nyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu1GvegaFYLinw2tB3FzKTl2TFa3HevSncveGNyX/oKjtfVI9wt1UrwZUDTaGpqLVVqKGiDWCm5ktTtw9mNLis@lists.infradead.org
X-Gm-Message-State: AOJu0YxXH+1UTp6URZubLxVVxJriRnfUNfCRDIpoosSYT6XF4u5tyo7v
	9fsUq918iE4TeCwP+bUKq/kqZ4A6+g3HBlZm2bPvUENmuZsCqe1DdjIQTr69KUjN+2cd+rvlznM
	8hNR5kZ0BnOBgRTSSHyxmlA4vIt7MFkn7D/DVfsZhaHAEestnUvEuMukiZeGZzjz5HhDhrNGCZt
	bq5Q==
X-Gm-Gg: AeBDievxP5bzdWIJNgUn7UQI/0fZ/6hUlkZaiAupkEvAqadkP63uupXXQwAAlvOW2ed
	BAx9e662WeDtIouMZ9KEFrGoUcKBHK/zj6f3a38bGW/JICK4kwKc0bWjTZiMlcyO5rHDZ5RFOPr
	mwPnNtAuFBcSgXRyzyeYI9ueHF+7IVXiEZKD0C8tbAWQ/gZ6OQ3VybjSfPA9kDZr/os7CuEnSFa
	nlKfWg4Y/d6eC3jFvxvomMh3yPPBs22zsmcLBoLUaEO/rZphbBnByaA15cNSIkyo2jXNLJ2sSc6
	gLe1Rj8CdwmdHrN2a+892Ja9E3hNdZ3V80kJSyy7nbPY/u7KiTiS62Go45JjLxiMg+3dY/2xpB+
	OkJ8Iv/hRh5ji2uipeK7DLNtfEstXUlzhM8eHGSXVtqcyEov9V3VVnDLd
X-Received: by 2002:a17:903:1a26:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b281675682mr168862995ad.3.1775567015082;
        Tue, 07 Apr 2026 06:03:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b281675682mr168862275ad.3.1775567014367;
        Tue, 07 Apr 2026 06:03:34 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:10 +0530
Subject: [PATCH v4 3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-3-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=4739;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=p9k1+/wF5h/48gQ8oI4Nz1vPnqke7I1l9Z0Jkky+eGc=;
 b=A/9mrwa1cEZn/665Ty4xv3sS5FQbruMYgdYZxpmFWpzrmLcBwUA+5nbcZx9i8UdCzGN+Mh8Kr
 4mLUc8D2izrCNZohAfCFDN0posPPlZAgxsuu+twsHUjGoamViF7SSMd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d500a8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S-wDCh2AgS0RhsWIeBgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfX4x0kBbXmtZ0V
 e86/tHu9As7PCdlJyC84wg8vwylA4/wh/63TGba7EI3mO0RN9xlH5vWd+pxer6mXDD05t6Ca0od
 1KDiJw214mAW5hkphQJTmi7yzMBPqmHZbbOInJ5eZuQz8k7QzRFdZjeZQPFrKt0igi2zyMb02HL
 eXVM6T+IC7pbrN8/priJKF3sMAGUGw7N0f/BygH/YdbEBbpx9+DKmCpvih2M3X4yjVnD8X7Jkze
 c7kONAV14zYc8JOGCGrJEvZsf5d8jsC9pmiTwXI70s/v7m/ZfBCLA+UydYf4WiVgPAI0CT1ZkX/
 gpX2ox+Zi4UL6jq/mHzoSiLOci8+xSLfV/lGbf6cbfixvXTDDLCkfxXy+K7tyRe+gheIiYr5SZK
 9FMNnyesxEiM41Sxo6W46mQHVS2ysde0YTQfb7w48WGjbwOcOXMfuC38NeOmT4p8BLw1YYqAja1
 Vm00o5MvgRVVOH2cI1w==
X-Proofpoint-GUID: FU0AF5Z9jDaqL-cKnY2HYEztGxz6I52f
X-Proofpoint-ORIG-GUID: FU0AF5Z9jDaqL-cKnY2HYEztGxz6I52f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060339_628468_524C91FF 
X-CRM114-Status: GOOD (  16.55  )
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

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b00bf46637a5ff803a845719c5b0b5b82739244b..c14c3eb70f356b6ad8a2ffe48b107327d2babf77 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -899,6 +911,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -994,7 +1007,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1078,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1188,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* Force PHY to lowest power state */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -1209,6 +1234,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


