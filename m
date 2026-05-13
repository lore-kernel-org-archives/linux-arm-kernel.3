Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD81CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=OY3bKZiKmDHJL98FFgt6MlTPgW
	uTvQDlwyMhV4af9ImR23ebPpRWbFiG1EhYwiSATyKtQ9Vcc+iKExNfzxrwUrBHCvSL6Rr/ONbAfio
	tKGFFzJOzr6DZFx4JfvCX7rLUorZ9sBbJ1M2GrXHgsHhcYKFbTybCieVjBek8ec5jYs2RC8eUcJ9o
	cLqAXCyappuC8SlS7kGQav+/+/50DPF5LRnJLQPmbhRGeuZhZPl2qdHB3+EqvJ6hl0hpYe0Y/Hd1c
	sBr10w0cWN3nS9zMUrV98U6GcHjv34Q4kyslW4WGDpg/I5rPA/Tq6QZ+wj0QJ09q2LCQYIklF/LUl
	vewZIAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBVE-000000034Am-4ASb;
	Wed, 13 May 2026 15:28:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBVD-0000000349v-0rHh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:28:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBgxG02965206
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=Q6vaBLC9Q5RyNtb6
	EcVgfERi3pa3bddoaQvnjIRvFdK80K7jrtX8Fau+FiMlDGCstKUV0Suz8lSYTv1f
	CIQfuOtVdwXdPKh+4G8QF5imNQ1hJe1I6ayDDjAAWaOhcnt3SgBI9/hNAtkVoQ4I
	RDDhV6HZ7C0GF7LgTSldz+6J28/1Z3n3/A42WrdQL3kpIHyGnmw9yE7m0/0A8Y+5
	9KBujGKvtbXAYLDdQjmD+53dhWXG7b0HXzCclOIEAueQN6z9dODF94bZ5yavGu4U
	eYCnyRCgtgW5K+eZt33Y6n+7cHEJ5fivsRVQluuH1WSIiqe4NwqF/fL5d547uCC9
	klBZgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5a2c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:28:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd00a65673so20485985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686082; x=1779290882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=LaV4kSutSz9IEbhOpNVkKJWSS59kIpn0p5k2F5CjVFES4hU+YT0BQFG/MmdgI3KYi7
         Owsx3rHkxySSfY3rSXz+A1o0TL5pUQUsTprlKm7eBSTaot+QICCStORoxO1UUhhbMM79
         Q9LfhZWuec2sSGe8r4CSiN5BMcYTILB3+pI89XSOqBuCkaJ4NtZwdeTjJD5aUOwZF1RI
         kDZp3A5tUIbswEZ1l6WHFJ8frpZU82uCR52QDZFfv+mMJDA9BOg2YEz9OrPLUXhiQfxw
         7YM1NkpAgeS3TfckegNjI/ukVyIsi6jC5VPpfJc+7bJLpE6dJ9qTcoMyvLCpIR56Gj5x
         3+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686082; x=1779290882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=tH9944OX2dCJJ5OPPa1kbXWPj8yCg4fxs1GiuYAQC6FDKZg7iI8b07KUwyH0EzKKkd
         ORfU78a+5z+kLX3l/oELGWbk0J86jHl/vXLLh25TycmpfxYIoP+gM8aMiXMfSLY4NAwM
         yttfZDXe0YCq4n++l+I2CgbUIvxtLR0EGiE9jz4Rg5wnj0taVjNmWHBMPQDBpYxlZv2K
         e6BWeN262FAUb81RgRYZmVPiK1D//ejhQzQ40y+euksB/+Kq3OjW4oSDAoyITfZQHI7O
         JA90mTGYpGLm4dRJ+I6s1Aajhubhb5LIBa2wezBsQFMtga61QT1EdMErGBPgTzIERC0t
         VCMg==
X-Forwarded-Encrypted: i=1; AFNElJ8X7cu8VZhtamLNIAFYWz0wLj7II7tfPQ1BJqAjlLS15kB+ZMaSunt9ZD7cnG5T3Zpdj276L3DjtSEwDhoH+IjG@lists.infradead.org
X-Gm-Message-State: AOJu0Yytc1I7kA8eBnRkMXPzek9Tmr509/w1pCSKKYxAs6I8vdDoDmyQ
	2W0nROTsG4yJ84GWM+gIaLx4jZjgNOr0Qrq8Dta4iKW459FvolrzCarC34EMm5hV6LoPwhrK9Bx
	XtPyh/vQ3mkElVuAgx0l3gX+0duSKbtDyOjcGy0GayO9y0ohpt5X9aQbBYYabr8NuqalDYj9xbq
	IU1g==
X-Gm-Gg: Acq92OHcsf1w0eLEOQRVc40EtoI0UnwmCq7u+kkOSkB5ldOp+4LBpl2lzUu+YyafpPZ
	Cp4YNUQ24TEUCK2u00vTvWddO6y8vXDMAEtLeWrNy8J6J8G1J4ZydmemKMqSpgLSBT1SxmiODDs
	A2Qj6gqU27YP7Dnxoajf0veOmItwuL1cIJMH3bCWxyxArPqIWYx6+QmUnZHkVh0569dAeuEX97j
	glITMIFxvTvLhr64Uap/W43l5R4AJwFBgah05pNVcPjQe4/vVvEGa5una7esf8NUEyd1b1DAdrR
	1FeGwwy7qWOWgk1jJPxvZIPrCrOlyCm/DtLpbbPdcaabXSenpq6UDSa2Xzc+c+dJkcOCJN+BzoN
	J701ITNy3Zgjc8y/TCF9PI8EGjdvVNs8/UH3rGVDtCXZ15A==
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr48255ad.5.1778686082013;
        Wed, 13 May 2026 08:28:02 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr47645ad.5.1778686081455;
        Wed, 13 May 2026 08:28:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:37 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-2-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX/vFDhOCYDTMD
 UGRRaHmEAFJpOaoRevV7KPZsNVNP1Wfr2eZEb6GsDXonhPH3FoShPbKzUjhJIbJrDA4js94Rp7R
 V3nK4v4e10QGED7S9c7ok8Wr5g+e4ErVN65X+XrfLjL/ccUA+LjPR647zD8Q2Ti44GTEgUchYga
 lh04vrONza5+25FDHZaZzNSMuvNlPKnTsHuSVQq96w3dCeP/Utk6qUCFCiUqYlXWF6NmZ3Nj11k
 lYQM0d+MgqjMv6VDUt0Pf0GIIKQxt5lxKGzWR/nomxOxeEOlCV043zGOkr88lluMIGWgDjOcbss
 VrayVuPMpW03MkAOcGRI52JFxOxkTc4dJ9VJhGFVKPxp3arkP2LeNbwR0Trz7DCFIyUacCn+pdR
 LcGWm1fJR/k+AVwErB2RtHFZw4+884U8NvPi67e0LEJ4E0ZoLwpch5BkXtkEo1qaFjZYKVfoOJN
 ycgDpXDAVy1RvItuLbA==
X-Proofpoint-ORIG-GUID: 9BoZ5ixdPKS3PhTbMib2bobdlHhW3j1R
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049882 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9BoZ5ixdPKS3PhTbMib2bobdlHhW3j1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_082803_247067_611DAB46 
X-CRM114-Status: GOOD (  14.86  )
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


