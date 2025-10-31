Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2826CCCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWeZLFH5RpgoAv9utSwqm6Yp/w0k/N6YxdsEFm/omZM=; b=HDXAOyeLqtUQ75XJtusNqB6Ocr
	HXEqEBIHNr9sxxNSQzIzkJL9ZtFUqk/S1z/Bt9cn3MKLvLmua/WLfesPoWsxbt6jZMKtNYfZ2TGHG
	s1qA399Xr/75f7OjwxSlmsSRcFgg8+r0ULNfpLCdqDvjkIyBOWuQ8eQyMZZmZUhm2X3p8VIYlXsF7
	gJjXjugJaqkHD1onyHHNGf6OMaMMH9OYuuugAV/HBRDymF30yvnplgdJS5tXKPgi10XFQBwPDzEn/
	mzHIImmqTZDMSAKnOCx/c1/9LMfhYQywRp9ljXlpBcAbLcUfw/XKvfSlrJUIWew9v+4VSr3J5woSC
	Y5Fqb7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEplX-00000006Cge-2Wwo;
	Fri, 31 Oct 2025 14:06:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEplV-00000006CgA-3Z7a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A9C162056
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1255C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761919565;
	bh=aWeZLFH5RpgoAv9utSwqm6Yp/w0k/N6YxdsEFm/omZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=abxjRt0ySxBJ4xYXAFBU9dhgABvTdBFl7LU+6Gf3bGyYJFlzw3fNnN7OEPbPB36HQ
	 f1ecGzv32VApuXP5oieVnrqzeJ5zOXeO9tXAa27FU18gQMGdCood3vIG5R+iHL8SA4
	 ZqeDk/kGPDsPGYQqD0pLJ+XmioxRHI7ZpSBfdvik72JTIaA8gL3pZv7OXDT8UFccUq
	 egVOsLvOOD5QgesUXdlelSyn8GXcs+HXvAy61/KVhXSEimaorpVvcaY5TargEqTCg+
	 5P6GLFFaW9g8uUp+rsgo6/uDsN1vGN1GFdwjqRmc1cHwIId4X7Z9Y715pHMOPNAD0S
	 6N4sqMXDgFBJw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591c9934e0cso4049086e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 07:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhtcdB8FYJDZDuSg3Ul/T5I/f6p6RKpNEycfmPXXE/HuqYE1Q8SEmQ5J9bA0kbkIeeGk7jaJkYwUATA0EcSCIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDdGJCBLk3yjrAJqW06IW88wXJWCZc/SCklqjaYieBtCxF8Cfu
	pRAc7QG2SzPGe0+POPkQDEGp8WxbHWZmU58FoS89I2/9GhumNmvTk648YXlePjeJeDnND8ie1wW
	r+DS5XtBVXmVO/0nVHZFZCaS9LSqn0MY=
X-Google-Smtp-Source: AGHT+IEp5m47JaUV3jVoZQ5XMFczaX0U7o/VOQHO5RGjNAQsdXQw+KNXcUYCJlrWBHGG6aoWOl43H+2qo/UwG+8ZTYI=
X-Received: by 2002:ac2:4c53:0:b0:591:c346:1106 with SMTP id
 2adb3069b0e04-5941d4eedadmr1292338e87.9.1761919563392; Fri, 31 Oct 2025
 07:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-27-ardb+git@google.com>
 <20251031135552.00004281@huawei.com>
In-Reply-To: <20251031135552.00004281@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 15:05:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEJbnKuhEjBGxtH6ri9fkJ_AygfLFMXVRbnnVKqWzSrBA@mail.gmail.com>
X-Gm-Features: AWmQ_bkKphB_oRPPSkEzIfFAX2WH5E8Txm3hjePOvgQQIuD6R_hNOY7rI6PkH1Q
Message-ID: <CAMj1kXEJbnKuhEjBGxtH6ri9fkJ_AygfLFMXVRbnnVKqWzSrBA@mail.gmail.com>
Subject: Re: [PATCH v4 04/21] arm64/simd: Add scoped guard API for kernel mode SIMD
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 31 Oct 2025 at 14:55, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 31 Oct 2025 11:39:03 +0100
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
> > cleanup guard. This hides the prototype of those functions, allowing
> > them to be changed for arm64 but not ARM, without breaking code that is
> > shared between those architectures (RAID6, AEGIS-128)
> >
> > It probably makes sense to expose this API more widely across
> > architectures, as it affords more flexibility to the arch code to
> > plumb it in, while imposing more rigid rules regarding the start/end
> > bookends appearing in matched pairs.
> >
> > Reviewed-by: Kees Cook <kees@kernel.org>
> > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Very nice.
>
> FWIW I looked at all the usecases and other than a couple of trivial
> comments on individual patches they look good to me.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> For patches 4-19
>

Thanks!

