Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39432E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jesT8KSuZm6s5NxlSiXy7wDTw7JPpHC2A5ew+Rwns50=; b=qqSdMBncXZBi6cp5xk1+5LIwVO
	6xqf7jnKTmZOdtwExnyrI3vCPg/FqYshJWuBemXqyaOplaKfQ7lbJJ4i4AGATQ3e2T6NUFPVqY46g
	vDaHQcHZOSpEHCvqOC4tti838b4TW2KdbPl7Kgh5e/olGZymFAymB4o7qm3MsREgp/iyRry9BiLeR
	KKEoIieDrfZrZRUuolqvEWScbEpUlL4fqhhnXI8c89DtdCtrsLsQyEYQ6/YQutZ0qIve1u3OzXArJ
	WENx7IrNyqfXmC87xyixY6bRl8GDsNLD+cai/0gN1HNWi2BFc1XeM7PucG2uVXNOLROGmqwy+h3zv
	2T66vhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvH7-0000000GtLS-0rlX;
	Wed, 18 Dec 2024 14:43:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvE3-0000000GshM-3mHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734532835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jesT8KSuZm6s5NxlSiXy7wDTw7JPpHC2A5ew+Rwns50=;
	b=ERZn7n3pQn+otZYsmvHFtRfQcNZxqKkX4HiuOrvQCUTjFjvr/b6gL1Z/ktmGX/nNt0jOff
	MA7/DfnnvEF/oDhx8MGtq7LeOD3u0mI3BuKPWIH/B95ZoIgIS8OQtsIfCe3aC0/20yzI5N
	gRUmmAucf6VHq9YFJEawJM3fXiRSAdU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-Xz0qb9LxN5K1DJoM4MUIsg-1; Wed, 18 Dec 2024 09:40:33 -0500
X-MC-Unique: Xz0qb9LxN5K1DJoM4MUIsg-1
X-Mimecast-MFC-AGG-ID: Xz0qb9LxN5K1DJoM4MUIsg
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d92f0737beso97342816d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532832; x=1735137632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jesT8KSuZm6s5NxlSiXy7wDTw7JPpHC2A5ew+Rwns50=;
        b=NcnRhXbrKxfFUSDlM/R5pUvd0WAioOWIgUJEShu6mVLQN97Df1yrPGcVHcZpVt1iJf
         4DSeG86JeMI7eICO2EAB1JZOmcKaumHNOPLuuWkKn8UN5BWgu1n64oa3S90+Agfi2Zc4
         Fw+HMaH1oRwWJ82ny8EaZMRSsLAzEWQbXT/99ybAHQpaAu7LKehvXj3ElQAIQlB0Cx+z
         xlZYIpVWgvU7lT8Zu+cfQG/Kqq+0phsSKGAUBWDvnCaLY2AS76Jw1m/rw9LJtc0ka83O
         zOAh74VqWj9HwyZ5t7/2mhWL5jGrnsPNQ/CYUeqSKSifheKxo1m5BeSWfn+tOe5qBkph
         /T7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYmuTz8C+YLsz01CUPbuh79OQkcxQ4e22Jdu/4RXAOi3Z4ieqWtAj2wgYLYQZUi53AC8q0v8b4n++pRvFhvGsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg3FBF4Lp5RWIuPmUUPLCQhkjBKCskEesSo7r3R2z5UBoxzsJU
	f5NOVsBWVp2RCITLTY4bGLAP1dfyI5zxqNSbLB2hw6L90JPcFtme+cOBY0S/mCf8Qup+5O/64Bh
	+NoUfEgMwqXvdWQ/5kOqgV63OeVQG24AgHUf3hEv0OHDnDXVHwm1Fank8npbQ8Sh1rLlftI0N
X-Gm-Gg: ASbGnctuo2AJYD7yzQzdtXunzM5ALY/lX9YdlQAkGJSP69IDoTnesGctcjL36dqaUof
	gd5RTavy79IdJrtnpQXNw/5EqnX1b6M4VY13pE8PbolE1did2caavKQvRySRpwDNGyuDfxcQHdD
	1FEwlQNWJ87H8xI1o36K50hLz08ThZOs455WFnHIhtYkVrzqb7F/2niW0PifAXQfLjgUE5iEuRu
	+pi5FOt2JHimzxxMweUrBqTtXjADbEkNF4OV4z1hV+vTwbd4i0GPdO+xcn0EUAULq3XQai3C/j8
	VLDXJYJk574j8ElmTBFVK4Q=
X-Received: by 2002:a05:6214:2481:b0:6d8:a148:9ab4 with SMTP id 6a1803df08f44-6dd09263fd8mr38794596d6.49.1734532832574;
        Wed, 18 Dec 2024 06:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUBhDILHEHyMdYZRoDvuz1fL+aEGZm9SpXTlAAUoL8ds8OGrn5wunFSwDZTGLqdLc/sUwhtQ==
X-Received: by 2002:a05:6214:2481:b0:6d8:a148:9ab4 with SMTP id 6a1803df08f44-6dd09263fd8mr38794316d6.49.1734532832294;
        Wed, 18 Dec 2024 06:40:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a4c5esm49404806d6.131.2024.12.18.06.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:40:31 -0800 (PST)
Message-ID: <ed883097-c1a1-498d-97af-f0a306893b26@redhat.com>
Date: Wed, 18 Dec 2024 15:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 02/46] arm64/sysreg: Update register fields for
 ID_AA64MMFR4_EL1
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, maz@kernel.org
Cc: ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-3-anshuman.khandual@arm.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20241210055311.780688-3-anshuman.khandual@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UIzin4YL_kq_rJlMFLMzYxi8kCv6KNoj-DZ34r1dUJQ_1734532832
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_064036_011541_6CDCED9C 
X-CRM114-Status: GOOD (  12.00  )
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
> This updates ID_AA64MMFR4_EL1 register as per the definitions based on
> DDI0601 2024-09.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  arch/arm64/tools/sysreg | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index a6cbe0dcd63b..b5bda7c94689 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1872,12 +1872,21 @@ EndEnum
>  EndSysreg
>  
>  Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
> -Res0	63:40
> +Res0	63:48
> +UnsignedEnum	47:44	SRMASK
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
> +Res0	43:40
>  UnsignedEnum	39:36	E3DSE
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -Res0	35:28
> +Res0	35:32
> +UnsignedEnum	31:28	RMEGDI
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
>  SignedEnum	27:24	E2H0
>  	0b0000	IMP
>  	0b1110	NI_NV1
> @@ -1886,6 +1895,7 @@ EndEnum
>  UnsignedEnum	23:20	NV_frac
>  	0b0000	NV_NV2
>  	0b0001	NV2_ONLY
> +	0b0010	SOFTWARE
>  EndEnum
>  UnsignedEnum	19:16	FGWTE3
>  	0b0000	NI
> @@ -1905,7 +1915,10 @@ SignedEnum	7:4	EIESB
>  	0b0010	ToELx
>  	0b1111	ANY
>  EndEnum
> -Res0	3:0
> +UnsignedEnum	3:0	PoPS
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
>  EndSysreg
>  
>  Sysreg	SCTLR_EL1	3	0	1	0	0


