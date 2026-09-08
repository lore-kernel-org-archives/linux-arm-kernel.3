Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82143C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=; b=hb4iPKIIGtCXJZL3oXT32tp5k6
	S2RCRN4MBMq8mOIhBJfUfsSHwOXevbXijjlaiO8aA7VqMtWxOAHSII890X905GQIFYrTLgHxM5/cU
	3SR6n9PVZeaLzoFWZ06f9EaJ4mRi9DF4kocBgHwtc1Oe1asXAKqIlP1yp413AAkumq5bVgXa3lQlW
	UvJG4kYTKAMCqcgA/GmRNnOc9hO3R7GxSDkbh2re1IC/u4Xgt/I3vTZRTBFsKEWgrPnWDlvi//w2U
	mggJfBRhCYSd+zVTtTlztXLLyro+ITztGLJEH62ZTBIMOCNZB39DKx0Gs0hkkB3cKXnOztM0qqyly
	cXbTIvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rDH-00000008P9t-2PEH;
	Tue, 08 Sep 2026 08:29:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rDF-00000008P8u-1Ugr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:29:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MBOL1521782
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 08:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=; b=YOodalYLDNLXBrSx
	vrfzlLnzdYtqwKt2iWNcG7ymzup/A3wZuBDazv/7h0Grg+YE37aU8SCeZi7hJ3jS
	+H+o/n3iqWABBTrnH5No9FCQrmK58zpdmiNqeiQ/VzOnkE1J78eEG4pa2CPn9gip
	yJEIDw3g9koUjcwQ62sQC67aPVYP4DCX0UL0gfZfBMYKtDY6ylaOLqWBPufqsyHb
	XWQ89ZIq7dSMGwAEabHYmCzdfQDgFXDIpUFBW1qhwlm4G9CQ8hKbBsq9LJ1cF1t4
	LeHK2oqaSqGJGmyJPM57cdyw/nT2hx6SpcVRYM4a9a0Te0Vk+H+9dZaxRJjl3bcn
	y1jCOA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077jsfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:29:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3138436a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856191; x=1789460991; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=;
        b=Pq48mfjbECDzd2+azIXMogLRUSwlp2LmRFQcsZkZ+inui1hPQNAw3+q2JWij8w+ELd
         n9Wv06/og7NtlCF8vMTt1mppRxSAwUvT8o1wvg/Y9SLRGxb5XkkN/L9xY7nd9kfAmzIY
         0iRAwuLHY4gfSSorpXHiAW/ek7ap6Q+nPk2f6u8MkKmQa/v2s4TqlOTcbHcvp7ArvrTg
         Oq3i3/WHj5+ZWQv8LAX24ODLeMjUBHaM1waM/s+VtMS40ewyZK8sZ7Nc+yqu2f4eQXJn
         EhAHqzaTRFzAPrsTHCAKhqNmDFv34e946jh7HZktUueMznAzZ8rrBcsaTR56fYeY+HMp
         g1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856191; x=1789460991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=;
        b=JBxtaBFB2LHfbQwXd4WP9qsQ8/oXBxlIcNMRM+Nxhvz53m3t7OE7DOfIkEIYObbVFp
         Ni2Oi/F/ZNSEAtY2D7m5S5bloaGm7T5Hi9i53GtFF17G/e+LRopsT+qDsMQhOmP1efgF
         3N9NZdo0lSjgWcyVVZIoRLXbA5NMxuyFXaLqoRHbomdShLEdUz0rWiljCNbcVSnMuzKB
         XJfxlwhe0D6ioJ9fH6Ggh4fZlcI50su+G6c+WOTWHCfh+J/dCe/S/52A4bR52nppH2iJ
         KDQI+KsYcbAvh0fMUAhr0v+IAtizEqjWqkhE+2Gf1mst+tBLcC51H10AdRZCN+8u6nQU
         D6og==
X-Gm-Message-State: AFuF++ltA8XtnJUYBBrgdAxWLfpWySmNyAV+I/Y72iMnXxlgvajPqyri
	XiowaDhSsCAGLFKie/Po01/4plOHKrMLU+G0Ayy8o7wkkVm13zElUcqYdS3X0FGQnABloHOZCmC
	BeVV5GoPK45+TaXWqZPYLd9QMIG8mN5gNn91Q/h1xtzf7QVm8CfJjyFc4F1tYIaeMRgy90W2b3v
	MLBA==
