Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFE3C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMiW7sqD34b4TNQBhq97l+5YnGfknF/TWxv3ZfOpvHY=; b=E/F0fmOi+HLkYfLF6eRhLINknW
	kWIyMYQ/fJTBbpg6FPtrS/qDvZHT0Mrg9LGzKvbLgsYt8N8hOnY8Y0YmugQkxx1IJFbnXxiCj/yWS
	NHmcS6kcY2GDHgjCKLLs/EJv4VAvzPKwchpF2+vnRKVtTDBRRYjk1MtRLTKEwGKELpYwM2KxanxyO
	8zJ44SYFlgSxu9ntOasoQjblk4NRZzAp91mdSVJzzqnlWkBqziZduR+5JlBt51UULXq6bBr/jevRM
	B/V3mWmhe/SlGxP3XyomosZW+YmYLWEKQ1yMhYiqrZqzuHPs7LolYqqJukuzp4mq9l5v1VAtsw/ZP
	Y1pNP2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNTo-0000000HY7m-1U57;
	Thu, 16 Jul 2026 14:54:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNTl-0000000HY6f-3V6k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:54:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJuLU2721923
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMiW7sqD34b4TNQBhq97l+5YnGfknF/TWxv3ZfOpvHY=; b=CmPqJnh2Ev5SXPHD
	YhAJ5S0iuGBzDjU2SD2HtwDLxu9OCQwOhA/7DtRDAYQsRUpoiuiLOftHZi1+6WHF
	8w52i28BKgW6uCOqev1Q2xLkCLo8IsPKTqmoWH6d8PfgHml3P8NdDW5/SZjdSP2b
	AmQlxLMZ22u5/3PSfAwUJzRSNpkJWCUiQrc8r6qZT5YOzjEjXmIo9LQq+t4uB+Ro
	1fRjtrCYrtlZRasH/qz7kYpueMkLJ9Vs3v5YeDT5pe4Ws8gjJfmg6ZgVJXIkWeyF
	VJNZuCk9NlJrG53Px+i6gU2BUI4LKf4qYpc/B8/HJ9+NuscLmANMsdGdv3XL+UKl
	LQimrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvcf78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:54:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef31cd429so504576585a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213664; x=1784818464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMiW7sqD34b4TNQBhq97l+5YnGfknF/TWxv3ZfOpvHY=;
        b=SHvPqpGkTXhw/tfl+3Rmphwiywjk52Y/6U6Wigdz/0QwlbRzRv946Yvz07mnRPcBzD
         MfXpWRtoDHXySf52zBXLyUftmz78QAvsq9rykIK2GrPHKQm5sFNZaPcRi5tA+fK3NVVo
         vUfoppDbEnKcpABP8QjQ1KcuF04u8lAdMP8VkcZnHGkzRnLe6ZjP1gIpJhBRBHRvrC1E
         D+dVhO8bFbJw1RJ9aSmqiA+HgUNM4Gt2UQ4z6VRNeQ/mF75Zp4YJGZLp78EA2wRF5D0F
         KtpiEkPLzVypqbbKHb6kdD7zLou7tcrkA6FxnLqR+Hh3q3TOcd5B2OhBxg5IFYqhhljo
         +TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213664; x=1784818464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMiW7sqD34b4TNQBhq97l+5YnGfknF/TWxv3ZfOpvHY=;
        b=dj9kQGcasRO2X0LFOJUNHcWmN47v5tpxccqwEuf/RO0Lxk/O1wOQnzgD0NJJ6SrZT9
         NQmGRyKiYtuCiMIpEZiuje9eyZc1RwtQMfSgaPZKgnvI3DGDr2IpOumS3o2DInQr5HMH
         o30u+9pHma3crQN7bs+jTMiD8XQN8DbgZlviHGP5MUi2ms+lSO59HMXMzOjh/qE5YOwb
         j4E5eDacFsRB0oId4yCFHP7B+XBSVUlsVh3NkMU2byke1KA78Qg5nLgk6tsLrPBBEgin
         39A1iS5pjATUa3ilF5qnRekz6wDIA+CMR5pHrMihSl4yv3AZHYatVmHZZne0uAM0/AeW
         pauw==
