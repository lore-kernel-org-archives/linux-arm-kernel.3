Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2A8C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0af7qNQm3bacrBw+3pGC/CiybC+NXWc29Et+/4lyIIU=; b=RuCu06Gex5tX2JuFAq/c+dQIGb
	wUjh6uit7PKytBfkczpZq+T0tlQiD6n36KSeT+e+FOGLl4HK6b+UKSksW/fBf98uoh9rAVzzqAEzj
	F6+O/xYygK2voF8yNT4yd+6gNl6aNP3pcychaOd4aomF4aMcKweJN/27DTNDAX7ZP/ui2XjtGwTuL
	0GJvyqKk+cYaRgpItDnkIPlr9DjjDLS9+PeB5m6XWaAvUwogn0Q9hZW/xUfqr9ULMbHjl/egudbyh
	OuqPbf76vg+uTISVelWkJAUIs8+Tu+T6gC1hGV7eS67kcGnBuPnWU4VxAELXcrtEFmoZVv6xZH7qy
	kIvPf3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qdQ-0000000D4wi-0wim;
	Thu, 24 Apr 2025 07:04:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyr-0000000Cygc-46as
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9151968455
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 06:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E498EC4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745475760;
	bh=MnbDTkDjx7fGLQrr6aq33qeElS5aQV1V02HztW2z4QI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WtboPodAb4If3nkaa2PXy6oXsf0a3bXZctQ2wvPcXSI0l79MWAm4Z2gSZuz96IF9H
	 0qLlIMYtp2SHP6GDqfM8ztwqvVgTZY6FXR9F5f0adrLGLlrBdyf5RWCE1I7N7CrTTj
	 DAPkO1+pZGzixh+Urbuscma6hbYr7IX/6giX9wVWMj2r92tTCqm0d1+78+g71USLbJ
	 THF5D9zsliGl+VvssarcSIxgX6vlpU47E9eZMJKjYTEQ8nflTSxlLh63IVcKVnlFdc
	 SWV4SxmWIXzI3lSv6htjlMKoZppQdBmQJNjRQ4JTvSh2Z3t/BH9C3LOESeyqGxlX14
	 DIG6sr68pN51A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30db3f3c907so6900601fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIZFLh9dKMuZJMwJBXoo6APM6+EKGOHoxO0YFZWbM+VK8dJzGs6AOChXbrgeB8MgCTpubx7w0hSGGbaTHju5j6@lists.infradead.org
X-Gm-Message-State: AOJu0YxNj7el/GclKxHZ48oudJByQz8S9OOscbM4k/gIgdKShXyOkyF6
	CwQuE5ftkdyE7rSAboxyGs423RtTZjll+8bFe5VzkKMYRr8/AB2b8EHcKdDj3+xGgqxN7iZE8OG
	qP5+lGUSmx599bJ+heUqpd9J37Hw=
X-Google-Smtp-Source: AGHT+IEBg0GksqRUxYbq10WiBQxT674qV08e5XaXakQ/0Ux/wZi1/Em/Ff29tbRd93xidxYNQXuF7ob7W4sz3W9cDJE=
X-Received: by 2002:a2e:b8c9:0:b0:30c:3099:13db with SMTP id
 38308e7fff4ca-3179e5ea6f5mr4171351fa.14.1745475759305; Wed, 23 Apr 2025
 23:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250424002038.179114-1-ebiggers@kernel.org>
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 24 Apr 2025 08:22:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFZ-Wy9Z5Rqe-o6fnKtgm+=JQeFnVMvG=jmKz36=02w6A@mail.gmail.com>
X-Gm-Features: ATxdqUEf-FfEO6d9z_202RUFsmqfhy6LhKcEQhVv3O5CQR6i6602IFM1v6-7V-w
Message-ID: <CAMj1kXFZ-Wy9Z5Rqe-o6fnKtgm+=JQeFnVMvG=jmKz36=02w6A@mail.gmail.com>
Subject: Re: [PATCH 0/7] lib/crc: drop "glue" from filenames
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
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

On Thu, 24 Apr 2025 at 02:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series fixes an odd naming convention that was unnecessarily
> carried over from the original Crypto API code.
>
> I'm planning to take this via the crc tree.
>
> Eric Biggers (7):
>   arm/crc: drop "glue" from filenames
>   arm64/crc: drop "glue" from filenames
>   powerpc/crc: drop "glue" from filenames
>   powerpc/crc: rename crc32-vpmsum_core.S to crc-vpmsum-template.S
>   s390/crc: drop "glue" from filenames
>   sparc/crc: drop "glue" from filenames
>   x86/crc: drop "glue" from filenames
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>  arch/arm/lib/Makefile                                       | 4 ++--
>  arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
>  arch/arm/lib/{crc32-glue.c => crc32.c}                      | 0
>  arch/arm64/lib/Makefile                                     | 4 ++--
>  arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c}          | 0
>  arch/arm64/lib/{crc32.S => crc32-core.S}                    | 0
>  arch/arm64/lib/{crc32-glue.c => crc32.c}                    | 0
>  arch/powerpc/lib/Makefile                                   | 4 ++--
>  arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c}        | 0
>  .../lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S}      | 0
>  arch/powerpc/lib/{crc32-glue.c => crc32.c}                  | 0
>  arch/powerpc/lib/crc32c-vpmsum_asm.S                        | 2 +-
>  arch/powerpc/lib/crct10dif-vpmsum_asm.S                     | 2 +-
>  arch/s390/lib/Makefile                                      | 2 +-
>  arch/s390/lib/{crc32-glue.c => crc32.c}                     | 0
>  arch/sparc/lib/Makefile                                     | 2 +-
>  arch/sparc/lib/{crc32_glue.c => crc32.c}                    | 2 +-
>  arch/x86/lib/Makefile                                       | 6 +++---
>  arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c}            | 0
>  arch/x86/lib/{crc32-glue.c => crc32.c}                      | 0
>  arch/x86/lib/{crc64-glue.c => crc64.c}                      | 0
>  21 files changed, 14 insertions(+), 14 deletions(-)
>  rename arch/arm/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/arm/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/arm64/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/arm64/lib/{crc32.S => crc32-core.S} (100%)
>  rename arch/arm64/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/powerpc/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/powerpc/lib/{crc32-vpmsum_core.S => crc-vpmsum-template.S} (100%)
>  rename arch/powerpc/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/sparc/lib/{crc32_glue.c => crc32.c} (97%)
>  rename arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
>  rename arch/x86/lib/{crc32-glue.c => crc32.c} (100%)
>  rename arch/x86/lib/{crc64-glue.c => crc64.c} (100%)
>
> base-commit: 1ec3d4ff5c77422927896c1f7d0ed01267ec1213
> --
> 2.49.0
>

