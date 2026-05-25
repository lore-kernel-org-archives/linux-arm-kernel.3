Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2922FCD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=; b=DtXi3xVTUpAQhHmX8pCsnOxTah
	X4UHq4RUm2xGkiWlsNw/iZaLJ6S3klvp0DD3JSqD+9rPNf+woufeUvSTc2j6NthUp1dTtK1+9dPZg
	nm6kGS+xRuXWcYwbvp4uhLkqLzHMW5BKabOO9BfAtnPaTpmwV+tlwGDT0S1P5h+dCm1c9Lzr/O90M
	Fy/bmF/wgRy029gjit8g0xktfGT9BQpckeK8jksZtNngLsjWfg3QL/avbka11coaeeVFCCdTsdI9j
	Dns8Q+19e5GSknbE1j8p69V/1n8Fb9460856Pyg+JMzfcA+Wlwsogu10t3AesYTt9rOZ8lrcdvjSd
	1fnAincQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROor-0000000GQT4-2iFs;
	Mon, 25 May 2026 06:29:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROop-0000000GQSK-0rct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 06:29:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMdr7O1927545
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=; b=Ve7tV7mMp8QvF+42
	6DWaCZPyb51vcb3OWG2A1fWxOI7zTm1jllpE2R+oh7ju7u1eGYzZDHQ/FpFuw9GG
	j/mVh9dlwX1EYgBDnWJ1cDFqK93XYHTAjvPUHTkPnGsUEH6jUzoNImm2C4uRNk2F
	xiebWDSRDrglWr+seh4Z7Iy6BPytSYpfPBAKEdV0gmBFlozxERO14Z4BEYd1LM1Y
	VTiCA1IvM1w+dpadbyrfUcFC9CfL/TvMflraVvfmFARIz93obC6WBcTJ3XUmnqPK
	p1HHxBKjMtzk7/O34VXU41dXUyFaS/M9XZE7y6zdmyn/YOy9eDEzCxaQyjrxFwah
	9Ky1AQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vga9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:29:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so9206849a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690582; x=1780295382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=fzmrkU5c1qwV+kFb87j1tCdyA2yPy9Vx9EWcZJLbg6ZySwrsfE3UcDjFzVtXndYxBZ
         3p66RMJbKZmr09JXMIXmqId9xQPGBNRzRS2GWHIQBQ6awbIM5nei0LSmhcGO941Tmwk2
         UVlxI5mBErKRXrDfBeOId3224gHe5v1bA8DonjOUD4ztCLuZsd73RkLLWiIkwmvxgkY7
         /yY93zWCOzDDEllv7VXyL6MiJLjvqHZmRw4kWLAbxrGLBT4jJqXO+AO0gVf46kOGSRHD
         /RidXSWRqjcJB19pPLOnMn1Ovow8FMxyTuDpk5PJHtqUYHZnR5O7r9P+YusExm92kUqF
         dbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690582; x=1780295382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdIrsOqTvAtPVjBT+JGYNekw3r4qMnKczAPJbhiSasE=;
        b=BAktgoW6QGsZfqNncmqI0H+q4Kx/ja7nkE/8gIbT+qNL/8ChMWdI3TqGfjbksL3ue/
         rMfE/VIsQ5KeK5gpSVCkreDS13n5/D0Hbi6+BmurAgGRBzBVe2xH/DXT10ZvmntKydij
         9FO8Hzn5aX2I6IsBSgc+z/VnD7guVPLGiOumeKkmlxObR7/m0cM6TOUj0pioaM4kmxJ3
         8GqO7cJ46PBNLlOeg9o/D5dOZ1hnXNxyB+tZbP6Q7x3sfa05xY+LwlMcEoCZvTXM2JxT
         EQ0z75s8Fh2hgj97l0djzasJ6Jk9euiQ0WihKmcbm5zT2vrL5r0sakNZ2uY4jSMZ99Fz
         6RFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JOtZmdVCij7/iepInxojjzQ2muq2brDXJjJd5YDIEdwhBdbVOouKUsOtJJdSFJKHXnySdV7PrWFoveBnM0sgD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe+wtbbORbQurWyaCP1ysGjPjWP7Pl+o00RGpxqia9eWPqFvc0
	Su+BQBTL3Vm5s1f5sneqPmZ6mj5USk9vLBrzNNyKJYkmfN8SWYY35bktXiagmJBwIR8AMsWaM2f
	lh/xdIsZz86qaVp0LtGOJDHo7tQo7ScMEyq2Ljm8GoZ5IGcfD/V099stWOYuQqhq6OUUQWNaZkP
	eHhA==
