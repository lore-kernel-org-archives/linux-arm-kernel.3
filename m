Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD8DC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=; b=zPg1Ik22SzQoxouXoA6klpEC4P
	cIJWIUSKdSKxFi2oBquXjbDXYh8eZiAgCwAzL5j5qhjQ0ezOabpafdOu6sZszCJ2dUbfkQQk0BA05
	ZjwNkmTYFVJ5+wh5x//ixjbKabzHCIEmWOBJr5zsXzpPG7BoQvUQ9MC6g0D60Q3DIROrhnh7GHl/T
	D+J1YvZNI3B7J/5SNjaDdCNhZ5P81ciu3mVx/mY1HcyLhjqXPuxWnZM7/LhJ2oBhCubd6naArFdRH
	wHFP2IRJVgnqdCwQ4AJPX4DUxENLML3tir10HrbmJzptr0tyVZ7qIpvs/xiXKLlVnHCJjjv9tsUzR
	bSODGI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIy-00000005cai-1g7l;
	Mon, 17 Aug 2026 08:02:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIv-00000005cYv-0LQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:02:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H716me162592
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=; b=gUv509HgWGlG+Cy5
	EE3RDEv0i9vuuJLaeB8aJ0tzpS9EjAqjMv1f11Yz9lx0tSWcVl+etNQzRDOoTVdC
	6AewY63wPCRhV9z1flQunFjlcHqDFAHeSuSarwETSe1Nw1XdvdGyo0Y/hwR6rVIm
	Zsi7XHeokjsYt+9ous1BsY44KEu/t/qdbu15C9vmJIRW7E90tu8qErSaS/ECR+tB
	Vb354AaMMaKw4O1fYxf79SeRhmMLEryUwFKxsTTH+437vd0CrTUr8yvLLVJz65UL
	Ap6+6FCmn3BUwAvncNCkyadR7GT3NYJu9tkcL7n4A44z3JT+umYVz4YEohrPNDz9
	Zmw7tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5y4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:02:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so36538421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953763; x=1787558563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=O4U3Ea71iA4s0parUE8eXH9IMngCSwhSsqb2b+9Yu9uWNl7ziqcsWUCdeHTykCUbgO
         23jsMTckD8Xs8gbQGSojwlgGqN7rl1mLHYKP2HjAbWOKxOWpfMYzIg5R+pkmEZCYCDgL
         U7otmAd33+yLEX2Qrgoy5NlfhwR8a1lhvh580zlKSpXVXD08ATPp3vx6KBXPn4OT8Stb
         qk1Cp7XQXbTjvMXGlLk7R3rdMGiypo2+TihK+TXtcGEXnq5wv/NtQmcgXpaX2g+i3kjn
         l9x6UvAL8p5X0I00BnU2ps1l1Gr7WFlVAYZv7kYUUdy35YurFb8lH+qsJkF3m6b4LY1Z
         xkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953763; x=1787558563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=lEdcOiqmX+6sy/LpGhD0zjrmaIYGg9isPWrrWiKMwHqQiQHrXaCK/jS3ru4Y+UfeUQ
         NOagAWsPIbruWFUriPdgC31Xjv8UW01ieKaJcXrba3GdzIbHXkOb7qdfrT60ztsva/95
         SZyYhUyt0XlltVbASmxFbV//cunXfTXYbOhWAETMVTf+qA6cu4q9UkSMqi2crxdP6sG4
         0zXAPSaa0OPswXSstXd8FkkJOW/5rqkOYz97xfQfhIQLiDj2zp1jsLHI5WPQEA6+TuB3
         yNI6CU8Or7380m7rSrFkL0F907izURHTbspsPXY9Ow9th04tO0SSR5ZMO4j9EGhQHGmB
         vr4A==
X-Forwarded-Encrypted: i=1; AHgh+RojB5vjdI5jAkFAtfM46e7somBLL1W7LDqYyHI1Q6aGcgYTWcq8FYm/JsFoIajxF8GgHd6/IVOsHLb8/P39enWP@lists.infradead.org
X-Gm-Message-State: AOJu0YxM1Wwrg4HJY/KgRb5WBESo5+Jw81OOE42yiiX2xTCxy/TFBZKt
	KD+DITkAPdwOG/kqhIICM32cbyD0zTGYVEd5tKuJJIE28dlxE7UzpvjbNfmMFbEWkilJXYJKK0S
	a4qDCpVhBC2L/A3CCnFCDaVnrG9C15ozfpRW0TCdEyrvfu0CPwRa7DOrIUDmS7Uf8Evl4FSWmxl
	+JWA==
X-Gm-Gg: AR+sD13TnTuX4aisW/8dH7JRVHUjgSjtLWk5qwo89ctinYR/9xTZxKCOPSEhwnDp9NB
	dm6sZxTLM+uwBEFVRBSI/Yt62c4M9m9WmpCIVtppRR2dJ6oG72kP4W8kjfWiJA3Gi1PJvXB7HQW
	qT/cUDxLHqCu2/E68ejlirecmDI3eOlqk6hSPtkWsal4g1cdesaUJybSKqjKhC21YMaqyxP17d8
	uEx+zwLNvIKXRQCUHM6IuH28qJdBKqltCRq6Z9kvQs0PfOsjuGM8G7OcooANpr4oxTLAZ4+O7EF
	WDwA0t3AkcInRMi6f6r4Wb75njNCZNy6jW3QZ1Nx+ajULXiFURrGC5f47TZhMgE9hXJE946fQy7
	Shr0xY0nV3v7/PCRGZI+LGGCm6NTwIahzwABW7JrWj4i7Cebc3pAtMfSEjqJjpiz+MA==
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231184431cf.33.1786953763286;
        Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231183591cf.33.1786953762519;
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db623aed9sm8394031cf.23.2026.08.17.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Message-ID: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:02:31 +0800
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5sYazToHQmU7
 R4GkUWqt73bwi06C2kuXmOmJN6PlQGz2NRjmTPRoHdELm5geX0LsikGiIpG0r+gh1Oy0TR3Y9Gm
 htiBMtHDaQmDWCfP+OuaI/d6TuRmurs=
