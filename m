Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC8FD4609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=mIklxiG4Mbo3K84qegJI0l9B1A
	9drfERKVtmyuuGOg21GBD3I1fRrNEuqhkz+QoCdhsfX5BIMtFyNY/8C6EA2085V0/yFHXD3kXSGjw
	pjhH/HdDL7INRlQoMRkzgpPvJsUARfKBUIrxRik2bzZ6o3MpFv5+ioRgFc10n9PlS+QMf12HI5Ikv
	8ae0bZKruUegWETdIJWTCxNKGTnEocz1oQHuVVXNuh5nrAVuX10jS4K5j5sJbjIMgejq/wU5ViiQW
	OOh11BuTg/r8B7S0/ex/8dYkVN41IeRLzVYlnynyycv/lvTUiFMJuD2oLLJo7PFEQMfTZggYkd/LH
	aAtuSxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkh-00000005DHe-3d4z;
	Thu, 26 Feb 2026 02:05:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQke-00000005DGG-0aXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PKPE6b1512818
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=A4EixJ0ttI4hMqhdfYd/U5eSWWO
	gYXDR044Y6JnDWur5+VdBa3bEfY/vnXdx+HmIq69cMyMYV/NFXJX5lksESB8DP7o
	FzJE0/RTBCsX1cpm3iaXaNbpnZwFBdVoU1/r2KrndX4H6KPkAPVNrrWH7IcDnDc2
	RxQESbIxtiycPQ8GQJ+oHwRfJrOHVtLBSUA77/8arAqP00/FabAMSPRWmWZG3K2X
	Dij9l+JLZsoZxSDr/6sSwysz1GcoXPEF+0EPSJ3MIJpUHKNdRvkH3uU+YcEh0YX6
	5rEImtjzyq3UxkMrLRDBN1kaxKyiqWGfCyHPSJnkvOqqr9OHFek5gldyALQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyvf2gdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c448d15cso3583606eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071514; x=1772676314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=G1p1nWWNVfUAQUzG8bDycPdT617tgLYrlhlotl5qT9w5E1nnCTSQKablgmxlbKamEU
         dqRlGGQnyMrHrSU3sWtU7Ae1NBD0T7qeZytoe4wMdDgi05aWtYblievzOz4OmMaLTwII
         97ETeg823S3Tq+AKlnEMZfEYsmVvq4KyH/4U2eyXYP3MSd0aV1nCNDNyycTVroBpI30f
         R37F3c41gZODuNF4VOgmtZQPjvANyvbfqqHaUs26ZA6pTwTGq17ziNzs3uoIKqUdKvKj
         Qa+tl8lHq6e8mVgWoHrN5MILLDdHHh7WtSA5j5xAE36K87VqwInRgvU1i9KHpZbNwmeS
         AFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071514; x=1772676314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=Pg2AITFfHs6urh4H8WOnpFWyKDtOMm7S12FdLpqcCcSRMDzq1foeRBCA5JmMBZdUSC
         OaCR3Wldl8xFAVdns07whoPD3N296k2pGgymbapwP8WyWUeFN9ugGSpUMtHYKNTTiV7C
         YZWVvkAvQUnPuhXBh6imIAye01mCCMDy2KCeHIpHY64TzMOiIF9l8+D00mdpxoEu+/Gt
         EoggZ9SMsFd8RDNMH4sm3v9DLOPRjzLpVBmUcbfpNe9NEUKsogd06OA2KIVS2a+yTmDo
         up89WJn2nU0/SDgtnXcoL0ElZiuExGD+nL242adx0hpD42iUHZcWGEII0GyVzReVRJtW
         bd4g==
X-Forwarded-Encrypted: i=1; AJvYcCWNpkPEWINFCj01CPcwDNFTVScl29uc2e0hMFQbJti/MXt5cSs5Q7y84E22/PpA+bCSRl2V0C/25cvfnFAxunnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlM4CrF7O3t2c2aOUJBEuVyEoLOyz5AGeaAYntOt3u+Ej74PF0
	DM+D/VoZYr7+lL03HihaB4xp+UQwXArNJX5F/zXUDQXbKBMt7okuns0OCAaUDuqD2M8mVOR/o3y
	zQVMaYUl02t7GJpGeN//8SNbNqWku7Gxbp7jDhQKZDKSQ+Y5cSZbvbM1MJzt4V6AhzfD/YoOilv
	B4lA==
X-Gm-Gg: ATEYQzwFTAkQ1gRM9H/DeJNt0D1lv5hRXmCIDAxH4XPQUTqrugVrdvGHwwSG0UjS1fe
	QGAxgju8dg5aFWa2rd+DFQShsm7JZJztbOijZYhCwbwZN5c6EfqsJv+w/mWcvUFCdoYniYuAwun
	v+bcU+HrgHXgNew7fiSIHRl302OIToV1U6ejd2/unk3jHxiV7wviuiHyilITNy/640BudBMEb6E
	HiIBw0rdy1SY8eKIJ6DpW08gUscTPt2CfrbDiou3Lq4wvI3CF2A4sNtDAjSX9/1SRcRcpyvy3nD
	Jd3ceAWTrZELHZAMXd590P0IhQelSIhh6pzggBICTOw+ngm5l6RJzsACTiEfrdPlWAljzfSUePW
	CnsyWO0Y6beHLuhVV9GJytMj1YNwFx8RajQ9xNW++TFhginG7sSj5MrXcZ39eJ2vD1Iy3cEZAcs
	nr
X-Received: by 2002:a05:6820:1994:b0:679:ef25:336e with SMTP id 006d021491bc7-679f3d042f6mr328408eaf.27.1772071514077;
        Wed, 25 Feb 2026 18:05:14 -0800 (PST)
X-Received: by 2002:a05:6820:1994:b0:679:ef25:336e with SMTP id 006d021491bc7-679f3d042f6mr328387eaf.27.1772071513698;
        Wed, 25 Feb 2026 18:05:13 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:13 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Wed, 25 Feb 2026 18:04:48 -0800
Message-Id: <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ri6abWs6Bsg6Sewt2WU7xt1nkxEtpMTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX5nqgxZMZNrP2
 XvZbPz5LU5KyL9y05n12tZ+Zvu7GvEQEKyFVLDhJdPy80YbcB/AJa7paRzfdMX57z1hNbjW7+M1
 ywLtq6XYEMixjdM73DqjLSRQZ2bQ83hOuipfkEaBQNiFhyDFugauz+EYxXd8G/SzOXVFGbwsHkZ
 O9F2qMi7YWGROzDQF8qxHFuNS82Qs11RE+vvVg5Qs5W+bONN6aBfMIjq87vb/tFp1/GpC5Z12iE
 djjisFS43hd09jNnqOYBizq1oZ97/gAzIRI18gEKltZHItdCCboSGrhbCvKH5DgKHF5Fg72eibB
 ifHAA7dsW/h6M8wlKROm7wkpeieSzC9BeeTD+6EeClHbG1lp9tSW2QiSvx0+vHrimAgSn3Tq4v3
 89pX7FX5QrghJDUo9mcNdMB+30Oen5Xshglb+HAWoY9nKnZBxPGqjIv2UtzMrdhuAf3imffd0KP
 pyX30JuWsi0ovJtn13Q==
X-Proofpoint-GUID: ri6abWs6Bsg6Sewt2WU7xt1nkxEtpMTt
X-Authority-Analysis: v=2.4 cv=dZWNHHXe c=1 sm=1 tr=0 ts=699faa5a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180516_325576_4C009491 
X-CRM114-Status: GOOD (  23.57  )
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


