Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3372ACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES2YYruuxFojMvF/pOHGFCJl2UiLVHd+mZIVueL/Tzs=; b=RdlHiTyZxygMEBb9/cper79iRD
	5QdcgG946is+Vt5KYrdv1kzDJX6sH0c/U7/xNf9TXeVW/GogwlTeI2F1ja3bOltHv+amenbzV/1rd
	P5no6nqUXJ6u5KFmgggZ+WfFM9Ln0uvjYYZH0m14lurCUDUW06M1nUFhuhG5mmkhptsix3R4xaGXx
	KLQcTSwfFIqtQ/zlfXosUBb6kwU0vGvikPhEJWWLmATHL25bemNPIwfYERyPM9AQEwngZS52ytdRR
	uUUHMNixLqdg51Mp1v8XkSdHolrT0yAGtYuDeNfRydTHfWgdezXHc1PQ059XfPkrtxtKsZal4FdHo
	zO8NRYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2h2-00000007kRx-19Kf;
	Thu, 21 May 2026 12:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2gz-00000007kRV-2aAz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:40:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kTf3343458
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ES2YYruuxFojMvF/pOHGFCJl2UiLVHd+mZIVueL/Tzs=; b=HWeVFYMj4PEPy+2a
	2Hzq4NalWUT/Twjbj35kS7uC1uIFTltZplcQgTb8C39PiRZ5kfNguz37s+q9OpfQ
	q7c7vvosyM6mO5n8mPh2i/DZdu9QL3vvVmPxJOrWYpzWtY8l86vZBUmQndvKwPDL
	mH+pW7LAUPCl3Cc0KXUbSju3987w6uMptiYEUFbtHXQArPcgPwYcCkJ6p3JQJfGZ
	mHUbBUO7N0WFwHuL8EctNwZgIVygHqIuX4H71ghjmi0c07ktAGkL1JKTeavC1MOz
	xwO3mTr5F7YeKwwu7T4wERma+X6dIW6xdcKrfLmQvGAwhtlSYvqE0GgfBlp3Pnp1
	dIbsSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahsany-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:40:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so45198645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779367199; x=1779971999; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES2YYruuxFojMvF/pOHGFCJl2UiLVHd+mZIVueL/Tzs=;
        b=cw3nm+BGpftvGTtq4jkcVOEDp+Nwl7x5nG9uZF4wp54RVEMyFLPMi2zSrC5zPiB+4B
         zBtqNmH+GmzqeocXaZxH574bhCkUjoGjNHociwgO9eE94Z6kwoLpi2+8IEwwEXVwTcyb
         8XImJw8AYi6bzir7i8IQbvuX0XOweZvSIEGDbwMshXjBuiPgdMAJ/NnNz6IAAX4CwfV3
         mU91awfWCZpEUKzhFbn+/SZeqj0XhlbKkpcz98V0tiUmpya/2j5DPzLU5C5UZ8nDXgWx
         gOMXgM4Y5SixDKkKS2QJP6u/y2Qi5aIjbjZ1kB0cfm5RYQlLHwWUv0wCxN26hH7Fc6yY
         HWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367199; x=1779971999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ES2YYruuxFojMvF/pOHGFCJl2UiLVHd+mZIVueL/Tzs=;
        b=gE2ZHbpy+lOVyOdSCl6iVwP9P0Prdlbt3dwh/3Qiok9NSD/DUMrtBVDS600mrAkZRC
         NWlynZlQF7AbbUWxV+NomHRQp6wXfbgA5fvv/kah0/mpXA635u5yFQGbaIv09TLvCY8w
         OWBnoMLjz4mK/21vgsxE6czyeYwYX2VdJzPUIE/o6MSC+JLV8gU6LN3r650KmxnuzM5l
         oEbCIsDFlE4wIhwRjJG5vlTfo5hpYtswVcvUrNg1WeXINUhxvgRWwpkDUc0bGh7gx+2x
         6tkkqiNVfWdqJaRD+u9PJtYoVIFfzqCfEXJDA2U5tKo5M1cvpelsQxCEYRQKFm9Pyyo8
         sVOA==
X-Forwarded-Encrypted: i=1; AFNElJ/iT9OyAPNwxcKj9fCmLwnSQknYekpNIOVS99ch1bDsLf3/5i4QaXipmiQCt5JU8MME7V/RC/q10QREVIfMEsns@lists.infradead.org
X-Gm-Message-State: AOJu0YzOZ+xdVyW8zDMtcNAIkZKAjpiYkjL5E96dvKyXHz49YWNgyg88
	4Ea5prkKKC1+KyDGsGPSSoOQU2gcBjs3/PHKUQtdXOMIQ7Q2jgH6S+Amw4hg9SrmrOV4hGlC6wi
	eJAQS7suP/DHuUWRLfkx9hKBToH4wyWtke3GzLVvev2skUGn8dyYmkovHFrvNFmuG0b/kxP+m2x
	y3kA==
