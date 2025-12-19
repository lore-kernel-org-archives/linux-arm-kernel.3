Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF18D7495E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=HKFvqwcVwfZzQWnvJurUPs2IPV
	u4gLRO2utHLkoq5bj5wjGExw1e2ye50d85wYxw575yjBCwvG5JTJavjOwzhG/5YGKhaTuCYH1vA83
	cZmUSuQdoldBGg9dMpIIvi09WGEBh/bR58Ru1AA6Ulz/y7dWEtSUERCXdIdd8G/Al3bzPBaye6eOb
	9XaNH/6XIk11VTW/wGpWLqlOO1eK5OZoJzDJDWyLJT9VOhmXc+6eXQmm2TeXoNNv7DF9DIqehQX4S
	49u3hN0SCGsp6Nivi5FI7xgS/o3Qb7oFkHCYCTCxh2O4FuINpCvh37jBEHP/T5NWPHvp2/R0hCRnS
	0CcOwzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSS-00000009jEF-146t;
	Fri, 19 Dec 2025 06:59:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSM-00000009jCI-1WcD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cN18091969
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=mGW11hoYuf8oovORYJS0AOnjvkm
	HPkNqqdH2C0xSoFrjNRMA5LU08NVhGTzZ21Aj5ncaxpcaqxaioJyIRtca4pjea6Y
	deI3QoMbp94eLcrxdxi4kwHdJ15D4+9uu/NrvIBDVoRZnGm3n6s5x4POoPcaD7rb
	SW5UP8KXJ33xdMZbscEsuM4p2wA1qiVk32gsxidvxkLJYlLYVcrxUf5E+VQTzctm
	5wn9WRhY0vdxghYg/SmtaXVMqjGvyulz7PIAJckAQX6ns8xRrTALDaAA+ZC83/IV
	N5n2FV77hsdJ4OZASvXVpUtihj1+aMdFVOrOGbg+TZ7dxt5gh6BuNqrnBEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e9m58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso1373114a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127556; x=1766732356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=Cb1Nc4r0ZVfZN34/v+pMaBwTmzaokrM4+X1aAeVaanL1qLWymwaCoP6QarU1tCBIOK
         4kM91XRUjSl8fH0xMmxxH+OeTrTzOHK4Q7FEw4me5wVeNEIqeleJ6Kljhzwa34nR8Ovz
         evTEGsbVIYlz9Y/NXoJfCLMVeVj755un5qpEKXtNq0tK7aKFvHrJQAgVoXpUcavEU7ik
         gwj4QG2KvdW7VXVQ5/anHIN8CEdfzzcYNsG2YRVmxncCO1IIDeSwhvOhWOckDqFcyQTO
         S5hwrNgGR+GptujlkqeOqdNvgO1catLR+6jacE6ElQdJ2JfPjK2STCsNv4A75sDLrxZB
         5d0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127556; x=1766732356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=aXHkB0A4dE/ZxP5bKTosbITwHRB0GxpCNUKxZ8G4eOkjex0kj6XwJvHkZmBM4FyDuW
         1sqrROY6p4R1DF87kIO2gWQpaveG1qINN+WjXAd9RZYw1yrihEnafpa/THlMw0zJtvGF
         QynSRrjx5gIfHtSxBX8lCAONzaRpgHtzpGqLGFaktrt/0+eoKS4HDyBiGi43mAr2UOTC
         P83JJXLcTNSccxgtWPhBF54EX7KZXdj3HdCvEUf49S1yNmh4et2l4OwKHXleMgIr4FZM
         Jmm4Yyw6I/q7v0CuUUT+nv8yG8QEE0/w/m+i577Dzw6Mzxt3LL2au9t+hbP9EuS/ktgq
         IEsA==
X-Forwarded-Encrypted: i=1; AJvYcCU5U6itZ5LaTDqorhzGhZmcQqBIUh7+v7PuQuoy+7QV392IA5t3HLXIg+qWbyZr80VXzXJ/81rfVDwgS/i6fD/F@lists.infradead.org
X-Gm-Message-State: AOJu0YzD1M3MCv4AwT0nblOKONvOQSwxbqYcOukKTHX05dsxO25/xtpW
	RzSWXbu/T7ovRUTAC8lwfoRNEf/hMti20DYyIjS8QTAxRf5W33eggdZlp2z3NwCDp4wF5njNlE4
	4TMnalAskKybbQyecUnDsY3HetVZ8oXfKAtxzw21yciCPmbKQywgzTBcIMvMnwFcq0MaR4EljdD
	M6qA==
