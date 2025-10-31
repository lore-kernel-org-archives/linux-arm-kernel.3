Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C23ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBolbOidTVDXd+M6F8/1utZa4QkERcSNsxD3XR+7bIs=; b=nyma2Fa0n5Wf8G+4Aif0lHWejP
	VC920+TgqeiXWn/pt9njfqz6GD6aVPGCpjI8U/MBt+1an68n88UcZVzbAFCueCypbpUBUsZbwtvE1
	hiT8uwYK2gbQ87opKT1AIksKm/VwxnKsiTS2PEqXiHRMZA+39RiDk/gN5Gc5myg4XduSd9Nx5hpHL
	ijl2qdfr9U5xIr2XUqcJflHn2BM0D41xgcXdaX6eWDqkpel9EWOWpQsZufMYkdFsbvKtxUJRTNDIK
	n+Zp4BGPRZgz5OEfDSXnxZy+6rx/sWhU0yvUisqR9i8J0EvSM0zvx8qpB/MLav4vb/k5iUPtld7sf
	dCS6pakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpbO-00000006Bbf-10Mr;
	Fri, 31 Oct 2025 13:55:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpbL-00000006Bb1-4804
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 435B74457F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 13:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24033C116B1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761918935;
	bh=v3VvIeq1kalKsC6WM5dMlVLengQEPJKTqscmAdyMeYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cob1Qxz39lpi2xIg4Mj3s4Gz1VcIl4/pAX6C8duKOD5RssUYSdDtdhPKHSrnAoIu5
	 dg26ILKtrkjhcG9IlQZGPYX/7SPzrnpItbS1qq0f4A7M3CEYli+ALSHlnQTIBCZcPy
	 oylytXG4+riabH80DYVVETBVMeFyC8nDH1J465jqDAw5CKhjPCLesGcQhpjWDiGaYY
	 AjlcLU7PrLvxyIqS+tNN9x+b9Ic4V+rP/Va6RQbiyTiDOWTQU95xqxTmWNRXc4Pp7p
	 HxXA6ZDu+VZhIRqPg1ssftD/pqD/aqCWIGRtoqmQvr/kMtxlRzRDtFjl3RJX5UvfMY
	 OjfBevp9hlmfA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-58b025fce96so1847754e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 06:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxccQE0OUJL1qrhKoUlBtvspmz+uHQnF4C1h+Lyz8FhYnhz+pE4pWrEJnLTgYtzwp+4N/F5EEPy4kDAp8nPjpt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx85Hfe+XMPIe+c3oodXdUt+iz8pzLIVsBcWRSs5dT5hEL4JsmJ
	U74LhPzrRxPahjZgkG9j+kI7/i3lxwtaIBrm37fs5zLPyvTA8O71p0YpLa3gOP1ojeSxqrP5wRZ
	TkGutTH2GaX2X8VhiDQPAllXgO+Udr54=
X-Google-Smtp-Source: AGHT+IG1bte6snjK1s3dK2Umz9uoYmGqVGgRP20JEm9bJQ/H77GL9ShEJSh/fhD2EeRJZGQNy75zI3xS5uaxX1JUBlE=
X-Received: by 2002:a05:6512:1247:b0:592:f601:641c with SMTP id
 2adb3069b0e04-5941d51804amr1532755e87.13.1761918933518; Fri, 31 Oct 2025
 06:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-39-ardb+git@google.com>
 <20251031135235.000007cb@huawei.com>
In-Reply-To: <20251031135235.000007cb@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 14:55:22 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH+3F7qeYEtOYmNFyLgkuAQ9N6UZBf69CmQde7AiRY-6g@mail.gmail.com>
X-Gm-Features: AWmQ_bmr9chj-sk4Yy6yeLAmYJTGZ-449jqdx9KPPiSXON9Geeejeh87JQ5JRaE
Message-ID: <CAMj1kXH+3F7qeYEtOYmNFyLgkuAQ9N6UZBf69CmQde7AiRY-6g@mail.gmail.com>
Subject: Re: [PATCH v4 16/21] crypto/arm64: sm3 - Switch to 'ksimd' scoped
 guard API
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065536_083761_3EECE53D 
X-CRM114-Status: GOOD (  21.11  )
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

On Fri, 31 Oct 2025 at 14:52, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Fri, 31 Oct 2025 11:39:15 +0100
> Ard Biesheuvel <ardb+git@google.com> wrote:
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Switch to the more abstract 'scoped_ksimd()' API, which will be modified
> > in a future patch to transparently allocate a kernel mode FP/SIMD state
> > buffer on the stack, so that kernel mode FP/SIMD code remains
> > preemptible in principe, but without the memory overhead that adds 528
> > bytes to the size of struct task_struct.
> >
> > Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Hi Ard,
>
> Trivial comment inline.
>
> > ---
> >  arch/arm64/crypto/sm3-ce-glue.c   | 15 ++++++++-------
> >  arch/arm64/crypto/sm3-neon-glue.c | 16 ++++++----------
> >  2 files changed, 14 insertions(+), 17 deletions(-)
> >
> > diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
> > index eac6f5fa0abe..24c1fcfae072 100644
> > --- a/arch/arm64/crypto/sm3-ce-glue.c
> > +++ b/arch/arm64/crypto/sm3-ce-glue.c
> > @@ -5,7 +5,6 @@
> >   * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
> >   */
> >
> > -#include <asm/neon.h>
> >  #include <crypto/internal/hash.h>
> >  #include <crypto/sm3.h>
> >  #include <crypto/sm3_base.h>
> > @@ -13,6 +12,8 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >
> > +#include <asm/simd.h>
> > +
> >  MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
> >  MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
> >  MODULE_LICENSE("GPL v2");
> > @@ -25,18 +26,18 @@ static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
> >  {
> >       int remain;
> >
> > -     kernel_neon_begin();
> > -     remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
> > -     kernel_neon_end();
> > +     scoped_ksimd() {
>
> Why does this get brackets unlike other cases?
>

No reason other than the fact that some time passed between writing
the other patches and these ones, and there is no functional
difference.

