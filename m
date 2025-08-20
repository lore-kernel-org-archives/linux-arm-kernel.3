Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EE0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=; b=nBhnExi/KXOvRUL5lqbiLuU1aS
	yr5G1u0ltPSrMcbILABxgpVl93+SHDs6zW6Jww/ngJOfLrRAGGmOMI64+cPY0MqxW2awyKl9mRdDC
	ZVXGVQ1KzUBo37kwTVXf7c/AQrJxXbJYrCxVEcTgDT9LeecsEU/osy7V8QyHEMzJQsgszkirnasdU
	sshBqHKHt//NiizTSlrvVH8MZnBtyXxl4DHJpNSLxah21TD0RSTkV31MrItQN5VAr+LnODxhPDDUu
	1ceV5qjaQWOuLAZmsy9a1vvKo1hRGnMQUPyrf5VSYROnv8Eq8ZQ5DesxzJQMOkaz1eVdzFwN1Sc9n
	WRpdZE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohHM-0000000DSkv-0GHW;
	Wed, 20 Aug 2025 11:46:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogmt-0000000DLV0-14Mi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 11:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=; b=lHVlPNJ7irCpjguGnLBz58y+gN
	vXq7s7Ez87wjGAwvG6XfssVt4d+pGOfdFsHYpqR6iA/cIo2gDyxkRo4vw6jiXtu+Vxft1lPQX3hEG
	9E5+nL/NvVwby1dogu1rQsJsJo2DYwERIL81pv2HKJ5GsuwZBvEAsrtqvFA8/Z4k2Y2tYymkrNb/+
	Ml4Y1n26xHvXoBG5pYYrGC4TqPcmnMNtJLvzt1/I8i4XzWYE+uhKpLv6KJkXo+q2UUhQAmd0Syn/V
	dbQgXhygXSBJhNIs1tuhnQKpxvMCySO6X4Ro5SNu0hVA3odnChn0yF8R56/+KxDw+CZCKWC2ABNQJ
	1h0mUJog==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogmq-00000000J3S-0OHG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 11:15:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fuiU001976
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 11:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=; b=HDBz9s0P0s4Kh+ni
	az8k8TI4qABStThkA0Z8IgzaEkIiqLLaLc+IRdUfQyQku2yvyoxsIqTFMyqs15td
	xcEZYPBY0X/a8SIOmUduYv0Y+VXWdamebto9yAlJkQau3IwMiTx2h0GUJFpDAVGp
	rhPlY4h3VHVsvD8cBsbcp4HGygJ9JTu/V8tOP2KhAf5kWsOAombcYXcP47NDPRZI
	XaPpInAx0kROt9ItCDG/ZaddcQedMrPW/P45zw4O0H1Sl4LAkOCG9wpGByXiOzn/
	Y9a+xebCg7AnpO15RT7LC4NcFfAeclEXTgYopfYmGCr8AHZiofnC+5Lp7V8/7RvL
	DsSRmg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sfft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 11:15:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ba7aa13dbso122564796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755688522; x=1756293322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=;
        b=L+jl43H+ZfC4m0XsXWO2zCJmCtJ5DF6QRJ0w6q34apbHc94hgLGtlwGK4X+mmQEgub
         b0NQraVRvl6epNpRm1XPZEKVg+ZDqehJmKT1i6OvEw5+6bH4np0rnZn6pjk5ePexHtzH
         AsG1+j/z7YFxQMqD/V+M7qOKiGlqcPmlF2gDY5GGEFnCI7/ngqYLLWT7IZej/onz/W74
         nI7ojdWTRAiBQVsxdZ0Sg8efFCaFTRGhUEexcINShs15SRzTRstpS8QJz+d7XeWiD2oJ
         C/rVg7PwdwZVTbn67NYNd379xxHkrRAAuh7qV3VX/7wnVMzsSm3LdFG+yZ/mB8A/3p9I
         tSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfBpKxSUWmgkEy3KcYAcNTAbFYeEkw7/5PFlDrGga8EGsJbehIL8WNys2y6Wel7uk5PxS1cPjmp7HN6NrIV2AN@lists.infradead.org
X-Gm-Message-State: AOJu0YyyI/UfGKLi8nkqCPayduJn8a2EWtLpua9MQbiSJhggZOpUrjiT
	nf2Th6TR6/Z6qW1obWRKCjkJr0C6NdtjpSEgkRFb6NSyPbDyybQQ7JzgWwzrMB95q8w6Cmv2R2a
	wT9hiIud5xZv0cWQB5NN/VOfChW4HjyRvU/NdCTjkoyoEzcUV5fb7uKOUZzC2B4a4NbbnoYNi4k
	i4Xw==
