Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322D8CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e35ASpDbu+JzlJXy6vzQPsFHJsqGdEATPmzNaYDOTrk=; b=FUXV/espVEXY2I16H+WOrs4gWq
	sFfdK/fQRzlJwT9X7Y0dOMGoUBCqQlfAnssU1d6xJ/RBYxfEuItsnGa7AC20qyyfEGE9dPWwhSiCx
	7QfriPgkdoNBztWlzZrVC0QKSI4a2svgeSTIp2c35J0rotsAfPlbKA9cU7/O+WSXoHWK/g3Cn+WU8
	yCZPLbQlBUR4MxSYO4vXmDMOtDS1Hu4xAiOHM7XYoVT/B4XOF+aRu76s4uu9wvlhLrDKyLhXufnSG
	GdKwXDKAEQxMi4cSsaMn+JIAnRgMil8n1QgxwAfUxP5EMQLNukE6PAC/l0XME68pvjMX0+6e4Nuru
	4kjSGJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0SY-00000007Qjb-0i9O;
	Thu, 21 May 2026 10:16:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0SW-00000007QiZ-0icJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:16:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nLv3451416
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e35ASpDbu+JzlJXy6vzQPsFHJsqGdEATPmzNaYDOTrk=; b=n2KqCiRrOQrxLNGF
	XgBkFgRwHC2u1RPF5a/auykres/jpwRgCdtJtROt6BASxFvKYL+Qfhju5Dz6F6mF
	G+hfxCHv85g3xPYMaJxNlfXoH284Ofwj0oylvJc4GpMK42w4Ykbi3bMFumP3dGVn
	Of3qQ/AuuJXJ24iKJ65BPO3IerbeKQ8W6XZEqt0Y4INWvvdUnzOxXDCSS5NQP9yU
	YQ1/YFvSg+qAsf+bIwNfhsp+QmbuH/pux4UglorAuGH+3KDIOePVZTWhcKI3rWkU
	Bgd5ipAhxEfTGDhgXs+/b86rAa6+H9YyBoLagFfCMGxmomgpsus3+zWqvMYiQ/zc
	cpABdQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9y1h8awr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:16:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9429f49cso8978016b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358614; x=1779963414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e35ASpDbu+JzlJXy6vzQPsFHJsqGdEATPmzNaYDOTrk=;
        b=IOi1LUoqX3W9ZP2ld0BuzXdMISEm2BQlIGEDLFQSp4sA2UmcnF+L7OwVWUe9yMlwTQ
         ZXFNuhmZ+vWSieUPzqtF0XmY+9+LxPM76g+mqdjo/qG0OJJ1tlUgiM8jQ36azWUe6tAZ
         4PxU5E++n0bN1zMeCt3AdbHC6LQ/7Ye7zkzo/dOaJqA7bnL2iY7irxfRtQfnK7Py+aF3
         OznHzviMkdQSJCQUAMh9CaHsVk+g5e6LQfHrJsYNUAdarqd1LtlvI0EpGvkLxZS4KYsg
         YwLCGGWWlyD9OfVoqr4VYGyGy8vJGxZhUSP/0L+6QPJx/kgp9tv/HqiCZf0bZWs8i+65
         RyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358614; x=1779963414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e35ASpDbu+JzlJXy6vzQPsFHJsqGdEATPmzNaYDOTrk=;
        b=gTQp/FrtorVGEDowhdhR1FHBvWLkc0M2oHJnML0Npc26fIp5EUL0IhIx34gE4eR92s
         51SDNQfg2/GrM3nV1hOBW4F54wBtMDfJZaJyUeyIioTENo3E8zPHLwY/sZnSQ7VkdGAA
         TtZi0QrxsWWDI3gksOW4Hwp68VB9pholfCIeGUT1ZV3RXReIgY09EPGINP7ULdBBj0g/
         0CLh5FDJnGF5ggasWjnX2pFR6MaDqUBJQdJmIFtZ6nlexE+E4mAOoIfFO8M2tI8RqBJ0
         p+/nJpuutiZnM4OpwUNjMecrRoNQLCIQvYvFHw+Mhk6dhDFqDNjMpvxS5OqtcPdTvjDi
         Qxlw==
X-Forwarded-Encrypted: i=1; AFNElJ87Lxj5ZgEsTx66YmcxObn5OixebblQJVFehfQmxWGzNkirlYn4KOaiNNfqAisizb0VOpPthNK9jeVnC1DXPyNS@lists.infradead.org
X-Gm-Message-State: AOJu0YyWz1rjwo87ej2UaKIDfFQIA/O13Nn3KQyB+rK69e/eQ3/HOwYx
	0GktaiWSxG9FICbPNTx0m9K0JeF/+bz6m/0BhOauHh6u9E1R61T0hoIhj4cwcU2TpttpatmD+N8
	y96aIUMa0zbJH8hHPbpGaPBpJHq6QiZAjtOm1mTGFFKXMlFu09peVAz1UKyfthZ9HEvwE6vj2sP
	pVtQ==
