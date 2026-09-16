Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008B5C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=; b=CJOqRKtOd4w3b3kssEG3NFEgnY
	R94oGHEXb/QBqmyxnb6Fb42PN3casAffZeRHHsKe+KWEENFaISV8OfLZdx19ZY9q3B+OKq71AAgR4
	211u5jyVaj82G+tHqeOF8CV0ZnQfrEp2AbuItJfObo0OHKWFpD01dEaWBgnAVzKAYspn42qQtU+tw
	u/iyKgwHbBvlKK5VbTom2f2dkH55D65xpFISnQ18rk273TMgnZEH4CWChlV+FOMUVMJ58ytbSdJQm
	qyAETXM9CkfUBu0Adv/nk6cGSS4MQR4GDQOHRLXtjz/sdE2us4HakxKoD8R/Ao6fBbsSq+3rV8uEh
	t6e9gYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jGy-00000008UeX-1T8b;
	Wed, 16 Sep 2026 06:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jGw-00000008UdS-0foo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:37:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68neW2986935
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=; b=ILKqrp7+N1wCkRrs
	nLsngSEOjVJ4Se7FEQ1iUV1nCgLA7yCzm8iUPx6tsQrlSE+mvCg3a9WPt1Bxn7zL
	KeUXGlzm+v1Ss8EMBjk4K7w9GhzYGcP9meburL+vh5BJGcXaoDUQV7CYJt5zuQT0
	MyMVDiXjbqHsQRwTZSdoyS2O6wAnUpiUO1TnyOwQh/nmZZmJndPMDKuPbQmF6oBe
	QZr0PEnlP2PINYvG4aYJqXvjBNpXITeXRfBlZPFr71GfC+Emzi1mKlMO1MkwSRkU
	ZRxCADeLpv5CmwgeXaTX/iXVZ1mnewDdb52wg2TLcpWo9BPFJivl4tcQnpbuyANG
	pkhS0g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp9pxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 06:37:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9102f07f2fdso35838576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789540652; x=1790145452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=YUbHm8L45+KT+ZxGzdRXL6jyMq7+XdyNqUN3+RKFpdQhgC7dJXUiRgYXVjM3DUHq15
         GRDs8sQPtxdV4QhA89AONhRwJKkwI7fgt8PNqT7MOqi/tLcUAOYUsfDiAGxFgiY6X29H
         M7ZYwGjtVATihiySiyP36maudwlHWvzYLo04YLDPxfMoQ4cm2/RbBsWihkv3FzOZgLAB
         M6h+Lu1vrZiTZLwPDwhVBIx3mNtfnYPvWv05G5/5lx4lyKPc6ZFfLZHrhYbgGy54ODCx
         iv+jgDXhPo3eB9t60lAnGONbQJ+yXbk9ac1L/WxYCnP4XyW1FThtOdksLYToPtn64Qbw
         5HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540652; x=1790145452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQ+wFIcS7R/qaD+wlIu1vUybEb7TOl8vT6jhLZTSv0w=;
        b=zNrBARfh2XKQ7aOlkFn+YVWmCcLHV9g5P1B7EY8JA03BCU7AuhISKd2XTpJa6iqfmP
         IAjX2Zh7MeTQxMi/1q8BaJexnFC2WJfL4ZN4Day45+Ff+ZgDHIVh0M6kkOAkVm3cSFhj
         Q/Hk1Guisx5xr40E/T/t3kQCZY7UkInUWLGC4Y3WWKkRlWkfhf7SH7keTD+fT+J/8htY
         Bcyt2nD1u77xfjRl6bbjnowdSPEMK/zuQBH6Zuk/tQpKPl9ZxNbCvZdCp47Z0ppswL2f
         LtEpKbV6f9XLOqUP6Gg/Q9/A3OX91qF2wQf88GVzUU/POZkkHK9k8c0v463WXf40mH7k
         TS5g==
X-Forwarded-Encrypted: i=1; AKwUvBy+tD8rhl9vIv4BT4XeFg3plt1IF5iw1gO+wAN5Sdqqj+6jCtq1jXme9DfhesvhNAis0S6SYeucYpsJVDtJyChk@lists.infradead.org
X-Gm-Message-State: AFuF++m1MSNbwOJPbI/sbAubDTggduipsr8FlZQZCQfQxShDSczfLOnv
	tmPmWj5797etrjrOIhw6VYiaQCfK8oZdnNjDsbI1YoZjtcbl5/ztalwnQdC92nyh5x2lOyHIm3b
	SVKUawhD2sX/OVZQQ5A5UxtuL0JBuuRDT5DE62e132vBMJ7mQzXCKtfHH6gPqO2Fb8q1scBltth
	hzQw==
