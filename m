Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2423BD69119
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBJf/895gAZ0pPcmkrD9nFaEZSFBwkUTysldFoBxcWc=; b=1spRvCGpxZhj+HqEeIxN6Uc3QC
	0nXJ3EXfH/nGJ4Cj4gOLYDVsqr5BJ3IXWZE3UX77heCXBG3ELrYQG7tK/ZGqnN6epphtNKb5cXvFe
	ef70XNPTAnNKsa6+S1pU89bkUkB0qdudhDd06T5Z94HyfaOKFwCsXr9Ih+fCNIoIZ6gzfvud/pvWB
	mdkgmw3ExlRilm0gLJ2jO0mwEkzCNinClSyaKw0VoUWxJfOrRLHvS7AC5J9H+jLY13YNbjjbZ8LjX
	X9JbOtr8pEhiTQx/Qz40UC1Uvug5vU08q04579ReMOiS0Ur1VHvv75Jhgs7+3zOiXsqrnFPHkhleZ
	neVIe8/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgaF-0000000FuFk-3KpH;
	Thu, 28 Nov 2024 15:37:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgZE-0000000Fu9b-38Ap
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:36:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3824aef833bso688013f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732808190; x=1733412990; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBJf/895gAZ0pPcmkrD9nFaEZSFBwkUTysldFoBxcWc=;
        b=KNYOm6gI1SJn+Ce+HqRgg00E2jR0DB/I43Anx2XRtrvHUa3BrMe+bGo+29uKoAMV2l
         eQrFcG6dVO1BL+Vdvz2nSsXO69ZPc9cd7s8e5Uj8Nh8WkY0lCcWv6xrIC1l1z003twsy
         2ZLXjNx5fVkLmm2oIvhsVLHe1Bp2DLXyo6B4Omdpwo10FMCs2zNoARUk+7zhwlQndB2g
         0/VZNVw0U6aO6AaQB2XTimsfWHKkobeUtj3eT6cmQxECMzU0S+B0g6ic6nbi6kjUZdzv
         DwD+AijgrBmkx9fzR98cq4sCpQFQnALuBVBOf+X14/b4dKvk0XgTFJaFO3Eo4Eofpmx9
         uoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808190; x=1733412990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBJf/895gAZ0pPcmkrD9nFaEZSFBwkUTysldFoBxcWc=;
        b=QUqgIOEwpsckNFzhwiEi0cnolWRK25B7fMOmSYWWYteTaTW50K2NNDNcm4QxepIgMg
         pIH11RyRshy9UW0viWaj8s3a0qCXD30qlswt+MBYao8+qbCVDntpfbdmPn5yWm0jk8XU
         r9/qyLk8eAor4LnaERz7TTMLsuwUoxP6Fd4AwiPmKaIXIHcUT6SVm+Rk03dhm2KwJ5hZ
         3iID2L89khs1VUgvsn4Ka4Ai4ULgBfibTpjhnqbuqqYkQcDYkTjwhJKuWUxwJG+0qhXM
         0S9xp+vo0VbiyqbgWGmIwLTjeE2SZpda7IYHFHFIlnTnxbA5dtKLrmzGbMC/D6F8fvoZ
         DoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmMxrMhqNdDPsZh3Ystcms1MEqUz9+hcxeyC6TadmdRnT5bazKhLb7PniXbO/X8Ri/fSpZjx2up6djUYhjM1l0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb7ZpbWueAm3tVexZNLZyoDWgNROdf8OCdN4cizg3OwhZtGc58
	GY3cw15FErm5j+X2dpyFr9bEZt40Gt8pfrpD6u0kAQy/+4hf3WDO/yW2MUEJR+U=
X-Gm-Gg: ASbGncsAIY8OxgLeTn/SywfoZrOHkDJrK6a0CoduW8LExwA7ZFRPphXw+NyyGHh9MMs
	8IyAhMcAOoccGR0gxftFuVfPAmK7ktJNTbW8LIuxxttaIkiezi1iegX1K6OVefN4OghWe81qMcC
	d2WuQbEZx7azG1IU+X9xTnm+0a6EGLYm9C9XJfhjO0ekWZVhBvv+X4eQSCEcRzzg2kwJL0S9pk6
	N57vOiKaDze210xX4Ya8TW080Cjo5jkDNkY2jZjq/aDdwzUTfwSYxmCKOOmAwDBPBEybQxaR6s1
	B4b9+3jUVG5FxcpEdOkA7nuMPbTshw0v0bc=
X-Google-Smtp-Source: AGHT+IEDPnwcu7h+ElXTqfyvSsHEYUOyA3lbFZXVCKxjr1xKnSJc9XnED6kHQjXE8ZQpcgdam5tq2Q==
X-Received: by 2002:a5d:648a:0:b0:385:db39:2cc with SMTP id ffacd0b85a97d-385db3904b7mr224126f8f.1.1732808190484;
        Thu, 28 Nov 2024 07:36:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccce7859sm1996147f8f.0.2024.11.28.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:36:29 -0800 (PST)
Date: Thu, 28 Nov 2024 16:36:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Raghavendra Rao Ananta <rananta@google.com>, Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH] arm64: Fix sve_vl() for build errors
Message-ID: <20241128-40f8c0b30bfe9455e1a7d982@orel>
References: <20241128150002.2424523-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128150002.2424523-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_073632_784447_4FA3123D 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, Nov 28, 2024 at 03:00:02PM +0000, Suzuki K Poulose wrote:
> commit 5b9895f8a5d9 ("arm: Fix clang error in sve_vl()") breaks the build
> with the following compiler version, as the "rdvl" expects a 64bit register.
> 
> /tmp/ccGJYtuC.s: Assembler messages:
> /tmp/ccGJYtuC.s:2165: Error: operand mismatch -- `rdvl w3,#8'
> /tmp/ccGJYtuC.s:2165: Info:    did you mean this?
> /tmp/ccGJYtuC.s:2165: Info:     rdvl x3, #8
> make: *** [<builtin>: arm/selftest.o] Error 1
> make: *** Waiting for unfinished jobs....
> 
> $ aarch64-none-elf-gcc --version
> aarch64-none-elf-gcc (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103
> 
> Fix this by switching to use "unsigned long" variable and restoring the 64bit
> register for the instruction
> 
> Fixes: 5b9895f8a5d9 ("arm: Fix clang error in sve_vl()")
> Cc: Raghavendra Rao Ananta <rananta@google.com>
> Cc: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  lib/arm64/asm/processor.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index e261e74d..e5b0ad10 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -154,12 +154,12 @@ static inline bool system_supports_sve(void)
>  	return ((get_id_aa64pfr0_el1() >> ID_AA64PFR0_EL1_SVE_SHIFT) & 0xf) != 0;
>  }
>  
> -static inline int sve_vl(void)
> +static inline unsigned long sve_vl(void)
>  {
> -	int vl;
> +	unsigned long vl;
>  
>  	asm volatile(".arch_extension sve\n"
> -		     "rdvl %w0, #8"
> +		     "rdvl %x0, #8"
>  		     : "=r" (vl));
>  
>  	return vl;
> -- 
> 2.34.1
>

Pushed to master.

Thanks,
drew

