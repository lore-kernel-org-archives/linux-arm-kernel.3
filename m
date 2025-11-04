Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8A7CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtax6evXA18JgMiwfTdHJ38nVYuISnLOVRzsprq6aY8=; b=NgWgVISegqkR/9vHZNMiSdPUkl
	qjxG0SCuz6hFqHwYCDsUx04HFbwrS/WDHkSEpMvFShpiR4mshtBz2e74pxpI0jlAV2QV+syQXtSHT
	CiCUb8hD6NfeWxWB70rVQ2HDzvVxDm95kMH/WcdqsP0UDJWhF5eRR/KMf1IeYuhVa7V6uh1VJBRA5
	9E/bmnRYpNOb+w7bg54StYJVgZ+yw5fzL6HgqbTy8yfgo5cBJCYixH/I+V7kxXnaOUA6kO7Ixni3X
	9lWSmcDnM8ia080Evm02moqCqYssGugKwu+1VjMIfaW+cxczleMzHducnnESB7JHGjXyZGCNBO/GG
	yzsPjvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAk4-0000000BFP9-2vGB;
	Tue, 04 Nov 2025 06:42:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAk1-0000000BFO0-21Vl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 06:42:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A428hDj695051
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 06:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dtax6evXA18
	JgMiwfTdHJ38nVYuISnLOVRzsprq6aY8=; b=ggf3KeFvOnDRJ5toBl+4bbXCFCd
	3jdrEnzfgQuZB1a98J2wQEz4+TJv6Q4JDXIl8Xl/VjM/DR0AVhPDRT8vqN4N3G23
	/+bnzhvofbbmiWw5VxrocEGtjfsXCgUlFP8Wg4g5zxQqmoSsc1aTAn/HspSsC9Wh
	AwPouumNG7itEig0o3J9GRfR/mWi6vIgZgs7zz89nCf1eWmYyq1V8cqxqgcXlpD6
	X1fHFtXwDXd872o8aptMtRSB/VII7IGmMuY1R3uDp//N7w1q3hODztmfcL/fAjSX
	1GtKXTLcoNjqDUgARVwdTw6AzvyRSMzut5tLWLbfkBRnvq03R2otNjlDIIA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a78eqrmww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:42:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-341661973daso1163288a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 22:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238523; x=1762843323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtax6evXA18JgMiwfTdHJ38nVYuISnLOVRzsprq6aY8=;
        b=c3+sLDmQEgG1ggPckJjLRO1MD/PZ/LOpHGRLhIq6I5djZYAqZD+8BQREcaKbyEpk6y
         8834lItWTC+ulNgXTwfZl9H2ulSJFjxvFgLCfNuKXD8CpfExZIX1XhZEEFT4VzwTgVc0
         48eRLluEzjRvEovCVXxIKikUoNY49DtgoFnNvEl2A3Nd+oJ5YJslaD6tE4JtGBqgPsSG
         hJoqvVBtKWPFPelLclUXr3Kxbm/rZFv/Rf/BfwtvhiG6JUmwmSskFg0ze/wHjvGKWzlg
         rhCEcGgesSFq7lsE7d3sagC82w8C3O1pFxBny16mjx3QmI8GQguEylwQL1KHjfPJf/Ou
         t5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238523; x=1762843323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtax6evXA18JgMiwfTdHJ38nVYuISnLOVRzsprq6aY8=;
        b=irhln5Ec8BB/lcFKVQRZt/HHOQd/pj7bHDUfofkZrfRprdsC5f1LIoUZbqXxO6bWxt
         n6z7F1kQyoAukCziuDp1ZXK22mlWQ+F1yt/pT4IFF4LupfTecEOUlWPC/PTdNnRQUV8M
         Nu4mWzl7ukxUSRV1POhZVyV012FrTc/U4BaJuM+700auUe5FXaM67+JZOOv7dKSBXH+q
         NChy74PFxPHZDpOTIuny93KMUR9wBBrI3C+jY2IlQRIva8IJZfYRKSFTf2DXUqNJ3Wjn
         dCdjeuz3b0KUxG05o941QvPbcxSKFRjVVg0a5IZRsT2ETrxGGmPqDxL9SE4vilpQtRfu
         Cz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSqfXjdkA1pOIW43w0wy5WZqBFEPuCVzEfwgHxNIdpAldRD7mdk73rsudaO9UXGuhqwYMVg87r6FCN8x+ZbO1v@lists.infradead.org
