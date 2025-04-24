Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF75C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfOJ8F5WCfAl4G//Z9uP1v61ZS1IETkb5bfIARMIDaQ=; b=e3kwILEN/wOhqOHZNKV90JbH6P
	imXYbOE7y9deQpOJ1DNqT5HYSQy6ybLmlL9ROf2crmapvVZV+xm6uue4afdGA/uVv0IKK7DsIn8Hp
	nEpg2iH+m7jLrJQgH3ymjzUccwxPwaGao1yGQmMcNZHUxgRQEihTNXKQNLCD7CGd0FdQW+Xjnc3XR
	EC2p1t0XcyBfs/vtl/p+8YT/p1WrytGtNnZutGQRomfWCpuKGMZMKeRsPCPHCSescFl26FnbnYNJk
	rKkE1SzyryhDi28fk+rNbbU31ITocxgiclSna8hqfU2VlVs+O1TJDImHWgAQD69RyPncK4VNwvxW6
	sThEkcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3I-0000000Ea8F-2vqc;
	Thu, 24 Apr 2025 16:03:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vEg-0000000DwUh-0MpD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:59:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBofDx024007;
	Thu, 24 Apr 2025 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfOJ8F5WCfAl4G//Z9uP1v61ZS1IETkb5bfIARMIDaQ=; b=XG9gFkdc6qqHGcbh
	1h1bvADAXNbqcHskPfvnHsbg8IhfOT/Chli2cQzR11MFOuJlJJP1i+FslExzDCNi
	yEk9lxAg7ltMFsqx0EwpfytICRJg07ybNE2xl0pry++LkAt2+ytopRS58dLFpQOI
	koMpZLVqPPMEnAki2cplWj+Gbk84E+gB4F6PYSe0uIkUk/k3i3QAMh5vZT/W7mnT
	QUTmgmFNomCuGUhRTStMoLB3sTnk52LP4U1yj8rtqGjyuclHPTvQFw8T7tn00fu8
	VYd8hiTwxGP1aHMWx+enfoP6RYLpXOzrfcj1tfU0tvl3iWpfDDdNVKADD46vracn
	qUjk9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh15dq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBxATk016738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:09 -0700
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
Subject: [PATCH v5 5/5] arm64: dts: qcom: msm8996: Add coresight qmi node
Date: Thu, 24 Apr 2025 04:58:54 -0700
Message-ID: <20250424115854.2328190-6-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Klk8bjJZeWaNpKCsHmJppDHlvHPopqbl
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a278f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=_vcsFIMFqyRQzRopD1IA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Klk8bjJZeWaNpKCsHmJppDHlvHPopqbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX5umFyhSrWKfy fQx1Fa8d+ZIfAn5h04cip7D71EFf8h8oxGyzzncMnt5NXlP02EdIBpoxXzUdyjrZIBCxzHGHXPM U4e0fFyfu3gaSgoi8a2eYDfO4PXECR4i6ekxgFA5ovuIsDBzlHnv08a8sEt6NTcqiUp8WZ8nC68
 PwksXM/jp3/grXa0Kloti+HeigFZXQKX5z/hQb8YSfkux51M0qlXg/1zehcMYbG1wI7NQYoJE4T rCJKbble455JX2Pj+7kGuqAhVVgyOxNGT8tdhI7L6bPx9uc3dwV3xSfajlHZK6Um0VvExEDtDP9 McNaPMCX1v7d/iXExCT/S1JSGStnxEWujk3SFxoJ2/Nt3TyivzdapUFqpPTDQq7KBtDEzkDqxzE
 N0I9NnJ6+Yhu1YvNGxqXgGzRf6b5l1j0UXQwVXHfS3IZsr5sR4h21rSJb+o0QcSYSRdZ2pr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045922_246461_7346DF47 
X-CRM114-Status: GOOD (  11.75  )
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
index 4719e1fc70d2..d3bd8caccc0f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -39,6 +39,15 @@ sleep_clk: sleep-clk {
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
@@ -447,6 +456,8 @@ memory@80000000 {
 	etm {
 		compatible = "qcom,coresight-remote-etm";
 
+		qcom,qmi-id = <0x2>;
+
 		out-ports {
 			port {
 				modem_etm_out_funnel_in2: endpoint {
-- 
2.25.1


