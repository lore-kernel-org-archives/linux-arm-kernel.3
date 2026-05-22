Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51E3CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=; b=qbo22GBo0PcKWcBOEIkdhWjhbh
	j9L6gpQiwTvLYS7wyWMtvo4J8fhXz6ma9sXwpJelxi3OTozZ71EE+rOuXmudps/RVhk47zHOMrw2v
	Yz79jfbzmi9Drmwjm3u6vZn2u8ykh9cQ7S9iIGPf709SsRxJHc7uw9/YtEpHG/ldqnNW8n/foX4wR
	uhnqb0k/8XWeX+KTobbe1hDDro1nd4NNJAFb8whaiMPbf/DDTGureZ7+IXayOrtH+HTENjUYO7fHd
	NAHMS5hiWlUSViXsyIBaY35NLLz/Thh/LTE6DRJqtDJeUlLMbTp6Jy9k5bu73aSJkHbOrpX8g/hP3
	n0sI7YrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKBE-0000000A414-2uVG;
	Fri, 22 May 2026 07:20:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKBC-0000000A40T-0oLd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:20:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6swJS1297937
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 07:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=; b=fj1Gj80Zd3Xzg5Hy
	6VXT9nMwdgI19YGqTzLas9P9tZk1JGBbxWrNJ/3HIfD/2girwPx9+K9lQAT3ZxAT
	+1TELcUT7UuI1pxxwiut3okMvTCTN+Vtcgk1g8iokVtcEw02lB6ETE1Y9SUr6y6K
	Bc8FrTeczZQdIv1duxQO+W4+m/hKVlEbIHJnn6jHzP5BiOo6rIzbCwFW7CQi81P6
	+UP08ZawsbgiOPTQJF2EbBzkUeGQkwvOsyyQ5wrExDDiYcNguf4vpLFacCN7hqxl
	TcNz+vpsqDAPR8CJlLmQdUqChISoXFKKJM9EHViTgQfYSdInlh7pF1LvmNUxaOJJ
	ytDjdw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09kma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 07:20:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so4001270a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779434421; x=1780039221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=;
        b=MJu3pyX3N4UBb3yzerQ0KgbWOKBttkHojgoV5L+Y2Nw6Vbl4U8K0GAkgOG/LWJaFX8
         SHwKGETlySwpj7YavPY0xR3IUJe7nZRqqEPdBxf803erNr5oMVhy6x/q8bMBr4CdVga6
         05h5mPys4GXgBcbcOVIyiwP8jIvU2NRsLKG+9kK4XOdp8FIAZ0f5iWw1lYkk+mZnZTlk
         H+jLb5Bt3LmIxH5nOVh6HexAylwZ0PtG8GndxmV6Hc8uOto2RYy4y3xy6ZGb8nfZYabw
         BxsFEZ+DjLJCLHxXD4bIXZ/TCvDaz5Lxx9l5037lx0xD1eBN3HtZ9e1DRU/o33Pv3vuy
         jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434421; x=1780039221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=;
        b=Fdyuhi5+N6lxr6P53VmfeWra28MQ8X1L5n6SLkpOu4f1v5thXKk7WFOtxqlAlT/Lbo
         gH2enNOxZFJbqxzzDK2D8aA0FurgztJH/0WCRdwGEttsXO1+Uqy4LFkwa8c/aez8lYsz
         cVUGFalrnLmU+3hRMTlt8L6G1SB/pN/a6Ky8zCgrdcri0MO3PGzObj/q2P3fcr3gC73F
         1icBhcNDYG0ZALAlN1IMoYm+0uujpToZMlq5apGpy/nS8AXZ3/L8UJhw5IrYXEth3GvI
         eK3ygD1larF+d4GrclfXjCZdFm5SZ6EzyJ2omDOSMsin4ATzwh08ETILLxrzaFXGRdpr
         s9FA==
X-Forwarded-Encrypted: i=1; AFNElJ9ooMG6weXOdgQNUgMUWMyp4TcbkjF5oluyhNHDE9201jv9tNSq2nkWkr/KJb7cR+Apecwdvgp3qpPX4eXCHuyj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzml9czDCW0nQgSkks9lw8j+TVlAhpaVbJvyblA3I5dcw2l+4mN
	9miqIbMeaUpQEEqf2UT6KmqvEhPTOmOfzGjpwixcYJRrr40utv5QXiOjxSU5rFYBmz8JbCGFPIK
	Scx49NONcPtoUG6JTZuvJoI17GgGhmqkyHyF8pAlIjRnyN5EerXVY3+GBgUo6ogHN1nSzmZBh1m
	jUNA==
