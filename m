Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C24D6C2B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 00:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJ9wzI1TmlQXej6cFMiTpABwAkL1fHo62MR/nWPSxQU=; b=Si/P0QAiYNmWO0oa8dZmdqg8K2
	ind4ncXUOLXpaj6bYrGiPIzYAQjMvB+GzBxRGiEM9sN6HSboQ6nksNyY+oBYxJapcZe9L9y6WTGXt
	FqteCXAA4rN/3IUhU4Va5N6Lz4mV7UmOfic7Qgphly4bZA49lKKVXhcIDVaCONjW27+eeaHf9b01g
	WGSGW5mmwJC1rhHf8WKlnm5hirdzv2XpzFN4DiKGdgWa4OuRvhLz2gXBmH0KylxS5oBc9byu7jsV3
	j6trmSOUjXcSdHxEYxQODrtw6go6XJrZyuXLdCEG57mALTexfAUgn1UpB96hSUf0tpywGqukDK7w3
	sYmYgt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDYDg-0000000E2Fp-2TkP;
	Wed, 20 Nov 2024 00:05:20 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDYCj-0000000E25i-3Anl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 00:04:23 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d4184f2a39so10077336d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 16:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732061059; x=1732665859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ9wzI1TmlQXej6cFMiTpABwAkL1fHo62MR/nWPSxQU=;
        b=3XRPfxdITd/YtPippiPs4W7kNMeuMvyqTumLvC1LK71Fo7MubR/KbPcUFz4i6r9kSF
         m5gii85f/9E/Jt6ut9GYPTW6FWW5dOrrHrpMImIwzJGkN4BmLILJAyZH6cvKKK0b6xz9
         ghnFIBH0JIhvCw/AqImUvhDr8o5NGey3aTj3xoAeG7IMMB6SrhV5rSl+iuf5YbBBnv1+
         jCMUw+D2EJt6VpGDaFNTPWTfSu85NLPzTkBS12zCLL9HUdM/JFseRRvDkcp7OETAZWky
         nymI33bJcVETQhIErK4BgzFTVykOmWzdbv7SngnpziYFATQq9rgGm/7kKm0MEWbOzzAt
         Xpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732061059; x=1732665859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ9wzI1TmlQXej6cFMiTpABwAkL1fHo62MR/nWPSxQU=;
        b=cH9pDTQyDSwCgEU5ZC2RT2p1wiOsCHMWvgz5aZjtZK6DrUMcjl1bS8GsBAvhdCyssU
         Jx33vUDAvjxDbNnmGun8HwboADtfR+vkkzypUGGb7A4I0nwl8nImt+LskU8lgk/VdGjC
         LMqdx3eW9xFSjJtEi4SoSuY0fuvoJFkbjFsd3dPEO6xo7ukN1nJFG1PGQHrC4SBTe04O
         6D7QgbssHnh1KFvrj74pRZ+nRFHeAd2tGZmUEucPWlPS951FY5667j1muB0ZFFvKVjHF
         x4HgQfw+XaMw7VsWoxhlO/clQkd816nLrHVhqlb2goNJbOpqYMNuYPAdo505vpx9W8Im
         JSFg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Op3XXYk5JHQpPl6q2/Ln8ceotenOq9mnBscRshNr+BQ07wSqdv6xd4cYlHHrqaZrkENBjZ1OzKrAq2P9lPzh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1pDXCAMW1wQIgkipxR7yWG4WNsTQWG6HoIkVjw9IZT2rWBq3U
	Cc5eXqXZ/xIndTnKfon8I4826wW/68LVlPtQMVndDkzSo/OU9+Omqn2wxg9NXUjPvWKNASGBq/3
	O+H76mM+sU025bvN+iHNSFJWvPuaKcZnZd0I=
