Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2ECC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvTnNGe2ppD7kgPtQJhCGnVSKnL+6Rxqr+uI5QsAH2s=; b=mXljltQxJ8B1SNSS3tHHyA/xdC
	AUQpJixsyZVlRBE0XT26RAmgNKCdLlnVJkCdyXOCgogSno/zB/sCrt5qh+x1rSiGJFFsvFuIHlV3Q
	eJek1DYRQ6vL1Bn25gUr3tIUQQTbRrrWAJijAWMYQ1bftlE+57n9u4pm2ShMEpVwWLn+Z9aecAGGi
	gNk2hk1AKfpPdK7hQNEI8vZCeKvqQWlieabi/rBFRfW607irF3VkJADCmVpvPx6pC70Z17SmPSWvr
	5Dn/No8dzxvOl2BhROJKxbT2/lXgg8rTaKcIgCZ2l0JhbbY5YQlk10zyMNl7UujbBbAGvUaMsbVT3
	3PgZq7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7d-000000001rt-2Es0;
	Thu, 13 Aug 2026 07:45:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQ7a-000000001rU-148K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786607101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GvTnNGe2ppD7kgPtQJhCGnVSKnL+6Rxqr+uI5QsAH2s=;
	b=g+oSJ9yDRsFDTYwRj5Zc3B3xEF0FiNPKHLFESu+W8IRWue39OLr4BOrj4tLw5m6WXvm81I
	NmnbwHIsH9k/4K3ODeq//93XhtPX0A9vBcATrrGwbosE3+ALRFYOPptbvaRTPO+//qMw6w
	plaawDMMCsdXVNjMeZQ/PwLQchajFaQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-1LuucINQP8mt_TztuHpqWQ-1; Thu, 13 Aug 2026 03:44:52 -0400
X-MC-Unique: 1LuucINQP8mt_TztuHpqWQ-1
X-Mimecast-MFC-AGG-ID: 1LuucINQP8mt_TztuHpqWQ_1786607091
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4954a93c565so2310505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607091; x=1787211891;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GvTnNGe2ppD7kgPtQJhCGnVSKnL+6Rxqr+uI5QsAH2s=;
        b=AFpEno60y68juSwqT5jWjtB4TMY+OXjqSlGsAU6vjm2nPglSt5ton1/3Z1AxfWu7h9
         A7kQEFROmmHacrEoj3YbImvUz8lTaVPGg+wqgRIudwKuOjKWIXTMneqtCgWP4Y1cvOSx
         Oo8tNmS/hmLBA1SGqojKacjXndmEX4phPHgaKhcSypFZPOjP0/cgwfpVazFmOI60/sBB
         XVCXtvc5z9E5x44LJFcolDXJzLrwWd2zqQFEJ2s1Ggb5cVXsRgEaJGaX6pZ8Re3c77Oe
         4R3bBXVlYf8LZjhfpdLNTS7bXW/Hp/OsUo8xHaLAGG5JnDUZP+2J7e0XprNTy9X201uq
         AOHg==
X-Gm-Message-State: AOJu0YxrYBtqfhivTCEEhhYx/nKhz7M2nXIMHamzNpbGhH+sqGo8lnkk
	wnor3FYq8OVjHym+XaQuGCuPye4dQp2nDMTN4fpajHitM/ElbsGMCCIxgmg8+cWGvp7Jgm63YFD
	QHZOwM5rmF+kFT9DLsrh5e5eCSdX4JIM/zqbfbvyWuUY5emrFZJfAdgRKwPNVJJftYOawfQ4pjs
	fO6m9QlJii
X-Gm-Gg: AR+sD13GnTkUq3OM/f9eyTpcmbkhdDXjFtrp8d8MFjzbeV7Tq3KH7Ab/SnCdoTmigS4
	gJvRw0W2stDI4RqtLxVBrWft8LNZ+ovg+WQeF1VK559KE+v17aZYSylP3sLwKm4RWMsIH4M8BZt
	zF3BNet90Rm7iDZ9q9m8Xzu3VrICwyeGyMUyqCT8lVyAKUyNDXLWdGjTWpdkfnkeMpfldZLAmPf
	sJVgstd3zMgHmX52s0GXYchqBmSEQWELWFCjKlTykLc5Jm8nofUxg2KPyjGhpZh5X3tRcvU8py7
	NC6WCuF+9yvQbFHRC5vTMTj92qlo90xlh3yDEcoVH/nQLtGK93CcnuYLgr3AKJ/NmF8Fn754
X-Received: by 2002:a05:600c:8209:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499821f1273mr48688045e9.11.1786607091324;
        Thu, 13 Aug 2026 00:44:51 -0700 (PDT)
X-Received: by 2002:a05:600c:8209:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499821f1273mr48687405e9.11.1786607090963;
        Thu, 13 Aug 2026 00:44:50 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e2dc44sm70866845e9.2.2026.08.13.00.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:44:50 -0700 (PDT)
Message-ID: <a609dc2a-2547-4138-b14b-6dc14896725c@redhat.com>
Date: Thu, 13 Aug 2026 09:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
From: Thomas Huth <thuth@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260421144058.561186-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260421144058.561186-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zjjV4jJhmT3yrj4g1gvPFvJe1dLNwwIX46PVu9Nckkw_1786607091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_004502_379201_E25A54D6 
X-CRM114-Status: GOOD (  20.64  )
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

On 21/04/2026 16.40, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This patch has been split from an earlier patch series of mine
>   to ease reviewing
> 
>   include/linux/arm-smccc.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Friendly ping!

Could anybody please pick this up? Thanks!

  Thomas


> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 50b47eba7d015..96d7a61055a70 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -8,7 +8,7 @@
>   #include <linux/args.h>
>   #include <linux/init.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   #include <linux/uuid.h>
>   #endif
>   
> @@ -302,7 +302,7 @@
>   #define SMCCC_RET_NOT_REQUIRED			-2
>   #define SMCCC_RET_INVALID_PARAMETER		-3
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/linkage.h>
>   #include <linux/types.h>
> @@ -353,7 +353,7 @@ s32 arm_smccc_get_soc_id_version(void);
>    */
>   s32 arm_smccc_get_soc_id_revision(void);
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /*
>    * Returns whether a specific hypervisor UUID is advertised for the
> @@ -402,7 +402,7 @@ static inline u32 smccc_uuid_to_reg(const uuid_t *uuid, int reg)
>   	return val;
>   }
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   /**
>    * struct arm_smccc_res - Result from SMC/HVC call
> @@ -750,5 +750,5 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
>   	})
>   #endif /*CONFIG_ARM64*/
>   
> -#endif /*__ASSEMBLY__*/
> +#endif /*__ASSEMBLER__*/
>   #endif /*__LINUX_ARM_SMCCC_H*/


