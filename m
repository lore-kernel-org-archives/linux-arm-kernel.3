Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7602C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=OQxTmxNBOCqgFZUbbamZsbPeGb
	JaFMU4hvwt2p2YmTQ5nu+8IW4GwltrTS6VmGXqc1OMxKH6Tcd3NZUN4i3WfV5ztrU4NZCsnwEuHB0
	iYY6t9DuOvdsRIoSoNcyeh2WBr7w7XPy7C+mys/DPVEnfmToLXHzc+GVg5E9j/UOd+OnViGQG9daR
	VscbyeLj6xsSBWDzgd3Ni2QqC/WzOtaiHU3/pSonNhjlRnM30Nl7fLaB+5Z7W3gRN8LuKFjdOgJ4c
	QKxJpxS3obJRWQefKuMKAgoK0QvxdAeV7VrHW6RxsYq3JFCDmbRUQttEPATKy0C+fj4kShfFxm9mS
	M+ZdEcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLny-00000009ntu-1Sc0;
	Thu, 30 Jul 2026 08:07:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLnq-00000009nqo-1VCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:07:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U82aLM1385285
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Bb7aBCKLNQAAemXPgs1WjsrJ2eF
	TrLboo3xX+rVmqFXQFfT74Z/lS81Plv3XvNWJSKKsF8iVueb/NC8dzgR5j2U/2hI
	B3ZLR+nX8Kb+lJhje4N601vqOU7pfyx5lqvyEaxDgNh1njAcoRDwadIxQJMUYIKv
	RH35tAIDRrCtigMlykmOS5POIKdpgKBtHMgRbMce8GwQsZVz1tFtza9CejMer6zX
	BUtnkmc3BgZt6r30BozfaDBZPFYPEUDL9cmFmwZSnXaZeJyqe5U0ma3iXZzcmQl0
	smJ/HeGJxXl0UZfA5lg127BLBq+/kTNuBWWOEd1QIsugCJTWdaCxf5a5smg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rp00tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1052693a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398861; x=1786003661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=a1mKj0Flwvihfr+SGw+qSfHGc4r2JrnUBo/QxNxz/s4msrg7ETmVG3XX0Ia6ruiWpS
         1AI5/G7CyV57B/vLLRejMDB46m7OmwvDqzjQZVK5RCxAqxRAcqX4gpvckQ8r5JeW0GRP
         SiOk3eT7NhduJsb+v1sm7aj3vbh8SJX20wsT96SVaoFGCCznPfmqMgy251/0T9Xt6r8f
         F9bbRb/RFBw7UHxtyZOB2U/svIna6O7lyVNB6/bQQ+9axKbn0daTYAy89Mj4stf7WRuC
         95mAU2HE2XKrlxWWY3gniZVPsxLEIEK1NnWF4jeWubwSns+5pqAKVn4+kvunWH0gyqvd
         6IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398861; x=1786003661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=ehpxpbLo0HklrBem+t62gAjb23QEOQx7DtpX6PV31dreH+8FkQV9fZmOOBdYft8mpv
         dhgRfV88sfEDU2rRzPXOmRC0JW8YsDd6PDD77oT1zp3qI2oeAwrdUCmET3rnJyqwzHte
         AUy2IAsqopaEaRtgLlqEzMXiv87yQtpPcG8bTaryGN8HYWvs662/L5lJOPYv7V+sdjV8
         xYkKkowZ3FjYFNzngn4XwFUGF8Ab6e4wd+yZOD7pbn1bJIjFK5zAiegMsYwstavcXrl8
         JI5WMo93dxG/WhkkOuOLn62WL/KxxB+0f1Me3QRggDdUGzDuGdIISHpaZGAuRO4BP3pV
         KYFw==
