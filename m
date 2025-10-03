Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB09CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFJqoBAr+PiZp2WktZc8yF0KtDOJu11/7QZ9DYz4Q4c=; b=IhRO6TrJLB7Z7yuqCB7nhOhBBh
	6awuBIm16aslJH4ahDRxzT31QZRNnBAx0PBdTmMZi6TCE35F2MD1cR2zxZndv88BrJHYfRjjlngDh
	6afsy5YX+zUqwpytMwdmP6A08PbkhrtBQ0bPb1CMwlYR3i/IQ0Fgeq2gphxAAnaa9fXz+awrDYiYM
	7WqsO40hXkuQ14ZSzR6iyBb4bI+42ns6bwhyY4IVncqPuPeGmyJyaRvUvY/MwAEUVtYtDtHdD6G9+
	v6QTkaEd0zoLBzrFEhoyDdhKuzvSZ/kBfxnVRSo8zerN3APyt0Tjo1eOVKE24YTAAtU2aImZh7Vag
	nTssJb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hv4-0000000CezZ-0pZf;
	Fri, 03 Oct 2025 15:42:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hv1-0000000Ceyq-3INH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:42:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BFawU012276
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Oct 2025 15:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PFJqoBAr+PiZp2WktZc8yF0KtDOJu11/7QZ9DYz4Q4c=; b=KHcuaJ8q50yal7L2
	HUEr1timFjDv2zhX44RHn1HDjLmydEnWi5ygiJscJHYjiqM4ACnXgN9/SwQWY+CM
	PCiayZau2F+ST7KDQn1PP3tdflHcZv+yLwXSClTPNubaih77igQdBVv61PaLvKX+
	jWFRX6OYbGr85vV4nKI+/GgGvl04jWDPbAV3ZCP8xxzjYUMu6Xzf6VQGJmq1jmQy
	/UWtHvLuNSWBfVIMa/Pbn0BSfm1AdpKHLCNgAa+5+U2bgiJVNDEQPr3l6KePfZoH
	jzjtCyHISdZuJAifEviTCkHViKUguzQ0mGhxgRw5Osg0+nybOoJ0ASWHcGw9zCRN
	vIP0zQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u3dg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 15:42:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dfc05dec2fso86931591cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506121; x=1760110921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFJqoBAr+PiZp2WktZc8yF0KtDOJu11/7QZ9DYz4Q4c=;
        b=f1lfCBsGaQeilyFBHlCz652lpXjuUbRzUJC4/2p+0s8rh6K/6btUr/c0ip5+hU6ehE
         X22OrI55BIKf+JyzttFqivv0wXbeF69PWAmrKCmOP9M6Ybo/91qDOb4sy7HhVXLOHdEB
         bVidKK9cqSGgnVV3c9z9ZzYPgcx4F4cKQCZ7UgvQiOYwH/ufS/sLnTIXRLjc4EyQlxKo
         i4LCP1avaTzOQ/sdKeVSPsGSofN8Zpek6uJxbCfjS16p3+9bmUTmXbsfnmbQqgcYsAFF
         i6MvV7fYkPeemXBsDAEOl+EYgRP/YG+UFVl5vh4XALQKnTgmvkK82AROmtTy7RSogNt7
         cNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnntqWgPtVFL54aujlWbwQkoOU7wiqjGAgctw/ZQr5nZloKw62VmQwjM5XRXwcWgrIlH3yyuFYvJU/EBfvn1wX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd91biR+QmS6VfF3Xc/ecyq/SCSZVFL7mpmLYQfqKGujUpK8I+
	4JwIe9C2MbrJu9nzGRvUegEvrA3W4SNV7+hJLdus1OixBotJcqQ+NA1Qo4vi5Ch9+95g22lvPbY
	2qNLgoov+EgIYedlhhfTOC+dZqvE/MPiaNw0Z8urarjP7R9gVPxWc6L0r1hcK0NJLXiYeAnZDHZ
	Z1og==
X-Gm-Gg: ASbGncuSxDbkvweaKKIzWJms8F6vni60dpHSHH2o/s+AGaedi9LbFd3QgY6ophJZyoR
	PDnIuVt3YZArYIXcKqPLFHDPgZi9SRDIDGdJTsPHO7d8+MIeP9kaR/MbGIlTkZ4AWuO9gc/jOCV
	WO22uGakM3hws1pfTUufDnG6RkrSQpldQ2Zy5CeX3UjuT0kiWYbwAVmQMvdISa/bWod7ITkUcw1
	vfnoLSCP0iKpqZxpqBtAVM9CX7JYGWZU2mZhU5HrQ9u/pf5ACiw3QnDs6iD8o1H6gU//QTNAXO4
	DNGCrZcQ5yl+vB1kDC3WnAgBJp4bRqCsc+Y7ny1Xo/1yexKNlddPzo+og3EWx0xpt9qCb6sFD4P
	91ebCZF4N+gEb7LbZePSLUxGtgKHvFlF+
X-Received: by 2002:a05:622a:4886:b0:4e4:d480:ef66 with SMTP id d75a77b69052e-4e576aa6986mr49772611cf.34.1759506120489;
        Fri, 03 Oct 2025 08:42:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/2xpbVmnRYpct93vxxe7SAvfIoNQ8eMa9PfzBd2OW2H+SLCeGQPScFY+dLRkonEp/LIgapw==
