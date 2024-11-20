Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB681D711BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HZ/7okpvF8kJm+od0U53QPJgTd3pjujVw1MRvI0jek=; b=cWBsuHwcW1Y5P2WA85wMnKTxI+
	WdoSx8YNRZ8P9r91CGr/DAjTJVbK1vSrAs0x7FlUlcb2OUwGk7qb4bQMAdH/yHDRV4oIVe0He+khA
	17PUsehDHTVYDfbl6p8rinbQa+w22xLKM0or0hXQI4/TrbFcT0ikV9Lg41waXJ7V2zpSqo9WHHveN
	bk7FFUBq7MeFbVyDwtslIJRrx+p0y8maaaVVjVy/JfQb0hBjlxg8EAqSZ2eqv3Gi+ol4aKx0ZWC5l
	PJeMnaGjZ9PFQSU/yWd9OH17ub+SgJ/TyPf38G3bBkJeLhZlq8jdeEe8ooBariLiOHKHa6RkW1d/3
	epsiRjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDn4E-0000000Fk1V-1sgC;
	Wed, 20 Nov 2024 15:56:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDn3G-0000000FjlQ-2Kx6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 15:55:35 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53da2483e60so18859e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732118132; x=1732722932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZ/7okpvF8kJm+od0U53QPJgTd3pjujVw1MRvI0jek=;
        b=ZzHd7IqdCj7t0vlPAjZUeOxOO9UmpwWQN1ShakAxOqs9uvGG2k/KYGdc9Y0ZHOiFYT
         fVraChqbF11d/mKzzsQrDkgC+a4C0T7Y5oL0A/qiz+hiLdmSIxC8mpbAqVuB3ozK94EE
         l54yc7CgSfRU0m1G0LnAOyeGQrRkzaYbiKYjQXCtIEpn4WleOXWny4ZUueugfmI6vurs
         Qd1SLzJHvq7d8KIOJR8fLhFNsVQcb/ABgWRxp1ItDctzpB+5AgcwjIlsM0T1yvc8s32D
         tglej4aeFzOog47YsxXavfC03kzjdkV4Fsez3cF44dyVIKk+3C5FpTId3MGupTZ2pi4O
         UzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732118132; x=1732722932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZ/7okpvF8kJm+od0U53QPJgTd3pjujVw1MRvI0jek=;
        b=RfLELlA9660t2KAm5Yi/tFwc3H1gQYtC8pg1Wz/Hm+vSR7kZUx5zlrCR4j5cnz5Wz6
         w0NbV1kOXGaBeNcIfxecWhVdOdB1cbr6LReJx4WBH1lw3wvZv0SfSI8aYG4eJ49eU57X
         G6cDB76o2ShzA3D7NNLRr8Kek8mjrAR4JRcNZOkbBsfhdecaWc3l1Quh3jWoeuZYUX/D
         zM2hZ19im9OvXc26J/xsLVSVO8xoWoRYq/OIjH7yVQyxedU0W9eZikm3PnqkJbhPQwMD
         ntFEN+8cWUUX9kr6jkbZuX9/QGIx0guKGtMbyEwj1Ol/LAAKu/9QqvF8iPL7gdF775Bq
         qogw==
X-Forwarded-Encrypted: i=1; AJvYcCWAwsecgJTSV/0BtFXU2EfgPIWjNOTtJdbRL6CNj2hTvXPpy3N7zE1J6wlkiqsXN3JdLfJKL7Md+WzgwssDrNmW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk8PV1LOF/XMgiLUvlkKpQe5Mf86zdBKP6E8h8h4MqpsE+CpdW
	0URPENmuGcpjFuwIAxd3kT80nMIDbgXdjyaWMntYMGsOlgUPc0GRwf0PdKk5UBInYPSRF5UpgGp
	Z3iSzyi67RpYuPDalzcRJXYfhd87QkRzIdF+v
X-Gm-Gg: ASbGncsu9KgbINketjMRm+a3e9lQdKbHFC/lzozRAGeeMiy8rSgOqdjLtTUU6QFxQyP
	GRrLYgUoDn8ztW6fTPejnwsakjohWiorI3lDL3xzycEozPSk6aTYwVxkklqX3gg==
X-Google-Smtp-Source: AGHT+IEc30uHJ15peKbExAOlopJi9zOAJvjK/e1IPVFyzeYPJXr6/KY0udRIEGSXxmCwxAdPwiPJWLAerB5KhSDy6PU=
X-Received: by 2002:a05:6512:2089:b0:52e:934c:1cc0 with SMTP id
 2adb3069b0e04-53dc2766aeemr158817e87.7.1732118131804; Wed, 20 Nov 2024
 07:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
 <CALJ9ZPMNrZW0TYxEVRMJo2FkvOfmGxSODwsV9cA1jUZUz-Q2aw@mail.gmail.com>
