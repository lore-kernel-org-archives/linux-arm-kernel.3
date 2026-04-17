Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D46F8E4B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=tFTHvojK+9Yq8nHFlGFGTIRemA
	QvlmYEq4193dqXRXzFjmeJ9/xRo96E+eKvqwcvPvm1v+seLLgb9gP+r7ruDDX+vbzLFF69+oWiCan
	Lz/zbCQr7/CqpeUwLKXkKy5AVr5rbM5enXgcOtf7qPX6za0w9/a/X2ecFvOevLmKZMgFULPuCeYfk
	+XXTdXNnSg+5AOo5ftup6T+fd3JV/v1GbwkJxnp2CfImrPR46HJpPkp3RiIAuJ+5ovH0LaQgWYgbp
	p7PwuRbYoRpsHimZT0RIWumx+ABQHGRUSuY1AwO1mfqv1CH2GnMgYP5b4Uj9u1yTgbgQWsHIdAcwn
	BnojWuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjF-00000003ard-2W1V;
	Fri, 17 Apr 2026 07:35:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjD-00000003ar1-01Vz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:35:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fSn1065680
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=dQA4SZubLDaiuBxKUYiIq4Ybr6w
	9vB2BsgGzSRGwKmTIa9iWQcM5nZAKHTxfTx2e9YuMUbKkoC3IBGhnFBpy8SLrJnB
	QzbaEETN2tXw3BA4daapEWSQT7jXsxCn1/xI9emN1K8yRXpMil4Ib6+ibHd6leQ6
	EWS8pmarloLtU50t9Vy1sL3S4mgZOjkyPmYGPAe3v53WDWCTNlgw+qjc5sjWNZEx
	wUnjMcO+lfHDKU91JWbb4XAMgaA4ZCHngjFmeXq9d+Slkyt9DE0X17yLdoPhZhnB
	wC5LEhbergpdWw+A2We0mB0GYiZP6EBrEkXirp4Jwvx3BhVz63LouU/A/ZA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af2kqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so518819eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411241; x=1777016041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=PuEHBP/7jQeDefPCL8O6T046S+kUmtx655MiuutPZTjbmT1mXAJ98VeqCnMdG83I4O
         Pp5KfRS46jtgOYdBEDesT/6/X2YZ4Mdcs/YUe17rSGPVzS99CUD/WZIKyXiAvt5fJ9k6
         3aagGxzqR+KTGLbfmQkMqCVf3qPLE/mmAzrpFL5bz4WXuC/gNQgdCZXRStf/SQbCL5Wm
         4FgPL0QP2qxcS9r8cxYAl1DxPavGsnDcGqklxUMKkEgiO6YFFmB95DfMwTo2piD0nEOQ
         QojwZaEumwNb1bia+n1XO37OcpLGzTeEeEvgIcY0IJBe8OKr2hglvTnXSx7ELqGB8jX3
         NWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411241; x=1777016041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=kGE2oStyRXpdF/VNJjP4rTaQj3hIjvyCSzmZBrm9ghUq80tNILqVHnYpZ0LmUWhPPC
         UuPCo/VPudWajDHKR16sMcYpm4m0Z2TIKSfCrDAglipHL2GnvctdSOW4lzL9fudZhDgd
         ByNOQp6k+V2B/VIn91DX0BEJxlWisVmObsToN+X590khpc0MXJB1zx9TTKwAw4jv+VSi
         XtbVTBjO2w+BFXlHpJE9606VJOM/EOkT0Xv7plTUUHdzvcG5r9pX0+Lc1ABmyeMbV9rX
         bJKBT9Db1nNOJZoiQXSV6PJ3jWPp02Ahyw4M+bzhBM1rLCKBf0Th/n0INZ0hRQf7M4Ww
         Rl3w==
X-Forwarded-Encrypted: i=1; AFNElJ/qxkNVP2WNaQ0EbtCIUqe3BmUoLNEYTAEI/Xe6TBSBiJiBg/1OUUDGDsPePSeCI1beSHm5iGlrFiqoUZn+r0ie@lists.infradead.org
X-Gm-Message-State: AOJu0YzGaWZ0KHgCJOqbGgKRJq6usbVYBo7Tz85EwkenzMYgXWm5SNMJ
	0lehei9gtVwC5WMSwTltuMANrUh+2JANfOVQESDIcn0zL1kmYC21IXAyjZ4v4B/Kn+fgdaLAP1q
	U1+7hsoNajpczxUwlRcrKmMXWmhimPrAMElXWDrSzk51neZQJ4KkXbPLemRUMOUC+Ew52XDmVOg
	1+FA==
X-Gm-Gg: AeBDievL9d7mM0kdx/0UWSMCvOXOSSRkWxB+5BN44U2QynDi6cNtspwtYbJqFBu3+/C
	VI03uX8i/VJvVVQ6QeOr7GBx8KSHwwprCUO0mPhrY+dbU6jmuLqmoqvsG/ufzBP3Pz9rABzI0HH
	g1UpLIMyiHWw42cxy8fshIsncd+YN3EuVARid9DgdAdY5rSXw3uHb7zZpVgpYRL/4qzbuSiKjB1
	NhXpDyvW4DWJf3t5aBJSgWi2G2BvlWl4yH9AQaJqOHnHzipOusXoIk4qzvyy9Jxq+NQ/dlHDEs/
	FDjxqxQLlJtjj9bumUGmFUXsJTV39iK7s9xEgUUqXVraz97KNgMj/+wUBa6J70EGuoQTTImOp5m
	kDpEg9KJExtDddP6sgcQI8LyjK0/bYh6v/jTottTXRFu+XGFnVM6P8UR9GmPSGHN/ZxchFHF1xD
	Vokm4BQIs7shc=
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814633eec.22.1776411240604;
        Fri, 17 Apr 2026 00:34:00 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2e478a34148mr814613eec.22.1776411239982;
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:33:59 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Fri, 17 Apr 2026 00:33:30 -0700
Message-Id: <20260417073336.2712426-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NCBTYWx0ZWRfX9CozEQFfb+qn
 C9YSTthqvQoLRZT+b1AxBxMAmX0YtXjFwlliA4F8GRxTfABgrDlLr6jL4PQLTtoBr/crvUsT5kt
 KPraKuY1sBD+1HHvagWtyqZSsz+MFEgxAeoCU3iD/ziUqpDqBHR5S8sQi8rf5eTyvZRTc1EQJ5d
 OQyh+ngPs+3OXHPBh5PhertJd2Q0/oFVXm704QTGasEJ19iJcOhIrQ+1r3rcmwycUukiY3/6n5g
 je5/khwN4QhHi0+9hDNdus7bVJaRiHKXdsDbi2kxQavkBtq/PD9/jE+RlPV+4fvKn59E7NDKjt3
 iG6Qt6uTzt32Molbr1gz3IsG3fGHu0yH40aJLgf51G+TbT/8xg8V4BiiPZhkl1erctdzXQMY5c9
 6ZYZjgzNbqo276FbOLP7iroyV+kpXnNXe7C1oQYrgJK6TzM3m0Zw7bqYwYkUIgOVLk0KTziX0Pk
 aomBVlaR6+sMFfbcTtw==
X-Proofpoint-ORIG-GUID: TZkDBwJpeZVfewCMuFlD9KO2QMDkNLi0
X-Proofpoint-GUID: TZkDBwJpeZVfewCMuFlD9KO2QMDkNLi0
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e1e2a5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003503_050423_48B53966 
X-CRM114-Status: GOOD (  21.54  )
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
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
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
+    };
+...
-- 
2.34.1


