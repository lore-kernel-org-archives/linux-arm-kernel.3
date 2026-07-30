Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC331C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=; b=u2Avtpktxt2+hm4L1Eb3tuqZmY
	nbYRGf3o8wTjarmaUUDZ/ImzdoGg5Q+DyrAm3GWbKx/iLVSyfPJHeI++1lyFFutVfJ48K65paHi+Z
	HkL6e25muh3TRs5qvbUd5+Tz/LrGXMuPbI7wD188Wnbqa+7H3iY8HubhpiIZZx6hkz1q8W62IMQRO
	E8GAqsEHdL7+ib5WipTA4Ef79joxCkqJEMYdxOujZ1PbinWN8sVGaGQmFUCzoDsIBiIFDhz4DSJ36
	s1votjfZAZapcv4O6bH7zON8e7iV4HX0lwGflPLVaCERVag0X7foh6ZV//+EuAPG55RO7giQMJgQL
	ec4TvjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOjn-0000000AJv9-45wY;
	Thu, 30 Jul 2026 11:15:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOjl-0000000AJuI-1rOP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:15:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UAt61i480845
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=; b=h5zzTE5I4I2O3mTA
	cbLmYykTp9Ku6e5Fmm8L7Oreu3ps+EkVp0of7zbay/LtewzAuOJeyOTBuK3J/VaH
	4PF/8croEJX0C9JSR9E2ABdtJMpxTnDBdFnSZKtVPgJ0qMZ4z4s62g7VT5dH3GYx
	ydjefX3IspqV7JB5vom+Bii+4Xa0bltRUBWGEMRQLDLrj7BVbx2ZMwbXXgeK2wU+
	Yf7FEFmp429hm+NKst29fg+kv2ZhC0KOJcVqY64ITSZfiNhCP9034EiBAOAb+QIV
	IqyFlu2NQuXAWfyhJGt+CF33sXmv/9VfFyWAo1ap3Z1rlCyAyPDJhWRXagNkqS9l
	6wFUvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr59h82n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:15:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90520763ceaso3798716d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785410140; x=1786014940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=;
        b=QGo1tjVoKvvZySKzek6RVTJaisuvyEdmdt2KNFjntbpWY2iRvynZJR8b4tBZHk3Xhq
         qLNUrk/mZwsc/pUIvx5AZqPQyPFQBPhPZa/aeP9K1rjmFKZ+S4hJH0GtuyXWzJJGP8Fd
         ipUviRDUySGRnR9kP0nU2FWh6wxu2HEsS2vxwSiee2zvbIiH13I6KW62Ov9vWLBl1lTX
         jRGiP8FxdEiSmxZeTGlAZDCKE6OnndDa5CQ3TEFLR2ojuy7GKjPOxk+6wDp9DuCtt3LE
         v/uT3clmKPk+Sj82c543Q3hmYI7YoNXKxDSx2YVinBTUFtuXQDKs/rJfifXz7VGlL7OE
         SPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785410140; x=1786014940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yayerd7KpbuNuMSIUfVtN3koai+QfjdPNE9Mq1gz39k=;
        b=VXJY19i1R/pARRPgStYExZF3Lbd8YbQiukfGQwM3fO/X3ytIWP4sqwWcCt6PaNG1W3
         jVn2044LxVX4kIRFNX3dDTg6po9g8+g5mAYgHgLmmGKhR4xuut5+G8PMsVlTjVpElxVA
         7/9qgel7qorup1ZS8k6EGnldUcCYaBgme+qEb0oaUCpkSwzTtbesx7gV/NfkjakvAR5i
         fxzB89fclXAUFUpIODTsmgcR/CUIBlz6dGIGJ3/sJdwXpnKs/HeHsI6rLHP0TV1oxNqy
         sGCXyB9Xs8D8pnTzaXWmjlvK8jGBchtAVu4foW9qBv4oP10Qnm1/pRlMyFkeZE99Kb6q
         AnXg==
X-Forwarded-Encrypted: i=1; AHgh+RoxIRiStqInNfSgZkeVQint3oO4gN56BwOcFatZeS3dISruEKubqIKHBpI8joYV/sI5Di6+Pr4FKsG1XEpFlH7E@lists.infradead.org
X-Gm-Message-State: AOJu0YxfUBBsIKBwzE6VcS5lTFqE/1ZyCXoE/+v7H8G9IHgxKssseViK
	myhyUM6fm8oEBU4jsiuS3IwCEK+qPR+bFon+8dLF+roN+LrooAikvEbmJ7Psvu619x7ggoce9Hh
	h6ULwHBWDp3Hk4PGBm5e/fGtJB0h9EFbitqX8XUhE3BhwfCTSmAT9AFe5Mns5s0UimnZeiRACIG
	vWrg==
