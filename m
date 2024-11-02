Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53D1E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=; b=lyh3pz97n3nBKYko/pQRjdQ6Nw
	1xCn+j/a3mvTP5AdzKmdkMMw43pDu7CM7ws51vZhDowhFQ7F7YHXZDIyXlsE/d91ohHWQhAmmKqgs
	zOreuT4bgLGHYmU9Ef7sLcbVs1ONVxcW/WP9XIKou3zwjahOxd+ixx34KLVWrfRKUCkKO7z595k6u
	GIzHCuCDBGJK2/IeJ6D9jyDKL5m4PY3fcPOQorIVQvDhi1i9Z9z0Au4uWzKUVgKd46XrcxllVOkh0
	uzfopj79S63s6oOaJjXe22pGhbb5LKIQOgvzlsOnCDAc81Nn7WJesGB9AQdcEId20q88by2SHTRQX
	t9MmD7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AwE-00000009R9e-1bQp;
	Sat, 02 Nov 2024 10:00:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7AuY-00000009R00-45Q7;
	Sat, 02 Nov 2024 09:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 743195C0F7D;
	Sat,  2 Nov 2024 09:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D464C4CEC3;
	Sat,  2 Nov 2024 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730541554;
	bh=jzcc2qtlo3q2yjXZFmDXUgFRfJJPX4XAPzkwICumNQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pTAZ258u/Bm55mgKfduPxcJ4+l7utIbI96FN3uHiYroZBZHAbnvfCZty3m5Rr2XH+
	 F9H9kpY23mllFcm03reDqSDwYlj6z0PqW6iPcayBoJoKDOej6utxzDbE1LxiDgLJej
	 urb0cE+UNWmcsBfRHpQmITbawEzxNGoWVLCC3Y8Sm8pFGBsK9d4GCjck+Inw9773Iv
	 K9VihTfRaPahcmoyEauQixFxZyTUMGJWDTOfYvXPoPOgSsyaIxQpyV/cg9HQXOUiLk
	 wu2j/IQnCytheMbmA1fvWXZkbzI7ui/5dw0pO/X8IJ8Hh4LoxB9jvG2GJ0onELclPL
	 6WJfZCxg2RXng==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso39974791fa.2;
        Sat, 02 Nov 2024 02:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbOzUI6HQeL7tHU6VuJz3+/CCl93ASwOYA5vfqRie4Y4249crPdF547NpI8FWfMLAAY+aAowIWMb9VgjzATxnn@lists.infradead.org, AJvYcCWq3D866z5/sLdKnJ6BQEExiQVvK9qb8Xpjj2a5EhVgA28l0708CgzuU+wp3uzN4OOfbnSJa3iLxPDdvNM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN/sCKG9KTwrvOgOwBFqq/G2kTsmQlruy4htx9vtW+0G9Sdepe
	JRVx1sgV4zIYE+kSZnf6xwBzBgRtd4mHBJer+AyIIh8LSF68/N0x6ATOMzFXByzkqa1bOmHsNRq
	92UhfnTKi1XBgOD6pK62IdddGdAY=
X-Google-Smtp-Source: AGHT+IEqeG8VCff0uhjP4V5ORLaNGD6KRrpJIJXC1kxDqwtW+gAEc3mfRLYGB8V+37TlYDdzVpYd4mw53pqQuHqGPG8=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr47293611fa.19.1730541552417; Sat, 02 Nov 2024
 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
In-Reply-To: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 10:58:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
Message-ID: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241102_025915_077862_21C4D1F0 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On Sat, 2 Nov 2024 at 10:45, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > While testing this patchset I notice that none of the crypto API drivers for
> > crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> > system that uses those algorithms (such as ext4) just uses the library APIs now.
> > That makes the "check /proc/crypto" trick stop working anyway.
>
> What's stopping us from removing them altogether?
>

At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
sha) via the shash API.

There are some other remaining uses of crc32c using shash or sync
ahash where the algo is hardcoded (NVMe, infiniband) so I imagine
those might be candidates for conversion as well.

