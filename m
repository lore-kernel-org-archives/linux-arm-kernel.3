Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C922EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=OWhKlPf6ANKOrq2MOKdQd9Pdtx
	qwZFVgKMd7shuPY+054+1lKF2Mo5wJo4wrcj54xWO8oXfVFR+WAUGYNMq+LW3mhR4GE7UjEDQe+r8
	VoRGr4c/LxSzeKWE9KwzEMZuEaWG5kvXG0By75XGI1y4y5YSqiL5VsNdmGp2AjoPvOsoojVnQ0b1A
	kV5DOQ84Td1ADNd0QpCqJn7K1b7SC05UkK15uEti5O3NBZU4uqcF/ehyX0sGtrxM/tjJJT09twJDu
	aAI3HqxjFt91wsVfCf0Su9GDOMhCQIRdJhSRZJ/Va2qszLSz+xGDsPJR7LbrY69Taq4xC9OvZOurB
	0SIXPGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI3D-00000009euH-0nA0;
	Mon, 13 Jul 2026 14:54:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI3B-00000009esi-0GZb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:54:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDugB1209908
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=bjF8BRgj6ZKnzL4J
	n5m181xdeZhZSjip4wD+XqlF2QndzsNWq52d/Ovo/ruUao5Rd2I8f3Tv7Lch26xQ
	GbnAd2ZJjp46FYHo5PEkmsNf4jdERSjelwepZLfuCuio/UeSgX08y63GgbNEttpN
	37Qw11PWertPHTiwZeJXs3cf1o8KAIhy8fvhdKEaLY9bjxMHXz87QQ2BdKzqnIoE
	6XEladK+UzY4Vkt3BKT4nfVrw1IphI7KqI711HZuFba9N0Vejy17crzAzyq7YKbJ
	JqPpiJazQ02zxQhHZR3Hpa4GRwD9tVqmnsxbqaIZc2Dj0ByWGpX/Pw9KxXw6pQyH
	tE4k8A==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qsb4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:28 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4519fdc5145so3906876fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954468; x=1784559268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=L5ViBkdbUE/VOIJIQilLlXEqid8Y5qanh6BZdjtcHmCifb1t6fBJD+87usgdmhVCVz
         n05tCPnZ8Mnia6jXgi3u2QzNe+qGl5eyMx3gWOdQpoac25X9CfwqxBwJqX7s3nDjOGhd
         U2JDeRYq+nr39taQZJjrouP2wZ6UUMJjCroqONpu5alPCKPQUnQCrDzHziw5X0ywzAFa
         yoE3fkL35LU+avjC09qFiPsbFqu/DXEyBh/dwGn8iilSJlNaVSLmAFGyngECwLJjFohN
         Hrz4th9RJZPxIZkoIGNI2XIUpAAUqDgwt/Nv566OntA1NI7lXqu4/OMkgg8qoYAtqL0n
         J9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954468; x=1784559268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=aTYNvdhrBDR0B+xaXXib0BSPftzrpyGDBrm8+8YtO1bfJzG1UsXYjz9LjNR2I1IXAb
         w4g6UmZehP1Ia8TCtUqozpfcjDmcWh4AL3/QT+zkq1/BEEGw+a8cxIqtE5IIAG79IBiQ
         4Ge7G/gBD2AZJ1R4rfAuhZMx+pde7gTP3lAtRcuwHUeHeZgWPeMgUvE67WaCni/dGddw
         pynphRE72qLWzHiK6aCTOQaZ2asERky1PjFm0oKjxdx6xMSasx0MVhELpPLOwX+E8sHC
         InW6jkh86oitj1vqs8NuBrcaOpfamqujaH489tj5ahm4JX5+Wkk2mKbyh/mQJfp4A5lo
         0sUg==
