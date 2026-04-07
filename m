Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52BFFEEF33
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=; b=ZSuj1QnAyLqFQQU01UaVtOPZrV
	7HHvzHEDNaMxWgPmNMYE9o/c1xTAzJGO83yEAwgbGDpxhVN1846NxpwUlRq+pkzBOUtI3XCPZRGIr
	N1csjfl4giQy0aIUgu2nC1ZH0s5Y0coe++tgnzby+CKPlwGzsWvrq9Gag6pqpqZCtB5ycMOcFoVX7
	2aS+evhpn5x1VqzbJMpw+JkjnC7KjxCbUWYzJIJEPiVoTgTtL7tU+Y6W0c1NP1oD4bQAk2AY/xZvy
	+CeyS4n+vlNDwE5buYaqcIfQeto2LmqpoSEVp8MdPthPDk+WI93wDIaG3k4sNCgO6ncuVB+OhEXq+
	4AWX2fmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65d-00000006TPS-1XSL;
	Tue, 07 Apr 2026 13:03:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA65b-00000006TOk-30uQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:03:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376t1Tm2328042
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=; b=Lz5ZVzbcPa+zPuxZ
	8PAmGhNHX3aP2/zMbFaj1bI/wpj8xPjAKe1HEYaT0kNJRCzj4OvsWI5u5iWUWiEg
	kooZHIqWKDQcFmsrfU6QA1s3C+0UH6VyXBPyJyczmTvZie8FxxO27xfFxveuHfuk
	zTtnbAe283gRn5hAQe8OkG6d4LUOKxvol2Xa8I7vN+AfH1fSqgcozZLk5/NHcxv0
	9kpqZLSFrB+4//CeUpfRqLHQ4L0H+OmvBRa9kA6m9qRE5yFUzpLadXV/l8pxZtS1
	iIiQoE837F6p/DR4h9+2BxuNmjEUcbBLOehZaq1YYLznl3m3zUWA+i9IicSvUgBA
	oKyf/A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tssr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:03:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23c909256so71555995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567010; x=1776171810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=PWTXpXVdSbogqdv4/4NRgdvzcsYN73QSNRzMkpXeTAtbDNEhhlKFMs31cGZKXvw2pO
         NYoxWoPUkvsdfxgrYBePIbzicIg9c5VkN0/ewwo7xMlhPPGXBGiKZ0g2P2eioo7CoEOi
         c3GS+E1Ku0GZWoqXdn6L3oO2zpV7pk8C/LmBEv/eHBb3woqW8vViQJS1ND1sAzmsDwM+
         bFSidS09upDYtgBs5Dx1dzfAITQY965KcmqA3VOankR/YE2rylb0P9YxmhUvKW3GXSss
         W4pUm7lQ8Y1mIhVv4vwS6BvGGONzl0dS4OA6MW7YiWrORShNRUO8JR+n81IH393Hd9Op
         Oo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567010; x=1776171810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUOhnCtucPISnasSan3rTKScJjVUfYHl/P5qU80U71Y=;
        b=e7zmvnojQRoywDi8KAf55U1UGFWMIP43WOEEzNd7u2VbFWOixrlZTIZ9D0GLGu7a9F
         cK3qIchc8YyejzFLqE17rkg8oeELt7DjvDyE0USdP1ndHn90Busyf3e5Qf6Wof0iGwz+
         vsqEI31LflYqJ3yTFROcnv54oNE7Rgn6P52xITWOXd4vv8xWNoYwzrvJy6jF80Pdrqzm
         SfT45WlW6w9Y3d6NInrBSGa6wlNHQOshpLrqWRvf4ngEbvJJZSTTlOsPer+dLbR6WU4L
         gP20RAb3BExb65DWT7hR/aY/NxAao6e+3Hx8l36HstAYr6GG9RARW9U33yeefT2HTHEz
         wlNA==
X-Forwarded-Encrypted: i=1; AJvYcCVG1Xr+NmAPW7a5VUCtPYjNdhInTAIfWuolD2se0WWHIbuRcuTME011swcrxhP3kGH2Z9sPdbmmTpC6Z6ODvgui@lists.infradead.org
X-Gm-Message-State: AOJu0YwZjvw0c5u3W/k/XHp9/s+qWL/8nPD/VmIU4Iw+W0na0yR17JZa
	1EOolUtg453+O+lKz2HOomPihDDmMnOKQJlbVz2TNjiPdyAWyUKyJbPLTyO9XRQFpaHRu11V1Kt
	4lbV/bNuIc2P65hT7z5XnuwOHSUjBQXuLDT/5NFmlB5hVdFcWbDqhRhd5iDiqH+h0OSdYdD7MVt
	7yDw==
