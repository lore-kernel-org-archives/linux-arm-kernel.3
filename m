Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DEAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ca2td9+EyVlsweraoMntmzjYhSdPbwsqF8kFzfiyaX4=; b=BXHGqawiaoAlvz1NAeFyUJX1fS
	RooeV8+2RQoUk+4U6sk1Y52Dy6UI2DaNxXUfXk5zbW9nZCtp6POfOGSaKFKHZBaXO1gSlXFyNPDTd
	UipjGmYmiUGbydBcB0/ZEgOORQvNxI92B96kyQ7iUS4HlvSV71M9VVfQ/xG4r0AFYsqcmNPpQMomP
	e/kr9mVkHeZPPDBihuWxTGiS042wEtFzJOHzIDS3UJ+cbfiIUzTWWXilW6OVpJrwi8PqrKTO/s5rY
	ZhS4wwH2auB2DDm/dxjV9yHeuETZM81N+GVbRvwvrhs/PXUcTTfW+D+ggp5yXeuJq3AbTGQNKFbzm
	vhIto7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgksO-0000000CpoN-2BU5;
	Mon, 06 Jul 2026 15:04:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgksL-0000000Cpmy-3v7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:04:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE4hC687993
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ca2td9+EyVlsweraoMntmzjY
	hSdPbwsqF8kFzfiyaX4=; b=AN2GHhtmMMxBmwhxImr+fE8YcEtR/M0eVlKUqV66
	oveiQyg3nTu2wZ76otqvpdNWss7noUClU42QGos4EFu7VQ45pPxoEzw+nEbb7gtZ
	ucCyHSsB+Dwx9kIiLWf7SSS9Xn03PlC1Sr3JRro1hzjF/5fC8BR/fXRDI/lFznfm
	an8HJClriUnfgVKmtNWH6tbqL9ARkTzeCVTDiXnHojqMVfDGGz27/RYhPKy1jpD/
	uu/iPvQ/cN+PywxEzBuQG3qJEgH3zcpQ2vRLikbfVNLFUMjjglMMnA0Tkgov8fOi
	qX9PpDojdZEesiY4S09lTIJs6Opw01D8MlDxo05HdA/6EQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98h8wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:04:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd797e447cso4444234e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783350288; x=1783955088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ca2td9+EyVlsweraoMntmzjYhSdPbwsqF8kFzfiyaX4=;
        b=ckVa81D9msvJqwhRYyeJ1BhxtpHT8/e/gufFIWgfNHTDtFyWXb0qdCjquZeXpOns2m
         xSHLU2X4zou57pp+5I1iUW3KOxgbYuuuaRzbZLeb3sFI535iD79qv+y491KIKxNKqAQ+
         hxIst9nbBdfjpVJDYMaMfBxg7kyFPYny2XtrOPZV/+ssknzndb3vtBuIJaa7ZwuYsn8k
         imOd8Jsfslzbk/GRQRwmJO4oTc+jaX3R8GHlzENmh8uJs8ypdz0LPK+u+4j4AsHDuXyJ
         /r/DkK2bBnMzB6rTrgsmexptb80hlerMs0hNzgESUR8faDFCRXNWdV2Q8F9S8IZ0rI5Q
         8sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350288; x=1783955088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ca2td9+EyVlsweraoMntmzjYhSdPbwsqF8kFzfiyaX4=;
        b=bnQM8aF939p+PMw6JONO5/kJB4E4GqPr3YjRuDGsjKYXgYfhCjB7DTNoQgZV3zgIwb
         b8dr/oAcwo3eGpeXZZGRT9DRQZHP2FFk+yYGsdB4ig08821Fnnl8C5e4M1D1jy0Zvt6i
         1i/jHiCcowRBnewLs1/BhqVNx+X0VKkOq+7R28o3xEGy4O3LKTkHo257Q+n6vrCYQ6QM
         EElFdCg1er/xKTrq4rYQzk/xZQHDBx6K5Dsd9IVOStlFHjZGtsQsoIdsWWwCqndLnPFx
         3HEwH1QbgXzexi/bq+9vewPTw7xKd+78bqlHxUXjzg70x/Kr8nCDNiyHMQscr4I5GBqO
         ThkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfeJVRp12O5OC4WwkxMP/DMLcPorWc7M5zKrhsup3j/9dKmZEpLLu48LAwcOjFSn1UzEx16ITFrbQa7wdlDiRg@lists.infradead.org