X-Gm-Gg: Acq92OEiYqlOWbm8/R+eKc7UbEBCoqMFUGIBUmJ7qs6GUSACryLAJcsFLSY9JsYuLkq
	oI3zqWH/ImfV4vsU16KM+PtGBt4oy4taEWiOPN6Gayp4JKrrqMFPDK6q+0NzUp2dd3VFvbfv02f
	aF3n6jGDD+lk1w+uA++A2krDQVRiFJ41ExYX/oyOt035gAP8+Tregslaf31/T0KAT/UNXC1mGDo
	KI+ZNBDELCUwqLxhMahGM+sc5I0YcKY0T5eG24Yh3kxkYNfLHIBCalk6W6g/D/aymcugAs0gHIi
	2eBqYDT8lgLUnRn9WS7CyvvMNnFgZppflZ3gMXCfYRt+U84qsNVFv6SHjk5rnBUzgRcXY2W7hSx
	VcTH5nTH04YoNzX4fuMB+MJXkqxNjyu82w+ygnG4nIpNhoDo/TRQOzB7V
X-Received: by 2002:a05:6a21:4d8d:b0:3a2:d68d:9e83 with SMTP id adf61e73a8af0-3b328c0f502mr2643990637.5.1779434420635;
        Fri, 22 May 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8d:b0:3a2:d68d:9e83 with SMTP id adf61e73a8af0-3b328c0f502mr2643961637.5.1779434420115;
        Fri, 22 May 2026 00:20:20 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85205616bdsm707529a12.23.2026.05.22.00.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:20:19 -0700 (PDT)
Message-ID: <a0941899-bf27-4551-b23d-37d7f99a3519@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>,
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
 <315029cc-f04c-4dad-a746-f5d3e7245cdc@oss.qualcomm.com>
 <AM0PR04MB68026A6412B8F844D1324B92E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB68026A6412B8F844D1324B92E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3MSBTYWx0ZWRfXyLUBwfC5Mbn5
 ww3ddVlEfQyBj0Mka88ifkqxAOuFNKV33WvNIDZ0ImdI3wZKssqULf119BL7EizgKl6C6YJuLt+
 9HbESVl1Q+0Ay3/Ja3QidWl3eRoCbm2854IYjzb4QVveO76gtd9deKZL/R9I2DCKdr3xjCXH+EL
 /FW+3GJ/ZLzEykY2ORUbzsWcZ41jX38xHIb11ToKQhWcrGXor3FXR44BG9XiFGdi1UI3xr7DdZY
 x5npZIj1x+hwyZJ88L9bn8HRx2f89Gl0w5UghaboJ5zJbYlXlWwx0oXkV7y2E/Bwxzb1SnTv5EF
 YeH0VtjFZrLU2Xov+6T+pcxC6ra8H23Fnir74Zc+xPM+d+uoEde5tTmZ8RPYSE326XfMES8Lkvr
 8kevSmsNuk5kNNBy1hOoybFtistg/ORLMWvpQtJWx6jiJdppzYK7Ok99DQu17n2H9Aj+fnA4fG/
 RLzh+YTjn0cAS2sqzqQ==
X-Proofpoint-GUID: 9MBV1RxJPEBVEAKVZ8oyi5vOd8QLsZmD
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a1003b5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=2UpP72-WgONIwjLJxC0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 9MBV1RxJPEBVEAKVZ8oyi5vOd8QLsZmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_002022_250954_D323EE3D 
X-CRM114-Status: GOOD (  30.45  )
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

Thanks Carlos !

