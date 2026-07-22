Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431C1C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfBI63uQ2/HBYGxVHjRe87BTGBCvc/oFJXrDryfPiSo=; b=Yo939tqy6V45/uYJGtcqZ3pTli
	Zxiovyps9wXcXwEX4waffAnGidf5cJIi082/ln7OxHjCiRMVRgt+1JPtuCzEIESzQuhwEYlXq1mHF
	10pSvITi7337PXeSLtFbOrjTklGTgAvvVq7+RQmiJ//6lomRGWWYrb2L1cHQXzftxj+OjMeTG7oFX
	vKnfiWofZjVbYuva/6yJ1HPu2aUjhMT1Wo73/Iw9lhDvBgk0z6fXLyP7al/kwv8KTeTohICr93aAV
	kZX5PRArx4bvPr8Nwmmj1uI6R1wLgUv4Ig284dPxHgje0rJBHDXWe1p/FtYV1VN+ZOPgh7CAaeu0r
	Cnw5gB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQpn-0000000B0kq-2jkH;
	Wed, 22 Jul 2026 06:53:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQpk-0000000B0k7-2bOk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:53:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gS03473525
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DfBI63uQ2/HBYGxVHjRe87BT
	GBCvc/oFJXrDryfPiSo=; b=ItkIlSkM/YDanAdF/JRIbRP99ovJ0jVPKE8SXAMC
	YonLF+vx746kfgCnmsKfgdVqhU5W6KcAkZXh52py4Imv3jkhLhfNP5FlhIGMm4ur
	0lSjHnPkk9yEauDXm1krN18+XPUVFMyg50lcsAZSpb0e4VfbOYgALbToSFHoZzN0
	k6tDZ/LgBiPVTm4V/UuJrIE4es9z2RKoYM80TtaQqjbtS3tberV0KeLv+SHOogkH
	d8C2bLVkj5c+vOZhStMO8o6AYzxzYkVW0z6WTV6RQl/PCRfSj+Bolnmsm/jeXvD/
	ZIC+ekjmpFi7hLLYx+rpm6c23PfNW8B73Zyj7LpVNiUh+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftpfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 06:53:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso102976261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703215; x=1785308015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfBI63uQ2/HBYGxVHjRe87BTGBCvc/oFJXrDryfPiSo=;
        b=SgPKKH4omN1CnEQNHmZ0y4vcCj2P6fYIq10GRlqcaF7sjXsHsFdeG63ngKjGV1AvA2
         gw6cbyMPMz46PYoGPHgTSbpFvix0JR3g4DVPHiVNJVk8mWpv04o08GlcyuII01rbRcLr
         HdyWNSVBtfk0F/y6MN/1GwdIDs8KPFNviaP4x5MZ5YM6YHYrMyBU/YcfAggETXrJecNk
         Bx4IW3l9+pJD9AGURhRZRpgfv6xSxydnqPvOqDOInzfyaAVmQv5ybKJ7n0Sf6cT18p7f
         OGI6w7nnC5RW+7/j6Es+woIeLvdSV/Sppu6wbhL7drGJDkIjPzWUILZPLYDA1sIpytmi
         MLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703215; x=1785308015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfBI63uQ2/HBYGxVHjRe87BTGBCvc/oFJXrDryfPiSo=;
        b=HygFpisofxKJAVCjGSbG8Kj1YOKL0VsvpGpNoRd3tbLhNrwpknZ7YD79Xk+ri1I9YY
         wl7zgXBNlBQCTRjfd12flePNlWmN3e4G0r+pn26N+lOhwKr1aRv5HEtpicn4SpiNibM1
         qPhB2afgu1BYleIXboHSf4b9QerN2v9xyri67xKh/AX4d4RXjzFKaAbdiTpNkuQsIq0X
         hE9OC05jmUkrUK6z6hYVoKQOKHPfwbEjWYwx1Jkm2nN8a1AYxwcPPXHAHAzc09mPvOJH
         FyxMRTI2t7tGI/ElpHN2TGLoa5bD2+bmS/xThHhmlFblaI7lARMCYHcRiu+Bj4hJA3JR
         P51Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqq9h2pKRhZ3Zv7OheWfPxT3XfjZ+zsMvXdpYsFPWX6I/bRHfcNvrr6asuYiytVPVQy4qZBWmUPD2XcF0KTWnJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnscVDqUGEnZbrnonELwVFgAsEqP1p6x5ygkKMcogX0QnJpZi
	WNareukgNVvZq/gAutejv2PktRNDafluMV+/+BAdU28m7dl9QmlXu3X1WcME1EveYxkKPo92CTj
	OsAvPa4liTqnkb3fSW2a4HUe1TtI/9DlMCjq+095VxFxgB5pbHyfXtnVwXhpTwQ9DviQ+MFVbIE
	Gj5w==
