Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E01C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=; b=aHLdod8qUtBZ35ecWdlF5dwuT9
	52Is49ht3iHl6tyIQVRb5p7aJUQkbrYUyNs9yWe86SxUmpW1gEJxQraFY9gwdDsWJZP47jxAAykkQ
	kzrkLCXU5xxKV37x0UQLl0isAd1uG913kgmL6y4labjLqW5W859G9LFYD8LKvU6Pbx7texuBHbUl9
	ObS86OeM94eUU/dzn2rLLDeDlU3kBdmy9FOmS+eTxhyMkaarXKmS8mp8IqQduTNGH5TAb/sjCLMmP
	XztNEOP93n+fGBmCpegUoUHeqIma8J9QicO9lttH7RCBUtZ7vxXrKRorxZpzIeOszAeOR53ohjr4s
	0O71mSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPS-00000002AJn-0kC6;
	Fri, 14 Aug 2026 07:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPP-00000002AHS-06HD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QcIZ509991
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=; b=WIcfgo/7KEGV64C0
	J7AKr8WAnY7tgbXIQFTJwndXFAGNINJElsybvR2zepfh1H20VZLK/dejAt7aTwPR
	cp5AxQcqPee9AlvHuiW2RJEomHptjqIeWv8nVUwl65Qk73/ZIbUhn+v5tg7yu4x3
	AxRyAKhskmNzjUrj/aoit9+bSNTrkKUHc+PSvrr2GV0fkaN5n/GUZjPVy9DnvruV
	Yl6ZSJAMw9XZ7Z6+jvPloNOaChrHwmKniqbz40ygAsx48wHCwI36N/ArozgUvqxj
	W9Y4lLvsypZMZowQMlA6FXEH4MguajPvpqzb0rp1frbBWFVi46XNdrH0G2rtYagI
	SiKIhA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3usex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso746229a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692773; x=1787297573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=CHfO/6OYlwmKDxNlMlO1deidvBBykLT5S7AYCIjqY4roc7TD28Hc/Sa6HbI3/9RBUY
         rdo55fTU6Kgv2fc4ko2mvBy6zTLGrqhFzckx07Vzm7UcMgBrR92XmId/GmvmaB8kCmrv
         ot5c8veiYvQz0myFI33pBq6gWpoZVFhJLiMMW8pgIWPXFOFInyZbycoHdyo36O2QZtyx
         p1cGK+Vv9k4LdKmROsTBxZbD2nUX6ri8TOqsSiCz/TWkx4QRKFWOGHatOdqISKCUQvy/
         ///Vk/cMVNGhIJ4Q33sFNbw1+Stnq6dN0xPYfhymKM7SHGwJzrPogYgfQt2nGzEDoW1y
         uDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692773; x=1787297573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=RZCqkUTcUT5KvTxej0lyNl+BO5zVv92Fq/iwOhqvQUvSK4g7A3CwEJXRu4lNwuLXnW
         vQS8LXj+GMTFO1UayDXBRXkQs/FbRKiBZMzv9iLJJJTkABr/WwYTWl3LzRvb5KBuCuYl
         bunxDef9zeAO2PQDJIxf68oXM14cry+cVuKS7Fo9C6ryRwJfFKKn2pGkfR4JYlkW7CYp
         rxqIu81rcKuTXaRSkJPMSjmHkZQ5K00qLEt2a9HD0xwX84vZiCBEIerS1PkzUgWb/fqQ
         b1l+4cqOxxh1d7BlM8zKCesXriAOR4iDvXCDsiDggJ5SBNxAZsDvO7yY9sfXHQCTteNG
         gr3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ikGkEN/1YlLajrrX379pHlqWMqt+7q+Ao4zs48WkbDqGwvj/xFPMdZbpbovxNQbG4CQ9YDAGeisWd6bUo5mB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6JhO4Frdlm4AsMix/bZf+gPd1gkCXh7xWRhrUE09eqEp1kAol
	QPsaEHng5c2TLFQHItweOs/RkkxmAwVoTKdO90RIMIGPNs6lAxzTffnnR45q2/by4cfzXidWP8t
	HJyi498rGZd9egSHLotjOWVs0Bj5jjycNnCby+o9buXvwiMPy3ExxH7KUS7SudauWtdbVCX9ULI
	LbYQ==
