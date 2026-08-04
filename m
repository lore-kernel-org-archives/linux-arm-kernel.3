Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73990C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbQ6lDHTycyG9G0iriLV5gjQixei6LpNvUvf8igOrl0=; b=EWoBbTs/PqUhbzjPF56SxDarmZ
	yTnV9LnzLP4VOfzSbuQ5XGYsWXH4K3RMpZOwt84fIqicRRW6eaw1SHtkUoVz2CS7PUO9AQXXNINyc
	6WSVxjzSH5P7Yb9J4j7dgRJDm7uUn9zBoIhRq9sFZPWIc6Wiv0sfGVjAljYb5i2MmQ/dwg3uBfVMI
	DIU7eMgUlZNw6kIVksavUweq9itRbE1GB3eD3c3mMl60LNtVaKF4t91AZJv/39FppwAcSyZdgFFAU
	vaJzHp9Ydnyg5kbXYSFe3VwCgNPxIwE8Bp8cIyOWsctDAkEce9sTiz+VFz4yBNGPkA5xV3iUv16ri
	QbqQN1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI7P-00000002LVi-0Trj;
	Tue, 04 Aug 2026 16:35:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrI7M-00000002LUz-0X95
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:35:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c1c24ec9525so18434166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785861350; x=1786466150; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbQ6lDHTycyG9G0iriLV5gjQixei6LpNvUvf8igOrl0=;
        b=P8HZPl0SM1KLcQvqIwWjaXwZzcd+XOtYcFRJ2p4xyf+ED8nslDLWMaOBQQKN/aJ7Tz
         VIavTyRSRAcqxKZmp10nfPmZK59RjJCPWOCKW+CoqkDJOsB19czW8f9geYXUo9AMtSOJ
         w7y9tgvOrsOc9cSAWEQjzkis/Th8fqqxU9vMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785861350; x=1786466150;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NbQ6lDHTycyG9G0iriLV5gjQixei6LpNvUvf8igOrl0=;
        b=IDFA6cB52n+jl99u9xqQ/LarzZTyHHLzAgzD0D+xU/pHnHaQjAQ8ixfr4nsqDjRLEC
         g+GxhXsffnoNnt9Fe/4eG/3E+MR/Df88XUAPmyiZvinBBOFiedQd18OaiA5+Sy0xHdkc
         Uy49r0ZCSb/N+TjRzbW1D9LM+/T3grElHyQWvds4aRv25Xdgr+eHczTNsNLnMD++HZmk
         t3KUOMzeGmIilmSv9kHvhRykiArvrs/CYHN2zDvMxLE7CPv62uqkUOeni5AAz4zXvQPe
         CLZat5Iu/2Xl/OzVp/oQoom2diHef76DC9WuOSuPbYMaydcNHOA74VL9wIEl3GZkeSdS
         Fd/g==
X-Forwarded-Encrypted: i=1; AHgh+RqbxFgx6hC4zSm1q8Tgq6nSvv9hFfeKtS6zSUF1EIMXAE7cHFCUPUEFFszmf1rpauDx2R+iPcjyZo2EAbJmT9Rw@lists.infradead.org
X-Gm-Message-State: AOJu0YwiQBfG5hj9eO3CELLvztEeMN7+pShr6XNNxMKyLF7N3uxpaPRE
	2SxEVyriYODX4qkOidvlG57SCk47pNv0Bdeei4BUsJqesHdRVoBC/i8gwOcB78H5x9/i4UxX0eO
	KTyiMjni2DQ==
X-Gm-Gg: AR+sD10v0LWdSxYKuAvn48Wopft6xCDphB7TjSkg0rYGdElzwedM/ZlQhaFBwnHH2ZG
	Q/gzEI9WdkgsgbNEsjhwZ9O8kPWTzX/mVttIdaP+0w1AJb65jKa/909RSG7yMNJM6S8yzH4zGxa
	ALOTmJR3XGhBofUqoy4kCUOXp5fAWoS5hyFEoOV+46kAV9+Ox/DgqYKLi03aJbchJWzAvaW65v1
	XWyM2tbO8bF5cneouvR3oyAS5b+I3LKb10RuMFuHD9j1Q//QtUL3GANQjyh2ZxvZSiyw3hRk/uw
	Y4kvI84p0bBqgNI3hAeMs1aZFPGHdxze/o4dGb8w/R4sj36Wog68mM4yfgtfJybuaUVTlifzN3P
	pgOuPWUmuG8TUVPx7YJ0X4kWSRFf3nFuERcbCvgFwYyVkOeBlK4a0SdetgbDN7GTEsm734FBHEk
	PAajZu1HqP3uflcusSrgbIfzqlcuq9jalMU5KI+vCJnxIxgOrMG3ZubJT52N5xzuSxKoOSURUos
	5z6ETbcN1+AMJOsqiGXq++aTYFB+xepG7KTTQ==
X-Received: by 2002:a17:907:3c83:b0:c1c:257e:4888 with SMTP id a640c23a62f3a-c1fe80d7742mr1370099966b.27.1785861350214;
        Tue, 04 Aug 2026 09:35:50 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203642435dsm34086566b.44.2026.08.04.09.35.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 09:35:50 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so14987566b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 09:35:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpaNRd3G5gOtJwU7gAhbLvkaGs/jwwnJgUR4vC9sdws2orOZ6avhIg6zpYPVlcghvaR9FJ13jhO3gOH3yZNfQz0@lists.infradead.org
X-Received: by 2002:a17:906:259a:b0:c15:e33b:8c4d with SMTP id
 a640c23a62f3a-c1fe7f0d60cmr1115849666b.4.1785861024819; Tue, 04 Aug 2026
 09:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com> <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
In-Reply-To: <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Aug 2026 09:30:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
X-Gm-Features: AUfX_mxC9iiWxGkQdgQGlH_dpY4ketm4ONzq0gdfJSAi_GqCpD7ENOlTAcBA6K0
Message-ID: <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_093552_178927_6ADE27B7 
X-CRM114-Status: GOOD (  10.63  )
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

On Tue, 4 Aug 2026 at 09:27, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> We certainly do not want to replicate that approach. We are using the per
> cpu page tables to avoid address calculations in the VM that other
> platforms can do with a segment override.

Right, and I said that that's ok as long as it's a internal
architecture thing. Not a "this is how the VM works".

Because people really have wanted to make it a "this is how the VM
works" thing. And that is very much what I object to.

              Linus

