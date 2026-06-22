Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBDCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qFGZITqwK7H9zkseNq8t9zRNvX2PPOk2OpnmdV9qO0=; b=OBwDl+PrwE9hAWy/DN9XEFHJJj
	Xu6nX1s7Qfkh/GZ7md8ehkskYPGVyoPIgPMk5XnFmrLibJG/bsN4QsE7lCT6qLfIQPNo06zpOh6FZ
	/MQ4zyVTged4d+RGXbIbki4V9mG0KjGsHSEP7tN/cZp19VESk0wXpXWTWLVPusDnVkRn3RyZTyuSs
	hL1befx7iYEn0OalpLayFMjiVR3GvssV9KAHUeEfPRks1Q6KDyGVFRGem7q6w86BlHkE6wysJmGLJ
	EEJTsvyuj92BQBx0POAJgHr1u4pXjOKgRz6aPF4RpVnLnGUNsP/5P1zRhtgwZeTmyd9v76xXsPwtc
	8pw/iN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhsh-00000005DEa-24bc;
	Mon, 22 Jun 2026 16:52:19 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhsf-00000005DDp-2tw0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:52:18 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66042b348a8so22875d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 09:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782147136; cv=none;
        d=google.com; s=arc-20240605;
        b=kLcj44uO8RrMBaW0UvM2N4UaptSXxQSYZHiEw2j/hZfJ8UtTTJyHcFmQQ1t+CA62y9
         1bcLSyPjugJtRD/ryyK1oZE9peMu5RTpSTmMhDhBXLlRDz5UumBVjL/rPaqAnkJkiLiA
         +ykbfMfpZbn7chAaiYHTeUq/llT0mR+3dsI6KqDkuzBVZA+3XBsPA+XrnECXVVtIkn39
         PXgpnJpJrSYewT0DKSaNp4L2lgEZFYdzMp3kmvKGH2Ve10wnGlW0sh1CeTOFtk8BxoVS
         lEH4XdoJdwKMbnklHlRhZL91k+Xg1yGJd3Bz9s166+o8dBNconozxtu3unTnf+25IH9a
         pWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6qFGZITqwK7H9zkseNq8t9zRNvX2PPOk2OpnmdV9qO0=;
        fh=5qNjM3DuVjtEqtybgqFHu8Bg2ra6oZAtNMPievXQNlw=;
        b=eVfZrKAqlFFjbHuaiOcvX0IiJBprBALAWrI1rLX1okVdrGJyZDq5ICj/QihzGSB0Iz
         0v5w4+ibQqgWoYqh/HGInzHgE7CtKL2Bf0JXsWlyicZIrycIUpZMC7ZjC5viS3jb5m8R
         Mu8K672GavendNstAoVF6KvX7jG/21OtVkfFLkDuTpT1FgaEjKuuSIDKXLsG8tmlDU6P
         IXJqg5zTT8xUkt2pfzKuCSMnFyzOwCBn6fAbOiaDJMyMTxHCLgzxV+VW9ukG0aOVk2x+
         HNKYMoN+rq/XCOPYkTLLtoy8ZerIecpD/BmqyOVzFxtHjvyugtoB9GAGCyDAW8AOkm64
         VbVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782147136; x=1782751936; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qFGZITqwK7H9zkseNq8t9zRNvX2PPOk2OpnmdV9qO0=;
        b=EPWK4mj2ESNNRQrccIZ8uCkU2ssMBdzHISc2tP980hDTsZ+ivIUjxcG1N4kGvIhYYW
         ApiZ3Qlik67tg86j18Z+t5hLcM1CQcUSmQk213jxYBKif06rblAAWVftrLKyFl8Jqr/F
         xAgU5RpbhusIU7razgyr1Cw26rWolrmqRttNXzgMbsb8WrGVAcqCACrSvoHUXt6UXUDa
         3MvJglyj43wS/9LpW4QqU+0aUALh+AsfXWE/BuR00scDaHBh3s3Y/qb0ZWgliRTnKtpA
         ybKarb9hHMVXlyjp41GYWxXueW8tJ9KEXcoCiw4HOzVktDIIZgiVRg4jD39O3wiHTg2l
         Nj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782147136; x=1782751936;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qFGZITqwK7H9zkseNq8t9zRNvX2PPOk2OpnmdV9qO0=;
        b=rT9g/7kE+12jIb6VrQGzm1//N4L4dxcj2UH2mR13/juKUxlaNJDbG6qyDWKg5uCT/7
         RU0YbxdzH2E6S7gIrsN/Z/7B5rinbmHc4TR/8qrxYZfp3Mwj0/d4GB4P9wZogiqfk+jE
         t+BN1/MSwCBizKr+pk+gLPXdMVSgY64tDyxfDQqqFbbu1N8qHa3+3kiWfaUVd9E5F7/s
         vJTWjE1bU7dMT+r5vmutMTByuJyUdRL6x1MiasWN0oxDOynafitQYLnH3rJ0x2caBhte
         PR1E1NJe1dnh+OtexrqfCtF5iE89c343rr9u/0tC2CNUUKVUBqkyIzncySy5TtDCeWHG
         GzgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8LCMgwRqpmoSVzA1SXacGKpfxwbxBhiBb6PxwYDdecgBNIE4F9vKEsY6dAMhTazLO1fbzujl2ClCXthpfvqma@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0tCLLJUYKiRwiBnwclFMKKuCi/Fc9TM4t2d3OqZuXSJf2onQK
	c5QEgl9vBIVT+gMCZhhkiRosCemd6wjoTWwrA9tbr7rMU1EpGXL0+hJXxwIF0TVfEekenNACS6M
	0mSGPmrCWcvwnmD6sZIgOxtwbM/bwMX0=