X-Gm-Gg: AR+sD10qZZ3OM2Bnk6FHKuUAOI/Ll6YC8RzBbIt3wAQJdG1XXEH6aXyc1B/9U+Xv9DS
	MyAnsL90stLOTVbC7OoukRHHBabk2hxKdhfNufFz+B2X0rJ4v7k8xwIOATsFcDbOwLm4mlNtYR4
	xT0qqAiPU58lDOLoL8ExivnzHHK/JZGKj5RcRa0chsr/m0n7alzZWUpTjGRvWnRB6Pavalcr2ku
	LYvVJQSWqiIv3f7NBNSYuEHPv3Xx+hXYZGHxAyKxwI75ipDCNidm7iJMzFAMMoPPG/yBR/vYzV+
	oIv9uEj9wetXL3VMnJ2uWcP+jo1BvfQcP6J9hWmEI/W6175OmAQyp2IPQUacXcmIs2C4J5TO/Dk
	xRydU2qPcyTr7xbiYXZV8uQCOC7ul8ExZf74qT6M6cv1ohCKLQVzOO34kAhH7MAHUkpm93ITuD8
	0z+HcSd+xVJL11WktPgtdu0w0=
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123521637.28.1786692772860;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123472637.28.1786692772425;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:37 +0530
Subject: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=5865;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=jFRWsP9ISRPrclLZb7Xm99XFKDmAoPy99ddr/r8mkjM=;
 b=7b2Un2s/M9mSVl4PcO5B7+YBwe8pYT85+NxWU5VAq9nRbWwFhkwfruk2XYApzqPIJwzEU/NBQ
 dxyxR/9bwCpBtxHwy7PehIbzLXwNKJ1HkURps7UyuuYOa1mjc1QsHpF
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ec4a5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UOSSyZSmw6qQ1N8pRZUA:9
 a=_XYWEmbmkuNYmnV3:21 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX2dJd3NWzxTXc
 jB9IsKf+PjwBAV5+fkCaPeBilANl+gAC7b7PDBA0D5aq0E8GxdJiskfggHsiBuGJqyDYKiZrJKv
 vfX1pi2Up0Tycrdmf+bs3X/16f7wgePvcqBsrwLCX7RzICC4/Hce0mNBGb0e2GV6vvojI3Zym/U
 hHIFVI4PsiXOghaCsGi36NP0mJapNG/CUU2qVABBg71uQt7KOmTjELRHhKlsILt6fM1wmJRwuZd
 FhLGG/gVVmzRAonK3aELuaSbjSuBzaIfzVB+3oaGlWMKgyamBL/3WsPM82g0I8qW5zwOy9I8+Xe
 Zf20df05eyqwTr+W3aP0FpaoxKbCXiOV+rTw4mZP6VUMx6eJOs+o/+j0RAO+93GzSAOiQtPwSdP
 hudArzBgArjZbK6d3Cxf4ID8HgL892xQcMZx8mJEEvmS6IwzUsELVJmIrMMs9FK76R9QlKyRn5t
 ur0FvIcQGu8EgzXIDog==
X-Proofpoint-ORIG-GUID: zJRdq27WzA5cSeIU0yk10MvJhft4Dac4
X-Proofpoint-GUID: zJRdq27WzA5cSeIU0yk10MvJhft4Dac4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX0/U/oyzlJJFq
 ucQ3VaDhaG62elU7tJi4TAZf0nRWnN2HHOQemd2psRi4CjtVP543NEMcJWKgClQiIZ/J4IrRh4I
 SIhacmkeD69gFlwlak3GYNWu/c6kNqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003255_188633_C77FC417 
X-CRM114-Status: GOOD (  16.20  )
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