X-Gm-Gg: AeBDieu2O/b0Eni6pcXDR6OzXdx7ptvc5m8ceU/WQZuCuk/DAI7FmZ/+AX+6/3lj3b+
	gkluQQmtXUHE9xxk923RlyHAPwRkrHImRz/scG5HtLflhsySki88Eygk3F6OPxapU8zynOy0GS9
	phZPY8kJht+apqsdyYOK6dF8A87JxgLuL/vJqCAY35ZduT2BP7a8tPJx3X6jR5f/Ev9nSBNwXUK
	yptjJrXsLwpTfEynrfCcmHOnD+u1TyN0RXEu/oytYniF2jihXopgzqdWxmvTDlLBPz9uozVKbVC
	WbX70uut8o6uRUL7fywarrUADL03C+MjZTiTxKoIDbygGDl0n6tX3erAU3eJ4bF3M+ws30o6B2E
	loRBCIMs40OgbDDQ1MOonR9E3wG7o2+VDE0zCeiyb5L9Ak0+AD3/D1e8Y
X-Received: by 2002:a17:903:3904:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b2816ae915mr193382925ad.14.1775567010285;
        Tue, 07 Apr 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b2816ae915mr193381885ad.14.1775567009563;
        Tue, 07 Apr 2026 06:03:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:09 +0530
Subject: [PATCH v4 2/5] PCI: qcom: Add .get_ltssm() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-2-bb171f75b465@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566995; l=1941;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pO8vVScrKCYroJtbrmCEg0jsQAkeOLwy64wLlBodYLo=;
 b=M3puhT4nVYwMiJ7XYXSfcZrmSGJerFMTB6LFXEag8ihvt6K0hDXMWnl/7zCZKMVkQqDUhuKx6
 6VZ4rPuVn4qA5/B5oeAe+YY5sgXYSSIlGet2S5d3Rm3zsRU3N9wVOH5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfXw4O6ZnHPWA79
 L1QNBohKEoiGG1Bd3hquyfFO9ci93caeAARkLgQiGNCpHBFHNXThRqu2FsYor+w8AsunSucjYv0
 4WmbHBMz0U64jnggVkTRonlQHPEtGQQtiq1GDh3VijXc23hvsUpVqFkqxzByCCFudEaLVIUE01A
 +0eaYj2BC0RM3pSKaaBeTTMgPnlXZsh1559T6MjTMsGIh+unveL++BJjcMpxZJdyfuszseYKKCB
 lmV+BdW9DMAJebBPHD2cGtNmvClohGfaIJkYXR7MjWZBiD2BsOcoThF52LjqkWG27Hvh78K5Hvt
 JxWLd4jI1hL0bQuJsb9chU/a+EQ4d6zlSkm54vrIuYs0pLY7y2qxnpWKB/4PGNHgh1y+j3Ex5Wh
 comYKH//oFVppZg3TbnlWspZdoALhOLeKkdZQkfMUEmohh9mypOIkjtPcARBWvsNV/vuKhNVjJ1
 B4GUTd+s8b22vUUvm0A==
X-Proofpoint-ORIG-GUID: imCcVsfbLSB5K99Q-kTgjHi8O7VxgOZj
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d500a3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: imCcVsfbLSB5K99Q-kTgjHi8O7VxgOZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_060331_772966_5BA1D42E 
X-CRM114-Status: GOOD (  14.58  )
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

For older targets like sc7280, we see reading DBI after sending PME
turn off message is causing NOC error.

To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm(), which
retrieves the LTSSM state from the PARF_LTSSM register instead.

This helper is used in place of direct DBI-based link state checks in
the D3cold path after sending PME turn-off message, ensuring the LTSSM
state can be queried safely even after DBI access is no longer valid.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..b00bf46637a5ff803a845719c5b0b5b82739244b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -131,6 +131,7 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
 
 /* PARF_NO_SNOOP_OVERRIDE register fields */
 #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
@@ -1255,6 +1256,16 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
 	return val & PCI_EXP_LNKSTA_DLLLA;
 }
 
+static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+
+	return (enum dw_pcie_ltssm)FIELD_GET(PARF_LTSSM_STATE_MASK, val);
+}
+
 static void qcom_pcie_phy_power_off(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_port *port;
@@ -1507,6 +1518,7 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.get_ltssm = qcom_pcie_get_ltssm,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


