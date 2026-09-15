Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756B3C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=; b=a9HxrI63uHVReuO3Vbg0a71wJl
	i6xpz/yLyDYk27jaYFIa5sjAsYeO9PkPfkOZna3XF25RMVt9MWccLtaXAvpFkTDS2cosXeGEhV8MT
	/wqR578siKXu2UeFP7Y4nNNs3gC6Pf+xrBNfcGiaplbs2s4JxMOSq7CDmljla/NoF+Sus6CJHJx86
	WxutNa8Y0a/usRS3LHs1XTg7gp3ez7PG4820WXvo67h6/vT5f/kujNhe+V2lwQ6/deYXKBXcRCQ4H
	mPeO40lX51phIn28RF7+rNC7eGzBCVEDIGZmijdoH+xOzMyZ/Zy4i3AGjp33OCflnY68b9Zn+YgmS
	J4PcY5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XMd-00000007fC0-35vv;
	Tue, 15 Sep 2026 17:54:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XMb-00000007fAi-3jl8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 17:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=; b=Uec9Tt5C+neDCnf7DjKGSL/cQe
	6t8pdciNtuuZt0Um6UAO9NOKiQomDHDihZLFEy63N+Z6BP/1002sA4CevZebZaeOqXRznye6lpyQ0
	p5yrsuIYPa9uWhqfnWy8CXKoo3ccnv11bY7JaGbl7RSI27nt7T53kT5cBGHxBX9is0rM5bMsgFB6u
	KXbKF7PSlr8XzXhvnZujML9tu6dE1doxhGlacqleiNVDnLhil13loMbtAraSvcpHkYcQ+y3ahDRz9
	FiCxW7mMDnXGfPE3qKpEuYI/V9GYjOwKq9FV8vMJm7PLQen/qGw3eiuGB9B0UZPcw4bdwE/MZaYhJ
	EV1uworA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6XMY-000000076zB-36ac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:54:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHoU543754915
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=; b=pu/ZXjEWueQEkxFn
	XvJs+PUx190FjwthFylFreyJFrrKuPIMCq2q7+rVORYQUDvK2ExhPinwx5Dnm2lm
	kuyMPnZdiumIBVgN9DBgzp4DXaR0uwOLZG5+0A7yFkBErBaPIDm6klfAzd4XL57m
	LXJ/Y8+VOf5ipfmuWF2cxvgd0XpYuy+4ILGoirJGNT5oskuA2gKoCl4+FuRuGiy+
	OHnrrptejOuBCLWSfVX4vvmCdVXSzJ9d/jU0H0pzk0AYwCzNupuQJxpOkd66IyoR
	2ZXecJT6vyTclA+TDig9c1OdzUsZ3ayuWlPYXrgy7L84C6k/XTfhNa/NPJHTzIu7
	lWEeXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n60ema-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 17:54:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso5435834a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789494869; x=1790099669; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=a2HJQlMswkLhWj0f8g9xD1++JFYcmUVGuIHnNAsa3XZgUQkWuF43ou7QHML/3hjVB2
         OgWyjgCMKo6z32LthnO6Nm4vnnp1ioGaoZ8FTFhEXTpq1KC4A00q4zpPvSIsUNhW8Hyu
         c8yXwhAm/WdbWOrEz99lYCE2A5Gf+uFU++mOnGMDgkXxtUz5vaof0LyXrp9vA6i+iL2r
         iPihLD+/RGGg83q6cztMtHx6+DWx4RHBIXyvtwGAt27r0gtN+OP5KMxXGHCwrKMOJ60A
         HhPTuXqwT7bb3A1j0+Kb2QhYAE6WrXD0qIx1FQsxW30on8TjH15Mpsgr1TpaimBzIOG3
         Hy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494869; x=1790099669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=nX8MP59BVgNz+3RAcH7/Jr3hMZor7iRDaJY1OLqOedQ4OKE7EcvbuLup/ufgXc34+v
         FrfdFe4xGOytCb8LjE4rHSYRw/5wLPIJcg7mmRe5lFgWj0D/XknfdNzlJxZXB45vq9bu
         ZBZ2rfmo51uBwUp235Rq/fkLCxcohykj+bmJzIGI1VVOP7TBqSmrIOM8AM/uJJsJgP/O
         Wu0sBRQakBmhw/x6mGBv9PkqPdtQUw/pdhKLDCLfeEtDrfZs+fWnoieAqzqBEbZ97xup
         MtG+LF5KFzOR2Zjas55s8CrV0aLrrSnAmkJ69em69z6P5mzBwVvnHNWllO+bobCofo6e
         pjxw==
