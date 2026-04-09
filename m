Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6C9F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=H86eoeG1PiSKUDteVUZUgbygsn
	WSJASLkOKwx5CXxJNLVwjkwAVW0pmL8HLKUqPVPmA0+FfxbxQp+0Z6+fyncO5YQPwjHjhxYrL8f90
	ABeaYSf6treChOJ5k858BBNha+e6B4G6aIbDSro0+pMaKECy37sjf6e102blWjH1RWI7/+e2P9q7u
	giAw6vXqsEqtkVZeXI3CH/UZFe5RqZgZJ9RSk6L2DRwHx7dgAmF6Mp/EaTA5HL8y6ZnZEWicHGLfT
	xXNBRpT4+8iLbIKXbTrbEOObPonr2g1MG8poa58G7Y9sGe65BnFEjD3QNeW/Q29rggrghwaUwN1wA
	yR4Bt66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqY-0000000B3l4-1q5c;
	Thu, 09 Apr 2026 18:11:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqV-0000000B3kJ-29Ub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1S4D1972554
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=TvHubt0tW0XzlyR7
	K19vQQmaLhl3x0Rfj29OrappZuOJLxu21wfvKrHtMMo/cOwdPkFu6LzANAlH6ENo
	R1qF9UQ7SRuVCZUxumHiXYMPfaa5NS2piG0Z6nXs5ORpSF/gkk+eI/AWEssNfj4H
	DufDtAMb+oUkXTGEOslMV6nin5rbf2oyxhEbbUehwwVm79SsEIauKOZ0v1JUB5KU
	wfX+kcHOv41wFjZTmL/wqt5hIpbQz2Jm3rpMWBKld11uJZTzyrd0E0j/L4gfEPr9
	z2/0w21aZEnbX2dhJolsQuyqaLsy/2MB9ewBLSGyF5AJLIs5tYEq0w+/3TdniEza
	FLVf6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms165s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so690484a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758274; x=1776363074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=V6txZjTY4qSt7rp7Qtd0j5RppTJpN7EZE4SgNolDKwOHQZhRyquSwsnTfieSi6+otp
         hiQv8SLUwaKDZjtQElQWKxlvpITty+C1VnMZ+QgXP7Tqv2Vu/sS7AuDqmgdFcZ4GRhSs
         BZ+3DNUYQQZtuFSCZlZgAzmZ2lM1xGizRx8mic9xiriBpezI8YvoO2nnottfeIrXH9rY
         0YruxrFQHVNUDzyAt3d+Gr4emsfgv5P/DQh7oQL2ekgNsIgLLmt8gU510K+471f4cftQ
         9om1HHIa1TQCpgQyXdZqTkFGq5txAznoIRofaKvQZcenlWS5ds9Hy8abe9bk5aSrdCtk
         TU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758274; x=1776363074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=HO7NSnjT+RmNUv8JGi4FMGToNI1Zn1SThdpLaQsuJn2HkmQcDhgRFB2BSIh472V1q9
         pUT4eJEnBTxXr1qQngtOn+VqUK0Rn65QVQ2R8/q2PLpE35k1b3cenu7a3ihzq+RV0YmS
         lpciMgiUJM77Dvc7T0sX8RMSjmFiAqeoxqaLLR/s/ygoINVv5olbyp6J1Y+/iR3w5yD4
         30B5gaC2C6j9gbKV8XGsr0pZfT+iNjkQ+zCWS3e9WuW7cm2sttM9PsAieG9/DE2p15IW
         b4/F6bz86Q5u7kDIRjrJc8+CrLdrMfhe7/Dm/JAkcQVjMBOsk6OhaCCWEg+R57InTn4Y
         LA0w==
X-Forwarded-Encrypted: i=1; AJvYcCV7RbYkscmGf13AU3b6DaaTTfLJsGPagEu7fEO94x/mOkLkDhoplpLT9Gicc25fEU70veER+9uptpdu0C74/a28@lists.infradead.org
X-Gm-Message-State: AOJu0YyGABROSLVXqfQ2TBc3zXm2EAgM5Q7DaVyvIIgFmYRv+UR8FmBJ
	QJ9zIfaU4x459PVFrh/FXFgn1cUCirrTDDO61ySHYoK1x5QT1jvNOa8DommojF5qRqf6CAfin1B
	5edsUDM8l5mgKFlr0drs3+i1Z0Vf2ZtWHKyu1XPhQPWjWEMZjC/nHDrr5N++BxwKBM4Geh+Zb4+
	gxqA==
X-Gm-Gg: AeBDietEwGgPuF1S9L78HDkpYd2UHSGOx8JkLhS+/h8Q8CAeGLEXdVmjlFi7cqQPCsQ
	yqweV7wL+aa+UaXOUEkabAm/VmJn0iXngYu9IoR3UGtyTJFb2eZsgtxy8ZkfE9a9BCA/tETIQ+Z
	e8sx1EJAc023ehCxDIhtEuwCZC3oc8LO4JMM9YLuf0K1Ev9DBs+88mcNUxi0L3/5ICBqCxVKnqB
	0usoTMLivIIa8Cu3t9TyspdzQiMHBkxTS6TNVxd1qnaF6rXamFMR4J8g2aqfonnu0aZ+BlEMS8j
	yvGsNpRRQNr774Xkl6YYKMWz9U698k+Ti6jvqfN9D+ObW5oz2VpJ1ONQ6meoDShAfjcZqNWrH6T
	J5ewOtn0oSv0pUEY4I5RzId1I84iwns5kU7+rfQ0ahptH0Q==
X-Received: by 2002:a05:6a20:3412:b0:39f:43c3:b8b9 with SMTP id adf61e73a8af0-39f43c3c07amr19981164637.57.1775758274147;
        Thu, 09 Apr 2026 11:11:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:3412:b0:39f:43c3:b8b9 with SMTP id adf61e73a8af0-39f43c3c07amr19981134637.57.1775758273489;
        Thu, 09 Apr 2026 11:11:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:43 +0530
Subject: [PATCH v2 2/8] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-2-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Bn7SQjx5T4es9srf_RG7ruqbv0DDN1VG
X-Proofpoint-GUID: Bn7SQjx5T4es9srf_RG7ruqbv0DDN1VG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX87Tg/IIAU3aP
 6hqWXMgsVgby8sMQ0fR7MY9yj+nz04gNBhnO8bEPbFKj+r0M9Auj7mM9SUX4qLMYOI7wMLmCOY4
 iMfcODG/pIMbBjAc7PAFxuqPUtNbWUjGAiGNo73i0Fx3lZr8xK1iLXBRAJo2x9Bpj1QsAm0tyal
 UtR20laUtS2XULaottt1HEExbo6yd4lvSksw2R/IIbYvSN4vDxWF09ZC7FwDuTs+SrC+OSy+dsF
 Wi2wdiN6ATXNZOYnfPeusmPg7Q+H5jUGEqbb9BoEP6ERNymEGSqon3kQT/qolg1yIBnZqsg/m7b
 A+14ue7F+BBLGQiRFXQK0haJpR1ECJdlfRy1C8qsQv5E2c15qd9oxEIMS9JHNFsbMdR9yOwLemX
 D+Pf8QmF5xJZMlkO51fSlNrNJ4C8EJ3Uhr7x9AxxTUeCZHfSmRd3EGp3SFDbdjgsI/H4Ci5KyNE
 HPXk1m0lDwqbRj3lEXw==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7ebc3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111115_564219_C1DC4E4A 
X-CRM114-Status: GOOD (  14.34  )
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


