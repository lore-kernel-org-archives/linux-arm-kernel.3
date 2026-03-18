Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5F1103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=; b=eV7eaS/JePxHkBTqtn0tuqI2qC
	svq5QxMPJgyTFXBuj0BPO1vA83GGWBBvp9CNYfwlqCtz4UV2+ySCZayP272AwHV6pJbUYbVk4axeS
	BLG/1Y7o4bIAkpsKdPU98UVWM52CVMcdT1n/Y+wkqW2ZEsR97Cotdy6JDumaIAqlPiF3XHN22C3yB
	pA8p7xXI/HwyWdLuDP2V1bHYcSljB6BX7aLbvggkN7A6CDccpOhG8WFt5RAgTQUkHSoe038I5RYp1
	V3ulu7S7dc6paM9RzAZUOBZe0Jw7KEQBPQ4CQIzdZ24YqNn5LwfHWjhX/haQXe+D2ekeNp2WCWYvD
	7/BqDKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oll-00000008HVs-3hvz;
	Wed, 18 Mar 2026 11:08:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2olj-00000008HUG-00KC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:08:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhxXn008387
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=; b=fPbHMay0Jir2ng62
	tdJZNm1JE8iGWPoNZl07UqAih8B9Q/6vNEOzw0JFfqoZJd2lFpVWHTN/1yJ+7iGf
	eiJWMCIvhKWf5wwT6CLNhEnifTHmDJLi2h0xcxkr0+zZ4BVufUPYo+p3pdPMnqYy
	BfomCmvFtt20ENF3AvtgPr49PuT+KgbS3EF5w/R9ahYrULKvaca2m0zcKTqAjFne
	1xCcmRXHafS/wGZADMYPJLSWDBxrW8ukXkB++e/5DtY64gfXnHEpLigyKOZL1Rvt
	6u/adY7Dh37SVAGGpRybB3Nz1thMgVlj712OI3zEIbuYnFs1e2xreHMmQmp9n2gO
	ue4khw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj502rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:08:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509181cc6ebso18201131cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832133; x=1774436933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=inGZMZT2BU7I7gZU7NldJZALF/3umcmfSESQo7Xu3PgvGoewQhWmb2hkPABeMDsBgc
         2ftLGw1Rkz5JOCLvcxjOskBQcQvUG4RwA509C9Er7fif13SVrWAc9KWjZ2ReD31JQlo+
         hZQvp1p/5KE9t3x0At6ATnfsM9iqJzOgZmb20VNUTO+AlPzS86hZ3GRbnrZnEXW01d5F
         eGT7MHyMKPi3SvgE/vV/aKjQVyOnJY5MCDuWJOi7WVW9gZcD4Qornkw1R8lbRp3xZZNL
         uXQ1QpDM5uw7N0zvOQHlGETuIOhLO7wmbJi/yoZWC8LlWZ3G372P7IP1C+XtK8qQ51EI
         BlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832133; x=1774436933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=qTZFSy0FJR5PjUUCWKepyiLgWFtpU9/McHuJ1YCQdT52p5Hxds0gIVVGaZmR2ueIjF
         1JRBx7QkUzsPn+laIIVZhV0/Z3j78movQ0GhiROyFDJHboSziBAehN5mgFcrQqtIAsWm
         eM7S/dSP6a/FjF5WGyrFbIJZbHbSVjmxBKloH5FVbQmqNQ7iff4MweXYIzyfiql8315B
         KuhsrHX+veHVvXTlT4xfSZzBQuaW3bR41t2PS0y0udRtzL4uEqqkBx0yRgNZL3F/LZKo
         7IwmL4PCQ1f2qLSr+Uoe0gLjtg3rPnGahciO6GjHWDr4B8pQDRYDJKvLozUEhwuF3Xkq
         oR3g==
X-Forwarded-Encrypted: i=1; AJvYcCVnB9RItkELtuyHJPcUHSYSkXabopV90H35pSGcvShgKkJ9LaIzofBrSlN9cKekDzGHzELFmDoGCwsCkVahx9Z7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hPpLG3hzrKMwCLkib5VqizMTggVRdI8+HAiho9BUGuD9/KaO
	orI1UsRsDvrw1Wp2EFQVjeQ8B1Kk4W0DJUflchxlLUrX7/F2y1qLNgciNAMgDn2f6jr44OjvBFA
	2J8ICannuMs8qYklrax6j84CBzG7K9rCkpqzEufqu0Ztm3CeAPqx0QBA/UFk+yWCeilui6VVvbm
	w2JQ==