X-Forwarded-Encrypted: i=1; AFNElJ/0eHJHFIDLKogs4w1pW62yaz5OtI6JZgKA5A0HcF7Gx6It+aRqePJa7vhCIM1KnXwsbwfpjnHRoAoWgD/O3IM+@lists.infradead.org
X-Gm-Message-State: AOJu0YxBWBbSRLAL0T8ywzqWsxMN7GJuOpsbjjuxlc4njprkW3UPwuwh
	0DOzGzOSql+Mp/J98CTWXRq+bqm5zchf0+Q9gHXkdMycHLlwiXa51RaCKJ/zQEW5EAbzY1jpJJP
	cvNXnM919DAbqdpkrb9VvwFHybJo4yWBxpON43Ov+l0/dnRZF/P8E1phRn3fnzOKJ9sHZYejdLY
	mlHQ==
X-Gm-Gg: AfdE7cmExXRRDVZMUsoyV55UTNNa8fDLzp7kbIXlM/GbYRPV8onADdK54rQAfetTzlS
	Up9XsmD9Q312C5+OFbAeWJeUQT+k3RcLUAyJHCe9hv+PijPfpW4EibE6ZvL2sa94Y/Zhz1Mq7GD
	N0qiifSZ1bzQTkC5P0iQci+v9H0I6ttwVxjZbZo9/lfhEViRf62dIoaU9ViBUUtQ184PbBze+5K
	uAD3ICalws9W2UDNIqslqo/lz4WWFZuIvKW31v0veRUpy1aNpmNsDAWkcvxhbK7Xq6qyalL4vve
	uVf2ixdtg0UODkyt/awAXLmi82gkPHqvB89pp8FdXdaG6BZEbwpctAeAuebTVZnXG2b1dq0O/Iw
	XW068IMS/2bQAradKF3faqyehzqALuC+PFUo=
X-Received: by 2002:a05:6820:61e:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a39a6cd0e0mr5745394eaf.33.1783954467609;
        Mon, 13 Jul 2026 07:54:27 -0700 (PDT)
X-Received: by 2002:a05:6820:61e:b0:6a1:805b:5288 with SMTP id 006d021491bc7-6a39a6cd0e0mr5745375eaf.33.1783954467187;
        Mon, 13 Jul 2026 07:54:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:42 +0530
Subject: [PATCH v7 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-4-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXyfC+geo05XIC
 0GaAnJYS/8Y+vpqouN5jqXnZsViaHEcMtDqIYQCARIoQSnSqpOdhpqcZ0rDIbUAuN1a61VmvlFB
 /hj2o98kDwNTxr8USTos2V45sbDC1XWTmlh78AyMYCZ4qwPvRhxOrVkq5RqMYGSVfxmNUumwMLL
 AjB/s5k6mXitPWOl0hE/qtsrYGafiBZ0R8GQzHm75vaRqH70LPcm0u8KsykKtNUdsDrKmYcOkVf
 SO+myreANMw2gpQxqrdF4Ia/qVKe+9JY50iDbxL35sukztSN2ypRa6RyWIAozgNEiQbd+ZJYrTn
 KuZj8Ky8mzvdUc5hPztQ4y+C5ustaCd7vKb3VzIBwIASoRWpw8LdXpAcsw/VHG6zyzERwbv8Zdz
 YvP4XThH/RWDqghR8YH60MuOhAqfNnpPcqi7P2aTgti6NcLaYd7mtl90r/a9LOGR6n3Y8x1vdRg
 R5dh/ySMzBwGjp4yAlA==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54fc24 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: cntr50h9aSps_A1PTb8iLJi5uQLywGTE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX+6/ILjt0tfre
 J2pTOOI/ZlLI7VSnZULILi8oMAb1J3kgug92N+eH6XROKO9H85mjFwM+QQM/qAR2m0DiTnr2VlG
 yX9yicKF5bUcxBdDC1H96nnL8DOpT1o=
X-Proofpoint-ORIG-GUID: cntr50h9aSps_A1PTb8iLJi5uQLywGTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_075429_113828_8E1A4853 
X-CRM114-Status: GOOD (  19.50  )
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


