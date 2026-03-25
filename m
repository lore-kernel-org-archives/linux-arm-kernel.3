Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820BA109C028
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=; b=Nbm2mlWe5twM/1WFB0tf86YUc+
	XYauH0djwReKK2uXlhXXr/doII0lnyyDj9JEJ29+bh6HMGAoaCdqO4ktZP9P0BeXM3eDU+cJHy1WE
	+A9ZafVIZ0LkTHDY7KoMeaGSYPCogNo7eZXVnYpHg17O8gB0m62dcQSba3vxVy2DLpQJAsDua0pQz
	hPiIFgrLY5a53A7weqJS3C5OwHf4VBznSz5n1liCwUg+W/BGz5tEEo+ZGq33J5CyArVYbUThDdFnP
	WMyeSm3pweZM9sBcNdrLZ8jpl/qPuu8IBWdvTGJDFuMlNVJELXomtc4fauYhD9mlywuztyzWsUlgn
	t3+nZEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PRp-00000003dfH-3TMH;
	Wed, 25 Mar 2026 14:43:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PRn-00000003deb-0M6I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:43:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG11J720564
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 14:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=; b=ZSPYceDku93G02pJ
	38QmIYgjKMgLaWUr3wX6Mz9p/n5QhC0PobotkuTYjzgXZYk8QzhPmHE2YxmTsVcb
	E6yAw+qWfP5JtYXEQMV2qB5xzpJ6W9fU/Pt4vHK4u19gpdBBfUjzICi1DGpKJ3R1
	blBWd9FElOnkYA38TLgS3HzW95BEc5wOEexbfLpoLkvJJq+4iFRQpalWeGOwc0Og
	yeq1xJQ5IttxY5cfcRyoLeneokkAexuWxpttfQKbQ7js04S1m8u2GNcwMt9ThWiL
	NLaTCaVOnMMTdv+krTySvxWQq/sGGe4YNuV6q9Cehh2zEHz+dlMSE/9s+GWA6Qzn
	94HnJg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2ryd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 14:43:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so123555181cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774449781; x=1775054581; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=;
        b=htQ8t0RVQNj5/+rvXAYniy73fik0/LD1SABblx41dbLbkIyFZDkMWCCjP5QIPxOgo3
         a256wXk03EKtnbHaGKA5rc77YE9X89hT3wKn7JYPT5BcCdX1j0zeBbF/h22CsOGD8rs4
         KgEgaGnCwbOFSnnTGq6DrMTdzcF3VSSl94R6PZEUrRIQmwsfYqjXofcsabN5vnBklw9s
         AQM3L8yMAYV0qCKEFntRUjeC/zQT3B6dXx5HoMXkBP0aC9kTooJh8UTxJk+psu+l99gJ
         JUE1l+qyn+cI18N/ZolJbNoFBTxof7USz+noEZ+eZ5BCqrdFX4l/Di+26G9vJu6Ns0YZ
         3p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449781; x=1775054581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=;
        b=GDbVVr7Y/zUQtY2w4mTn6Zcb7iM122+QU2WzC7/fahez5j6XiSvsik0pbFetfbVQ4o
         6koziETuG5BYSb3eR3LsQvI2z0QJDW/0x2py7hETgEq5dg1YN7wCwjDoQOJsaESaInVf
         SDTNwpghABsyajNSqKFf/k1XIOrd0SdR+LOXqlRLG46NVXwMxZyhZ8ZQNKr8M2AJstan
         jUnQd0K2i4SCATL4gUB47kM5SbETyUZ2ndEAKKq7zPRJMQcC9ESPbHH+rGpf+YBAk2W/
         u055T7bmTqy3nNxqh6bbhXGUu7Qbk6h0L5ncD8o5j/VuLXxN44fLQZTNL5NQwJsrioVA
         3qBg==
X-Forwarded-Encrypted: i=1; AJvYcCVXEOBPMM+FobtKsyQuvq+7396CvxQmOmikwpiU0qWuTCFBB6gIISLkR70SATdARQ2uek1QTsjSAOk49SW5dAte@lists.infradead.org
X-Gm-Message-State: AOJu0YzrOemorCzL52A2akXZ+syMd8WchCX1peoYmdcit58ilYqmLnVO
	nZMgmNybZrd9lEUvtgIUO7qhZxZY+myhvq2I6iiHbGeluoq9K6REFL6L2MBSjg/9nKVOa4LoLHg
	ZO3L2sWgVERokR6RaSIok04A8In8J8pvatp7LPLYTZ9s42eyjs85xfxpbRWmepO0S1v5sZjmI0v
	jLEg==
X-Gm-Gg: ATEYQzxhzgi44T8EG+QOdQuo3EzT5vLAHAuYiWtJU74g/LT6uy8RTEbOcw3qLs8lgIP
	dmN4DGWBFSn2NPZP13hyoYHIgbcI0GgEnDGu7tiuGL8mV/s8TBiehicyYBJEpRjESVchQZpsU2u
	Bd6jZqo0ZwfkBg94CuFXva2QMFUcSNmel4tBRAbll+Akil3pp69jso5MayEA9vuJUjI3S7ve8M/
	B23dS0YofvUx4wtDhDCWEspYvZ6kFHum0m3cOcyktfzoeaWEk6MUnrfjSn3G93ClAteFgTAjyzA
	G419x4qq4G7vW1s5VMc+2mjkjHs6sXbZFl4iYUSOihNOozyDuokEDrUd/83T2AJFVXxK6wctz/G
	WD/mfbXK3avVPnLKEHmCqSBGaQ8XFjuF4hmpmc12KHTaRDN9rT6K6cp7t5GmPPm93LqFgJPAQqr
	Mr9/bIkKnn
