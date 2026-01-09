Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD6D232CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=OFVRHR8TpHxC9a7TRhCYmML0jG
	KZl/OK7RoxMVisVdoRp2bGLcSBpaM4aoJYzl9u4A8+8/w3F1w8w9fytAIU3i9wXjk32iNm9SbbYC5
	ZEeqrdDkM6oPsGTNiwoUiAdlwOn8GBxC4m8W25puDAN26zfoY7RrzwBUbngLCGb1PxOS4UbLQe/DB
	Z2XFtaqEioKNhBX2AX2zHuHvM9IZW6iH0olwbJpoHQgA75N1VD+8s/XJoouWg9nImV5FLwvFAThZL
	TUkhrWVVpW76g5IDQ1o4Njd6j987FTBnhRhN+V29qsKHDylhGv56B9iZ/tgydIjbpEUSB1UqIwuKv
	XyHpQ8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z1-000000016U3-16vM;
	Fri, 09 Jan 2026 02:12:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1yy-000000016SU-0yPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Mpln12328431
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=L7AIir4POjTyxQCYaktvTprAb2n
	aN6m50RPWJ1AHDfXQTZ9rLkBwVX78uejRA5LSdTgxNJ7JjDxrehmLoqHfR1FMEBH
	r8zMv+MGJJeHrDfEiv8MCnTORPFMdYq7rWW+ocwh0i4DDlTSeFqDMEwhglRBGDpA
	mYWmNyx75TxOn01MKDZqbJEaQtoHGbSjL4UNuqcyv4W+xTRbneS5GMq+D+b9+OMU
	iOaveqW9n5myQ7pn1bJTGbC4GifULfU6ECSqg4MRUOFr2cnWs6cvYEM8KsZ4bIg9
	8+glFFFTAtsp+Zky9B9czk0ndOJ3zmONgpyb2itMw5/VwnOlXag8J3tf/CQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfda9n2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0751d8de7so4743228eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924726; x=1768529526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=GkhB0/ye7IUiTlZTyFFnQrHts6OcywdgChv6WUf2QReRZudXSn1Wexw0acbbdB2c7L
         I+emEwbJhm3vQpZs8vqXEYXsGeVFERQD7xCChYRGkc/BsT+UlviSX+NdJ8w0inVbec5x
         TptyOO7G+LnoPG8X40XIzJx03hEWbHaEXXzaPa1LEG/0CQiJsqMeBz1y7i73d60cnDlc
         LjF+kj6hyGl/JFejmasPuyTyuT2ZppRD+VPTAer3yWX1k2ZbEMjTDTj/LO9CcOta9TH+
         AHeRr+kMD1WipKyiogcvSB/xm8ySWyryFZeFFryKosrcAOzsQW/NDXINtzgjn3m20IBe
         HjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924726; x=1768529526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=qZIE/QYOSeC3R+Xtg+Olp12e4xSHnHmrP8kaJaW7D3TolOGdtPMQUX8qtGM5T6Tw5s
         C1z8E1ONjOj39PQCa7eGr/MJqbW9GjV6AtcjveNa48jbyVO5V9Im9tzQk+5a4SeuJ/Jp
         m4QSxKrYZgOlenf+So5xQlWL8VfybyIJuc4zNNX9etOwMVQZ6H9MKQm2tFIpY1IzSHc8
         k7yfZqh/SgmKD7rKJ1f9Dckipmd/hvI37d2sLGz+zOkbTD1bvNW2kTJUQAT1XOLLs96/
         LtZyxw8SqgJfz3g/zxmdcvoWDNf94FA/K0l1gX3jj/ouxxCvdms9oZH7+HFGMiW+S72R
         9sPg==