X-Gm-Gg: Acq92OGoIb80Gb3a6LAYt5wZ3Xu0CC3S32gOBarveK2QsjKnDftIlkXcYR0vviS6uRZ
	ar9ZnvGY8nnWGwBFZdgHN2uICvAcOGdT+e6SOhfq7tNvOejTi4Db/a/3Slgg2f6o2lJYNCNFp6W
	+BEL87hulbenHDDBnDmbikPlbTP2HGZ8kVPD19iXPwDpaYG651vUfW2TtIoHokylL0FoWjYXjmy
	zSfLioaeEjA8/fT3YzYMGR9m84zWI+Z2DdfnWlekAq4XzFlNYuWe1dfBwQ6OPKEMpMzr8Aym30p
	MfYV/6xe+6++bxT+zLSLDeK4GboWvrB3z/2wGCxtoo37pRcJxSx5o+9PWM5vPPXtmIyNFxiDjmC
	XfSIdjgyQxIEHanvhVRz9assZ2IJNyVB6n9+SNzAKKdDGO5udZTD6SnaXbvrpgE4=
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860537a91.22.1779690581709;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
X-Received: by 2002:a17:90a:c88d:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36a67693ee5mr13860512a91.22.1779690581236;
        Sun, 24 May 2026 23:29:41 -0700 (PDT)
Received: from [10.217.223.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4ca35sm8718531a91.9.2026.05.24.23.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 23:29:40 -0700 (PDT)
Message-ID: <e36172c6-4424-4b77-9b3c-47dcdbdff05b@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
To: Eric Biggers <ebiggers@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
 <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
 <66317f6a-645e-432b-ae11-8f40569d4117@gmail.com>
 <d97382a6-6c5d-4a3f-89cc-3ae9b432de3f@kernel.org>
 <20260524204537.GB110177@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260524204537.GB110177@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0E1XM5JNd_EFS7lcljyBSrI0-fNIId9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfXyemUKEBeV5Bu
 AljqIIvaH9Zl6iUoRmIZQy+BjKYNWyj+qYlJR5rpPJTfpvuhXoAFC4ezaT2vPoIWwak3EnDIHGs
 4tO5QggPWGttYwum5jYN4EGj/f/05d86da2/GeCbrj8dWRTlTUqpzFI7lyBINFKEpX2IpmOjstj
 587c4HYclfYufmznUTJxuTEDPjGJ6JsUDRacATcumKLyLPyH+b81C8X1GUts7X67eKRA7wpIQKc
 xZyB7N3Vfb1/+a/LrCstZC1HONQZKz37JvSdsM6ZD04/or7GicVzz++AZ6V9m6gYzIGcb/aXL1T
 8huFkuYJvdP/SssA+GzLiaZGMBIeO6iEXKPzilQ1FIqbEXcoJr+Hf8OezJv6hKQJlmWMvcVEVPC
 tR77Yzcuz0K3XN3THQmxAm6kDeNSgZTz1W/Vh+5HZKxtOlXHEySZ8LdSN45dFJaptH/gc1kmnxL
 2B29A3vi5Rp2nYlLjYw==
X-Proofpoint-GUID: 0E1XM5JNd_EFS7lcljyBSrI0-fNIId9E
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13ec56 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=84HhrvKZSfYMtnHzFl8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_232943_254755_1FBA31E3 
X-CRM114-Status: GOOD (  20.25  )
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

> This driver is more than an order of magnitude slower than the CPU for
> both encryption and hashing.  See:
> 
>     https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>     https://lore.kernel.org/r/20250615031807.GA81869@sol/
> 
> There are many examples of it having bugs as well, for example see the
> second link above.
> 
> That's why it had to be disabled via the cra_priority system.  This
> driver was actively making Linux worse.
> 
> This isn't particularly unique to drivers/crypto/, of course.  This one
> we just have data on, so it's a bit clearer.
> 
> I've yet to see any real reason to keep this driver.

https://lore.kernel.org/all/c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com/
Kindly check my latest reply to the thread. There are numerous usecases
like DRM(Digital rights management) coming up and qce driver is required
for secure content.

> Crypto drivers need to be held to a higher standard than other device
> drivers, as well.  The onus is on those who want to keep a particular
> crypto driver to prove that it's worth keeping. 
Sure, I'll be working on stabilizing self_tests infra for qce.
Kindly allow sometime to go over failures in crypto selftest and will
submit fix if applicable.
So far, i am observing 2 ciphers failing(xts-aes-qce and ctr-aes-qce )
with CONFIG_CRYPTO_SELFTESTS enabled.

https://lore.kernel.org/r/20250615031807.GA81869@sol/
May I know how to issue reproduce steps because I didn't observe
crypto/ahash.c failure with CONFIG_CRYPTO_SELFTESTS?

-- 
Regards
Kuldeep


