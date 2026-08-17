Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AE4C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=; b=lD3cIZmow+rKwS0logm6c4kqFU
	8hs2FcWm2Q7rlKxQHIfMpoNKjvgQuWxYkQBr6vCnKvf+4imEmrfJw+2gPRlGUmRNyXGLqrKeJkEUX
	nYmyvcUDhp9i5IH6+pfH4gumc2J+zXLpq10EvaY1hiuEzcogRTikJoh0shk/m917YFLG+K5tfLm/0
	uKoZmeKu9CckgAwW0MGF1ucV4dU8lJM8txxVJ2vqIds2krXPCjneK/usC6aKvffcCyE9R1YIDasDO
	w/dLaThsFpLtiyqvhxXnfBflbHp+bj9aX+lGVoj/1sXrQ+ePmKqaw72v2QyPWPlmprGOrl8EewBus
	hr73ZswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIL-00000005cJy-40C7;
	Mon, 17 Aug 2026 08:02:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIJ-00000005cHz-3D2P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:02:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6tkd9663015
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=; b=M4gF4Is06pSxY56K
	W3KOFtNM5HsHAYjpCFDzpoJ8wMRVNUAmT2p7b3Ribex5cvyTG+ubAFfuKJNMPV1N
	AyyWnFu09qGPCbxSLwSBLZTZmiSPOsuxNXRLNAvvWPdtlSTi+IjWVy3VWYIXPwfQ
	s3cgXIHPxH9ppMlXGOgudH0+gUzaTEJ4lrdVj66mpLEk6/AKr8zucnJmH9YvsVXb
	jYf3fYfEroD61AVJdHht0op+O4V7Rmybt3iBm+z8g82NNK6C8rQdJg+Txf+5jWUF
	TEsLJfeveNsl4UAdW2TQSAe3iGzW257Tk8eRvYFsWO8q2Aoso5mtZsqenJy9NGP+
	2WXRtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnwxvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:02:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce64c41efso55392361cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953726; x=1787558526; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=aMvMUCQiES7SkAQ2aXK9qUHYz+Xr4w2qvlsAa2PmjqhbCoS0uESKbTCVO8LiFk6iNh
         V4DxuJCDe9ThpRppAn+6DQgIfYaO9x3qnVzGyWNi2yz41tgQDw1cMw32jOlKqgXZrvOL
         hcjsDYnwLF177qe44KgjQ8Z3kEtucTQsSa43FuLj6aSwTVPr95OF4f+PGm1yfpMdTjaV
         qqhPlAVs2z2a5gqKUg3yLzCfcljdpNFZmw7cqS0ofOx+pjvbvC6eSFIqs5b2ZuGj9pWv
         2ZKNgkNzIFz+MIN8gzWptHuzuYt24o8b3znN4HlNfgvKGYTflUNR7KoEJFfCBV0XXiMa
         0Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953726; x=1787558526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=EDNRdJsG1ZfJZHmw6dQNNhOPFHcpgK/C7nkopbTo8kBaUpWsRqbq/lEdzE9OXunGdn
         H/Ew2h/kjBWSUSOddSsx5CSEHuDkqLxXTedMWsZxII9zlohvw6GrFE6o7B+FJUXkh6Nj
         8f7LXPb4ioXaCn0MZE4NENnh1olIoCcRtDzx48PlW1Gg0RMhAF7aGcoP/K7GKM2xWBGd
         P4EChZkrbNUA6IxmBiNQbMfVYEEPKPykJfs4FrwDRn02HLn4O6aGOtklcRPx560SooIV
         owrjxS5e9+1EXKDJL4+1tIqJz9mFAujXgFTDmH3/9FUezg/wMZ+KbuRhSYywB2X9hG0Q
         PItw==
X-Forwarded-Encrypted: i=1; AHgh+Rorow3byAMG9PHeNWlAThDbvaq9FU9HCYHqWZeKhhiIRK1k1qAdZihGItYQ1ngTLGhfoewXf01FPPk5ajM4ukJK@lists.infradead.org
X-Gm-Message-State: AOJu0YwOMzwBjS3gowZEneGWFqndVm9/TQ1i5Vm1P8wTYUo7wQMWRD3Z
	Brmwobg3tgTLuJDAnlw7V7gZKqK2snE6No5MYsF85EwvVN7fYUS3mIJJA5ZH0k1//cap3fVYgiF
	ijHuxMIWWQVXvF4iXY0gViI2XA5OEQAaIQlfAXjCUZotNZLaTUO9HhX6HwPGdeUSHw/jDs1igsw
	ofxQb+3Xd8iQ==
