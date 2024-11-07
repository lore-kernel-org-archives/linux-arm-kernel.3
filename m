Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763BED43379
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH0O+1ikWMG8QC8IE2A8+a7BT7IU8/OaYlea9rc3Ptc=; b=CDEJ/PHRbpoQzX8OkVT1EqN2vM
	zsokcIMLtJm9J5T1x4AdbHP+mhy8Cs0T7Xr6Ok5ul5eURcNjShagjPGJmLBcSYIO+CGUGequCENLv
	5M3H9RKyUwWYxHIiuOhDYJX57ubsA6/ArvyzLhVK5alygnYA4NmRsgIUYmuX1iDdRoWw3SZNwSdzR
	LKoqowPQoozrayS7euPvY/K6GGYIIzf7ujCrj1aIZFlymoNpyd4uYlMsnP1HPBKkW7p8wT6ve6jDH
	nBQflj4mYyyKb8IrLmVnaW+YCUlDk3g4bpRf9yUPh6g3wtFBe7ic7MnXSTDdnYWfYmieE48d4z+M0
	FIU/RUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95q1-00000007jc8-1nVk;
	Thu, 07 Nov 2024 16:58:29 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95iB-00000007hkx-2rjO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:50:25 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3e5fcf464ecso856195b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 08:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730998222; x=1731603022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nH0O+1ikWMG8QC8IE2A8+a7BT7IU8/OaYlea9rc3Ptc=;
        b=GrQtvpbR4r8EUXjxX2kXAk5aE5ok95H0COBoAFb7HaGUmvsWXViB7Le13KgyihhtgJ
         2jhLREcB7mAI+4DajfVOvVWiBpGDz9Im61/9+gUD6Qzfai7Pxprbzh71DMKZBkMTgliD
         mbwMKrJTEjIBxcYLxXXcsPFkm+Z2zhjSf5D9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730998222; x=1731603022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nH0O+1ikWMG8QC8IE2A8+a7BT7IU8/OaYlea9rc3Ptc=;
        b=CMSBRTsTdc+jDkW8Y6YDHzsp70S55RZ9IFUkM4cF3lCUBzB5kpLA1NgOvgEldiUFbx
         krpjU+tCsk2ZhWL/tBaHcGvDyq71Sii81Q/TjY3yY9WTQSlzUv78cxz+/7cNVXWNW+4r
         gezuZP9Wh6J5yo1YhzR9RmeBrLhgMLvB8zWK7V00wui1oYnKwloHIVIcY7pPSjLKLYQ2
         NESyVYZshuO60exnNH3Bkd3Ovdm7eV9viYjkcGQaoPUVJiQ4S17ufNruwMGxUteYuq+z
         J0EbaqguSWSQPxx3qlL6AxycV8xmsiup/rc6DzG15ohzJuzgzHy3JX0SOM6eA01iI8WC
         7e+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvyZd837iSOlPUR0AQD10IbN5QXx0jhEnjGukoWw7VHc4wMUAmj/c558uCr2SJwsriJbXXgeH6dfgPDNUEpvmI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy29qdTfAj8sul3tA96XCPVeeKxpmJNHF5aOkhnMpQ2a7nPpwB0
	mtxtO3Jyapl/8D49xzVcc5H+W9XaRi6xYNP7e/3VxsT4EovhpQEvIYEeQiyX87Y=
X-Google-Smtp-Source: AGHT+IFyR0ojR5woZ+2sRiyIAtT6NrnlTxRk6o3IwcKgmMiBK8pN+bSw5rHmGwTuEAWjxtrJMD1uaQ==
X-Received: by 2002:a05:6808:338b:b0:3e6:2a7c:837f with SMTP id 5614622812f47-3e63849ee59mr41268395b6e.39.1730998221897;
        Thu, 07 Nov 2024 08:50:21 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de5f8335d6sm375540173.74.2024.11.07.08.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 08:50:21 -0800 (PST)
Message-ID: <96cc8ce1-1f64-45d5-8567-eb2adba1b47a@linuxfoundation.org>
Date: Thu, 7 Nov 2024 09:50:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Define PKEY_UNRESTRICTED for
 pkey_sighandler_tests
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 yury.khrustalev@arm.com, will@kernel.org, linux-kselftest@vger.kernel.org,
 Aishwarya TCV <aishwarya.tcv@arm.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20241107131640.650703-1-kevin.brodsky@arm.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241107131640.650703-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_085023_797317_197D12F4 
X-CRM114-Status: GOOD (  17.30  )
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

On 11/7/24 06:16, Kevin Brodsky wrote:
> Commit 6e182dc9f268 ("selftests/mm: Use generic pkey register
> manipulation") makes use of PKEY_UNRESTRICTED in
> pkey_sighandler_tests. The macro has been proposed for addition to
> uapi headers [1], but the patch hasn't landed yet.
> 
> Define PKEY_UNRESTRICTED in pkey-helpers.h for the time being to fix
> the build.

What does mean to say "time being" - can this be removed in the
future. If so please add a FIXME so this define can be removed
later.

> 
> [1] https://lore.kernel.org/all/20241028090715.509527-2-yury.khrustalev@arm.com/
> 
> Fixes: 6e182dc9f268 ("selftests/mm: Use generic pkey register
> manipulation")
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> 
> Based on arm64 for-next/pkey-signal (49f59573e9e0).
> 
> ---
>   tools/testing/selftests/mm/pkey-helpers.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
> index 9ab6a3ee153b..319f5b6b7132 100644
> --- a/tools/testing/selftests/mm/pkey-helpers.h
> +++ b/tools/testing/selftests/mm/pkey-helpers.h
> @@ -112,6 +112,10 @@ void record_pkey_malloc(void *ptr, long size, int prot);
>   #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
>   #endif
>   
> +#ifndef PKEY_UNRESTRICTED
> +#define PKEY_UNRESTRICTED 0x0
> +#endif

Where would this be defined in the future? I couldn't find it
in any kernel header files on linux-next.


> +
>   #ifndef set_pkey_bits
>   static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
>   {

thanks,
-- Shuah

