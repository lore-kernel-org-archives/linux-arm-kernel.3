Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA805D11190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=bvzVbEGODG6ZkheS4lkhgnqC78
	7+Hq/uMD/3CXZc3LcUzIEjKBNHhiqktFji1sgzxyfcGm875tzB5Q3kKMo2yW3W9NX95TOZ8FZ36gy
	slf6E8V4OsGmmjxJBihyUESJd2eKirTXAWNS3Zct+wYMSQKzeQ/pRrAi4spbZzO0+VlvJIGVQCcrI
	HlbzzMNulBdOdltO6iTiwCPs0Zq5VIkkYhQOzP98FAobcUnlprn4d6HX6QCL+6kA7hJghYy2W6AEL
	j0bFPqKIHF0ttBIecLr3RgCJzC+ZaiOWnLShp4jE9a5/oeMm06VtiXZVBFIFUcBOme0dQ8Xda05DQ
	z5C4JLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrW-0000000FLMS-0kkg;
	Wed, 26 Nov 2025 16:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrO-0000000FLFP-1FBO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=WKSTzncEplCpN7HSoRxwI9fgQw
	WnjGlt5iKT2/SyCHDWmIyOnWKwmh+agK5HWTtPSmb2+hROPCndwfyTuT300GsnD4OSJYVuMxhftUh
	62UHnfendOyr4JdvWvvdT7mbbtwfUaOTKVhAGX0uh+XLPe1w4ms+Z8vr3n7C+/IiWIJsl39IrPn1h
	0UahnG5ZXTLKWHzEFGEtSbK4iE2pyRJ5ZlaVOtO0Mib9L/s0/v4L0Z+/IjQ1t45aOAbuvjhZct5b2
	xDSVCHTkbUxuEObovvTRYtSG+S6IGXvLn015jkc8Cdb/q2PeAqWBS9Y07rinTzerMJb42VO8Bk0ER
	2GwB61Kg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzk-00000008S4Y-2WMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ93Khm4049259
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=bJtnp3o5V63hX1tu
	jYvWzgAiqf9H5wPFkebRqHUZhN5rcKodQfnumZqeRjeC77uV4oPw1GjrlLvHS6dn
	7W4ZiVWQ79r50+0pXDWqPA9ao0ZRGxYo5uwixoMiVLCKkvMXPtRk5Yq29VIpy9s/
	4rwAj3JZbNow8hAkTqn72qnLWAzAfZDQAE1XTLRSUGr8oKMUwugjYQjP1cWMygVd
	Bfe1PENeOnmrKjQXVfI0bZ2nE9EmykSStASroZj36N6HLMbCWtTr0FxnQfRC9jcV
	FfWgL9Ezqm3CeGTpGztvw4b3O0FgVoYL6+i02b6qLEWNRjMl7liCs040DQARP7U5
	0M/7Ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njqck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so753681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176350; x=1764781150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=UQffASj0FbjqSx3sd7EOddnWkOk9Fi9lgQJkhZOXJ0Q2xSwEgnjfgg33RSGqeS8tN6
         SDcr5qnyfb7e4TEZlmx8BVQKTEsIfV27KGhzju0mFgA7y02BzZ4FD+kfnUmpHahrfKg0
         wJBycnZFRnd61TBN0XyiHSYugK+JNR1URd7z/Tg7Rmi7HbvtdiO7jUYRKvkFP8LBUz8y
         d83IthGvBL+luhyT0Zpp/MnzZMxD4gFBj4zmpbpkAdOpsqJUuRAqGBhfj/0dTTnVkPNd
         y7sC9/i4IDrHxvnqV9RinedFN0U5VErCpmk8lcYieOilmsR2dyEItkTxjddjRwxAf1Ru
         I77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176350; x=1764781150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=NX2X5oAY/LveOd1nmEHS5N3Xa+MvmpoIMIkLmQdYMPYcAWSBzcZMoR5YPne69m2ADy
         jRz3xGQiP/UYvbSh6keFJoOzAEwnJotutwXWy+dPTSQ10yl7f9ph30XI806oKxdoX5Uh
         RrSBCLtBtUg3oDmOUbGkCaaw6Y9xiIN6POioTjxo3fcjK737RrIpDblzdVl6iy/Zndd6
         4uLWtxaooLjwtpmKSqvhENZEeO2+R/2ufs52M1XEXhojIpJetQcX0Ok68g5sHoWP6MiS
         oUicsV0k/AjXtmuyciCJbz2f9RvELFRlUPSlbgU7vwMBb3vgPRitWJY8aUKqMPDTmJk5
         vkaA==
X-Forwarded-Encrypted: i=1; AJvYcCVXx7Y0vyT/eXJUthj+Z18QRATTd1Z/qoZLDCbLBFUgPJIrhvjBNkrMmUlETRt5u6lkidLI1eszoTWZbiQbAMGH@lists.infradead.org
X-Gm-Message-State: AOJu0YyA5fvewT7PLA8MOCrStUDeJb3go9Z+lN558nKLI/akWhHZF9u6
	RYQf/eecz35/n595KjpEmVbhNaJw4ZRnRRWPx4RJ/nME3q+bojwJf2BmsZLfxBrlL+AO4SesnOj
	hTRZnT4Qshk/ZWMxOf6OcIe47X82EUX6HUrNaGuZAy6LkxV9jrlcN3O13Nd7vJc/5pWndaOpC8z
	Wa/g==
