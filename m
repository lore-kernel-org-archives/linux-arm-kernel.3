Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67006CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=Rye1VYbTlebw5JPqwFza4vZ5Gd
	H8nufwhAQLOQDj8jezCu9MxNg2hRTJ/wQw4bV1Kkr5Ettn7MTVQAkW9S6mwHyG1j0+IvBpXPHeWh9
	Fo72yqbyEmiIGarwEmyAI5HmCN4t1r00AkvdZBnjxvdTMfXNH9FfQNOaRpMs/DbBJOAT8OppNmj8+
	eCaxc97TIRasEbnTHynYmJEUHoUB+vIsW7ojxglH+d6gqrEwX1hq0O5BZCs2fQup4xAyiPhywmCS4
	m2lRBsMNxHeLk5AO6lxKyTeOSWaTBfSQWRt0q0gEx32A3Q0CQ6po5z/mUVMha5zDlenT3nrCBnsjd
	OpBF18VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz3z-0000000BS9o-0QTa;
	Mon, 01 Sep 2025 07:34:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyUf-0000000BNp2-2qCN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:58:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNjDuR032094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 06:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=WDUyUbYgRLl7jdI7
	Kof+UedANVrgMe07x+uNpGBTUGIZeOIClybm8bgH+915O0qHldXZwwmRI4PA2diy
	7halh5sos5IXlC1CQdE6LFySw+LPnZgcXv76WAS6XIFXIdfIVULP42iSCFZWCIMp
	XTZ/MN/+u6TLFOVD3Ug7eMnqYmSno9Iq2GvGRTEM8x0/3MvIwH6Z5YnSAhCnb/U6
	iA89cqIJBkbJkpihO5Z/V+oGtKuxC50DNs/h/XoZkvI+oqMMgCW6K5wvUXd6+z2i
	ZQ+w/3Bv9kCzeKx0oIVilh0BF4pmFJqD6jic8ubRKqAyiiIrXv+n+7Q32sNU1E5A
	uCoDdw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ruq18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 06:58:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737c5efso3095448a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709900; x=1757314700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=DqogRpQw5CP3egb+yuVd6/yJSCvBkiuyLm0TT+80R7qFH/0QKTs/ieuor+BXmtQ+lr
         LByF3uNA8BEwN2ImyIKvqMkIVFq+hpYDDMPx77ShRLdPWbyqOnLBY/wqmrHRSD1XpTiX
         Y8s/UKSILYTEYzf/YePd4gurOYB5CxdLQkFGCI8IGPz42lWMRDwbq6Qta2GDAf/3I69t
         lXBCOEE6iSU8WZEv6rYu42iY/0NcWwRa7zn0y/ZTPu9wvYVmvV70+m2YQ67KiYCwmTQS
         XZwoOTnSL9yiyqCBJv8WBC2QAaVKM3bgU0nE9Ck/QDMOgrsjGvx78/UvuR8AA1u62CGB
         vkjg==
X-Forwarded-Encrypted: i=1; AJvYcCWRFlJYHNVadf/WSNttA5lyTi/3nUSFn2IUBMnZzXdVm08zQMBO8GZ5GiJKDLd42lPYns7o3D7jZT5MPcb1I8qo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq+ZQdp91EseQBzqG6R6cbDTulT0OHCmRfuA/sfurkoPS1N4QZ
	zupUS4D6xQydzQ/IaBXbGBdsbglueuH3h0BV+3HIHAPH/fDC0pBenX/qnduVTRNUpezTT7R/eXs
	KR1JCwBC1s7RGWpsYJTaG3xz9FfEBhBr8EJXic1BE7RVojueNrqTSMwPDqZTr2FCwkkasR3TUbz
	xLZg==
X-Gm-Gg: ASbGncv7cuJkwnS4fdx0sqMl3I63s6+38e/yk3/znPBHvDkUN5wMiBNBRPOxX4L/b4G
	xZAA6iLnZ9hwhFJbTxShbfhZGYB/lS1Amd2W6wwNRdTFLui40ihGKKEa+pTfH5UlJnKv1fyQmFo
	ep6/gACjT/igFGKgVXYTTA5VYAD8YONZ600N9ur6KskjkPcPFAGmuHHhoThutxFGM71poOewxLk
	dVoNZpDHo72pgHrcZ/7QrW3KYd/2MG6IFR9eMQS8Z/uZG/3AZYsOYvc1bXazi8BMaExQZRv+8q0
	CiO83n6jzObnGOpTxQ0yHs+CiDl4d+cWiVhRjQLr4WX+B1trZoEJn5EO5AbLOytiSuzUW1/0+k6
	MctU4XaCQZGiq1nD4s5QlRg==
