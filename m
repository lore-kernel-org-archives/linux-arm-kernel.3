Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6CAE68165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=; b=PbkfvkiOBUbzS9MUEt1RZXima9
	N8FuH4jlYXpIo4mhkU2kSBW7Y2hEiBnxYxG53qDALkXeEPlAt1xD8GQe2xg2TFm2ycg7BUK/FcXBB
	YjjvLntn9CzNKLeiFSkj+lvHJwhU6vGSeBmWOVhgLdb6ghCOYhdLxgRCoEpgHbccS+ShHtq+kxmLA
	yIpPDRD49gcx+HXIkcymAxcIukKIM7E3NfL42RFCgJbvbMnwrYQf7xUoVEmRKw/qZVjFao1uKa5JE
	2Nm/+/wy4ux7v6tWXWei+CBEtr66zgFIzN+NzwYeM0cHHlCfqVx5dRgIFOVhdf8FpZbr1QqXw+G1o
	SoUUNFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ79-000000086L4-3QL2;
	Tue, 17 Feb 2026 11:19:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJ77-000000086Jl-1afi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:19:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3hix1942880
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=; b=NEL5cguilh1bR/cM
	a7PuV9BQ7AW0HX4J9m2MdiGrG7Fp46J7YHAotQdZJ99z6/tpvSWGq5aapmVf6WIl
	mVHE48iPMzUegKNvvF+8XDpPBV7klhOu65cFgU4kb6HhUepYDIuWqTZE6VLlc/7E
	1gSBeEnAA2psW0prH43t/H3TNRGYcS+PAIrHPpicWQV4fbanLwIBkdwOVheoo7xx
	tw93XnNt/gsh6CuvrcyOLmlr7h14cePr5rCZVtXh5r+F1JrWOVvFrcdYlnebaykL
	DsrkIZ/OWeTcCqUv5blkxgBJfWSGrZxbch77/zrE+qeiuACaIloYhimyD/+pAOzX
	DrcxeA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g01g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:19:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243ae83898so1782787b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771327171; x=1771931971; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=;
        b=j+8kg3h0Dq0+58jVSU4qizQewzMb4qHZBfVSdv8hlb/N0hkorOlmqXIucF1sH02NYu
         J2uHKPpuO5af94xJQjYbezL2Vxj3XBNawyse0XD4WVMGbAPUerjlVbYAzdynTGP47a0O
         hZa3/+B/xvxxpmz/hN0/uzf3v/5rbAmxc1FiBY7Znbw0clgKPtFO/7NezQoXvNe71GY2
         Tu2ppG54NsrZjFDSjuKddO+fLZiqv95e/uohnQERylDllWMkwLpKK3+AujWNNR+tDotZ
         /7ZURfc3ohhbUMRDsPVWsxeDwgy8Tc5KCaBQVf3b7pL5rj5XnBilTlNG4g+z+ie3HiPd
         ulvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327171; x=1771931971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ufl5jZDzffZq1Bxrg/McQqGCvj9/TyQy203e6kES/BI=;
        b=J6bFT7KN2enIciyQ5GfTIqFU4CCGWOMarTGhK5DeYWk6taumgzgPfQbq0iRB0qbTgj
         m1F3Dh70Y/3Ahzl56jNrKhJtYTKzbdtC7SPP/6oak3+mEYbe2F7Ee5h/g5vyWasoO7Pa
         CEd1T/4fWUdkpJ/ARvtcoqW+MsZwdqy7RAe3FKAuffmM9iqbiElU5BmZPtRZ3glp5qxH
         gbE7VFCbM2CA2osU8ptErqrEQPJZ67R+zQOLZlwNE+uYOARY/qi7H1+MQlV+aEKkJfSW
         6VD5f5wFEogDHQMl2rdbx1LS14+xM6L/CHP6xBvGsIgL5fdXeek0UUh1cmd5uvq/5+/p
         Mwkw==
X-Forwarded-Encrypted: i=1; AJvYcCWLpIOPZM7RZAEqtuMOg+M60pKEgQMUVubqJAQKVfc24C3VKY964UE60QhIXERNlYdMYmELtMMgRShIEDjugTFc@lists.infradead.org
X-Gm-Message-State: AOJu0YwYtFMkKzutTZUGk08fELUjch3ipiBYfaMYfgbtb0tw1svcA4T7
	2eqiMAV1988aZHhlxp8ch0XcJH3kuMB3mC9jBRqRWy5ihhV5Tu0SJbz2x4tPutMg4Jo78Bo5w4H
	2Qa7O1mvFGiIXObhJm3hiDeVhwKMKvwnsJOFmf4Viv6B2U7Zl6nGfWfBwTCoa1LEk8O4gCEqpAf
	YCrA==
