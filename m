Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4282BD1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HmnPU9O7PMo9QplIBvyoosoGSrvOzzM9cYKw6YVfJk=; b=gL9TiFYjFPfgZLNwkpPhUkOQ0C
	D22HYq6cmB/GH2tDsy6ctxHY+xCLkWiakbYZterN4O4u0UVuqMkCl5i1VhNgpW71QQK3rWXj3AVKi
	aqRWvMPppeaK2xxAT5kZJUN4lzEMWfnICCY3m8zR68dHACdUUrM1sTjLQyP3MkFG6YP1CzHfwFWM0
	8UU4TUpb63XLQlkXIyg/fc2IaMjpX6xTiXpw9PRP7AolCmYE8mVFQDb5w7xmeNjSRHOled0PdNnDw
	E7IGkRIHExTcBcXRSR2gAh/3LhVWSwx6RDre9OEzgq5cU5PHMkL/0Cmbf7Nc3J1xycsM95xVmSndm
	pzaYLB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQik2-00000006M5f-00X9;
	Wed, 03 Dec 2025 09:01:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQijy-00000006M3L-37nr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:01:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B33sWJs3714796
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 09:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9HmnPU9O7PM
	o9QplIBvyoosoGSrvOzzM9cYKw6YVfJk=; b=bB5wwuhYg2uFOVYTUVC8VeQHSn0
	5aIsCx5k2AsEX5ImKf3twE5c0xUQ4Y5eMnrBDWtD5qYYwIWQ9PC4yk6YQ1wdRU/z
	6uilVG3heHTDAkqTpn80NkE6ObAxzitu6bmykHKVIEpcmErvLdpEHxCe8S98HPG5
	O1yghX4q94tekbqM/5zP5/3ZL+Z9SYLp15UemeacEvPaeyP9wFWpr5y4eLCdjN/f
	GaXv1X8Zc/pUQ/uLbGgd3ca4u7og/j4UnDTG3Zxt/E2k16JFq6IU5U9k4t4Ap70j
	u56OhZXBGlF9rso88fv80JKiw3IykjM2JJ1QvZT9jlW+cUTzDU3+4EsaOPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3r22kw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:01:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34377900dbcso12885822a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752497; x=1765357297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HmnPU9O7PMo9QplIBvyoosoGSrvOzzM9cYKw6YVfJk=;
        b=W9jzGTlCeRPPQB1/mu0y2BR4+c+dbMZGNjQHGV1/OgYAED139ow6wRiAjTNUYW+Ymk
         HucGWcOoe11aUYbc/ge0lYVfH1lnn7RRi2iDqvjCkykuUC6Utj0KOXd3Z4NAmvQmxQyp
         ii8vR/tY9htQsbedz6suoQPtRbQa9F7Xm0Yq/x6wnl8hTtqaQA1ehRWRiQvM+rd/ZNb6
         15pQ5f8Jd5vIrILQzEmp0W/Nb7xVxniBUBUtu6T6/mesaEgiyPSmbVTjVaCSK87x8i5R
         LVG9/W5MrYNcgE6dOV3Mvchr/ZmJ+I5ztToH+EDMyQWADzuVZtgkEmZcbH2miOhv/cXB
         lJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752497; x=1765357297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HmnPU9O7PMo9QplIBvyoosoGSrvOzzM9cYKw6YVfJk=;
        b=UELKas0h5/C7ZYVi8iSKErfCBlUP4bAnSb8lI+pp9kg/EuvjfAdWTASrhBEaDEiDyL
         LbswAYHUdDiozX40S6aLv6SxUa+8zlVJCYMHArGvV3VLV8Qorz7OJhfR3CIPvqjs5zLE
         RZHwWy+ms/qZuIAYn/jcwszt3VpT5ZUTP6ggOn+weTnbndyAcqkLFhl2iJXc4O4M4OKu
         YkRvFacTxl6BVb04fO8XTewl/JE4nc9ONmg39AMNd1bN1zYK6xc9kd5NoqEbFQdr23tq
         UzfkWjCqApOw8XXJg6dDI8UVM1YVs4gdRykGDDKmY1Vi3FTIm3S95lBBs8fjgsGjPGjY
         Pq9g==
