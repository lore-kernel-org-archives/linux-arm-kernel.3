Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D82E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdIPjvnlF3Mwo/6XEjqWYb6FpbfvUDeAQpVQ0puOXiE=; b=yXfE+JNDGxuqfjGo6cfRrYGop6
	w7pAkuHY+5PFUcn6DPVl9btnkt6WkdF/zMae3V/sJHxS4zXQMylr7S1lo3+lYXXihUn6vW4ELxuiN
	hYorcgJCg40njk++GWWPjWNOzyYbK4z3ezxwLkFKEqBV8plkBxU887a0ov93UmsKdtqvub+ayYSPE
	JlhfUwuEyTWBIVF9/BCd1oHCbBQZxoGnw+dFvb3IYAJ5IwiNRitomzpf4sNRwNYghw9mAiY3PF7IM
	Yx9neS+80avocaHpNh+MZUFAu7qNiPI8TPjQzcRSUHG/I7zgN9M5H/m1bnEn/lIOAC0AaAipis2Po
	r1LaQhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhcL-00000008jyi-2t7h;
	Mon, 09 Dec 2024 17:32:21 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhb6-00000008jhZ-1A2z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:31:05 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-467431402deso408851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733765462; x=1734370262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdIPjvnlF3Mwo/6XEjqWYb6FpbfvUDeAQpVQ0puOXiE=;
        b=wpJ96/Oz8fSfBzED9BYglaJUu3Iifn25Gq5/nldF8gJcdjj2TrhUn0e3RicSoybEOK
         ZxnctZwQBUnNC9L/u6bGPiZVcdy7Pqm1Q5tBLfL+pZqfS3/oCRBJkMA+pfIr78IKvzPi
         6W7XaQStLhUqkka4WM8kc1E+MMCJp35MpXOp6XY7sKeKtgzq9W28CDXmWp+ZPkG0cMGP
         1MWho+JeLNUKPh8xx9nkUiQEeaVHfHHq7v6MlXuvt+Ykrf5zuxm0J4ofP+hQbeUCdOLx
         CHnfKwpI3pIjqQU9WvyzuSH7/Fp4wUMs71ENBnwlgOEAJypIbkFwyjaOLWB4IIO9TQH7
         e0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733765462; x=1734370262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdIPjvnlF3Mwo/6XEjqWYb6FpbfvUDeAQpVQ0puOXiE=;
        b=Dw2XcAvxSUkGBUVHp8t3SvCK8ykQY7clnL3nsPdqYnNpi4dX9/IExGdMgpD0y2Z7y8
         DKIIrZHjk5c+LwxaZMgUq07ttRiEJbcaW0brc8o0KRMktj84cR8ytqyFie3p3lrcOW+P
         R+7axiPnZIoEWBM1mWD7N03f+bizy9LX9fuOoPVmxhLF8wL5I5SfcoPWU4xRt98882st
         R14vKWdTyW0GiZic44Dkps7mznN10ezZMRVU60kU5V3514gFFQaafGtmG0kZ9ySR+Ibj
         OI29Askji4wJh5nfwVZe5SHHVhjbNTidfb9ok+AuDblni1Sp8ha9ulyIm+6VRcqeWU5V
         uTSg==
X-Forwarded-Encrypted: i=1; AJvYcCXFTsSPAWV7/6lnosrvIN+fJPJHFI5BmN+n3YyMADvg+xk3cSksSOBds0A1tkljpn8CBkRfVJU8jz6qubzsAfIw@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnnblQ9baP/jKAfHOAl+MdkHzv/lR1IzlXoOM8mfcDDxNfH3p
	yaXRYetZSC/ldQjP7n7m8b0KmsupVi3Mf4MQS18tEfCnASRQD2Km3qpzrKcMi5+oxDzhd7/6A4v
	Qi3GnVa4o2dUhzknSsyZlYRd0jfx/HJXvmfBU
X-Gm-Gg: ASbGncs7Ktlf46IKBcAosToreTWJb9KGjVUmjMbWMUvw/zs4ldI872/zf/BASP3YIiH
	2irorlF+Ag162ztLOP8Ggv5Q75pqojkkhRmggRrTWuzrd956WDm6qww8VMIzb
X-Google-Smtp-Source: AGHT+IF5ueLy5f8bNH9OGIJWA3/VyL6MS9Y/vEuMpZ/PyvK3bYq6fAc9vv+YnYvtEhUGWeXouk6ewOJKmK8R1HNS3J0=
X-Received: by 2002:a05:622a:2594:b0:462:b2f5:b24c with SMTP id
 d75a77b69052e-4674c9dbadamr7726181cf.29.1733765461817; Mon, 09 Dec 2024
 09:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <20241209162028.GD12428@willie-the-truck>
In-Reply-To: <20241209162028.GD12428@willie-the-truck>
From: Rong Xu <xur@google.com>
Date: Mon, 9 Dec 2024 09:30:50 -0800
Message-ID: <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Will Deacon <will@kernel.org>
Cc: Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_093104_313967_173BFD8E 
X-CRM114-Status: GOOD (  25.96  )
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

Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOFDO_C=
LANG.
The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
support for Clang build).

The CONFIG_AUTOFDO_CLANG config, even if selected by the user, will
not be enabled
unless ARCH_SUPPORTS_AUTOFDO_CLANG is present.

We are not enabling this for all architectures because AutoFDO's optimized =
build
relies on Last Branch Records (LBR) which aren't available on all architect=
ures.

-Rong


On Mon, Dec 9, 2024 at 8:20=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
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
> >       select ARCH_SUPPORTS_PER_VMA_LOCK
> >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> >       select ARCH_SUPPORTS_RT
> > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >       select ARCH_WANT_DEFAULT_BPF_JIT
>
> After this change, both arm64 and x86 select this option unconditionally
> and with no apparent support code being added. So what is actually
> required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> it just available for all architectures instead?
>
> Will

