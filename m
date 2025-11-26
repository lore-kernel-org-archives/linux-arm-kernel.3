Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9ED11186
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=rATDmki0uFroX4tJY1+Zvt3Uux
	rXPOK+xTn6+7f15lyZYaq6QK0ZmePEYXur9g6nXgfeImNNX2vtDIpx+IUiiKvuURU/+9M+I4xbHXX
	c56VAQY4p62mWbu+8L2uUj0Y8EeudL0tF459q80d62niz2Cl7FpWlflHTDmZZKhSS2+phRCULlP0P
	QfR0zFR3u2Kx8M1wCZ+U50ajBNiahQcemZd21vP5+mj4DwmikaonNNyxZp3w580upvmuquSjfHhOm
	K8vMldLfNMNWEkMHmcrOpXxR4oM/N2miUi39ZwdsPCJwqOhYawZFDANaEn3Wr/4tVZBeoCz/h6eiJ
	w4QLmP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrZ-0000000FLSm-37fc;
	Wed, 26 Nov 2025 16:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrU-0000000FLKo-1DTi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=EjkPr/L+SgzrPq16ZZRd7c61OI
	N2yuwFCL16Gv1P0W7yd7+rMnaIV8SUKd4WoNdT9zkaJT/md9eD13oyZWX3pJDLUE3Ag49BXhLo/vu
	g8ZrwsVLDM8Qejr4Mt7lYhlOv1vbxzC6yODjdKGssv9rS4g7KwElTBzlN8tjBPyhnfVIrB8CGamk1
	xEpvJdENWysYgsw+Q7RZjyrPWo6+2iTJm4XIAnHf3WCD4BlezdE2lyvlI6VIQGqpRTVDxpPtRZf78
	nkKyTUNEzD5wIobW9NMBJWpee5ESSdAkVBJ89Gadc7qI3kiN3tUG2h/2BIf1yqyrNP8Dd8ZrqiS2j
	ZxXwFOKw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzq-00000008S7b-2zOl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:04:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB3nT61667742
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=NiTDr1F/7VsrM3ga
	xeDmYRK858JyNr1fY8dbQey34eJhZcxDLWjsahnqZd/ctVMO7+d2608wWkQGg0xo
	QY8u+OO0fjhuibpI9TFV18miyoVxTjKs1KfpOBeQ4/PjAQxLnWP2u6MHHsal8Sdg
	9lwN0R1lAqQQJIWaQwXYANN4180sa+g5w6EOUuagt8i+bSrLHU5X41kHSbd8qLrL
	0HVrbzSGY/svR/M5GRTT4tbTxkNJ49HiOl/CGApxZbwqIl8nrMPRkdmyKao5g9ge
	KHjzfgCEryf+ewWpGvzxWdXRxFX9pYXn166VPVjvmKlkFO6BG6IbnDspk4Gsa8nn
	rixK5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmrykp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 16:59:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee42d99125so928441cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176359; x=1764781159; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=OlQntjYR/LND1nAi9APMD/6j/OGAWgCHS/oLk7I9vGv1lh1cTl7/14LIe8+YQ71COa
         /jl1FF/kPFTEgmY5DkhTMVvZEAvXdVyuWXQY8Wjk7fNHUN2c070b7AM6G2WDxvoWNf/9
         o98E0bOPnmDGITISW2kVZdlUxz9+0DBzWFRTaxAR9DNCkCjci9ReGccCsblRGp42rkO+
         G9Hc/s5/ex38n9NzHrbVeKJu2FEAktcN365mNUr9k+hM6BuhadO4dgQIy5I4rs/yirWm
         bFbyzYxF+9iBzYrss4xEECWIMGEUpRuI+HddQjMF7x89GzWjSZ7/o60yr4RdPP1TZnB7
         Um6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176359; x=1764781159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=rEP8r1yh6HtxJM2X1Vg4+D7Ik9tE03dExTPnV8ohhZzK09nVU9631zthZc9rkJtslq
         kmHXfNQFnc02Wk/RlhKkNq6g4hIzsTrqvz35koz7p/GGOvJpGfKsi4y4oYNyQBmGpWpR
         bwLKGvm3uIhdf47l//2kCGiaJMFc4OPuFDPJcSDGppvvOBHXmaXvSpGT74j17oBn4wLc
         7bE9dn7NdldJoueKVtfcygvoN9gZmxZ/JE0NzTHvlVM3PVi/AJv9oGp0LJacmBcHLws2
         GCmJLmPaNH+JUGWN6GZvV/is9LGiURP+M4CyI1gK9Ffhf5W102NRk+1JVARQD/G8IMk1
         tMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVuEB0MbkPWIYejW8b+uGFJHrYB3yU7x6nQKfhsORp4tQvRUAhkcQa3gG+jiz6fQgvAkE80MSCbiou31xDGDWYK@lists.infradead.org
X-Gm-Message-State: AOJu0YyylH6JTxNCh2g3gX2Tu2tYA5NR/OgD0s1CGM4luK0TORb20CUf
	D6JGsoVChUUdx3m+KL+WrQbchJgg8+CjIlc/KdtIokZVri7d34w0n1yB/ErvD/8f0xJnNApiH1j
	nuS24ybcATlPU6eSDPVLv76GhDQy5brxi9UdNacZHu8El5iw3XR8cWczUr26B08/DzbbbeKZmio
	8FXQ==
