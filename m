Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F2DFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=; b=nMVcTeA7aPopYJ3EXsOyCCQHjY
	oYbOwOB5xTO13WnONOK/CfhjZGQXBWYJnFcSWhpUM1LO8V4jFSf/lgiuYpUGe8e522a1mmpVE4nh4
	G9Ome8fK+PVrNZc24QN2qZNzCx1K8alfZqNR7zF0/LmUcGxlsjGA4uk48ivdzXEShdVtCkwgZzCZq
	wO5ha+xz/DU9MIej9TAnSubiSd6u9v/0l+wvsMe6tegYEV7Ib1zvuBJSjSfW8dRi4KF/othizl9+E
	XX6x17JOd3PYhAhduPyOFzfG7hTxJq1NShdACFDdt/LKG1s4hO6QTzT/Ntr2GRMc5QMHGk1RuGUkS
	rUrpBkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydL-000000032T6-0t4p;
	Wed, 29 Apr 2026 06:42:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHydF-000000032QK-2UaR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:42:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZLWh1015576
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=; b=brwlGrWbpQWvfnNg
	Ra8fmfZthkqCqXFWESuHgcuNJf+NkvROFCbDVvOAmdbwTMJh8EbxVWmR0svUTStD
	pUroBYM+Zuzepc9ZsZlqdCQuI/KGg6zCnO3/CHFVTWGdu5Ta6484bw8rNqzYBDSL
	gOkFDTyWBxumA6iiLf4OJKmwm7CvFdDcobEy1rof0AwCgNpGDoQS24py0XnqfrXN
	rzavcS94b9cQ3/aI7fklP6HEevUbVpBtRoeZx/GZPnrthvfzsqXRmMv/X0TVPOPw
	sZ085E3Aqu8krV+e5FkfHH+SzPKFFjjGDNyFy025DpJoAGhiUAgRO2825ej1CdCa
	k1sf0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730k33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:42:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so23509008a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444968; x=1778049768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=;
        b=KOhIl0ErRJHqLpbmJeYDeEMkb2O0SGsPfWLFpCbyVjC7CrIUkx3IaoWpymiy+wUWTB
         Ofvl+da1tIVJaRT2LgvMGL2SAmFxxtVE6xDgTzyNbJ9FMZ1YKJK1NoY0f3oIJJvGvxE1
         HVzJYM/o+XxjSfiyRpetAI7eSpX7vXUGYZTp1y4OhmM9qUIVBLB7SNrwvPV0ODd1SkLX
         dLoXYUkl16xoEt/OIdADccBpH1REi9IS3Ll2MZyMLBz0SPDNaMjFkYYTYjojSDSC9SSx
         TRrxvNr9b6aUYVpX7Iehw/JQKBa+w4iSKF4JLbDPWrOnmBSXypl1zAgz7v50ul59be+g
         54Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444968; x=1778049768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAQflqyXEjlR9lLObXfmGaKeIR8F1L/RE3Stk4NAyyY=;
        b=eMH1zFikxHDIm27m6CvqRrPCqHYpZ443bSu3NMcYLIreB8qhVIzQ1yiMvwkct+JGRl
         caBbWVkKOYxwFraXFW+IDFuvdW6OwRQRjFgVmKdLgBgwk9gMSQeyeC39ovi6f7M3Ejyl
         SnYbSFhuhjYHhyMItLvVBXioA1C5PG0zt4yDFepnvz9RjkSt407AW0kAt4QoVpO1POM/
         DgWnSDOrlXTBo3FYelitnu9sms3NXejlXVACyG6Rhp5ryY46yqrjfoszFEYwfRaiRxKs
         68WH66k7efyqolNzP2GHRiOV+uyLDoSKYqf7Na9SqVeZMwmiUQffrwlVC36x9Fuo36Uh
         a0ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/JNrgJ5dh2/LpAcYNAQlJnbFrns6hlgKNVE13ZGfxtnT7Ff9eDUxKznap4+X6O5uEa4hhvg8xZbACWlUY6eVNv@lists.infradead.org
X-Gm-Message-State: AOJu0YxU+8hQ7PYNbScSW8/jyZ+Vb3nrKOUl+Uv1eINEwXcnuvyp+v87
	3ZLwrKMLQQml/jS3oEUxT7AU/G4YHuoXKYYhipFIFMJhwvWe5ktuYM3G5w3J2+ATXBm3y7UB9u5
	426pWW2dnvys0eSfKCTMYTZwG+YNyMTQD4Uj/zcdhtyQwz29dMZ2oqODvBuX1Zn3Bw+R6S+9dgz
	PlOQ==