X-Gm-Gg: AYBFou32EzVkprA1mroAUhr/7vEwBW9kmF0ajU5MByxYpIEd+TKVlaMxWXjDJnlQUK+
	1f1aNc4Kk7kv1kWbNTuUN/jJjKtCS1Ruxd6ZFc/+8DG/Df0H76yyDAOuUQU+lKjRbsj0mHQUzIr
	AA07buDnqBfHW8OcoRiNmzhuiNAqN1a2fxBtipHdOJvVDW4oSRpc9D2ePE/7MtB934YyAwoi1R+
	MzUJokRWExjBjOJnyDBptMNWsmwujeOfQZmGEu2cMEMbSc88hXRwVLxzSk84OdoYPYtGGtnbuL1
	0RcitEcGPWFM0ABh2LOO9O+8wxdwUyswSKpVVSBlLYy0/ktZgE0BNJxFykHNjOwuiTFYmJxcy3U
	zK8hM2OJ6QcaWt2FMlx92LDlHDplvViRdTETBQ4wBtx8oUZ1/xdmmWOmQ8pspx7oF
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063786d6.31.1789540651621;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
X-Received: by 2002:a05:6214:3186:b0:910:3923:cc76 with SMTP id 6a1803df08f44-91234436ca6mr106063206d6.31.1789540651009;
        Tue, 15 Sep 2026 23:37:31 -0700 (PDT)
Received: from [10.38.246.144] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bddcf56sm18155886d6.2.2026.09.15.23.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 23:37:30 -0700 (PDT)
Message-ID: <ec70fa7f-4e02-484a-b7f7-ced7b81d3e44@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:37:20 +0800
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
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
 <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX4dxIMBUmumzD
 wkLsvgi/Uq583avzIb3nuot/zIniF1lxWff/5kqJ1U1TfIfGImwN6i58VcQVlV3hEn8tkO8/iZr
 FkixtlqDtpVCELCqElu00U4AGaUF9nM=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa392c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NHX6yGbTSU1aQjhbUZcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: nLNyBvAzlRn9KNY-GyXaUrIq4pvHMQv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4MyBTYWx0ZWRfX6IeQaqa61H/s
 NYpm6Wqn5E9vcTaNDcy5F+KVujkN4ZXat8PkXje1pwvcUW0ZtehGnyk+PKdCoCydFX/2+NG0/QL
 P3Tlxm+AoKMiOh6pTBh/q8cNzATedD75xDWciH/cocDVNSreawHuOnc2eIEWPBPeLRdnorrwzLY
 14rsT235yg3CIfmoLmSk2TaIudal+31AlCgJx86dRPBb3elxjV1aOPiIN4FcCxWUEmyBn+wb1xW
 u/JufiHVm9F/am9XIiO9xHxyPWgdCiZx62BU0VI7JhDQOYNEY85TlZqVzbjCK7sGCsc2jtHgc6Q
 iDLosXVdR+YduOsPRtLBREonOLjzUCl9AlMAvgLgxhHl1+o90UXamkVz6/b0RYsICg3vD1diGko
 sau00uTWlMweEJgQfqtEGq9kT8X95YZg/e90v3ZBuSgziVWr17OLrKGOVBXjLQG+JMY4Mp36DAU
 agrxekJ7g6V6/8RgO2w==
X-Proofpoint-GUID: nLNyBvAzlRn9KNY-GyXaUrIq4pvHMQv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_233734_199247_A9B49159 
X-CRM114-Status: GOOD (  44.44  )
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



