Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E2CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DXoW44CUExXzSENB3F34QRGOi0zzg2uAwhUx9G16EY=; b=d9fRcmlSMfbudt8Wp+Z8E5Fmo9
	3Vx9xadX+yuyh9Kp4weNdY9w/MvJjbOaxVptTYeun8Nx2xlk+ncwqXBsJY+8E3MCZbtlJi8xggaCa
	1rX0vljoiNxUn9JCac6RcIXuGVuVaIdfuzrcN/TeCj0UIBu06embbUIu7xIeO0xI2yxRxUmPhXb/G
	wkKARwtbTWRayiElQPInXgb5oeaK3RglR2TZyYLGZTjklxfT7gD4CeGDrnRvp7NGCuAIWEDQYOmyd
	IX0QweuWSZoKL91b4Nuu537iHdPchTbRwYF4vyQzVHJZeC1qWiuh9tVEy2HTxaNU8qNROCH/ZN1ly
	H86oW57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2b1-0000000Fdyn-0zqp;
	Tue, 21 Oct 2025 02:59:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2aw-0000000Fdv7-41Fp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:59:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0tax029841
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DXoW44CUEx
	XzSENB3F34QRGOi0zzg2uAwhUx9G16EY=; b=IO/rxQkVfjmf7LYwYAdSb7rPlEQ
	HxL4OEZPTN/l3dtgC9ixP5LEh2JCLtNrEAiAmtRMqEiJc1fXCmRigsQSXxyXCytx
	mXl2b5OAY64VmpVRaveuJEZJSJ13/2oEI26YBCAX2wELqoUDWR8RT+l3KaKhKDax
	XqWglr9Yy5X6+jAKqrg0DM99hi5ThviwvYl6WtVhTwJUr0CEf1S/6vFxx7q0xnir
	9+sXoms8kMx4gN8XKK38goiT0DjoSQgPdTU6Mh3+JsdkBSe3DqceAGPlDZmt8n+8
	XbyBU4Bhped+A2P0knS6ikECIO0/raaLitfzK7Wz30Lqs+KOYkhqm3Nu6Ig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdxwgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befc08so11016535a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 19:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015569; x=1761620369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DXoW44CUExXzSENB3F34QRGOi0zzg2uAwhUx9G16EY=;
        b=Rm54R4x0uH6XOfQJhAq9Rod5Xo/Ue8AJfUSxlgdyzOE61bJw8guNgCFzkQI+Dk/3Px
         Bzve4J8A7OkMhGn5d+uicTXZX059hz1I1qKVbJ+Dqzg2f9jAs0wdsH4D+D0HqANO0+8R
         3+NiYCPmIic5bt9s/ViuA5QnPr2j+C+7xmVKGg4S5rTJ/d7GLMAmYTOo5V0LDHZ5Cckw
         7H++qEyaRA5JbYrVQjes8h9y6waxxgod/MryzbFQyso44GCeUiDac9sjXP/b7l2BPlwj
         e7MyPJEGOL6W+bJbzURx8aZzRX5skWoyZXeZ831w60xwySeHqWsDjc6UBd0hT6GZY/5V
         J3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXpcKBXzekIYgpUqDcf83MZPkNNZIErCzjRphV+VO7lg71ZI38BD/M19K3OAQKdxtwT8WRinswA93rLHJZU2nCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2NJ12/YqONBJyeoMRKLdEybbUFh+JGVzX0jI3ow/lIY4HuOjt
	vNL8ZyitAzo8vp/JUunYlRlp8yIkeYWRP7av/4/rL4tceKJB5D+DyOc6YeZTBGgrO6LLXyLIcU8
	K0rNps0BK+RK1hnW7Im16Dt9QwVJu+/L7eaynV7+m1b32CtwrDvTYtehUtaPuRya8Z2Jj3fXWOB
	yPYQ==
X-Gm-Gg: ASbGncuIrop3Td57oTzZr4KrjJkzc5VeXXjV/qIi2L8VKlSgLcvM63+S4gQQ5rOEbg4
	oE8i4Gxl3B1USDkQ5V3LONz5Pu3abYVuz+koQ+FG5tiR8X4D3iHAaOs9r3CQBvBYmxVuRyu6cBi
	a/g3rGWm6+qkV23rfqCgikcjhb1Pm3VjxQnZ/2Jmm5PK3X396VCCP4sQEz5x3jKxSF+GDk7mMYS
	ZYbzw2ri1p7yqQ4lnSFImpSj6aYupdnpkwuWv8D47SgX/H6gVGGeuiNOrwi13toWnT1ZwrOvv14
	FQpxAhFoODIX3TmgxLYvkVk6C5mpQfq+bppcDvY9vyptL4ZS9zi/wxJqnaRXlbH+AWy1PFLQac/
	WAdL7VSeLRqFU9UPyyGn6nlq+QUOAxtNbKIRI1WSpjFbspfSppBcriA==
X-Received: by 2002:a17:90b:38c7:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-33bcf91c603mr16981886a91.36.1761015568752;
        Mon, 20 Oct 2025 19:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfONH+YEJVS/DAl2NGHJErEJq0DNR3DpCG2ZRbsj1KhbAnDKeowuWFqEs7F895so9PNNgFGw==
X-Received: by 2002:a17:90b:38c7:b0:332:793e:c2d1 with SMTP id 98e67ed59e1d1-33bcf91c603mr16981865a91.36.1761015568234;
        Mon, 20 Oct 2025 19:59:28 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm8855787a12.10.2025.10.20.19.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:59:27 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [RESEND RFC PATCH 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon, 20 Oct 2025 19:59:03 -0700
Message-Id: <20251021025909.3627254-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
References: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX3U4C4p2vBy4A
 kbiwOCM3hCs9w6dh+N8gOhey38+oLVlXh3iCDVNBBbTa51d48DL3z7inl9L41hrEgyn9pxArRVy
 724AMLIRHjQPs2gIZ8d8latR3CoL0E6qj6yhEDMVZ5Q5jQQqvxqAOfVZxM+hVmcCu01heZSvxUA
 tRBhMsVHpvimbwKUee7Q74V2mS0ns4+4PTsFDvnxISiH4WoTFqMBqdfK4ubrfGRebP1bfFpQYnJ
 QV/00qDAaq4qBVX3H7KA+PlIACNRHrIE3ymg7lLvx9lGP9Ky4Y19q1fGJStbTD/c9jNvcJfiK4/
 Rexy44ivFcXubp42sLApzTGL8LSSNixYmPIlud7EoqDyG5oEEkY4zXf4blsPtctdXgo/SkZ2AT4
 f6eJV0/EIcLblo/xKE2r6b1zmGWgWQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f6f712 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=N3VNWiZ0WD7Ir0aJMQYA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: K-hNRmoeKtikNAW3QeDwZPrbn3stvWL7
X-Proofpoint-ORIG-GUID: K-hNRmoeKtikNAW3QeDwZPrbn3stvWL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195931_124378_E58F621C 
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