X-Received: by 2002:a05:622a:4886:b0:4e4:d480:ef66 with SMTP id d75a77b69052e-4e576aa6986mr49771931cf.34.1759506119677;
        Fri, 03 Oct 2025 08:41:59 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm1899180e87.103.2025.10.03.08.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 08:41:58 -0700 (PDT)
Message-ID: <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 18:41:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes as
 unsupported
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251003-primitive-sepia-griffin-cfca55@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX4xEbngT/5K1s
 jps4jUagExkq8KaF5C9bfs/r5C463BkxtsxUW+zI6NOetUWoPQpOvxqqL60BsP/6SZzsw2GpNQE
 gA8BIZKOpMOWV9ZjpTNVJxw8jC9FL5Z7dxVvB4fxsq4DsNs10lE5EkvKcUiaNTRu2enFCB/kADt
 t3Xqcy0tKiB/UcNMNmCMe/Dm+WKmD+NbE78PYGl4+ThYpE/p2WqW62ES7t5twHUwNtj6d3S+mAp
 BTtI0lCRpwoDLpReuUJCCcz/MrDc73v4DkQ4SeJ1cVRbIcK5ZYM18BLuc2oOEejmGJz1JndfDup
 7xDLFqg4brQkzlsvTwz07K83fEYq9VOOKga5xYTFKruXh2rUNZVq1WCniUr1ojhZrjRbtJiiyKx
 P1xqzTz/bRMnfwQS/k0aenUENHRHPQ==
X-Proofpoint-GUID: mdh_hQ5g0Tf4Dt0JpTcv-bNzgyxsNPi5
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dfeec9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=GXubj23QK-cXaLjP5W8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mdh_hQ5g0Tf4Dt0JpTcv-bNzgyxsNPi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_084203_935670_F10792F4 
X-CRM114-Status: GOOD (  27.44  )
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

On 03/10/2025 17:23, Maxime Ripard wrote:
> On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
>>>> As we will be getting more and more features, some of the InfoFrames
>>>> or data packets will be 'good to have, but not required'.
>>>
>>> And drivers would be free to ignore those.
>>>
>>>>> So, no, sorry. That's still a no for me. Please stop sending that patch
>>>>
>>>> Oops :-)
>>>>
>>>>> unless we have a discussion about it and you convince me that it's
>>>>> actually something that we'd need.
>>>>
>>>> My main concern is that the drivers should not opt-out of the features.
>>>> E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
>>>> (yes, stupid examples), it should not be required to go through all the
>>>> drivers, making sure that they disable those. Instead the DRM framework
>>>> should be able to make decisions like:
>>>>
>>>> - The driver supports SPD and the VSDB defines SPD, enable this
>>>>    InfoFrame (BTW, this needs to be done anyway, we should not be sending
>>>>    SPD if it's not defined in VSDB, if I read it correctly).
>>>>
>>>> - The driver hints that the pixel data has only 10 meaninful bits of
>>>>    data per component (e.g. out of 12 for DeepColor 36), the Sink has
>>>>    HF-VSDB, send HF-VSIF.
>>>>
>>>> - The driver has enabled 3D stereo mode, but it doesn't declare support
>>>>    for HF-VSIF. Send only H14b-VSIF.
>>>>
>>>> Similarly (no, I don't have these on my TODO list, these are just
>>>> examples):
>>>> - The driver defines support for NTSC VBI, register a VBI device.
>>>>
>>>> - The driver defines support for ISRC packets, register ISRC-related
>>>>    properties.
>>>>
>>>> - The driver defines support for MPEG Source InfoFrame, provide a way
>>>>    for media players to report frame type and bit rate.
>>>>
>>>> - The driver provides limited support for Extended HDR DM InfoFrames,
>>>>    select the correct frame type according to driver capabilities.
>>>>
>>>> Without the 'supported' information we should change atomic_check()
>>>> functions to set infoframe->set to false for all unsupported InfoFrames
>>>> _and_ go through all the drivers again each time we add support for a
>>>> feature (e.g. after adding HF-VSIF support).
>>>
>>>  From what you described here, I think we share a similar goal and have
>>> somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
>>> we just disagree on the trade-offs and ideal solution :)
>>>
>>> I agree that we need to sanity check the drivers, and I don't want to go
>>> back to the situation we had before where drivers could just ignore
>>> infoframes and take the easy way out.
>>>
>>> It should be hard, and easy to catch during review.
>>>
>>> I don't think bitflag are a solution because, to me, it kind of fails
>>> both.
>>>
>>> What if, just like the debugfs discussion, we split write_infoframe into
>>> write_avi_infoframe (mandatory), write_spd_infoframe (optional),
>>> write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
>>> write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
>>>
>>> How does that sound?
>>
>> I'd say, I really like the single function to be called for writing the
>> infoframes. It makes it much harder for drivers to misbehave or to skip
>> something.
> 
>  From a driver PoV, I believe we should still have that single function
> indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> job to fan out and call the multiple callbacks, not the drivers.

I like this idea, however it stops at the drm_bridge_connector 
abstraction. The only way to handle this I can foresee is to make 
individual bridges provide struct drm_connector_hdmi_funcs 
implementation (which I'm fine with) and store void *data or struct 
drm_bridge *hdmi_bridge somewhere inside struct drm_connector_hdmi in 
order to let bridge drivers find their data.

-- 
With best wishes
Dmitry

