Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF26C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52DetiHDy+EEyofP7eCcDOEDmNxtXnUpHp9Zmo4Im6Y=; b=wlAiMNEKyL2KlxGhBEUhDXEVUK
	TheA06S1Mp5xNRj7VH24FX7dBKo+gnINiYE8zXLuB04PXOEw1pyOzQF0kE/MAJYtZX/ZgLwy5+dCJ
	PGrCPrxpDcna7fMaKCM/Q1MPnEIUQOuZM2LgOH9FTw+V5pe30tCWYBG47XnktNSfcJrVJyRUqkk3Z
	OLRZo8dFBq9RsM052OTmzcqoEmpASCoXiBj/U9ysR+uklAB7dvf9ZzPlwEh/XB0XosAJbc5KxuvWX
	2q6kn5e0FUvSM1l/N3kTiudwOugzTpLbzXXfD32l+naT2VIetQas3Jpi7QyvDnsIK3aGr1jZR0MMH
	T5OEaqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVQW-00000007BgO-1ufk;
	Tue, 17 Jun 2025 12:28:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRV5u-000000077st-1Mto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:07:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7IOoQ022048;
	Tue, 17 Jun 2025 12:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52DetiHDy+EEyofP7eCcDOEDmNxtXnUpHp9Zmo4Im6Y=; b=jkhD6iKiP4hJ3Ipe
	OP99G+sokXV6z9ZdTmeM4lw6byTiYJQoYZlEgwiY25bdxUpTDdvgWKE8ABbV1toF
	j6pZEjDLhf2Q6kXZari+hj9SCW5lEy+Il26SntCg2YH2vuhD5P+6uCzQzkftVN4n
	YQ6+QnNvUVRrm66b/0ukCB4JsP9+b+b0Rao5lMfa7hMbSst/rKjNsvfIgJ+q/+z6
	ljHpRNx1CnnyO411LQh7ufYH230ekiVgE/2ROkfyw6d5nmEAaZthw1doXCogLkNt
	M4snTiJuNf63imnHWyyctji9GCGilwpSootYkZt+2z9A/iF249vJXJbPfA65cRvi
	EuMbng==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791eng55t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 12:07:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HC76Lc011556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 12:07:06 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Jun 2025 05:07:01 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 17 Jun 2025 20:06:35 +0800
Subject: [PATCH 4/8] clock: qcom: gcc-ipq5424: Add gpll0_out_aux clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250617-qcom_ipq5424_nsscc-v1-4-4dc2d6b3cdfc@quicinc.com>
References: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
In-Reply-To: <20250617-qcom_ipq5424_nsscc-v1-0-4dc2d6b3cdfc@quicinc.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750161999; l=1324;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=rVxUYZt30JbUgTHiydiH4HS5PHlIBURdEyNy60h1YkY=;
 b=eTmnGV1ItdAeCnt8BLu5cd7D6Z3D/cXvgVZSYEF29eqGF92rBq0B7al46uK2bpWjW5HBrSMzX
 w9WlkKcfRQsDMgitkF6nanpq41yWWULCPi9ySs2qyKeXZXEpwcmqiCD
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rq7dwFXoby_aPxP_PrxZ_evQQ9KHBYtv
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68515a6b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=PgHBclK_Yek0rHWKhOgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rq7dwFXoby_aPxP_PrxZ_evQQ9KHBYtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5NiBTYWx0ZWRfXzfcO3bvRDurB
 pAlP+OGRSoogFTiQgNxUpXiCBZtu77aCnbGkS0N7FtaFnVbTj+fqm0oTPFGC3mdbSXSEweL1IVh
 KzxDCpTUM3Qr8PMYM1Q9fltESJUWPhBdjWqI6Irfges7ZAjgH/oUPPW91GA0xB8PH8Pxe0vZMNp
 tFIBGZ0ger24EwH2TJA1ATb976tdT7CEgZ8CVI9rpYFKbzjat0IYhKQMLRrrru6c2RWPKIa5vii
 5K7IOiBRdECaZpX4oGjDqPbNZqG+mw0cu9MY1Xec5JBYVkMIG+kfBVtJleg1RcBB1pbBfA29Zm8
 BB8NtosuRXjAG2LmJ8IMPFS8qw/DOuD/MzvfE83XPVkL+J6zDG4sIZTEXmf/AjCPg+wNIW3ee65
 LL5F1kQ018ssOTa/5AOTfujPVJkuI0OJ1QLBdwrkkATuO/9nUFokx3qJzmeUqOoUM0x2TeBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_050715_438892_2438292B 
X-CRM114-Status: GOOD (  12.37  )
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

The clock gpll0_out_aux acts as the parent clock for some
of the NSS (Network Subsystem) clocks.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 3a01cb277cac..370e2e775044 100644
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