X-Gm-Gg: AY/fxX4reWlxwXx2xyEmSKISquoXiZ02ITZV6KKTjyAvlWC8PipCceP/iH5jZOTZdqW
	YnzrVMu4lx1/ubhzvZ+qtax2hbZgPTtuqD+PQIBqlV6G4SrzllW0FHtwr0N/BVYhhCXA+P/VZYE
	DUsYid1AWRHeAAYDAk5yuLxIZKECYzHRKtWkUqYuwNkPYSig8wto+NfbhIlJh2ZVcLLLeRZW9pq
	QVnovYsS8a1ktwyTN8RW6emNU97oVIdzlVF/4QD5K/fYKL+ZimZ9yuYjOb/qSQcrGpqyhg0NQIG
	P5NUMDVe1Gk7jzgARTlQ/DM5WIHYa21hHwFZ8KPICaHCudFSdSKG9Ii8X4jOAlKt0rhk1ydJ+sr
	ZfEtSJwSNaq4/nCSNC+8OS/YlwI1HWiKHBJvct/MF1i91WWx87y3n9hAXxrlSqvWh
X-Received: by 2002:a05:7022:6894:b0:119:e55a:9bff with SMTP id a92af1059eb24-121722dd666mr1906797c88.27.1766127556260;
        Thu, 18 Dec 2025 22:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3MkjuJpL3ndfq28woc+DY1x5eft/ObZXlyr5BZCx9Z/dRnigx/T/e88b6txTPhWXxGRLPYQ==
X-Received: by 2002:a05:7022:6894:b0:119:e55a:9bff with SMTP id a92af1059eb24-121722dd666mr1906767c88.27.1766127555681;
        Thu, 18 Dec 2025 22:59:15 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:15 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu, 18 Dec 2025 22:58:56 -0800
Message-Id: <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfX5XOCkdbMzjyS
 5fzymJvthWyHZHmNpzyGv7ocWZCiLFAyZVV6P1svDXgkgsXKfpUqtp15T9jekAyHQIH91m1JgbQ
 FQ+asoTmD9jhD/B0WTNutDHoJLot68gvEhSxX+mbEVGngoZ3YKwsi2LYvVcM3SW3xNNWmqW2EY5
 V1AEp3rAcitxmhj9k3gsEKGvMaFRYEgZOT/nRXgTv7TmB1HZGC3iIFJS7A8ADKXg8t4ER4ItPPF
 4uSG1GJHcI/5ezSYTF4qCTSePOUdGQGBjFEYB2QFpQl2TXaPqoSE53cLtTKiHezcBNShFw/MEIy
 Ow4YfFbbwfzsjEgFQUtZSUc19gF/7rwGw9zNmnh6ZIyEMTemLSg7rFsENex7DHLVc2AGThyMT8G
 6jvSgaHkPttPOwJwnpJGX8NONQPHoUbwC6iFStq0d8v8ILaLfYKlqoaO0OjQDAbyFvg+cMYqntz
 FxhHXm8UXEmjH7LZJ9Q==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6944f7c5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Tmyo9383Im4JcyWVnYvg0D5XZyCYvw9j
X-Proofpoint-GUID: Tmyo9383Im4JcyWVnYvg0D5XZyCYvw9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225918_517107_C08D00E8 
X-CRM114-Status: GOOD (  23.30  )
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

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..5b6a58ebe691
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          The port mechanism here ensures the relationship between TGU and
+          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
+          function as TPDM's helper and enable TGU when the connected
+          TPDM is enabled.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+
+        in-ports {
+            port {
+                tgu_in_tpdm_swao: endpoint{
+                    remote-endpoint = <&tpdm_swao_out_tgu>;
+                };
+            };
+        };
+    };
+...
-- 
2.34.1


