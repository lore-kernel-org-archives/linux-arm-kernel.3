Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71937C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=hHzriPdyWYdtxLhegfJq+ZYKLs
	ZtWN2LjzjtQYW8pXfYj7V6SxF1mUkOUKK8acBeDdjylMiUIWSVyazhVl4mUXcKa8Re/ofc4oDa/Mw
	91ZxxVDQe8U5H5hGQ0qaZXorfU/ZSrojB5LcSV6tuRpA+fEw1QNK2+nzxyM46zbNEqCprgY9+00g2
	elwNZJxRhj+Itvzh3nn53g8YzHo5BPKgp0E8dev2uJ4sBjlyqz1guIY9VpxyeXKesycoKpDJ+0dRM
	MJw3mV+XWABCCcEBiAMeZidodgo+un7jgjyurjldR5OSSeHvBJsAuQ4bPe5zbtdT4/feqi/mtVNNg
	uzvbWxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI3M-00000009ezk-1JtB;
	Mon, 13 Jul 2026 14:54:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI3J-00000009exb-2P2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:54:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFIiO1506631
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=Of84Rvx4SMgY/gTY
	wFfMgFYAflXrxMYUmShV03sowxcrcRemNNz1EMjHWRUlupmmBNrVAyXCeQR7qW3q
	XuVRD7HssOxYadGwO4cXLeTpezLehGVR9A1w+qqp+jFjNzJNFZTaaOhvKAL88gPc
	moYemZ1qA3IuYOhx2IBm806zvWXNyoQAyDPam0wHPLJ9ogcYNgV925mPjaZ+GeNj
	9DfaYqSLon4/X3+CjupEGJW9gl6m139bs5Ybm7I/8Pq3by2XvFTZIccXaOyjm22y
	jJ0ZfmZhSFQd0N8/sPwlvgb4fek5YbFw3ftqIZ2jQvhAVJCEhCLVsy1PU0uMfXsc
	tjxVgQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda18vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:36 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e2db9914so5227373a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954476; x=1784559276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=Vtci5snKm6Q1P6NLeF4d8WEXDw5XiwRFUV4Krza0yjzTRt7Z35uMiZjVL6PWDtcp4T
         xsQS0Ixz+J3E8A00pL6I7pvY3unO6gA/xt9roakzd4zxgWxUyabRUcjjR/vH0B9NhWGY
         0h3tEFwgpCdtc/KIo6feiRi1dYdiLWc2DslWKKkAvnYgatJOw3vxfNFtTo+faFvGZbcj
         q/gVW6J7WYYJbBhtBA+4q/bdJkTB6B2EIDcUURC+OyfT17In6K5vlE1xcz77Odk4Syon
         Iw/2v+jj7vgcukCInLuh0dbq3hAUP2CTZ1N39rZggbSZHheb2IlzqaJjAkFqX+v2g3Ks
         7vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954476; x=1784559276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=HyqucVj5P8WJaKajpDoJlz0ylYxR0DSv9aG8uCJMK2NPbb7qfbV2ge1RIA5/MRn04P
         gcAguJFySpGbRP2zSD09fUBa3kElxWoq/gk+ayijeTuRGmNoHdKHoBvM5XLoUm9wYPB3
         A3l9GOmIdlqtffJ4zBPYOEA0l/fZA01LugzvkrDyI2jV2uZ/ENY7qQF67HK2bOJy5ywv
         W7WMKjjPGN4bY4NJvvzCvjb0969H89PwdGZ5PjLCYF+sz2fNKTpd38QqMSHds0hOZyXq
         vi/FHLoL7u7TCWFRUavO3YcZ1bvwBiaS5ddtaW5OIOKAkg8NZra2OpewK3v99d6fMrJq
         wV4w==
X-Forwarded-Encrypted: i=1; AFNElJ9gstvw5bkx0uAunf3PWf/PVkG+EdgAPZMe7Dk6wt4MhaEmEb8DhuP1rIjh+/c+PaD3batR6MjAswKm9lU/nETS@lists.infradead.org
X-Gm-Message-State: AOJu0YwYs8vx4j5PF3uKmzTpC2UFDhY8Xqi1OgiD/cvf8wqyxY9mHUsC
	MHMV3cPFzckrVTwRBlUqrgm180iGgyiOr6nRUzYJddLdif4aOgSY4nAiOz+dcIayya5WjDS1lsd
	PbjM+5rrIWT46kNbSS0zWvpMxFTtsNmFG9mnjuMtG+TAcw/PnQWg7CQPSYfMlIRsoJ65SqISNRB
	9ShQ==
X-Gm-Gg: AfdE7cmjAMLmkPJYHe4LTrCsepi/OgtTE7oRFTdMV/FoXAIbCCz8PZPJ0wp++M9L+V7
	lsdy0ftIqZ6lJaJ9v8IghAoqPgPJe8rf9uXePmutH188zMQR8xcVehoDzKczMwG0XqTYRQ70Sk7
	/B2m3+LTClDB/iAMbw8uZKjkq501Iz4AClMO/MeOIwXwb36FTnbaEwScIa7A3zmSZ1wtht/X/Sv
	M3jnEd50bQWEBZbRMkHdyK5FQORXg7FM8PV156oT2gAtiIv2NbBcASHswbl0tNpmBpeHWpu3c7E
	GvXGNr18h/o1JH59mXXNNhO5h4UOM76kg/K6DrFJKsCUMB5EwksiOMylhDliZSTIesCb6YXkFbR
	qdvfKRjL/CIfZ6g1qUXvDgaVg4hKkW4EEHZs=
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4862993eaf.21.1783954475991;
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
X-Received: by 2002:a05:6820:4c0c:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6a39be3c2b6mr4862983eaf.21.1783954475641;
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:43 +0530
Subject: [PATCH v7 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-5-4d91bcef50eb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1UY0+o4emjvi
 ljrFBZ5DdHhAysyXb6ot5mP7skj2ad6/DTEW7eQ3+qHGX+iK6sNeK02yzdbXJTj0W3q/BezirV2
 Aq7Sl6sWGcdAmXZjFh/VDC6LWJiZxTk=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54fc2c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: KDzbv4qS5lCMgYVb0iZlIKwf0h2ANdff
X-Proofpoint-ORIG-GUID: KDzbv4qS5lCMgYVb0iZlIKwf0h2ANdff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfXwnca6IFz9+/9
 loyddb/q+vio21pRNhiGOj6SeoNx6QJaRfjGCKzcozy/EqOljIU7tGBd1+2BokLffzTtCiYHn03
 jXl7AxOxJFu+Ao6MJeUwz//oaBSaGQg0frlMxRxJFah6tNuhAFyfeetmtibSRJxQcFfjVvMibvN
 7c98KTS3sa0sKd7mT7wSwyjTrrdDbuj3pp4x3mLCLSAVWilcZrfV1wmkcUMGGByDuhY89VVAJfA
 Ai5kAL6fT2gl6iJTaof9NVXAtK10v56GzfwfSgg6+LyzlilsKghgc13G4HEa1/rIcQvmTCQC6Gf
 OQlAN8AEIzAqbHDWTxPqCJ8XxPvMKceNVVjcUZonKPglT37oeTFQv3vL0GWaN+4Oa+RrD2F0MPw
 pf+asKtEsUyDO45u/dAYPY5hoZdMeLy3ee4Sc6jDUZWXz1n8xLlpdyZ20HrUsRjYk2S90+xx6yW
 0wQoOJVAnXZXVvd8R/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_075437_743861_FDC5EB4C 
X-CRM114-Status: GOOD (  15.59  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


