Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNTmoIT+3QSEdOQTRVOgb+e3bVVubsrbyt1Z7+uuZKE=; b=H8O6neT59BYAbgiecgEEiBXHH9
	Mchx/1E93IT7BuClWcSkhoGXhGQ8204DgzQxkFci/PQI0zK834N5wJvIBC0fDskP1t1JCWSZGc8c/
	y3HaVij2/7FHZivetDBoKWcOrzqdQ+cDAm41UVOJRjWHk9yICkTaxyYErKZvbME/9Y1C85X0Llplo
	JB0nmDOlJ6sIKBKzXbo/OZYniGsIwA3Nuj8Bx+OiLbH5tpN1yv0QxlknRWZ1+Bi4CtUupRdvLX77u
	qGxucYga+Ok+jHMDIlgMIN1dZJjbvJ9uzz7sj+DcRlMsFO/Tly5CfP0A7veabvULWG/WHA9zCsCKc
	fUm9G0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwgK-00000002smw-1Wyq;
	Fri, 15 Aug 2025 15:49:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuKF-00000002ZP3-2FFX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:18:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9lrRR010953
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNTmoIT+3QSEdOQTRVOgb+e3bVVubsrbyt1Z7+uuZKE=; b=a8vGIPbUhBbv7WyP
	cXShsEKMilHW1xOWWDfq/frwKaFouOlgq+znPSdndqnMeXEqf2oOZi0YizC5mtli
	pApWXRJLOdBDybEi5HmgzJU7tAuees+ThcwE9xR4312mYu4Db0OyjzTf607ZaW8C
	nXw1bF31pBZ48fxY7ofO6QMaKIjsjx6kT+tsRuRc4OSVA3bChwxgGwcpUocanaGJ
	FDeWCq/dqiABK96S47nWAFM5VGnxPfFuQPcPQ7om8Cvf8EsSo4IPR8tehzGh3i5M
	IWzex0WH9zOBS8tBHc6wIPauDRRM8d3bQi/jgXBKegUTq+FM4L4lPH6snQMWCdWI
	3JDFaw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t3b4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 13:18:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e1fc66de5so2583725b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263910; x=1755868710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNTmoIT+3QSEdOQTRVOgb+e3bVVubsrbyt1Z7+uuZKE=;
        b=sJ/eBtPbvujJbcVJQx905adIP2PTBErxzISjYT4AIST2CxgFaGw2wJA1kJyvp/ez8C
         hywcgFUASt28nmi3BqDtZksDixcJKqZ9r42ItP3YhpbnjRFdHOJsQtAbbaq6NY4jbsYT
         XNdlh3kdQvHQuhfxSfPeoVnMrtHTxPFzhs2IZ5HsTexZa+50Mw9QqmRI/sFDd3jMk7Wh
         AA2tvgSHdJE4jsW3eGalZ6ezXs12f6/FiJFRBmawnh8E9ncJJfpYg7eCDdK1MxuyT8+j
         vqn7PQgLEodU6STiUmnoQHBeDi8Ifx+izQiHG1RhUM7Lo34eQzRAF9auzHrHcBq1KXxk
         bELw==
X-Forwarded-Encrypted: i=1; AJvYcCXWj/LTMhnZOxwiFaEhH77g+WQ4xp/OFk9k5ExvVw1W9EndIzMvkjNofrinG1xxwaPWUCgjhFgJ+d4npvR7P1kU@lists.infradead.org
X-Gm-Message-State: AOJu0YyupeVaijuTTojpp9D95C5jSLgZYhD1T3aN4A8+xug1TR6LmIhm
	TtQvjafFmWobj5R0K4tIhO2vxJs8qGasrWc3YTR1G8/vOnsFnFXdQKTr9c2NmDScQ4RbrRK2E/M
	+f+Gv50RUKdQ197IT8k5qQw0ng5537xMhX6iJVxzx+FxqpWwdPtVLyYkWzPJQZwBpyW0G8DgI09
	AAAg==