In-Reply-To: <CALJ9ZPMNrZW0TYxEVRMJo2FkvOfmGxSODwsV9cA1jUZUz-Q2aw@mail.gmail.com>
From: George Burgess <gbiv@google.com>
Date: Wed, 20 Nov 2024 08:54:54 -0700
Message-ID: <CA+rzOE=r-kCMPytBVFzU9f5FUdA7BRn35fTL6SZXbo6p9cBLGA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Yabin Cui <yabinc@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_075534_593700_E42932C4 
X-CRM114-Status: GOOD (  31.14  )
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

We've used ETM in ChromeOS for a while now. Hardware
requirements make it unfortunately less ubiquitous than LBR, but:
- we first launched it on 5.15,
- it's still humming along nicely today on 6.6, so:

Tested-by: George Burgess IV <gbiv@google.com>

IIRC, with a baseline of "using x86_64 AFDO profiles on ARM kernels,"
we saw a perf win on the order of a few (3? 4?) percentage points when
we made the switch.

On Tue, Nov 19, 2024 at 5:04=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> Add George from ChromeOS.
>
> On Mon, Nov 18, 2024 at 3:49=E2=80=AFPM Rong Xu <xur@google.com> wrote:
> >
> > This patch looks good to me.
> >
> > I assume the profile format change in the Android doc will be submitted=
 soon.
> > Since "extbinary" is a superset of "binary", using the "extbinary"
> > format profile
> > in Android shouldn't cause any compatibility issues.
> >
> > Reviewed-by: Rong Xu <xur.google.com>
> >
> > -Rong
> >
> > On Mon, Nov 18, 2024 at 2:25=E2=80=AFPM Yabin Cui <yabinc@google.com> w=
rote:
> > >
> > > Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> > > selected.
> > >
> > > On ARM64, ETM traces can be recorded and converted to AutoFDO profile=
s.
> > > Experiments on Android show 4% improvement in cold app startup time
> > > and 13% improvement in binder benchmarks.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > ---
> > >
> > > Change-Logs in V2:
> > >
> > > 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> > > 2. Create an issue and a change to use extbinary format in instructio=
ns:
> > >    https://github.com/Linaro/OpenCSD/issues/65
> > >    https://android-review.googlesource.com/c/platform/system/extras/+=
/3362107
> > >
> > >  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
> > >  arch/arm64/Kconfig                  |  1 +
> > >  2 files changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-=
tools/autofdo.rst
> > > index 1f0a451e9ccd..a890e84a2fdd 100644
> > > --- a/Documentation/dev-tools/autofdo.rst
> > > +++ b/Documentation/dev-tools/autofdo.rst
> > > @@ -55,7 +55,7 @@ process consists of the following steps:
> > >     workload to gather execution frequency data. This data is
> > >     collected using hardware sampling, via perf. AutoFDO is most
> > >     effective on platforms supporting advanced PMU features like
> > > -   LBR on Intel machines.
> > > +   LBR on Intel machines, ETM traces on ARM machines.
> > >
> > >  #. AutoFDO profile generation: Perf output file is converted to
> > >     the AutoFDO profile via offline tools.
> > > @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
> > >
> > >        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k=
 -a -N -b -c <count> -o <perf_file> -- <loadtest>
> > >
> > > +   - For ARM platforms with ETM trace:
> > > +
> > > +     Follow the instructions in the `Linaro OpenCSD document
> > > +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/aut=
o-fdo/autofdo.md`_
> > > +     to record ETM traces for AutoFDO::
> > > +
> > > +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <=
loadtest>

FWIW, CrOS spells the event 'cs_etm/autofdo/u'.

I'm not familiar enough with perf event syntax (or downstream patches
that CrOS has to its kernel) to say whether that should motivate a
change here. Happy to find out more if there's interest.









> > > +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di50=
0009il
> > > +
> > > +     For ARM platforms running Android, follow the instructions in t=
he
> > > +     `Android simpleperf document
> > > +     <https://android.googlesource.com/platform/system/extras/+/main=
/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
> > > +     to record ETM traces for AutoFDO::
> > > +
> > > +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest=
>
> > > +
> > >  4) (Optional) Download the raw perf file to the host machine.
> > >
> > >  5) To generate an AutoFDO profile, two offline tools are available:
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index fd9df6dcc593..c3814df5e391 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -103,6 +103,7 @@ config ARM64
> > >         select ARCH_SUPPORTS_PER_VMA_LOCK
> > >         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > >         select ARCH_SUPPORTS_RT
> > > +       select ARCH_SUPPORTS_AUTOFDO_CLANG
> > >         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > >         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > >         select ARCH_WANT_DEFAULT_BPF_JIT
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >

