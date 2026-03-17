Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D934FB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=oLzyUXcfUGbxOoPt2YeLmB3nss
	st1lWHMSL1ey/HPtUW/WEkgshoY/jV/Qx7d7dUwQoiLBCi0rjxr7M4pWj/LQtshGFyM7O0OJL2SeB
	p93kTjUVZU8jmhB2GgIFJ6M5iWGtgEII6NkF4H7yrT9nia4LguogUwlrm0wojGQsNI8DUyJZskdcx
	meSOZRJmVzIuRhxOdCxTYnDInk9pFdjC/TtDoGlMu8pOKaqiyCTDO2FsFUWNSM2wXRJxLm4jdHbm4
	AZuRWEsP6ZDu3D60Gdcd98n1wbqYbDlxlAoa7sNQMsRViUHWCqjkSPo6WE0Gs3GGVR0BckZD1ed1f
	ogF5xRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L50-00000005Ixh-2pPO;
	Tue, 17 Mar 2026 03:26:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L4y-00000005Ix6-0oAx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:26:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GN0tB31639206
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=AAAnisiFj2zY5YrL3HKPnJJK/N7
	2vH3oBAanY0B6iBl5Mnj4rU09pWMdtesDNyGNJhoDPO/e+rGpbw3+XuTPqJXm3Xk
	DxNmIftP3Cp2ngm38HzQ3Cc9pwvhNjfApjmhjlYX2370JKxdCYVJpnrkjDkMXkpQ
	vAUE5NSQYv2T54IIPAvcQyhlkigNXgDcv1reDZm/ypAFIKowlHqTpNnnp0LODkkQ
	9wncZ/e9bjv80VZolW8G0bPOmRKLPZlDixYHZ0uZd0Y1GcyOnHw+uBkpZZEWIp3N
	L3HL/oKI3XSUuEfoX7HEtAl6zTUWcezLMUtoOa0HzI+XF3bGhhJqQ9CFSog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0acjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:26:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so204522eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718006; x=1774322806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=G3WYZU4y1Mny+qPm5vlEuLRp2R+CC+7wES/r+oqZNyWQD7oKkFuDoCQgeOoEygSSLi
         CBovivaqa1oPycpdqRAToACrFvOBG6uyM1CQL3VOC13X8UdrRCnzHY2eHzSRNbVYHhlJ
         VW3xlwdslK4F4ShXbybiQVARrOkMpzszbO5QGV1zVWQAUzRUFF7uNeCB07nzkmYo9b92
         6n2eAP+kKHTbX2qqV1VsqXfk4qtqvS4BxG6oDwDKyZg5xHyQO3xF6Nuv8RmNltmYetZA
         WepuYGUkFCf2J9VkOSFtjnuC3QkfotTzE0ELkMJRZ8RI8dMIpWGsQBSPMriWOyjnY72r
         hKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718006; x=1774322806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=D3KmZT3JJzyZD39QgYqYG4misuWQo7j/CJKHYcQ39R/BSKkg8apjrQH1VEt25it/Fm
         KPMncJ7EJFPucmf/Qk1F1wlX8q0bfKmvLRV66ke6utu1Glw3LRzIk53237EkCruZ62rR
         JsKlRnNsmNADJlAW4HiKBwiK2BdjalV9yXmDUR4260N+QEsmI6Svv8VJCdw/KPwQWlag
         S2P3tPOUT6qg67gbrFhJTcpDl5q7O21b5M4vjAX74r2eVdZL3NedWo289YO1Yw3v/O9u
         KO/POT8O5pHEozhUes5W2Jb7MqnNLIii4IVujj0g/Vi4txo6St0rEI3ov8BaD8DO7mAp
         U8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZK4yFpHWtyCSUqUnpz9mLJ+L+5KKGmGHJgNWnCmUL2TfwspuVhXGvW9OX5+RBdZpnKub0G2fF6PzA0DyFe0v0@lists.infradead.org
X-Gm-Message-State: AOJu0YxhhjFGkuELT4jN3M/BQyG8Q+xxEmB/enZu58wVx8p9jq+5GMaR
	UtBLRuH8kWeKC28SphBpm0QVMven2Yrl/K3FhP6ws4uu91YOEbSnnsqg3N9vVWQxSXjWPQf5CN8
	74RBIpwiyBAuZOR9WlObbpdbfi5HjxujVx7dTi4hBKJ+bzlQ+Z3Yv4j1lyihDrTjeyQlGBOUBWR
	OHFw==
X-Gm-Gg: ATEYQzyL+2TDB5VskAaGafSxKlvRENSxVZECIqQApScgvBzFZIVanYzWxrGE6EJkdbj
	Sy7XpEuLReU8b26QWBq9RB1cUPNC0YF2TWJWseBX9yoqDKUiLQZIeoNwFfHw0BW7zTSQ6pZjafX
	hciD5vc977qbg816WlxPgUpdD4eJ/bRwGUKHyRfgwjXxYZ8QBNAyJrV+UYnsKGEnTzCDWtNbDun
	ZE1oE8l4ue77m5dUhV1GRD/JaugylM4NtHpC8OBsdiuDVUWXzY3ho4lTC2QOKQp1jXo/Wyt6k48
	sxQS2G8OTzgVquJxaUOdt92KD7Ct2yBJrYhVMAOehNmu2t64D1zicIiKL7H+QXS6bF3oPcG/fDt
	pqBAzMGCYHV9bPJaIIaep+/ALss2e3od5D6uuvoIvsryZ9NpT4a5BfLx+I8t2rPDFrer+mn2ygq
	Z1
X-Received: by 2002:a05:7301:1001:b0:2be:b02b:1b3f with SMTP id 5a478bee46e88-2c0d51f2448mr704164eec.13.1773718005838;
        Mon, 16 Mar 2026 20:26:45 -0700 (PDT)
X-Received: by 2002:a05:7301:1001:b0:2be:b02b:1b3f with SMTP id 5a478bee46e88-2c0d51f2448mr704157eec.13.1773718005213;
        Mon, 16 Mar 2026 20:26:45 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:26:44 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Mon, 16 Mar 2026 20:26:33 -0700
Message-Id: <20260317032639.2393221-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Pr-fqZlKuidTR1_XD8LZyEHMTir1tF6
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b8c9f6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfXyhaHYGHteFqE
 OwN5ilq3a39YBMpoGheyQPKKF/Cj/02limH7rv8qf4TVSMdvPCUhktFcwJaehIdjc6lLx6VoBWP
 r/0fEkm8KEg5KhMYKivOK9Zk+MbsdKC2d8o4qu5KGEA7RhZi/VElBGy7PjbHWoHKj/ZWriAW27q
 fwUyPKXBUg6IHypMeGTP3NIYgk461R7jjSWN1GkLht0+Cmu0vMWLSUUZWkN7m67/tWLV0DBxh6W
 1JOfj+Hrkvxsu1ItqIn2mDq8+HHWIBHyJ5WbCkLw0oqXdI123Sk+h4Wk48SeSXsy+OcFhInU8zW
 uGCNDD1eookCQnxT2m0gqxQWr7P/kceqrAaRqd1WIaMuD5av54kNjYuWY0H5mRS7X/qjBqCKZbx
 fZgLVo/2bkO03SG2AKIPHjud/YPiBH6thwTUFJaz60gu8ETzMWvRIUU4cjb5ikPn2HAHB5iqVlN
 E/D3ld5osLtl8jsBSVw==
X-Proofpoint-GUID: 2Pr-fqZlKuidTR1_XD8LZyEHMTir1tF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202648_254082_AD47A02A 
X-CRM114-Status: GOOD (  22.16  )
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


