Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC111CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=; b=tLWX//Kl3llq5PxcZaGZ8mKh2L
	MregZZhTixxXdQdeXuLkxMmbnXOrbKpvGJRaCKfCPjD21eWuBEetHOcbfb4cnHVv089+DO6btFeij
	im98ldBJDaYYtuuMQD9bK+xq1nseIOq9wiwL+5QbWm/9hk3CZF3hr0bpNan8XPz6dCkLx3X7IbfFg
	nYaJCexMNpEHw8SeWlTbMmKFW1JQfg7sJNDnx/99yuyA7kcURYOoq7Xlah0pfSuY/wxFDbgZI8nKI
	qqGb5s6fnQ5t2VJU5Tocc2/zkONOggBX2WzoR4tcLlm2KHCbzJa2p/+RVXUtjwteI3x5aZrN41gF3
	wvokspDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGiE-0000000Adur-0owT;
	Mon, 12 Oct 2026 14:09:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGiB-0000000Adu7-2i1D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:09:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Xdm2252917
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdrAE6CtWkM5g2ZOGMq0Ywa6
	INxDz9OrKN4VJ11fBwY=; b=Ckn2jM7Eo0qepYoAQcndFNeW2qyhGOPwe2Mt80W9
	ElX2mrrRhZErw4oASsxb1JsWQZsCTq95LZUB6q00UegX7Ant666BW9yPZzlaSw4f
	PhEhmRCzi62WwFouLsel3RuvzRIkJMB3boSSmZKUtaG/l2Ec4/KOFVVjuX4KzFiL
	eoDv26PvZMSc2N+4pgI9FO3Hxr2f/FKCN23q0JraCNZMvVYNFvWo9Z3C0RsbnPhC
	tXXYzdAiXPZKjONgWzxKUZFcwyjAt9Buz3p0JiABcZrn0eLRvm0OtSedFsP1nFFt
	uLQ4T+fWcVst5Lpu1qCDKK1jIvc5tY5ch+5PAPHjj+VygQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713bky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:09:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso810904085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814146; x=1792418946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=JwxdnzfW9AgPDyxrE4goMs75wCHh3RTm13r1YL+4M6OCQUgQ4I2MrggCbdD6hvh3fL
         p4/M+I4JS11skG9lZzB2lO+Di6Oy5AxH/i04dhlBwDnZCghzR2S6HlWllJmkkb7Iun4V
         3urn8eVsGT88krH34z97dS0UoB2E85uD8SuSejOxvQbDxF6BHxJlFTJfkiF3TJ/mmUtb
         bnvwKcvqZXbMqMFnNlbOsHDvZi3JHxlhybj9pJ0oubvxlry0GV7/TEKValILgF08vGls
         BvxHQ8BrNeQoNXTg/e34o8VEBnlJMQSmuTcHgL5vRGlETZsQ54ta0mG+ggbyyqwB7G4P
         9lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814146; x=1792418946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=W+NMpIxT0Dr5GfRTGp3C7EUorGN+0SIW5+5ZTToVA3Txe7Hba/dB7w4HQ3+pNC8/uo
         WTkXTogZ5ODUesofBGwnDgWtlMZO1UDsYXHVzysVSxbiPMqz6Tt1ehLz62UyijPLdTq3
         j6pj0RGmyogeTApdhXvenVn6oTYKoYAvfTsu0bzD2e0ObzQajtY1yM01HqrspyAWrkeR
         1wOtbMVsK+482XWNeSI7Jyka56c8luQX3n9ubRJT1Ky7v1Jbpwn9mqh4BvMUFPtIOL0k
         81fDh5e2TMqAOLd5E1H5ZLQoF/iZRHXAqA+zGNMjNx7SqMWUITUbBbcKEAS4dwA2ub6Z
         /n/w==
X-Forwarded-Encrypted: i=1; AKwUvBxR0YeUcr5FGRSjkHJ4uKkGOWNOAZ3Qnv67MClcA3xtnpmcW+R4oxX5POlcDYkEEfpxHsDVr8o/TraMi1UshC3L@lists.infradead.org
X-Gm-Message-State: AFq9FYKbNZlVOKQH1725D02/gcqYyGKw7Vc91piXYz4eIShHkfDZmx04
	KonIyKNq8RKVHjquwmtE/EfiPuttD3E4puEl64LgmaI/EszECc73Fn+eYVhQZ8zUQ+d5wPdpqFq
	4GPgPkhJsqBP0DCGaKGIoKl+a/RC2L23X+4ALwjttie6P0ZZrc9ZyjVWblHab23QJImCStgqHlF
	PCTA==
