Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E93CFA76A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=; b=dTnWbKi31CEjxVzX5upRG/BmmN
	FKibEuuACO5tXjqhwlIw4ZB5uv/seDFJ2ZElJCSkatQ9wmMrJnPtF3wUsJ8ySdVqfZDkcnlWaKRUZ
	uzkOFdir93DLnprcza4WpIxcMsswanEohIbljach7FFAex4YIlFn0H7uet5urggSmO7/sYJCoIC3Q
	3KAv2FcXXXi0lbKo8u7sd+5MQ0VOGDe2rwMEGM8h+3QLGWG6Bsh0CrxI/FabJPx4sBVLjvcSeFAHm
	lUmNxUTPcrc5yhQY4EZE78m74LhFEE9B5sRnPs81MnJMcSH4t1V1+hUDLvO9Y/s6Z2BX5IdSYolAH
	n2jSN02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMO31-00000008Cj8-1PIl;
	Fri, 21 Nov 2025 10:07:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMO2y-00000008Ci5-1zA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=;
	b=PXKiQ5ES3hzXg7ay0m8gBlaqHkvbWpp97FHpavTi6cd5fCaV8OryWWvJw8eduFIxaMr5O1
	YabP1OEgnrUOk3zIVGjEHtVRt9bCotpxxvSQB47G/uveI/L349PXxiNn61FTrnYeLrFzpG
	tMrMfYV/D5r1ITG4G9X9tNH4IPBj5Ws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-AGW4gLdvMI6XNvZBmIf7jg-1; Fri, 21 Nov 2025 05:07:16 -0500
X-MC-Unique: AGW4gLdvMI6XNvZBmIf7jg-1
X-Mimecast-MFC-AGG-ID: AGW4gLdvMI6XNvZBmIf7jg_1763719635
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47799717212so16722285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 02:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719635; x=1764324435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=;
        b=dD0PTK+E3dnv7jRJHvxmhOUDhNv150UwktoJEtTqVT2uZ7pMa/U9ML0/DEP9QxW7qM
         bO3lHL76vyAEYOAJLNB9IpJY2sVTt4DgWbf+MyJQDNHf5z5Fw0TOsgX5Aw2p962m9LSy
         G5PKW8AxF8Pxi2gyGpKaw+eHbo2xVggvelDDcNlkJDAhfjF3maTOhWe/+lbpHb4M7tMX
         L4FW2nJ7m+fo9NKIE4iouOIWTStCSjeUjNmo5AmoBjcKeFM1AP3nYqZVio4/A5p7Z6kH
         c2WQ+ARxj98ph2I0YKSwoMeVmxj9aLxmS5gRcSm+MBMp66ANqIiE6V1kphnCGFxOlj2x
         zMOw==
X-Gm-Message-State: AOJu0YxtGM6ZAPkVyfTm/Cn+n93oS0VBWyo9a4fZ0ZFvOAr4kTBbMrZ2
	O2BGqRjrXZC6u3hg7TVcWX2TCHyY/rpM+GTqQjI6VjdLA1UIIDq9KEM9iw2ZUXT6LwbRvKUOpe3
	ykbImWcXFiJFSZqe3I/EJ77150LL59uZK34Vsu0gd/fjMgo4Gi1u+qO3U7na14j772Eb9a5w+08
	nS
X-Gm-Gg: ASbGncsWJQfOcbbPW7Ot8UMPZJJxsy+8M2zEtdNKEAsuUIa90rBw+8kFd/2fcswiL8L
	c2u9WylXF41PVva7JLz2E3y0cRUbm23+i0cMXPMS87u6uAZyWjNH5X9SQSTNforToSofSuwNASQ
	xz5Lk1DABvlNcA8hM+uZKAbzt4n4Lobhhi+4CD+2CJQ4CYHQuF0UjvOPxBu6ZYWRcCgD/KB6m9u
	w2gSYj0WgzntyXLtePCSzg0oGl2gXnI3qB8t5v/twbg4u6cCVUhQDyikTG1bYF35K3bFPfVucMc
	r++9aHVJZeR6GEi7DfT+mIQMLXtYVrAk09Xu27aOoQytDcRpiUf3VgGoex6DMO29gQJN4hZ0aww
	wXgb+EA==
X-Received: by 2002:a05:600c:1d0d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-477c1126d1emr15010475e9.28.1763719635368;
        Fri, 21 Nov 2025 02:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqoMD153kz/c03aS70gHVzf/BnaKJUbZBoP7k9YyW4edzStSR45m5QJCTapcyKzEEWA+6bGQ==
X-Received: by 2002:a05:600c:1d0d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-477c1126d1emr15010165e9.28.1763719634864;
        Fri, 21 Nov 2025 02:07:14 -0800 (PST)
Received: from [192.168.0.5] ([47.64.114.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm81828235e9.1.2025.11.21.02.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:07:14 -0800 (PST)
Message-ID: <ba1499c3-47ca-42ed-a0d7-74c5ee768132@redhat.com>
Date: Fri, 21 Nov 2025 11:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__
 in header files
To: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
References: <20251121100044.282684-1-thuth@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2R2uk48dkYyufg2dO-iZwwT8zI0Pkimv3hf79zklco4_1763719635
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_020720_589168_D5300FFB 
X-CRM114-Status: GOOD (  23.52  )
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

On 21/11/2025 11.00, Thomas Huth wrote:
>   Hi Arnd!
> 
> Could you please help to get the remaining patches of this macro
> renaming series merged? I already got most patches from the initial
> version merged through the architecture specific trees (thanks to every
> maintainer who helped me here!), but for alpha and arm 32-bit, I did
> not manage to get the attention of the maintainers. Hexagon got an
> Acked-by by Brian, but the patches did not get merged yet.

Sorry, forgot to mention: csky and arm64 are still in linux-next and not in 
Linus' master branch yet, so they need to get merged first.

  Thomas


> Anyway, original patch series description follows:
> 
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__ and
> finally removes the -D__ASSEMBLY__ from the Makefiles.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
> 
> v4:
> - Most patches from the original series got already merged via the
>    tree of the individual architectures, so the amount of patches here
>    has been greatly reduced
> - Rebased patches on top of linux-next, fixed conflicts and new
>    occurances
> 
> Thomas Huth (9):
>    alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers
>    arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    x86/headers: Replace __ASSEMBLY__ stragglers with __ASSEMBLER__
>    treewide: Stop defining __ASSEMBLY__ for assembler files


