Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23DDCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=mhDK25lD4oz0rZNj0hI8TvdCCm
	MLTxpualcYrpNSZJlk/nzwrs5J5K+6QcGGN5TpEpBPq+TlPNBqXOqTKS1MQR/PWtvF3PIst/xwIRC
	lnclfb7CU5ialObztFF3lu0Tj4Ig26SoFO7MwhZxs9cI37v1cfvE1pD2GhQaBdtbamseUD1lEQAoV
	H3Krd+KO9sdmb1LNjwC+hQBhoACPLoa3vSH8DCONhGLGnhCOKtAzZcF+7vQltd1dydeJA1LcAXgmo
	iXAP1I9RCamUxbTQDU5iaHoKcgPdL34ZaXg82awxwP3UBF/ZYO6LLBucCDkiPf7FVsDkVmoi4vx8f
	DjT2Np0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpK-0000000GyR8-2d7t;
	Mon, 25 May 2026 10:46:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSpI-0000000GyQV-3mUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:46:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YKib2770816
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=; b=hyujLfCl+/Vz1yng
	AFNgFf2wEJWfZp9aFWHwcwlwSswmQv17YNi5t/Vm+gEwzFN4h+pdHGCbwCIdg3J+
	9axuVT/NuLlIFaqZ3Q9c1VyBqeSyZmgsdFNCR2solExGuVsH0PQhfQLLMurY13sG
	FxefoQYHKLKo1L4xNY1xbJ2hp6eU2OnmhGqmXelmrPZBaJxgMSPmgRsj9lDM8kXX
	IM+nHRnZD6Ojm21sMIHDgVBOAJduFByFgybaxPBDaDlna83pLsZO2BkFRIwrttZV
	MW0xJfzq8oFfp+Q7iKiHU6lvOfUUnUQltWnDl0UDTWPcbGtBHxwFRcl3xa8IOBOu
	/8vPFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6fve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 10:46:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so211046675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705987; x=1780310787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=RydSS72ut+xVqMvdxmo8Rmxs2N8rNC5k0phbL5uUTcIpgj2kB76uqy0yOYW5yC4xBJ
         JLvWM9muj/u81EzkoC1AOvtBa5UYSp+ZC7bI8Aob4o+ppgkKXSto7BvBz+JqA9zB0eu0
         Ovv9vlE5Wm+MWYRme0yw9gPUTbcA/pfYFST/ZHqgHQSSxYAi7okrBmJdCQP9xq7CuzG/
         OEX+3RO//4n1y14jjI7bsKJBZfNsIMwEGypzJOSEeBcTjaA7eIhtUzlzUPvPu2FUdGfA
         bXbAm1ED/uMP3O9310P7UMJ5USQrtwMqn8ePojbmO/jlMUfAUSZbx4sIpE5J1QJ6ZbjC
         e4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705987; x=1780310787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FDYCVYSqplVLXvPyGm2q7sANsvd9yoUscKzKGF/D/E=;
        b=buNOYj5ZB8VvnEcJIMMfpmDoSO7NoVqKTPCduaaoVxrCy+ksYE0iXlU7/r0lLWmcFl
         5zP/CLHXC8jN/D3oO0qoEQlJclwwUAxfwMyP3/Y1tEXJ5LkgSL/z7Kgzkr+6cLltsaps
         ETRxiQentT/vBIi3j5JXsKWrV51PFUjeqgaeNLZ0xzJHBBtVJbevvn0/+j9/b2hLtcG/
         R6TupquVT/cPQSbgg08VvTa8sdGYI5B/1D4xGxRh15G6gFG0+zpB3abYFM5Z6BhDzFQx
         uy3uRMBUJ4z++pRIhTAet69emyQS3Rkp6tufAlgNgdr7K1A+Uh80c/gJ+9rbiHtal2/y
         NWDw==
X-Forwarded-Encrypted: i=1; AFNElJ8umV2UoFmoRwLu6djI5JsMaKqPH2eIdNG4DWJhFjRDLJOQ/ZpJRpVj3/8saDVX60bR6vyxdCDpL74LH5XXCFVA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62E7qTKBqPnN29ylHCp6Q5TGYxEgUXhPj1vjHk6VPNQAouEUS
	Y7RTdYrDSHCJlZjo3dJ4oatBg6+a+toXWFS8NOi9d6860x44hufNRKz6z5GQ9eX5WScngVcwnvz
	LuR6MHGfb6S5NMC6IBMhkueBRkNLObYJSpAUaaxQaOR+EBcgqGbwHhXnN9yZmdpyYBGAZExbYrJ
	3/cg==
X-Gm-Gg: Acq92OGbYhiI9H9PDAjpPEJAvAql+UqXv3AT3mq25/DVCce0engG99OM+KVy1X001hx
	XEo4UNdtzDPk5GHowGQXpnEsPjV7a9FqbQTwH+AvuCQcQrhoUFlm9fqWFTQx74l+3d8Qf2uFVMk
	n9ntRf/gUEYU+mBOdcDTAKZY1efZFJdCQ+OzfWe2UfYUU3ncxNerHWWKMHffj6RA+q1e2Q4jM0I
	O+zCvzaixUkfhtylQngnsApFnc1oBOJWkW4J9oJn8W3mkLSIfi30zYj6TWlofCY4Sv7VIlWzZxE
	ZcnC34dQCn6YQn0V8OIbz65Owx47+uhLtLmeUW6TsUi9ixJ0AdLbl/pmaCMcogsUyL9yHrxoPeg
	Cy0ASq+6WlKu5d2zfJiWiz/cLV05kbPvOdL2DqXs+01bNdg==
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809915ad.9.1779705986959;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2beb06552d6mr168809375ad.9.1779705986325;
        Mon, 25 May 2026 03:46:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:25 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:04 +0530
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-2-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: fsFsMBdRpddZ-I876G0cjN_8e7d8xAo9
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a142884 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fsFsMBdRpddZ-I876G0cjN_8e7d8xAo9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX7hHq+Wlbxz09
 EruqybCAIjIoalkRRt8ZSe5p1DNL7j7p2F5LCWN2sIIT4SG5o6mNCQkoKWqVa7zll5PAka16XT0
 ZxSX3HFc0+PgK4j3DsoiXHxjK3cRsAYYge6W7qNXrxnQg0rBFO/zL4iU3UVGDtaRFuaF5NtkoB/
 pkAX3RyPxplpioPphB0NxgLPIRe48o/LcFkRXEFMThmfgQiDntx0Tj8yKPyoaiuJtduN5LTMJ41
 slCLcITt8JRBl21vlN3s68cmpKXUSOn9sxxaeJ6avZCmNaOWpou+gC+3GmL1i11M1Nb8g7mVOI2
 JnvhH0UPv5Bzcy3B/5UeCeCVtTdHMBTWbuogCJImYEb7tWTGA37toGXfT0GgsB9NlBzk6nkLffi
 PbrSkNAvQEqsBOgvMrcWvEwel078YuJSx1tteikcJdY1fCjvNAg/Ve9bGygmv7PequPfQOPrVai
 zgj5xAjYXKugU+5g00Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_034628_954631_6C16504C 
X-CRM114-Status: GOOD (  15.06  )
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
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
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
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
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