On 9/8/2026 9:10 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
>>>
>>>
>>> On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>>>>
>>>>>
>>>>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>>>>> The bridge connector framework currently invokes all bridge
>>>>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>>>>> event afterwards.
>>>>>>>
>>>>>>> However, not every HPD notification requires a userspace
>>>>>>> hotplug event.
>>>>>>>
>>>>>>> In particular, DP MST bridges may use hpd_notify() to
>>>>>>> propagate HPD and
>>>>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>>>>> removal and userspace hotplug events are already managed by the MST
>>>>>>> topology framework.
>>>>>>>
>>>>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>>>>> can clear this flag when HPD processing should not result in a
>>>>>>> connector hotplug notification.
>>>>>>
>>>>>> Why? Worst case the kernel receives another hotplug notification which
>>>>>> gets ignored by the driver.
>>>>>>
>>>>> Hi, thanks for reviwing those patches.
>>>>> Let me try to explain the motivation.
>>>>>
>>>>> Semantically, IRQ_HPD is just an IRQ notification, not a
>>>>> connection state
>>>>> transition, and shouldn't be turned into a userspace hotplug in
>>>>> the first
>>>>> place. However, drm_bridge_connector_handle_hpd() currently calls
>>>>> drm_kms_helper_connector_hotplug_event() unconditionally after
>>>>> processing
>>>>> the event, so every IRQ_HPD ends up reported as a hotplug.
>>>>
>>>> What if the IRQ_HPD is delivered together with the first HPD event (for
>>>> example because of the TCPM processing those events)? See the mechanism
>>>> in the displayport.c AltMode driver.
>>>>
>>> The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
>>> the driver as they are, and let the driver decide how to handle them.
>>> Based on my review of the implementations from all three vendors, when
>>> long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
>>> handled first, followed by the short HPD IRQ.
>>>
>>> I have another thought regarding the current DRM API. Could we have the
>>> DRM layer pass only the HPD event information (long IRQ and/or short
>>> IRQ) instead of connector status, and leave all handling decisions to
>>> the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
>>> each driver could decide how to process the event. This seems like a
>>> pattern that could be shared across different drivers.
>>>
>>> This is just my current understanding. Please let me know if I've missed
>>> anything or got something wrong. Thanks.
>> Sorry, after thinking about it again, this idea is not fundamentally
>> different from your current approach. In the end, we still need to handle
>> HPD state transitions in the driver. It seems my previous suggestion does
>> not really simplify the problem, so I apologize if it has caused any
>> confusion or misled the discussion.
> 
> No worries.
> 
> I'm currently stuck between two ideas: continue pursuing the current
> "single API for both events" or implement new "two API for two events".
> I think that the second might sound more plausible, but in the end it
> would complicate drivers much more, because now they'd need to handle
> synchronisation issues on their own.
> 
> If we start from the DP AltMode, we have a single state word which
> specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
> DP controller also has about the same status word: the connected status
> and the IRQ_HPD pulse. Which (for me) points out that the single API is
> a correct way to handle the HPD/IRQ_HPD.
> 
I’m not objecting to the single-API approach. I’m just not completely 
sure yet how it simplifies the driver-side handling, since the driver 
may still need to deal with HPD and IRQ_HPD arriving at around the same 
time, or IRQ_HPD arriving when the link is no longer present.

For reference, Intel, AMD, and Nouveau appear to process HPD state 
changes and IRQ_HPD handling in separate workers. I’m not sure whether 
that is relevant here, but I thought it might be useful information.
> Now, coming to the drivers/userspace side. Let's leave the MST story
> aside for a moment. For the DP branch devices connected to the USB-C the
> AltMode will always report 'connected', but the DP's detect callback
> would rightfully report 'disconnected' if there is no actual monitor.
> The kernel should do it's best in this case and report that the
> connector is disconnected without any interim states. I think we do it
> already. The compositor should do it's job and skip full scene
> evaluation of the disconnected connector gets disconnected again.
> 
Agree.
> Event filtering. Historically, drm_bridge_connector was trying to filter
> HPD event. We had to remove it because for the DP prefiltering doesn't
> work. This might have left the gap, which now needs to be filled. The
> bridge_connector uses drm_kms_helper_connector_hotplug_event() which
> just reports the even to the userspace. Consider reworking
> drm_bridge_connector_handle_hpd() to behave more like
> drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
> mutex lock, capture if the status has actually changed afterwards and
> report it to userspace only if there was a change.
> 
Yes, i want to update a new verison to do this and update the 'HPD come 
with irq' case. One question, do you have any rough timeline in mind for 
the next revision of the IRQ series?
>>>>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>>>>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
>>>>> training
>>>>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>>>>> not about "one extra hotplug", but about a burst of them within a short
>>>>> window.
>>>>
>>>> Ok, if it is level-sticky, it should be handled as such.
>>>>
>>>>>
>>>>> Every one of those hotplugs is delivered to userspace via udev and
>>>>> prompts the compositor to re-probe the connector. In the window before
>>>>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>>>>> and performs aux/DPCD accesses, racing with the MST enable flow.
>>>>
>>>> If there is a race, the path needs to have a lock, preventing concurrent
>>>> access. Otherwise, you are just shortening the window instead of solving
>>>> the problem.
>>>>
>>>>>
>>>>> The amplification also isn't limited to a single connector: on Hamoa
>>>>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>>>>> any one connector causes the compositor to re-query all 4. So this burst
>>>>
>>>> Please fix the compositor, it should not need to query all 4 connectors
>>>> if the HPD event came from the single one.
>>>>
>>>>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>>>>> whole card.
>>>>
>>>> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
>>>> the HPD event to the userspace?
>>>>
>>> The driver revalidates the actual connector state, and a hotplug event
>>> is triggered only when an actual connector state change or a link status
>>> change is detected.
>>>>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>>>>> the caller, such as the connector detect polling path.
>>>>>>
>>>>>> And nothing in this patch makes any use of it. I'd say, it's
>>>>>> questionable addition. Let me check other patches...
>>>>>>
>>>>> You are right, I will reorganize the patches in next patchset.
>>>>>>>
>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>>>>     drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>>>>     drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>>>>     drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>>>>     drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>>>>     include/drm/drm_bridge.h                       |  3 ++-
>>>>>>>     7 files changed, 21 insertions(+), 12 deletions(-)
>>>>>>
>>>>>
>>>>
>>>
>>
> 