X-Received: by 2002:a05:622a:1ba3:b0:50b:8c01:2100 with SMTP id d75a77b69052e-50b8c0126e5mr20402321cf.62.1774449780371;
        Wed, 25 Mar 2026 07:43:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:50b:8c01:2100 with SMTP id d75a77b69052e-50b8c0126e5mr20401581cf.62.1774449779680;
        Wed, 25 Mar 2026 07:42:59 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a7db:2283:19fe:fa8a? ([2a05:6e02:1041:c10:a7db:2283:19fe:fa8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee514sm163278995e9.13.2026.03.25.07.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:42:58 -0700 (PDT)
Message-ID: <28a09389-9fdf-49d8-84a6-4e68c40b5224@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 15:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
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
 <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
 <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwNSBTYWx0ZWRfXyPI/2PbFuaWB
 etb8D+SiumeAfUG8I0aenlsaUxdmUOShFkEcM9ZL/p7Cj2PHTGlPmWcyz6pk8E0qAOYBBb/43/j
 iS3qKsjEN5E/PU9QSCPwBSEz0FIm3VOnpGh77tz4NekwRRXugtODjfk1slI9Sv1i3qMxs4H7ON3
 afJXQmSN1bT0B76wquEyo+hDTgpQmTguMyPsotKAu0rh5reXgpbSh5Lca4rZUPhYwyjdPKP0S4q
 nMqy+KmZ5WSnYrUFkt9XuevDQbFSNysEA5yqrXM0jMZupM9D45uMw8FFkopk9M0MkLl8EwFl7UB
 sbgP3FivWW59KJv1htuaEFy6YLUaoXZ71jDci5yqxOL6WeocbAMV79Iv5193wwT2T/sLDvQ3sa6
 3V0HeqY98pnL8HI+hLNvv4bwLtnoHhJMQdQZF/0SdxelUMzYrWFX20ZU3RfZEPxhXqheTWyqiMQ
 CNDkcyKwRzLDMQT0o7A==
X-Proofpoint-GUID: R4HaBC6WMfvVmMgGAhANT8ZtWwZDEOlj
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3f475 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Zs_j8f1EyT6rY914oN0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: R4HaBC6WMfvVmMgGAhANT8ZtWwZDEOlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074303_170553_EF5D8E88 
X-CRM114-Status: GOOD (  24.66  )
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


Hi Zhipeng,

On 3/10/26 09:41, Zhipeng Wang wrote:
>>
>>
>> Hi Zhipeng,
>>
>> On 3/9/26 06:31, Zhipeng Wang wrote:
>>> Hello Daniel,
>>>
>>> I'd be very happy to collaborate on this!
>>
>> Great, let me see if I can cook a patch in the next days
>>
>>> My availability: I can dedicate time to work on this over the next few weeks.
>> I'm happy to help with:
>>>      - Testing the new macros with IMX timer drivers
>>>      - Converting existing drivers as examples
>>>      - Reviewing and testing patches
>>>      - Documentation
>>
>> That's awesome, thanks
>>
>>> My understanding is that, based on your RFC, we should use two macros —
>> TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.
>>
>> Yes, but also sort out the existing TIMER_OF_DECLARE macro vs MODULE in
>> order to prevent #ifdef MODULE in the drivers
>>
> Hi Daniel,
> 
> Yes, that's our goal.
> 
> I'll test the new macros (TIMER_OF_DECLARE_PLATFORM_DRIVER and
> TIMER_OF_DECLARE_EARLY_PLATFORM_DRIVER) with the IMX timer drivers
> once the patches are available.

I think I have an idea on how to achieve that. That will result in the 
removal of TIMER_OF_DECLARE() when all drivers will be changed to use 
the new macro.

The #ifdef MODULE macro is set when the driver is compiled as a module.

So we can do something like:

#ifdef MODULE

#define TIMER_OF_DECLARE_PDEV(name, compat, data, fn) \
         OF_DECLARE_1_RET(timer_pdev, name, compat, data, fn)


#else

#define TIMER_OF_DECLARE_PDEV(__name, compat, data, fn) \
         OF_DECLARE_1_RET(of_pdev_timer_match_table,
			__name, compat, data, fn)

static struct platform_driver __##__name##_timer_driver = {
         .probe = __##__name##_timer_probe,
         .driver = {
                 .name = name,
                 .of_match_table = of_pdev_timer_match_table,
         },
};
module_platform_driver(__##__name##_timer_driver);

#endif

So we deal with two tables, one for platform device non module and one 
module for modules.

The first one is called by the timer-of init routine. The other one is 
called by the probe function.

The drawback will be the match table will be common to all timer 
drivers. So probe will be a bit slower. May be there is an area of 
optimization here.