X-Gm-Gg: AfdE7clp1zLSQbT4WPXGcnoMyztogritbDjtw/6erQhBpFX8YMhV4ciHNgSEBwmNX5p
	DaRulxM23NnQgoozcjQWYESR7AKw4KyS1R9WxbxX0Hc6ZIXEkYIBCCFhYVKI8hpwSYvnKcb5MFz
	hX41jc1vlDPuMDY8ayyh/SNlgKxGN+HQXkMpIqlr8tOluBimiQVJZte9LZOnUFO2Ml/0g4Ft3e0
	Jwpu73ovRiN0y9B7x695B6s2GTSoBa4tlWcwQnaWDWhapqfRKfU6ASS0mvKih7c+EoALH8=
X-Received: by 2002:a53:d016:0:b0:662:e75f:c08b with SMTP id
 956f58d0204a3-6630e81486cmr6670668d50.3.1782147136168; Mon, 22 Jun 2026
 09:52:16 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 09:52:14 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 22 Jun 2026 09:52:14 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260621145919.1453-2-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com> <20260621145919.1453-2-ekffu200098@gmail.com>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 09:52:14 -0700
X-Gm-Features: AVVi8CfSHmmEYizwa5K8EGglmLMEx-RV-QDFL9ttqerZgHD_1HUfICrI8msV5H0
Message-ID: <CAPAsAGzjMapZrCeYX_vSzX3zuXA2gdo_NEg49yGoAFVUBMbS8Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: mm: remove unreachable invalid range check in kasan_init_shadow()
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_095217_745293_4C38183D 
X-CRM114-Status: GOOD (  11.06  )
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

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> kasan_init_shadow() maps each memblock region with for_each_mem_range()
> and breaks the loop when start >= end. for_each_mem_range() never returns
> an invalid range, so start < end always.
>
> Therefore the start >= end check is unreachable, so remove it.
>
> No functional change.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  arch/arm64/mm/kasan_init.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index 3fcad956fdf7..45fbdce684c8 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -353,9 +353,6 @@ static void __init kasan_init_shadow(void)
>  		void *start = (void *)__phys_to_virt(pa_start);
>  		void *end = (void *)__phys_to_virt(pa_end);
>
> -		if (start >= end)
> -			break;
> -
>  		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
>  				   (unsigned long)kasan_mem_to_shadow(end),
>  				   early_pfn_to_nid(virt_to_pfn(start)));
> --
> 2.43.0

