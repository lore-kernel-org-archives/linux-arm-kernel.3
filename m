Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E63CD1D865
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=outoyhzSlCVgciNQRiTORWzm+1
	3R/w1XoHYm1tlmho4XFlbsAFNhqHbZIpEPXYijE7JZhDrkvWZQf17V/XjYA9F2XMSBVT/r6XQQJkC
	rkIrx26vGR/TGmeqwXmjuF4MUNg2NIY4oItx4tn7QNRS8wjocfzt0oycjVY9E8sdqecbiSESChVC0
	URDBMpU6/b/sOA6KoXgh/rfC36DEVaKgFbAZl7o8Vb45axnsI4unjjhsn5qCBetWp3nYNz31+i/bU
	+Qp7Co8Ttr+fY9WgoC852JG/J53EUGmzOyBvdTr3SaQXC6xtGuKZWACQ89wzttz782k+N8Cr6f7Kr
	Sb2JDPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BV-00000007Stm-08Jm;
	Thu, 04 Dec 2025 04:43:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1BS-00000007Ss8-0ith
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:43:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B42Lurd122739
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 04:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=ZQFTLZBfZaPoPoj7
	Vut/+qT/1pVJ1uLmGG7+VqmG+staSoK4hsXewHdpzYaVUJQRMfY+pSRlSHGr25kc
	SZoxvzYaZi6aTP3KpKP2GrmxxqJC1I5aU5RvvuMpxfOL92kH+baHWB9bJjgtMill
	w7bAHS6g58D8rA2PV6YnhXi+fWeqAQYE4S2aMQj0QgHAQOMgKq9sslvoVC6f/cwq
	skUGAAyMMYxr/RF8H/VEbs60jxh4FgKXJh0+MsFPSgcrs2WE2vR9+Aeq6/Xnbl2x
	tCkdW4//ajke4aOxu+ILdUrDiJfp4CZhij91cSR3pEy+H9aE4yKbNjY6QMo0FuJ0
	tBXSuQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f00a59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 04:43:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c7595cde21so991916a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823392; x=1765428192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=KnI2yK/TSDSWiiH11m9NvhxYnlAm1A5LeR6c0f8DNmDekdrvzAvjwsstyMbN50laUX
         QZ1J31Tmo+ern63J8XwiVR7bt/TaNKuH+4IbUmUAscNq1ZFdN71J0DAtJbTeGYf4DpjP
         tMdSp4mhPU6qUSojI+yzV5ivXXZalen5wDFRQkbgLBTI56ikqcS/R/ptADcAdfzuGezu
         2uT2vsMcaihlyrzMQo1bDZycfB3EoPMc5d+IZzKGclUmBh9hRFfuLtEAEFg3+m8lwPOu
         eS003mjITNrQXWB8+nrN+Ze3pqinoNscBInot1ETWU0cujQGDB34N984dDDbD09sr4aM
         GlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823392; x=1765428192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=qmOkDmQwnxq2m0KmBWZGGE2UD0HN4pb+i0StLbCslw4GQn3aLFwqaiuF6fDCzsXNkD
         IseDSnszMuxGWmh+QAoXnh1w/83wF4uLvXK3aCaUxsQA1NzXjAofseVeY8rIJV690sAp
         3o4F820sHsWqssi37JJin+Vbc7wMhf/mC6s9CiFa7Di3N+lKL19MgLlsmAtnzv5ooDUI
         1+7ZZkatBrQ2W/2BrTLJkfXjXlAr7zjYABi3xNFTWn6l8Bdz70Q2zlg+aDdhhjxfecL9
         v5gAUzRt0gIWKaL7G21o9gJkWwP8j+bax6FT8ThK7BR0KVI3Cuh8GxW6rATc23iQZp/G
         mTXg==
X-Forwarded-Encrypted: i=1; AJvYcCVPHrD+ZeN8PayxE5K5oEkYE+wBnWTkbYc/b3kMZ0x72gaF4RMgm2eK/S0AGD87Tl5X+Qzx4RNWaADYDb1JDXFr@lists.infradead.org
X-Gm-Message-State: AOJu0YxjhQ8nW93mrUgetVuqQyGolgK5qdKk75C/BFOZ4aQSnMSr7wT8
	O+ToGG7kl9+TdOPtGIyxebqgBsQJRwP8vqq2QXorXv3AayxZXD6eRMlBiEVTFeJk5wuOhFnMMRg
	e10O0A0LUUGWxDij5wlFWRGbaBiakWh67DI8uSwMTNiqCiD9LqZ5f51+pRAsT4pa42kpJ0etFeK
	P8JQ==