X-Forwarded-Encrypted: i=1; AHgh+RqsbnJgFif4UHg4w4HjcCl0BhYct//mDQqSMJFJp/NcGVmi9J7fpgzn/LmKOUFJrTkGQoXFMUveCMzHNMaz4kul@lists.infradead.org
X-Gm-Message-State: AOJu0YyUnNIYrOHpWjdbkXIstk5FQ2G7S4LUkAW8yfE1RK4KnmuJE2KB
	YyRwkeNIKONbbSLNEe9NotKN39tv3/CX5q0H0OQxBMSBdST3yRdtls6zZVl6r36Z4kiX2wA2rsc
	zeaJzbyh3M1yeqfBmL97tbSTRsC5iDlPL4IOKernOK716BbQ+X0ApVdKhoG2Vz38QnSh3ozrqF2
	CO8A==
X-Gm-Gg: AfdE7ckIpdF41FP84mGN3RAdTOMUTHqt4+VXzJWlGT9J03pqZqeW7r0EQGigGunLtIV
	29BQvpmjSkoQfnCr5kGBzQD4XKw3+Uug3ad1ds/6lLetiHWZLq/PM2T0/RPELocIo3sp2JCPQLH
	maZOV1JvCQpqIrqe5ufcEvF+bkVSryo5ocXp+4muxZU89WaDuktUpnr01PR/Mfs2UUBHOFIC2XI
	m41AiVRbXQIyNVg/WBtnKf2Bh/P9Ov1DiHLmdqOWxKLxbiIL1ptBWvc1IQI4mZGPRnTGwaydetk
	nXrg4lQKDjXsXPAfwAkoXULarj96KO2zztu3POGrhmVwq7WHw8u+pvXKe2a/qm5u1Jwma4NSMSo
	8dgx/ng7dhePRxXld2HoK/EuCNVWlN2XgkZjI
X-Received: by 2002:a05:620a:a81a:b0:930:9c64:330 with SMTP id af79cd13be357-9309c641a57mr561573385a.87.1784213662532;
        Thu, 16 Jul 2026 07:54:22 -0700 (PDT)
X-Received: by 2002:a05:620a:a81a:b0:930:9c64:330 with SMTP id af79cd13be357-9309c641a57mr561569685a.87.1784213661884;
        Thu, 16 Jul 2026 07:54:21 -0700 (PDT)
Received: from [192.168.0.3] ([49.207.213.154])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cfdf6fsm2181794385a.24.2026.07.16.07.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:54:21 -0700 (PDT)
Message-ID: <e5eb39a9-54e9-4ace-a587-7b53e2bef511@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:24:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 7/9] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-7-f3f68c608f25@oss.qualcomm.com>
 <akWBtfG1j7-53fec@baldur>
 <ee407cbf-3476-4209-ad40-b381535b94ac@oss.qualcomm.com>
 <alfs7gOhE2D8wbVX@baldur>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <alfs7gOhE2D8wbVX@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58f0a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=S/f93LI4n8kOILjz9r/FGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bh7RdKFNfH2X48UuDvsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MyBTYWx0ZWRfX8rM3O0gfmMgo
 ca1zzGVkXFn4v6eOOtnkrMSFFSBc6EXnDnGa4ceylkh+liIYF3cE7vn8Zj5T6iOMa4KO0XxKxoF
 vZV8mP12NBpeK67re1/puFxpKQgc0O64x9mT0ZYkcTzKS3WmmMb/9PZR5RH+XuDoaLWJoY+7ehB
 JqHcM4wZYOK2aTEOltIRMNBHX43cA/JzeSDYFS5AgVXNmZfue9144u6OTBvAgLtNlslZQ6y52x7
 cgQ/4GOr3hdWOKHidht+gF2xyeL+upFIXf855jUI4efGmDg1uO8aZelc8uXYUrbXXnNz1RNwdsY
 PgUTG2fKLisDA7nyLbTwoFsrcIxxHRGqDe2ySqPeAFN0X+oha/1rVnTJzU49GubOmXyelx9nm2t
 fxERGx8XHbwu+3JS6ruN4Q4B6Y3VD7oEu6fvAKw2Zfd/SotBxeI3ITXwwWB8qx55rnRR8qmxu60
 d8gmiK2uHuYMSrkNS7A==