X-Gm-Gg: ASbGncttTY9i0ljAgb1xTTrdMsHL2BECwbDEYa+aGcwF9NvLT1PlVfPeITrDMXxlffk
	Yl/uMLx+SYObdfmcZv8u6yXBWNCt2i/+6jPOWIHI2AiWVL4WidCrfvCJnqiyPTSifjtEjel3Njx
	nCD5rs7d5Z0A57NM26grAS8o0I4NO5pw+6XWjh6+REtke+fS+llVsqeWp5G9VjvhH5S75/y2u7/
	rwVrzIa7BkbXDaaPowNvyBqA5PqXu/zkdhFDs+JdpH7Nga1BdKU+57Zm4gXTrJ5w2QLbW/16Hkf
	x+vDc4+eYdxpUduQDlivW/o/7zJrb2zPTM+qorZAhoIupZsAujP6+2P0FJOMr4FoTYO7L/b2J7R
	agjr/8jP+bghUFWAHNw==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id 6a1803df08f44-70d76fb14a1mr20922256d6.20.1755688521465;
        Wed, 20 Aug 2025 04:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH80qwENBGa8LZaS2l/vsPkoG89K8rwgcpZkHUFmG54urW6WuO247zB8LpY8iq/8kq4fh5zOA==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id 6a1803df08f44-70d76fb14a1mr20921616d6.20.1755688520930;
        Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi. [84.253.220.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a489f49sm26715321fa.35.2025.08.20.04.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Message-ID: <db09dded-deff-4233-bacc-90d41346f52d@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:15:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
 <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
 <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
 <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5ae4a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=5lv965NAfe5egn04DU8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: yrBMcswZ-NXM29_Dn-qP9qq80dL4SC6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0Op6cVrlRdBQ
 ncz9JkNoqpUdCe0getBaoZJRPpkij5WXV/98i6cpkHCiaSauc6ePjQt1SEkES1wVz92gOLAxgm1
 M2FOUwYMcQMP5cv6wk14teX37oiQEaAydCyKCEyv+JI7BrLlpJVdSB3SU8QcRgqA456TKUDj7wc
 9z/Pr9rbtu+Va1Xsw8aEhWWrQjfymdu2/thYWnwc81qLM51YE6qTSwCvBShT0voO6tZWkiSTggC
 Fp3UAsIUdRkrCsAT+ffTycyhSNXvDARdo+ys/Rl/MNGSGDI7iQpX0nZJ5qkIYpsbBkpahfn1jYr
 J00VPENc0rHhbGuluCpGaeOxgb369LK4E8/43DQsEBELKjwQBg8+hUXEQmM7dmO6+ZfqBm6T0CH
 lurOAyACUWmkRNdDqd2TizspJlr/1g==
X-Proofpoint-ORIG-GUID: yrBMcswZ-NXM29_Dn-qP9qq80dL4SC6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_121524_429978_675AE04C 
X-CRM114-Status: GOOD (  19.51  )
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

On 20/08/2025 06:28, Liu Ying wrote:
> On 08/19/2025, Dmitry Baryshkov wrote:
>> On 19/08/2025 12:49, Liu Ying wrote:
>>> Hi Dmitry,
>>>
>>> On 08/16/2025, Dmitry Baryshkov wrote:
>>>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>>>> interface.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>
>>> For subject, s/it6232/it6263.
>>
>> Ack
>>
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>>>        it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>>        it->bridge.vendor = "ITE";
>>>>        it->bridge.product = "IT6263";
>>>> +    it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
>>>
>>> With supported_infoframes set, the two lines setting vendor and product
>>> are dead code.  I think it's worth dropping them and updating kerneldoc
>>> for vendor and product members because they don't have to be required if
>>> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
>>> in this patch series).
>>
>> They are still required by the framework itself, see drmm_connector_hdmi_init().
> 
> Yes.  But it's a bit too strict since SPD infoframe is optional according
> to CTA standard documentation.
> 
>>
>> BTW: I don't have ITE datasheet. Do you know if it really supports only the AVI frame?
> 
> AFAICS, it seems that ITE6263 supports inforframes from 0x81 to 0x85, so
> including SPD inforframe.  Maybe, just keep those dead vendor&product
> settings for now and add SPD inforframe in future.

I don't have necessary hardware (nor programming manual). If you can 
extend support for those frames, a patch would be really appreciated.

> 
>>
>>
>>>
>>> Reviewed-by: Liu Ying <victor.liu@nxp.com>
>>>
>>>>          return devm_drm_bridge_add(dev, &it->bridge);
>>>>    }
>>>>
>>>
>>>
>>
>>
> 
> 


-- 
With best wishes
Dmitry

