Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF5DE677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV8yCMocDv/OPGrEgJmVudUgL/DOpRNs7uqcUGQkYYI=; b=sZnCqQtWeyrFCoOWAz0H8vsFHP
	2Hl82kQTgxi+POlvto51fFAv0fOqoFcpcjdojVwiI9FzvlvJbUBYyope415aDbhsa47AaEz0Jm4Ev
	rHfxYLLSrSJpBi4T92Gp2SZAmUGuqFJ7R2hm6EheGd2L8M7Syp51Y72Xjksbu3XzHp3veoKDmQm7h
	d6dcytfQ4JPF23j2dDw5sqaon0fsSJX/BZ5xoDPa0KMHNqpAYVKYLkRGe+AIvJwEz2aSRwstR8GBF
	okM9XUFAdKrMPhC7LYNG9CU/Hu2OjBjD6MyrRMYXWAXBTEpUqr3QH7kq/o2FdJ6ftyHYtK6Zr2uh3
	spG0J/cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bmd-00000009XIx-1L3s;
	Sat, 02 Nov 2024 10:55:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bf1-00000009WU0-2uBD;
	Sat, 02 Nov 2024 10:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DD465C273E;
	Sat,  2 Nov 2024 10:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC172C4CED2;
	Sat,  2 Nov 2024 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730544433;
	bh=M7FdSpu+PhluM81llzaa2KRxqj+jubQ2BPx4TOrWNTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GETuJANeH7gctgmH/+nyiGbLZgU60kn5uvKaHdxC3jOHXyMIY+5SIP3FVcC5h/4vv
	 2F7xHCEoHJS0lX3P7aD3ut8mIFSrFv0fHm6Op2JrumAUKGqrtpD0EWeTVv6BzOthLb
	 cOPP8GebgckiemWtQdsi6mBWqLiYHzeSWyMzb1zENPEsHy5Xv2w9L9UtNhAaMFqePl
	 DwhnDPyV/TgRCpycn4X3kpJ24lrXa/PI2ONFP7TokPIoc1Slpz4EGZ4aA86XjzMGou
	 SSLprHHgimxQ0kP5J6bxA4m+lTjGXKTj+ngmbOktZM9E/03kahXIaRmHD6mbHIg0BX
	 2ajJSBCd/ctBA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso25714101fa.2;
        Sat, 02 Nov 2024 03:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOe/+MlkyjN8m7iJi8mXvXbxeaMCxbCjGMhqqB2QigynjRONW1VtwQiGkF9pBOKMH5ScUITvS8StWA6/i94HIa@lists.infradead.org, AJvYcCW4elwnTzTZPTY6RqXbX8ucNKPO3aRl4kGtjdO1dwB9Xo34b1yk7dV9ztPnEm2xwaO5Szb7sn7Cpg0QD7Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuDrj+i6giNjqlQeDncuCnp185CFCYUeu3p8rjeCrm0PU51SiD
	1Hkdr/z9zSg8B7jNq0GDBs4inSx9qDZIFXF0WxANaaqrtGCBuOC1N5VPnmGeAw8IK52mDreTABG
	MiZLPCCyEOzmKoCmmdmlwI24S/1c=
X-Google-Smtp-Source: AGHT+IH0WCZimX1F/VX+DWohj1qqHgkCvV1OEM1qu/eyPpSjntB2c2S/MHD4wvbHvrBfL9ia8YhfUT4VBcWPbilaETQ=
X-Received: by 2002:a05:651c:506:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-2fcbe0989bfmr124544811fa.39.1730544432162; Sat, 02 Nov 2024
 03:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com> <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
In-Reply-To: <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 11:46:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_034716_069085_77062AA6 
X-CRM114-Status: GOOD (  15.14  )
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

On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> >
> > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > sha) via the shash API.
>
> OK, given that btrfs is still doing this, I think we should still
> register crc32c-arch conditionally.  Having it point to crc32c-generic
> is just confusing (at least if you use btrfs).
>

Agreed. So we should take this patch.

The current issue with btrfs is that it will misidentify
crc32c-generic on arm64 as being 'slow', but this was already fixed by
my patches that are already in cryptodev.

On arm64, crc32 instructions are always available (the only known
micro-architecture that omitted them has been obsolete for years), and
on x86_64 the situation is similar in practice (introduced in SSE
4.2), and so this patch changes very little for the majority of btrfs
users.

But on architectures such as 32-bit ARM, where these instructions are
only available if you are booting a 32-bit kernel on a 64-bit CPU
(which is more common than you might think), this patch will ensure
that crc32-arm / crc32c-arm are only registered if the instructions
are actually available, and btrfs will take the slow async patch for
checksumming if they are not. (I seriously doubt that btrfs on 32-bit
ARM is a thing but who knows)

