Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9232C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjYjOpQG6wXtXCJvIxEpwaFMEpUUZrOepO0zheiglxU=; b=diRKgkcmO75GRIyJc9WMjnbdoI
	K2uuRQQUA/Ke7FWoK7U/S55jhoV8iWXKdeIu1Xur6pi+JZ1xihmhSnyFVTuofKEZyYSw4CuC+axNV
	dUFtzEl+MTmAjVCyrmbjdPGbYkQH+C7DGkuT4a5EFIbRzvpggjBIoURvwJP8g78xzCgT2jBht4lGh
	qHeMGJDIWyaNBMLcdZt6l3bol4oqqHbJ1pPEnfLH8HjIYLsCrPdHAKZF1R/4hLtuqxTCWoRLTThOp
	GmbKWQEjyJjYewT/FNC0offUxMUpanCA+SGFAyP8nPZcSXVRm64hCHL1yXYZLZcDBuiH42JKb1gm0
	ttWmwerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaB9l-0000000EVEi-33gG;
	Fri, 11 Jul 2025 10:39:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAFW-0000000ELPJ-0quS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:40:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XBeU016803;
	Fri, 11 Jul 2025 09:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjYjOpQG6wXtXCJvIxEpwaFMEpUUZrOepO0zheiglxU=; b=TmKS7jS3ffiRu3CT
	h7xpKc4teaRpZPBqCITcysWiwphbFdbRx6xASaQub1K8AMP6cgcF/TCWi7dvZbG7
	hZrPy8SVfxLjigo77Wya9JYi0bXQg35SkbEcXOE0TeEtNjQLSMj/UQ+zqw1hAI1a
	OAIfc5tz3GOIah8BtjZNVnYdTGWZFJXnOzMaZvPa5IKGrx8uwAsh894qgtn4BsLc
	djhHfg4wKbdW4ohUtwYuoLihAkmhXECSLAMvUrQfwarADNjx4jgAf6PZyaM1s6NT
	wo92Bavy70I4Q4U3j13fq+D4o7fA3wMKNy29vE+xgolSVBDRCxCVQGrl577P5pmb
	spwQ0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap82xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9emvw032125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:48 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:47 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: qcom: msm8996: Add coresight qmi node
Date: Fri, 11 Jul 2025 02:40:31 -0700
Message-ID: <20250711094031.4171091-6-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6870dc21 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_vcsFIMFqyRQzRopD1IA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FCtgReMf5prrPSWRqhkXqtcyb93TWRBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX1OxN1i0sK0v8
 CtwqUnNdknqS/7Bu+Dtyyb4ZPEwZ+Jgywdcemf1pAk31QC9MGtyWHaWzzCdQHYP4M/FQHXpNl+m
 1UIyLEtDyDPSDIT0xq2HNsPkHApol7wwACn7oS7gcbTN4TxN0jNL9uMrxswTTF55cxrCm0Pbqiy
 NfHMoKry91uaOjAVR+VcETJeEAca3k2BB6QJis8gxL950/qbX7I1ikJMVTsf1qlDTJ+5EK+eeEV
 OztKLWhqqAbvABw06tyjU5zRJ4sFiyYbdxHjTOH1VwdtAnSN8kV0RU725CJx/aqRAnOjWS03VLY
 yTJMeH3PPVjsUvlGLnxZNNLeUu/fv9AXUDKBMJoWjIEaqyjS6Ej4Tg9bl/HHJwT2yfYhXIsupni
 j1NmeUpvPDLOJjH+Lj3Rl5OfuQ1ySLSg4D2Lc/4Hh6plH99y9U+p2A4NtMETXpcth0Fs5Le+
X-Proofpoint-GUID: FCtgReMf5prrPSWRqhkXqtcyb93TWRBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024058_374462_BA298CB6 
X-CRM114-Status: GOOD (  12.49  )
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

coresight qmi nodes is to init the qmi connection to remote subsystem.
qcom,qmi-id is used by remote etm driver to get the remote subsystem
connection and send the request.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ede851fbf628..0032817825f2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -40,6 +40,15 @@ sleep_clk: sleep-clk {
 		};
 	};
 
+	coresight-qmi {
+		compatible = "qcom,coresight-qmi";
+
+		conns-0 {
+			qmi-id = <0x2>;
+			service-id = <0x33>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -448,6 +457,8 @@ memory@80000000 {
 	etm {
 		compatible = "qcom,coresight-remote-etm";
 
+		qcom,qmi-instance-id = <0x2>;
+
 		out-ports {
 			port {
 				modem_etm_out_funnel_in2: endpoint {
-- 
2.25.1


