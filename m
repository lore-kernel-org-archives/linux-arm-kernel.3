Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1981CCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK88bIxyb7opoCqG7E3Er3n2due1WnCsiMk8VTgRnkg=; b=2IbMZjUzW4F+/aaYdm6q0OccNB
	tDzRDAZEAnggbPOdA04HxOIjHfwOn7P6l49eu4diXfUbCjC701slnpXhHEVygZc1a2L7z1X64w0fO
	ffj7r5ID2s3JFK2M5CButgY3Cwors9DRAQgpNzJSfgrnYkQ0eKG8rQiozKVyWHuSn930U3H6PvPok
	dH/kvcuE//YaHY7gCIiDu3Mn7hZ4EY6Pjl8/bUe02z+aNTYvoAs4Ll9NZM42NQ9aSsHQ6Xn+nwgPZ
	amTaKhviZkyVg0JwtUb8oranFgttzq/7c3EtV03fkS/2YcdP/ATRlwV0YcBc0DQ09/fpefxVIcCRQ
	Y2Y3/Ibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw206-00000008uVD-3a6F;
	Tue, 09 Sep 2025 17:19:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvya6-00000007SR1-0P8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:40:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M1rd002266;
	Tue, 9 Sep 2025 13:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK88bIxyb7opoCqG7E3Er3n2due1WnCsiMk8VTgRnkg=; b=Cck1+ySG6KmwvRMb
	+xZOqT5qGopqZkTuPROUC/3VGwdai7RDCOvCiKrp/X7HMmllxAR6VTZdeM0ko2d2
	EUdIpScdIO7A/smfkfn35kRz5r72UduTOfgwmjENvFSDLA8UnURHluENvouuJvu5
	+h8NcJ+Nr4K6+LCONNtO+CvqMrT6yufsTc+Vt2AcnwHE7vV3wEv0Ym2a5Ky5Cg0p
	kgVoohgcdGblWhMZ/vAXiLsfxmm49EPdAOsqWHwn7wu86BwPLY8ARCzUuz71YsI+
	8NILlCZyiFw1y2aHo4A+s0hMfTgGAiiK2QJ5BFG8a5PlnwI78pbC/BB7oF/ua06r
	xhZ+YQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg071k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 13:39:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589Ddksv030654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 13:39:46 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 06:39:40 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 9 Sep 2025 21:39:12 +0800
Subject: [PATCH v5 03/10] dt-bindings: interconnect: Add Qualcomm IPQ5424
 NSSNOC IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250909-qcom_ipq5424_nsscc-v5-3-332c49a8512b@quicinc.com>
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
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757425161; l=1518;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=3kI7v3n2uneHPtTTq+P96g+GGegxV6qWC49TJxH8Jfc=;
 b=IZg0E44KGnEM3xNJAoKQWTbB+N6Ji9U+pMScNUAvLNUUXe3vyJdlY88ASgBADjwLdLw9D+Lnx
 x78W1LXWkl3CBQ8Z36FLruaE2NAoaMDg8fMz5edNb5Y562LvvAu08E2
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zC3QQY8tBfDoEjnQ23clOKg6F3AROI1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/1j+DvEvv3q2
 H80zNSJ12JCkKJHveCEsvmC5sQfqtsDaN/skOoQGzW3dnMYgRL/Hq+pwvQEbChr6l4jNJyajhY1
 RMNlVf4JTdarJiOvyqSLFqWjLlAqTxsvcusvnZU8XazBjCL4BrCSt4cJkw4DzJqUEQITiab9+rO
 Zecp8ADWueqGJRYY/IkJVP2f1dvLIZ+rx+GHmko+FOE1SS10OI3j+Vn3O0LBlXJboQOp2jBc9b2
 bTIFRIzpJC5VrJCpg9ZvuPXeXfJd4ogqNMI0TUrnpuWHHXjZS6jeB32BQALP91Nl1PiybZBV/yd
 GuIb2kbcubm5ffvS3+W7QQk5ehtN3bSaE6FcW+zWjb+yyhlzWFfliLUjM/HktaqLPkX0/qIoDTx
 ibuVfZk9
X-Proofpoint-GUID: zC3QQY8tBfDoEjnQ23clOKg6F3AROI1U
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c02e22 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=Qcuqu0ky38DJWFOqejsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_064022_148340_3F16079F 
X-CRM114-Status: GOOD (  10.67  )
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

Add the NSSNOC master/slave ids for Qualcomm IPQ5424 network subsystem
(NSS) hardware blocks. These will be used by the gcc-ipq5424 driver
that provides the interconnect services by using the icc-clk framework.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 include/dt-bindings/interconnect/qcom,ipq5424.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5424.h b/include/dt-bindings/interconnect/qcom,ipq5424.h
index afd7e0683a24..c5e0dec0b300 100644
--- a/include/dt-bindings/interconnect/qcom,ipq5424.h
+++ b/include/dt-bindings/interconnect/qcom,ipq5424.h
@@ -20,6 +20,26 @@
 #define SLAVE_CNOC_PCIE3		15
 #define MASTER_CNOC_USB			16
 #define SLAVE_CNOC_USB			17
+#define MASTER_NSSNOC_NSSCC		18
+#define SLAVE_NSSNOC_NSSCC		19
+#define MASTER_NSSNOC_SNOC_0		20
+#define SLAVE_NSSNOC_SNOC_0		21
+#define MASTER_NSSNOC_SNOC_1		22
+#define SLAVE_NSSNOC_SNOC_1		23
+#define MASTER_NSSNOC_PCNOC_1		24
+#define SLAVE_NSSNOC_PCNOC_1		25
+#define MASTER_NSSNOC_QOSGEN_REF	26
+#define SLAVE_NSSNOC_QOSGEN_REF		27
+#define MASTER_NSSNOC_TIMEOUT_REF	28
+#define SLAVE_NSSNOC_TIMEOUT_REF	29
+#define MASTER_NSSNOC_XO_DCD		30
+#define SLAVE_NSSNOC_XO_DCD		31
+#define MASTER_NSSNOC_ATB		32
+#define SLAVE_NSSNOC_ATB		33
+#define MASTER_CNOC_LPASS_CFG		34
+#define SLAVE_CNOC_LPASS_CFG		35
+#define MASTER_SNOC_LPASS		36
+#define SLAVE_SNOC_LPASS		37
 
 #define MASTER_CPU			0
 #define SLAVE_L3			1

-- 
2.34.1


