Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE474D39404
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=V9y0Evah1duYGh3xIkPVNhNo4E
	0IteDmLi3LIeKQgpZYGsefR/umGZcmV4zaWiLJD1UamXGZiNQU7C2oG26IaFCqPzpRSMPuuLB8K4h
	exkB25aESMt0fIzuZkwM7L9fsn25FoI7nN75wZzBvm5oOP6jPJG6T5VUHxgdMm0MppkD9c1xPf4rx
	AQ35OGrEnPdwRW1WHgLfJF8SQDFLjARaqAIdIt19zr5KHuZsokkfbJdr51crVTaCy6Fg0lRA6KUgs
	zuDnTMpiB0B98aoaNe9ukjuyYEMv0Lo8D2OjRDHP86vLfYd/GUn5OYlteULezM/lsod3tqPMYXwE1
	TY37M+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EME-0000000HGl5-1jVY;
	Thu, 02 Apr 2026 09:28:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EM8-0000000HGjF-3g7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:28:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326ok2l3044199
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=QOsiPHKxJU0AYO7HKMMYnthq4Ii
	kSXio3+LB27asj+rCsUYQqgIlPeCiY9HxV/48vVc/sJrRp+7flLGLsT6uaPcc0X7
	WMlCOfE5rsSTIWwPi+Ao2IgnCVlmq62Tr2Xnn9RD9YL7D3voogd/dojX5Orh3geM
	aAMJl0o98MwWXFM8P4EdQXvVojzVzgq1VNR2lBqxxaYimxAP5G5vp1O/OTazfskT
	XuM0buLVNxv3qLoswleMJOkypyNoYxp6PMeBDcEWMz/yfiGqhIUjymRcn/YEsIir
	ihif0/Da4b5j6ruH+wcGGhznU5wthOvfgcdTa5EvrPXITwiRQLQTADUYKqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v5pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:28:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c5b48baf75so5172277eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122132; x=1775726932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=L5ZKnsWA3lLrUkMcT8GlRqn4P6GJV64Nkvl7/ZuydvDYCg5orNB1pOFScjBlEYztHi
         XnyNgL9yspic+d+mTw9ml3us/YNoV5ru/GHr4QaZhKLWGHGW/h0JcZ+YxEb4fEPXflqe
         dQifNrQlYOYkGO8Pm4n+l99fj7lktT2xlJAOdgUIsQpdzhg179yzh6ib56ckcmUo82Se
         qefseG38B7vbalMfGzmkqSuW5GYvKFf0v15eHX7RPtXya7qeASxvFGUM8atJzH20nSCB
         HoeBu0MBY/y0/LrOTrg5y4BKrp1atbZ7ftypcaoyjbzrETos93eUl1Gb4m17jKygWGMW
         01Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122132; x=1775726932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=mCcQ5YnYE9jSNC2AuMxXJlcBfIFvEAC1kUkwCiE0YNb4Ccx+4etWmhOoksrY3CnvnF
         GDTca1xBr8afIP1tBdb3b7VH+N+rwdhpyiGLxCeEWI3wYVOTRfnMSQjdPlfgEq1aYWqn
         DOYRAmE0hgt28g9qKH3baRMdqpvH7L4hbSuIIRblRcdUlkJFSh05XD+Z/j7nEegczN/Z
         CmcKFl5BZix6/aWbj0vnaxLa5SPUW/nzvs7fx1owL1aKoWWeUdjFMoscsvAb6uowblkM
         Dys8vXcUBVnqwnDUenHbtiVJ80X+leONj5sqTBMz/kEkN6Ly6gSKjBtiiejVnuIARBRm
         Ea3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIHIsuEssd9CBpg0w4iiLHJ7IO3p9iptqnOu+jbPlb4BK8jQ/gXf30orYUIgNJ9bC6FjxuldZk8HgF5gNR3mlN@lists.infradead.org
X-Gm-Message-State: AOJu0YxGbasoAS930HlP/yEwCUE8ob78upARUpBy7DWe6BBCip2JGSnV
	g+gsImyf2OEsJCU+MJcHlVn6kN5dsAJ44bHUjUsYq+DmgFe2/jmVGjxMv8H2q4yzReHnPjDWo0X
	amFHGEgoRpJ7XC/rNazLEqmV6h9THCkbwqSjsiPDWbrduw6bvTQXfzRcwkzIb2i3N7A3jFpbJb3
	rkWw==
X-Gm-Gg: ATEYQzxCH2/R6aetIlHaL57WhAYjf5PEcsYL8GYqwPm5Zg2n4PrpYaaybet+9SAiOzi
	HYk/pO42Wo95eJVAYmeutuhrSag4ydV9nNmq/xgEB7ED+B/tGN1b7hIesLZVN7jPkjLkQB/ACOn
	8SNdDwyCJ5BMAqNn2BtGm+3v3Cy4/cbiKQkGFkoMKXB2lyc+iX8RulOW4kdtCskhvisx2K98bo5
	B4Ymq3Acw4ZZq3ZKNvsjGZAiGGFfA+kLG5Joax8YhmfAuSy0btwbya1SK+uOPUEVoqt2oG70aTm
	L6cZAXCz4S8R3HilqHsM0MdjtgSS9EO7u5opld4n02gnnsRndJ4JisybY14ZngHlKAneyqr5VHs
	exjLb0ArHXKG1i8QOGOdJUKOnwde/NbvJdmQhr+7P7/5Rot4K86SPEs1dWH9GLDumpWv7GkpM0c
	FB
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1380023eec.24.1775122131683;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
X-Received: by 2002:a05:7301:6787:b0:2c5:fb3f:70e1 with SMTP id 5a478bee46e88-2ca9037b03fmr1379996eec.24.1775122131091;
        Thu, 02 Apr 2026 02:28:51 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:28:50 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu,  2 Apr 2026 02:28:32 -0700
Message-Id: <20260402092838.341295-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce36d4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX+ub2mG28B3mE
 qIrvfXvsH5PHletJfT94snKlUY7mxlnI1Df+fwBsxeQDeoIAE9NN7iUBaWzYIL441qkIPpcDzE7
 GcgLo9n3Xl3oKvIsCcoqjRjp1ATzVjJI6JQKCOdtHyO1UqEzlYCmWJf9Bv9rkPPWq0olLCXHp0K
 CIyIL5sti1aPYDIFUxbLMLS1emXfbkUOGb0gOG19S0iZVBHOO6UcN8aMdxpLN/516WCNxsvbrpx
 9H35oXwxJ7vX3T1/IEo7z+cUaqH0Ldw/rHYmLpMi9UvLSnRRkIfN1MrxxXMh3RNWdcQHnj+BlJC
 HJfncd1BRbLkik9mbuUNkPpJVQP8V9X5+bzmqFGnNpLtsHgQKd9j24OhTfmV4aeGus+vJtj95tI
 Gi7rcYwW9oym5fNHJnSeLkAGbiOtg2ByUs4ZTWWpxXetm6X6Ruw9pMVjb7p/XmggM/yXAk2mR7R
 pmrbnpAmw8UmoWcLrSA==
X-Proofpoint-ORIG-GUID: Xn3SmjSKT_y1_4M3TvNfg3PUQbIxGaU5
X-Proofpoint-GUID: Xn3SmjSKT_y1_4M3TvNfg3PUQbIxGaU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022853_140092_B480CE69 
X-CRM114-Status: GOOD (  22.74  )
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


