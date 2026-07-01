Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Ck+4rilQJM9ps5KnMM9zc0s/5S
	YVeqteDn6n+5hJnyGsFKKyf5Z6XLrx453FeEEfLlI2TYvTEk8dq/Y+p+t4ymvO/LeG/ucFn+KI4F9
	RJdn6ZNrygGzRBsJ3svAtYy/m3TqMGZ5QWWLTU0moyOjbbB2Rnc9AbpkFrsbWhDyFWKMfOB8hdZNe
	GHFX3r19niHRmNwKcbUg1yy+bb+uAcVnG/s5TNDZ2APlIJY75WwZhNCnNRSfspGzPVVAx9ShYA4Ky
	UP7hgEx4o7psEgB1JmDyxe79m2XU4hXDMdG3ttFEjv94Dl9lFbwRdfeEKU8CpanoQtLEuWDUDPGZB
	PCz1h3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvb-00000000kBO-15LL;
	Wed, 01 Jul 2026 05:56:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvY-00000000kAY-1XLd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:56:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lWvC066024
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 05:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Y8aDjuETy9TX9pqF3g7vV7t1M6K
	M/pd7hk5Ez7/24lOylHcAwBSbrR8uOCYTx8sAHuWGT6kfKLKTqsPSnx+K8yh245h
	qkycdnzV5D+9UsBQaRGVuEKxRqeaRLaszn+1rs67SGrQutfMBZaxmxRVrod8kUFt
	T9i5nO4jfGJImK1Zz2GKGpuEvOln6jEAs7cHX0evTeL26WoPmXlCTVxcMO90o32F
	pYyTgRObV5w0G15fNZ+BoBSdegMsjkBcoLpddvnAdNWzN1mhXhkrR2pEzJkBy6ru
	FCLHWLY1by+QY/B3zAP0zE2+5JSpqfpy9KEd47E+rLCVx60WSyxUHPxwUzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqjegk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:56:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c825562f8bso3514205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885363; x=1783490163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=F+ImRpL9aIftturydaP1VoRCbHpz3LCJ3SQ9RE7p6KPS2RmEI2oIJD6UuiH/oSMOYT
         jUVkQYEIwY+Q9+MkcmP+aEVodLINsd0WgPZ9FJoiRpsECF4FVnKd6y0j3OiE2IjnsGbA
         5pw3iMgdPK0LTBgyRWlUQeLxB6/N1y66iQmXVQukZUjmWcNqGHHVKPuIvukM+PQPzTTE
         +gN8Y1NMxoiOGHV3aOa1n02Vo7PjzKQimLUFBPvStfXFYNbPAwAAV6mdG4w2obhHFnip
         qUAcG6T3EwWbm9mXlM1KGBBpZfBC4kEAHHgjUiDJtgxqwP52u424mc9pTpYQYptChlmr
         2Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885363; x=1783490163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=M65hOcTHoDm05nAViBu8trurzvw5XoVykLNDiCGnSYcfXkGZ2Xh9mu+/Uk7M7ePjTG
         giBjqh4uRHQOTfvy02IpF2NfmMJSblcoKrpD81nNw5M+kDnISu9BxfS5WxSNN+amMI2T
         6uTtS15HrYXz50zEQ4lvw1wEyjKuwa0LK7hWIW/5R4gp+2NaVPfYXVmmO9j0eZzrimaO
         OAhmJcYa4YN/WqyAIfbYGkw3TJ3EnSU0tTJpAr52UqRcJkWkv6EHFtDrNCGpNT1K3TE1
         V4b27Lp1Ic82oRaagcuJRSFKavHdopjEI1AZqqx4FGe3fsrIDnSFpZpsWLxxKPbTWBPQ
         naXg==
X-Forwarded-Encrypted: i=1; AHgh+Rre5rSG8yH/iUFf27VCY3JQGNUZ5CcRAdLtSk+DbI1bYJSNsWx/xI1DGVOyqv2uPvh+Xvbvro17/pERssGzjKpS@lists.infradead.org
X-Gm-Message-State: AOJu0YwmwV/Ca50dpJwpclv9RJaL+jqAYz4cJlopNY9EV74FTCqKRrx3
	WwIZR6ZV9uFLcMiZgSLP34u5N04LwYqS5dKVx7pFcRZl5a88UW972kSm7rWJgNdOsOaDWWFn5O3
	u+5b2uRL3jPlaJNSn3ZZM7waMjs6e/93COdmA2Fe0/IlWGUaxFIPWQNo6CNtfm9meq5UoDpbvuY
	G+SA==
X-Gm-Gg: AfdE7ckEex0QmjHkMfSuco+OL6XpgE7T9CA2J0ggafwt4lBbcbcdGFMHmmQ9jc3zrL/
	BRGAJF40qOM04YGZxpNQpuVt9Pcit+cFpV9u2KHYE+FXQCnQskWd92famasR5hlxu57PwBfsCWL
	dQGoN9VR7k5uUinK8ZaJt0ni9EY3QS/Ul7KxnRn/bXj8RsseDS6pY4wMPqwbvB6Il1hGwV5Ng1A
	MFafdKl3w4typnMNG2qxYHXrwq2lka+wS2DvShvz4WmsJwfnSNSwOY17yCK935/A4jcAlPaGAg0
	l3opUjvLy71c7nVx4ncvXGWYJXR/QODHXy/ICh1FlGk3cEQqFlBacrCl9FBlStQegaj6iH8Q04l
	b+ikEfiJEUrSyOIm44mophxJuy0mEz1AGmPF4tB6cx8zLIPwRReOQofFMRsnYojkwsA==
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3899145ad.6.1782885363191;
        Tue, 30 Jun 2026 22:56:03 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3898875ad.6.1782885362709;
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v15 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 30 Jun 2026 22:55:23 -0700
Message-Id: <20260701055529.445819-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Hy6qkb94ogqAHq9j_Ei8zyNDHJUb9ttu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX3pBtMyOid+4n
 PJKCxUTs8NQ4jLpeRedjw8xIvuNRCs7LoYhx/G/G5fciYgNxtKbBiUEEWESEQ5fIYO9oxqpKEZg
 ip36SnvP53fNQLV3R5oLr+E6MDDENB63okh9JOGHLJmTpyxQCYpAOKgPb7MuegLSV0ugencAliA
 LQHqQcsL/IskdmmOsehiMeAfh93/a8Js0rhWsqlkkRpe0+TPzAt6j8ZcgGrSH1EYZ8f4+6Etm7T
 QbFYtNFjhc3Ga9kN57EaIbwxhhT5bLGgF0SyIBzdmaU3AaKLTDC2o6onl5FYfLqIBtzhdeBXs+6
 wqt2LEcuH9hCz56WqTNHR5uAJS93A6u9zjJF12kJ7faGD9dtsSwcbt45Th+oa68staoSl6M1jn/
 VeRYuEP8AOlQxtI/ZuR4V4HuQ3EOaGyGe7RhbF7fKWIbQVtz/IFqraX3dFP7Zoy3er8fH8S1c4j
 PpNq34oPffIDgU11KuA==
X-Proofpoint-GUID: Hy6qkb94ogqAHq9j_Ei8zyNDHJUb9ttu
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44abf3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX6iOeReyZJnLQ
 GcZ53AA5OJtgYbPtOmmBDfwEIaj9Trg0Hz02oFXg8k7tWh6OlOAZDLL/FV+hn2uJYjNtBedPktM
 0Fh5EApoiRxM/muQmMO2byWpGX8mIEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_225604_443488_BF082AFD 
X-CRM114-Status: GOOD (  23.23  )
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