X-Google-Smtp-Source: AGHT+IEWyuVUbKDwVZV4fuwYJYdtkIx/t21su1G7P/j2rRkl2QZ25EqdPTldFuoGQWpZi1iCXV6lcrxrrZLbEs7/8sk=
X-Received: by 2002:ad4:574c:0:b0:6d4:1a42:8f06 with SMTP id
 6a1803df08f44-6d4376d3a2cmr15211206d6.0.1732061059330; Tue, 19 Nov 2024
 16:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
In-Reply-To: <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 19 Nov 2024 16:04:08 -0800
Message-ID: <CALJ9ZPMNrZW0TYxEVRMJo2FkvOfmGxSODwsV9cA1jUZUz-Q2aw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Rong Xu <xur@google.com>
Cc: Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, George Burgess <gbiv@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_160421_793004_799991A9 
X-CRM114-Status: GOOD (  25.32  )
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

Add George from ChromeOS.

On Mon, Nov 18, 2024 at 3:49=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> This patch looks good to me.
>
> I assume the profile format change in the Android doc will be submitted s=
oon.
> Since "extbinary" is a superset of "binary", using the "extbinary"
> format profile
> in Android shouldn't cause any compatibility issues.
>
> Reviewed-by: Rong Xu <xur.google.com>
>
> -Rong
>
> On Mon, Nov 18, 2024 at 2:25=E2=80=AFPM Yabin Cui <yabinc@google.com> wro=
te:
> >
> > Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> > selected.
> >
> > On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> > Experiments on Android show 4% improvement in cold app startup time
> > and 13% improvement in binder benchmarks.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >
> > Change-Logs in V2:
> >
> > 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> > 2. Create an issue and a change to use extbinary format in instructions=
:
> >    https://github.com/Linaro/OpenCSD/issues/65
> >    https://android-review.googlesource.com/c/platform/system/extras/+/3=
362107
> >
> >  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
> >  arch/arm64/Kconfig                  |  1 +
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-to=
ols/autofdo.rst
> > index 1f0a451e9ccd..a890e84a2fdd 100644
> > --- a/Documentation/dev-tools/autofdo.rst
> > +++ b/Documentation/dev-tools/autofdo.rst
> > @@ -55,7 +55,7 @@ process consists of the following steps:
> >     workload to gather execution frequency data. This data is
> >     collected using hardware sampling, via perf. AutoFDO is most
> >     effective on platforms supporting advanced PMU features like
> > -   LBR on Intel machines.
> > +   LBR on Intel machines, ETM traces on ARM machines.
> >
> >  #. AutoFDO profile generation: Perf output file is converted to
> >     the AutoFDO profile via offline tools.
> > @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
> >
> >        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -=
a -N -b -c <count> -o <perf_file> -- <loadtest>
> >
> > +   - For ARM platforms with ETM trace:
> > +
> > +     Follow the instructions in the `Linaro OpenCSD document
> > +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-=
fdo/autofdo.md`_
> > +     to record ETM traces for AutoFDO::
> > +
> > +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <lo=
adtest>
> > +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di5000=
09il
> > +
> > +     For ARM platforms running Android, follow the instructions in the
> > +     `Android simpleperf document
> > +     <https://android.googlesource.com/platform/system/extras/+/main/s=
impleperf/doc/collect_etm_data_for_autofdo.md>`_
> > +     to record ETM traces for AutoFDO::
> > +
> > +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> > +
> >  4) (Optional) Download the raw perf file to the host machine.
> >
> >  5) To generate an AutoFDO profile, two offline tools are available:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index fd9df6dcc593..c3814df5e391 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -103,6 +103,7 @@ config ARM64
> >         select ARCH_SUPPORTS_PER_VMA_LOCK
> >         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> >         select ARCH_SUPPORTS_RT
> > +       select ARCH_SUPPORTS_AUTOFDO_CLANG
> >         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >         select ARCH_WANT_DEFAULT_BPF_JIT
> > --
> > 2.47.0.338.g60cca15819-goog
> >

