Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E3BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RBCQZAQQ3qbcPWi42TsUywUHN03HVpohWHspiY+9TU=; b=fw0NWZMbjrcAgGI3i1sd8zWmUx
	P2Ya7+Z9UJv8o/nv2tLLr5H5TeVf0rD9uwszEebHd6DmbKltB7WyrGUGZhtiy1GO08RzNnlHzTVBb
	8F3V6BzV0+93IoD8p8gGSiqHfCA3QBOvkgEVuZtxvXsSbc9JvVzhen30cFzKPrHy1fxA9AiKbXzOU
	WkbbYyqQ6GGU8RqcCVSAlBqtSfZCLr3GFZrGJ9z2yx6HCmKE1jtNYf0b5xGA6GtjyseXE5d465yHU
	m/Z1UfqbKTMkCX7Mq+8kO822L0WuHoX7SP9i0AR/C1SBOGmXtnHqWgZJgnxPuHoJjZlX5pxK6DXN0
	SPN50A+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZpx-0000000195l-3rNq;
	Thu, 28 Aug 2025 10:26:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYuo-00000000xk9-2Qld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:27:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6RlpH016081
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RBCQZAQQ3qbcPWi42TsUywUHN03HVpohWHspiY+9TU=; b=LMiOlCT0S04iqj/M
	7w+l3wHyTY3M9Te/rVK14U4cUyYxVR0uN+cAgQzCb3pAcABaK3fZ52hKSLqLyb0V
	3gy+MtcermJl5oqY+A5Xrvbcms3M43cogbmOKvpjfzeTpOxzHdO+0u+P+arChA8T
	D6fDq/4a3E+jbvJUzHMQzzzd311QgmtA8VYBjY+3VUgi/ML8IrBF+w7zIA6T9Ci6
	WXW8Vm/5ydGCyE51HKa9SoSIcwVCuD98WpTqdQW23nJsva9kwiqCPb4qiU6bCr0V
	LCSeLS+k+Wearw1FKPxyjVxONSzynfdLVkFgn28M/7/8vs+pD1sLP4SfUHDh1TZT
	5oo6Bw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf208k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:27:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458264c5aso7105935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 02:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756373248; x=1756978048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RBCQZAQQ3qbcPWi42TsUywUHN03HVpohWHspiY+9TU=;
        b=Nq7zk4PcSCtv2i/lyljklZEvflQcpNBWUC8I6KoFXolKNllC3MFxfqlq8sp9IFGf5I
         Op8B0H6FqTxMRFLLHaBvF6wWrw0m0FAZTDBQVUHv3JQ5KrAXi3819+ajN+GPYmqc048V
         SwFLkD68a3Y+CAZg5l32mn29BL16y+WHiOSG+WxmGpETYDBuVYWusV+3fd/iQGR4aotU
         pZHWA25/RhnPO4lMwABjO4x1DQPxaLuM6msEV7dfnbbOq7wDQNIkRqwRs+hDbO1z4w5Z
         KxHb4SlfQeFoIvYOrtIKAvtg8bTLIWpVgrJHDn22V0a+JsraquKuFUH/11cnHO8fMo4e
         uLmg==
X-Forwarded-Encrypted: i=1; AJvYcCV8tCuotvpGVeuqyedZXRsqeWGu+lcLWINvXIpQCVGLxJ9lm51RsmKNeP9PZtD/hPW6y7R0S4dB4KfMI5BeuWh3@lists.infradead.org
X-Gm-Message-State: AOJu0YwPNaORM8cN+hPB+hKLMZ3ULnBhK4zX2A43sVTLnKo/372kxZC4
	b6wMR5wJFHfn3AJMcPZMl3So59GvVuYIhLggXKIj5/tciS8uMEQeAOTqj6WqnnfNs58pNz+LM27
	BshGVIQFz9Z6mslhD9rd6NqKQvQH3+PacCBJPvtxm7qdz5KbLHadcx1xvu8rM5s20uBs092hxXJ
	HnWw==
X-Gm-Gg: ASbGncuI8NTTeM5mDuxnOxoqpGIJPSvlZz0srtIeTOmuHjb0E8AwUL+Pfdnv42hNNBc
	lEJUrR/pj1bsIo4xPrpTJPkJwG9lBZLfGIQchn/NWzst7l2ORUwfXBPWwSV5JkEuWoExMk3zcH2
	yN5b9DnbagrYtOc0nM0B7wqzxu+6gm9ZIzBwBizqs6xV2EZuVDle5dTw04FmLKenVTdp1X8cnvW
	S9a3RHaSEb7jPf0kyHUgs1xot3xvMushXwyeCI91hBlujSOXXG5zVfP5BevvoSLyKQiVAaSQpPz
	X+kwfwajwvYBbPztBDYwQc8cJnBT3rPlXtJXW/tyQ3xhtD+njbsQcOYDKAw/aJnHTQZz4OeZUU2
	L//6TZqcLQw0dfm2D0KXk2Q==
X-Received: by 2002:a17:902:ecc6:b0:243:12d5:db43 with SMTP id d9443c01a7336-2462eb44c45mr315240725ad.0.1756373248074;
        Thu, 28 Aug 2025 02:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhgSpOuOEMqNem7SfvViYQxUPC2kynQsuvn/YrvRYMejOOvFbxYueIAMEDlNDix/TQ6ccBgQ==
X-Received: by 2002:a17:902:ecc6:b0:243:12d5:db43 with SMTP id d9443c01a7336-2462eb44c45mr315240355ad.0.1756373247541;
        Thu, 28 Aug 2025 02:27:27 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246ed91ee20sm92497015ad.136.2025.08.28.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:27:27 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 02:27:22 -0700
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-itnoc-v3-1-f1b55dea7a27@oss.qualcomm.com>
References: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
In-Reply-To: <20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756373245; l=3025;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ubXxXSq3HRpwyGgZB9pVBtD7LlF/Et+jBwYXGMM3AgA=;
 b=Zgwlt3jRD02lL12U66KU4jhzO1e2GLLqoZX5wl63ys0VNVc0JVoilJq8ycPw8K9YZrM2ChWM9
 6TEHNPVDzgxDr88uDQC8FjEDBveI9a2wEv/4o604J5gJoL0jiXMHGkV
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: SKWK8CGhcJcSc3mqMmaG_VKML4vJrY03
X-Proofpoint-ORIG-GUID: SKWK8CGhcJcSc3mqMmaG_VKML4vJrY03
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b02101 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=-QmmxQN2S_yWG1-YAlkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX0RRRAGF+PdNu
 tdOYbu00xhux1csYE8Rcr3+ke6e9T2Yj5QZuPfkKnhLgH6CDSkyP5O5g7CKblQORDqUQLEpbiPP
 8caLTRZ2fzt2yvSR8xoiz+oJi11gIFCUlnpZeIgQjq9wq05HfYpaex1szppYCqeDtP2CSHxtqBJ
 RdVZsVlkFZfPlEGkbjCe004lC9EcWbOWsGPtvvJf7lFBm55T4aw8QhVFhhkIZkzeoDSOYVqwKM+
 WMKNjXOFrr8Tcxa4/5H+SSZa5fZ028RMmhWYY83yxMBWcVEIrkp6zfmBI83sWu0bMuWKY7Mpzlx
 TiErGkFbmAhlGAOcmJIrd25OrI2hH1B+yJnhT0Vwfopeh1zR9+QsfsgQ2SGRpvBPGwgRDw5iCUS
 EscPGZo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022730_742268_5930C88B 
X-CRM114-Status: GOOD (  16.89  )
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


