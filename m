Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4E4C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=; b=fh1u6y9Q+TJFFzlxgZ8BzYIahP
	f7hKp4SsrRpj07GNQEkqu9FfnzX5+Jigm/BK/LanjrmaFIgxsAww+vh14ge6O6YssHlTpm4BwhlBz
	AeEBMhNOdNyl+bUk9eXax+rlC8i79NiX3vp+mN4qlNm9u8imPJLZMj46a8pyANByLlIhhcVpAU6lM
	eaWwnPPoZ83B1Ce12/tx6Bkme602aOagrJuEykfdJpDp7FiD/vjj3QcX/IHyhobuVcSo+xjDITolG
	83lZvSnV5V8eij6E7ABXICpjkuwT4MPQbOg2CR4VyWWBV868jBeIzT/j4XR6skRckjIeWbZgBDsTQ
	EsY7Rw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJXh-0000000Cgh5-3I7r;
	Fri, 21 Aug 2026 07:19:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJXd-0000000CggA-35D6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:19:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TS412015304
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=; b=hCHstRNA18/xpbzW
	rH0Hyh5P+2cxZa0fKW3XqAeDoHr+qFAqfnecDBL8CI0ZZaxN4AmZbWFMzUV+sudJ
	m73mV+viSvAgN5Fj3KeE70JSFCKIMK/p9+JYsTGXrzcb52JTGN9qxiEvrisCEHqE
	ZxQ62/+C+OrVlvdYi8qx1T+Mt1fZ79l3Xd5VJhy+KO0x8lKZv4e1vKBpbnwnU835
	gI1D841Va1jsl43Hv26e+epQkA6ovbg3otXjKKJ5bnZIRey9L8Cbc34OmnDa2kig
	Y7V9abvfpGKBUNulmd9evGmTfsxCj8aTWgY40S3p8ldH7OOKfH/9DwQBIhGiEF9+
	f4rxpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhgfpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:19:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so986360a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787296791; x=1787901591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=GL1juuf85nMLTMTgS0gZfhbbXn3xZtDW4M66BD6F8df5UOWFMJbccigGzL9AuP9Ft0
         gj1KRuN1t47Tk5k6iEtwXNQCoSE8+CC2AqalBPymvcqz2NexTxGlDL/OKrCPxAjyKUVv
         8aYI9ySAuZZPW5tbe4nU5URhYPUG3rKsv1J8a49JhB7w1lqKWUEh5Y4zPiPo4kghUGBT
         xQAQOpg5cglZ6IS7bSOfQXCZF/KnoLYtZmptcG6CSfGBWyb7urdTmHWiXbaHvG2gyP00
         2skjqPQFyCGZQZbxlo2N3aBpH2CipvYNac6WfvVRxroS5kSHPTbG3X7ellLaAcH5wM/V
         ZOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296791; x=1787901591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=pNoCKJn2D8zdSqfsLDr0bfqQJ2jHq0ujSHcbRfLYOXETMtPaKVYGDNU/7fYavDvtUI
         9It/fOiiXRGZ7gOczYXilQw2rsVV2Ozj4fESTPOzUAovAnkJooByPjUNC85690w2eIbU
         zMldoLBVVyvPf8YRTQqciBgmsh/jSJxcE2TYhXC6uJ7f+0WDHjyv3ci83BPwDdLygZ9P
         CChsnY6rEtUhPXkczfuOzaT4aa/5kdH28Y9N+YiJVIi99p12W9pW5iFmV2rkW/ipKnqF
         AYVk6KIcWH6ijZzgDDvsT5vci0gPJv8Fq8Ynr55C7GWLATiTnnRwNNopoWChcr82uRJk
         I8Wg==
X-Forwarded-Encrypted: i=1; AHgh+Rojo50RKmAS6fZcer9VO8ibXR7E84exRYT6bJMnOnX6jjZr8D0YOR54Zzvdbu6PAUetkMPgkvfGkFta5ocd5Ptg@lists.infradead.org
X-Gm-Message-State: AOJu0YxXKzX9syaZwmRBJdzrAQ8eYLE4y0UM6HPxRx1Zo7Jqv2dadHVU
	qn1p79lsXZPtAYEeOcMF/qchseLjVqsUaHS+8UVpmEEh+0a99nkm+Dhg/D6WRQbA52u5okaNEIL
	kJBq0capLwWCc1TzTTtVK1V8yeFf6AzBt9tPYQ+xnuJn4FLIMg+7qyg0fgeMv0S8tEnEkjRIv4s
	eYrA==