X-Forwarded-Encrypted: i=1; AJvYcCXbik3I6eVgsQlRaJZ51Qthmxs3iwcc6PaU05aymFh+wVRkCDAZaWwvfA36D67Llale8GFSyGa2CGuDbTSPEM5i@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXgjZkYu27Bfkr09Fc6qK5Gu6o+blCnn0n1tb6sTHMRwgLRQv
	mtHroS0U3bFCcdmQMVLBakF5r6AIlm/1NSSnkCNY/vFGJ84ez0osX8VNpVR+viG/aoi+dmhmmMj
	qN28KK4CYvp+NjZ4aJ/37R3bzChhxej76CpSvG2a5fpEsf5rSjEVNOQljTArXamwvzOdziCzMLH
	y5cA==
X-Gm-Gg: ASbGncsmI/x4fgnvP/FX/5SDW0gsritj5kVhSDuaE/33l25z6D3eSCS0y2ielAQpcYm
	YDVcWHUX5YXxyzCKOS/+6nw0UZ7LQo1OAuC7Cwi4LiB3kbMDSr0D/TD9FmZ4a8DMSwnae1hUV1B
	6pLINoFryCmAMKuYSKVoP/8829vA8duGT1N6BNrxAnlrJnqkZECZjHFbXqSfErpWenZvqcrJLja
	8kYzKHuYvtKfuX5kbpL7uWXJMF8dFTxPXIBsBnZr0xSQv9tqNcMSd63zclIU4bO0F5lIqd8WTY4
	2mYNXNBOXDfsjFHiSSJtMukgYmpXIVeRXn/xlw1mwfoAeeS/ced5XIC4yYf4lW0yaX/7JLbaQLI
	HRRTmepVC03Ub+LLX5GV7ESeZYSszR7VcHnIYZhEfPDJ9gYdYE8z11ZptnRCJQoS2
X-Received: by 2002:a05:7022:60a:b0:119:e56b:9582 with SMTP id a92af1059eb24-11df0c53421mr1391675c88.7.1764752497340;
        Wed, 03 Dec 2025 01:01:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrGALWBf0lKQv/ioLGZm6Vu6JoCdF0aT5UEQKDo4zyjylZto6mqbK6StB1wN3GdgUI4D75kQ==
X-Received: by 2002:a05:7022:60a:b0:119:e56b:9582 with SMTP id a92af1059eb24-11df0c53421mr1391649c88.7.1764752496721;
        Wed, 03 Dec 2025 01:01:36 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:35 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Wed,  3 Dec 2025 01:00:49 -0800
Message-Id: <20251203090055.2432719-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QxulnbC6FJ2RBZkuXPqWXmec9ljwANRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfXxxxLjVCQiSsn
 vDalGBoxlqnysRijnck72JsgxbMlnskbcbvftV7cSVXSmjCv227B6B/h7PGfFqrUTYYDuxDOufv
 aQ77CXfHmxONwUMKtnGzCzW2NdrTjM7MgKU94tRbtPfPYAYdhbQ65VZWRXTgTu4/z0mtn1vaDHY
 Wcmc0f5iSi5ZOjNzjaWGFWQCLFC/TnPMeJPpEvPGGKqC17bzoKXmlYOZd8/UDzghTs8Sieukdre
 FPfjib7fko4RRk7M8r/dcFwEGPZnGCvRB74kNdxNN1HEPYpjYDaQjMLPzuSAAkXs+PiJQvNJQP3
 ftDG24ltAmiQVw/LG9AwzB+le1k8iCaycG1sHu/PGk470pjQ7LcFLpnnXR7YGa7gvyrBC2Rn3gD
 lGdQjcKW2C1mMsT3q3W35yIK+HZ0iw==
X-Proofpoint-GUID: QxulnbC6FJ2RBZkuXPqWXmec9ljwANRF
X-Authority-Analysis: v=2.4 cv=c+WmgB9l c=1 sm=1 tr=0 ts=692ffc72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010138_908367_B0EE66A2 
X-CRM114-Status: GOOD (  23.04  )
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


