Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E5C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=0ZVYD4T9MSPoA57AHOcIVB5Nfr
	lEa8oVBGvpubVfiuJWaC0vEN7g/CSRWhxgHIfulPhz71Jg2BvF+KfUIWiqfyIkZ1zLvmG1D0ewcJS
	wTpCawFk6eikd4G6hCUiKktTk/Itw7SRYCyZ5JJDwZ7QugOcqehgdM+vtbT0nYZVi9PNMbPKuQCEU
	pO8Em1a1spgovXUzNAgv14nrMgr5DkaIPIuHQnsMaxkyLsf9zDAMNcyI3WBglCFP7+A51ErJ7A8uO
	UFojpQnVPwARSNN+6GClMzpdxJzS4kXHAJQvrrWy3I//WHzctSXN23rsPYKXPHlXXNDUiJHkAzghO
	7z3eLHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRH-00000005Yhh-0rdw;
	Thu, 06 Aug 2026 10:35:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvRE-00000005YfS-2wdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:35:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhED1578793
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=NBi6GZG9XRfhHagt
	zH+IApTp2VtsbO2ygg1kI827cdPE0ftcRJt1pTtQJIkuUAM/1gFez+H26SUHhkxw
	qqOftJ+hBpetUuiQ5Q7oYoz4J8xXlVOj4irY/JFMyi4OE+PRWbZX0uRMNz5rDJ5W
	javcZ9dI99/8PQzfjQYtQ0X2nFimzFsH20hGGkH2A0PDn8zosot/QMysaK62tCen
	P+Bky1PqqbqWjX3oVBBSCxDL1ZBrBKGfwRAcxMxgvU5IU7X7gPvQxsdARP596E6C
	9Go6xYlFINxfBQk5X8kLU1f9b6qDvEkBcGQkW7J8FQTxiFCUwqIYuhDOqPXJHcw8
	M71hcQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hkap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84eee2147ffso2677209b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012499; x=1786617299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=kgQz8pCiSbxEWwxbuknl3+qA7YLR/uGb1bsojRhvsrflYrDP4Y7v3PqXtpuhzbH53g
         LK1nX0gWyRUinN+bBn+16liHKxDcEvs0toQbTDbvUjIhvy1ifLliDk926NkP1o3M9nao
         8auYOWx7aag6M7SPTocQxgPVeC4RvQ6dJp1yfreLxpeXQLXhrFXenjj4kVlm9i/3wd59
         SQXxewJaendIQ6RwmAry0JwLbAxKiJzvgmzbR2qTH+mauFcQvn9YZh0I1SfBngBfcuMb
         MR9zswyZw2Qx4PbZFmvsdkoFmabwv9RE+f2j+l6CtVP93R5CMK5gdggQqZKoF6Zj1KoS
         7xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012499; x=1786617299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=X7PMtz3FwFZOJCQfhTqB+RO6i5XQnjq3abGrAnt9J4uBlhM96Yoy1K64kCP/EP7qjF
         aOpBB+dhJ1UDBGAXNjfv9qQjXiLUCwXWdxCf02QqIB/uCKt40tekIktGIgVBl6uLjBHm
         jap1G1n2/V5jln6FzYePCuMKUzoYMPeeiKbX8by5ajZEATnTez8Oh8N0ZE5KPxWmPMoo
         7FVr0UW1ZpcW0jeS7hq86HuiU46NYPUJjjAKi0Bi4Tu9q7cWA9BX5/WeEdFpw+q324RX
         yTgxklmGeGd5cdpg9iFz48e30LL3Xzs+OrSXR1zUr3vMi4P8eSv2au1IfT2L9AG56OGR
         3BvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOUbeLjhMjRhDWZZjIYDq25sWf/ebAMfPZeZDZm1CWOUofK3KAqvXkvBuT/47YYgs8/xJg7IjEwzqZu47EL5D3@lists.infradead.org
