Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87383C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 00:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7UQ/F5AZWdK2ch72S3VHNj0hhunF22CSu35ymYfaLY=; b=Nyrrwa9CPIvBgNCHItTU4dzsNB
	4jHp3EmxBlYidzuSS0qGPSNeWBg4Iq0fXrtqOaHprbz7Ugwsz4TWcrf+21SLik/YeQyD761vkKnBn
	0hIqCZy1qLUFWEt0pAyfee37Pq1eCG4Snr7zh5si5X9WvHuWAGpqme28UCJQcbc0/mCVJf4mPO82q
	26ztnTDnxdGN0NYk5yyamYGk15IqFfvfGyIdNblxFSwHLoDMmIurvcsZfo4WwCgV/5EAs4F6HYizt
	41wNn2wc3He8CIiy9RhnPJbCbdOS8ptbPAfFgCyHcd7he7G1scaIEbmqZ+Q0xNvFwR2yUOKGVPIgi
	DafEn4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9X5-0000000G6ZT-0xcj;
	Thu, 16 Jul 2026 00:00:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk9X2-0000000G6Z2-1uEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 00:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784160051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7UQ/F5AZWdK2ch72S3VHNj0hhunF22CSu35ymYfaLY=;
	b=TkFq9S3/DRxRl/yihS7Je/SSedk8dr09kzcpugM/vXNUXKSR15SczZNFt/Nrg3JQqCb3d+
	+CqvqL+RufV6NasVojEZhCA6QqeWPkojAzjL7JpKn9nCgOvMKrTJp11A0WGgzdY2vgzo0o
	+amK2id2SMyDkvfp+e/+SWW0s43IuuI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-EbGCo8umOiiw0lUlmVnYUg-1; Wed, 15 Jul 2026 20:00:49 -0400
X-MC-Unique: EbGCo8umOiiw0lUlmVnYUg-1
X-Mimecast-MFC-AGG-ID: EbGCo8umOiiw0lUlmVnYUg_1784160049
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso6332474a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 17:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784160049; x=1784764849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7UQ/F5AZWdK2ch72S3VHNj0hhunF22CSu35ymYfaLY=;
        b=YrcI9R1dKnwXz/6LZPHBgdx0WFTXF1SAnoqwwZzFXSJv5k3fTJGxKcclXISPcy2nDv
         3fg0Q/L9gs6d/jEhZX7ZTjx0OaBUF2rPwvGfXOtB+hq3Zu/zSCqd80RRiuycR/Eb16UO
         Q1O1JjLv7tNlBXRUExgVM146osqDEvkD95uCosaNLN+/5s+k6kZXO0LxYhJLKOWzkHL5
         OvKeSokvM4/E1wzlTCKKKBx2c/763/Msm5xtcxA2fTPfD4m8yt1RtPD0UEzpU5HjI31h
         1TOGNh083PPKXSJUXRSUze6HU9rfVicsTWcvJ5RnJbJPJIrUV5fAaa/rTQFSKIgU1Tha
         n9YQ==
X-Gm-Message-State: AOJu0Yys0fLDu47zEAjj5nI7JZod+dFfLcefhwbiy2iJFSCivEtXRcAK
	pMZ+QckMHYAp5l4hLduPIgnAWKvU+PL7GSbqZO7zd2WfBjFMWTsYoQq1I09REHDUqARDb2lDGay
	jAyqR9yv7OBhxAqHB3ngYDKNJSH6xrh4abPMzsymckrAUsTSOTTKsbOzeW/iYltHG3NOrYvQyJu
	CG
X-Gm-Gg: AfdE7cnRzt9NJTolVxzJhhDEPiLyrA8vZUf0La78786gpQ4smibj5sYH5C93rPs1RRa
	gX+t6yPotGVwv6EbdHRje5CS+VMGOBhNMlnx6Qxirnbd2iuAOJVSf8xf4916PWSgeimatkdIwIr
	n6LNW93krqKEWYcbZGCYgsYPIyZE09NXBlA/JiILY7l3Bhe9qN00i8RcK6+UqktMarQlsa5r8l7
	z6tpGrjCWhjE7tdQhmrj002j8KnJN0w+0H0TJ12eMC/9A9+MOLQ4GaMOcyB2UcN9zESqEdCYDfH
	rZU12SQmgyLR2jVUMwGVnbd8lInnlHWLdK+IeblSb34qvFSHMmzmHtANr39dT8IK1K7jdqffWQM
	UjfE5pHrnsNa9PouaZwVHVi5I1k2Cy8xe6pnFp98YSiA=
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr22001429637.26.1784160048703;
        Wed, 15 Jul 2026 17:00:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr22001342637.26.1784160047969;
        Wed, 15 Jul 2026 17:00:47 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c08eesm6445465eec.21.2026.07.15.17.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 17:00:46 -0700 (PDT)
Message-ID: <671d0b1e-65f1-461a-aec8-a031c40245bc@redhat.com>
Date: Thu, 16 Jul 2026 10:00:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-4-linu.cherian@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260715053408.1950475-4-linu.cherian@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m1ulQhj4w7cRCSf3r4w3vj_kXxNwPUAetI4_zGg0s0M_1784160049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_170052_599288_07073875 
X-CRM114-Status: GOOD (  16.64  )
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

On 7/15/26 3:34 PM, Linu Cherian wrote:
> Add below cpus to the midr list, which supports
> BBML2_NOABORT.
> 
> Cortex A520(AE)
> Cortex A715
> Cortex A720(AE)
> Cortex A725
> Neoverse N3
> C1-Nano
> C1-Pro
> C1-Ultra
> C1-Premium
> 
> C1-Ultra and C1-Premium both suffer from erratum 3683289,
> where Break-Before-Make must be followed to avoid a livelock.
> For both CPUs, the erratum is fixed from r1p1.
> Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.
> 
> The relevant SDENs are:
> * C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
> * C1-Premium: https://developer.arm.com/documentation/111078/9-00/
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>   Documentation/arch/arm64/silicon-errata.rst |  4 ++++
>   arch/arm64/kernel/cpufeature.c              | 10 ++++++++++
>   2 files changed, 14 insertions(+)
> 

One question below, with it addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 014aa1c215a1..57c778446936 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -242,10 +242,14 @@ stable kernels.
>   +----------------+-----------------+-----------------+-----------------------------+
>   | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
>   +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Premium      | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>   | ARM            | C1-Premium      | #4193780        | ARM64_ERRATUM_4118414       |
>   +----------------+-----------------+-----------------+-----------------------------+
>   | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
>   +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Ultra        | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>   | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
>   +----------------+-----------------+-----------------+-----------------------------+
>   | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..1b804b6c4fe0 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2152,6 +2152,16 @@ bool cpu_supports_bbml2_noabort(void)
>   		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>   		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>   		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> +		/* Erratum 3683289 fixed in r1p1 */
> +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),

The revisions for C1_ULTRA and C1_PREMIUM have been limited to
r1p1 to r1p15. How about r2p0 and the revisions after that? We
probably won't get a chance to hit the ceiling? :-)

>   		{}
>   	};
>   

Thanks,
Gavin


