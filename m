Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=; b=402sSA3rzSM6luGNXVapowYn5E
	zPYiw13aUvvtsnNTb7J7nKSgf3YPEWZm6MZBtPj0Cmt88AVTD5zbo3QDY3hEj3+3qZ4QPcs433WRv
	US67hhyufBtcI1G/2XWdWY5LuORqVJwu4vefumRBDG4lJ63l+nEAfM7DSkujwcEjlMyYklpXBSIpZ
	NWw5l6YWt9xQGYUPGA1S2QLjqBZAJvaQIlBSYuueeNf7/cFr69o5qUJpdq6ezdQbPNDIY/IOkpPUL
	Bk3U0/t6Jg0B7SEWkcuZiY6HC6/mlJCSz2l0LWjmkZlXGv6lsBxfqNgO87r3sMymPqV5q2ihLRuxx
	rwDDqzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJYc-0000000Cgpn-1paX;
	Fri, 21 Aug 2026 07:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJYa-0000000Cgp4-28BE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:20:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TkiV1796426
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=; b=cVEICEyT5E6nAFNG
	2Se+uBa/wtqan+H2cfzDMIjfK/vHT20R4YCL7+6CmHUk/xTgmLdIEcbsWA+fZpvj
	H9hmGhLFwPdMSB6dwQIHtYbPn55bNV4pHFpMcQ79UuXwjor6DwP8UF6ojhZBXS6x
	nArFj66KhIREoTlJ8PYKiPJrUzRaM3GAHo3AJngR0U7G3unrKjiUaS4lS10BY/8j
	1Es2j3Zra1sskBdl5A5+C0Z7nRT+hrpygT29ulNtRlah95iKzEgLM0M3iW06WGlP
	IaIinyWQUjPApye+jlGeBb28spz6yqZrChTZZN8MsM4IM1lDG5Wj10OTYlVnzNSW
	r+Ef5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf0cte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:20:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1151988a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787296850; x=1787901650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=;
        b=dWI4BA3RsbzmiW4mzZajE/trqCr4NkbgMjg57+ycf2rscDhSajkD/W4cAxr2eOqjwJ
         B354VAJYpca+CDSn/C3w40kEj6AyGDFLroiMUc+FJJ1xjL0CC1R3LC5RtC0ANQm/GN1J
         nNhlS/uU7PeamBDPmn6mW0luByd/0SKucuGVIMcaXzDbYvtDtZ5MGvkt6rgAp87QY5+d
         dr4P9NJ7Ve+bOA1PGcqx/pe+NvWnPywhWt9GhBbINB+JHF2ItSexrPyNe0TuLLRDqiWG
         2VN7w7ru5EY5ZiJaF3llVAMV9YbsQExTPtfAcu2rM+ohVkwG6eJDbDwon7JBtIAa8ATY
         agkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296850; x=1787901650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=;
        b=WXSGPYmUmoiN4HpZyDQlWA3SBuiUi5/RCDQazGHjgm1PChPnQaZ3TqOZ/Vv6L8YFGM
         PQo+tCSNw84juUvDKhfPEG+x/pbd93/4fmrC22bxUWoA0j97CuwNkwGITbyTpFXAXPqs
         ofZ0vWNyqSam5UJS4UoMWkkPQnBREAuriAroUDp5xREpw3GeOji6kkq5lxcB95XJ7YgB
         8DR2iUdNyCY6f0/mFlKCDAWq/t4zZ5s0Pjo+Q4ygJApHwivHjfPUBIbjkW+8W9JrR8wj
         jN3969ZHu+ND3pnNhYPKJrOvcaKQ601BBFtvsN/39ZkIpQ1x+VDo2ffKsHwm/JTaYKkt
         cbVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoW7zJiOKFbDD654Afh4x/AKJ8WAt9yUifdDnQz5TXToz+rEM+24XRGLGLx9TM9Ft6N8b7QEgdidnTftmJBNayp@lists.infradead.org
X-Gm-Message-State: AFuF++m3w+8dPer4ktgzUjhUothy64Kc5/2dDdHb6+ipy3WII858FjYN
	DIo1sfOP+ElOLmKbBPkBDuoQJjt32SD7WFhQEKcOiac512fruHZyOPkPuAzudsGrpt7S1rx9g6y
	ni8NcAdXsxa/v7V0knYa0+8VSF7XVOXSvAV8Z/JexKvDU7yZ8W+lgk+qqRnCmRCRtCgfPTa8A6r
	/ISw==
X-Gm-Gg: AR+sD10bH6Hb9o/+GpvHG8N9i5AQpiFMnECPl9N5LlSw9pgrdDmNi6Vgrr3d9JdDhB7
	smT6585zQEn5n+qXjKRBsFAG0EptbdAt6GjC+XwxApHD6UKpGVc2aKyaBw24iuoEp5wXf7YjtfP
	ehf4muZoDXBjVcwFPDaGKsqbtbkUTuEDzNEb9J4crzDJhRG6pv8EuaypCZfjbd2s9L2fdqhLkBT
	kS3OWO2Olj0zx/I7tUdLJbVE30cy84C2OHk69Qfa7PvmFdmSutFf6opBQk9rRBjsxNHlUQUyyc2
	wmz98zRxH5TxEXffntCR1CBaWHX1FkR5AmWNAb7Ed3OB4Y59h7CWXxobCDOuD2gOEC9+4BW2Z71
	gTZw7rx2Gg5087FRUuU+fMQ1Bfqof31piicGrx5LQtYITZEZACiaN0lRj56/caT78pauS9PE=