X-Gm-Gg: Acq92OE35vgSywMOJcwo237IWPTwEfBVU6Re1+Ku+aLEztR3ymc2yRL+0FrJgqMitMx
	CXIt1kugipYPp4g6Iqa9RwpW/D+dLyJFOM15nn9wAv3AdGKyTvf1XOjN99d1lcRXCYl0zEexA9X
	9Elk3XMaNeqZViTfrWgDZ2geQZcNQbs+BnKwoE7L5IrenPEb+zEZ/kv8Hv4Gpt/t5jNzjUpfdcb
	KuCHc2X36DxdSDH25HO8V7Xf31V+8Yz939W0KH9j/ke7B9Qrhi69LxoqR++EswwzkEUOck/8U0y
	d1x9028CQnmyw6yz6OHrR2Lvbs4/WTdZLEAzQIUiSCx3Owo0FJnDFuPb5U401+E9VhT4+hyEWJy
	WYz4UfWbvqAczzg9OU0HKbu7BfF7jMEM+RzTwX84MLndEQ+NgRgYXSjW0
X-Received: by 2002:a17:902:fc50:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2bea2641874mr28014375ad.14.1779367199275;
        Thu, 21 May 2026 05:39:59 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2bea2641874mr28013965ad.14.1779367198767;
        Thu, 21 May 2026 05:39:58 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9289e05sm10418955ad.27.2026.05.21.05.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:39:58 -0700 (PDT)
Message-ID: <315029cc-f04c-4dad-a746-f5d3e7245cdc@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:09:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Frank Li
 <frank.li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Carlos Song
 <carlos.song@nxp.com>, Bough Chen <haibo.chen@nxp.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
 <4979e748-ce4e-4244-8906-e22a1e6472e7@oss.qualcomm.com>
 <AM0PR04MB68027798D1B07FD63AEC5F23E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <22af0378-a3c9-4403-a0ee-da794847f41d@oss.qualcomm.com>
 <AM0PR04MB6802FE8B0E0BEF8CDA6DAD5EE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <ab96c900-9c77-455a-88f1-b6d8d8e4ff78@oss.qualcomm.com>
 <AM0PR04MB68024A0FAF0637726C08B87BE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB68024A0FAF0637726C08B87BE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX/FwKLFg8sneq
 xsnjfiO8Wi6EfvCtm1ZzdH/lciZoV5SQyxCjxR6yJkqFLQ9yjMsPm7Qq549UwZ3DQ1P+q8L06CB
 m4ZDj5S/H7+crDdhSxLUsomh9igc7DDCjoVnUhIr6NyaBV+DsrlcggsEsnq5wQyit05U2jW89WS
 uDfVuKRKUQq6TKV80hFMf/d2Ui7JRQ4f9BTv5H7/uf70ONSBPTCA3YoRS7Z2nT2FLkrTUUv2q9U
 JD3iWUpxIUp7j7Q/t0kuPRwid3W+muOqitvrcuxP643hQUM+jOFHqZhzOpimJO/8Q8W0WJI8gh7
 zfRbAA3aseT20UmOX5M3fvHVZUqbxLDxFZsLR+r4ZIvwKNy9Tb6DPFwrJP+AIn6BBiBIUQQD7bf
 eibiTPqQLN7hkgIH4zaMkgVVQutbo3ZpsxTbFR8bJknzirLNP5RcgLmbumAeo+8TDF6iFDTQdUp
 UzmHL1b5EbpWSV/TJcQ==
X-Proofpoint-ORIG-GUID: 9uWw0UxLhB01_iQRPWFtMXnn1JaHBenI
X-Proofpoint-GUID: 9uWw0UxLhB01_iQRPWFtMXnn1JaHBenI
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0efd20 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=2tUGZl6TGnhxom4q2uIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_054001_781761_D88B2A22 
X-CRM114-Status: GOOD (  38.92  )
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



