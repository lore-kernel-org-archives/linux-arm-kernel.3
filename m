Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=; b=yzNOwmX4KnPmnjcLIfohRQ6eDP
	Pk1OOer+bZ4S7RpLMkrywMoEn5smQ8l+jsop++DyJArOMQA/f1kvAvMNJBXuMsh7QStHlVsLoiCDR
	q60/B/WBgh03JXl/cR7MA0EJQwGqDZ4vsEh0C/yM9rV8oRMJbKluoaQ3pdkyNH9HiuHL9Vj5oRHjv
	FodI84BFCgbzgxh6WO+CbGhjVZITL/ljWydVEimmty+ttqJBLcC7s7mdlwOGqAfJ8+PJaIPTr/Bpk
	+K6hpDfmK1zFZeofjyZIT3YmYw+zMBNKppYYrvutq6J0nM5CAEgv6mkxoF7SUUfqvjgDgg7X5uMPn
	P6USdL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTPZ-0000000GEPs-1qXV;
	Tue, 30 Jun 2026 08:01:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTPX-0000000GEPN-0MNo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:01:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHEv1030621
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=; b=BmeaAAvrms5eqOmg
	W+Vm4pbG8ytGREDBf7XDsDVHNLsWl1UasWjr1y4eugEcs8IWbhO2z+GYX5TesBWd
	9cWRbuOHDncliYAH9kpgN1HHh42DviBt0pRQ4tGPsh33c4b/y4pG6+jv7XFF6Lr/
	uLr8vW7mImeRJjXGz7Krmhlef5u6XLYYmLp1GtpbzDJ62Kq6RqfPzUP66tHB4Dfw
	H8tX3PDkiR+kWbmHPVSJgwcMsNDCtOwbrsu72Ix6V+L+/GIa2MCUHZ5ydl4AP5dC
	+tQ8c2ZUeHq2VODRHDOzZjLoTvac9QYLVqlRnQ/s1x6KYPGSgxu0gelXmPDgSLIX
	mi4eLQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp180b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 08:01:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a483ea41so495664b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782806497; x=1783411297; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=TYw130ZqAzgUEVu4TLLwYdWsQrtwUz0bFVvewiqdYRbY+EaA6/tfRy6Iz+gj57zCEp
         buhqkn9XgPj8N7U9V+/2NjNUl4Ux8ZJRGm3FzrkVwKCssr8ff4P0qZ4czGBry+/WXBVs
         VQ+Jik0M9GhQ1RZ7r4c6WrcRTyw3l9D6kONRtiCH9X29iwu4FjXsEbmrb35Z5T2G+7B4
         e3vkegm5LviQ3PYcwf5w+BzARD3oNmuaGzPgcx7s/WW0gi/i9d3C+ecQYpkFJiI9B3wj
         SEiuOy0BSWckTot4XhtQK4DF6jq8dYUYb2lcyNCRhI5blRsL9/1FV1s3rAE53ZJLVrOK
         CYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806497; x=1783411297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IswBlb2AzqPmlcHDIkKH8P06/OkA5QrfAQpG7ms3Yg0=;
        b=DNY/q5m0xs4AQQlQWWiWs6BE9iwnwsO2UAtY6FgXKeWOkzTXTu+U7eFxwwTrIRmzDa
         5L6zdINOW/ZWbTarA6jsPG+7/UgDoRdo/oIFCOt06OFR/Q9iufmGH13F47RIPee/bmJR
         VkBkhM7x4kjHEavxKt9X75uHGdlcfATMPy1nvhslXgGgxeYP9tzwHfgsaWUKN7zHL6ak
         ZYh/GhBx/hawKu1/ATZKmPdcr1Gbxl+YRP7GecaqhhxwK2YARfgFJHOqcwOl3I7X/x3c
         gEEutdm4JjWWqwW+Sc9J0SyYpu9fwdN+Q43fsNViiPMzsy0xzKP8HQt08Dk1nyHO203O
         0zbg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DOfxwKOwYv8Fn2QZOv/xQyI5tz4lqLssq/yzngbHYF+ZoyjP/KT+Z+ddsJfzRVeWJriaILIV9w9mEHbW7cd2@lists.infradead.org
X-Gm-Message-State: AOJu0YxZtyElfw9AyYUSWPR03YEM/tZp2+A1/isWI3zMGcAwszfu5lGT
	8Jq56MbBJDqrMmsH1v4YHRSKz1P0ujXGLArCByc6HTy0/R4wmDiub4ycEyKkZxxPEcqUi6/Ylmw
	xfs9IdT6cs/ythq+JgInXWpic48m4/cKFPCR37JD06RG79xPlzeM7IW7SXxP2KxvtBkg+Mw1hNr
	Zr+Q==
X-Gm-Gg: AfdE7cm6zlVWhr07FX6q0RLtnPJycV/2Um/2EMyU5/rHPnRcHG+AVoGbb0aOut2KrUZ
	F8EUWckTVtk58ZwNEDZxlXTXSbagHJzlr71VQryFb/gtXesScTmNISEe9WJoi9QLWKkC7wSai68
	P86nZ/IFMAUSqlM0vHG+4etUA7J3CUUnnkcnq8fFrQoVngmUh/nAMRmBrcceyVm2pVjD/rAPl0b
	jeHavPlIbDxB/o9dPVIM4dchncOOxqW5NC6il9H88Nf0INnLyMG/zRgfK1usdF04eAVC4o9z2dw
	lPvHwdKrr3U2QZ6mFRNbLtIElD6izp+yzt91wF5B5H7oDfx1HumEGlU61JQVJfTNBeSIuhdrOx8
	6Wa6uFamnttteTqFNw4TOlkKU23xbhdpRqeK1FnpeNhB1QMOEO+aWpoXzdEOhB5PnII827oE5vH
	Di7wCen4Y=
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606111b3a.25.1782806497003;
        Tue, 30 Jun 2026 01:01:37 -0700 (PDT)
