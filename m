Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA82C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIskrCVvgeo6MB99hL+e+aZvm7O6lSSjP/NM8xSozbE=; b=qgT/vpHPaAZOTvz2B+GgQhfOkL
	kZjjSsWvhktnLpkKXeS5U5upnAeSlJodjE+WyxPkLHCGXgB8Ia8U70JseZJsPnYEiU6dy+/vgtsU5
	UPCMwK8Vstjiazfq24f04dWTtZ1KpJriRb1wEoYSkir5Jqpi49HHtITDR7rXZ1Tbn1iexQugs49Wi
	Oz3fSi6kowuVpRVnuOLlNtxeMWsexL2MjZ4YHYssPOU/WeZ+46cVbHpx0b7tuqTeF4RJ4sgNHfBpv
	5tb61Vq8WGsKL0ATQMv3QCXEEMjx0qRrsDt6gVcU8IaSp5QE7y/ut7WqtNaJiEwl+TGYJRy5vJBYo
	VMzXCdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIGs-000000076qU-3rfr;
	Tue, 18 Feb 2025 07:43:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIFA-000000076QW-258X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 07:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0E0BA41D2C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B863C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 07:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739864531;
	bh=IvK/YZdxhIzz+WQDui+6ei6dQMpDPKxU2syoofLtyUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gthhYI9H3TZNlItYwrKDSFuBdEkiKZrIrU49lRCIALScYrla7kqdufoYgJbGesW/s
	 ZfqxxSTLbGj+8Qi02jw6wsu7IjVEgz+bO00kvW3TUsL0f4tzjbMOd/9uV2HfiIurGn
	 9m47eoooc9igVM7Kr/FL6sr3en6A29okd0rLtNhhTWvF/CB0QtRNolG7vflfcsD6xz
	 5Y/qo9rK8O3PiqfxmhGwBv3+ZcwBzQrmF1rOAzJKp2/QmhVDrqXUJv1jdVM5dlk+on
	 Cu6aRVRbEFTEck7PdHrsS7uMdIMjjN8PGkfUTeir2LhQ/k8qQ00Esd9LqRLeaDttod
	 NGahJwRUtODMg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54622829175so1596440e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 23:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHVxPhpUWqs/BmIzSOC/iEiQ03N+Rm8tCthMNHyVGD4HRQpV8/f3wLE7pZHf5G8u9F/68e552O/qaBqBv8x86N@lists.infradead.org
X-Gm-Message-State: AOJu0YwLpPwXLq5Jszh9ekDjmP958+97BI1Wu/AyFzj36QqbNg2YZocM
	mV3KUCXNWdvDISKMwr+IOMmE/3Roph++wpenF4bXVt4nrjey/JnslcYZjGVU64NQQ0XDgzoUHAU
	qFCf/zyaTShBUImN7dUHKBGwtKds=
X-Google-Smtp-Source: AGHT+IHcwsPEwQwvSNlp7+txo1ExLwL6bb64NekXlJS4T9EnBQWu9yYoLt2pG9NrnPvUbCr2H8go8Lh60C6VvcSVOhE=
X-Received: by 2002:a05:6512:2342:b0:545:60b:f394 with SMTP id
 2adb3069b0e04-5452fe27255mr4337762e87.4.1739864529480; Mon, 17 Feb 2025
 23:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20250212154718.44255-1-ebiggers@kernel.org> <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain> <20250215090412.46937c11@kernel.org>
 <Z7FM9rhEA7n476EJ@gondor.apana.org.au> <20250217094032.3cbe64c7@kernel.org> <Z7QBuIvr4Asiezgc@gondor.apana.org.au>
In-Reply-To: <Z7QBuIvr4Asiezgc@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 18 Feb 2025 08:41:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFe2f0cCYznorrO-wJyh-qxJP5z-HdR9rbQiuMKC5u6qw@mail.gmail.com>
X-Gm-Features: AWEUYZnpo_Rxk-ow416mB2XJK3Qj-eZIWTL3GmEexif4qB9L-kVkI7AOouI7sOg
Message-ID: <CAMj1kXFe2f0cCYznorrO-wJyh-qxJP5z-HdR9rbQiuMKC5u6qw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer hashing
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>, Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev, 
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_234212_608117_6639BD8C 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, 18 Feb 2025 at 04:43, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Mon, Feb 17, 2025 at 09:40:32AM -0800, Jakub Kicinski wrote:
> >
> > Yes, that's true for tunnels and for IPsec.
> > TLS does crypto in sendmsg/recvmsg, process context.
>
> OK that's good to know.  So whether SIMD is always allowed or
> not won't impact TLS at least.
>

And for IPsec, I'd assume that the cryptd fallback is only needed when
TX and RX are competing for the same CPU.

So for modern systems, I don't think the SIMD helper does anything
useful, and we should just remove it, especially if we can relax the
softirq/preemption rules for kernel SIMD on x86 like I did for arm64.