X-Gm-Gg: AeBDiescRKXEkjUEAupYZ2wipqCIEiwxrgNpbogR6OrKbhZTvlPAvEzMfU9q/zZ4JOb
	j86kPSOBrsDAFchhh58SnuCPpjLPZsqDaSfJX8/DbV63d6+BHbh8vvyVEgTePYKSSsdctVECotu
	PP0FXG5y2VIXe6rFTiwxRp1dOK7sDg9ZFi5JGX0PneKr9+xFPOinXCvcgu2uAQWVjlvBUKGNBUk
	YYNjfQgqIssqYLTyG22XwiW58CwoxtFOyfo5CjFltLP08X1UQlCRWTqPVIZrdJB1AJvtmiP4IGI
	YbdXluKVIzd6h1nz4OdJlH9lmCYqJiwWTwpeCZ26FxgOhvO+Zhvho/0IKQdT399i4J8WR0rdPZz
	57jzyDwr0ySvvq2t0fw1pw74JLzmey4Z3CTFbvDAfY4OML6vWXRl6Cys0UzwtYYNUpX0=
X-Received: by 2002:a17:90b:2f8f:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36491c8837amr6235751a91.0.1777444968412;
        Tue, 28 Apr 2026 23:42:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f8f:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36491c8837amr6235723a91.0.1777444967930;
        Tue, 28 Apr 2026 23:42:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:25 +0530
Subject: [PATCH v5 3/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL before
 disabling rails/clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-3-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=5203;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rgQE2wlPYdGz9Ms01FRnDjEVC8FuvzCU6MQDVXSfne0=;
 b=JaOQDILfJYOoMchLl/cEYOB0wve+tsQCiwlZ6fMiP8IcMh282moLRs2rp/lrg+7a8ohN/4Pgx
 SXKbz9xiUeNAK/x7N3nEAaWjmjNYdphcZac1xnsDzcrx7NiIDmtyHad
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1a869 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oQbQ34n3Jerzy_GFPTkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX+/MozKwI5i63
 RqPir4nLoBjSqxYm0jtJwBGdlh2Gcbaio8+UNzFwv+c/tcXmZl0m1I8eD0JOdKAXbLwIXlZTLpX
 Y2lV8hSgDHIXKBXNnNf8yM8NFdc3eExbrLMr2fhYUL2g9YcVmtDtGzn2SYRgsx5xOcd4dD5ftZd
 4+tt+BdF6tG3+UzjfKzM3Tkr3dTxJKL1KeGRU7OyusOkKZXXfrs0tcYWuoi8mIKCH5Uf7sO8lAt
 huMBxpfx7Dy8/mIpe8b4DfXjd9jND0AjXKaodvzg1LYwvUEaQqgQB1XdJdraHQyOlHa2N0sAlsD
 0N/3/zumkBlbn6YAv2hcHv3X65viFIT3xcpJ9c7E1nxf+jR6W+MlRAp8+DdOpgNKAU9nIOyT7yg
 qsUgWNZADQRa/Xqo32r3ECxvPIGiP92tTd5SF+Y2sL0u9KRC4DWRlgfLdcfqz1F7KuWLHGPrVvj
 rIkVIBvIQ9WkhVXefSA==
X-Proofpoint-GUID: lAxALa8AdZn9k5CHQ7EM5UGHdEDyItt5
X-Proofpoint-ORIG-GUID: lAxALa8AdZn9k5CHQ7EM5UGHdEDyItt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234249_657485_118A54AF 
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

Some Qcom PCIe controller variants bring the PHY out of test power-down
(PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
towards D3cold and the driver disables PCIe clocks and/or regulators
without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
partially powered, leading to avoidable power leakage.

Update the init-path comments to reflect that PARF_PHY_CTRL is used to
power the PHY on. Also, for controller revisions that enable PHY power
in init (2.3.2, 2.3.3, 2.4.0, 2.7.0 and 2.9.0), explicitly power the PHY
down via PARF_PHY_CTRL in the deinit path before disabling clocks or
regulators.

This ensures the PHY is put into a defined low-power state prior to
removing its supplies, preventing leakage when entering D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 38 +++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 085300c1d1ec..9dd808e85409 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -532,7 +532,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	u32 val;
 	int ret;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -699,6 +699,12 @@ static int qcom_pcie_get_resources_2_3_2(struct qcom_pcie *pcie)
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
@@ -731,7 +737,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 {
 	u32 val;
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -795,6 +801,12 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
 static void qcom_pcie_deinit_2_4_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
+	u32 val;
+
+	/* Force PHY to lowest power state*/
+	val = readl(pcie->parf + PARF_PHY_CTRL);
+	val |= PHY_TEST_PWR_DOWN;
+	writel(val, pcie->parf + PARF_PHY_CTRL);
 
 	reset_control_bulk_assert(res->num_resets, res->resets);
 	clk_bulk_disable_unprepare(res->num_clks, res->clks);
@@ -863,6 +875,12 @@ static int qcom_pcie_get_resources_2_3_3(struct qcom_pcie *pcie)
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
@@ -918,6 +936,7 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1013,7 +1032,7 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
-	/* enable PCIe clocks and resets */
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);
@@ -1084,6 +1103,12 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
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
 
@@ -1188,6 +1213,12 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
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
@@ -1228,6 +1259,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 	u32 val;
 	int i;
 
+	/* Force PHY out of lowest power state */
 	val = readl(pcie->parf + PARF_PHY_CTRL);
 	val &= ~PHY_TEST_PWR_DOWN;
 	writel(val, pcie->parf + PARF_PHY_CTRL);

-- 
2.34.1


