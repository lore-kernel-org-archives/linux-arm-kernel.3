Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62472C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR1u282E9CMN38ky5Kmtk+971uYLxuwHPk/Xq/4LP5k=; b=y4vXoGf/rErXO626S0A0w7qSED
	11ET3YH4Q/ffCXVvH3Nf8LCCkhza2OXN9IEF3MIdXrICSQ1PbJPg9kqXgkTkCBabUY7p7QyouBH46
	Hr2UOLPQoG43xEEE+E90R5VsP83ZKrM2bQXn0mcBqYOEKPFCE6NXmXHR+Sn+Prdt6yOLyEmFk7o9L
	y3cPb7TACT7eS7GafjPKaQG1bT4LkZszqYdVtrGKnKHIXLQtJI8H+3shMvY8FrFlKmbBSSTrjZV8+
	uGvYLkNKSjrX3LrZGe7cws118pEy/69NukuK5o6b0SWqQ5x/gv+h8LTB/IQUc99bR3mEuTLPVDnef
	2TO9DURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSnK-0000000HRtA-1ET0;
	Fri, 06 Jun 2025 08:51:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSlC-0000000HRjb-3CkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 08:49:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so23624975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749199749; x=1749804549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR1u282E9CMN38ky5Kmtk+971uYLxuwHPk/Xq/4LP5k=;
        b=T3TfjGuTtEH2KcHg919lRzcj4eO0CdCtxfBtC8m7s14hRc6S6CE8PiDisIXNgEtpfA
         /kynZ2HuBFxkK0wrmYDWEtu2Qytu1v3vaNsX+AfmbzsTnahPR8zqgO/j/Oy3v+kC0Z+y
         yhS06I2jqmiPvdLeHeXZ9rxpxe94Yfg0i65zV7blIH3ZJnVFKr+tBga7q1AzjsY7lXjG
         TW+SUX5hf7SyoOUV1eWIeq8PS8/+KAd0L5ZyrFjT7Z1gJsJVgNZC5VYOeaH+t0mCPIjt
         xgg3RdCDSeE1GT1VA26jAyO40gfwXdVjpfWKugdCk9Kbw4TcZkUxTkn9jFQ+kjmNbuc2
         gihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199749; x=1749804549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR1u282E9CMN38ky5Kmtk+971uYLxuwHPk/Xq/4LP5k=;
        b=E9FBJBpJvEFyc+OQMlyKeuyy4p38fsvvCYYYHKhUGBPYnhElM+U+COIiOTccNcVOx+
         pAVBeGbbTZElR8rhZ3Vap3FkEmbxni7DEctxCOPJgBZuIK2fn1SQqJ5v04VmlHJSzIXC
         lKCosZpvDNS1GZXs89RIFCDmOEUujxUb8pTvaqTnhDfx1xFCnC+iHgao5Cd79jUPF18c
         MImxNW4d4eqmV9+7z4iunjHznFBwL+LdIWCtlZ/fp0n6SJjCPHOe6TSc6NRQFl4blBpX
         saEQMIbMc74o+WHppZJ/mREJAE8URwA2odIfvuuU8Qc/XaMUFr78VL6L2m6Kg4HStsag
         dkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG8I3jC5fEXONxhSXF0tnrnYF6ufrQ5qvaLm3hU2ycLBaYRpbLiuqOlDnQpuyiX5mqoMy9UbaixDRHjlYHzjk2@lists.infradead.org
X-Gm-Message-State: AOJu0YyhGh4NlUHFnx9YROUgf3iBttL/ITdeXBqEeilqXPu78E1kF8eN
	JPx9kPcTKoGHK61yeN2tbLIP2ZrMPTnjyJ99Gr6xazP4KzVHnSV9m9gZIM2wEWvJRhU=
