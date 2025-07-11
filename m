Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3521DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGGgU4DJ2NcfrN8hvw/GoGHQliVmVsDsJd2kjhH8RkU=; b=PYd2LXwFCm0dt8eUTBwIB/GSXf
	KC885hjL6A7REHpjjUPyJi/Lax1XEpAluY3xdQw19/cenUmLJSb965qPf13/qPbpeyqjnEp5CweMP
	KDWC41iqGej/5uD7IkRRbz0D7hhWea6MlXx00XAYUTIwBZHbHzP7hDSsKJWjXJ+7HVr1FkbrBDfMt
	g1dm0s0qiKqEsxgYc9UFYd0QlQLmoZOWzTVDxPoZJGDm9oP5v0n3v6cS0nfk1ycs6eccy70uXj6So
	1vP0sppseiaYlO74SKhFBQ4mcd7OqCqS7d9Uo+k2lJedMjUPLxH9S+IDubnzohnzRM4ef3lXpBxOu
	RwgwHIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaB0V-0000000EUNh-3Whk;
	Fri, 11 Jul 2025 10:29:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAFU-0000000ELNW-0VCD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:40:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1Ye45014796;
	Fri, 11 Jul 2025 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGGgU4DJ2NcfrN8hvw/GoGHQliVmVsDsJd2kjhH8RkU=; b=l6h9MXJuvpx/Ib5v
	pRtKK9VDLiZZ2iNXX1ZzXJeqFGMQVYX9s1sAqYroI3Z+Uh3DYmlA654kPKDy+SJX
	AcW8k0bAg0vDMccj+9Vj6U8bXJy7tDYbVQKuDmNPOQjPvBMuJXw9nFb+cVo72h0T
	KVfG8IRs7lQuigdQFy6Xpy2vk5sRTPTdVER992JPeCgwAsAWrg45BR6UWU6DuUNs
	aTxJI1kCBl3JTcq3zXYPv1aYhOpzzGFt2qzRSKP0mdbSynlQp0esf23zD0sh25+K
	/Ro/QLfEP6XVjXFVDZpv51C/PNyNfPFzMuSwvyIebP9uswDwEjY9aP8tZYkN986t
	8oZWrw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafqxgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9elbG024466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:46 -0700
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
Subject: [PATCH v6 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Date: Fri, 11 Jul 2025 02:40:29 -0700
Message-ID: <20250711094031.4171091-4-quic_jinlmao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=6870dc20 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=o8tvhj6R3GUb89b70GIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lsgi5TDntMQAGnRQJ_YkxE568-sfiP3V
X-Proofpoint-GUID: lsgi5TDntMQAGnRQJ_YkxE568-sfiP3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfX/n87Tzr+je19
 jog1E8s2NDGvY7SXtr5YTnEAOIXHZk9zaRXtqhpXhnxBFqpMMicaEunovbY0mF4MG3rwgDSS8Sg
 0sBiUeMIP9dLwCmVIg+p/sfqqpPtkZAEvxIrM86tOAQLCNPmrO/PRNqRjDZwAUaoraNVmDW56p0
 meupjxrY7uEQJKOMHkc34l4xUiWljbxnomqscZU9fQ0n7yD0D6zd4j1TerMkvV7vfuHiFFLTWBR
 7B9nOhf615XD9Rz4veWixsS15AY+TkITAAzyyz7UypUL7ssOeRsz1dZzHNddiN/wgYFQ0FaOiMI
 J+twRPBwaEDtuxWje0KD+bToXJD9vcFv8gk/LRitKhvx5s+IsVhdI0LyVRNvO0VyuLwiv+jzvNj
 s/h7oeiCdqSCmQEnfEyLlJxMjstz88A0cq3M2SSRw1YJswI0aHgfUZQoT9pMY/iG1U/hLc4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024056_303938_2911F429 
X-CRM114-Status: GOOD (  12.41  )
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

Remote etm binding change was merged to fix the dt warning. Driver
changes were not merged at that time. qcom,qmi-instance-id is
required for remote etm driver to find the remote subsystem connection.
It is the instance id used by qmi to communicate with remote processor.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..bd78f6bc2fdf 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,12 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  qcom,qmi-instance-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Each remote processor has a unique instance id to establish the
+      QMI connection.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
@@ -32,6 +38,7 @@ properties:
 required:
   - compatible
   - out-ports
+  - qcom,qmi-instance-id
 
 additionalProperties: false
 
@@ -40,6 +47,8 @@ examples:
     etm {
         compatible = "qcom,coresight-remote-etm";
 
+        qcom,qmi-instance-id = <2>;
+
         out-ports {
             port {
                 modem_etm0_out_funnel_modem: endpoint {
-- 
2.25.1


