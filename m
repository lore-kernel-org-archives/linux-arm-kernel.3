Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1685CEF36E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=; b=HLcUMUa7qXX+0fFa7XVDVvilrK
	6J15j99ZOelmN5ss41nosNjpermMbbG7aWI4MN2TkJxBbIDfJvBoQume6FF0NiXrqgdBNOo9Tyjmm
	4I3kd5Ko+PILz+vJim4blnc97LEViT2Xw3s0NwOovr76HqBUnTiwB/QkzsqDjD7AfKfS+R2SxBpxO
	ICgmifvgltAdiebgKj7ge+yQRh4elVJLojCJkFb8tvaR5VcOmN5sFUDTdgCnG8HbDCoAHQ1CSIWJa
	ObemhRIfbP1KrM3Uvz/sYK8zlR83ZE1pB/M+vV6SPGAFKU54QlZS92Ws5YqfW4TbTIDMIqGAhG8A0
	cIeGOUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTsh-00000006iWY-06Rs;
	Mon, 09 Mar 2026 06:14:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTsd-00000006iSw-3bDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:14:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294fDFb1588111
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=; b=eGjPs5sFBB0wJ6N9
	Qgb1n6C3mddLAUoAXZrlJV0qXQrnkB+d0SHAagrC6QLxPTAP1jQ/L8fHNo1F25rJ
	vSn1evrEH5SrKxHXmXuZ22JqN9mgfAsTZHxLd+2nbprN9Ifh9NzywkLZ1PultdM9
	iML8k7chYMsEPaGMd6Hnwqq+mRRLGAhzOy/toU7/kwUSoeXVHnZ+gziC5wXNteUs
	2EXhuMEeYa8uuXAGsVbL+ALU6J9utuXXG6N/y963hsHaqmnA0Zm42ggr9z6UHd9r
	txpa4LgTECDzWEI2ngIwsAEbg/XQb2y5JYyYjNXaZsmBBw4dvH4v+iCyYWRC4Hmd
	NSiP/w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy87f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 06:14:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21c6e2f5so22965117eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773036854; x=1773641654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=WILKpBxVH75gRmLfckScmzfb/B09nwJS4pZAWFmh2P4ONDA3ioDsCYRar3aow5b9OT
         OKLISgAve+UzlUEwCsrpghos6qVTXRfAOvk3CQs6F/vZgi82ir3ZZPE693RhuD2MqxNE
         hc86CdCAZGmJm4x9LVimTfZh9fN6jkqo6VeRvUFk6VVhIkKmUt1tenmWsSaeuHHOYOuV
         UHfFLMWYGS2GnUBb/iEfed/wAwLJLOqBoC/+xzZ4wlyTIMSqrHPtUbm4uOw7HGfePh75
         0XMVRD8QWMgaB6GZ4t6E5ec8QvXaSFde8B8no5YEaeUODJVApVeLUNpCLZ0bgiNcxQoZ
         xiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036854; x=1773641654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=aE/JtEFjUtl+QhpmF1bQSdm2GvH4Vk7C2PpEWDKKpxuE5Gjhmxynk3QKybwWc5kGY5
         IRbBqXy27W6H31z6nyy0evTTweYU5iRsbiBCBrAjjAxygpeuyExCgzEqj0eZxF7Fprve
         p5njJQCfYgHUUB6BWAnjJtmi+Jra2O+RPDh/oowxamZqDHjEiz9IyAFKo/CnpxskUfpF
         giKXRFxN9lGD0CzDCsquMeghVeoWatbGbSw2iACThK5nVvCfQIJI/Mp99/zy+XvLex3Z
         H5+D6Kqb8mfIZ8hI9S1H+VILHXTYUuWP9LcoImkKEn09nQdH7BSE4L1Z7ECQMajB+fdT
         lrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy+AdeZg3GlUf/29jQEZWAWWNR/OyvrnROxKlUWMRV4zUyggFcR3rx4VnwJzVKcXcTHbZNPQRFnq8Tz0yOFBY3@lists.infradead.org
X-Gm-Message-State: AOJu0YznFr0qyNaocfVZg+ukHgN9Nqe6HNV6oIUFvYcQdrZ2aZyDv0Qs
	aWJZiO8YVxWu4qW4tlZqLIJiThUOYbygvhwwSP7BQV1J6G5IOODhBwmolbkofsse+yQUAbEdDM+
	+yT5YqnGk2vpPp5v2DQAFPWbpNJETOaV8FVercbYJOH4GHgMKoPQwh5B6s5o7tqsXJg9ynxBJjT
	hpIg==