X-Received: by 2002:aa7:9307:0:b0:845:df5c:2567 with SMTP id d2e1a72fcca58-847a82501afmr606054b3a.25.1782806496280;
        Tue, 30 Jun 2026 01:01:36 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cd5c2sm1384983b3a.61.2026.06.30.01.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:01:35 -0700 (PDT)
Message-ID: <33ee63e5-c1df-47b6-bde1-4fe6b037878a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:01:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
 <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _HIvzpXvpo6sebfWN-0UU1QZOZYpEfDo
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a4377e1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=fWFuU9I0zHhLgkhYlfEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: _HIvzpXvpo6sebfWN-0UU1QZOZYpEfDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX8jkO13HAlzDJ
 Sgxa1yahqsRN23I0nSr+iNub5f7VlNlI/EfnaK11gCjk2nclnt/DMJogKDtd3BUlB+T4ab7Ujng
 Usqra+B51NBPEaeCrSIEYETbvugaBfxaeCYzHo8wyDIBAPIghoI/7akMxAoOtW6i0pCHITgaPAg
 wGZb2cfiT29HYsQtVSeJWIOBq/XalojhNcxAIR10Rji/AysSZVpHl/gUtikjIRdzIPNiV33RyB3
 Kcc9glRUrUsmXDjnA0zKHTbcfSN5WGxYZedivoj2mLRIWMZToaeAP8sXmqJm84VPpugx9JgX6U9
 iyn/3XrzOKXCS3XGx6W2rwyPkwBxIYuh/C+OSGQn4jCjnZVY6/f/wi+qMBqzlXWBI5b/pdKbOSe
 l7a+HQV/SPbkIjrLvOwudFWggmfhxLTQskVTK6lz5aSVQNfT4HbhxB4mytuAE1Vou0HpFtpulsE
 i1NTc0VPemvalcpwBzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OSBTYWx0ZWRfX+BvEgQhFzioA
 kFdsDCWj1SPHlWyaEEON7X2jvpFwlirgCDnIVtH/drlLd9eYxiqid6piSSCmlETpueTvMuTTfda
 Z0Eypc/t1TJDHzhEn8/wqaqCEGR6J3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_010139_130546_53DFD610 
X-CRM114-Status: GOOD (  27.69  )
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


On 6/29/2026 6:44 PM, Suzuki K Poulose wrote:
> Hello,
>
> On 29/06/2026 11:17, Songwei.Chai wrote:
>>
>> On 6/29/2026 12:22 PM, Greg KH wrote:
>>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>>> Hi Greg & Alexander,
>>>>
>>>> Apologies for interrupting again.
>>>>
>>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>>> design, I
>>>> would greatly appreciate it if you could kindly take some time to 
>>>> review
>>>> this at your earliest convenience.
>>> The merge window _just_ closed, please give us a chance to catch up.
>>>
>>> Also, why us?  Surely you have other reviewers for this code, right?
>>
>> Hi Greg,
>>
>> Understood, thanks for letting us know.
>>
>> Regarding your question: since this introduces a new 
>> drivers/hwtracing/ qcom directory, there is no existing maintainer 
>> for it.
>> Given your scope (and Alexander's), we believe you are the most 
>> relevant reviewers.
>>
>> The reason for creating the qcom directory is as follows:
>>
>> /We previously tried to upstream this driver under drivers/hwtracing/ 
>> coresight,/
>> /but it was not accepted as it is considered Qualcomm-specific and 
>> not tightly/
>> /coupled with the CoreSight subsystem. Based on this feedback, we are 
>
> Some clarification here: This device is not CoreSight  so we denied
> keeping this under drivers/hwtracing/coresight/ - Not because it is 
> Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
> subsystem, which are all Qualcomm specific for e.g.
>
> That said, there are other drivers in drivers/hwtracing/ which I usually
> merge and push to Greg, after some reviews/acks from the respective
> people (e.g., PTT HiSilicon PCIe Tune and Trace).
>
> But, your proposal was that there were other maintainers for your new 
> subtree and you were going to push this via ,linux-arm-msm ? to which I
> didn't have any objections.
>
> That said, I am fine with pushing this to Greg via the CoreSight pull
> requests (similar to Hisilicon PTT driver), but would need someone to
> Maintain/Review the driver (with entries in MAINTAINERS, similar to
> PTT).
>
>
> Thoughts ?
Hi Suzuki,

Thank you for your constructive feedback in helping us move this patch 
forward.
As the owner of this driver, together with Jie Gan (who has extensive 
review experience), we will be responsible for the maintenance and 
review going forward.
The MAINTAINERS update will be included in the next TGU release.

Feel free to share any additional comments.

Thanks,
Songwei
>
> Kind regards
> Suzuki
>
>
>
>> exploring/
>> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, 
>> to better/
>> /support this and future Qualcomm hwtracing drivers./
>>
>> More details can be found in “[PATCH v14 0/7] -- Why we are proposing 
>> this”.
>>
>> Thanks,
>> Songwei
>>
>>>
>>> thanks,
>>>
>>> greg k-h
>

