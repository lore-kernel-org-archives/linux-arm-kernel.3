Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF02CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=4L6HMg0UNo7IknLVBwgox3N1Fp
	/CMsyAVndsHq1QFv2rI+fg3hYbNWL2u183Sbm272KAufzV4kZgGJZYiKx8QterNdejovYP5ZXntFl
	uQIjJmmJUTh+fc3n/w0veIniB+wjZAa5ADUsemSugaRaUc9INDeba8O84aI/C6ZKabJescSRCGoO3
	dD9RoJdVfEpUFZ8mxtNczsGCu/i/wy3DWfzZuTqA6k1mr35yA8sFl3uGqyrSdqVp1/BvIYW3I2Uos
	8aNDoY7nu/a9lH8+cwoaORessee6TDhwY1nYssfnPt3TzHKQ10iBXcJ26ru9CZALjVHhEpxAGeSAp
	UqA9xYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gru-00000003WzZ-2KzQ;
	Thu, 16 Oct 2025 05:49:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Grr-00000003Wxq-3Gg7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:49:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G2O83j023169
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=; b=Yd67VGBI58dErsGh
	isd/1zx7yOpKb3m7HkpVF+9HJkwanhUQqM3yBcXDQV/LrkBkq7jZk0l/KCjKCzh3
	kKjRccqkbEk3KgXbrEqIxDXWn4d2Lsi2gKhkIBbyHfR3hJRwYKtNdFC3griq9xbw
	oM8gLtFl+vfCQDahH37taNmXBIUdHlWP98Ty8bhlbGeaLPoOXd9/W2WR324LYwDs
	61Q2yuQfGEbjzxaMDxY4iYsr0Qdlf+8adhxqBjtpr7AII56dASlgx+8JlP7oQ2zf
	qnZj6+sQjJY5XbYr+4WiocmcZM/F9ib73WDke9TrtOKjXwt41yQ8gQ3CrJssQXc5
	zfqbHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpgf58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 05:49:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6a2409137dso345030a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593777; x=1761198577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2ZenOczyNRPh+gBJvOKUiI+2zJ13iDNHmu85jEHTew=;
        b=kEZqbNIxD/CoyyscAW/9TKVC0Z/tOZGpzhtyWK/Mk2kY4+irW0L78LdtfW4H+a3pgA
         KfVPspmTtvgyyrGjdbdFbMHtMszLFBNJB/q3A5cd69ny8wpzljndKMCzbaUrxJYqd+vd
         YdUPHUFf7AMXdVRFHsrNiCPLBpIfRD9oKa99MoEfViFbVdmZXeFobRh2IhOcqNvDid0X
         3JP05w3J70huwVhN77INCgGDlCzsJDpVrj9O3kjX+9GB20pYczEt17JgvLJ+EcaspaNq
         5aHAlxke18E/z6R7ULJCE/4AcdE0SBYz2H3OKjSBQqMwtz6ovSrfxRnf9WtfbPdHYu4g
         E1JA==
X-Forwarded-Encrypted: i=1; AJvYcCULSXbqpwdUIQKNT6ifuJxHMm6g2+F8ZlllIJs2TMMIEDNtXu0QvqeEXBv5xYX5ZHcyDkvSscTcG/EfaHHFcOmk@lists.infradead.org
X-Gm-Message-State: AOJu0YyfrGVhOYW/9fTD4MuWcfEdb4bSQTUjLne6omR9gdcv2N+spIHC
	vZ58gaEqAew8FZE9EqllPG5E9Y6ygMF6xZhX5hC8DjrosrLmJ8qIROJIRvolcGoHh3mYVY9Z33M
	6VKK7k31IU6u62gHpGY0cy9Q/Ea+BzMbDTI63lcyY15rBLN/fkeNni9njxk+NhzE6KH6hwrkM+Q
	SY0Q==
X-Gm-Gg: ASbGnctjqnlOPayap98Ooo8vfnEwmmex3AcWs1sEEuuLtNJCokevov7P7melk7apksX
	WMtt/a1sdYLOns/Zzcnwt8bBD6LnyXYD5lo6SXJc0clal+nuHRzd1O/b9GLTEGKZr1qtyUvVdsy
	tJuIAvaez69ajkjyIVPAbnI/9cwSEhhKhjaPW6xLlKvgGvI47bOU93CXyMAvmxAlXVQ7ug3Zf3j
	HvEj4G65+5tR29EWBbKkvUOdkl2nUifOB28aJK6u7iGjYJ+f5S4ct1exCoa+8O9lpQMyItEKeII
	SObtCofrDx3IdLQBcGRYQTZkbLXrWb9UafkHT9ZVm+StWj5DvXlCIi6xyQO2NCWxvvPafUl4iAV
	z3ITfEU01nivhcGqrRcibkOhM92fMBSzIEVxvTNutrc5sFHTZwJYgdJK9
X-Received: by 2002:a05:6a20:918d:b0:334:a261:862f with SMTP id adf61e73a8af0-334a26186b3mr150086637.26.1760593777482;
        Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRjYvscNvn4E0vQBfwvASCV4Pqf0m+pOtdqzRYlI5lGMnrf4heuypJ8w8YWbvPn9A6D3ZaOA==
X-Received: by 2002:a05:6a20:918d:b0:334:a261:862f with SMTP id adf61e73a8af0-334a26186b3mr150055637.26.1760593777038;
        Wed, 15 Oct 2025 22:49:37 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm20657931b3a.59.2025.10.15.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:49:36 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 22:49:30 -0700
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-itnoc-v5-1-d7ca2b1cc6df@oss.qualcomm.com>
References: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
In-Reply-To: <20251015-itnoc-v5-0-d7ca2b1cc6df@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760593774; l=3075;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Y867aF4IBjLOR2gpmZC8PqfLpe9/4Juk6DhmSLbLZ8U=;
 b=cliWJQ3cCm/Fg7j1zfG3GF1la0aaPjQALYORA+TGbWnntK956NJJ0g8VbCrYQRc+v5A9cc4jL
 zoeEtsiuSbLAXyvjitBHF6kaYuoH4vz3sV7bCFgyhDTdYSQhvw9uak6
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f08772 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-QmmxQN2S_yWG1-YAlkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX5BrrJ1Eq+u7n
 PD3ba7fA74UY1nf5vqawxJdg9wsUdUkYhVAaJMffaY/WfL0T98Z+4hTbrFzgMiKqbF64D/paCZb
 TOK9eWzYATY2NRy4SqJz44DG2f1OWMSDrXtttJ8qJKniudTDzC1a8e9FbeJPctwR67+nFLD2cLF
 FMr3uaeBsCATioRl4sv9/A2XYGzyhk8/AAmw6Fr08FwH0sjBULHYSbI2/OyoP/wT/T4bMJDYtli
 ivZMUBuQ/oAXqa11OBqE899L2bS6Vf4HLFeKuoundELQbn+CkoBx2efRkRoufu7a95r+kCWwEev
 fYeanOkJuEKwTF+onVmj9Qht1Lqde9540thWaqkkjjvmNfoNJFmkXjbr/YINnViih87S+Dibgx2
 HFYM7+TqmjwZM3HQaGkrOE16UJX6pg==
X-Proofpoint-ORIG-GUID: mYiJMPh9Q91t8CkYYd4o9SujqtI_p1SM
X-Proofpoint-GUID: mYiJMPh9Q91t8CkYYd4o9SujqtI_p1SM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_224939_952372_77B77D58 
X-CRM114-Status: GOOD (  16.61  )
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