X-Forwarded-Encrypted: i=1; AJvYcCWAEZz71WWxZGtFoqewJn/P3u1FpdjgEaWowKHMF6/+3S1SmXQL5N0XwLip1slCXFWvUTIpvg1CT5JthNFmZQrb@lists.infradead.org
X-Gm-Message-State: AOJu0YwU2IWncqc/bLMANUoAviWkDt0uynHApsi414zepsOCnRg9GgiE
	Wnc5X33gwWqXZBHrm72ot0LtZWAyqRgYZmG6b4C8vo9uZ2zqKFfY0nshL0qRhF3fOGqXFRpgxVu
	JD0zWSaiiBOVBt0CvgXP1svtLUb2FsY+Nmc+Sfwe4dXp5VxiK/fF61nyb8x8iDq/sqyubdZOQMS
	yDFg==
X-Gm-Gg: AY/fxX6S7NgYixM98zR58JVxUJCg5Dca18Tc9vTcTl/RlUr7ch3ivB7XISkyViq1Fju
	rlrd2vvqzn1er3hgXIAeq+5uIk16j61jf4d4pdRvIRiE6zpiYQiTlcCuB9kAA/K15qmAiGj/ZFq
	UWc+fOK0AmxP91fOBIg5eoNhwe9Nn9KhI5J9PUAWEpZ4eCZQEZtnF0XX/6ZEPHXAtgtRa3/LBBL
	kPZVQn8dc8ErEIgXwySQQZnLMZbV22g2VgA1v0czsgYnTu4IGSoIC1E4RqweSRxwjXNk0VyMwUi
	McPfM2qcbLB9u+bMza2U4DR9cVfO53E9+PmCKQ5sR9qBIOSSph7j0CUXI0t2wo+2Oj3M1UfEcc0
	rI3bH2/3RZLPHxcZsp+dzw+E8k0gZmUl4QA8RdB+4akofLvJfx1jVkNMigSwRAp8H
X-Received: by 2002:a05:7300:8aa4:b0:2a4:3592:c612 with SMTP id 5a478bee46e88-2b17d2d6606mr4790663eec.35.1767924726012;
        Thu, 08 Jan 2026 18:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgy6sYHhmXV0R+HsajFHl/JVX2fDprTnrm3I/yjxtsb+PByjDHZjVHQYgqLNx+6k5UNumKGw==
X-Received: by 2002:a05:7300:8aa4:b0:2a4:3592:c612 with SMTP id 5a478bee46e88-2b17d2d6606mr4790641eec.35.1767924725322;
        Thu, 08 Jan 2026 18:12:05 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:04 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v10 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu,  8 Jan 2026 18:11:35 -0800
Message-Id: <20260109021141.3778421-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696063f7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: VBw8YIPVHGVlx5sq7JGDv0OJH5k2GQ1-
X-Proofpoint-GUID: VBw8YIPVHGVlx5sq7JGDv0OJH5k2GQ1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfXy5m37Oer6mYh
 BFPtBDikTS9Neetqo3WfIFMb14DwFo6akPXtx1NkucJNP1sYWqJDjrwg612pAk0Ky/3TK8Lt4/i
 fDidXeef/mq6GtsJGdcJdzw3Fx/Exl8rNKL/mx822EW3EGyHcPsuR7kL3jU1jAtxnNt1UvJN71T
 zM1JDD9kMMJl4hZoVTsyNUU6KeZY6QWXuzKtWRXnOSwdwju3O6NEFpBpI1RdKOqRis8kx4lSvq8
 rnb064xz5g7FzlAwGMSBn5dNGQS3vOOVk15bfQ3sNdO+0FWt304GYu0TRA4xoCZSQC7AhPWfJle
 re6rNEh2Bumtlwz5HC9bmZo4Zd+WQPW60zXlvi95dyQ6tHjHAdugsFNL4rGmqwzv1lq9cqxxe6m
 FG+tdSf9gKQzg1VU602ykpvwSjW5xOoEwGFYF2PgtGBcyjXVOkXi7f6UzXf+15J29oXNA6fiboY
 1u/yBFiZLgUumII6rPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181208_392178_28640FF0 
X-CRM114-Status: GOOD (  22.39  )
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


