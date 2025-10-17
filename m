Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E81CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6I4YOibOxnI0AMuF9jQqhBPQ7jDc9rITl8QqtHTs9g=; b=W44tDy5//GEV3QK0Va5S8TmqXa
	bLcHAO2Ia0HNCTxezgYGWDmJ6EsQEqYv0HZ51kNs0JrXZTDSlGZVAMLchgX7DF3DQlya9lS981G0h
	nlpkc/QG2YPMaVm+PtcfKZJni/haPMCEXYvfDlb0ThYhmT8o7hO+2sgNE2dGqgtbq8ZSLfSOyZ2bo
	59CoGOKG4rbqUbs7BSWDvkf6UzjQji85AGnvso9GHQNhXBSL49zQ7JUnwL18sP9rs0KuZT2iq07Vj
	eIAkX0AuiNDzOOSP1xK7GsZAcBz+A2dIBFEN+fpGK8tY98DPF/0nPf3WJ+wH8PkXOZ2ZYZH3UlJCU
	lVKCEtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lOW-000000084gT-1ROD;
	Fri, 17 Oct 2025 14:25:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lOT-000000084fV-2DSw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:25:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7lCJL022178
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 14:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6I4YOibOxnI0AMuF9jQqhBPQ7jDc9rITl8QqtHTs9g=; b=V9pErdmIvPeRmzT8
	Fo9QxijlwjOsM/Tl3rHj8cXNaN4ElNURNUB9PNqCurg1wp6PgVRfhZoMOh7ohSB9
	ciz518YlXJjgB5jyj/bWOor02A7aQZurvS4YTPzsY+r9Tu5oczy2q/3xPZctY/1C
	adSCpm9pQU5xAdbuQ8OG2AA5q5QUap0EHmo8sRIMS8e/2vDSe2I3MChYFMbnrRcj
	0pW9Hhl4u2oyBu7QkDidC/eNg5kHGvSBRe5sTWqA2uHy2tD0eazWN+vf0kullEVu
	BYihnVk2HjBjeIWuO+d8aV57ns5OsDa6Pj4EF6gDuLaxQcPyG2K634F4fFPM3N33
	iWbU0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrthg3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 14:25:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc49so3311691a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760711112; x=1761315912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6I4YOibOxnI0AMuF9jQqhBPQ7jDc9rITl8QqtHTs9g=;
        b=iEBaKDpLXkf2VBDtq05FB3+cdxlRYmIv1oDFYKOxiJV+fX3BNJv/aS6uFNva69HBwf
         JhhPnIffzTShpDmHTs/XK28yOrhx2SwG29D3flfwa9385s9ji5Ak0bJ88dSZDTYdkfZa
         ID95Y/yULAjrp9B3MHNxIVwy1C3xAP1ZyXD0x1mXRDfikqOZWh0BakJEhSx3+tDEvahW
         cMlPlUWQ9A+ji2lHjO0/8sgwP1TB988Nn56kGh6duuSxPULiw/loz0J5JYkcbeCSTizK
         Q7a8Iv5WZ7Ant0M5+6Iw2axcE2un3NAZ3AEhskNwRxNdvlil/7rd038+PzScrVj2xeYc
         hWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhrTyApD1y4JMsdgDVjw28Xdrg1bUOj3WFEcJkv1+wm3pJJz2OcJkEdBlmGWhCQ2LNsP/Rwg62pExDwMN27yKv@lists.infradead.org
X-Gm-Message-State: AOJu0YwYkl6XnVreGFe02XfZ8D++0OfDkRyGmJSC3NtxvAaO/trC5xqM
	X7wz7yImVVkFoz7gYkhVJ79CIQ1+jBUN5D6YTTjyfKSPLUWswviPrjuX6U7Ep5RMhKISwbHyqOt
	8c/yT378Ja8EJ26AYzIKlWuQgz5I8nBSLDSp2BV8XmBI+Dr5gWz5GSDW0wiV6GSkLjh4/CghFHY
	askw==
X-Gm-Gg: ASbGncsGmXNisTJo4ZjxMUcTgT1hxmZ8+tB6j+jTwFlTsD9Lcco1/3i6XxeYxJshvoV
	nt0BSNSZ3OQ7ym1ne4eNDVgNSMb+4UG0jfBtrc0dmVITTG4uNTimkE99vnPJAKz1El/B/498Q46
	CSqpLBsNasZ2nUdz7joRF3BOYB2rP5N33HrHA+4kS6hU4s/mcmb8+oVXe7bxgu9X7WRPjz0RSdh
	kdXc2AEnge3kwUaYp9mNAWZWbWOpEIFAoyi6EWwysN7xLq0P/SJKNjYtDH9a/6SnNW9jevXIyf6
	QFQCClox4BliBEc7fB/jgGB4MZYNid7Rz4xGbjD5vDkFM68CgpWaYm3sNnoZz33Ouvpiaab03ac
	uGRnkjM8R9eI4rtzC9x1zw9LRBIG21csAKA==