X-Gm-Gg: ASbGncsKAXMuju5VxtiU74soqa8HqtB3JBZ8Cp1YL8rz7svU+vSEL20w7NmnjWlrLdL
	a5MDgPeMtkeF7ZbhZN9S5XREkF4rVZmPJdjHoQd4Me1esAKFGCZCwmYXc258ns0JQMf97arBWv3
	ZRlWybhYzkpwzy/+kS3pJ5V82SH3xk+T2to6b4YZPVj0tNmMJy68A2bEwDxfFpU+AkLgBukpGlp
	EfKEU2oX2WYd/6/M+IPduGRvxqhki57DAyryAoDRyKvwnRFmgVmuZzXGbErAU8wyTFVJmIJuLDH
	X5Rh6+kBzyrRDivkoUQ5nEFsj6q0DHMNZbv1LX293+f1chIx8xLUtZ80g3i5UHO6p0yzsd1aAS9
	rP2O809TGAcbm9NwlcuOX6lGndpE1d6mZng==
X-Received: by 2002:a05:622a:83:b0:4ed:b82b:199b with SMTP id d75a77b69052e-4ee58a7fcfdmr280745951cf.25.1764176358697;
        Wed, 26 Nov 2025 08:59:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Nz5Yp1BIM1KY7e49OaHY0IEhF5wMZdOUEypF18c/ESGrBdCJhh92JCRgAgFt++hNUAfGrg==
X-Received: by 2002:a05:622a:83:b0:4ed:b82b:199b with SMTP id d75a77b69052e-4ee58a7fcfdmr280745601cf.25.1764176358309;
        Wed, 26 Nov 2025 08:59:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:51 +0100
Subject: [PATCH 8/8] regulator: pf9453: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-8-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHYXmo0mXPdOVlHCVazTBqn0/qr5MvMIY7+v
 uTv0NxK5R6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx2AAKCRDBN2bmhouD
 116PD/96Qy81QJpXLgEUygAsiYq1Y0UUEImHwCVulXcY0S2IN6/DD0T46awe8VLEeh3nEsA53Vi
 C4f00fwrMbwLzzRP7YERqcUGtgksB5Vj7wgs5LZU/6ktN8YsSwtisDnhl9nzRJkbCKsh0bc4hBT
 AomTnNlxw1HK3lhus33gTYomSuh9zHXQIJ1NKn7NQu8DXrUxReXklh7puUf5p5/f5MQ15nzX14a
 0OjZzzfTNr74KKjeuJMwZ0L6y5XELVDhmVQQhwZKAJWMTuE5A320J39yUQuug6pplw7E+zsqM1P
 rY5fG4PX1JSsScLfpo76Ih/CuYRjzkaO/4dtNt2bReX6eDfAbsbhZk1aP4vugPf/Ug3pG3Xk9TQ
 mqAqu6oKRggIcVSHlS+qd8DoOXQduIhqtxWDcL0A+a949atcum4QUcg3uRYalbTz+JZeD9nJJI7
 9kn1Vs6QrEDmDu+CUQxDd1hDIazOLRLeXmTYL83SLRFWGsIoL6GtFrP49pgWigVqH88Sz3sYQmL
 bkY5KUf3AehEJrUCYaRHFtNS2KkNWCHdhd4GXzCqvmob91i47C2S+rs2AfpVx/Co/9S1jy2nChJ
 Ub1MlfbhoxOeWOUgSvcY0rPkyogfegn8D148yhBPxi/TRtsTm1gdwsnVWay6+OqrP0vDscnk+h3
 6I7ZwKcG4Lg1B+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=692731e7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX49FHwm0BKD2r
 LXsvEuNY/EQQNmHHnlhUAQThPvjBx+/C09FRpbB7LM/2dijSxRrdac5r4fn+bmjcr2N8q25KR6V
 Anf55io3PbjsvHBp31UqadUyEErAz7Gv80r1H/ZGKlE7N5yjRBbwPPR8k77ycWHCtCZJwAyM0kR
 EBttBwxJezlH9JqRzR0yueCUkEjHrIz/xm87u8xYmaXJKrWCUfDYidj4wmuA87+KQ0xJ79nHw5W
 bXfTRD8tvas8EzzWDjsYdvr+O1EbOD/WXH0C1AvQ2n924YR8HSd21m6WnDYP9ppOIBCnTFzknin
 A2mWxiug7swSfs+1zwzFaqtLjss2mLzMTJy91cqIGuShJno5+M4IRO48s3PQ1Sven3HQhlqGNQw
 zJvFAOszCCXaKL7t+jLmB/Sq90nZLg==
X-Proofpoint-GUID: knInWh-yvqvoZB_atrNpr8rEcY3CnMym
X-Proofpoint-ORIG-GUID: knInWh-yvqvoZB_atrNpr8rEcY3CnMym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160359_124366_4B84A10F 
X-CRM114-Status: GOOD (  16.72  )
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
 drivers/regulator/pf9453-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index cdb80f9d1bd7..779a6fdb0574 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -538,7 +538,9 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 static int pf9453_set_dvs_levels(struct device_node *np, const struct regulator_desc *desc,
 				 struct regulator_config *cfg)
 {
-	struct pf9453_regulator_desc *data = container_of(desc, struct pf9453_regulator_desc, desc);
+	const struct pf9453_regulator_desc *data = container_of_const(desc,
+								      struct pf9453_regulator_desc,
+								      desc);
 	struct pf9453 *pf9453 = dev_get_drvdata(cfg->dev);
 	const struct pf9453_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;

-- 
2.48.1