Document the RPMh-based Network-on-Chip interconnect providers and
associated node-ID definitions for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..ffbf14356f12
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kuno.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kuno-aggre-noc
+      - qcom,kuno-clk-virt
+      - qcom,kuno-cnoc-main
+      - qcom,kuno-dc-noc
+      - qcom,kuno-mc-virt
+      - qcom,kuno-mem-noc
+      - qcom,kuno-pcie-anoc
+      - qcom,kuno-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-clk-virt
+              - qcom,kuno-mc-virt
+    then:
+      properties:
+        reg: false
+        clocks: false
+        clock-names: false
+    else:
+      required:
+        - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interconnect-clk-virt {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@1640000 {
+        compatible = "qcom,kuno-aggre-noc";
+        reg = <0x01640000 0x33400>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,kuno.h b/include/dt-bindings/interconnect/qcom,kuno.h
new file mode 100644
index 000000000000..eacbae38f85d
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kuno.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+
+#define MASTER_SYS_TCU				0
+#define MASTER_LLCC				1
+#define MASTER_AUDIO				2
+#define MASTER_CPUCP				3
+#define MASTER_PCIE_RSCC				4
+#define MASTER_QDSS_BAM				5
+#define MASTER_QPIC				6
+#define MASTER_QUP_0				7
+#define MASTER_ANOC_SNOC				8
+#define MASTER_CNOC_DC_NOC				9
+#define MASTER_CNOC_SNOC				10
+#define MASTER_MSS_PROC				11
+#define MASTER_GEM_NOC_CFG				12
+#define MASTER_GEM_NOC_CNOC				13
+#define MASTER_GEM_NOC_PCIE_SNOC				14
+#define MASTER_ANOC_PCIE_GEM_NOC				15
+#define MASTER_SNOC_SF_MEM_NOC				16
+#define MASTER_QUP_CORE_0				17
+#define MASTER_CRYPTO				18
+#define MASTER_IPA				19
+#define MASTER_MSS_NAV				20
+#define MASTER_TME				21
+#define MASTER_APPSS_PROC				22
+#define MASTER_EMAC				23
+#define MASTER_IPA_PCIE				24
+#define MASTER_PCIE_0				25
+#define MASTER_QDSS_DAP				26
+#define MASTER_QDSS_ETR				27
+#define MASTER_QDSS_ETR_1				28
+#define MASTER_SDCC_4				29
+#define MASTER_USB3_0				30
+#define SLAVE_EBI1				31
+#define SLAVE_AHB2PHY				32
+#define SLAVE_AOSS				33
+#define SLAVE_APPSS				34
+#define SLAVE_AUDIO				35
+#define SLAVE_CLK_CTL				36
+#define SLAVE_RBCPR_CX_CFG				37
+#define SLAVE_RBCPR_MXA_CFG				38
+#define SLAVE_RBCPR_MXC_CFG				39
+#define SLAVE_CRYPTO_0_CFG				40
+#define SLAVE_EMAC_CFG				41
+#define SLAVE_IMEM_CFG				42
+#define SLAVE_IPA_CFG				43
+#define SLAVE_IPC_ROUTER_CFG				44
+#define SLAVE_LAGG_CFG				45
+#define SLAVE_MCCC_MASTER				46
+#define SLAVE_CNOC_MSS				47
+#define SLAVE_PCIE_0_CFG				48
+#define SLAVE_PCIE_RSC_CFG				49
+#define SLAVE_PDM				50
+#define SLAVE_PMU_WRAPPER_CFG				51
+#define SLAVE_PRNG				52
+#define SLAVE_QDSS_CFG				53
+#define SLAVE_QPIC				54
+#define SLAVE_QUP_0				55
+#define SLAVE_SDCC_4				56
+#define SLAVE_SPMI_VGI_COEX				57
+#define SLAVE_TCSR				58
+#define SLAVE_TLMM				59
+#define SLAVE_TME_CFG				60
+#define SLAVE_USB3				61
+#define SLAVE_VSENSE_CTRL_CFG				62
+#define SLAVE_A1NOC_CFG				63
+#define SLAVE_DDRSS_CFG				64
+#define SLAVE_LLCC				65
+#define SLAVE_GEM_NOC_CNOC				66
+#define SLAVE_SNOC_MEM_NOC_SF				67
+#define SLAVE_MEM_NOC_PCIE_SNOC				68
+#define SLAVE_ANOC_PCIE_GEM_NOC				69
+#define SLAVE_SNOC_CNOC				70
+#define SLAVE_ANOC_THROTTLE_CFG				71
+#define SLAVE_QUP_CORE_0				72
+#define SLAVE_BOOT_IMEM				73
+#define SLAVE_IMEM				74
+#define SLAVE_SERVICE_GEM_NOC				75
+#define SLAVE_PCIE_0				76
+#define SLAVE_QDSS_STM				77
+#define SLAVE_TCU				78
+
+#endif

-- 
2.43.0