On 5/21/2026 8:19 PM, Carlos Song (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Sent: Thursday, May 21, 2026 8:40 PM
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
>>
>> On 5/21/2026 5:32 PM, Carlos Song (OSS) wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>> Sent: Thursday, May 21, 2026 7:14 PM
>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>; Mukesh Savaliya
>>>> <mukesh.savaliya@oss.qualcomm.com>; o.rempel@pengutronix.de;
>>>> kernel@pengutronix.de; andi.shyti@kernel.org; Frank Li
>>>> <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
>>>> Carlos Song <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>>>> stable@vger.kernel.org
>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is
>>>> powered down
>>>>
>>>>
>>>> On 5/21/2026 4:21 PM, Carlos Song (OSS) wrote:
>>>>
>>>> [...]
>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>>>>>> Sent: Thursday, May 21, 2026 3:40 PM
>>>>>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>;
>>>>>>>> o.rempel@pengutronix.de; kernel@pengutronix.de;
>>>>>>>> andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>>>>>>>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>>>>>>>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>>>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>>>>>> linux-arm-kernel@lists.infradead.org;
>>>>>>>> linux-kernel@vger.kernel.org; stable@vger.kernel.org
>>>>>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware
>>>>>>>> is powered down
>>>>>>>>
>>>>>>>> Hi Carlos,
>>>>>>>>
>>>>>>>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>>>>>>>> From: Carlos Song <carlos.song@nxp.com>
>>>>>>>>>
>>>>>>>>> Mark the I2C adapter as suspended during system suspend to block
>>>>>>>>> further transfers, and resume it on system resume. This prevents
>>>>>>>>> potential hangs when the hardware is powered down but clients
>>>>>>>>> still attempt
>>>>>>>> I2C transfers.
>>>>>>>>>
>>>>>> what was the reason of this hang ? I was thinking you don't have
>>>>>> interrupts working when client requested transfer but adapter was
>>>>>> suspended. Please correct me if wrong.
>>>>>>
>>>>>> And it would be good to mention the actual problem and why/how it
>>>> occurred.
>>>>>>>> Code changes looks fine to me but have comment on commit log.
>>>>>>>>
>>>>>>>> It seems, you are adding support of _noirq() callbacks to allow
>>>>>>>> transfers during suspend/resume noirq phase of PM.
>>>>>>>>
>>>>>>>> Would it make sense if you can write "Replace system PM callbacks
>>>>>>>> with noirq PM callbacks" OR "Allow transfers during _noirq phase
>>>>>>>> of the PM ops" instead of "mark I2C adapter when hardware is
>>>>>>>> powered
>>>>>> down" ?
>>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Thank you for your comments!
>>>>>>>
>>>>>>> But this patch is added is not for support noirq PM callback or
>>>>>>> transfer in noirq
>>>>>> phase.
>>>>>>>
>>>>>> Okay, may be actual problem description can help me.
>>>>>>> In fact, this fix is to mark the I2C adapter as suspended during
>>>>>>> system noirq suspend to block further transfers, and resume it on
>>>>>>> system noirq resume. This is to prohibit I2C device calling the
>>>>>>> I2C controller after the system noirq suspend and before noirq
>>>>>>> resume, because at
>>>>>> this time the I2C instance is powered off or the clock is disabled
>>>>>> ... So I want to keep current commit. How do you think?
>>>>>> completely Makes sense. Please help add how this problem occurred
>>>>>> and
>>>> why ?
>>>>>> So the change/fix will be good to understand against it.
>>>>>
>>>>> Hi,
>>>>>
>>>>> In some I.MX platform, some I2C devices will keep a work queue all
>>>>> time, the work queue will trigger I2C xfer every once in a while,
>>>>> but the work
>>>> queue shouldn't be free in system suspend.
>>>>>
>>>>
>>>> work queue has transfers queued even if system is suspended ? IMO,
>>>> the client i2c devices should not let system go to suspend.
>>>>
>>>
>>> Hi Mukesh,
>>>
>>> Thank you for the detailed discussion.
>>>
>>> Yes, I totally agree that I2C client drivers should ideally stop
>>> issuing transfers when the system is suspending.
>>>
>>> However, in practice there are many different I2C clients, and not all
>>> of them strictly adhere to this requirement. Some clients may still
>>> trigger transfers through workqueues or deferred contexts during the
>>> suspend/resume window.
>>>
>>> Therefore, adding this protection at the I2C controller side helps to
>>> avoid unexpected accesses when the hardware resources are unavailable,
>>> making the system more robust.
>>>
>>
>> Agreed !
>>
>>>>> Within a very short time window, possibly from noirq_suspend to the
>>>>> system actually being suspended, or possibly from the system
>>>>> starting to resume to before noirq_resume, this work queue will
>>>>> trigger an I2C transfer, and at this time the I2C controller's clk
>>>>> and pinctrl have not yet been restored, reading and
>>>>
>>>> Right, this kind of explains the problem to me. I think you are
>>>> trying to serve i2c transfers when your resources(clk, pinctrl) are
>>>> not turned ON and also interrupt remains disabled. And that's why you
>>>> need to add
>>>> _noir() PM callbacks supports along with IRQF_NO_SUSPEND |
>>>> IRQF_EARLY_RESUME flags.
>>>>
>>>>> writing I2C registers causes the system to hang. This patch make all
>>>>> I2C operations are performed in a safe hardware state.
>>>>>
>>>>> Is it better if I add these comment to patch commit log?
>>>>>>>
>>>> if my latest comments makes sense against the issue, you may write
>>>> accordingly. if i am wrong, then your explanation makes sense. Cause
>>>> of the hang needs to be clearly mention int the commit log in your next
>> patch.
>>>>
>>>
>>> Based on our discussion, I have updated the commit log as below:
>>>
>>> On some i.MX platforms, certain I2C client drivers keep a periodic
>>> workqueue which continues to trigger I2C transfers.
>>>
>>> During system suspend/resume, there exists a time window between:
>>>     - noirq_suspend and full suspend
>>>     - resume start and noirq_resume
>>
>> - noirq_resume and resume start [Just opposite ?]
>>
> 
> Sorry, the expression is ambiguous.
> 
> I will update the commit log to:
> 
> During system suspend/resume, there exists a time window between:
>    - suspend_noirq and the system entering suspend
>    - the system starting to resume and resume_noirq
> 
> Does this look good to you?
Yes, looks good.
> 
>>>
>>> In this window, the I2C controller resources such as clock and pinctrl
>>> may already be disabled or not yet restored.
>>>
>>> If a workqueue triggers an I2C transfer in this period, the driver
>>> attempts to access I2C registers while the hardware resources are
>>> unavailable, which may lead to system hang.
>>>
>>> Mark the I2C adapter as suspended during noirq suspend and block new
>>> transfers until resume, ensuring that I2C transfers are only issued
>>> when hardware resources are available.
>>>
>>> Does this look good to you?
>>>
>> Looks good, Thanks !
>>
>>>>>>
>>>>>
>>>
> 