X-Gm-Gg: ASbGncuvvAcu+kWXCzBO9u7VEirAfddwzWffrImAeCHGFZhnAQSUgDGKpCc89ogAAvq
	bq+3IaGZVicl2a5KAlsnruSJ0b++BiNgG4pJtSa7xUzZJ3gFi8nytKSWJheGIU+p5dSqtCqUCLV
	lo4OC/uIey60QWiHX96ZhZ+DEIbQklVUAFi07y5NW6Erk8QE/bvQZ0RobvZv6KM3OmAxInLdjdS
	uOIMw586Kkz98a0nIj12qacFW5k2pEfS35K0VegNVtUzRNs9zwJWqH/wWv6N8QYIZNWC88GDetg
	RcQk4frXwV+ppaeEQRgmg40S3AiBoXFGQhPIzD2Pgrg7LAKTfSciaaVNkQudSD/Ns8GAKQxNoG/
	azDza3lApVEFnOadF01BHRA==
X-Received: by 2002:a05:6a20:a105:b0:235:2395:9b79 with SMTP id adf61e73a8af0-240bdbed996mr11657819637.20.1755263909698;
        Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVgtlGuHI3R5UTZppK/I92pbWdnaCgqxM5po9lFPqc8ruSdgnzkjF7GUIatpizm+XOrJCpEg==
X-Received: by 2002:a05:6a20:a105:b0:235:2395:9b79 with SMTP id adf61e73a8af0-240bdbed996mr11657761637.20.1755263909236;
        Fri, 15 Aug 2025 06:18:29 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7944e6sm1256386a12.54.2025.08.15.06.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:18:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 06:18:12 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-itnoc-v1-1-62c8e4f7ad32@oss.qualcomm.com>
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
In-Reply-To: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755263906; l=3400;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=iFGrvpCpH4OzqPsKWLDwUClOVbka/29o5GG8qAczHik=;
 b=qyemCdR3P2VMmp7XSc+HQGGmjYmMzyTQG+snL1xiWIJZY/XORmtMi4kBRE3qJEpQsRwMvRJDo
 3CPb/IldSn1BjS12mEqgCgJiZjyfgJan0lEIGyUKjWy9sFlDUSulzWF
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689f33a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=v7KY3twRVyNl3kJcRO4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 5lyOadcnVvdptRAVs4LK05-B10idJ5CO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX9nrn/Avi8eV5
 8Q0ypFyqu/ddS6swgpOtPnxTHpgeUYOdiFjBSm5YMlRzMEfRV6I3Mt58p8si2cpTczfkzKeb1WN
 q1lBlwMmrsga1TESNWAA0S139CMdZ0gt275raE7HyvaT8lWrU0sxEMNBkkF+DRP119lxe8emboV
 Wu1uSBsXnQ0O0OJ4ODVORPeUK4gxMo2/ZZjX9VsEZ5BHcYoEZ5S4Yps+yAz7tyDC8hRnCkVO6lX
 W1WDnzx+H2MhJF9KNHgmZyJcpeflT7NJq6XIDdsuE1TvzjWddtmLAmDbns0JoF5ykhzhw69uVt/
 w/7Bja8f1CcEE3UP0xmHjOR8MdVql1+gWjZg+9c8R2bglQ+UElZTcsfdZDMdy/m7T0f5KBBANcF
 pojS690L
X-Proofpoint-GUID: 5lyOadcnVvdptRAVs4LK05-B10idJ5CO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061831_644663_8738FBA1 
X-CRM114-Status: GOOD (  17.71  )
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
Netwrok On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fd224e07ce68918b453210763aacda585d5a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,108 @@
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
+description: |
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,coresight-itnoc
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^tnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    items:
+      - const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the ITNOC registers.
+
+  clock-names:
+    items:
+      - const: apb
+
+  clocks:
+    maxItems: 1
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
+    additionalProperties: false
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
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
+    tnoc@109ac000 {
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