X-Proofpoint-GUID: EawuaQp0rP4GwZgxUH6hz-PwOtolApwk
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82c023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3XZL1g37JtqLMPLRk5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5pkIhJT9wlnE
 wNBk3Dbl9CgSQgvamEfoIcwLjk30mISc+5gQ4v09rCuRA1/gD0HxTTd+iLzidZLIEMhcja6ThGG
 5hfnmPXc6QALbHLyBxqcD+unhhveHfxpjlgWbGvo0yXpd/Fthjd5Unud6fzANBxkKjdkm1qDqsY
 EGGkRjjyCnXiOFew+ZlN/VPMlW1Ni2i2cFjPfJ+DCcyLGmmeN4X/FOeYuMwqspGtLIeZltd9t+f
 6IhiG++lHCdEYcTSig+7s7JGSemqyhZeuOttd/IqxDqLdr48YPHGBqAGEcx28Ikuri9eAEXaQjb
 s3zB88ZzASgnkc36VsGwtaDERmxngxAL9p6aGny8aTQWYI1WOZr/cxaE8SpQyY1yF3wL/jSaN/m
 4iz4WwutLocTG9vYDsZFW59sN2eHbsQUVbBHVEgpuJAmS4LYrlx0iYb289Sr/ltpeuT+MRxfmaX
 JTqe+arVTDkdljczzmg==
X-Proofpoint-ORIG-GUID: EawuaQp0rP4GwZgxUH6hz-PwOtolApwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010245_237713_99634439 
X-CRM114-Status: GOOD (  35.84  )
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



On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
>> The bridge connector HPD handling path currently updates
>> connector->status for every hpd_notify() invocation.
>>
>> This does not work well for IRQ-only notifications where the event being
>> reported is carried by extra_status and no connector status transition is
>> associated with it.
>>
>> One example is DP MST. HPD IRQs are propagated through
>> drm_bridge_hpd_notify_*() so that bridge drivers can process the
>> notification. During MST operation, however, the SST connector attached
>> to the bridge connector is intentionally kept disconnected while the MST
>> topology manager handles all connector creation, removal and hotplug
>> processing.
>>
>> Updating connector->status for an IRQ-only MST notification may cause
>> the SST connector state to oscillate between connected and disconnected
>> depending on the notification path. These artificial state transitions
>> can later be detected by the polling logic and result in unnecessary
>> hotplug events being generated. Userspace then re-probes connector
>> status, potentially triggering the same sequence again.
> 
> Then the API might need to be adjusted.
> 
> Remember, we have two usecases, which we must be able to interpret
> correctly:
> - The driver gets separate HPD and IRQ_HPD events.
> - The driver gets HPD and IRQ_HPD at the same time.
> 
Ohh yes, here need to rework.
>>
>> Treat notifications with status == connector_status_unknown and a valid
>> extra_status as IRQ-only events. Forward the notification to bridge
>> drivers without modifying connector->status.
>>
>> This keeps IRQ delivery working while leaving connector state management
>> to the component that actually owns it, such as the DP MST topology
>> framework.
> 
> How is it handled by other drivers (i915, amd, nouveau)?
> 
i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
bridge chain -- their DP controllers are integrated into the SoC, and
HPD interrupts are handled directly in their own encoder code.

MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
via aux-hpd-bridge, so it has to go through the bridge chain, which
means this semantic needs to be extended to the bridge API.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 5edca47a025f..7334d6677604 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   	struct drm_connector *connector = &drm_bridge_connector->base;
>>   	struct drm_device *dev = connector->dev;
>>   
>> +	/*
>> +	 * IRQ-only notification: extra_status carries the event but
>> +	 * status is unknown — do not overwrite connector->status.
> 
> But it's not unknown at this point. The connector status is reported
> following the HPD status.
> 
You are right, in the SST case the bridge_connector status does follow
HPD / link status -- because the bridge_connector itself represents
that SST connector, so its status naturally is the link status.

The MST case has a key difference though: the SST connector must be
explicitly marked disconnected (to prevent the DRM framework from
enabling it), consistent with what i915, amdgpu and nouveau do. In
other words, once MST is enabled, the SST connector that the
bridge_connector represents no longer equates to the link status --
the real link is managed by the MST topology, and the SST connector
is just a placeholder at that point.

The issue is that IRQ_HPD still travels through the bridge_connector
chain and takes the old "update the SST connector's status -> emit
hotplug" path. Under MST that runs into two constraints -- and this
is exactly what this series is trying to address:

1. The SST connector represented by bridge_connector no longer stands
    for the link, so its status must not be overwritten by IRQ_HPD
    events.
2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
    bridge_connector -- the MST framework already manages hotplugs
    independently.

Using connector_status_unknown as a sentinel here does feel a bit odd;
let me think about whether there is a cleaner approach.
>> +	 */
>> +	if (status == connector_status_unknown &&
>> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
>> +		drm_bridge_connector_hpd_notify(connector,
>> +						connector->status,
>> +						extra_status, NULL);
>> +		return;
>> +	}
>> +
>>   	mutex_lock(&dev->mode_config.mutex);
>>   	connector->status = status;
>>   	mutex_unlock(&dev->mode_config.mutex);
>>
>> -- 
>> 2.43.0
>>
> 