X-Gm-Gg: AR+sD111H5YlzKTQrKYvRHKxekk7tU3nN/D8nis1RLKBeCnLx+jKgTG/tvTMYsQP9Da
	lqU3KDEJ/DJD89OqaD8WS/moFIZj7KGz7yev3oFQr3TNAwtNZWkztrL6bsfZLKZF8q2pmFS4b/y
	crTQ+eoj6T/GXNbmzttk0R2a18RoMumSK9YovxYGvLcLu10N84TYDTEhcW+SIlIwoUfh1JwXTjM
	povKU/6O0RGEsMX6fK/RnxRWnYeOezvIi7oYF9qzOOHAonolZBJJ+YhKhQEh2OgLN+TVUjkQNVT
	OPTaa3t/Ra9nDTlTz/uHdIPLyXFuzMrNXXtK+VwcOXJY5m89lE0mNm4ePCdz5N8Tk91nIII4Zmw
	2c+5WNB6BsHSupqZtIeoP6wE2/LeFu3iV4L3RVHaNZqdKZX+l3rKfEYTEbh9t3N6jK6uMxqBZzM
	5iBQ509k9awgZ3Ow==
X-Received: by 2002:ac8:5903:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-527a9ef2cc4mr27795601cf.44.1784703215105;
        Tue, 21 Jul 2026 23:53:35 -0700 (PDT)
X-Received: by 2002:ac8:5903:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-527a9ef2cc4mr27795141cf.44.1784703214499;
        Tue, 21 Jul 2026 23:53:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a7f6sm303545e87.18.2026.07.21.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:53:33 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:53:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Daniel Stone <daniels@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 06/39] drm/display: scdc-helper: Add helper to set
 SCDC version information
Message-ID: <4aznbqeel6jld6qaulbpj2jeelqyppftxnpgmxlqyg5byb5bli@6qd2lxjzhj4z>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-6-d79890d00b6a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-6-d79890d00b6a@collabora.com>
X-Proofpoint-GUID: fWvniNNm2xjkN09hXBzSuJlEURrN0UNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX6OCuGoxB5OPg
 cgi2gyJm5ZXq8Yu2roajI7KPADuCgMm6MJs6EiTT087ZnSAe3QXY/008t70Cgz0XbgPZnEdKWNp
 FI74vGplgUoQqVXI7d3y3xVFd5eYukjqXSxFalhHjpTX4wvQEhUHvmvk1gqHrKfgE26C7g8n3XQ
 g/1pLMcZvpMYcxK6dOoiploTjD2017bdmFEBcJf1AbpZrfLPJ2jZaCnicTcPWy0iKuluXGx3Xjo
 vW+5o26EmI3HN0j014q8SRm9HEWkG8Dp8gPlPsEq7EzmF/AZT5vbeY3PtS+o9xSXLZKj5WyCM8W
 EwwmQ1JQH2s8xKH1nSYZun3r/oEtaLpsOxcuad9HyJgb5e6JqgZMUemdoZlHc7m/CI6ppI/Gzjr
 xJXqgMBbo8zf2Pm1wpSlWNP0eScfDYEvcfBFULMCVLu5cuvaej0Jq/nDeMhZXjb31xnc4apZl5i
 2uiaGIYpnnUJHeTkbcw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6068f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oPwEgnVxf_mYLS787iAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: fWvniNNm2xjkN09hXBzSuJlEURrN0UNI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MSBTYWx0ZWRfX9HoJ4rve7+BG
 FY2v23e8OP6qf5cJgfZr/dIlZ5xYJcb+IuWOx9BdGK9b5vvxiWXqxzvBiE3KDp+scbELdTPdBnZ
 r3GSZ+VOYVGzcBouGvkdf78tIPIpnws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_235336_660049_20FCC396 
X-CRM114-Status: GOOD (  23.97  )
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

On Thu, Jul 02, 2026 at 05:46:19PM +0300, Cristian Ciocaltea wrote:
> The HDMI 2.x specs mandate that compliant Sink devices report their SCDC
> version in the Sink Version register, which reads as 1 on any
> SCDC-capable sink.
> 
> There is also a dedicated Source Version register.  Writing it is not
> compulsory, but the spec advises that compliant Source devices do so, in
> which case the value must be 1.
> 
> Add drm_scdc_set_source_version() to follow this recommendation.  The
> Sink Version register is read first, both to log the advertised SCDC
> version and to guard against non-conformant devices: a sink reporting
> version 0 is either not SCDC-version-aware or broken, so writing the
> source version gains nothing and risks upsetting such hardware.  In that
> case the write is skipped.
> 
> The source version is passed as a parameter rather than hardcoded, as
> future spec revisions may define additional rules for the allowable
> version values.  The written value is additionally clamped to the sink's
> reported version so the source never advertises a version the sink does
> not understand.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_scdc_helper.c | 46 ++++++++++++++++++++++++++++++-
>  include/drm/display/drm_scdc_helper.h     |  2 ++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

