Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D6C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=n+Lq3QvmfEoboJZQRqLiSJpHwr
	eXVxgU0Ubv2BxMBz+cviF9ynBdDLdmJHcDPBb+6LPDv+45Vccnz1UC19rSQi2TI2vJ4nHrDr0z/J9
	4xjW1312pVjwFV/QEVay/OVXHjuCDdmW7sbRSjQCd8Kf291VsIgAAQXVV7sh9x8anOAhw0PZtzXu5
	/oHoow1Ghd6FlrlRI1Kbw9Rm9XjFbbROgqnE0zH9dQ1Yr1YAAR8Gul5o5EOIvdwdDa50g1HzszrFU
	LLJ+DBjw8jxAbdgurG1NzjlY5n/WjHpB/uBa1ppB7zzX/qFvefG9XAf9zVoV5/X/XN95KEgVoqH6d
	cQDikwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvR8-00000005YcR-4Aas;
	Thu, 06 Aug 2026 10:34:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvR7-00000005YbG-0Ujd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:34:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769negK1876463
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=opfB9VB6J1PlzVIZ
	IUQKuvvi5AxwFQLVkm1b4DrCpCFtDHy8a6Bz/FpVhdC0KdtLOYzWeUwp/1foI8IM
	llC4B6oAgYZsI37ElWGhRko11TNKjxhMqR6Cra/+lv62aFQUWwmt/Zdxz8dUcmDG
	tWRSo1jkxOjULNBr0TRrOPUIC7c2vlkAgoUVu61C8fXGL2aTbbQMnUr82DCTG8+p
	HvDvALFRL9wmfmv30Wo1NpH1mzxRWvQBoEgQwWGb6EHofaXmxr3nQ8fBqU0wv9Nx
	ddmTZWvfTQ7Fs2Mnsv3QKEIjYxV6+cgKCq76ngHqndzF2sDrTaV+Xxcc9QpYpRg9
	W+/iZw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchk9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1085436b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012491; x=1786617291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=L6B9fxmWdyLJO3TaKKfs1AkJdGE0MMW0fF+psmlRGuZqH0BDZz3D9UI3xd29wVkUcr
         9350/9QG3ZEm1aRSS9u6mDvCXKRfWskf6AnQj/MDg5B3RoiQW7UkO3Hv/iQ6s+AlYFFu
         435Hw09QWSVDQ4Oca78w4k/Qlnybrx4KSI0qFW9er6Bz/nJTT/MQJRrPooCN6q3A+scg
         /LZuzy3ykMqSFHQkh7d3yH9IjMC7R2tfK+bMYo/3q05sp9Jq+QtUkWhtj9UyS6kgAZF6
         HM3sdJX10LEdYJozvvXYZU+N6eywEWYrGTyYOnOcohdlCeePs2w2QR0qdtYCu+O5PIEa
         I2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012491; x=1786617291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=PQCVXk7Rzmyc9C5soQPim23OB3SnZ68XoK3N7/ROfy/JMv2GjSmTFk37Yc2lTlyieB
         WibdV9qtoczAh5jsPPCqZP/kgWoMtCGzptLHuBkI3gt2f5ZgdV/9DTAzF4zoIk4gnFzj
         z7VUEveiFLq72aMJL0TcvfwBT5QZAP//n2+4RBY4ntym0w6epyNMoG/aNUMfq8IHVkOA
         S7EDfKGyUf7Yar5yLgxJ5DCGXgz3FZU7zpbpDl7xMbG5DmM9XnigRiQTHIHwqRthUqhw
         GX3YdlBAftK53ZuHQAVoi3r/Dob1plBTGlS5nvLfJGut6AM9otZi5ajCMLB42/wGYDb9
         WkGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLNowhOXrUyTIp9iQGfJyKF5QiqmuSYCSzmxoQ+kmxg6FC/0HMSLZsoUcjUMmF9eQvK0CEy8XVVMbAE5J7EhX6@lists.infradead.org
X-Gm-Message-State: AOJu0YzTctfG7MC9AbFjGHN0TQMZQul3orxCyZrY5OnuZGNR2RWTUW5c
	roQgnO8pPnkiZCzpEZSbpPxKx6q5Rwgu/OPlPrIvE6cqfeITCk+cu5Luyngb6JcPZrNZcUXiHK9
	XKrBG2Abbb/vV8z4iyMpxwocChk+yM9prf6in+nseEl2oHD565NwnKc6iy73QQjhG/4q4dGtNyn
	b5ig==
X-Gm-Gg: AR+sD12UPP97s4lUfBzDfr1na6p2BxDQDaD0CqExHiO0yjEVr01upBmko+iF5Mpw6Ss
	82pTjBqj3FoBmgyXVeyg3Oe4eQwCAGcxPxe5nAbMQBDH9Gm45JoE3de+0ghYOQbC3K4SQ2/zYLK
	zuB1EQF0nTCFsQ6GrsPy3Sk0EgT6BNsmPKvY4IHF+ZT0HhZXUAm1NgC25mBbswxsEFYdbEvI0oL
	mM2//BbfFE54KgnvFndPISaQDRarWyJeuJPIMco1EgZB6TMsoC0xJxqrQFHo6V6HAjfjzAEJ2Kp
	Rty+F2KM+jEfilXYTCNwu+2f6JtWBCZGBLz7NaoXvAWxaEqyLaKN2SeUqhRABTUd7jWBkU4jsri
	yuTMS6Ohm7PMFVQtgurRuNHZR
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr3398653b3a.17.1786012490920;
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr3398584b3a.17.1786012490484;
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:09 +0530
Subject: [PATCH v10 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-4-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXzODoRU57OIIj
 jAsX60wUp86zF0184B55oJk8dVmaIuC6VxGXkPLamu4a8R1bV8ej+BDHW5S+HDjBSi6BKk9xaG6
 VCCcY/bO/0I8/gDNrK0fXOIYz8M7n/c=
X-Proofpoint-GUID: qOi8aXRgD3zVPgEXAPCVD3VYkfOE4Il3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX9kjUlxYBDL7d
 ce8RF1OrDTanDke4FQjXJAK+mRP7KGM4xsdx3bODzBNWRgJcfoeFixscxC0g93VndzhD4kHKL2u
 iI7v13k3KFqZaVRJi7/WOAX3rvmQTLxO5In6jo1gDi9MKwK8JSx0I0Iltem1IoOqnjuwjjynrhL
 yn/tHyhhsupktpdKakmM0gdYZ+hKPQrUZMnRj8y/yXVoTiEDf5Lc+m17SQUE/oyrytfbcymlEdS
 DM0vYs19uk22CLnGfIVMUi25ORsi69vROu2ilTyB596bcOB7oaVqjxQ+pvFsQ8rlmkiG70IqNWU
 yzEJwOY7s4zRx1piBjScFfhwco60N8kbkITAeeUKhX8ddBcM2Q8okq3Tl20J0jgyzsZRRJibSlA
 GDI9EJM4QRCCIPckWwM5cVI1JEGeL/0DLv02RZXFHk1OhjaonE3MXg7BJN/7/KKlVqFc5sPR0xk
 xk+iZkBw7NLaysVAfvg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a74634c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: qOi8aXRgD3zVPgEXAPCVD3VYkfOE4Il3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033453_278367_E2AD51AF 
X-CRM114-Status: GOOD (  18.53  )
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