X-Forwarded-Encrypted: i=1; AKwUvBx4xuPWatfkvK+lne2RK1i1eXCfnzfew8bGW4lWTUQoKFo1InNROAO6ymgxUi+15Ng9HAQkynoliPRbJPY9CBMI@lists.infradead.org
X-Gm-Message-State: AFuF++mu1bF1aSLOo88HbItPhZljFxKWSLvxeytHU6tllT/RLiD6lMYB
	GO8BOCcWUdthlMaSaqvD2mattIN4rIUG1El648aJr9RgTvKVLPl1svC0hckNaNE2q5JowJ7ivrm
	7jnTvW0qLeQc5dOvFjcG1Qt86eKE13M6g0QZeBK/uIu7kSPRXnHBsLey+vyikbuebdmNMdfqSbF
	fXmA==
X-Gm-Gg: AYBFou3hKNQ2ydEEK9gDQPelmixcItEIPTwAighSDTQ8qkGWqBDZN5E+41m2rrmwi54
	faSSyiqowjiIe78UuXKEC8OZqf2wd5hkEto6ga0GaAd+XCFOnaIOhcJU42W9dCF+sWeYQGR1LHz
	ATcFYf1RcoFnjRKlGvKmg/K1bGvbS6EBjOjC8Ed+f0Z1fpgwAWZ4yDna2MSfM8WmBU/JreKEDlR
	7gODz6NBSO3+htpWM/VlJN0lujjXzhYmY3K/yt/LNktIVAqPef/SCYkAQSVGtw+YwttvB7tkw/P
	MsDTF7dRkFZpHzXuJfm7zw9gu2bjbdHWE/L/+L0Sf37kR/ZyFV7Fih+NXG2dXMxZ7Vl0u8tCZPK
	V2ZvjQYgQSCO2VEg3obvyFor3fXd0yFqWYmnzB3N9EvcOog==
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218080a91.25.1789494869073;
        Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218025a91.25.1789494868480;
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Received: from [10.177.238.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm306945c88.8.2026.09.15.10.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Message-ID: <362574de-c709-4e78-9b88-4bc4e0dd7c7d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:54:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
 <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
 <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa98655 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8qBNkTY05YfpeKCp1UkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfX8w5vCVoVIx9f
 gknXKseWu3HPv8GrA4c7SzYnkG3g5vP0cFRW1YZ084tOXbYjeu8jb7AdtEO7NuQ9o1/t+h5S1PV
 qKjUDYhCgCkN3HO3W5gn+UcFOB/HTV6ry4fJ76tlbijGezDTraqYpO7jQ75J4UMFnksJi9r5jSW
 CdfStbPxzjOVKwphFzLHK9+bk/PzHItc07+R6qTw3MWbG7yL0Q7Fg1P3pyVvPTh1d5e0YqBIcKq
 HfVQZdIwd65qQFV9RtSvmZtcE/yM7mrmMlPqfWBeI4ml4WIIQPjA68+NVv92+g885C0VrsojACh
 t0n0Zkh0jTyBfbu/LCfUACYu7BykxWHlyqEla1P085O85Bt+Ma5XyoS68Rg7drm29TVAoNdzJVb
 xCaUiDuj3FLNJQElNctbwjKssqIdFNOPA+ivH0BFjhHnBWHCiBMxkZPkpeiZXnBKF6P8+AjclxA
 vqkJEAEP+s0JBhJbiFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfX1X8s3+x0lMpo
 75ZQFHj/ID2zAX5mjPUkgWu/51V0RkrwNCXWhRnNXp1BQhi2BWq/E5CKAvZ41qTaHhLPY/56Po7
 kheQNHFAPKubVqORYlKAzPrmdi0ra/Y=
X-Proofpoint-GUID: cGdtp2LJXSbGBgAQDCdDcSUNm4-EyYoS
X-Proofpoint-ORIG-GUID: cGdtp2LJXSbGBgAQDCdDcSUNm4-EyYoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_185435_188204_65E133EC 
X-CRM114-Status: GOOD (  15.51  )
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

On 9/7/2026 1:53 AM, Sudeep Holla wrote:

> On Fri, Aug 14, 2026 at 05:05:27PM -0700, Alex Tran wrote:
>>> Hi Alex,
>>>
>>> I gave it a go at this series on an emulated setup and with these
>>> changes I get:
>>>
>>> root@deb-guest:~# modprobe pinctrl-scmi
>>> [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
>>> [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
>>>
>>> ...not debugged any further.
>>>
>>> Thanks,
>>> Cristian
>> Hi Cristian,
>>
>> I've tested this series on sa8797p hardware and did not experience any issues
>> with registering functions during probe. Can you provide me with the pin
>> topology of your emulated setup? I have a hunch that the topology may
>> contain a function with 0 groups which is why -EINVAL is being returned.
>> The previous pinctrl_scmi_get_function_groups callback considered a function
>> with no groups invalid.
> I found couple of feedback from sashiko valid, can you take a look at all the
> comments there[1] ?

Hi Sudeep,

Sure, I'll address all the relevant comments from the feedback and send in a revised version once ready.

BR,
Alex


