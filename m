Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4263CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/qWxdxxHpThKGwDFM8CASPxln5OqgHWkEroR6zYclE=; b=AMu6iW5Vbqza6HioYmr396Hwx5
	I5cG6u78OSfFEg3uZhyDjmYC99toYXw9EbJ387QITtIHnBqjrTOvJnTYEXCnMgg9aSGJ6esdDwFGV
	AsKQXvg0pIqo5q8g1miLxcsP51SyFt/yRu9ynKPIIz9HpO86ARHBMovHnFRmcb6T+BwJIsDSpXfcr
	WlKx51Mz014Q8GF6sJr3vkrW+e6Ykfn79ka1ozODzQ3+QWx2ulpLTd9sEeDGEgNtsJ/adhWFXljqj
	fPas0GTFDvtPsfG1x8/JM0bm6ni+lcNjg965pVKPhxxPrlF/xahmrOAR/yOhu+zJni/5mEzuTCuw0
	jZZyXtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaB59-0000000EUvT-10Gq;
	Fri, 11 Jul 2025 10:34:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAFU-0000000ELNX-0V3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:40:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X5Lk001258;
	Fri, 11 Jul 2025 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r/qWxdxxHpThKGwDFM8CASPxln5OqgHWkEroR6zYclE=; b=jRv41im0TERMz6K6
	cKwypJYw1ma6gUi9HKnEtxktRCVpj+a+zmRYYkRcudQSjl7kRq/MLbKEwXpsW3Am
	+Knx/prnEKKR0+eTP3Q4XXQTa/HkQ0r5lM3JLjZ+EA6lrMpuhdvw2s22W8Pghv0r
	TjUiJTJEuvw6Fej4IKn4q3tuhUAaHUW5T1IWwHqYtglNNnIrc39RjyO4ZFNlPtz1
	msw81ORyu3xFJxGeBHREYR0gQrmFMrCQBQyK8Z8fLntByXf4snAlGymsMnLXuGVC
	Q30cCw7sa1RJBXTskdtp7RaYLlkQwW56v1wc2t8LE3bTIzSroKj+HsqHz80CoCwG
	McUEYA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnbhem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9ekkl024445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:46 GMT
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
Subject: [PATCH v6 1/5] dt-bindings: arm: Add CoreSight QMI component description
Date: Fri, 11 Jul 2025 02:40:27 -0700
Message-ID: <20250711094031.4171091-2-quic_jinlmao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6870dc1f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=VdmNJPKJaTtzAbcruW8A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wBzAz10I7jozGN_ABxDLbZrQ45FW6OgP
X-Proofpoint-ORIG-GUID: wBzAz10I7jozGN_ABxDLbZrQ45FW6OgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2NyBTYWx0ZWRfX/5aZ0rX3hiMm
 Ygico7mIjMw5qJYSMA+rbCmnojDxNnlbTHRMTsdGVzipZ82/H3Fr5f2us5ikRlpdhTj5o5t2xVE
 lJ2/d+hlP432htrG6nm9OxfLddBmPTo5fLqdyVnXEHberH9xFq8fWE071NqAlrmqhUNtoUS0r0K
 LbP+cYJ57TZA+XymCf+bXwfpfZJj8pL4NuOVWuPZklNSQMlGm6MqWHrGC9PZQorF8ZQonX40vSC
 j+y2rRgS04gvcP03RpiIB22CsVXrERX79qW5pZ4ewtklEi5IBc/kod/XbAs4/4r8dhYdn4FL/oe
 sVqv3JKT3OWrHXGeMThsud2FD34tjQ2QOeJGmcTAixSZ1LBjEVKk9HmAtOxA3PnZA1fuepSSiBz
 scQZHNEfYHHpJ6j/IXar/jiLkaCxo5cw4DrU7OW9iZSLzkJMF4VwQUF+ulK8AqgnnauDiKxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024056_312483_BF5166C7 
X-CRM114-Status: GOOD (  16.36  )
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

Add new coresight-qmi.yaml file describing the bindings required
to define qmi node in the device trees.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-qmi.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
new file mode 100644
index 000000000000..601c865fe4d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-qmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm coresight QMI(Qualcomm Messaging Interface) component
+
+description: |
+  Qualcomm Messaging Interface (QMI) is an interface that clients can
+  use to send, and receive, messages from a remote entity. The coresight
+  QMI component is to configure QMI instance ids and service ids for different
+  remote subsystem connections. Coresight QMI driver uses the ids to init
+  the qmi connections. Other coresight drivers call the send qmi request
+  function when connection is established.
+
+maintainers:
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,coresight-qmi
+
+patternProperties:
+  '^conns(-[0-9]+)?$':
+    type: object
+    description:
+      QMI instance id and service id for different remote subsystem connections.
+
+    properties:
+      qmi-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Instance id for the remote subsystem connection.
+
+      service-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Service id for the remote subsystem connection.
+
+    additionalProperties: false
+
+    required:
+      - qmi-id
+      - service-id
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  # Minimum coresight qmi definition.
+  - |
+    coresight-qmi {
+      compatible = "qcom,coresight-qmi";
+
+      conns-0 {
+          qmi-id = <0xd>;
+          service-id = <0x33>;
+      };
+    };
+
+...
-- 
2.25.1