On 5/21/2026 5:32 PM, Carlos Song (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Sent: Thursday, May 21, 2026 7:14 PM
>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>; Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com>; o.rempel@pengutronix.de;
>> kernel@pengutronix.de; andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> stable@vger.kernel.org
>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
>> down
>>
>>
>> On 5/21/2026 4:21 PM, Carlos Song (OSS) wrote:
>>
>> [...]
>>
>>>>>> -----Original Message-----
>>>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>>>> Sent: Thursday, May 21, 2026 3:40 PM
>>>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>;
>>>>>> o.rempel@pengutronix.de; kernel@pengutronix.de;
>>>>>> andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>>>>>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>>>>>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>>>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>>>>>> stable@vger.kernel.org
>>>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is
>>>>>> powered down
>>>>>>
>>>>>> Hi Carlos,
>>>>>>
>>>>>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>>>>>> From: Carlos Song <carlos.song@nxp.com>
>>>>>>>
>>>>>>> Mark the I2C adapter as suspended during system suspend to block
>>>>>>> further transfers, and resume it on system resume. This prevents
>>>>>>> potential hangs when the hardware is powered down but clients
>>>>>>> still attempt
>>>>>> I2C transfers.
>>>>>>>
>>>> what was the reason of this hang ? I was thinking you don't have
>>>> interrupts working when client requested transfer but adapter was
>>>> suspended. Please correct me if wrong.
>>>>
>>>> And it would be good to mention the actual problem and why/how it
>> occurred.
>>>>>> Code changes looks fine to me but have comment on commit log.
>>>>>>
>>>>>> It seems, you are adding support of _noirq() callbacks to allow
>>>>>> transfers during suspend/resume noirq phase of PM.
>>>>>>
>>>>>> Would it make sense if you can write "Replace system PM callbacks
>>>>>> with noirq PM callbacks" OR "Allow transfers during _noirq phase of
>>>>>> the PM ops" instead of "mark I2C adapter when hardware is powered
>>>> down" ?
>>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> Thank you for your comments!
>>>>>
>>>>> But this patch is added is not for support noirq PM callback or
>>>>> transfer in noirq
>>>> phase.
>>>>>
>>>> Okay, may be actual problem description can help me.
>>>>> In fact, this fix is to mark the I2C adapter as suspended during
>>>>> system noirq suspend to block further transfers, and resume it on
>>>>> system noirq resume. This is to prohibit I2C device calling the I2C
>>>>> controller after the system noirq suspend and before noirq resume,
>>>>> because at
>>>> this time the I2C instance is powered off or the clock is disabled
>>>> ... So I want to keep current commit. How do you think?
>>>> completely Makes sense. Please help add how this problem occurred and
>> why ?
>>>> So the change/fix will be good to understand against it.
>>>
>>> Hi,
>>>
>>> In some I.MX platform, some I2C devices will keep a work queue all
>>> time, the work queue will trigger I2C xfer every once in a while, but the work
>> queue shouldn't be free in system suspend.
>>>
>>
>> work queue has transfers queued even if system is suspended ? IMO, the client
>> i2c devices should not let system go to suspend.
>>
> 
> Hi Mukesh,
> 
> Thank you for the detailed discussion.
> 
> Yes, I totally agree that I2C client drivers should ideally stop
> issuing transfers when the system is suspending.
> 
> However, in practice there are many different I2C clients, and not all
> of them strictly adhere to this requirement. Some clients may still
> trigger transfers through workqueues or deferred contexts during the
> suspend/resume window.
> 
> Therefore, adding this protection at the I2C controller side helps to
> avoid unexpected accesses when the hardware resources are unavailable,
> making the system more robust.
> 

Agreed !

>>> Within a very short time window, possibly from noirq_suspend to the
>>> system actually being suspended, or possibly from the system starting
>>> to resume to before noirq_resume, this work queue will trigger an I2C
>>> transfer, and at this time the I2C controller's clk and pinctrl have
>>> not yet been restored, reading and
>>
>> Right, this kind of explains the problem to me. I think you are trying to serve
>> i2c transfers when your resources(clk, pinctrl) are not turned ON and also
>> interrupt remains disabled. And that's why you need to add
>> _noir() PM callbacks supports along with IRQF_NO_SUSPEND |
>> IRQF_EARLY_RESUME flags.
>>
>>> writing I2C registers causes the system to hang. This patch make all
>>> I2C operations are performed in a safe hardware state.
>>>
>>> Is it better if I add these comment to patch commit log?
>>>>>
>> if my latest comments makes sense against the issue, you may write
>> accordingly. if i am wrong, then your explanation makes sense. Cause of the
>> hang needs to be clearly mention int the commit log in your next patch.
>>
> 
> Based on our discussion, I have updated the commit log as below:
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>    - noirq_suspend and full suspend
>    - resume start and noirq_resume

- noirq_resume and resume start [Just opposite ?]

> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Does this look good to you?
>
Looks good, Thanks !

>>>>
>>>
> 