X-Gm-Gg: AYBFou1PP0XrdWc2IBGVf4w2nWIt2XjImhcl9SchKitd6eDzVAoTepUy0A0UJ13GNFV
	LT/mHSr3OUFu57e7PSkf5qa7Nq8F0uepoDQP14UE9mEZLKjkUERPP8DS1Ui7ysBH5sw808bDQ5s
	FJDm8gmbHrdZ8nJAyZO9kvG8KoqY+hxs6vS2NNfFi+p0R8kg02qAIIpp6nQudUHJgVzeted+o/a
	KjOaNm0wisl+FE8md6DKZRT0NM3iXLmSATeeZcokUF88cb5MKrO3nRfZudqRqfK7cwku+oaS6Bn
	D7lyHBVmKiGt6Ihmbhu5rTzxFRZtp8GvNdrtmJL7N9rHpmQOAX/BznuS2ZMDMxNcQ6ktaViietT
	x9WLpDVAS3rOUET2KMfpofv5Sw65HtF1nP4tfgg/AGQ==
X-Received: by 2002:a17:90b:5844:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39b260ff0e9mr43921544a91.2.1788856190895;
        Tue, 08 Sep 2026 01:29:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39b260ff0e9mr43921517a91.2.1788856190438;
        Tue, 08 Sep 2026 01:29:50 -0700 (PDT)
Received: from [10.217.217.129] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm29188386eec.6.2026.09.08.01.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:29:49 -0700 (PDT)
Message-ID: <17d7ebef-9ec7-4bf8-bf16-34e3bd3cd92e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:59:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXynvpBKRfFwlG
 83BAINO/cLOsLIid8MVyibnB7M6vj6pIfIGLXe3HKQ3JHLQLi1CIm6t0RPWplI9yBpxBW7E+x8R
 XuTUJVgzseLWc6mJ30uEsYCiGuj9lDFOQ79ePZfd4sIwdyc6JQMeejJMJvKJO/Fi3ot4ndbQdTQ
 tIBGhbm0a0WkOkfvM2WgH6lj+zgkCXz9/aH+Z7aOEgPnYoxfqxQ80r4hhcxSlUdbU/gy0DPSN3/
 yQcat47o4jAi4DC7DDeiuRFrIABu2EE0Pe7zvl8U5br3Dj5Zle0VZZkSoBCsnlnjBL8SYTFtY1w
 Y7+u9Kk7NG3vUQOjW5sSic4ipfYzgFas4MiKYKfdlmn5wdJKqKwvbYWidVMQ5QpNV9Fn2YmDgpX
 d9HmkQgL+RZwEOHwjxFyiNV/2tgMFmfhOMH2Kshwe2/uxPNDkhEiPPaM6onzO5YuVsjHFsk4Da/
 qZIlzMg28UwWWRs7YPQ==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fc77f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=caKvAN_lNXawD3NbKk4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 87RQf6xXRSV3jMdt05dR1Hmcu64E8sJS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXyL+4OCMyoLvd
 WxqHYkagj2KtgXwIskJJMqeRCHrddypcxGbc9NT1pmmDeuXKvb7ZMCY0lr70i9lcbmcQc1UIlXX
 YsFJjDE6qTjdG+dpPapJJIp9Z1ke3QE=
X-Proofpoint-GUID: 87RQf6xXRSV3jMdt05dR1Hmcu64E8sJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_012953_641741_BFCDA702 
X-CRM114-Status: GOOD (  21.24  )
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



On 9/8/2026 1:04 PM, Abel Vesa wrote:
> On 26-09-07 22:15:09, Marc Zyngier wrote:
>> On Mon, 07 Sep 2026 21:21:44 +0100,
>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>>
>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
>>>> Recent addition of QoS configuration to the X1 variants resulted in
>>>> systems that spontaneously reset at boot time or under load.
>>>>
>>>> Given that this is both very unpleasant and hard to debug, give the
>>>> affected user the option to survive such event with a module parameter.
>>>>
>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
>>>> offending QoS setup.
>>>>
>>>
>>> Lets not start doing this, please.
>>>
>>> Can we figure out which platform deosn't work and then maybe we can 
>>> add a quirk in DT per platform?
>>
>> We have at least 3 machines that are dysfunctional since [1] was
>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
>> going to be the one doing a survey.
>>
>> What really should happen is [1] to be reversed until QC figures out a
>> set of parameters that actually works, instead of making this platform
>> even more unreliable than it already is.
> 
> I'd rather have the patch reverted than adding a module parameter which
> users might not know about and distros will probably never addopt.
> 
>>
>> Just like [2] should have been reverted.
>>
>> Until then, we'll have to paper over this stuff.
> 
> But a module parameter complicates things rather than just papering over.
> 
> I suggest we get both reverted if they break existing platforms.

I will share a patch to add interconnect support for Purwa. 
Purwa is similar to Hamoa, but there are few port additions and deletions with 
respect to PCIe, and trying to program QoS for them can result in crash. 

Thanks,
Raviteja.