X-Gm-Gg: AZuq6aLmCOOfEeWIj3PvClSevlcyC8QJLLcscT1R2w1qqX74BBMBH2CUDqmdCrDPSXg
	z+maErSAtai5934Bo+Ll/RJgTLjxncnnNvreDW5a46W7F1xtXgEnrjgOYgmtvwJprFVCnflmTAZ
	5L5OY+PvxQH/5seHObAzlwPpogAPMQ6R7eo9+Be2SksnDPgfM9tI5Op/av988STuGkXHUXBM5Bg
	zmkRUNyF7wIr97H+ZI4Vu4WBtfTx2wOvtTd3e1gV/kk5W1NXZY0pQB2nj5O+vaOBLSmnCBXR5oF
	xmWdWtW+McofbFzV0azNDbN0x/Nb4QUAfkDc1a7sFXN0UOZ3yiCbVGNOziMJ1/uD7IETYfyCZP5
	ebW4GH1a9ks0eNR8yENK9APxfaAoq0A2HqJq1O9lfD7awqr0mC2bTjUN5
X-Received: by 2002:a05:6a00:4acd:b0:823:1406:8797 with SMTP id d2e1a72fcca58-824d953488cmr8975260b3a.31.1771327171085;
        Tue, 17 Feb 2026 03:19:31 -0800 (PST)
X-Received: by 2002:a05:6a00:4acd:b0:823:1406:8797 with SMTP id d2e1a72fcca58-824d953488cmr8975235b3a.31.1771327170627;
        Tue, 17 Feb 2026 03:19:30 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9a661sm13181914b3a.50.2026.02.17.03.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:19:30 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:49:09 +0530
Subject: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
In-Reply-To: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771327148; l=4007;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RI4q6fSSubOmDgNNa0gqplTxflnkQiZtd27PDlBbjys=;
 b=li0xu+gi3ab5XV55aDVCdK4EDUgeaa7g/6a4LpfP39jcV9HM2K+TWtxoLN665Lm7JJn/gDR6A
 p55CKSh6k9fAoU1f+ldOyKH3B3W6LSkcx7zyXglg17snwRy2jUfcT+Y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NCBTYWx0ZWRfX+l0I6qhwjKHt
 zVakYRPQ37VTT1Yk+PG8yJfGIDCXxzJ2rQkY/RgXAhgJlxdQuJGqv/1wrOJ19lsfPPdLTunGkpP
 BEq6A2n5/B0OJaS0nRQ2Y9KWEvrkoAfr12BLcTdYkD7q3GeypMcSg+SNSZMx4Pv055YzXNkbSmj
 GV/upy6PX8ZcFIKpNWlR9wJXYBYivdqE5SsLi5tAPOjnTBsaMlYmLyEZvQa6I4Th1WmT2p+v0a4
 624ESo2kLEZbqaRUwCxeR0w2t/p7B6OqJvU/Qnzm/vFjIYDKyBdWmTs6Y5FR3UinP395Sgk5U1S
 tMmNuWvX4Ei5CaOV40dw4ADVYY3ML/58NseWU/seHkAtoROv3J8jsvZ2xM/oYzXU+4krvgeyEwq
 fSY9bhjMpu7FX29y8gvp3i33blvrS4M7gE81Y63i+0W7ZI4MxC675sj0IbsmNpR97WCsMz6EGkr
 pP8UqrsX+4v63CsXQNA==
X-Proofpoint-ORIG-GUID: wctszhLwhY2fbveZUDkxYXoxg193IvsX
X-Proofpoint-GUID: wctszhLwhY2fbveZUDkxYXoxg193IvsX
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69944ec4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_031933_544984_B51ABA7D 
X-CRM114-Status: GOOD (  16.82  )
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
 drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* PHY power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -680,6 +680,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_2(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_2 *res = &pcie->res.v2_3_2;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
@@ -712,7 +718,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* PHY Power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -844,6 +850,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_3_3(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }
@@ -994,7 +1006,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* PHY power ON */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1065,6 +1077,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 
@@ -1169,6 +1187,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
+	u32 val;
+
+	/* PHY Power down */
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 }

-- 
2.34.1