X-Gm-Gg: ASbGnct5NXIhvPQSyxrrw5P6x0jeezfO4beYQKJUSwhF1aF97jW/WNnMGT3IQv7NPFb
	lmbGlvCgVWyBxLqoE2IuR7gyoI9Wd+V0787TQ+bWAUTA4e/g1Z3skAd3kDfJeU0y4WQGGymysBv
	4sLxHB7iGY3ojrhtefD0VSgB6JMtR4DAsPKpv7UetiIaW52xTn8/i9G5bYMB6J890vD8Wx+/YwA
	pEe/hZ0UO38YLjSMARMgWdMV1mcZSXxzziFzog8xyI+Mup27tx57I+nNT1NXzp9CyqxfwPKFIwf
	EOR5pI+W/6KYZoDuB4DGX9ksLwruckgpV6MAyFJz20HoJxQU+H7gjaojEOnKhs+zNndXPD1wfFt
	iK+uRiXRxWdJpE/PKVi58xijBM+s+lIAn9xFRA4tiBT4NFqFxnZ6ghzAio7/D0zLwvDA=
X-Received: by 2002:a05:6830:6da2:b0:7c7:1e8a:c9d8 with SMTP id 46e09a7af769-7c94dbc018amr2232457a34.36.1764823392434;
        Wed, 03 Dec 2025 20:43:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlQI4J5ktvT4qDZHre6EgJd3SdtO9l5Ym4G402JMyQKGDhofxX5C5c0bcjZ28Z3CYWt0MNHQ==
X-Received: by 2002:a05:6830:6da2:b0:7c7:1e8a:c9d8 with SMTP id 46e09a7af769-7c94dbc018amr2232444a34.36.1764823392013;
        Wed, 03 Dec 2025 20:43:12 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm213766eaf.7.2025.12.03.20.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:43:11 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 20:43:07 -0800
Subject: [PATCH RESEND v5 1/3] dt-bindings: arm: qcom: Add Coresight
 Interconnect TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-itnoc-v5-1-5b97c63f2268@oss.qualcomm.com>
References: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
In-Reply-To: <20251203-itnoc-v5-0-5b97c63f2268@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764823388; l=3075;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
 b=5PQaJnoEfAdrn2uEA9wiEn+5CwF2jQPZQH/vTvT8XvYcTNIzXNIn+5B9MWwpkdvboOcupnyxH
 Pi2/SIdFHHQDecfz+Lwa1hMu6vBgWZWXHk1xArFqnarHdNIQlHu3Q3O
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: dxt76ohEyGxkuUSQCB-dTrqN8vOlms_f
X-Proofpoint-ORIG-GUID: dxt76ohEyGxkuUSQCB-dTrqN8vOlms_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNSBTYWx0ZWRfXyxHf1OT8VkPL
 +WuV3JfY5oywv+I/3dB7/MB6bTOYP/t0AKKWuHHJC6oIZpso24omqnSKslmVO2ixUwrfc9YVUnV
 q/BuFh0kF7m6ZpxLryB/nEXPS0zAjkG4YMDxjOXFCVgKs/v0jLdaQJO1PM3E0Y8UHIAJ/4NhWS+
 tBMigBc9+OjTtH2y/YQxUmWZXxPey+0fjYNaTf4zeL/heDwb52/EAEAEVICve9DDorRRy5lc7UW
 zJeOy7jGNgKhiyxlDtpNDwNnrIWkbQI560OfGLqF9noLwB2X6XehQqGY70jclT+MHoLxYj1UO3A
 L2LP+wNIzI1zDsJVpmZKMx++hhzpEs3xIx/YM3Ari6xZG8nHlsee4P8r0iic4Rqfmqq/Y/eH6VI
 HpXS0mEqPpQaCB4iJhW5cz4m41S5rg==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69311161 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=-QmmxQN2S_yWG1-YAlkA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_204314_334381_FF27354E 
X-CRM114-Status: GOOD (  16.48  )
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

Add device tree binding for Qualcomm Coresight Interconnect Trace
Network On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8936bb7c3e8ea267ca66e0cc3fc4dac33ba6de30
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Interconnect Trace Network On Chip - ITNOC
+
+maintainers:
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
+
+description:
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+properties:
+  $nodename:
+    pattern: "^itnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    itnoc@109ac000 {
+        compatible = "qcom,coresight-itnoc";
+        reg = <0x109ac000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                tn_ic_in_tpdm_dcc: endpoint {
+                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
+                };
+            };
+        };
+
+        out-ports {
+            port {
+                tn_ic_out_tnoc_aggr: endpoint {
+                    /* to Aggregator TNOC input */
+                    remote-endpoint = <&tn_ag_in_tn_ic>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


