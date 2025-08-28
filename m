Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C22CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8pQz1QIEGJgZvutXOiXYNtH4SYE0ARV5y1Y1rxJJgc=; b=ktxfsMn/MKyvD10YBddP5oXlfL
	+YECflnfqhnzAauXU/JP2Bl3TW3ymigj1GqDgnXjMJ69wIMLkvXLheK7CruNbzRjxrY1h2SuUAwl4
	BYxVvr1KDrvZCMJ7EfyCzmzOL4geKmFKlJOJ2f39F1kFia/d1p1BLhIEtF39j7xNUqZEz3tyLv6PR
	YdCtIcDvfAiecIS03ckH9LQATfjQgCPzKSr8mRT0Y2UfDBekznVrNYb/+6qKAA5WMq9JzIFZ/KQmV
	dIwpLk6yALcJOSskGS7FinJ7UTfbcyzM370G5Gl+0D5JGXBCOpLRioRsJn+DxY/62grNPznY5tD0b
	iSPnwbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urazO-00000001NW0-31Ah;
	Thu, 28 Aug 2025 11:40:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZxK-00000001Arp-3DsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:34:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5Vqo4015944;
	Thu, 28 Aug 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8pQz1QIEGJgZvutXOiXYNtH4SYE0ARV5y1Y1rxJJgc=; b=SNghZTfX5P/NIjRE
	g3OTI0S1VPHPe7deGgEvKD5pCTaGI49rgwJxvSEY4+JiSoi/AYPTcQNzloZrcxzi
	hxxIvlb9Ld4mlkkrdQ2BGKHa2V0es8r1hL2xx5Jp1NOJaxcES917+SzLDDSZcAxQ
	GsNn7XUjvejgubtEo5TocwWooylJKLNwbIf0wZBLkh6eCQJ7SDxECoDCcCp51ZRA
	6q0dVTAyxPw5W9jC1xdLs5vi1TgnA6ZCPOMFaSCjL4dqL0gs9bPioruBPJiiaMnC
	WJGyp4eyCvfUwTNjivSt53IVHB73Q/zF5G5H0R/cKUC5M/ue/p1LSCxPMN5N7643
	HLcdrA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf26gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:34:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SAY3BC008798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 10:34:03 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 03:33:57 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 28 Aug 2025 18:32:18 +0800
Subject: [PATCH v4 05/10] clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250828-qcom_ipq5424_nsscc-v4-5-cb913b205bcb@quicinc.com>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>, Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756377204; l=1324;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=c5DT48aoQZ7X1knBYe5rOYCGp5wD2CLxegvkvTJRTO0=;
 b=AizbfJR2Oz7kfLBj8JllV9ezzSobleg17Dv8YOwVDPo9dJylIoBSVZKuHbWWIO2IyLZDbA7vj
 0C0Lgq64i0YDqFPMG27qDBNkuFbYoxYCnoKL0vJzYDiygkatDK3BQ0k
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fP1gcbK9RQwOeUUdVoQvCUOFbmxOL3do
X-Proofpoint-ORIG-GUID: fP1gcbK9RQwOeUUdVoQvCUOFbmxOL3do
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b0309c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=PgHBclK_Yek0rHWKhOgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4uhnHCHkRBuF
 mcz/h1VjvQVP5We+U397741ycpndCWIcD4s8zO4/9IOERpcCLrd90Uw9XhrLxns/XsnuaiIVrNj
 vo7aRzD73w0lq0NaHK3uLJUocygrgBcPEQggp/dJwYFmEJTPBGRcTK2PKAbuXg5gE+2Eusn65Tb
 xglksKdv1KCNbPZfzz2mkib/i2mdguB+zVMco5uwyoTt74Lj/1YEY/id3iQ0OfIiRTcB9iKs9+i
 IhjoL4ggNi9awtAw/w2SrYSbvSLAyQ5yXbuNa8uVNsNlDgZYoOHZOjn/qlEl2EeOucY2WDojI9j
 mIa56ClNy5r7BF471AGr05q3U/mj1akbWswxz0lK+Gv6NXngXDQcJoLRHHUrMWf2/8AgsbTGJb6
 nZkNs7vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_033410_931648_EFB8088E 
X-CRM114-Status: GOOD (  12.58  )
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

The clock gpll0_out_aux acts as the parent clock for some of the NSS
(Network Subsystem) clocks.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 6cfe4f2b2888..35af6ffeeb85 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -79,6 +79,20 @@ static struct clk_fixed_factor gpll0_div2 = {
 	},
 };
 
+static struct clk_alpha_pll_postdiv gpll0_out_aux = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0_out_aux",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpll0.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
 static struct clk_alpha_pll gpll2 = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
@@ -2934,6 +2948,7 @@ static struct clk_regmap *gcc_ipq5424_clocks[] = {
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_OUT_MAIN] = &gpll2_out_main.clkr,
 	[GPLL4] = &gpll4.clkr,
+	[GPLL0_OUT_AUX] = &gpll0_out_aux.clkr,
 };
 
 static const struct qcom_reset_map gcc_ipq5424_resets[] = {

-- 
2.34.1