X-Gm-Gg: ASbGncupYdCu+JWTR+G4sntpsJMIa9NCjVMsGmLoERRbGW/b31rYWsty85f8FF1qx+I
	M15zhaBmRa3j6clldZC0usEfP4xjfsXsOU1v22x0kbYn5GfNlWsZ7c+pYHsbYjIU5MBfgGuJcYg
	peacEzfBG+ThkYPEVes26jblILBT8BIfCpdOyBcTrwIe9iRyXbcup36yvnZ8/RFRfpQ9aH1Udzx
	uJBrsKiVC3hAmAn90n8lko/2qFDfE4NeChliC503erNKoaZU7Rmlx0adr7M2dpySNv2iFoaSbSm
	UlKX9lNr3Ewb5rV1HWoTM6hDIDFYzjBsXcVpE/FsBFAx1i3GkY9f1HWeMlVPswVjLoc7BWNEPkt
	tM/9H57GwqKpNOPzDj5FJ/EtYXNOedw40Fw==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971291cf.44.1764176349903;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErBnHpfn744afixM3E2g1It17xfT+FfmSgDWhqDDmm7wcZnjLFgMoXR5FHu4Z0fr4SV0TEWQ==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971011cf.44.1764176349506;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:45 +0100
Subject: [PATCH 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-2-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHSY6WydZE9KNyD+CnPH7zWuDEoWof3fnfdW
 iIbYj9M3/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0gAKCRDBN2bmhouD
 17Q7D/49mEg2t66KhjK0643fF0ogQe7s2j4vBij03DGs/YvbwTJpSNL5Lyi0ASig52sbv+hefZ7
 krUNF8gash9QMCaiqpRfStyJ1eN42Hb7AIjy6q89cEWlMHJJRQZEI7aEraOHiAScoELINAe4vZ9
 7sWq+IZjsKL7VeGHBxsugUnornYakD7qwV4BWySvwhDIUehdd6ySorDcfRjrecnVnLYoKlSk8ar
 7V57tmOXumHlfYAOUH+naOMGHt96AYNe1UImqYgaTLQWPV5ZMKYZQFC/Gnl9JXX+N+56qwBdkKI
 8SRJL50VPmtiDRovpCZgirizdrQGjNJpUITVAN4rHcle9zIaZXKfZpKyeeZ90p5Mw97+TkH30eO
 CsYAXBg7iK/DtVkziBokGv/ltrakEvyhc3M4+P6xDdm7TfKEL0ZVEbTsGMeoY3cI9oKaVh57QYx
 s7U6r+p708lLqKmCLztNT4XmHQgAJUVgby8vO1yql0TXf/9+2RXqJXp0Un6BqP7pTORGMPXv5zw
 +wbkt2YXS5SUPKUGhcmr8ACx+Oob1V7rUmG6Hv/EFicchNuU79RyN8HMAIrNa7aoG/eIcWufNIq
 lotaeJb2ys+gGpA0aAsd266GQuRSuy6OwgOOZqA/qM1kfKsqEwBljv0LYus4/n/Ep38XFB4ILze
 /Opxx/NrKZtVu4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=692731df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Tj7rEGiCdXCmlaVpuWLXAvspxpKsM0LO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfXzDtn9XXwbBeO
 jOmXnf4VGS6Ea+6k+QbszqfD/IFCBNPiNY6KIIn/N8bivH4iS5U7XIky2JDmAg8eWZPT8U+laiy
 3nBoyI0XNcvvCj/9JM4FMmoOpR6ZsPaa6EvQv8R5GAd4pe26hswRugjDTxlg6RL/z6ImBYT06Lh
 xjMGoPgVK+2xS2fFucwDC/TOyDo+pB8prcZNrifK9t0VUM3DTwK3f/GiDxxd3ICFK0O4ugYt7ED
 h/91Jmy+XHeSJsqFs8ZCGNYIAlYwXK0LQgrlzS7C7+P6PUPT350H2REThD5wcdOzBT++Ii2oaT0
 Ml3iO7/YZK06otxqcZ+HIMDUiDtTYCLMIiYDvMG/jkTRE6quQrkQE4nwcTiyPf9qp3d1pRtEeTb
 8MlD+FB53VbK4EWJL8ICjxWNeeDWIA==
X-Proofpoint-ORIG-GUID: Tj7rEGiCdXCmlaVpuWLXAvspxpKsM0LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160353_194771_1D94FE7C 
X-CRM114-Status: GOOD (  15.84  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71815-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 79fbb45297f6..8da57a7bb2f1 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -173,9 +173,9 @@ static int set_hw_dvs_levels(struct device_node *np,
 			     const struct regulator_desc *desc,
 			     struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 	return rohm_regulator_set_dvs_levels(data->dvs, np, desc, cfg->regmap);
 }
 
@@ -195,10 +195,10 @@ static int buck12_set_hw_dvs_levels(struct device_node *np,
 				    const struct regulator_desc *desc,
 				    struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 	int ret = 0, val;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 
 	if (of_property_present(np, "rohm,dvs-run-voltage") ||
 	    of_property_present(np, "rohm,dvs-suspend-voltage") ||

-- 
2.48.1


