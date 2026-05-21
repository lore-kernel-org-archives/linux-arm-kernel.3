Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A42CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=; b=X4Z0Y63kaObNEfYQDCwJRI6IsC
	iQPq8qLntCDTuEPbefxq2hQt/LGG8AmnQ+3Un3RqKEzafLXMHumXhEWwg/qmBf1LaQTiltckXislq
	0DACX9qs1bykVeakrKPVAJCNZFbVrwG4SmJG9ntW1eDozEXePk+Y3fa2MQyKPV/4l3gBXRaBi+Lg5
	JrtJJ9Umtdl4agyIZ2YCnG0vMpqD1siKSrb0wCc0F1nWdv742yoro9EXjH3bK+sMnuOAzhogXCx8V
	8DmF2x3SEANqkx4GRaFEw7RRb5XECj0ulZ/4zTOp16KXbC2zunI3iZyMdsHBfNerml3V3R1Omh0C/
	wLbaZKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1MU-00000007ZO0-3GA0;
	Thu, 21 May 2026 11:14:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1MR-00000007ZNJ-3VUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:14:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nJU3118945
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 11:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=; b=hTwfCwhl2SgL0Wi+
	/3yR49gIx/qT/qSo6EoxcIIlIv57BYlUishzWRZF2eeSUFTQ9ednQUI2SNub7Rip
	T8y3d+dzx811r0WU9fctsd+AMTU6lzMGur06QgZqwn9tqzM5iyx5FqAdg0nsSZSP
	MhCdyhaFj70KCut7YTkKuPahd09yU2wfkVBOhvyu6bqRja7ONA+/xoNqjFOSEtfJ
	K4ouj469BhQnYqSu2rmV298PfAp1TjXDDgrCvGvDQKq0V0NspZk0NE9hHm/tXDUh
	xSRLSb4NyGz6lwHIruHnMlxeHLptvtK3vsC3JUuUJl9uGvlqRQmCbVet4hTmMUD3
	FvhBPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962547-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 11:14:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso7401774a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362081; x=1779966881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=;
        b=A6s0Az16/SCOXOxrxQfmmrrHJIEhIzSq5048blyWnLpPhnGBfPuW4ihVV1emZXBd4N
         fqbGe2YUnHhqHCT/TiUAtUFyHav5jKOYo6xJ3VVUW1DpPbDc+TGRX0VVdOVuiYBijAGu
         QgVTFQNwUhUp9n+6anjV1NhlG7WWv/Nq1QcjRPw64aIlqli7TeHccW8WYTfy8OgTm5bu
         aZs5aKfkUPu1dKwmijEmFEcW+FB0hXN0Lh9OgYb/habiM8/rBmT3D1ejuuJ5aaVNwkEl
         U2vRkX3pxWSP3lCc3L0rl5VNnLnV5YueVc/XdA917Ayz6s41EBPh/4BlUyCTduWbZzqE
         eOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362081; x=1779966881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=;
        b=rYsN/WBHmUzhrf53eEZCwqlC/hv9iqFTDk5B0NK4M6zUkyVgcyaQn5HB4ZCTHeMdX6
         bQsK+gyRJDP59ISoT49XCMsvuW618oFQ7u1/1PVnnJH/Tc2Up0+2oErtZa3flHZOltpj
         5ybOc1LYjUxw2x8wW4fei78zTwFKScknbWoHgrN96TLSIZeP8euq44QF8ojwNnO014xT
         8SoBacJEChSPJ+tCwh/kS/5K0AUNDQW0CLDkT0RxpInaZRhVBhI/lcdM+12HiMSYCQgK
         RRgWBlM7b2v0N3qUdBqGpvAySJq2Vx6JETYJUETo/f0X/iCIIPgXRGJcloZ47Rh9Q4h9
         AwuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EQJtanNBAASIwnYAXDxEMgXWcOzYkVBkgk8oH7zsO1gu54LZuNHydmPOM/0FPgBkxrOPg7rFhjcaVlOQkVyrC@lists.infradead.org
X-Gm-Message-State: AOJu0YzsvOfaY5+6pVA3z9TWWC/n0hw33L7ASGWuyVM6z59IqXUdkVlD
	+JW8QGdLax6P7BYXqzdU3bFh7ldDADFNWyDi7aiaW352XZ55BIbdlW+B7mM46/bJ+Hfvynpr9l1
	Hr2F1vhL47dW/GPDvLJGxSJO9e3XcwijmK3aL0e/LLaRdYEiLDemLzZdTXFmBnKAwX4jJZJJu6J
	QyBg==
X-Gm-Gg: Acq92OGfSuciToBzSt63WWC+Bz6y9GSVLZ4QOeIFNUamkMbUJ9WxixF1WE6NKLcyrKx
	R0sBbcSloZHTE4F5R117q+0DdEr6iZ0HKemb2AHkCy5EM6yRSNJfQ+BnY1ohcF1GGfvzlFgh3ML
	CYeLJtERPhEsBE4nd4iYzUQdlYaUlBnCvY/bNSzK8OyJ/x2oSHEuyUIzDi3iMEt0+FL8Ic8R9Il
	Nsnm+B2hgY6Rzd3dasEk4SGSTyIj4sMu5c5Pakzi1dpjHMm+5QTotu69DuriugdK7YDglyImnsB
	K/9dwtaUC2bM0jMbbAWCAJePLZBI/x3OkV+fg5rIplkRvCc8Ivs21tKxu51aG2PgmLO4poVaNqz
	oYaBWJSOX2HjK8jdex/1Fo6C8xST5NVYt9Qtfm9XQfvmt56Q+4z8k+UxM