X-Gm-Gg: AYBFou0hCdsYtr044d74eDIqKhX6ym2MdK76ptEvDtvCl/GT/e36tBjKMwWZcUgGYGP
	JB0Ot25m2467+PtsgzHFPd1BftXRmX4I8eHztiA7INTz+w0O9g7Rdb4xHc5fCAnwbDw8b6bC73w
	xdlPUStTmdp8iQGdF5cHYYo9TNTbbexbH0Wy+skuJ9mUrV55jtY1DlzfsPremTAC3gZRlFQFsRO
	hDtbydpLI9X1UJlCRLBvsourNPH0FQjPcnv+gABkXofn3gqjbFBqEdX+LbDXlBGQEO/u46EjAyG
	hhMWzp4t1SGuGQcZiztIO3wYM40seJjrDQM1fZmLDfo8HxtGwT01ART3QSCVOGJC085mhnNeZIZ
	VucAeu/A3ywul+Oi4zGM/o2peqrrcXp0XzDJX9zI2ai05+ZpGJ1plry4iwhX1TK67l0UxicDh28
	sEVeLoejBDiNLQ
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568177585a.12.1791814145786;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568168385a.12.1791814145243;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddcd3fcbsm2883054e87.0.2026.10.12.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:09:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:09:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/20] drm/msm/dp: Flush VSC updates when leaving
 YUV420
Message-ID: <3itnyk5vvlj2piguntvera2ch5qn4mmzmqch3aevfmpdjvis44@7zujyc5sauea>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX5juGSHE2wvVb
 9oTxMdRgsEQcElmdShj4E27ZgGGhm7Vcs6S9hGVZezDCFBJ6pPhG5G75eC1DThueMX501UUb3w7
 LgwPXaYCul25ZFbyreQBenHaW5WEVKw=
X-Proofpoint-GUID: UIf6HUCY-FsF4M3heKwBwPVZyGD7ZwQK
X-Proofpoint-ORIG-GUID: UIf6HUCY-FsF4M3heKwBwPVZyGD7ZwQK
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accea02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ksxQWNrZAAAA:8
 a=Sq4eR0YASbV39jB7rD4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX7wZuLWMl7oKs
 b/vnHyF2Du7XIGtypRdfNBS+63kyOuUsG+1mRJjgM08tS+E1xD8e4lhzpCLMct76lm28EQGFaT1
 x16FhqbGDeiBzXqcNpyLeWEEicCFI7M+ixn8H46uTM0CS1DtYK1+82sKnP5GZwXMhBG6aIYJaXt
 VArtGdWmM63qvZ75b5xUb0oxRNyZixbYqHDjPn5FYNG5aFDuBfEMH4yX4f1s5bjo3XA43eNL83L
 vMDg19qCoBvH+YaMEfoYVA+RMaOmoQS45Seh+9gA4c4bPNKVE99LLmBR1Om7Zl3Yz0SQbCtdRyk
 kh7agS5S5mc9cQIv7sl3uf1Twi5syZeA6/IUKwkRBbRbBjdAyfNnjwhgkZojU2XQtwNGvgNEZ6z
 7yPNO7RBhfHj2sv3zCmKEDc3Fll0vokCN30yw9lZnyZU0iH8dM3HKcSOas3Bqv01ZZKO01YJU6+
 s/BuxIcJqhBmtlz+3MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_070907_800205_1AF6F2B6 
X-CRM114-Status: GOOD (  23.36  )
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

On Fri, Oct 09, 2026 at 11:16:07AM +0800, Xilin Wu wrote:
> Peripheral flush is currently requested only for the new YUV420 mode.
> Returning to RGB also changes SDP state and must remove the old VSC
> packet rather than leaving its enable bits set.
> 
> Track whether either stream needs VSC and request peripheral flush for
> both enabling and removing it. Explicitly disable VSC for RGB, and write
> the packet payload before enabling transmission. Retain the existing
> hardware-specific SDP update mechanism.

Missing Fixes tag.

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f9595ff5fd9..486348113b8a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -691,6 +691,8 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	else
>  		bpp = state->bpp;
>  
> +	msm_dp_panel->sdp_needs_flush = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ||
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode);

Does it need locking? Can we instead store if SDP is goign to be used in
the atomic state and then pass both old and new state here, letting the
bridge to determine if the SDP status is being changed on this modeset.

>  	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
>  
>  	/* populate wide_bus_support to different layers */

-- 
With best wishes
Dmitry

