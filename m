Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0ABCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yd/oPuUfVOJcMQA/lTcKzDkbSGoGxeZhh5S6dzLVh+I=; b=BvNPeyxM4J7JpSp+ebbvvdx6tt
	DB8KDPbUPC+EL9xmXg0yJVuHyvWk6dZjt6XU9ZryKoMGxi+FryhTUKpTgx80r/bNBWIze5JqOTsKk
	3MTVlPqH+wIQvbUDvVVG/FnBd5LKfDByQ7aPHS1BkqFXOdlEJabkPnsnIN+CITMUJC8HzLgG63Qpj
	lPeQ4lVCPI1fSzIkeL/rqCo6hzSkBRWAaIFlcNzWoGWjJk48oU4ZclkpzVGWf4RrZMrv1XLXo+PZm
	iVskHyzyLcIASp/UevH5dEtOqHvrTS9uI/sck/ED/NquMfYSzJ1BMDNLGHnL6Q2hbT0uXs3ANrhxK
	5Zp0NU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zp-00000008u1M-0Epq;
	Tue, 09 Sep 2025 17:19:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyZz-00000007SSE-2FTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:40:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LR49009159;
	Tue, 9 Sep 2025 13:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yd/oPuUfVOJcMQA/lTcKzDkbSGoGxeZhh5S6dzLVh+I=; b=bq/pHbki52n+xlpE
	YPJ324wYDd4eq6QDmKcf4GXVJiszfNFz3t/gg4FPsISNDVKTuO0+c1BQGNpUBZy0
	pgJu6hOH10Vwq7EZNza4MUUU52clxkOJ1GbzesJg5r/hvLNw8xp155HrRbnnCVaM
	2xz+Wf/D+3sN2sAiQs50kwuUHSfxqotOfXUXWI37JGmdLTcMtVxZwVXgdt7oLaIK
	gzAm02A8i8YUhdQYXR8FI1YR85GHxTUlFED9MdUi13ECx2UWwjXFEdReJx1NjPGt
	G9RkAZQhMxXZMLisVPK830mIWjU5gjRdGl8kPxHItvfMdEV4A+7aQkVlZ2oH06KJ
	7iBATQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdw5vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 13:39:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589DdqZL022907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 13:39:52 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 06:39:46 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 9 Sep 2025 21:39:13 +0800
Subject: [PATCH v5 04/10] clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to
 use icc-clk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250909-qcom_ipq5424_nsscc-v5-4-332c49a8512b@quicinc.com>
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
In-Reply-To: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
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
	<quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757425161; l=1747;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=NlXEF3VmiXF2+P9u5NoblgQUs0TpNmThc3On54QrJMw=;
 b=6rzlGrtf5VhelZUnQeSdhadmQ0GIDdRH7Skgdahrg9hSitkSO+i7pqegpxcL3hyrJnwKQ+IHu
 pIyIV6y/E/zBH7izgJW0shEFonjzUJtrsD5W6qfWXotJ59+Zr3hegHl
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6n1DAXKtfqOxuJKqmubf_sc1-PbXpfnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX80FPbKVtPCXK
 cZwGom+2lhm5RF+56rWVvNKPdSyqsXhDpAD7TEdejeMGm5BKx5vxtVWfjF5++MPvMZPcE54tZkQ
 YqmIcbHLgqUqbYRdG6nnwq94Sk1KetllO2qSGTXgOPE/HWtmDhv5OLQWwNLVRPJvxCaqyDgIM69
 Q9bogFwA9vuDdlXamwm14X98XgAUCKLdCfaW/1NIWKKXjl8unqB+FyOmOhxEfb+sX59EiSsOPpv
 k9gac+QzMkUVAcH2b0o4bkkPQzJJ7VLSKaNhO4ykOCYVoKL4PbRXQeWOnvLcOtsSGz4HpttXyfB
 I2+5SHDfS/4JWLCtoFEhZadfWxX8KJQb4a/cPmrdppvq6vHnd0eZx+gIfM2HvemK3r2Hro71Phr
 ymIikCZu
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c02e28 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=gl6uzLfi5yNa2Npxn2gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6n1DAXKtfqOxuJKqmubf_sc1-PbXpfnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064015_601770_9FA17F16 
X-CRM114-Status: GOOD (  11.93  )
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

Add NSS NoC clocks using the icc-clk framework to create interconnect
paths. The network subsystem (NSS) can be connected to these NoCs.

Additionally, add the LPASS CNOC and SNOC nodes to establish the complete
interconnect path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 71afa1b86b72..6cfe4f2b2888 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -3250,6 +3250,16 @@ static const struct qcom_icc_hws_data icc_ipq5424_hws[] = {
 	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
 	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_CNOC_PCIE3_2LANE_S_CLK },
 	{ MASTER_CNOC_USB, SLAVE_CNOC_USB, GCC_CNOC_USB_CLK },
+	{ MASTER_NSSNOC_NSSCC, SLAVE_NSSNOC_NSSCC, GCC_NSSNOC_NSSCC_CLK },
+	{ MASTER_NSSNOC_SNOC_0, SLAVE_NSSNOC_SNOC_0, GCC_NSSNOC_SNOC_CLK },
+	{ MASTER_NSSNOC_SNOC_1, SLAVE_NSSNOC_SNOC_1, GCC_NSSNOC_SNOC_1_CLK },
+	{ MASTER_NSSNOC_PCNOC_1, SLAVE_NSSNOC_PCNOC_1, GCC_NSSNOC_PCNOC_1_CLK },
+	{ MASTER_NSSNOC_QOSGEN_REF, SLAVE_NSSNOC_QOSGEN_REF, GCC_NSSNOC_QOSGEN_REF_CLK },
+	{ MASTER_NSSNOC_TIMEOUT_REF, SLAVE_NSSNOC_TIMEOUT_REF, GCC_NSSNOC_TIMEOUT_REF_CLK },
+	{ MASTER_NSSNOC_XO_DCD, SLAVE_NSSNOC_XO_DCD, GCC_NSSNOC_XO_DCD_CLK },
+	{ MASTER_NSSNOC_ATB, SLAVE_NSSNOC_ATB, GCC_NSSNOC_ATB_CLK },
+	{ MASTER_CNOC_LPASS_CFG, SLAVE_CNOC_LPASS_CFG, GCC_CNOC_LPASS_CFG_CLK },
+	{ MASTER_SNOC_LPASS, SLAVE_SNOC_LPASS, GCC_SNOC_LPASS_CLK },
 };
 
 static const struct of_device_id gcc_ipq5424_match_table[] = {

-- 
2.34.1