X-Received: by 2002:a05:6a20:3949:b0:243:25b0:2321 with SMTP id adf61e73a8af0-243d6f7e6d2mr10335754637.52.1756709900293;
        Sun, 31 Aug 2025 23:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBrdSMOV835ZSodM/ToG95GYGlvM5rcn6Xyqn5yubD8Vrxqydn7Qb9jXXaPnNnhXEEII5VfQ==
X-Received: by 2002:a05:6a20:3949:b0:243:25b0:2321 with SMTP id adf61e73a8af0-243d6f7e6d2mr10335712637.52.1756709899850;
        Sun, 31 Aug 2025 23:58:19 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm8559358a12.51.2025.08.31.23.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:58:19 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Sun, 31 Aug 2025 23:58:13 -0700
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-itnoc-v4-1-f0fb0ef822a5@oss.qualcomm.com>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756709897; l=3075;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
 b=2EFvjtdW0aDYQylD4PeK2l7hUEXE+8EE2A/CHNTTApxMR4JJgxpAITja7UdmxovLQuemCM2f7
 vkq81UZFpmkBtY40PzRN6vSsQT2Uuha1jQw9G1gNBiAYZXLQiXJ90kB
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX9K4laRtND07C
 ZMnkmy6QqX2ZUzgtF9PkHdnltB5LM8+igXb+ypV2P9DEiPVCr8HaXZAjTXV4pAsz+1ohchDy/y+
 hY2zgXm2sTiaNr4zrFNp66dKOzXc4ro7XAm8v3eHTg+Xf1+65ajJIWDuksp2uD7vkTb2Z3xoFAT
 vovF6euorK6a0kVNUNM30R7KMh+fxtazk+Ngv2sed/6m507EezSfZFuxSV+Olua4995HIQpqZH1
 PgwZtNh/D8uv8X+bAcRYCjjqjmj1PVR5Iq/UCZS4E/H7JdHinJPPHEsL74fwUKgJaaKCsnAWnCt
 nxT5xyBfyqNullsfqmlgjO4KB3HxalrE+Mm2n1uaVaYLtooziyoM2D3w/HZYdjKndW6Pej2us3+
 hEOT/LZj
X-Proofpoint-GUID: top-iXA6YBjxyc0hdrNVOHEBKi4WZI51
X-Proofpoint-ORIG-GUID: top-iXA6YBjxyc0hdrNVOHEBKi4WZI51
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b5440d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=-QmmxQN2S_yWG1-YAlkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_235821_724232_2C3C3569 
X-CRM114-Status: GOOD (  17.74  )
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

Add device tree binding for Qualcomm Coresight Interconnect Trace
Network On Chip (ITNOC). This TNOC acts as a CoreSight
graph link that forwards trace data from a subsystem to the
Aggregator TNOC, without aggregation or ATID functionality.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/qcom,coresight-itnoc.yaml         | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8936bb7c3e8ea267ca66e0cc3fc4dac33ba6de30
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Interconnect Trace Network On Chip - ITNOC
+
+maintainers:
+  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
+
+description:
+  The Interconnect TNOC is a CoreSight graph link that forwards trace data
+  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
+  does not have aggregation and ATID functionality.
+
+properties:
+  $nodename:
+    pattern: "^itnoc(@[0-9a-f]+)?$"
+
+  compatible:
+    const: qcom,coresight-itnoc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: out connections to aggregator TNOC
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    itnoc@109ac000 {
+        compatible = "qcom,coresight-itnoc";
+        reg = <0x109ac000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                tn_ic_in_tpdm_dcc: endpoint {
+                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
+                };
+            };
+        };
+
+        out-ports {
+            port {
+                tn_ic_out_tnoc_aggr: endpoint {
+                    /* to Aggregator TNOC input */
+                    remote-endpoint = <&tn_ag_in_tn_ic>;
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


