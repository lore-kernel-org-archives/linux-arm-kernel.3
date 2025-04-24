Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127D2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZSkca6FVMjB8QThz1Bi75ILFytGxDxolxzYbi88ink=; b=W1+9zw9pHJllX4yQV7wxh1yprI
	LPFsKi9gRFMXQAYq68nuaDx6y84mhDjPo8h15YqPyXhdi5sFtr0hlauhPDuTpE7SpXZc4tqcWhPVg
	x/xMsu82bwm7OArodASYi491Kdwy0Sql8+g6WqPsSSsMGhofhoCIXWScOvrf0qNzPVEbOKAcaHKqN
	rFmJpJTEkdIWM9y+TMpM/f07lkowdLNjA9bNV+QIoMHCyCOmrIIGBErZs3tM9d/8CJaZ4usB00e14
	gJlQJXZ+6sz11TAlgUYST/IPxBPhybPFh3lrcJT9EoLHw31AO7z9KMKgGAEldYHN4/jzuuD4tlZbD
	mHLJ6J5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wls-0000000ECVl-0h13;
	Thu, 24 Apr 2025 13:37:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vEc-0000000DwSp-1ySQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 11:59:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBop22012659;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZSkca6FVMjB8QThz1Bi75ILFytGxDxolxzYbi88ink=; b=bpfNySEAOU49RHCR
	rql1nHpxLCAH+vXIHfgJzBhZ5kEvBSyHbomHbxs9tmndJBmhtOLOTPML1DLWigmW
	SGb9o37r5BT1/GmXJ4EqFaHv5hlb30c5YvQoFYMeK//vNOFJgPsAiIJ9aWpQAYBQ
	ft/fHcVbOVVjNmSoMa7WZLDqqmOojPPTN/07j2RtLl6DEm40ENakQwKDSADbpulM
	dDLpkEWJrtpqiQGhMB0wvqbCq10i81ewLhlWeJP15u01Y+B2mmPGDUzR3+2ywdk+
	zHH2BgUONev5c680JyQva5g4vTvwnQrz/mV1E6fJ9/ebUC9laUhTPpYp9YxV7A3v
	FYPNRw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3de9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx9fJ031262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 GMT
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
Subject: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Date: Thu, 24 Apr 2025 04:58:52 -0700
Message-ID: <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uHUZutBLc-YHava4iQsl4pL12Q6G6FgV
X-Proofpoint-GUID: uHUZutBLc-YHava4iQsl4pL12Q6G6FgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfXxxQZ3EJHjBr1 6URrNKfamWqJ4pLh4CLNEn8d8FcoMR63W4U+AgnaD5Yw3ughwWcvp3FkpKoRPcYhJfJxHRzfPHr thqBS+PiH0tkfe7UOesZB+WABkQOijgFgSBHKoUpJeAH9GaqdVoTJRyIBnIlgIgZ+a/WZMfsjqh
 YUpVktaomRdikgWNOvEtHGexSvXf/Jxwxhg3mXQ53Em+7cmKHLFcr3Ip6UsYaz5YOMf6kFv+/Hj utQmNKXXDNRmp1U/Y2ItV51vmfWz26Vd2IQo72MyW9q+A8tPZziDcn8Om4j8uwXYru7GF8mlT/a kiSIgQ/vlVu2ml3XoIFdek4QcI0XoOrS8+YmFX50POzxhnDWCa3sn2G0L+ZxT0K+Qgfpkg4amZ5
 /NgcvUzdG9PSNaIbelEXQK88OgSNW0dEMO1qtksAWD8moVY4P5gRrnN4gutZMpw2OUkkLrHA
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a278e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2lVA9jdi9NyXBL0CGyUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_045918_520397_C78D367A 
X-CRM114-Status: GOOD (  10.93  )
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

qcom,qmi-id is required for remote etm driver to find the remote
subsystem connection. It is the instance id used by qmi API to
communicate with remote processor.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..947fe33738a3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,13 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  qcom,qmi-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This id is used by qmi API to communicate with remote processor for
+      enabling and disabling remote etm. Each processor has its unique instance
+      id.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
@@ -32,6 +39,7 @@ properties:
 required:
   - compatible
   - out-ports
+  - qcom,qmi-id
 
 additionalProperties: false
 
@@ -40,6 +48,8 @@ examples:
     etm {
         compatible = "qcom,coresight-remote-etm";
 
+        qcom,qmi-id = <2>;
+
         out-ports {
             port {
                 modem_etm0_out_funnel_modem: endpoint {
-- 
2.25.1


