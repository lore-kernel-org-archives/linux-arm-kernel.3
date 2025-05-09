Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E695C3ABCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbJRfEfZX/grpV533K3PvAenCi12MwFHxGqohOtZjzY=; b=uNTzXxWYGY39rRcdVOSdX/qhvK
	l5mTAqKa999OeMX3j0GOZMU3TfL4bLftZTkHI10VblqqxANSlg6Jloh8LlgXHHXD3b2GfwGaJiUYQ
	VqF8HerQMFcJuFhMEZAO39/GdDz0QQlcfTC+zFVF+GvfeELcisrnvDgGbJytdhU8tKMzfdl6nin3B
	YsKa3fRD2dabbrRxCmwoKH+CZd4bcWeSYLGZw5/vdvzN0gXa+VZVQE8VCWKyjF/hA3fZpTE6L/Tb/
	EfFNZlDQqUH+9UhWlj6z7tOSIdNNuFrxDDSyUxzUTzAVeRQmPiP06rvDJ9mPiYLFUzC+OOAYvAoNM
	zhJFCgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHs-00000004mje-23pt;
	Fri, 09 May 2025 20:25:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQl9-00000004JtR-21MZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6B3A61120
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 16:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9361BC4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746808778;
	bh=6FEviuXw5nGn+Hmig2ljKBflhhBQQp14Wbbejw59cLs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcwwKiOkRrU4HTLoEcVoE2rBxrlqmnmGkeedxE1J+aV3uNpQFISbOHZr9nLXyJEKq
	 saI349KCwa4MOuqC4Hsx5NU8bRcZOK9usTY+X1pOI1lyL3xhf9Mh3ZPrXiNF3941DO
	 twDNbnXxIiC/rkZcx8OW9aXWRehszCZ3KFZLGL5a55lzsebWEh8lGyrh0ERG1ghdB5
	 4nc/JShFW53K3Dy1awrzXQu5pRn8BdQnyKqSsezF7shv2oAq/13hBjBTKiqPKXp4XK
	 SjHqcdihOv4hD1Az9E4Ehk0xadD1B8UXzA6bLnG07KSEAxpfOti5RexkukbvCK25RO
	 AYFZRApdAbCQQ==
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f53d271c4cso21627046d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 09:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCR0az2ZcjWTDvsnHA2D6G9P72snqqVVV1fPy85qgGymbusUABrKRSqm63ftTnbazdBwGlXMAfs5lkKVkF0bk5@lists.infradead.org
X-Gm-Message-State: AOJu0YybVAS5UcaLi99aoFT/qy28f65GUeAdg2+IyV0U9phgqry/PIut
	WZt/Y62sfKpH0N2Tu8mhJSKCNNTbQEq7sOaw7EuekqF8R41E7KWcwCyuniub50wH9oKEy5VZQCM
	A79vqXNBp25isQ5RYYEiwHvvxurQ=
X-Google-Smtp-Source: AGHT+IG7Qkv6PwCNMeso0Mlb1IFTODYGTeFy1xHYEsIiAd+ZmwZRX+yjO9rDEckjmTlA1+pYKaNPj5PVlAFbcjtUo9Q=
X-Received: by 2002:a05:6214:27e5:b0:6e6:602f:ef68 with SMTP id
 6a1803df08f44-6f6e47aa6d9mr69893956d6.10.1746808777610; Fri, 09 May 2025
 09:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <20250509161508.GB5984@willie-the-truck>
In-Reply-To: <20250509161508.GB5984@willie-the-truck>
From: Song Liu <song@kernel.org>
Date: Fri, 9 May 2025 09:39:26 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4rgcw3Dqam4Hethrkd0jqzuwebh365g-7xkg_g1QM78Q@mail.gmail.com>
X-Gm-Features: ATxdqUFiLngFQqOugoZ_DZ4xcnihIa5WKMk8-tSR7dUYRzJb_ZhDOHoUAqmfnVA
Message-ID: <CAPhsuW4rgcw3Dqam4Hethrkd0jqzuwebh365g-7xkg_g1QM78Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
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

Hi Will,

On Fri, May 9, 2025 at 9:15=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hi Dylan,
>
> On Sat, Apr 12, 2025 at 01:09:39AM +0000, Dylan Hatch wrote:
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
> >  1 file changed, 83 insertions(+), 46 deletions(-)
>
> On its own, this isn't gaining us an awful lot upstream as we don't have
> livepatch support (arm64 does not select HAVE_LIVEPATCH), however I'm
> not against incremental changes towards enabling that. Are you planning
> to work on follow-up changes for the rest of the support?

There are two patchsets that are trying to enable HAVE_LIVEPATCH
for arm64:

[1] https://lore.kernel.org/all/20250127213310.2496133-1-wnliu@google.com/
[2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@=
kernel.org/

Toshiyuki has tested this patch with both approaches.

Since patchset [1] depends on SFrame, which is less mature at the
moment (clang doesn't support it, kernel side code is very new), live patch
folks think [2] is a better approach at the moment. Could you please share
your thoughts on [2]. If it looks good, we hope to ship it to 6.16 kernels,=
 as
we (Meta) want to use livepatch in our fleet.

Thanks,
Song