X-Gm-Message-State: AOJu0YxK1cenw1tkfDo6JeooHbjvWZb1yTnd63wwjLnE7qOpJluE2Hox
	t4/p/uGpI8jTI3yPylx+nR7+xs19H1NDtHfQm69vh6UxEsU/Dnby812lBKiPnMoANP9SglnFv0s
	y2l0X0GR82DNhWBX8nyvZYweMcsMRsXGuKbZV7yvZAFbVD8WIbv7DaNgI5oRm4hBqpcaVI0BZMm
	4zin/Jg7bMqg==
X-Gm-Gg: AfdE7cl4gAlzez5tbwcdtpPLbPUiHYdvvKJaHk6XGcXZwWkUuIDYMV58i2NFjGD86ts
	mIDvl1uVIF8HwholcZfQBLL02/vnGooLpc8MuehP+KzX6brGFcRe7KxgMVWwqZn8NhM5/l/qQW7
	W56PoFnY1d/WrPaUzkpNMYokA1TuM4YhHE7+c3fghEcalIKN5noY94IWTu4knoGtGLXHJK/duL7
	RoysqCi6L+SkwtB0FlWhfc6JX2rb2UGmXHYeffytVe6wa2mqqMXL2hb5RyX7+QsI3I5H/Wwaz9J
	LeOlJL4/cLRFq4obC6sNRdAtMAarMrS1uhS4ZKAxOxID1yRWBwlpTWVGnUeTZuE/lvb6/rF4w5j
	B5ao/UK6Q9GXU42mMOCkKFfS/JvJmvHG2VZ3r07c+TRNhpq4LC5CWucF7SoLJTlDrwkcBss/a2H
	/QwzeZnKpkEv2PKWqZoYvUFL+W
X-Received: by 2002:a05:6122:c89:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5be90771737mr579923e0c.1.1783350288338;
        Mon, 06 Jul 2026 08:04:48 -0700 (PDT)
X-Received: by 2002:a05:6122:c89:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5be90771737mr579889e0c.1.1783350287799;
        Mon, 06 Jul 2026 08:04:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c5e58bee3sm2046451fa.8.2026.07.06.08.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:04:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:04:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bc411 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=lS1fCJvthqzCmkgEd28A:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MyBTYWx0ZWRfX1fxI4SkNn7eQ
 0gUPnCY8LqE1/RSwBgrLmAy7rbaXvT9A7hCikq6MKYuzv1msMii73aiYtbPjQ2SkNcTdb5V6FLa
 4oJcisKW1Vn8u2n5q706saOWfqGgmumgFC3ygeosOtMhAex5tTT/cYeYZxgmdF21bMSUOSm6sZo
 5Xub1aFHmWduU9u3IMWIEXO4w0kFfjFseVkPZkVLJ6+SbGF1ED4cw99+JL6768U99X6JhC0rS6q
 FtIMKTjktOkr/KhHP0l3LDuokdn532qJWTWxerZnTFj+XGzPUAZG5CUxrEu0POiCMVx2cmuiOG+
 XRGrIPTmwy+9IGGTButzcbrGwEWKYrMuHit7DdK1NRwAPh8AeHHr4RhN2nE2zBFJa6btyWtC3ID
 js627ASUwOiOXH8C+R/UYjEW5yudbCQmboWKf3KPnUhzABdS952Ne1y9RToedT1r30aMrnGRpwv
 0oF44AaykLJwUm3lqGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MyBTYWx0ZWRfX/6hDoLrz7z9A
 KQ9Bd/f7blkvLxYTKbev1FXsnp+6JRYLuMBJ78edZFMFfybMvGUFppz7MJYT3bYAO0Dt2CeNOcO
 c128GiUX88JB1VgjYMShtKwzLKV6pxc=
X-Proofpoint-GUID: 8MDXYo6LhYVzT8ACuEn16BFPI1BT_2Rn
X-Proofpoint-ORIG-GUID: 8MDXYo6LhYVzT8ACuEn16BFPI1BT_2Rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080449_982855_DB65F08A 
X-CRM114-Status: GOOD (  20.34  )
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

On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> In order to associate the SID used by LPAC to it's own domain and
> context bank we need a separate node on the DTS.

Can we use iommu-map instead of adding a new device using the same
addresses? You provide zero explanations, but it seems like you are
trying to separate a part of the GPU into a separate device, but it's
unnecessary.

> 
> Add the code to look up that node on initialization.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

