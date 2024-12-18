Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D56E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEcPzUK9cX5iNorTqYb7eanK3qwkXAuqANfm0OCEeZM=; b=Bo9eB/d/o3AjRqVoDJ/wM4xOs/
	0SLFZyuPALzdLeXF6lyHNlv2too0fjKVpmaD1XyOJ0pb9zmkB2qMzuK+yH65HBE4/I4Nq4OgaVJZn
	lPR7r5LbAxuT5hYhlrIwwtUXJ/y+CfizEoyIOSBfrVPw+JEjyDLSUrgzbpsNSvqgQbyPAb9gnXqeb
	8JUrwXMkywPlJ+TTD0oL8hr40XTRxs1aOOJdEkt1P0smI4KU1/YOgeAlUoX/gbB2QtENYZ83arqUS
	KNbRmdInwbMq0wrRltXazP/jgptYXDmOFUNv+60KOSadbXARlbRIMdxD61rnbuQmCCg9uLWxq9mPF
	V8jWKm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvIA-0000000GtWm-3bqn;
	Wed, 18 Dec 2024 14:44:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvE9-0000000GsiS-1lgu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734532840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEcPzUK9cX5iNorTqYb7eanK3qwkXAuqANfm0OCEeZM=;
	b=QIOoNkYpK/LmqzlodBdlHaq6/P//L2JBOJPSye77bn9BTpTOD89mz+99z4IoJkxlM1Kiqp
	wO14q7gUZdr+WDxEKr7jbToyGpShnYE9h4ogybHYqY8oVgmOskbT7FtXZHU1uOfCAvN1za
	MTlmRKyTbAqN5uktDeA1fhRjLF7UTAw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-13uOJeoSP3S0lTW1zxxV1Q-1; Wed, 18 Dec 2024 09:40:39 -0500
X-MC-Unique: 13uOJeoSP3S0lTW1zxxV1Q-1
X-Mimecast-MFC-AGG-ID: 13uOJeoSP3S0lTW1zxxV1Q
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6dcd1e4a051so117880916d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532838; x=1735137638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEcPzUK9cX5iNorTqYb7eanK3qwkXAuqANfm0OCEeZM=;
        b=YpRJViQ7Ha58npz9akfTc9sO0/AIvKT4lkww2RVXNSOFp7MSuG5h6hxU1IER2+Hyzt
         SlnmtB1pZ5tKs+CTyNs5SnL5RngYUIO4jCJRCwXeWfhEMtyerIu0R97xJHg4e7Tgmzx/
         2iagQUGNLzFd+DiGdee3rVpTb8FhVX3odw9XUkenGDowMiT1akhwi75Pejqxbe1HwbCx
         LPqjs1kxVWxe/efqB4xenNHHypJwwMCB33s0qqTKf5g/m65jPlON5ajkFmUmEz7ogmeH
         PMIPP/cYVpGG+Cf9dYZPjkSFUYAxVAtfcPfY+CKZLjy5p2g3Teg4gSeKsYIuQ9t4feiP
         EfDA==
X-Forwarded-Encrypted: i=1; AJvYcCWmMKwDLQaqAq6+C12v+OEXqJ4XVDKsS21cBo+B5QV1dpsXGfQ30eVpSQaCmlMigC4DCDgCNe2Dz9obogKiXUe4@lists.infradead.org
X-Gm-Message-State: AOJu0YyubpxWyh/oHv9mczixxcpuh0jgp9K/emSkZBJW7FPzQqXrHaux
	VZRrH39i/RDe1BJmUpeaMl5WNGHUwyq1LkRNUrvPcA3w3U1N1uKs3FKiz8Gswx5yL3eWF/wR0gC
	KI5uwniu1BOMxEZYU/IemZzsZPOG5Va1Iu5SZuVIWH3SiNK8UpSpRO0cTwjpC9hnmG8GBiZsf
X-Gm-Gg: ASbGncv80Sv/GtdX+6T/grkQvu3XQxLF15iX8nLmvBEBbP75DMjgrnIbnnHjeaLYdte
	KdUmUIFEbxFeTSTGhBkyY/hn81Cn/aWQ4emNk/i0CBp4x35BfQV+54+2xbt8VdslyuMmCfaXpCb
	MX1LrShfOI+/rpf2KyBcQKDEiEtwJqPfDqXheVjJ68/u2CYPysNllLYCDLpKff0VmyzbHzRAedN
	OrWA00+Hs6m6Hh+eBZsSgoiUyJpf/mzBoYCiKVmsS614q0W51INPb8CGMV6nVIv78FWKboDOcU+
	t+FRWMVVSGGAD9RhqzNX2ro=
X-Received: by 2002:a05:6214:1313:b0:6d8:d240:9f26 with SMTP id 6a1803df08f44-6dd091b09b3mr61206176d6.16.1734532836562;
        Wed, 18 Dec 2024 06:40:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjKpesR0qBccdpuFlt/EcrpLX6QMrNSuC3s3ippH3bVwCaymC2r7amx4iBAYxtx9xueQvbSQ==
X-Received: by 2002:a05:6214:1313:b0:6d8:d240:9f26 with SMTP id 6a1803df08f44-6dd091b09b3mr61205786d6.16.1734532836255;
        Wed, 18 Dec 2024 06:40:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a4c5esm49404806d6.131.2024.12.18.06.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:40:35 -0800 (PST)
Message-ID: <283bed34-4fe8-4c8e-aad3-b6d7f2e1a0bc@redhat.com>
Date: Wed, 18 Dec 2024 15:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 01/46] arm64/sysreg: Update register fields for
 ID_AA64MMFR0_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-2-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-2-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F0J39JGJrapNkOHWjlc45dTpUYuD6qrawleivwc13jU_1734532838
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064041_533338_9A5B5C66 
X-CRM114-Status: GOOD (  11.97  )
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



On 12/10/24 06:52, Anshuman Khandual wrote:
> This updates ID_AA64MMFR0_EL1.FGT and ID_AA64MMFR0_EL1.PARANGE register
> fields as per the definitions based on DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  arch/arm64/tools/sysreg | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index b081b54d6d22..a6cbe0dcd63b 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1591,6 +1591,7 @@ EndEnum
>  UnsignedEnum	59:56	FGT
>  	0b0000	NI
>  	0b0001	IMP
> +	0b0010	FGT2
>  EndEnum
>  Res0	55:48
>  UnsignedEnum	47:44	EXS
> @@ -1652,6 +1653,7 @@ Enum	3:0	PARANGE
>  	0b0100	44
>  	0b0101	48
>  	0b0110	52
> +	0b0111	56
>  EndEnum
>  EndSysreg
>  