X-Received: by 2002:a17:90b:2ccb:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395c35ba5aemr8334012a91.10.1787296850319;
        Fri, 21 Aug 2026 00:20:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395c35ba5aemr8333915a91.10.1787296849773;
        Fri, 21 Aug 2026 00:20:49 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c46b88e9sm1995751a91.7.2026.08.21.00.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:20:49 -0700 (PDT)
Message-ID: <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:20:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
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
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a87fc53 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h0lqEGe5wbmRA1m2260A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX/CwVrerbqp+M
 ctJbzVRUaLlCqJb9EDFwgVGSnSZBY6hxj/Dx3af5QlF5PeBm2VbmQ7eeIgvNtIpMQg9ACn2eR+k
 Y3l4CSM8s2FNv5r/F+0nyCiBRr89C2kXpXtcg2s1V03IL/Ad+7Iof3QWOmUoleN01KGT6FTkw1H
 Oym5rHF6MFfsnzatHIs21V61KbVltQduM2DSozlK4C7v2aX4njoohGQJFHQD9ZnzgiP1zSvD6k1
 FlBSPMbfohtKOa7bragmRZYhOVRvGHWb/g6X4q171SxR80odxyZ66kB9xw3YezeUB2WA7Mi+C6Z
 emUwMh1EAXKUT2v5xT19shZq9gY5MOn3Yk64oKMD10RJlNZJNiuAPbT8ixHnPZsFAHiTerEvKIE
 PYl+bz81U5oyjQ7ZXLNuHH9rN6zQAPhpXDCl8n/KHWmNlF3bdt2B/d+uyOoLLsZ0UcdUPDX8FqL
 7PW4D+hNlWe40A1MM8g==
X-Proofpoint-ORIG-GUID: FSpEmfaDx3LvfDu8FyGwtTXlUpnhvL0j
X-Proofpoint-GUID: FSpEmfaDx3LvfDu8FyGwtTXlUpnhvL0j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX1TyfIeTwffxF
 8VPTGzI1UDLTgqQ7LKHmd2crQmhF3cu54KohPnavfue3VJIxY4DY4ViqEOTq805O+FBfQXZ5p7g
 N5AWqiY8YK6izZxnFMNMhjLwtxDB8aI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_002052_667846_0AFB3432 
X-CRM114-Status: GOOD (  36.73  )
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



On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>> The bridge connector framework currently invokes all bridge
>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>> event afterwards.
>>>>
>>>> However, not every HPD notification requires a userspace hotplug event.
>>>>
>>>> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>> removal and userspace hotplug events are already managed by the MST
>>>> topology framework.
>>>>
>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>> can clear this flag when HPD processing should not result in a
>>>> connector hotplug notification.
>>>
>>> Why? Worst case the kernel receives another hotplug notification which
>>> gets ignored by the driver.
>>>
>> Hi, thanks for reviwing those patches.
>> Let me try to explain the motivation.
>>
>> Semantically, IRQ_HPD is just an IRQ notification, not a connection state
>> transition, and shouldn't be turned into a userspace hotplug in the first
>> place. However, drm_bridge_connector_handle_hpd() currently calls
>> drm_kms_helper_connector_hotplug_event() unconditionally after processing
>> the event, so every IRQ_HPD ends up reported as a hotplug.
> 
> What if the IRQ_HPD is delivered together with the first HPD event (for
> example because of the TCPM processing those events)? See the mechanism
> in the displayport.c AltMode driver.
> 
The DRM API should simply pass both long HPD IRQs and short HPD IRQs to 
the driver as they are, and let the driver decide how to handle them. 
Based on my review of the implementations from all three vendors, when 
long and short HPD IRQs occur simultaneously, the long HPD IRQ is always 
handled first, followed by the short HPD IRQ.

I have another thought regarding the current DRM API. Could we have the 
DRM layer pass only the HPD event information (long IRQ and/or short 
IRQ) instead of connector status, and leave all handling decisions to 
the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and 
each driver could decide how to process the event. This seems like a 
pattern that could be shared across different drivers.

This is just my current understanding. Please let me know if I've missed 
anything or got something wrong. Thanks.
>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>> not about "one extra hotplug", but about a burst of them within a short
>> window.
> 
> Ok, if it is level-sticky, it should be handled as such.
> 
>>
>> Every one of those hotplugs is delivered to userspace via udev and
>> prompts the compositor to re-probe the connector. In the window before
>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>> and performs aux/DPCD accesses, racing with the MST enable flow.
> 
> If there is a race, the path needs to have a lock, preventing concurrent
> access. Otherwise, you are just shortening the window instead of solving
> the problem.
> 
>>
>> The amplification also isn't limited to a single connector: on Hamoa
>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>> any one connector causes the compositor to re-query all 4. So this burst
> 
> Please fix the compositor, it should not need to query all 4 connectors
> if the HPD event came from the single one.
> 
>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>> whole card.
> 
> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> the HPD event to the userspace?
> 
The driver revalidates the actual connector state, and a hotplug event 
is triggered only when an actual connector state change or a link status 
change is detected.
>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>> the caller, such as the connector detect polling path.
>>>
>>> And nothing in this patch makes any use of it. I'd say, it's
>>> questionable addition. Let me check other patches...
>>>
>> You are right, I will reorganize the patches in next patchset.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>    include/drm/drm_bridge.h                       |  3 ++-
>>>>    7 files changed, 21 insertions(+), 12 deletions(-)
>>>
>>
> 