X-Proofpoint-GUID: KryLpkqBLmBGw-Q-LlVtM2nVqr7E_7f0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MyBTYWx0ZWRfX88T/1tfTTWyQ
 fJmvGlNB+teuaF99+rIs6nJhN5mJo8YRzJkHR0JE6mNzkWDGLXdxNdA7JZ6VKM+mVqPI8sf8sd2
 9iT4MabgdQxmnznzmWI7zvqDfu3bJEM=
X-Proofpoint-ORIG-GUID: KryLpkqBLmBGw-Q-LlVtM2nVqr7E_7f0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075425_894167_FEE94E50 
X-CRM114-Status: GOOD (  49.27  )
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



On 16-Jul-26 2:14 AM, Bjorn Andersson wrote:
> On Tue, Jul 14, 2026 at 01:14:23AM +0530, Pragnesh Papaniya wrote:
>>
>>
>> On 02-Jul-26 10:51 PM, Bjorn Andersson wrote:
>>> On Wed, Jun 10, 2026 at 02:21:34PM +0530, Pragnesh Papaniya wrote:
>>>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>
>>>> On Qualcomm Glymur, Mahua and X1E/X1P (Hamoa) SoCs, the memlat governor and
>>>> the mechanism to control the various caches and RAM is hosted on the CPU
>>>> Control Processor (CPUCP), and configuration and control of this governor
>>>> is exposed through the QCOM SCMI Generic Extension Protocol, addressed via
>>>> the "MEMLAT" algorithm string.
>>>>
>>>
>>> This explains that there's a bunch of functionality running on CPUCP and
>>> there's a "MEMLAT" string.
>>>
>>
>> CPUCP does all the real work: it samples CPU perf counters, computes IPM/stall,
>> and votes the DDR/LLCC/DDR_QOS buses on its own timer. The Linux driver only
>> pushes static configuration (freq maps, ceilings) once at probe and
>> starts/stops the CPUCP timer. I'll rewrite the message to say this plainly.
>>
> 
> Thank you, that was not clear from reading this patch.
> 
>>>> Introduce a devfreq SCMI client driver that uses the MEMLAT algorithm
>>>> string to detect memory-latency-bound workloads and control the
>>>> frequency/level of the memory buses (DDR, LLCC and DDR_QOS).
>>>
>>> You established that there's stuff running in the firmware, now we're
>>> introducing a client driver to control memory buses.
>>>
>>> But where did you explain how these two "facts" are related? Why is
>>> there a client driver, what is the actual distribution of roles in this
>>> dance?
>>>
>>
>> At runtime the driver is not in the control loop, CPUCP is. devfreq is used so
>> each bus shows up as a real device with trans_stat and the remote governor's
>> parameters like sample_ms and ipm_ceil are user-configurable. I'll make that
>> reasoning explicit in the commit text.
>>
> 
> Are you saying that there's no actual devfreq'ing going on, we just
> expose it through that framework in order to get the standardized
> metrics out of sysfs?
> 
> Or that and to perform the initial configuration and start the memlat
> logic? Does the firmware do memlat adjustments without this driver?
> 
> Please make sure that it's clear what role this driver has.
> 

Both. At probe the driver programs CPUCP with the per-SoC config (event maps,
freq maps, tuneables, min/max) and issues START; without this there is no
scaling, as the firmware ships no built-in config. After that CPUCP scales
autonomously and the kernel is not in the loop - devfreq is used only as remote
governor so the read-back shows up via trans_stat and the remote governor's
knobs are reachable from userspace. I'll state this in both the commit message
and the Kconfig help.

Attaching past discussions where community wanted devfreq driver for this:
https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/
https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/