X-Gm-Message-State: AOJu0YwM5bpX+BVKnVH2zsSmHa9c7IS3c+CgaU/tJ33zc/Miu0V/SDBb
	KObFvYeGJ3UH+/GWRgytnJOWHUQiCfJg1m/pEOCKq0d//iQJyLEHvpX9/nooBszM5lHQz8rDCe6
	9FHnX2fnLi20GiR2jJ/ZdHEiMFPed6iLUDMzoMQUpJmw2ZROxSnZfv+TyC9P/FDrBQOG9UlJR6F
	4bhA==
X-Gm-Gg: AR+sD13l4Ncho2X+VPO9pvM1Ju4g1DyA6TqEwdyWW6U8Kbbef6Ho/+r2nIfwjXoqDus
	boY2dkEmQKvbAqBwNYItgO5wtXZYziG2U8j1hOzN+6Mw/kcOg7tPFTwBSwoa4jGRp1dcQ6nKqRt
	15JciWBXdYHaw3am1Hq3quFBJGQ6OsfkzCX9BsDdV8U2UeqsH2xdfQtG6QzhLo9kqEBsrLeTMkT
	6YXTnEhpu+YmKwGEsNG70ilZiid+CCaLnP8rQXTWXpEkUlVRFPzr8qif7AtXhXfmbvSOsnOxdbJ
	J+f6CsXk1z4NNmgHatesPgzvwBwC8j+1Oy2kHl7T9Ek3tvz5YBjpbpTPA8Jrkdcg8UTn2QQsEzh
	OKRf3CawZ3LABLvrRA4EWU/nd
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148361b3a.24.1786012498655;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148250b3a.24.1786012498123;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:10 +0530
Subject: [PATCH v10 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-5-6ba52dd14343@oss.qualcomm.com>
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
X-Proofpoint-GUID: fwX7LJGYSPy_peV-DFz80Xkb-reV11dO
X-Proofpoint-ORIG-GUID: fwX7LJGYSPy_peV-DFz80Xkb-reV11dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXzxH/iIOTOakq
 f2c/me+EJ5KZL1BW6jQoYcsBVwDstNCQoBkt18tCDBArOzPYveQX7bPiyirTWtigZF4UMZobj7U
 Cv2OHoUOggrrQIQdpD99jNYDP5MRkjNjQ9HI5Jb4Lh0ILxw+tmkXkPpLbNsxAwSK8TrYHYk7bhY
 sRnkDs/I4UChIk5ySYa95VDW6ZQYxQZ7Iz6U+SNlASbO9tTCrvcgtDTgmQvmHD3iiEypaCNiORD
 LilE024EZ0CNivDmXzCevFHnJwfdiraaOaXMGWDfz+/x3MJ14KVkGksbKUSuncEXzfaocXoU1Oc
 COeQPJNotccJm8S0zxNVrWkji7v5rOvI8niVwAOObHPlP5qEVa6X+34ugqVsTS0atqMeRSjcsjk
 z8SiKFe4L5SijwWNQRhPnEvkX1x4/sdRqtf3t7l3ib8FaekHmlKWDwPnjTc+Rvemx5bXXFRL0sq
 BvUzGAXykw5faptg+OQ==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746353 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=005LtiolIcJ_eoEmTSIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX57KfM5DVDQM1
 /BMB5frRH0ufjt/baDo0b7/CpGsOi2noAZA0keUgOPc7cdDx/RZ1JeLxCs8fQKYXmh/cV4Duorc
 KXwB5DPeybzzx4S1cvUEGz2fnCTV50M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033500_858820_64010BA8 
X-CRM114-Status: GOOD (  15.02  )
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
index 2a2d37c59442de427874dfe42849cd0ec1a8b752..7eca456211e476b86cad274a81426f52cf24d527 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -32,6 +33,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -75,6 +77,7 @@ allOf:
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


