Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0935DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEdGbWq87BOSltbprYnwWF4RZ7he4+5VSXWrmFWd0CY=; b=4c7Jo76bXYOX+Q0ySqk5YfGQIK
	XIjvLvAVDln95/3ZOvDNbReStoLrP6XX4FRZgdC7jXbP2TrvDIQJDBuACqT6LtcAlXGaTulpT3d8X
	NYNrGEmBqkWLcPgpO2VGUvlnFX9+uO6OAXEb3KSeuIzqqa5VdptphWX62QJ8cjET8J6NvSohNuvcA
	mDtQkJZJ8nwNdDyoo7QQDqijLzUwwFRis4GIb4A7DKEm4f273mv8+5ivc7nwZ8bogRWnwZJ0XuS+7
	LdUZxSLwpCc8W72XNZiJ7i8F92wxrpKe0CQ475kOLpjRN+whRSYrcWSVrFUkYwHJZj7O0lz/nBY2L
	xAcqCXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLNS-0000000AQJU-1Kq4;
	Tue, 19 Aug 2025 12:23:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJZL-0000000A7x6-2suB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:27:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YsB023038
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEdGbWq87BOSltbprYnwWF4RZ7he4+5VSXWrmFWd0CY=; b=npO2sc595+mPFs1p
	bgeSg/6YNoGqKUc/Z/J8ljwS1T4mMQEj4BidSafIxAKwCsI//V5k+JBBFFTLkK2g
	gM4HeVAP7Q4kcI1T8L1LEdTxccCSttvC7fTC/Rh7/KiDg2QiwHqnWz5jiofaxof4
	4CwexG3Hc6fYVbZq2Fl/EPG+AJouiy8BLzCWM4uHLaG3nrIte/O4rJhijGTYoYYQ
	f2zO7gsfxNun7vzY5l0u141BrOmZ3FZL56Tb763CyjxzCI5YvXIKggQ4gSnjL7Sb
	8MtRcZVsvll2xf9h2T35FQhKiI+bNyNW++tAuUotXXWD+soAYXStkgYZNvwliJSk
	OutH8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5huv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 10:27:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e2506aso4866708a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599274; x=1756204074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEdGbWq87BOSltbprYnwWF4RZ7he4+5VSXWrmFWd0CY=;
        b=gzbAXF9dCH4qnyCesukaVepRvVwsbMWoJRRkJsLvhk90XE4fz5E255ZdBcxowuh4Lk
         N1QGcI0VSg8ofKAH3VYEmtGFI8Ee6VPVvYzRrS3isEehtkmEjZxmIBJlgZowjeBo0bAb
         MrpHZTYyodePXma3+anUDf4tjTcf8GKIAUuRmyCE1mXVEkqlwvawcwNZbn57LoMazr40
         hdENm6FtGkhwcKna8tY3p81wtg1XG1emxgwr+6J9mp033NJOyiDwUMXRGi7wVeXZggS6
         fYw2h1JlV4IoCiLMRBRFRQQLTi69UJRsDy9yijMfGHzbRu2Owl1+l5pMLXiWOk53jNXs
         n5zA==
X-Forwarded-Encrypted: i=1; AJvYcCW5hzvSZjqNJ81j9PgR3T5QYApqJ8zcTmX2TOS4oGxtzVbS/NAEs0+aesZglXc4s8tP2vpFdkXE6iD0KOSyTJeG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0+o1c/qswlJ1f2nqvUyo2G2X4sCxfwQ2YsI7Cb7mCNQ1TGi77
	Z77H80hrHp4PtNM8GL4wiGbGioRFfaGYkXBpCbXeoDf8ESPB36kphCvdpCyNlaXNfDnJ6Wpg1eF
	Y+VpWhvYuXt2DsVDIALNzGAIvVp4qfaDnUcSiyqmv1DMQ+0cfx+SMpqsmaju1TEzz3jy206IacJ
	1z0A==
X-Gm-Gg: ASbGncsEX3A1HkWoCbjnf3fXtWGus77DUanUJhuukd8v5z1LeMeGgj/pWABnU6IegZ/
	u/zCPkUd5xxIZEhLJnKnwvmA8Sk6ZSeKqqnJghUurxo2NcOP/6mC8cvw5UQw0c+o2GyuJ5XOAbg
	6mDea+tkxjLj+GINtCmXeMKE0mxUu9aauc9SKKqtJWfWNmMml3F2AhlrkUsNYx5qrS5qKmrqT/9
	6bkHqH/NB8DPntXGz2HOi8ljO4vRLR9U19LV5fxELNH7pe2ESy/uoqP4cGNC4SImLWC8y0R59Gr
	351/HZ4Ubm8QJDLqqRT7hcFLQiIvIjclmn2Bh1wEZjuVnravkVmZlXQAuRB+RKG8UFPJEM0ky5j
	5Y5KJC5tmP61CPWH0OJ/hgw==
X-Received: by 2002:a17:90b:3ecb:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-3245e5924bemr3339733a91.12.1755599274380;
        Tue, 19 Aug 2025 03:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzH9MaydU+HiMP1j8Tl1S25IjTE5wgQq+251PtIAOURf+OGaUlPYSwcZfx6cQecBKjY9tovA==
X-Received: by 2002:a17:90b:3ecb:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-3245e5924bemr3339703a91.12.1755599273837;
        Tue, 19 Aug 2025 03:27:53 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3eef8fsm2499643a91.18.2025.08.19.03.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:27:53 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 03:27:43 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
In-Reply-To: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755599271; l=3133;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tQ05n+agtjzfIoEEl+pcrxkf/9blP9P5GoyB0C6eaAI=;
 b=mE9YPIyAqbS6QDWBbNpiVAJTT5ZFdJCGl4Kr/hB6l8eARNZFh2wAEZsPNQez9E0hDyfhjEt/T
 diszuxdhqtwBBDF4tFwXf4zjLrwbh75feDvrqqyYilKFG8n+m+vwSF4
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a451ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=SwV635huW2jmLeR2jBMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: iyJQvkgUNx7GaL2ZdktCx0WuXP90b57H
X-Proofpoint-GUID: iyJQvkgUNx7GaL2ZdktCx0WuXP90b57H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfXwdFlIlpslvnH
 r8StHXC07DSoAYcP0TuxKabTy2Ltd4uIfka6f9j560vTt85k86lKa1MbCs+/TcGnIcYUV5z/GSA
 IXzCeW+epBIC83TOMuu5H8s1uIrbdjOuTMhoo+G2rM7p8RzWGapk94YG1nakqh2abqA4vXRGCBU
 Z4fTfjv/VlHskgmn84MwQopzbE0lrCAM69X64nQ/TBulTG2fSPPDXgvxEw6zdO0/FB3C8s7ZhVS
 zZaZQRlp1MnrpDBqeJMcjr36eK6xRGlOa6pS+k845C18C3dYcoNKsGLZKD9lEGsjhUtVJgBSWqW
 kqDwsR10DsUOWlZz3G/uesGTQs6y15zweG9QuJirO3Lrr9W2DC12BLo+W0NVB5ZWAsG0UmewSKF
 SfNmSyuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_032755_741077_96F98B85 
X-CRM114-Status: GOOD (  17.57  )
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
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3b5f2b949f69617a014d0ae2831c9c767178f8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,96 @@
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
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
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