X-Gm-Gg: ASbGnctuoOolG5H8ekJWwkBsOMZV3PxcjZfD5VJDUI62VXyPCH9jNJ+MDfco/AMLXV/
	xWHjAg5J01mK1sNLEwQ5drcHeQCfFS9we0E7fJ5hvIxXrMWlN3Lrtw0yCGMwt2XMsprR4lAVEy2
	FQyR35CCSsl3LtBJVBVXwO7da4cdH/o9Paul32qOxghCu8S+kNIFmaX82lg/uEEd5OlQ2yBkXBg
	HlqBNEL8Pushpn3lRcv5uw8D5SVi0HyZO1iqSFZzyKQ/bN2i1UYheLCaVyg5Zcqm1JFrH9q4Y7P
	CDWC94V+V7rydoqOIG13ZtgSRw/HbRQxcILzU1/Mze232dzFLE3J9fvSb5QsYzszSTA=
X-Google-Smtp-Source: AGHT+IEL9laaUBK/5+T1Dc5WSJT+NXdcDdV4h4E52s6joOzTSFf5peNOrmfW7ryF+q/W0Cyc03p+bw==
X-Received: by 2002:a05:6000:144d:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a5318abb95mr2082772f8f.25.1749199748865;
        Fri, 06 Jun 2025 01:49:08 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243688asm1240838f8f.57.2025.06.06.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:49:08 -0700 (PDT)
Message-ID: <c7c97edf-8e2b-4196-9660-a15b86061c96@linaro.org>
Date: Fri, 6 Jun 2025 09:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper PATCH V2] aarch64: Enable access into FEAT_SPE_FDS
 register from EL2 and below
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>
References: <20250606052602.3387225-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250606052602.3387225-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_014910_818910_904EF029 
X-CRM114-Status: GOOD (  18.21  )
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



On 06/06/2025 6:26 am, Anshuman Khandual wrote:
> FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
> register from EL2 and below exception levels, will trap into EL3 unless
> MDCR_EL3.EnPMS3 is set.
> 
> Enable access to FEAT_SPE_FDS registers when they are implemented.
> 
> Cc: James Clark <james.clark@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V2:
> 
> - Check for FEAT_SPE implementation before accessing PMSIDR_EL1 register
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20250604114604.629782-1-anshuman.khandual@arm.com/
> 
>   arch/aarch64/include/asm/cpu.h | 4 ++++
>   arch/aarch64/init.c            | 9 +++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index 2b3a659..ac50474 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -55,6 +55,7 @@
>   #define MDCR_EL3_NSTB_NS_NOTRAP			(UL(3) << 24)
>   #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT	(UL(3) << 32)
>   #define MDCR_EL3_ENPMSN				BIT(36)
> +#define MDCR_EL3_ENPMS3				BIT(42)
>   #define MDCR_EL3_EBWE				BIT(43)
>   #define MDCR_EL3_EnPM2				BIT(7)
>   
> @@ -185,6 +186,9 @@
>   
>   #define SCTLR_EL1_CP15BEN	(1 << 5)
>   
> +#define PMSIDR_EL1		s3_0_c9_c9_7
> +#define PMSIDR_EL1_FDS		BIT(7)
> +
>   #ifdef KERNEL_32
>   /*
>    * When booting a 32-bit kernel, EL1 uses AArch32 and registers which are
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index e1640a9..df43d2d 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -146,6 +146,15 @@ static void cpu_init_el3(void)
>   	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 3)
>   		mdcr |= MDCR_EL3_ENPMSN;
>   
> +	/*
> +	 * PMSIDR_EL1 register is present, only when FEAT_SPE
> +	 * feature is implemeneted. Otherwise direct accesses
> +	 * to PMSIDR_EL1 are UNDEFINED.
> +	 */
> +	if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1) &&
> +	    (mrs_field(PMSIDR_EL1, FDS)))

Minor nit, but the extra brackets on the second condition are 
unnecessary. Probably not worth a second version for though.

Reviewed-by: James Clark <james.clark@linaro.org>

> +		mdcr |= MDCR_EL3_ENPMS3;
> +
>   	if (mrs_field(ID_AA64DFR0_EL1, TRACEBUFFER))
>   		mdcr |= MDCR_EL3_NSTB_NS_NOTRAP;
>   