X-Received: by 2002:a17:90b:514b:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36a4575d7bemr2644415a91.25.1779362081598;
        Thu, 21 May 2026 04:14:41 -0700 (PDT)
X-Received: by 2002:a17:90b:514b:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36a4575d7bemr2644391a91.25.1779362081192;
        Thu, 21 May 2026 04:14:41 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5ae97051sm536922a91.0.2026.05.21.04.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:14:40 -0700 (PDT)
Message-ID: <ab96c900-9c77-455a-88f1-b6d8d8e4ff78@oss.qualcomm.com>
Date: Thu, 21 May 2026 16:44:27 +0530
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB6802FE8B0E0BEF8CDA6DAD5EE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q-wqSgrLiXEz6dnpqskSailqmv25lbSn
X-Proofpoint-GUID: Q-wqSgrLiXEz6dnpqskSailqmv25lbSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfX10azpgEFvkA4
 uzW4Gfpc4z9ZYt9f+a1buIwLDCl+YPXwaRbcuMGjDlmaE9HweLtwraMQc8TiaVM5iMxq8Rq1ngt
 tuTKWxF7fjWAn1F1jOpI1ODr9eZLEzwIJAx/6d4dcRT12E83FHX6Fyg76qwyczYBff+n2/2lBuG
 rX0+t5OMarNb++C1oS0kJVoJKTBpeQI4Dj0d3pgTMKIOzdX8IP28pQ9iZKArWrKsJOkF0MOOkBb
 NeYzqNi4czvZM/N2cs5mgV1N/987aUs1Cwu6LKB5Y7D7IVsZof2l8T6renR6eyBG/NBWMM2dDYM
 WWug0Mkwli5lzX2+0wbUbKVZMGyEQU427vJdhEElS4LPG0LI661Rjf61kLZWSo2E18w1Vpo0Qfb
 dyd5ePvn3sTh9qS0tnks1YDIqZ+CO8tgRsSk6Qzb11SaFn6X2L1xmwkgkuVtDC5F7S189exTZlj
 73gzvBKCOBubzJNHmbw==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ee922 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=5_mVXZLGvQfHWcJsArQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_041444_004025_32440D99 
X-CRM114-Status: GOOD (  26.09  )
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


On 5/21/2026 4:21 PM, Carlos Song (OSS) wrote:

[...]

>>>> -----Original Message-----
>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>> Sent: Thursday, May 21, 2026 3:40 PM
>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>;
>>>> o.rempel@pengutronix.de; kernel@pengutronix.de;
>>>> andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>>>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>>>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>>>> stable@vger.kernel.org
>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is
>>>> powered down
>>>>
>>>> Hi Carlos,
>>>>
>>>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>>>> From: Carlos Song <carlos.song@nxp.com>
>>>>>
>>>>> Mark the I2C adapter as suspended during system suspend to block
>>>>> further transfers, and resume it on system resume. This prevents
>>>>> potential hangs when the hardware is powered down but clients still
>>>>> attempt
>>>> I2C transfers.
>>>>>
>> what was the reason of this hang ? I was thinking you don't have interrupts
>> working when client requested transfer but adapter was suspended. Please
>> correct me if wrong.
>>
>> And it would be good to mention the actual problem and why/how it occurred.
>>>> Code changes looks fine to me but have comment on commit log.
>>>>
>>>> It seems, you are adding support of _noirq() callbacks to allow
>>>> transfers during suspend/resume noirq phase of PM.
>>>>
>>>> Would it make sense if you can write "Replace system PM callbacks
>>>> with noirq PM callbacks" OR "Allow transfers during _noirq phase of
>>>> the PM ops" instead of "mark I2C adapter when hardware is powered
>> down" ?
>>>>
>>>
>>> Hi,
>>>
>>> Thank you for your comments!
>>>
>>> But this patch is added is not for support noirq PM callback or transfer in noirq
>> phase.
>>>
>> Okay, may be actual problem description can help me.
>>> In fact, this fix is to mark the I2C adapter as suspended during
>>> system noirq suspend to block further transfers, and resume it on
>>> system noirq resume. This is to prohibit I2C device calling the I2C
>>> controller after the system noirq suspend and before noirq resume, because at
>> this time the I2C instance is powered off or the clock is disabled ... So I want to
>> keep current commit. How do you think?
>> completely Makes sense. Please help add how this problem occurred and why ?
>> So the change/fix will be good to understand against it.
> 
> Hi,
> 
> In some I.MX platform, some I2C devices will keep a work queue all time, the work queue will
> trigger I2C xfer every once in a while, but the work queue shouldn't be free in system suspend.
> 

work queue has transfers queued even if system is suspended ? IMO, the 
client i2c devices should not let system go to suspend.

> Within a very short time window, possibly from noirq_suspend to the system actually being suspended,
> or possibly from the system starting to resume to before noirq_resume, this work queue will trigger an
> I2C transfer, and at this time the I2C controller's clk and pinctrl have not yet been restored, reading and

Right, this kind of explains the problem to me. I think you are trying 
to serve i2c transfers when your resources(clk, pinctrl) are not turned 
ON and also interrupt remains disabled. And that's why you need to add 
_noir() PM callbacks supports along with IRQF_NO_SUSPEND | 
IRQF_EARLY_RESUME flags.

> writing I2C registers causes the system to hang. This patch make all I2C operations are performed in a safe
> hardware state.
> 
> Is it better if I add these comment to patch commit log?
>>>
if my latest comments makes sense against the issue, you may write 
accordingly. if i am wrong, then your explanation makes sense. Cause of 
the hang needs to be clearly mention int the commit log in your next patch.

>>> Carlos Song
>>
> 


