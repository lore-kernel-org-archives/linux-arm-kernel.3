Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AFBD0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWjrqp89UnF8NqshoLlbQS5wpJVq1NqW54XTbTeq0QM=; b=Z25WssRats5EucOyz+dAbKGAu1
	pobNtFPfn8N+p8I3VDG7uHPv/8TZzblq29AjrWjRF0MX3fXmB0mibZ+vEvxK1OhtQQQnlgwivWRhQ
	w7aV/VLM7WcAyT/Pa9eXWE+trbeFSKQ4EVI4abdCPZyP0DbIi9Wis66BFxPPc2QFttQjVHoifSvbk
	8gQiGoYjePqVZGIfEXvooJzRYiv9Jpft7mI1ymiHg0umr4GCNuqZ5fp6rChCKi6S1rAoKkq4aJnlc
	79vaqZSzZydXYIh1w4vD9rLxxFkOE2fsFq7SHeic6jCIvtrmZ51tBINyGLEyQ0osA08qrCnwVMgyp
	MuhFGCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rzV-0000000H2MB-3ANe;
	Thu, 24 Oct 2024 07:10:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rj7-0000000GzCK-1Kbs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:53:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NLNEfR018287;
	Thu, 24 Oct 2024 06:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wWjrqp89UnF8NqshoLlbQS5w
	pJVq1NqW54XTbTeq0QM=; b=PQucspbUXZw21nm/SAf6lbfRXEScR8WHAArpkhiO
	Goc7MmWUOSlXNViwPF7L+sLEVRU5rGdsEJ5k/Ra9le6zjFRjBmvLGimGlIg0nnrw
	RAiR3HFs6yYSCl3qbUgvNTuOm9dziQaZ4u3ft0To9xlPMsvQX7+Jp6RTK2kHHbHb
	k0E5zZyXSLQT1KEu2yymFLqWBG97Vtp/wS0/tgZ2scJWHvs7ezymBnyAKPHqVlL+
	mX/40/MaBEQy4C82MBMYzhjddrNqClNkQIcSE5agvQOj4P2nm5JjtnaUet7wQJpx
	ajYeRU3VtKbBHPhuVs8KJpivv7Y/5OT3nm/HUgAOxuiafA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wcr1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O6rVjv029017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:31 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 23:53:28 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
Date: Thu, 24 Oct 2024 14:53:03 +0800
Message-ID: <20241024065306.14647-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241024065306.14647-1-quic_taozha@quicinc.com>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j0vMFX23KF9DHzKMoLouysUzy-su3SYK
X-Proofpoint-ORIG-GUID: j0vMFX23KF9DHzKMoLouysUzy-su3SYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410240052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235345_586896_7D8CA463 
X-CRM114-Status: GOOD (  12.98  )
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

The is some "magic" hard coded filtering in the replicators,
which only passes through trace from a particular "source". Add
a new property "filter-src" to label a phandle to the coresight
trace source device matching the hard coded filtering for the port.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../arm/arm,coresight-static-replicator.yaml  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 1892a091ac35..0d258c79eb94 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -45,7 +45,22 @@ properties:
     patternProperties:
       '^port@[01]$':
         description: Output connections to CoreSight Trace bus
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              filter-src:
+                $ref: /schemas/types.yaml#/definitions/phandle
+                description:
+                  phandle to the coresight trace source device matching the
+                  hard coded filtering for this port
+
+              remote-endpoint: true
 
 required:
   - compatible
@@ -72,6 +87,7 @@ examples:
                 reg = <0>;
                 replicator_out_port0: endpoint {
                     remote-endpoint = <&etb_in_port>;
+                    filter-src = <&tpdm_video>;
                 };
             };
 
@@ -79,6 +95,7 @@ examples:
                 reg = <1>;
                 replicator_out_port1: endpoint {
                     remote-endpoint = <&tpiu_in_port>;
+                    filter-src = <&tpdm_mdss>;
                 };
             };
         };
-- 
2.17.1