X-Gm-Gg: ATEYQzzEFrmGu4yn1N2gE9499meYnxN+Etzn3eLtkpKkCRvzikZF9fczXULtF5IUEs2
	GUKmOqB78TIUuvur9SuTsNz1NLajF1nfltt9sI24d3Nsk3MMpOvAmT+XpD8pRJtNslf2Q2FaUiG
	ySmGIzaUJ7AX58KhZPPsdX3gDXW4zy1g+hwMfMq5XFnWSqpn0ErJd4q01i+OqHdfhF1w8UWINep
	rt4Ts1WrT4zTcFIIBLGJc5OejqMnXCJ58vSV+yQqghZ6iegcS3Rlohew/jue06bBPlx7PBco1tR
	8BOxOG5Lv3X6AjK285FCDcF0dmfh0bVKjQNivZBatNUNg8eyEi9o/zuQO+2+0WYWDrmjvAWgvMn
	gJwhao4ITCBK6KJwPmep6NwnMwjqQ24WEU150d1jlEH2Mkf6FFhJU8+w=
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097408eec.20.1773036853755;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097377eec.20.1773036853215;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm7572370eec.6.2026.03.08.23.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:14:12 -0700 (PDT)
Message-ID: <f801cbc0-880f-4c36-ac71-a102d3a7ad73@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 23:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1NSBTYWx0ZWRfXwP3VM8lYzW8U
 +lbgwkGwH4/pt66Ac1a2aRTkR48zJ4eris8ZZt8AuIrKid8QF6vfR0x1TId8R4faMW6iQhziBzJ
 xFYbJ3xqjgQS99rG0gv9yVbBg3PfxOG9IyG6y1nqnXCmORE1n1a/+c8L+cep5UdhfiI1zF+xogt
 h2pXK2a1kNX87+zhZOGWfgrdRwRGAytlYEfRte0F0AKzlktKbqHH+ub6rB+U+AzlCupHNS8x6E6
 a+5EOH7Ul1i6qBnm8x5e26eNUKKksoZC9xCixyF6MHaWG0FP3p+n3bhobY088mpNIdwVlcCgrl6
 DGwn2liieWQYt1hXofc6MG1wR9+cn7jba+fZvvEJZpVG3PbB0IEKQRVBNte5glLEp57dLUlyin9
 oWRZqpvc8lXCWwjzMcV6cT3FdvkM5vJHYzudI6LuqqQrIl0RAsKMPzIJR63qRxKX+Q2co2iIg1F
 ajiQJay6PLKE29SmAIQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae6536 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_EeEMxcBAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=JfrnYn6hAAAA:8
 a=mpaa-ttXAAAA:8 a=1XWaLZrsAAAA:8 a=IpJZQVW2AAAA:8 a=rNfcLUUj_lrWDsM3rXQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: cZRbxfUfi-uzWIttKvkOGrSBHsTmGKwc
X-Proofpoint-GUID: cZRbxfUfi-uzWIttKvkOGrSBHsTmGKwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_231415_895063_9013969E 
X-CRM114-Status: GOOD (  23.33  )
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

On 3/8/2026 10:31 PM, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!
> 
> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>    - Testing the new macros with IMX timer drivers
>    - Converting existing drivers as examples
>    - Reviewing and testing patches
>    - Documentation
> 
> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.
> 
> BRs,
> Zhipeng

Please don't top post and something is wrong w/ your email fonts. Please fix. 

>> -----Original Message-----
>> From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Sent: 2026年3月9日 3:51
>> To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>> Cc: daniel.lezcano@linaro.org; tglx@kernel.org; shawnguo@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> matthias.bgg@gmail.com; angelogioacchino.delregno@collabora.com;
>> linux-kernel@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org;
>> chun-hung.wu@mediatek.com; walter.chang@mediatek.com;
>> jstultz@google.com; amergnat@baylibre.com; Aisheng Dong
>> <aisheng.dong@nxp.com>; Jindong Yue <jindong.yue@nxp.com>; Xuegang Liu
>> <xuegang.liu@nxp.com>; Greg Kroah-Hartman <gregkh@google.com>
>> Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
>> Convert timer-mediatek to a loadable module
>>
>> [You don't often get email from daniel.lezcano@oss.qualcomm.com. Learn
>> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> On 3/6/26 06:46, Zhipeng Wang wrote:
>>> Hi Daniel,
>>>
>>> Thank you for sharing your RFC patch. I think the approach is very
>>> interesting and addresses a real problem in the timer subsystem.
>>>
>>> For the MediaTek and IMX timer driver, I see a few considerations:
>>>
>>> 1. Current approach: My current patch uses the existing pattern
>>>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>>>     works, but I agree it's not ideal.
>>> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>>>     cleaner and allow us to use devm_ functions, which would be a
>>>     nice improvement.
>>> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>>>     early initialization on modern platforms (we have arch timers on
>>>     ARM64), so it would fit well with your
>> TIMER_OF_DECLARE_PLATFORM_DRIVER
>>>     macro (if you go with the two-macro approach).
>>>
>>> I'm very interested in your approach. May I ask what timeline you're
>>> considering for your patch series?
>>> The reason I ask is that we're working towards GKI support and I want
>>> to make sure I choose the right approach.
>>
>> Well, if you are willing to collaborate, we can start right now to think about it
>> and propose an unified solution
>>
>>
>>
>>
>>
> 