X-Received: by 2002:a17:90a:d004:b0:32b:94a2:b0c4 with SMTP id 98e67ed59e1d1-33b9e2925e2mr10031259a91.16.1760711112026;
        Fri, 17 Oct 2025 07:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpzi1hN1yMdY6cSIJhZZaWyqTeCWz6N72ovTz031iQmmVMeTy7gJVlncPuK2idTupafEuVXw==
X-Received: by 2002:a17:90a:d004:b0:32b:94a2:b0c4 with SMTP id 98e67ed59e1d1-33b9e2925e2mr10031171a91.16.1760711111346;
        Fri, 17 Oct 2025 07:25:11 -0700 (PDT)
Received: from [10.216.52.245] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd79b344dsm3149510a91.3.2025.10.17.07.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 07:25:10 -0700 (PDT)
Message-ID: <0683413c-b447-8e3e-8bfd-3edce5a0e14f@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 19:54:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSesvTLe28Jz83b=zfHD2rvmf7-i_2+2DoV=dgooVqFEYbA@mail.gmail.com>
 <fa42adf0-8f15-ad4c-3788-578b1bee1c72@oss.qualcomm.com>
 <CACMJSesxazA7Nf6sAhUT16KfwtiUNjvb5JOEWkEb1B5fJtihMQ@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSesxazA7Nf6sAhUT16KfwtiUNjvb5JOEWkEb1B5fJtihMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aO6NXMHme_JM1ueWuE06RErIWmBmQeLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX3gO8vtX0NBwK
 WKvdToOVzxePcPommR6e9HFd5gik8rvebkJ3vMkr1sBdE/46CblM41K1mWidumWBx4MW3PW+ixT
 GkTeX8U9r8/2RUIctWlyEkW5ZoJsH3h5VKLJ00BGi1dUiNRuLqKpVSse2Z4J4aWcaCpjrjrnJtn
 T8k8bi9BY7gqNJhxtK+pwLIDV4jRH/RNrEmm0HADMeHGS/szhh3QZLvGjNcyNnIZzVb1U4U/Yl/
 wouguT0U2TwUNmXrUyaOpggk25+HzAXLUWS8rgQiPA8Vf3ivhvAznC/xu/MRfiW+ha4sErtCMgV
 Qo8V1e+A1BAP4AxSsq56VjoYLvmrJO6aLowxAMqLVGwU8mDqV65GJ7A90GEMQLDQhHcZKK5toUX
 VSZVXXOcDShByy3A69TF/e25pEBYYw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f251d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9sdP-RPgOja0Ng7vnc8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aO6NXMHme_JM1ueWuE06RErIWmBmQeLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_072521_719334_C2A91904 
X-CRM114-Status: GOOD (  23.95  )
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



On 10/17/2025 2:36 PM, Bartosz Golaszewski wrote:
> On Thu, 16 Oct 2025 at 19:19, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>> -                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>>>
>>> This change is good - devres should not be used in subsystem library
>>> code, only in drivers - but it doesn't seem to belong here, can you
>>> please separate it out and make it backportable?
>>
>> sure. Just to confirm we should separate out the devm_kzalloc part of the
>> change and add a fixes tag.
>>
> 
> And preferably put it first in the series to avoid conflicts.

Ack.

> 
>>>> @@ -123,8 +136,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>>>                 return 0;
>>>>
>>>>  error:
>>>> -               list_for_each_entry(info, &reboot->head, list)
>>>> +               list_for_each_entry_safe(info, next, &reboot->head, list) {
>>>> +                       list_del(&info->list);
>>>
>>> Same here, not deleting the entries currently seems like a bug? Do we
>>> depend on the driver detach to clean up the resources on failure?
>>
>> sure, so this should also go as fixes? and should we remove the other
>> dev_err(printk) also as fixes? or that can still got with the change
>> where we add fwnode based registration?
>>
> 
> It doesn't seem to be strictly required by current code as the users
> use it "correctly" but if the API becomes used in different ways - for
> instance the structure may be reused after failure - it's a good idea
> to backport it. In general we should undo everything we did in the
> same function if we fail at some point.

sure. will update it.

thanks,
Shivendra

