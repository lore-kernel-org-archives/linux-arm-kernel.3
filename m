Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC997C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wc7wbesunn622E6lhLM0ZKBYdN3sWZP6DO3RHiTM7ok=; b=1j2Jr3cY+TGDf5OwpgCqbA35XB
	EjUvTY1nTfJ0gV8XnBt1JRwK3UHACsIk2NV0Vb7U/vgK+dryzeuN6Lpj+EPZhSlS90V0VUAcS6+/o
	YWoNOQdu70JfqqFejp4ya2US95d3GsctfjofXcgtJwOYUKk1HfD25bq5QzoRnp2Ct640Lrg7rj4tc
	ET9B98NobBccHsRjmxf9ZWKh4+BbmP6WnTli6wxD5FbkTLjCtVoPbFmPhMF5RaGOlVrUuONaWlnYK
	GQi44hvWlmwjOY0+tHufA0bHcrNeEbZO0ghvulv6IkHbxsjO+O1MzXf41n+Mjm6LLwuXa7OUlilRp
	yQ4m3cAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSkp-0000000AxTt-0XPR;
	Sat, 26 Jul 2025 00:27:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSZQ-0000000AwYP-32ni
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:15:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PKpQFV000924
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wc7wbesunn622E6lhLM0ZKBY
	dN3sWZP6DO3RHiTM7ok=; b=ShqQ6KY+EvXQdv+pJtp207j/oBCI6PI91JG+xF4K
	ENbUXrQUsRqAImbFnEwjKPynhDig8hIXtaqX0Dsu9OWjF0Qg8waVyefba1Uje4Di
	VN55T/vSLEfn6JkUM3LcMG9BlQuIpotnjVBTiaKe86e5Q8JAJ2zxwZ5n1yuHfyvS
	pUSrAnAYTobW88AWgrAkeh9zycMsi7Nm6W25wPprgLQ15uHBXVGnKA3o47zFrcCf
	Bq+RKgMEz2qaN9SJZZaLxrbGM2H1xEoiGX+NrqlwMUD8WafEgrklNZiUR1fGknOh
	PpGRPXoSvX8BqZ6VO3oOc9xnZPO3oI4l8Wh8vlVFJFTmZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w53bq3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:15:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb50d92061so41205076d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 17:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488922; x=1754093722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc7wbesunn622E6lhLM0ZKBYdN3sWZP6DO3RHiTM7ok=;
        b=wH3vAnCCJyWOtbNGzCQmmQT26nKFcB6HimuY0/6Zl2czrifYts35Fwyl1iWpTPB4K5
         TpCz8V8CD9crxz3MIs8eBvodGw1WykyFjUCb9mtCCi7lmASRivdSAaa54B4j3Z1TO42s
         I0FzQf9oC+cvsJUOy8PhVQnoS+QYaUJA1pnlYusOVYEUyzYLXO2BhzrMN9ebPfSmwqO3
         xZA6s8R8+rJgXqltmwM35ulT19hWGpp4flqf3VYK6LCLMEiiUVmroujULIpQbd/1DTum
         WffT2YxVRjIQb6oOGV7SyK7cf45eoPzp4TRzxvJv4C8wHzJn8y3EbNJ5A4D6fqp+AFdG
         TM4A==
X-Forwarded-Encrypted: i=1; AJvYcCXXHc0YhjDjTDFzYHooqbs04Hq2etqNZ87lXVpypZcyZLE331ul3Z9m7bVO3ou2yMtieh/bogIomueVqvSE1kQi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+CLx2Aksm4huwDamhfRjgxsUMfYULy+sf20WqKao0D3Vwefd2
	me+9HQ18xV+iZI9UEJ/KUrB1LjFR8B75kyYbXxusmwrmAl+XzSlxnoyMScvfOSCHY8Z8L/8Y1lN
	wutL5lRtrkwWLkeQkCFv2kqZ7JxIMIoQtn20CActkbUDZkYFur/Lf6KhEUySnHtQ70ATQfNUp13
	89zC0xYijrGQ==
X-Gm-Gg: ASbGncsNQ5sv0IJGwfz4JZfTsFVQqntW1zf0u5LGStn1DUd1c8vYzvi+s4aGOnn0g7O
	k+z9723u4WZ8ABnehKW06YSWXn2krll3sc8MG6Nd4UsTjwpRi83DTjdJPCaAQyuTyjdPDGOG69V
	whPBiJBRAaybly05zy0nVoAz1j6UiCOIRcAZh+KDjXL84eda76G5W4La6lfF3LbQb8niiB0C2YE
	Zu9eRR2+AUhhurcFx5C/m9zoq6I3bijDFnoqXmXC0Yx2dCf5+ufZ404IfU9kCHkFM8pKjYs61ap
	FY1Biq1QuXK7Ux2Tb7/4rU+SKdxC2C0JO0YynO1/AqNGmiACR88TxfC0ME4znoW82X8qyo3gsn9
	nq5Ev9FT9REV9eW+x8JmS/Ke09POMngOQP4NpVkPvUiV8LPwiNHOZ
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id 6a1803df08f44-7072053c3b5mr42704296d6.15.1753488922014;
        Fri, 25 Jul 2025 17:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxKX4spzgAgy045riATOyKNu99U7axrHMs7Vy4UMZ91CFAU7dGAREfsaxr4wy+fd4nCMcT2A==
X-Received: by 2002:a05:6214:2a88:b0:6fa:cc39:68 with SMTP id 6a1803df08f44-7072053c3b5mr42704086d6.15.1753488921541;
        Fri, 25 Jul 2025 17:15:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f427c501sm2101441fa.77.2025.07.25.17.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:15:19 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
Message-ID: <kmgosc2oboburyxrk6drvfghqg3eo3z7pbeywlui523aoqyuqv@uyog5cv2ijq3>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-5-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=68841e1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Ui6KuL_mdHivunMvz7MA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX//RPELiW8pzc
 QZgrvNI18qdqWpS8HvcLCnJm3KS/fPVNGX6/bXdiK0oDcNUp9KdDg5l19U0qnKusiWOnC92MxmG
 6Tz8bLN/VJf1qyNRnH09NQZfUir0aJ4QJr/KQXedILP28QOC2NKub1o3pB5qtSIq0nPgtdi1x8n
 /1qHaHqvnM6kuNCV0gVOEn7OaXY8SGuxsxQbUnSQGjrmHzCVWw1p41MKuTAc5AgurDFUZLdVJvZ
 w7unS4T3dSNnqPFcsAYxJR3pGDzdWlLC/ftpx9pOE2DrdN4q9e+vBv1MXi2fe79Fa+1S9bDt8E2
 ldrn9RA9LMM+bq4DmIE5UQPlbJmKnEXWoWaH1rjWpQwKKBnQRvGH7taY0puuZmZ35d7lB5zZzzO
 LpXFHPbP+B3yXo7m82/6IeHXYRHKNA1NuPJqEEmw2L3mmd8l3fU5qzYdA5WnkGEImSg5F3JA
X-Proofpoint-GUID: 5aSECRtjq87D0KYmAdxkNBQz8oHus3fZ
X-Proofpoint-ORIG-GUID: 5aSECRtjq87D0KYmAdxkNBQz8oHus3fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_171524_880250_9D899BAB 
X-CRM114-Status: GOOD (  15.54  )
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

On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
> In order to move the parnel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *bridge to platform
> data struct analogix_dp_plat_data.
> 
> The movemenet makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