X-Gm-Gg: Acq92OEnR1rBzpuEsiU9lds0nGRdGsZyncmY9C0WR9paINDs3Pb7pQ5Jt3ogzXiPO+g
	mkdhPEBkRZs9b1CxhRq/afzRIYGurRRi/8blkqWzv7YPOwqXf1u6dv4wzqlrMu4YxuyH0v19L+y
	qR428e3xHmQ5LYN7UeOKse0VT95hj6D5ZuNWPKKZvCTujGUF4AQYyJLHRhfKQOqiTVYjL69xtgJ
	m+Pxm1jDS3/MndBSIHGWmwtl7pv7b8PsN7Tb9uDHMfEygPronGlKZ8vJJ3Wnfq4VILUE1h5QlYe
	fowpIZhbpFQR2adZKFn/a9+5R6JkrYsWrKZC16gFnM2f7zh3rT8nFqpFB31KAW34kL+8vngBPzv
	bt0dC6S9oKomNm24aGyhL0vY4HWhYE+xyJPHrKPSCgHqg5p922ZujtZ3V
X-Received: by 2002:a05:6a00:330c:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-8414ae6e041mr2501843b3a.33.1779358614182;
        Thu, 21 May 2026 03:16:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:330c:b0:82f:390a:69c7 with SMTP id d2e1a72fcca58-8414ae6e041mr2501811b3a.33.1779358613617;
        Thu, 21 May 2026 03:16:53 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e3d6a7sm997070b3a.55.2026.05.21.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:16:53 -0700 (PDT)
Message-ID: <22af0378-a3c9-4403-a0ee-da794847f41d@oss.qualcomm.com>
Date: Thu, 21 May 2026 15:46:47 +0530
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB68027798D1B07FD63AEC5F23E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tn3Pg7XBv5eS9p5n43v2mV8jSZ9fC86H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMiBTYWx0ZWRfXz/vqm0XMWF5K
 WDqIxCBECNv1joGKVOFCJwtXcYv9M6jkqUeuXVOrzja/580aNupeBl1P63l932W3Zp59fwr02xa
 EIZQux9GReTsXZ1F2LJ7tHgYlry8jfgLahKmeQGx33zVGqeOnMg4xNiapvCThKtSjOZJINwyBsg
 MhQ7JpooGsFmHQOcI2/qYI/bzFuEyf4fpxk+e2BcEv/0jhSOnhlpfPlyrc9+1ZLmRgPPeww++Bj
 UD/qBOTn/Fqo56cuyTWX8IxItqO0dD7jqbtlmMmFI841vZSi66FJzX3R0MFWipwrWdBwT5t5+vq
 Oxz4ZS/ogSqgYlRSM6ZQpzBPwgTfLTV4v2Tsv4qsHHie6nCR4+Wkd8JWTq2VmTnBM6oho5Qvw7F
 fEa4POOtJsiZKFQmLosgAQUeLDbwMVmuHib8ITHiQ57w6WiGeQ+pQCXWdUYccCPpk7A4pjF6oNC
 nuRnyw7HgkiWVpOy1BQ==
X-Authority-Analysis: v=2.4 cv=YfyNIQRf c=1 sm=1 tr=0 ts=6a0edb97 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_EeEMxcBAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=yJUUZN2m8lq9mbh6i7kA:9 a=QEXdDO2ut3YA:10
 a=czjwGCTIUPoA:10 a=OpyuDcXvxspvyRM73sMx:22 a=ST-jHhOKWsTCqRlWije3:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: tn3Pg7XBv5eS9p5n43v2mV8jSZ9fC86H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_031656_342404_07F0043F 
X-CRM114-Status: GOOD (  24.61  )
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

On 5/21/2026 1:57 PM, Carlos Song (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Sent: Thursday, May 21, 2026 3:40 PM
>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>; o.rempel@pengutronix.de;
>> kernel@pengutronix.de; andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> stable@vger.kernel.org
>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
>> down
>>
>> [You don't often get email from mukesh.savaliya@oss.qualcomm.com. Learn
>> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hi Carlos,
>>
>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>> From: Carlos Song <carlos.song@nxp.com>
>>>
>>> Mark the I2C adapter as suspended during system suspend to block
>>> further transfers, and resume it on system resume. This prevents
>>> potential hangs when the hardware is powered down but clients still attempt
>> I2C transfers.
>>>
what was the reason of this hang ? I was thinking you don't have 
interrupts working when client requested transfer but adapter was 
suspended. Please correct me if wrong.

And it would be good to mention the actual problem and why/how it occurred.
>> Code changes looks fine to me but have comment on commit log.
>>
>> It seems, you are adding support of _noirq() callbacks to allow transfers during
>> suspend/resume noirq phase of PM.
>>
>> Would it make sense if you can write "Replace system PM callbacks with noirq
>> PM callbacks" OR "Allow transfers during _noirq phase of the PM ops" instead of
>> "mark I2C adapter when hardware is powered down" ?
>>
> 
> Hi,
> 
> Thank you for your comments!
> 
> But this patch is added is not for support noirq PM callback or transfer in noirq phase.
> 
Okay, may be actual problem description can help me.
> In fact, this fix is to mark the I2C adapter as suspended during system noirq suspend to block further
> transfers, and resume it on system noirq resume. This is to prohibit I2C device calling the I2C controller
> after the system noirq suspend and before noirq resume, because at this time the I2C instance is powered
> off or the clock is disabled ... So I want to keep current commit. How do you think?
completely Makes sense. Please help add how this problem occurred and 
why ? So the change/fix will be good to understand against it.
> 
> Carlos Song