X-Gm-Gg: AR+sD12pAkC5gKadJogiPiLcsFilMBqF66Rf3Plhqs3+41QFAboTqCViIbM5HrTUpyW
	gvyBUCX20ktwI30T8QiAmwMS2ICltkTCqaIYi+7p4aGU593ntcR1nn4N+3sM9GxpJVNm2cJYaQ0
	TrT2RWKV92Vd43sIAiaqYnYjlGGp2jBbaPO/4skYX9Nwf1p5ic9+RrSvKmGhbVaz83EIJ/y6tSa
	xWX4l3Ayvw9uuugDGBNY8E/qHwYkcRgovQyDBY7IcPgwkKViOlszZZdwJy2JOQdGz2LDi4ZAyjx
	2pkT4qoJ8mf8Dg/saQCKXnUryEjqO5bcW7QA/zesGZiH6uU8saiclRFofm1FOx3fpfe8BemEQ1Q
	hZ1p2xBbJQouEyMyVeFCFCCKa
X-Received: by 2002:a05:6214:248d:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908348e1e80mr33531426d6.5.1785410139535;
        Thu, 30 Jul 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:6214:248d:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-908348e1e80mr33530766d6.5.1785410138930;
        Thu, 30 Jul 2026 04:15:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85dbe43sm57334066b.27.2026.07.30.04.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:15:38 -0700 (PDT)
Message-ID: <a5e953b8-89fb-4f65-a299-37352d9f6fa8@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh> <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh> <20260724155144.GA2032@sol>
 <20260728152241.GA4281@quark>
 <15904301-fd03-45e5-b909-dfce52449726@kernel.org> <20260729145520.GA1702@sol>
 <50d9d0e4-28c9-42b6-8b71-e75682b4959c@oss.qualcomm.com>
 <20260729171850.GA4454@quark>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729171850.GA4454@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bNv1QPSmrtjJyi3bAtqRWvQopaVwkgzH
X-Proofpoint-GUID: bNv1QPSmrtjJyi3bAtqRWvQopaVwkgzH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MyBTYWx0ZWRfXzmS5xoVMiyWq
 e0DZ7KTfD0eS0dI1g3FybbdesH9RsIRXWUrZFygHAKRnTgxo5gjdpv8lgOZQyHG7YKcGRqfASsJ
 6pju7OVBMNp98QFfd0eACLAQ23LA0h0=
X-Authority-Analysis: v=2.4 cv=GshyPE1C c=1 sm=1 tr=0 ts=6a6b325c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=_TOfc9kH6lse8ksE744A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MyBTYWx0ZWRfX38nYac0d31ea
 fnEZLYocbsbuMzpQK+3vOR+b9S3oi3WMjXX7BZALaA4y/et6gasl2ZC3TgWabKLluEcMcqKuoOz
 sp4Dh7uO1MPfuj/1ixbap+lVSfdvrdT3b+jxqCcTwDUMdMlrcxm+QVeUfqTRT2H21ZSoZHzhysh
 kFWkV7SHR74LUsCFN3e4nmpmrfSaLLaCsTkgt6rC7fiPP6VAEY8Ndtp8V9jw/QBKJ5FhyNCADcR
 QkuRx21u6mWykvlQeB8ME/Ol4W4xeHfhLC71OUqx4QUnnUweAgXNgC0zrjq8R37scDPmfEzv7ta
 ++DlJjMFsclpSE+kctvsb008/95mKsA4c6vwfG6Z61onsKF82WMxH4fnAXky3YBZ5aKVWnTzT91
 3k1wmSnto5ZjptV2L37t2ABtguk5Joziz7Y6TprHqCWzOdYcWqBUNQDShxj8PNM9VHzEOuyAlKD
 UI7JbYXuXK+pDPJsNpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_041541_613852_9FCDD647 
X-CRM114-Status: GOOD (  23.37  )
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

On 7/29/26 7:18 PM, Eric Biggers wrote:
> On Wed, Jul 29, 2026 at 06:55:20PM +0200, Konrad Dybcio wrote:
>>>> Unfortunately removing it drains way more battery, because the buses
>>>> never hit sync_state and are kept at their maximum frequencies:
>>>>
>>>> [   18.021823] qnoc-glymur interconnect-1: sync_state() pending due to 1dfa000.crypto
>>>> [   18.029605] qnoc-glymur 16e0000.interconnect: sync_state() pending due to 1dfa000.crypto
>>>>
>>>> (it transiently also pins DRAM and friends to max-freq which absolutely
>>>> kills battery life)
>>>
>>> Isn't that easily fixable by marking the node as "disabled" in the
>>> device tree, or even just deleting it entirely?
>>
>> Avoided? Yes. Fixed? No. The DT is valid but Linux can't deal with it
>> [since the driver is gone]
> 
> If needed we can keep a stub driver that just disables power and doesn't
> register anything with the crypto API.  I can send a patch that does
> that.

I believe we (are going to) need something like that in the kernel
for similar cases, however I'd rather see this driver kept/reinstated
for the reasons Bartosz is arguing

> This is an interesting twist though, because it means the claim that
> people can just disable this driver in their kconfig to avoid the
> problems in it (which is being used as justification for keeping it) is
> actually false as well.  As well as the claim that adding the node to
> the DT file is "just describing the hardware" and has no impact.
> 
> This would also imply that no driver using this sync_state mechanism can
> ever be completely removed from Linux, ever, which seems odd.

Linux has always worked around various firmware peculiarities, so
I guess we're just continuing the tradition! :P

Konrad