X-Gm-Gg: AR+sD10wHyR0l+G/LLtySek8kUSW9IuXMH4TWUPSXtMyZB1DNcQr8Exwfe0QJwUENtk
	DSdCTQXUrTDibElGX0OByRUfZDhcYmQxRNJ+NGJxBjR6Woylb72rPPddS6gmBwQFcqkmHo9PGxz
	UGgLQS79K8oCrcYKUH1oE1C1KdZp1ZHDuphBiEb4/HMvGnwEIUfOP/Otzun6WWEPG17UQ66x6r8
	ZS84bp4/dwEL6GifKjboyho5DeHGah0vKCYQvt+plBjXLsPYh3uEWoNxyyX+/Swv5eaRN0PLYad
	J9HlrkT6JLw7M+pPzGU0UHWtx+9wX5k+/0L8kbtzE0sAfrPWKWEWk0MJE+R1PdbmM5wzWcQT3ch
	ZKrDkD0jGa92yT1O8B/xxX9jgxrg2Jugh5p/Sq90CKtGMfJICpEvi7pxk/0r9q4/NFthQ/8k=
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601541637.17.1787296791427;
        Fri, 21 Aug 2026 00:19:51 -0700 (PDT)
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601457637.17.1787296790940;
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm2507523a12.14.2026.08.21.00.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Message-ID: <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
 <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ue1k2TvbYliTTdh0jkmInjMB4MZIBVve
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfXzK/1fnxk5StU
 5PW79YU7TF6CSmKFTyrakDYyhygklovNeqvKE36mSsN51CbJt5zKd76i5KyUF7nc0CxKutvidjj
 d67x0LDhZ2mtgXDnjtEz++RhpNvoDXs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX1OKim5UzAXRh
 8UeAqQ7zzv2iZiXrpHEKLL4C6r3YPgtjGhZpj8/R53AZCx2Pxy3xp5OhymKu5rEiPaUmbU9m/hv
 2R0Yiv+cU8uhbeRVxOYsqXJMbJhB7PYoTQFTACTBLB+p0WB0x3+oIw2ArjZSe7ZbMv3lMgz70XB
 pCb5HiNGgfLS8k0XEoKmobr2r6BkgIDZ3mfKVfyknJuMBbnCH3PawD8CcNAESS6URD9vVVwfNtv
 XPJ/Wqz21ZBIdEBbEVk1zjDS3T/Iklf5f2r0T7ClXDkKbttFJyygBE5vo1ls7QeoO+O6lkd+l7h
 tA/D9mAY42dhMT/pdXSKubbQMqKqWoD3Qiq8fyCMCYDjvZUJC/d0CS3UfdlRjp017y2EukWsI8+
 DIb1CqfLbnepXGG7JBi2EirRGRVszOR+uhdDFR1QvJSHBUmbTBJNnC2b5fx2HAyVcXxvWQhIXH+
 zXqAFooHi0FmTigcCiA==
X-Proofpoint-GUID: ue1k2TvbYliTTdh0jkmInjMB4MZIBVve
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a87fc18 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=OBMPMDKBgAqnNWYQCGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001953_773882_1D5E5BFD 
X-CRM114-Status: GOOD (  44.73  )
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



