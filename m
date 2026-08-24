Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D3C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 03:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=; b=s+dlaqoe+qzoqsKR2NZaG/ocOs
	z2pOyzEG+hJnw8b58vRrkYyEPTIHg5fuEPrrIFN8woZsGCFn/pW8gv4OuHvYIUUsMkC1m+B4kwJwq
	1Fzvu4oZ9BsWwVeU8z5xIJDn/rVI/5ObAlUx1RiRONCVVWqZvHdkdw6N7FXNGyE5tPq0tmQhrr8Mp
	Mjbu42cTLxx56TJm8N29JcaYUcLGQpxW5ejaK0odyVqgWHHeEomB/V2zadCmdc51qy1bZG5kKnjhf
	OHK1xia9OP913HPLFDPh5bzganh5haQQguh+/4xFTzevU+2t5BFz6jjNlM9eUiUuVV17mM7UDp/cy
	03ZpXDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLAE-0000000FquH-0tlO;
	Mon, 24 Aug 2026 03:15:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLAB-0000000FqtX-4AWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 03:15:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lCEo2472479
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=; b=KzjesmQM0w9mb9Xo
	xDdnGhSl0dQLjqZsS8WJU+uIBeqbOXwW4KZ0WlCfzEcjqQ2TUdE0cQdPqE1OAzko
	Ms8f5LnYiaJOuBLEvkEUlHahLPqLvgICbL+L4rZXGzBRnMzxXd4uA7ioak4V+v51
	DeAYeVhijIksa08Cwi0EAIfSf5RgPj8v4+Eof3YE2HCj25GbVGwPTGc7JhFrLKPH
	pQsmOQwiH9nNpHOKL+rKyj/5GTGfb+Mem6GT27qF/00Bydg6gqXC02biK9oZ0O8g
	TryLV0BKgh2QMemgcqO3lnGffib3xEy7lHC6vWX06FThH9aPbIxcoaRK5ZKuHW8f
	RYmI9w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpgmcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:15:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so4524059a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787541354; x=1788146154; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=jQMuWvMoSSWhfy3sBQNEv5TR8OBI0Z8Oau8zjypm7syxkokDbAf8QEi5Vyt8HiNR8h
         IsMrKHzPlUoxZzHkdnMZqRlAvqJKIZ7s2LPMvdpWKGGsWlidWfv0byYJSXdKU37Toj5b
         wEryuypoJCyeML6qpJjKreZwGgqlZ3NqJwZQRseDHYajmTdfzywGsCpU0QoTy36PZP9r
         TM7ktH4fA4W2oltsKDcoql1IyMfrQ2d7BJMXvRlNDHir9kRgV3K+BFA/c1qVuPWqdu3C
         M4Rc14GDvEpb/tffG7lNHJxpEP0x+QYccnS9nKLEiVmwoWNVYNw/2U2OP/3cmnUZe8th
         /iQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787541354; x=1788146154;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=iSKlVFO4DVQETqYQZt/rM5Mt9ZsIpYyOIgGPlk6tMLhm0ONoxDMmXIFrY1cC4XD2Pj
         2o9fHh0J/0Yg0f2f0gGp76Gy1Z6lQQCLbByRirB1m92lEFOzZ9vtCcFbYjKbpdg3ODY0
         cCWn/+A+F50HDvsNqucWjeAnr+CJSC35laokUTiruVH4qCYZkKAOKoDOs9rcnGslP6pl
         cM5MVAT4pXNSQgvOMFh0xh8Sh26iiBTgMpw45rqoIihGh+7Z3bZ+Qce6nv/zpxhsWk6C
         1FIL6V64fTcDxEhJnxXRd5ETlFirHaUoJOmrkNxYcTPzkwSNS2pZnd1L10qfdqHwnGg1
         DyQw==
X-Forwarded-Encrypted: i=1; AHgh+RqSo3tHhzu4MvpfwjuogPMIwhReudtX6EwFyptw51o8Jlk+7Yjam1JiIKwauE75dbvwXXVl7D4F63XUc7C4R02Y@lists.infradead.org
X-Gm-Message-State: AFuF++nwAXxOUlnct07VILhgeUeo04iaNnP5MyQABEi+iVQLkyfwEJxo
	fMdBz32nSJgRyH5tTrK5Mm1sFG2ouDLvTAM0BMwR2bBYfRNhGZ42SJjuJwqoWQb2POxnwq4Oqyd
	ZHWmPcqobhe92EdP9guAvkcgD70I9kgf7Y1Cwf19XpRBTb6fvXrkjiadG+P++nftU6NGagu81ye
	O9hg==