X-Forwarded-Encrypted: i=1; AHgh+RrJHTz9pCImrWKdbgEgyoMkhfipM9cq0Y7JU6g1LjSGfREtRy0dSsm45I007qwC3Pz2xSQBU7007dnFBN0JSjb2@lists.infradead.org
X-Gm-Message-State: AOJu0YwuQzivlXvrQH68dUMdljxmExz5jogcLY8mPof4R/7vLirb2vxy
	WiYL84P321JozahsNqsAhJIN9RSTvBvAbuuB8IeFARMWLS6XapVGSBV5PxlTCyYWSZYPjbpQ0R5
	AFMP8EhvBWYoHn9IoFJxyNRrjExiN7rBP3v42g1mEIDXoYynf+hF0gpIB/Xy1C2uxKVDWh6GlyT
	RjLw==
X-Gm-Gg: AR+sD11PKRp/AmG4mAbh1yjuQsdOSqDmKOtCkgKpERdb0l1FPaP846RMd+vJtVuB5ty
	JJH2lfIU6A0N36rVi8DYAfcdz5orOf4rInafDWawTSwJMfzLlVeDUkVqpUdQer9xxkF2bHRbV72
	50Gmtmdj12bo+kDe5o2Ic9G4sOfBiCAglF/K+u6yGkKrj3Sz3zAmcd1AFK1luiUpMwEPv6PkNM+
	sLQhooSPZ/MDABySbhSm+TbcBMS7NvbU2ufgPZSGzOiMXRD/shXwy3N83DoY0fgvhEEhcAhRRxZ
	JBTPOfm39vS3AHdhjYrQQmQJAgkEkuWbfaTmwKOvNcQQJiXM3D9DB6BA7Rh2hSgwmQYha/PWeWB
	rzLH3LFb9ZR30QEURGHgWz70BjRw7HrH2yuA01nNZyvx3C6vfuBBuH1E=
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501441a91.41.1785398860893;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38f9c08163bmr1501395a91.41.1785398860393;
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:40 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Thu, 30 Jul 2026 01:06:58 -0700
Message-Id: <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX+YKzlnIcof0d
 z2qCgK2hCrDSTynLrAiMmfY0LJOGozGagTJQOluPxsPIC/3NYeXOi4otD7X2tUg2b0XCU3/Hcql
 cfOiXsYy3Kgl+e6aEQlY+7Grhdr1hBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX9TQ3G34rFvgN
 H4IBEcxxIyl95ZQDSZ019NF4Hw0E+xgo3TylC8zozEDiSwMqUdbE6my9cJvS3sbrjYqu6283MI+
 V2YC8MDhG0IJeTGir9Sn1GanA774LHGfLkUQPeUzInkmPokDWfgqscsXrfUd6xXuW606LLhWBT+
 9VQ6QBy4cpErzyk0+EQh3gNv47aSVQFpUjDLYlNmjeD5WiYNqlOHeSO7jwblXsSBb37riYzncUP
 SCaVK8W/ItxWLqw7F/cPI+PTQU6FZvAi4PO+kmbO0/Zwam+YMN3ZEvhmjuPMpsO7iHoIepZaafq
 PP/AZa0fsvuQSnwbcXtYYcFYxyAfLLKEeMZPi7RPZtx/Ryw8fxoThRaBZ5C3VS9xIngu7VaRyAw
 86URTKo771u5QTBeuujvi7L+Cmy+uwGJSjG+dPUDzl/8+7RJeiz83jxcNopVx9QufAh8Jh9e0GK
 a3wZSlPMMl5tZ2qa25A==
X-Proofpoint-GUID: Pp4fsLD8pBMSgy-M-hK7jRoR0M00tzTz
X-Proofpoint-ORIG-GUID: Pp4fsLD8pBMSgy-M-hK7jRoR0M00tzTz
X-Authority-Analysis: v=2.4 cv=OcOoyBTY c=1 sm=1 tr=0 ts=6a6b064d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010742_406517_F737A2D0 
X-CRM114-Status: GOOD (  22.23  )
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