On 8/18/2026 11:18 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 04:02:31PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
>>>> The bridge connector HPD handling path currently updates
>>>> connector->status for every hpd_notify() invocation.
>>>>
>>>> This does not work well for IRQ-only notifications where the event being
>>>> reported is carried by extra_status and no connector status transition is
>>>> associated with it.
>>>>
>>>> One example is DP MST. HPD IRQs are propagated through
>>>> drm_bridge_hpd_notify_*() so that bridge drivers can process the
>>>> notification. During MST operation, however, the SST connector attached
>>>> to the bridge connector is intentionally kept disconnected while the MST
>>>> topology manager handles all connector creation, removal and hotplug
>>>> processing.
>>>>
>>>> Updating connector->status for an IRQ-only MST notification may cause
>>>> the SST connector state to oscillate between connected and disconnected
>>>> depending on the notification path. These artificial state transitions
>>>> can later be detected by the polling logic and result in unnecessary
>>>> hotplug events being generated. Userspace then re-probes connector
>>>> status, potentially triggering the same sequence again.
>>>
>>> Then the API might need to be adjusted.
>>>
>>> Remember, we have two usecases, which we must be able to interpret
>>> correctly:
>>> - The driver gets separate HPD and IRQ_HPD events.
>>> - The driver gets HPD and IRQ_HPD at the same time.
>>>
>> Ohh yes, here need to rework.
>>>>
>>>> Treat notifications with status == connector_status_unknown and a valid
>>>> extra_status as IRQ-only events. Forward the notification to bridge
>>>> drivers without modifying connector->status.
>>>>
>>>> This keeps IRQ delivery working while leaving connector state management
>>>> to the component that actually owns it, such as the DP MST topology
>>>> framework.
>>>
>>> How is it handled by other drivers (i915, amd, nouveau)?
>>>
>> i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
>> bridge chain -- their DP controllers are integrated into the SoC, and
>> HPD interrupts are handled directly in their own encoder code.
>>
>> MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
>> via aux-hpd-bridge, so it has to go through the bridge chain, which
>> means this semantic needs to be extended to the bridge API.
> 
> Still, when do those drivers send the HPD event in case of IRQ_HPD? Or
> is it that in their case IRQ_HPD just triggers inner logic to reread the
> status registers and then the driver sends the HPD if there is any
> actual change?
> 
So my understanding is that,IRQ_HPD is primarily used to trigger 
internal status revalidation. A hotplug event is only generated if that 
processing concludes that there has been an actual connector or topology 
state change.
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> index 5edca47a025f..7334d6677604 100644
>>>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>>>    	struct drm_connector *connector = &drm_bridge_connector->base;
>>>>    	struct drm_device *dev = connector->dev;
>>>> +	/*
>>>> +	 * IRQ-only notification: extra_status carries the event but
>>>> +	 * status is unknown — do not overwrite connector->status.
>>>
>>> But it's not unknown at this point. The connector status is reported
>>> following the HPD status.
>>>
>> You are right, in the SST case the bridge_connector status does follow
>> HPD / link status -- because the bridge_connector itself represents
>> that SST connector, so its status naturally is the link status.
>>
>> The MST case has a key difference though: the SST connector must be
>> explicitly marked disconnected (to prevent the DRM framework from
>> enabling it), consistent with what i915, amdgpu and nouveau do. In
>> other words, once MST is enabled, the SST connector that the
>> bridge_connector represents no longer equates to the link status --
>> the real link is managed by the MST topology, and the SST connector
>> is just a placeholder at that point.
> 
> This is fine.
> 
>>
>> The issue is that IRQ_HPD still travels through the bridge_connector
>> chain and takes the old "update the SST connector's status -> emit
>> hotplug" path. Under MST that runs into two constraints -- and this
>> is exactly what this series is trying to address:
>>
>> 1. The SST connector represented by bridge_connector no longer stands
>>     for the link, so its status must not be overwritten by IRQ_HPD
>>     events.
>> 2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
>>     bridge_connector -- the MST framework already manages hotplugs
>>     independently.
>>
>> Using connector_status_unknown as a sentinel here does feel a bit odd;
>> let me think about whether there is a cleaner approach.
> 
> The status here must represent the status reported by the corresponding
> layer: be it DP ALtMode, the dp-connector driver handling the HPD GPIO
> or the DP driver itself handling the HPD pin via the state machine.
> 
Got it.
> Is it still an issue if the bridge's hpd_notify() callback determines
> that we should not be reporting the event and drops connector->status to
> 'disconnected' again? Why is it an issue? Should we instead filter the
yes, it still an issue if each irq . The SST connector  should not be 
reported as connected, even momentarily. When the connector status is 
changed from connected back to disconnected, this state transition is 
treated as a hotplug event and trigger hotplug, introducing unnecessary 
userspace polling and re-probing.
> HPD events in the drm_sysfs_connector_hotplug_event(), making sure that
> we don't send duplicate disconnected events?
> 
I think driver should confirm it really send a hotplug when we call 
drm_sysfs_connector_hotplug_event()
> What is the expected behaviour of drm_client's?
> 
- Genuine connect/disconnect: the client is woken up, re-probes and 
follows the new state.
- IRQ_HPD with no actual change: the client must not be woken up at all, 
otherwise every short pulse triggers a full re-probe of all connectors.
- IRQ_HPD where the driver does conclude that something changed: the 
driver escalates it explicitly into a real status notification.
- The SST connector while MST is active: permanently 'disconnected', and 
the client must never select it. The real outputs are the MST port 
connectors created by the topology manager, which get their own hotplug 
events from it.
>>>> +	 */
>>>> +	if (status == connector_status_unknown &&
>>>> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
>>>> +		drm_bridge_connector_hpd_notify(connector,
>>>> +						connector->status,
>>>> +						extra_status, NULL);
>>>> +		return;
>>>> +	}
>>>> +
>>>>    	mutex_lock(&dev->mode_config.mutex);
>>>>    	connector->status = status;
>>>>    	mutex_unlock(&dev->mode_config.mutex);
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