X-Gm-Gg: AR+sD105q2+6c3E86JezBaJdX05tlmfrsRvl687cpryJPjC5v2tWdfZnM4FPluv9UNF
	ZCDvbsihfTraIfk13dmliEGn5xEv/4Inc1i7Y+vMHxsvaqR4oMW26xtpLJM3dJJmcJWkDKa4m83
	SqfLR+Gl5E+npbaQR1+44XTXB0kW/zHENdh25CmsuuhTC0l8GcPi5acVlwlcRVb1jJzL6hBTSqy
	Sr/7DtzIx9eJuMuIF8C12onQXzxpD0H1AwkwiF3wUIgJP4NGwPvpwjkD5AsspnugNq7Aff7POCx
	I3jfUBXym5U44UPUreA66bjEIoNyn8EwJumEnLGUksxamVuO2Cukjx8h2NtEcxpgB4EJGmfNnfW
	va4xdYhNdSi/fmPdAKbuxttSMQ4YuE7eg/LWn9wbW9SWy4dJB+K0u/nq8yeDcD9tmvTZJxuI=
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833589a91.12.1787541354198;
        Sun, 23 Aug 2026 20:15:54 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833494a91.12.1787541353641;
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b2b9c9sm8056616a91.15.2026.08.23.20.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Message-ID: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXyquKopfgPcRb
 20pERnur/m3B11cIAqkgpSP6ipqFs198oPTUOykZ9bJrSWZo2gHGXRDvu4pxIfXP2SpjsWS2OfA
 UuUW5ibrMFfuDG9DwFsubMOnJ30UDvNDmH+7qJWZ7l9h9XudsMG1BtUt8NSVodbdzusUlTEb5qy
 YyAtdVt2N8mip4ey0Yc5aUSzzyOCRraw1UejMQf+sNEg+zTzKXcaz00riz1CkBLnhLmRzGUkaPS
 59WnNTE7WPdM1tAnjlGBHR8knPwd4NZmMhsgBd6zrxZUrkiLBKCmhT7lyxyeH+FHy8qsJLgbOyL
 vJ/E5i2Iv8cCml4NVB4R336EPl5ig34a9CiwmhGw703KjNu/SBaaP2cAqj3XUS77YADP3d0mRx6
 +++VSiegUI4FCRQKQ4N0QAuc8JMHOO76aWtJCNfpgX0YOwY3ucfBjdedLQmX6cxLtDi4hDJyrrr
 CX30VYhcvSJ7lUGVKsg==
X-Proofpoint-GUID: XO6FP55YJe_Ievc0QgLs4GFllL9f4bnf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXyifP8fpQVbr9
 ZVOlaGYRPuJvqzXsg8Rz/RsnI+HViYURAogIahn7WBiB9fLyTmlyzArkzF60YJfECtG9+vNOiCK
 L859GVteg5gnYQVV49yDTl9naQH63hw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bb76a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQJ8N8Yg66gReXqHpcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: XO6FP55YJe_Ievc0QgLs4GFllL9f4bnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_201556_054026_49985DDA 
X-CRM114-Status: GOOD (  37.91  )
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



On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> 
> 
> On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>>> The bridge connector framework currently invokes all bridge
>>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>>> event afterwards.
>>>>>
>>>>> However, not every HPD notification requires a userspace hotplug 
>>>>> event.
>>>>>
>>>>> In particular, DP MST bridges may use hpd_notify() to propagate HPD 
>>>>> and
>>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>>> removal and userspace hotplug events are already managed by the MST
>>>>> topology framework.
>>>>>
>>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>>> can clear this flag when HPD processing should not result in a
>>>>> connector hotplug notification.
>>>>
>>>> Why? Worst case the kernel receives another hotplug notification which
>>>> gets ignored by the driver.
>>>>
>>> Hi, thanks for reviwing those patches.
>>> Let me try to explain the motivation.
>>>
>>> Semantically, IRQ_HPD is just an IRQ notification, not a connection 
>>> state
>>> transition, and shouldn't be turned into a userspace hotplug in the 
>>> first
>>> place. However, drm_bridge_connector_handle_hpd() currently calls
>>> drm_kms_helper_connector_hotplug_event() unconditionally after 
>>> processing
>>> the event, so every IRQ_HPD ends up reported as a hotplug.
>>
>> What if the IRQ_HPD is delivered together with the first HPD event (for
>> example because of the TCPM processing those events)? See the mechanism
>> in the displayport.c AltMode driver.
>>
> The DRM API should simply pass both long HPD IRQs and short HPD IRQs to 
> the driver as they are, and let the driver decide how to handle them. 
> Based on my review of the implementations from all three vendors, when 
> long and short HPD IRQs occur simultaneously, the long HPD IRQ is always 
> handled first, followed by the short HPD IRQ.
> 
> I have another thought regarding the current DRM API. Could we have the 
> DRM layer pass only the HPD event information (long IRQ and/or short 
> IRQ) instead of connector status, and leave all handling decisions to 
> the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and 
> each driver could decide how to process the event. This seems like a 
> pattern that could be shared across different drivers.
> 
> This is just my current understanding. Please let me know if I've missed 
> anything or got something wrong. Thanks.
Sorry, after thinking about it again, this idea is not fundamentally 
different from your current approach. In the end, we still need to 
handle HPD state transitions in the driver. It seems my previous 
suggestion does not really simplify the problem, so I apologize if it 
has caused any confusion or misled the discussion.
>>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link 
>>> training
>>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>>> not about "one extra hotplug", but about a burst of them within a short
>>> window.
>>
>> Ok, if it is level-sticky, it should be handled as such.
>>
>>>
>>> Every one of those hotplugs is delivered to userspace via udev and
>>> prompts the compositor to re-probe the connector. In the window before
>>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>>> and performs aux/DPCD accesses, racing with the MST enable flow.
>>
>> If there is a race, the path needs to have a lock, preventing concurrent
>> access. Otherwise, you are just shortening the window instead of solving
>> the problem.
>>
>>>
>>> The amplification also isn't limited to a single connector: on Hamoa
>>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>>> any one connector causes the compositor to re-query all 4. So this burst
>>
>> Please fix the compositor, it should not need to query all 4 connectors
>> if the HPD event came from the single one.
>>
>>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>>> whole card.
>>
>> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
>> the HPD event to the userspace?
>>
> The driver revalidates the actual connector state, and a hotplug event 
> is triggered only when an actual connector state change or a link status 
> change is detected.
>>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>>> the caller, such as the connector detect polling path.
>>>>
>>>> And nothing in this patch makes any use of it. I'd say, it's
>>>> questionable addition. Let me check other patches...
>>>>
>>> You are right, I will reorganize the patches in next patchset.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>>    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>>    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>>    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>>    include/drm/drm_bridge.h                       |  3 ++-
>>>>>    7 files changed, 21 insertions(+), 12 deletions(-)
>>>>
>>>
>>
> 


