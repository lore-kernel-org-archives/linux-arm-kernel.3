Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849C3FED9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=taMh4TIBa+r6GvuBwcN3oTzLgN
	jnLv19OL+Jd3Pfa2c4Qa4BLqO5xJG1NWPCZb4BlVJDCm2QxCp2wml21mgdYO7l8GZwhRxI9OXehxg
	Mfeal4P2Bv8oYw94efFjb7djczr+JZr98INsxjgPAFeTtzOWZ9ZsHcnv2s/hqTfnpB4UeZs2mFSON
	fT+61+4QOxi22zJgG1XMK1+otwff6KNFFv/bAbhHePvGGaX23nKi4KN5hHyLxbYnylz9wVzhkmskP
	TNBPCvqkwOSVVxLMxL3JaVRhbvIU3PyW8xs7C7zVk/AfKUBgBF+50GoK2BFJUuzdS227g/Gcc7ns4
	tTSN+JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0R-00000006u14-3Prg;
	Tue, 17 Mar 2026 17:14:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0P-00000006u06-12OJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:14:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HG5Xcm2977448
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=eyKXgEM0zh7blzXR
	SHJm3B+Mn799uS8qpnMberp7gCI+VvfvCiEzMVhovFwnjIbYYqF6HX0ygmAQ8t7A
	rGedOd7x0B96e/LwdClJwthk0ybiLp82Ph0mK7Lk57WERIsqqMfylT0AORBuFq7s
	MdW+ZCQ1s2QI0P5KOI70te7hWZ/rdf1Xom0g0xspnYu7DluUnM5xK/P0qRQc0oe3
	rLOZOYoQpjKP59F6geaEq7rDxng9CIJleW8dJ+4RR0F1+8t7Z+4b0RPlXNFPlPB9
	QCjhN03fAHm8fuFuLqm0sKaaGU3/09q0ir8YKUre08eVwVa1XHNabo4yiQurZot6
	H/Q/yw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62r97d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b9246248dso3163128a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767695; x=1774372495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=Aslx1DulYIBKPGeVdkvQHb7yh4VUbzYmnjMO4f9Ugfe4MdrX0LGTNkGlgJMKqE4Hr/
         W0HXU8vQCcRAe2jGKx2raDOpCrypqKV66C5PL57K2CybtVNBUHaSmCvMDvmB6QIxmZUA
         nVrZuNa+dZ36yaSJ9YobXyqLZbvljYDA6aX1ZF8JoCQ7WQ5XJP9AruAWZCIuXhSG7Z29
         pw5eLejdMhauEGXDqqRueb19Lqt1zfBm6OOotKSwLNzi4PfstUphdBt6PjjBwZlEztpP
         L0/EAMnjDVLVjeIEsceQQ8c6n9Yvf2H61WGTcgfdLNSEjQP77AJU2O4by3nC9HDppQnT
         2Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767695; x=1774372495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=cW9ZvM3/jb6GYUJNsfvMC2zIfp9eP4h/KgimQREJ+TjVTCrU820YY6AryJpXOgpG9V
         8qDBOaPpLiZdfDBG6SLZLYB6NPlRtKD3g5tEaJlT6OquYl8OQk6ACw8ApdBcRgViXN1B
         45BWH31np+LAOfizoFeyWDSAtAtZDFzb9tXP+ei5K9Zw/GnPaoPbsmcxhJKoJNqJXZVV
         vYkLZJTCrrUxs32f/KlmohC7AmpwFwWJlciJpTyDvxynCpLsLIZ/nAI0bE6PMbrQhhhe
         79fhcoRuAg5M7SpJBX/eDiQAhVbjbqXOYKGmBYw9MB3l1RNQQL6ZdK0MKuYjHdhyNA+F
         Uzsw==
X-Forwarded-Encrypted: i=1; AJvYcCWU2CpOS+AQXepXJiqZr6bB6QvbnrIK99US8MYvT0n73mfs7prn7W87aoV6uv/yvx9lRl/R603vc6nVfCrZ4rWS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ny5pkH1nmVMEBNXT/RetuKeDGTrLr6ktq9nJHF/qS3bRb7cd
	dylmpxgSMpYkPUQge51kC9zf1zYVhs5RQr1xmndx1ACjo8zZhT70qv9z4UqHhGJ010SuKU73mai
	eCtCoqqOzvFRcw0QOnwhpYlORYcyN+2TruTR4Vj3MSHl2qJBGqD/xOO/xyViE2rVCfOMhP1EHt+
	naZg==
X-Gm-Gg: ATEYQzy6x+9q+rOa8zdZ+/h6Qi41EYmEIz+7nJ67G0IgyhlRYdQzZGIsE8bGhtPnGXZ
	CYBah+tpkBdLYlGvZOILVGe+VFLxscUSFpdXESULAhFa6qaGgRegVDucPdEZ06GJc7i1dt+o708
	ewU5WC8Owc04in/vU2vVnY4QsM+E+lFEOrUC56n4Y9R4VazHSJg2Uf6b/qRTFtMPYipW0ow1Tph
	+09uik+hPPVRKPDKBONqhGhD+nakj+jJvJY3Rn8KCZoJQkl4A/pG+zzC+Op6r48A15o/ZovjmA/
	0xHOM8HocrtRwW0Sxy6wMqCCaU+IZiR6+LbnRlC5ERrkw5/7UNgKPVngr+8fhsUUspFE91j7z7F
	Ao7FIH/utwRIH9k9DAhDOF3Kjoetgv9dyoc4qR9srPlaUCw==
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191414a91.22.1773767695187;
        Tue, 17 Mar 2026 10:14:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191376a91.22.1773767694568;
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:23 +0530
Subject: [PATCH 2/7] dt-bindings: clock: qcom: document the Eliza GPU Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-2-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69b98c10 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: S_77QFR4r-Ly_1v0dvdf_2de47QY0wQR
X-Proofpoint-GUID: S_77QFR4r-Ly_1v0dvdf_2de47QY0wQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX8dWwD44ulUsq
 1FIoQra4xpsOZo1ZtIa/YjdD29/4sQJ/abRu1CkpUSZF8NFWm1pJFkGTCR/GlY/gPymtAxUNeCO
 bHcApfC+DNeF4Xp/4evn+JBNDvoRidU/fWE2tXI/fnT2U2svmUsgdcUyr5HflxiLG3pl62cO3a3
 2kWYDnnguBrLSfLAPkeK4OA632FF6qDek8TDsTgoOd/nda1HTe2oh6n3hzYSsOQMb93pl87DG+2
 5MdKELke00C7VVTBJXOyGIJE/R5RqLLAQpULFAmMkVpUOrkhHw1y8GrO900vjiXhVao3SJ3HvHY
 DdyFWkvauQb2509PfiiE1kXJUhheAPc5sam+Yvz76hmb7N/0oXWhyzqa4goKVv/Mj70IjhvOyAs
 wjX4z+ithojcqLX/Uetp3cNBKgyIg/uG33AtVbgIl32Ikw+27XwucLnNsyOAjTWE7fj/ctBvetc
 lDj7sRKvgKPAQELq7Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101457_434727_E2774950 
X-CRM114-Status: GOOD (  14.59  )
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

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