> [..]
>>>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>>>> index 2caa87554914..98b5a50d3189 100644
>>>> --- a/drivers/devfreq/Kconfig
>>>> +++ b/drivers/devfreq/Kconfig
>>>> @@ -169,6 +169,19 @@ config ARM_SUN8I_A33_MBUS_DEVFREQ
>>>>  	  This adds the DEVFREQ driver for the MBUS controller in some
>>>>  	  Allwinner sun8i (A33 through H3) and sun50i (A64 and H5) SoCs.
>>>>  
>>>> +config SCMI_QCOM_MEMLAT_DEVFREQ
>>>> +	tristate "Qualcomm Technologies Inc. SCMI client driver"
>>>> +	depends on QCOM_SCMI_GENERIC_EXT || COMPILE_TEST
>>>> +	select DEVFREQ_GOV_REMOTE
>>>> +	help
>>>> +	  This driver uses the MEMLAT (memory latency) algorithm string
>>>
>>> Is "driver uses X algorithm string" idiomatic SCMI terms?
>>>
>>
>> No, "algorithm string" is an internal term. I'll drop the jargon and describe
>> it in plain SCMI vendor-protocol terms.
>>
> 
> In line with our discussion above, please make sure that the help text
> is helpful for someone to understand the purpose of the driver and help
> them make that y/m/n decision.
> 

Ack

>>>> +	  hosted on QCOM SCMI Vendor Protocol to detect memory latency
>>>> +	  workloads and control frequency/level of the various memory
>>>> +	  buses (DDR/LLCC/DDR_QOS).
>>>> +
>>>> +	  This driver defines/documents the parameter IDs used while configuring
>>>> +	  the memory buses.
>>>
>>> Imagine an person outside your team, sitting there in menuconfig
>>> wondering if they should enable this driver or not.
>>>
>>> There's a sentence in the middle ("control frequency/level of various
>>> memory buses" - that sounds like something I want. But "detect memory
>>> latency", is it just monitoring or does that part relate to the
>>> controlling part? "This driver defines" so what are those parameters
>>> used for, do I need some other driver for the control part? Is this last
>>> paragraph adding value to my understanding for that
>>> CONFIG_SCMI_QCOM_MEMLAT_DEVFREQ does?
>>>
>>
>> I'll rewrite it to say what you get (memory-bus scaling on these Qualcomm
>> SoCs), that CPUCP does the actual scaling, and that nothing else is required
>> to enable it. The parameter-ID paragraph will go.
>>
> 
> Sounds good. I'm a bit puzzled about it being a devfreq driver, but if
> you can explain the bigger picture, I think that will help to reason
> about it.
> 
> [..]
>>>> diff --git a/drivers/devfreq/scmi-qcom-memlat-cfg.h b/drivers/devfreq/scmi-qcom-memlat-cfg.h
>>>> new file mode 100644
>>>> index 000000000000..1ab8b61ea271
>>>> --- /dev/null
>>>> +++ b/drivers/devfreq/scmi-qcom-memlat-cfg.h
>>>
>>> Are the entities declared in this header file used by anything other
>>> than scmi-qcom-memlat-devfreq.c? If not why is it a separate header file?
>>>
>>
>> No, only scmi-qcom-memlat-devfreq.c uses it. I split it out just to keep the
>> large config tables out of the driver logic. Happy either way: do you prefer
>> I fold it back into the .c, or keep it as a header?
>>
> 
> Please move it into the c-file, move things around so that you have
> clear segments of "definitions", "configuration", "logic", and "driver
> boilerplate".
> 

Ack, will fold.