X-Gm-Gg: ATEYQzyaqrz5lq9Av2l65vZZQO+RLtpzrvaulxjNts+Wpa5gvU8FJsExUMn+ocKN5Te
	z1nCqCLo4JArDD3GmG8p0l+oSwBgKSRZfs7sl4tkRDEZkJyUSmr6wUNcd7110aoHyc5mVphP11r
	nOICpL+ZFjKaS0Ti5hJnZzvxKySPjZ28+MApuqJ2qIaD9jFqzi25NV6uoFKwFm3ULy4//BqRoCS
	JIPgYIASIVRpg2Q/uY7zx2Rd/+abNTJ7gPJh7uAmjybieAta01h9hq+OpdAstAq58TkjZDoCtpi
	CacYz8ACwS90FDBb/xKBkLNHs5OfKLFT8vwVXBaQnVN2XXu+AhcJMHuvX4AlklI/pkxqE1aiexw
	UXaeEisBWUo+SxPNyhP3Fy8u78KOOcui9XmTm1DPfsNLB
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893461cf.70.1773832133442;
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893221cf.70.1773832132970;
        Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:41 +0100
Subject: [PATCH 2/5] clk: qcom: glymur: Cleanup redundant header includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-2-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe7tb3T1F//ePKnz2ZNSrG63JhuojRWfgyba
 or99fgohWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuwAKCRDBN2bmhouD
 15UyD/49o6xfpTW6OMtLVORG4Cq9Xen7SuTGalwr3Vpq02B62ezBLlRAtyMq8BKdosAfA92c87P
 ta0VJcgivQwTCE1kxLCsneYl8QGsrKOCBi1TRKXmcPHa2uQBTIl9SNK+LXbMzyxNPsaU+3xUx1l
 SzJeqAWeFgDddRWFfWJIOwwRMCHENdv8YmCIl1BozuvmtnSYarpJqYcOTwoE44FOeZ8kMGs2WrC
 b7FjNgta6idYoOCD/oS0uro98YEdnlq67AGUgyIr/3MQzcYymZqnEzr8fUTMduiiO8vWCSRHsNN
 UO1mgHIoIQOg4tZBSz8sU3Fm8TqNxEEIfTIKwUCJ1vJXX/Am3isOhlub4pTIjAyjuE+UipXl/x1
 923raUkaN5hKPSOKdCkWN9gtYqCvNuiNeClQWI1KIhmZCP8IeqOGTGCnEJbCXF0zHJBe0XPPxie
 IWuOY1eNb2oNQXwQwjH4z16Ej2BxhVX3llfkxFAM9PDbrgVbRfG7jSG3jJINU70rqAMxhctfPsR
 Gey8JKvidAKoTwLbSCm1EppQ4DrAK0YfLaju8sBmT36Gqnj1OxulLUvzUU64efzk+4ZXWvS05NG
 Al2EFC21I9lopynMLUm0xFMC9WS7Pm+CctgxpJfSv4ZJMaMcg0qESs9Ds7NSuB9CHoDGy2iStjF
 518b+5RVX852DmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX2qU9uT7tD84y
 hoXwnXMl+OZNNubm8d+79FoVQo8250lOzffqYO24/nfgOIK5mtBjBkmnV7XqP+txi6t6LE+cnm8
 TXI20/lDNUYI3Zt6d1/OXDxrhGUb0Y8C0KU41PZi71sgr25fOf54X3kdc4eJEw02iENYnUwijad
 4/6j0bgR5s/T54/0Zy36v9WaoJQ/q2U80sbQVJAGHE4SiIFDhjFSE7y7kVs4jiZ9WQVl2ibHWBB
 ajjb3KniaNHhoFpcUc/uM7zWgdBWsVEEOsr7Cxkp2WVZrwjilFJYz43JZSwPtjfu4justHoYkhI
 FIDr0cD5pcY2+gODBGlps98W2njwoqI4J1xbZZmLLmjloT5NUoAW2rJYEArv4jAw3Poybpv7mv7
 Liybo4DDCgaJDRps3zkjZg13xHtX3CNEvOSU05RC8v02x/RdZA+VaSG7EYyc4e3YbVQgwjhqeMZ
 kdyHZRV0ANPatPzWHuw==
X-Proofpoint-ORIG-GUID: vQjXc8b1YmIuqu3E6pqW6zGMBgR5_LFn
X-Proofpoint-GUID: vQjXc8b1YmIuqu3E6pqW6zGMBgR5_LFn
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba87c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=n9SAOWaOJGgEd7NqaGEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040855_167904_DC520CCE 
X-CRM114-Status: GOOD (  12.94  )
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

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c  | 2 --
 drivers/clk/qcom/gcc-glymur.c     | 1 -
 drivers/clk/qcom/gpucc-glymur.c   | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c  | 1 -
 drivers/clk/qcom/videocc-glymur.c | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index a8c3cbf591d1..fd085cb90667 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..1a5d3d182705 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 2617de0cb1c9..1a1d946347d0 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9d9621a61072..9c0edebcdbb1 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 5dea01f9e20d..bb3aae6b8396 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