X-Gm-Message-State: AOJu0YxuGCVPhpubWqolPDi0/uALo8layubuLZNvZ/dLJdQSn/UdSB0Z
	6iEzw9nimFQucsTM4Y8pSq7CNyPA6YG+smujc2824xKejjvPC9CU2Vv8Jv7eNyO//5w0yyyVfIa
	mqWERKXwjr6ZgtfYHTC1opp9cLN4JDOh/U8JF9erJlwXmK8ZVYr1IgIsYp9Fbt1O7j/lom15lWk
	9acQ==
X-Gm-Gg: ASbGncubk3yxZFl+nwpzimdsr3LIpW8isPlIhJbzJB78MNSopS1XcETl4ZPEzGAspw1
	tPSNxt4OEDAIMycFQfaOwlLUwqYURGeBiezivcYVZXB17XSEoP5PJFuZH9TMB4BBiGiGK67Thdg
	aUcwVGqxYj0+XXR50OV/Gnt2Cj0krYLfjbuvqmjiySBJcLt3gb4IXcOREay2fv3CQbeUQKyfBnQ
	dMzZtTOr5MI3kVe/xSrEJRKFLfHphtwUhpxhQW4jQmRKZsJT/OFg9H4einIg4uKqevX+YhpoZnX
	ham4A9+daMebsPQwddOylU+rfg5b11sNpLG6wstT2Dd3udSdEWYSmknOdzRzS3RAoKF7bX0m1DD
	4abFg2pFGBlZ7dhluJsrvFaIv0fHOT/fQxpmK+4VrWxaMYA6++OwPTw==
X-Received: by 2002:a17:90a:ec84:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-34083071b13mr18546206a91.32.1762238522936;
        Mon, 03 Nov 2025 22:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwUI0wwzlgz0De3UdP/FfiAu48+hXZm3cz3iyrJp1zGf8iWSt+PEVNytu5+xTU0YODrYKhVQ==
X-Received: by 2002:a17:90a:ec84:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-34083071b13mr18546175a91.32.1762238522456;
        Mon, 03 Nov 2025 22:42:02 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:01 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon,  3 Nov 2025 22:40:37 -0800
Message-Id: <20251104064043.88972-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfXwyy9Uaie6Mmj
 8NnzUUM27eVAcOXhXrGrwvCXdphZdjxPV0Iq/9LXd6UaZQ4ia0V21f77fkGKtXet4CNn/ynkhKn
 53QBblxjDznGsIsQs1msDWWOnM4qTs57OB45rcNtAhNCri8DOEBhu0UcqCoSeEjg4QqcST6fqdr
 DZnQ2VG4BlW346JxAMMtaWyGp1DPMGQdFe/q/5CWVcd61bMX/hCPNb39Tef4Hv61ipETCxq+Nsk
 d5H1ZcvPYotDwGf2qxI/SKTzKkl4rPyiL8Xu35UUBOAiQPggdeTAKgtzruweeUCySv547ycfL5y
 EGwQWP34jJ+XNZOdO8tz3/W19Sql49JWfYFvokTaKnJSK59/u7i65VunkFcZG3tC9Ln4lq/VHSG
 n8+uGi/KQPln4t+P+WP0IyEsGzgreA==
X-Authority-Analysis: v=2.4 cv=fofRpV4f c=1 sm=1 tr=0 ts=6909a03c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: sJE0TD-xzh4BDVX1bKU38trJ9c86tinB
X-Proofpoint-GUID: sJE0TD-xzh4BDVX1bKU38trJ9c86tinB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_224205_646281_4ECC2D1F 
X-CRM114-Status: GOOD (  22.73  )
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

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..557bc16b422b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,82 @@
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