X-Gm-Gg: AR+sD1205b3McvUqnEaM05J6ZfzJEsGi4E29Ypdl9wl7YI4KnLWt/haEQuRaq8k613t
	8h0OxXtIzcNRAsutHRCExiSFyAtonjGeoyL7gsbYDyQRcrUA6NX1NKalO3uQ8i1bK0TtbB+5VCp
	0PhnWbr2ukf/74Kz26u7tP9eoiCcB11rLCKNhSDBwBl1rFjP/Ut54VB4RWib4kBYP3uS+HFMb/C
	0Q+/oPSLVnvre1ObtxhUpMY6Mjms1moZVSQ0CouIucSLIK5BadEuLgjMEqKBxBiJT+7keZLBqev
	t9StHqkD0DbpjqlSUx8bbgdLrE0z0t3r0evWXca9IAIO45mmY7F9ACEhFsI3CIjcPA0e/9GWcGf
	Ad21Qic1Nr8xMBEjxK4rCQi96gWqCjffSydN6nyU7qkDyzBzPC7f83QjnIiMeunxRGA==
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249901141cf.19.1786953725709;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249900321cf.19.1786953725258;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:04 -0700 (PDT)
Message-ID: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:41 +0800
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX9o0gZOn6jMWC
 h10xI0xke7wz30RNVKHAIBK75LREBDvejF2SDT/Ta6OejNNoKr2icbtgE0vbrveqopHf1U/8bUe
 nv/W4s2xBMWjhiV10sLopP/CrqA10wPe+6uZb3+nPZ0LWGw1zrjm1hJpC7Af9Sj3Mdd5MSdqhKR
 gw61Y45tjxmiDKTzDN47cojPeoHisr8ZNqQG9NkOt5LMx0FC7ERPlwbovnuRGiSvd+2Rp3I61uH
 J8sd5WIJBDH59T69Essa14/aQbdV75+mzjezRCs89CzYcAFpOz+5YDaaGnWpBekamO/ZDO7OlwS
 ej0EjPwSSvQzCPjfpJbpWDvlQGAupvjqLQnl/PmXo25GoRtqjrMZAuNUA8ZrPqFxL7KVETWfSCE
 vxoUfgl/wAiV98SbWdMAtnHkDvpwj3DJqOR79qPwZ93lG4JzPwFUwGl25an/sKv0i2GbK1tmznH
 jl/Q6MImwDUnV4B+ckA==
X-Proofpoint-ORIG-GUID: lDOJyBmE2d1zDKc2P950kH7imYGlSf1J
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a82bffe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EPiK6WrKEJDDbvHRsiMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX9KjqxJFOD+Uu
 RE4Dl1eSOSfikK1BIPnwEkErgjwTUwYhExEor4p0JWUc6fa07lc0TqshHPDBTISX5WBHfE1qw26
 +VJ9gkw9DjZ5Wx/2eeByVAGv2DAQ0rY=
X-Proofpoint-GUID: lDOJyBmE2d1zDKc2P950kH7imYGlSf1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010207_924129_76661DD2 
X-CRM114-Status: GOOD (  22.64  )
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



On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>> The bridge connector framework currently invokes all bridge
>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>> event afterwards.
>>
>> However, not every HPD notification requires a userspace hotplug event.
>>
>> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
>> IRQ notifications through the bridge chain while the actual hotplug
>> handling is performed by the DRM DP MST core. Connector creation,
>> removal and userspace hotplug events are already managed by the MST
>> topology framework.
>>
>> Allow hpd_notify() implementations to suppress the bridge connector
>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>> can clear this flag when HPD processing should not result in a
>> connector hotplug notification.
> 
> Why? Worst case the kernel receives another hotplug notification which
> gets ignored by the driver.
> 
Hi, thanks for reviwing those patches.
Let me try to explain the motivation.

Semantically, IRQ_HPD is just an IRQ notification, not a connection state
transition, and shouldn't be turned into a userspace hotplug in the first
place. However, drm_bridge_connector_handle_hpd() currently calls
drm_kms_helper_connector_hotplug_event() unconditionally after processing
the event, so every IRQ_HPD ends up reported as a hotplug.

Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
/ MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
not about "one extra hotplug", but about a burst of them within a short
window.

Every one of those hotplugs is delivered to userspace via udev and
prompts the compositor to re-probe the connector. In the window before
mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
and performs aux/DPCD accesses, racing with the MST enable flow.

The amplification also isn't limited to a single connector: on Hamoa
there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
any one connector causes the compositor to re-query all 4. So this burst
of spurious IRQ_HPDs during MST enable ends up amplified across the
whole card.

>>
>> A NULL pointer indicates that hotplug suppression is not supported by
>> the caller, such as the connector detect polling path.
> 
> And nothing in this patch makes any use of it. I'd say, it's
> questionable addition. Let me check other patches...
> 
You are right, I will reorganize the patches in next patchset.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>   include/drm/drm_bridge.h                       |  3 ++-
>>   7 files changed, 21 insertions(+), 12 deletions(-)
> 


