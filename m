Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAA7C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m258w8dJxz5HR+kMdkqF8oyJmKeGuzgT5afDJjiYj2I=; b=zKnHbsjtT8JyH4kpZDMyFHpkwi
	r3j/5REJs2SCvTLXrWzO/62bBQalB0vtK4heE4Aajb4WKRrXYd3TJpLvkTxNX/p8wRdShb3uA0kgL
	hNDYR4WcKZ3BqHhJ+nI+gLJQDGBB2rINozp+RRtHgaxXUYyRIueOkREEYS1EC3kKs6Lq4R8hmOB03
	1tG2euTcIm3c4GWJwGwQW6jPcY0k5K4TUuC1+MgpDkXYc+xuAAd73UwhzxnjQ1Uc+cA4wJiQvavdx
	ec6JHP1ksAVhJJdt92qt7+W/mRb0tHa0DSjIBoG+4/zgRIZdl0f2+OdheDT+e1ForJYb3dypABu1E
	siiwSu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcghU-00000004LTY-1ktH;
	Tue, 28 Jan 2025 08:12:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgg6-00000004L4O-1PpE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:10:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21644aca3a0so123655115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738051833; x=1738656633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m258w8dJxz5HR+kMdkqF8oyJmKeGuzgT5afDJjiYj2I=;
        b=JZYHOIzEa4QSM/oeG7KzAyEP99efiMjP9dzzRPp2Ji0rN4wCwfaWbCjiCG0cp0vzAP
         0x1mZq8QDK7fSOETvIAMo8XL6+JCMw4Lw8zjNf0tCP0pYTQg6QtJQ4c8OnReiWNGBYyu
         EiPIfco9jduMXk4o1olZZ/oFl848nQ7f6UnyAcjZahu1v2TgMaG88r9kGiPxaKdFMp37
         +ijqLbKBQ0heb6u8RqgasTxVFwBHDhYZHlKPQ0VXdRxW2X2DIhuEWYqatsNbzkSWJdOG
         agqiNyIrwxxgBAfW7vRbjuVJyTHP+aFoKkUdvlx6CXKhgDBJfMDjmK20lPabCWYiWvss
         hfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051833; x=1738656633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m258w8dJxz5HR+kMdkqF8oyJmKeGuzgT5afDJjiYj2I=;
        b=TmfaOXFRnPU54w6u2OCmPsFhaLYzo3Xvuf81MUijpGttZSHyiZeBVE2+GobSouPLhd
         hbXPjE/moKG/s1fLq022UrxQ+ay+hlV1iMfPPdaLpD/HllMck4g8B1lkO8kWG5n4HF4f
         8jopdKtfbyMJsGx2ENXeQuATRChlJvKqENsmgSNuXK1n+6pq8mQu1Soejd56Myxn+sfJ
         KssJ9uNNtuaUQCiVFZisfn13sBLdiOJRnhPqov5UcrdUDHuV9I2gHz1x76gjA6CXOKja
         ZE06sacF5vdp598WX8z1DsMf1XBJyOVQ61FwyEDElujPHKBrtYnyQJthoPGBu009Bcli
         ETlA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0VZCUBK4Krm7SyCkRQWUCXpVS5JB4gAdRhvguAveMIF3ZfMgaiEWMly8RAb74rxk6+zVphh3qr+FoWoc9D2L@lists.infradead.org
X-Gm-Message-State: AOJu0YzDG5SxXnbd/x8oV+q6mViZXucTajnr4CeJFRJWL2alfXTEw/ni
	WERjEIpLI/DYfw8osQk9DvaFzHIk1Q78NmZz0UXqtQeJh6FAWinunhWl0H2iItE=
X-Gm-Gg: ASbGncu3iitMaWLgqp9MwDw5zhWYfWqtk7zDaCnV7WPP4JyFUN/O3Zej0mvhZXDBHsm
	n96oEC32htoIcEx/X7TymqyQQb7JOWTbTC8tEP7ixD/snd6z95cmtISDYRwwxD1wykid57rbduO
	cPhjcCLMYHMU8yjbi2kAhgNy3DTzpFMq3iGOI/L9wcT/Z6UYdRh8JH1X4CSxlj7BR05w3C/4NAA
	2//358Fn30ptme8+JGt/C0Akluted9ZmJyE725n0MrkMIibvedIef6C6VYCtej2UPR/QRl6WLnh
	+khUHuyA4yUmpkM6N1muYF4VFHZvDdHenN4+n5uwy98bS+Kcn+dz5LDkcPV9
X-Google-Smtp-Source: AGHT+IHDmEOcULSXx6v19eA35NSq2IM7B/YhvJ1Sx1iHSXvE2QmuT8LtSkzPnBOxM5b/dOdaKXN7Yw==
X-Received: by 2002:a17:903:22ca:b0:215:603e:2141 with SMTP id d9443c01a7336-21c35511d01mr714453715ad.19.1738051832955;
        Tue, 28 Jan 2025 00:10:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da413f474sm76611115ad.130.2025.01.28.00.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 00:10:32 -0800 (PST)
Message-ID: <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
Date: Tue, 28 Jan 2025 09:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com>
 <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_001034_650909_E07CC8A4 
X-CRM114-Status: GOOD (  14.01  )
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



On 27/01/2025 09:09, Alexandre Ghiti wrote:
>> I believe the goal is not the same. Using CONFIG_VMAP_STACK allows the
>> kernel exception handling to catch any stack overflow when entering the
>> kernel and thus using vmalloc is required to allocate twice the page
>> size (overflow is when sp is located in the upper half of the allocated
>> vmalloc stack. So basically, this is two distinct purposes.
>>
>> AFAIU, kvmalloc allows to fallback to vmalloc if kmalloc fails. This is
>> not what we are looking for here since our allocation size is always
>> quite small and known (STACK_SIZE basically).
>>
>> But I might be missing something.
> 
> 
> arch_alloc_vmap_stack() only vmalloc the stack and does not implement
> any stack overflow mechanism, so I'm still unsure we need the define.

Hi Alex,

So actually, the stack overflow check itself is done in the exception
entry. It check if the stack pointer did passed in the upper part of the
vmalloc allocation (see entry.S:122). In this allocation, the stack size
is actually * 2:

#ifdef CONFIG_VMAP_STACK
#define THREAD_ALIGN            (2 * THREAD_SIZE)
#else
#define THREAD_ALIGN            THREAD_SIZE
#endif

So even though it does nothing special by itself, it centralize the
allocation size/method. And size the size is larger, using vamlloc makes
sense I guess. The same mechanism is used to allocate irq stack as well.

Thanks,

Clément

> 
> Thanks,
> 
> Alex