> [..]
>>>> +struct scmi_qcom_monitor_cfg {
>>>> +	const struct scmi_qcom_map_table *table;
>>>> +	const char *name;
>>>> +	u32 be_stall_floor;
>>>
>>> What is a "be stall floor"? Also, it seems to be 1 in all your cases. Is
>>> it boolean? Is it constant?
>>>
>>
>> It's a back-end-stall percentage threshold. It happens to be 1 in all current
>> configs (meaning almost any stall qualifies). I'll document it as a percent.
>>
> 
> back_end_stall_percentage is a bit log (and I'm not entirely sure that
> it is). Perhaps you can provide some kernel-doc and express what it is?
> 

CPUCP computes a per-CPU back-end-stall percentage (stall cycles / total
cycles) each sample window, and a CPU only contributes its frequency vote to
a monitor when that percentage is at or above be_stall_floor. So it gates a
CPU in or out of the monitor's scaling decision; 1 means "1% stall is enough",
i.e. effectively always in. I'll add kernel-doc on the struct spelling that
out (and the same for the other per-monitor fields).

> [..]
> 
>>>> +static const struct scmi_qcom_memory_cfg glymur_memory_cfg[] = {
>>>> +	{
>>>> +		.memory_type = MEMLAT_HW_DDR,
>>>> +		.name = "ddr",
>>>> +		.mem_table = glymur_ddr_table,
>>>> +		.num_opps = ARRAY_SIZE(glymur_ddr_table),
>>>> +		.grp_ev = glymur_ddr_grp_ev,
>>>> +		.monitor_cnt = 4,
>>>> +		.memory_range = { .min_freq = 547000, .max_freq = 4761000},
>>>> +		.monitor_cfg = (const struct scmi_qcom_monitor_cfg[]) {
>>>> +			{
>>>> +				.name = "mon_0",
>>>> +				.cpu_mask = 0x3f,
>>>> +				.ipm_ceil = 60000000,
>>>> +				.be_stall_floor = 1,
>>>> +				.table_len = 8,
>>>> +				.table = (const struct scmi_qcom_map_table[]) {
>>>> +					{ .cpu_freq = 960, .mem_freq = 547000 },
>>>> +					{ .cpu_freq = 1133, .mem_freq = 1353000 },
>>>> +					{ .cpu_freq = 1594, .mem_freq = 1555000 },
>>>> +					{ .cpu_freq = 1920, .mem_freq = 1708000 },
>>>> +					{ .cpu_freq = 2228, .mem_freq = 2736000 },
>>>> +					{ .cpu_freq = 2362, .mem_freq = 3187000 },
>>>> +					{ .cpu_freq = 2650, .mem_freq = 3686000 },
>>>> +					{ .cpu_freq = 2938, .mem_freq = 4761000 },
>>>
>>> Why are these tables hard coded in the driver? Are they constant?
>>>
>>
>> These tables can be either in DT (like in earlier re-spins of the series) or in
>> the driver. For the former to work well with the existing OPP framework, we
>> would need a clock provider created for DDR/LLCC/DDR-QOS just to derive the
>> cpufreq to memfreq map tables. Having it in the driver simplifies the overall
>> implementation. 
>>
> 
> But are there not different SKUs of these SoCs which need different
> tables? Information that we today would encode in e.g. OPP-tables in
> DeviceTree.
> 

2 things: we have added super-set of tables such that we can cover all SKUs. So
even in future let's say, any SKU is added: its cpu/mem frequency would be
between those min/max range.

We can define these tables in OPP DeviceTree like this:
memory0_monitor0_opp_table: opp-table {
  compatible = "operating-points-v2";

  opp-999000000 {
    opp-hz = /bits/ 64 <999000000 547000000>;
  };
where 999 MHz can be cpufreq and 547 MHz can be memfreq. For this, we'll need to
list two clocks one for the memory and the other for cpufreq which we currently
don't have. We also have no way to represent DDR_QoS in kernel DeviceTree.

>>>> +				}
>>>> +			},
> [..]
>>>> diff --git a/drivers/devfreq/scmi-qcom-memlat-devfreq.c b/drivers/devfreq/scmi-qcom-memlat-devfreq.c
> [..]
>>>> +	for (i = 0; i < info->memory_cnt; i++) {
>>>> +		struct scmi_qcom_memory_info *memory = info->memory[i];
>>>> +		struct platform_device *pdev = memory->pdev;
>>>> +		struct devfreq_dev_profile *profile = &memory->profile;
>>>> +
>>>> +		/* sampling time should be double the devfreq observing time */
>>>
>>> That's interesting, tell me more...
>>>
>>
>> This follows Lukasz's earlier point on Nyquist criterion: sample about 2x
>> faster than the changes you want to observe. CPUCP updates every
>> cpucp_sample_ms, so the devfreq poll runs at half that (sample_ms / 2) to
>> actually catch the transitions in trans_stat.
>>
> 
> While that's true for sampling in general, please make the comment
> explain why it's true in this case.
> 

Ack - CPUCP re-votes once per cpucp_sample_ms, so polling at half that period
observes each distinct vote before it can change again. I'll reword the comment
to say that instead of citing Nyquist.

Thanks,
Pragnesh

> Regards,
> Bjorn


