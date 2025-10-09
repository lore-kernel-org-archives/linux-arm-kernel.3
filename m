Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC829CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 21:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4loDIqhblCjJ30GBRu0k7u8qIz2dPxyVOru+CGKtJ74=; b=BiSTxRX8F4PQ5T8TY/S3xm3IUs
	Pfn+AkfywVLA/E0sdQgHIe7cMVPo604xCe675/PlEIO9QE0xMutdqCSYB27V/Yu086J8tWRnAzuuL
	P2oZOn51L8lYMfZnt4NR/LXF+M49WRqnRH/OdBCwd5WsOD+rzTwk96Cn7ZbixFBkpMzQO/kuXqIk5
	HORuI/4zhG2bwIA1++V8pc08hu/vjmowc/SvpTk61H6pfQjZhO9iPTRjASPD5Ze1bRNYST32WeW0l
	+ZVkTiQyBlh/l6wU6osTOO4Z2RHqFNZneUkW/+clyzyPWQo2gqP+wglzAg+vcL4kVADVPzKRXRoK3
	ITv930Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yAo-000000079qx-4Bzu;
	Thu, 09 Oct 2025 21:27:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6yAo-000000079qo-1KsC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 21:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7B67601A7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 21:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67283C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 21:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760045261;
	bh=4loDIqhblCjJ30GBRu0k7u8qIz2dPxyVOru+CGKtJ74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YaUSiFvVHVUtoMbaMFXZECh1Ue/nAlF7ytJcjfdOBeUZ5qKjrmG4Vw4ZQV3Ab6/o0
	 8oGRq2w0ekpTSCJuSDfKPzp3ylv9u3fDE5hKK6xoJQh44VL8D2XNG02kUCqrRGhGSA
	 9q9R5MidL2Uoio3BihyomjeV9rCOfM2a9q8pyVj5fDn/I1FxIq4pRmjRsaLiWtAqh9
	 ESrpzXme7KEHLYul0nVhvk0eVXvBJX0insfF9UFSLR05ft9rZ5PZy0+WcynhkLqA4i
	 W5V76/vMCSX72cgCNwUFm5+5lBcL60I6Jykh8MY6aJj+Z0YV1FUhsj34rgK17XeEQr
	 tqi/cR5jFxMTA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso1612989e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 14:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrBcojeUwDh3neYUXnneG0yrgtEJqFdy8SjELuGipQgxT07rS7p+rCofOy0Ze4z80YTWK9SDXBbV9qZbWEVSFl@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQz7AWf90dZa0TvOialN6hvsGk7JUMDcNG4jXf8ghrI0tG4uv
	3pETMJzSq4f3bbq1DMgimFguT/8KX4uGkff5QIDt+ZuAU64DamumfwTmkvEOD/gMxSN/Ef7VvPI
	EsYV2z5f4ydhepy68dLBUWeqNGbbwbBc=
X-Google-Smtp-Source: AGHT+IER/TjSS/ftsXuN+vL0Qr19tffVlZEETaCj2FrKKovdy0RneNyLm8hMt38oGA2BPK1mfYI7btUasVrhpusvupY=
X-Received: by 2002:a05:6512:3ca8:b0:57d:92ec:67de with SMTP id
 2adb3069b0e04-5906daeb7b6mr2786494e87.57.1760045259802; Thu, 09 Oct 2025
 14:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251009150621.3886079-2-ardb+git@google.com> <bbc089aa-934d-4dd3-825a-53f8e98dfd3f@amd.com>
 <15d5b9dc-8452-411c-9957-ba759d307223@amd.com>
In-Reply-To: <15d5b9dc-8452-411c-9957-ba759d307223@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 9 Oct 2025 14:27:27 -0700
X-Gmail-Original-Message-ID: <CAMj1kXGLdNDJRgQg2Hr9YM4Ke6Sb6KLr8Ws-QY+umR4NpXjg4w@mail.gmail.com>
X-Gm-Features: AS18NWBLRyAo4AK5pdIQjAzn4UZLNTXw2YS4IciwUevqRyoiy4COy88E11E6XIM
Message-ID: <CAMj1kXGLdNDJRgQg2Hr9YM4Ke6Sb6KLr8Ws-QY+umR4NpXjg4w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Permit DC_FP_START/END only in non-FP
 compilation units
To: Harry Wentland <harry.wentland@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Austin Zheng <austin.zheng@amd.com>, 
	Jun Lei <jun.lei@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Oct 2025 at 13:41, Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2025-10-09 12:19, Christian K=C3=B6nig wrote:
> > On 09.10.25 17:06, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Test the existing CPP macro _LINUX_FPU_COMPILATION_UNIT, which is set
> >> when building source files that are permitted to use floating point,
> >> in the implementation of DC_FP_START/END so that those are only usable
> >> in non-FP code. This is a requirement of the generic kernel mode FPU
> >> API, as some architectures (i.e., arm64) cannot safely enable FP codeg=
en
> >> in arbitrary code.
> >
> > If I'm not completely mistaken that is actually an issue on basically a=
ll architectures, at least x86 is affected as well if I'm not completely mi=
staken.
> >
> >> Cc: Austin Zheng <austin.zheng@amd.com>
> >> Cc: Jun Lei <jun.lei@amd.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Leo Li <sunpeng.li@amd.com>
> >> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Anyway, patch looks sane to me but I'm not so deep in the DC code to fu=
lly judge.
> >
> > Fell free to add Acked-by: Christian K=C3=B6nig <christian.koenig@amd.c=
om>, but Harry and Leo need to take a look.
> >
>
> Thanks. Good safe-guard. Flags a bunch of issues in the
> current code. Let me fix them before merging it.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Thanks.

I already fixed a bunch here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dddbfac152830e38d488ff8e45ab7eaf5d72f8527

