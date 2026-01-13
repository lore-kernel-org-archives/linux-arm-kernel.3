Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466B3CF45D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 02:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6AKUL58zxtdwBeVn+jBaylK1k4DvcK76gK8pdSrhoo=; b=zMVZ8Ub1dmlnXHxqkxtqVkXJ04
	M2Y3QKtfA2IxYk6iH1wa4qXbk5tmk+i5BTl10iQdVafSwuJ45RjWPk0NBiDY+gMwUgGTgV3dJpX4C
	ZPiVScSaM6mNX1uA2nRnW3gfm2BOFt/xj5PrEhxS45TuxSfX9zm4QE0/WI2JM1UNHrgB7JI/CdE2t
	3CVIcLLrdYyyaQZMHWQr138gisWt0lZdRsfqyOcRWkiEfHM5LYteRlg5LY6mGlWceKanewRYh/I8t
	0vxxLMmUiH5nGGYeBb+kUfkhO3asrrpLbQDrJ+E7p8S6rGS1aZxMPjrRj/GeFFquh7R41DfXt0DJa
	Zbi3+fmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfULw-00000006RhW-0un2;
	Tue, 13 Jan 2026 02:41:52 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfULt-00000006Rgi-3CbC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 02:41:51 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-11a247de834so3739c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 18:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768272107; cv=none;
        d=google.com; s=arc-20240605;
        b=a6n5ybP12vZq3anSrWZHASJNHYc7ogl3sJH6o0+V6VROUXsAh3oH+5vq+8EHxAeGni
         C/0z95FXX7t2cvV2odu9Kgzwfr0sSRLnZtPqiY23KFVBW75E0QungjejxYhC5cTBhAME
         n5h+0lmuEqTTdgbFx3qcqAol6milHibyto/lvzaeLlST+eAN0uxmNOB0hBXid33pBexW
         +YJX1n3QzY5Ne6Lue/Pq8fZgmQAbqZzqLjeUtnv9TVhbPaYSz+iMJDRXlSzGSHh/6Rqk
         XEmbL+Zafbq+rtOjet2V6WVhBBg3Z3s3kIh1GL2N+Tvg269E9v9Pwx8Zm0fcYjCwdF3Z
         WeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6AKUL58zxtdwBeVn+jBaylK1k4DvcK76gK8pdSrhoo=;
        fh=YIZ2MLdis1Knv/A05gfufzmSEftVpAyMtgPtS3m2Vn4=;
        b=SjciP1ZBW5kYdj/5uKRAbb1tClDWUHI04Tckz2YoH1gy+aFRV0XgzzVNVY6ysznRaP
         CSb3Ww45JDO468t+or09xeRPyTl18iHoTdYC5+NfNCeql6C9ss5VbzxMFAnaJgQ8mpnx
         nMlgr+Owc3vu62kiS9YG1608L6uDI9SO6nR5ASyJOCDIvutlIDDqgvaPiHzrOKFbbXjC
         CAE9oi0uONGRuHe192ZkPYA+9FDBCCHO7GBQIy274z8RHNLV6j2BTfYYuJCM0rWYriuT
         sOkQ5UGr8MebSwr321K3PTNK29wuiJ73wmdAFff5JwJk5hKeU+9H1mqpf/q/GkHRtQFc
         DCSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768272107; x=1768876907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6AKUL58zxtdwBeVn+jBaylK1k4DvcK76gK8pdSrhoo=;
        b=wly3EQldd3Pq9TfqLy2+CXCJ3XTdzWDykggR1isQBPSRhr4Vx377suELXZxE+sLsmA
         rF2Cv3cHdHQhfQpg+uGLkZRYOk2k54NR7WkDSaAQC7I/MSiqtefRlZQS+v9pNYynLQUl
         +LtMQukF4M1drKQ9rVttm0S8wXIOKyLwvWv5oUOvBSvr9Wq57QjMml+wXKbd6n3z6Gyr
         +NFFgQyS6k1eIR1/oa24pQcnKRT2v3shIMVKNRrh5o38d6lKLXFLTTiJu4vdlNnNbIwq
         XNzuaKeXES3YWcdTVG+M9dXrQblr8DUXoH0K8ZI8mYabxJGcMjRfyUWQwSGzSrN/3V4b
         4Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272107; x=1768876907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6AKUL58zxtdwBeVn+jBaylK1k4DvcK76gK8pdSrhoo=;
        b=SSroFkKZE0D4/qNZ6FNR2QvXvX7SfXyrmr3FkzW8pylky/2oHvOZ730FsS7zoK3zMc
         ENtVh3hOAnToqN9MQUzOo4ihu5947xAAj5jRyZUUMmaAzlWsADuWsLzspjy/ctD2bJnp
         Yt7Z3M7KqZukZ45brmI45rkLWCVXkx+YVpopXypPYpvcVVHUWSIxErLAz3uJZH/IigWL
         6x4hntWANi77zMLn/dapTmhXi5obMbJpGJXksmmm8/Vxz2jg3A2uqxXDQ/CpnjLVKXjC
         MKvU3WUtMXcCjJer10xywU7o4YU4o9oVV1ppz8FvxHGsve3wcXn4PuMKSRT1wpvJcerE
         IhAg==
X-Forwarded-Encrypted: i=1; AJvYcCUIDdVp9XMJKBVC0jj/cvIKEs3feef63OjZMCr4epnZ+siY4Ev5qB6lZ2nAzyi4SaLr9utNesYAAHSvcM3j5/U/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8752uQadRp5NzjGrXMKMRmWmvi6Y+ZmrsqzY7fVS1bHh+NNrc
	fEjsk1tmdJgAYqwwIP7D5gv/REHvZy4X23J7XALI/YBnNp9Csepd1CrXtXEnO9fyx2eXTrf1wwc
	KlH7eK68Q+gqsjhak6e6gQlECtHQExxOyoMepdHrc
X-Gm-Gg: AY/fxX7O1wUhSwc8gQLMi71f+IR7N25ONi6nE8xcZRZosfh7r2ac/hf26TZlL1P4rec
	Qgh/QtD9SpykYU8A4eGFjQ3vMDA8TG1lgzUe36Ie8BdNtzzp5KkV+3rWV9VXBPPMZOOjsGmlJGT
	VlQMLiOBq//GfPJkeOZ2V7XNK0bRM/ueQTqlxUiAR5OxbHvlf3okT7pnLiBoA0ZQnw+bBNTEXLu
	x4DGY/2oSWQ+0I2lZE0HJWA8Z9JN3B3YwklN0b/Nw8YcmX7dI3N2EnzT9QpUTgb/lam3/3u
X-Received: by 2002:a05:7022:7e07:b0:120:5719:1853 with SMTP id
 a92af1059eb24-1232ca6fdf1mr31130c88.17.1768272106334; Mon, 12 Jan 2026
 18:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20260107-cross-arch-unwind-v3-1-db0e37c8a652@skydio.com>
In-Reply-To: <20260107-cross-arch-unwind-v3-1-db0e37c8a652@skydio.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Jan 2026 18:41:34 -0800
X-Gm-Features: AZwV_Qjx81xRN3u9yzvKPm3mk0d4T_8c0mUYxuqp5IG3DlF6QWOu6fa5DL4Gbzg
Message-ID: <CAP-5=fXOC5kUQDE-GbbYGgXJNRpvm_p=ssYc31pMJhxqzfbkEg@mail.gmail.com>
Subject: Re: [PATCH v3] perf unwind-libdw: fix a cross-arch unwinding bug
To: shimin.guo@skydio.com
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_184149_834612_FCFCA089 
X-CRM114-Status: GOOD (  27.59  )
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

On Wed, Jan 7, 2026 at 8:41=E2=80=AFPM Shimin Guo via B4 Relay
<devnull+shimin.guo.skydio.com@kernel.org> wrote:
>
> From: Shimin Guo <shimin.guo@skydio.com>
>
> The set_initial_registers field of Dwfl_Thread_Callbacks needs to be set
> according to the arch of the stack samples being analyzed, not the arch
> that perf itself is built for. Currently perf fails to unwind stack sampl=
es
> collected from archs different from that of the host perf is running on.
> This patch moves the arch-specific implementations of set_initial_registe=
rs
> from tools/perf/arch to tools/perf/utli/unwind-libdw-arch, similar to the
> way the perf-regs-arch folder contains arch-specific functions related to
> registers, and chooses the implementation based on the arch of the data
> being processed.
>
> Signed-off-by: Shimin Guo <shimin.guo@skydio.com>
> ---
> Changes in v3:
> - tools/perf/util/unwind-libdw-arch/Build: replacing
> perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) with simply perf-util-y, as the
> directory itself is included based on CONFIG_LIBDW_DWARF_UNWIND. Also
> adding a missing newline at the end.
> - Changed the include paths in the moved files to be relative to tools/pe=
rf
> - Link to v2: https://lore.kernel.org/r/20260105-cross-arch-unwind-v2-1-9=
a8b0b14ce7b@skydio.com
>
> Fix a cross-architecture libdw DWARF unwinding bug in perf
>
> Changes in v2:
> - Fixed the include path for perf_regs.h in unwind-libdw-x86.c
> - Removed one level of "../" from the include paths in the moved files
> now that they are two directory levels under tools/perf instead of three.
> - Link to v1: https://lore.kernel.org/r/20251223-cross-arch-unwind-v1-1-4=
d71ee7db512@skydio.com
> ---
>  tools/perf/arch/arm/util/Build                     |  1 -
>  tools/perf/arch/arm64/util/Build                   |  1 -
>  tools/perf/arch/csky/util/Build                    |  2 -
>  tools/perf/arch/powerpc/util/Build                 |  1 -
>  tools/perf/arch/riscv/util/Build                   |  1 -
>  tools/perf/arch/s390/util/Build                    |  2 -
>  tools/perf/arch/x86/util/Build                     |  1 -
>  tools/perf/util/Build                              |  1 +
>  tools/perf/util/unwind-libdw-arch/Build            |  8 ++++
>  .../unwind-libdw-arch/unwind-libdw-arm.c}          | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-arm64.c}        | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-csky.c}         | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-loongarch.c}    | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-powerpc.c}      | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-riscv.c}        | 10 ++---
>  .../unwind-libdw-arch/unwind-libdw-s390.c}         | 14 +++---
>  .../unwind-libdw-arch/unwind-libdw-x86.c}          |  8 ++--
>  tools/perf/util/unwind-libdw.c                     | 51 ++++++++++++++++=
+++---
>  tools/perf/util/unwind-libdw.h                     | 10 ++++-
>  19 files changed, 104 insertions(+), 57 deletions(-)
>
> diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Bu=
ild
> index fd695e1fdaee2ccc300a206131b8b38a763b00ce..3291f893b943df0722dff5835=
23fff4ae79919bc 100644
> --- a/tools/perf/arch/arm/util/Build
> +++ b/tools/perf/arch/arm/util/Build
> @@ -1,6 +1,5 @@
>  perf-util-y +=3D perf_regs.o
>
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>
>  perf-util-y +=3D pmu.o auxtrace.o cs-etm.o
> diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/uti=
l/Build
> index d63881081d2eb1e9a83eabf82104d75308f7fc79..0177af19cc00038d6a6005592=
ddc530bf7eb1557 100644
> --- a/tools/perf/arch/arm64/util/Build
> +++ b/tools/perf/arch/arm64/util/Build
> @@ -1,4 +1,3 @@
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
>  perf-util-y +=3D ../../arm/util/auxtrace.o
> diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/=
Build
> index 5e6ea82c42021d3d5651ca4c4a3a6e5138574e4e..6b2d0e021b11464e46d6b5397=
4260d32ea969732 100644
> --- a/tools/perf/arch/csky/util/Build
> +++ b/tools/perf/arch/csky/util/Build
> @@ -1,3 +1 @@
>  perf-util-y +=3D perf_regs.o
> -
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc=
/util/Build
> index 3d0d5427aef7f26a8c05c883cc7ad763f08cbb30..5fd28ec713a4db74ecd1d2686=
6a65ddb20e94bd3 100644
> --- a/tools/perf/arch/powerpc/util/Build
> +++ b/tools/perf/arch/powerpc/util/Build
> @@ -9,5 +9,4 @@ perf-util-y +=3D evsel.o
>  perf-util-$(CONFIG_LIBDW) +=3D skip-callchain-idx.o
>
>  perf-util-$(CONFIG_LIBUNWIND) +=3D unwind-libunwind.o
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>  perf-util-y +=3D auxtrace.o
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/uti=
l/Build
> index 58a672246024dd0f72e767d11e9958bd9913ec3c..628b9ebd418bde8cdf1ab1332=
bf79f7c9d50760e 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -2,4 +2,3 @@ perf-util-y +=3D perf_regs.o
>  perf-util-y +=3D header.o
>
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/=
Build
> index c64eb18dbdae93adafabf8542e4c9a763ecfe057..5391d26fedd46b7d30a1bef0b=
ff2ec2d58ec30ed 100644
> --- a/tools/perf/arch/s390/util/Build
> +++ b/tools/perf/arch/s390/util/Build
> @@ -2,8 +2,6 @@ perf-util-y +=3D header.o
>  perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
>  perf-util-y +=3D perf_regs.o
>
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> -
>  perf-util-y +=3D machine.o
>  perf-util-y +=3D pmu.o
>
> diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Bu=
ild
> index c0dc5965f3624a6f02525a04d287dff755356d20..fad256252bb95a8f8350b6bb1=
a54e8074eaebbec 100644
> --- a/tools/perf/arch/x86/util/Build
> +++ b/tools/perf/arch/x86/util/Build
> @@ -12,7 +12,6 @@ perf-util-y +=3D evsel.o
>  perf-util-y +=3D iostat.o
>
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind.o
> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>
>  perf-util-y +=3D auxtrace.o
>  perf-util-y +=3D archinsn.o
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 1c2a43e1dc68e7f751ec6082352b10de9ffeea62..15f8a4f4b24a46b6300e824f6=
72dd9c0d5b7865f 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -226,6 +226,7 @@ perf-util-$(CONFIG_LIBDW) +=3D debuginfo.o
>  perf-util-$(CONFIG_LIBDW) +=3D annotate-data.o
>
>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
> +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw-arch/
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    +=3D unwind-libunwind-local.o
>  perf-util-$(CONFIG_LIBUNWIND)          +=3D unwind-libunwind.o
>  perf-util-$(CONFIG_LIBUNWIND_X86)      +=3D libunwind/x86_32.o
> diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/un=
wind-libdw-arch/Build
> new file mode 100644
> index 0000000000000000000000000000000000000000..ef17a83a78136d7ab8d44c62d=
454742638ddf224
> --- /dev/null
> +++ b/tools/perf/util/unwind-libdw-arch/Build
> @@ -0,0 +1,8 @@
> +perf-util-y +=3D unwind-libdw-x86.o
> +perf-util-y +=3D unwind-libdw-arm.o
> +perf-util-y +=3D unwind-libdw-arm64.o
> +perf-util-y +=3D unwind-libdw-csky.o
> +perf-util-y +=3D unwind-libdw-loongarch.o
> +perf-util-y +=3D unwind-libdw-powerpc.o
> +perf-util-y +=3D unwind-libdw-riscv.o
> +perf-util-y +=3D unwind-libdw-s390.o
> diff --git a/tools/perf/arch/arm/util/unwind-libdw.c b/tools/perf/util/un=
wind-libdw-arch/unwind-libdw-arm.c
> similarity index 80%
> rename from tools/perf/arch/arm/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> index fbb643f224ec4b27ce9d67051fe0bc4ad555b05e..56e9b5975bcc60fa1aaae048f=
3b8aab7f1634db1 100644
> --- a/tools/perf/arch/arm/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../../util/unwind-libdw.h"
> -#include "../../../util/perf_regs.h"
> -#include "../../../util/sample.h"
> +#include "../arch/arm/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-arm64.c
> similarity index 87%
> rename from tools/perf/arch/arm64/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> index b89b0a7e5ad919fed23643d219fbdc3d84deff1e..29b6833e036cc0d80322eb1f9=
5aea310df1cba49 100644
> --- a/tools/perf/arch/arm64/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../../util/unwind-libdw.h"
> -#include "../../../util/perf_regs.h"
> -#include "../../../util/sample.h"
> +#include "../arch/arm64/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/csky/util/unwind-libdw.c b/tools/perf/util/u=
nwind-libdw-arch/unwind-libdw-csky.c
> similarity index 90%
> rename from tools/perf/arch/csky/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
> index b20b1569783d7e982e91b1b40120d29ccf2f01d1..2556d034c32a464018b4f03ac=
57329249b8b1984 100644
> --- a/tools/perf/arch/csky/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
> @@ -2,12 +2,12 @@
>  // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
>
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../util/unwind-libdw.h"
> -#include "../../util/perf_regs.h"
> -#include "../../util/event.h"
> +#include "../arch/csky/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/loongarch/util/unwind-libdw.c b/tools/perf/u=
til/unwind-libdw-arch/unwind-libdw-loongarch.c
> similarity index 86%
> rename from tools/perf/arch/loongarch/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
> index 60b1144bedd5f325e1512eeab05c29a1e8de2b03..5fca673508be8218d4481a0c9=
5c38b0293789c34 100644
> --- a/tools/perf/arch/loongarch/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
> @@ -2,12 +2,12 @@
>  /* Copyright (C) 2020-2023 Loongson Technology Corporation Limited */
>
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../util/unwind-libdw.h"
> -#include "../../util/perf_regs.h"
> -#include "../../util/sample.h"
> +#include "../arch/loongarch/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *ar=
g)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/powerpc/util/unwind-libdw.c b/tools/perf/uti=
l/unwind-libdw-arch/unwind-libdw-powerpc.c
> similarity index 89%
> rename from tools/perf/arch/powerpc/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> index 82d0c28ae3459ecdb0039cac1f534420d142739b..1560db45e7b464877a5895feb=
389867937edcf83 100644
> --- a/tools/perf/arch/powerpc/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
> @@ -1,10 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <elfutils/libdwfl.h>
>  #include <linux/kernel.h>
> -#include "perf_regs.h"
> -#include "../../../util/unwind-libdw.h"
> -#include "../../../util/perf_regs.h"
> -#include "../../../util/sample.h"
> +#include "../arch/powerpc/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
>  /* See backends/ppc_initreg.c and backends/ppc_regs.c in elfutils.  */
>  static const int special_regs[3][2] =3D {
> @@ -13,7 +13,7 @@ static const int special_regs[3][2] =3D {
>         { 109, PERF_REG_POWERPC_CTR },
>  };
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/util/=
unwind-libdw-arch/unwind-libdw-riscv.c
> similarity index 87%
> rename from tools/perf/arch/riscv/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
> index dc1476e16321736de897ad53a00fbc813bd706db..c2e2c4b6b2e005fff4cb8045e=
f7d44a4d2458b47 100644
> --- a/tools/perf/arch/riscv/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
> @@ -2,12 +2,12 @@
>  /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
>
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../util/unwind-libdw.h"
> -#include "../../util/perf_regs.h"
> -#include "../../util/sample.h"
> +#include "../arch/riscv/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/s390/util/unwind-libdw.c b/tools/perf/util/u=
nwind-libdw-arch/unwind-libdw-s390.c
> similarity index 84%
> rename from tools/perf/arch/s390/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
> index c27c7a0d1076c890c35ba19543932c4ed5ac9c2a..1e05e9d9d95faf42cc2d538c8=
2a8e4284a34a426 100644
> --- a/tools/perf/arch/s390/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
> @@ -1,14 +1,14 @@
>  #include <linux/kernel.h>
>  #include <elfutils/libdwfl.h>
> -#include "../../util/unwind-libdw.h"
> -#include "../../util/perf_regs.h"
> -#include "../../util/event.h"
> -#include "../../util/sample.h"
> -#include "dwarf-regs-table.h"
> -#include "perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
> +#include "util/event.h"
> +#include "util/sample.h"
> +#include "../arch/s390/include/dwarf-regs-table.h"
> +#include "../arch/s390/include/uapi/asm/perf_regs.h"
>
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/arch/x86/util/unwind-libdw.c b/tools/perf/util/un=
wind-libdw-arch/unwind-libdw-x86.c
> similarity index 87%
> rename from tools/perf/arch/x86/util/unwind-libdw.c
> rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> index 798493e887d7308cb293e29e4ba11054d0fda722..dd27545a4a68c11e3745a2470=
8066d88bc2c7209 100644
> --- a/tools/perf/arch/x86/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <elfutils/libdwfl.h>
> -#include "perf_regs.h"
> -#include "../../../util/unwind-libdw.h"
> -#include "../../../util/perf_regs.h"
> +#include "../arch/x86/include/uapi/asm/perf_regs.h"
> +#include "util/unwind-libdw.h"
> +#include "util/perf_regs.h"
>  #include "util/sample.h"
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
> +bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
>  {
>         struct unwind_info *ui =3D arg;
>         struct regs_dump *user_regs =3D perf_sample__user_regs(ui->sample=
);
> diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libd=
w.c
> index ae70fb56a05729b9f06a411d162eabebbf29ac52..f32694ff4ea52d4bf80a38405=
341864e7ff5e6c8 100644
> --- a/tools/perf/util/unwind-libdw.c
> +++ b/tools/perf/util/unwind-libdw.c
> @@ -225,11 +225,45 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, =
Dwarf_Addr addr, Dwarf_Word *
>         return true;
>  }
>
> -static const Dwfl_Thread_Callbacks callbacks =3D {
> -       .next_thread            =3D next_thread,
> -       .memory_read            =3D memory_read,
> -       .set_initial_registers  =3D libdw__arch_set_initial_registers,
> -};
> +#define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
> +static const Dwfl_Thread_Callbacks callbacks_##arch =3D {              \
> +       .next_thread           =3D next_thread,                        \
> +       .memory_read           =3D memory_read,                        \
> +       .set_initial_registers =3D libdw_set_initial_registers_##arch, \
> +}
> +
> +DEFINE_DWFL_THREAD_CALLBACKS(x86);
> +DEFINE_DWFL_THREAD_CALLBACKS(arm);
> +DEFINE_DWFL_THREAD_CALLBACKS(arm64);
> +DEFINE_DWFL_THREAD_CALLBACKS(csky);
> +DEFINE_DWFL_THREAD_CALLBACKS(loongarch);
> +DEFINE_DWFL_THREAD_CALLBACKS(powerpc);
> +DEFINE_DWFL_THREAD_CALLBACKS(riscv);
> +DEFINE_DWFL_THREAD_CALLBACKS(s390);
> +
> +static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arc=
h)
> +{
> +       if (!strcmp(arch, "arm"))
> +               return &callbacks_arm;
> +       else if (!strcmp(arch, "arm64"))
> +               return &callbacks_arm64;
> +       else if (!strcmp(arch, "csky"))
> +               return &callbacks_csky;
> +       else if (!strcmp(arch, "loongarch"))
> +               return &callbacks_loongarch;
> +       else if (!strcmp(arch, "powerpc"))
> +               return &callbacks_powerpc;
> +       else if (!strcmp(arch, "riscv"))
> +               return &callbacks_riscv;
> +       else if (!strcmp(arch, "s390"))
> +               return &callbacks_s390;
> +       else if (!strcmp(arch, "x86"))
> +               return &callbacks_x86;

Not a fault of this change, but I kind of wish we used EM_ and EF_
values as "x86" is less specific than the I386 or X86_64 constants. I
think we need something like a perf_env__e_machine and
perf_env__e_flags and for now that could just reinterpret the
arch/cpuid string. Eventually we should store these values into the
perf.data file.

> +
> +       pr_err("Fail to get thread callbacks for arch %s, returns NULL\n"=
,
> +              arch);
> +       return NULL;
> +}
>
>  static int
>  frame_callback(Dwfl_Frame *state, void *arg)
> @@ -278,6 +312,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *a=
rg,
>         const char *arch =3D perf_env__arch(ui_buf.machine->env);
>         Dwarf_Word ip;
>         int err =3D -EINVAL, i;
> +       const Dwfl_Thread_Callbacks *callbacks;
>
>         if (!data->user_regs || !data->user_regs->regs)
>                 return -EINVAL;
> @@ -300,7 +335,11 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *=
arg,
>         if (err)
>                 goto out;
>
> -       err =3D !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread)=
, &callbacks, ui);
> +       callbacks =3D get_thread_callbacks(arch);
> +       if (!callbacks)
> +               goto out;
> +
> +       err =3D !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread)=
, callbacks, ui);
>         if (err)
>                 goto out;
>
> diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libd=
w.h
> index 8c88bc4f2304b59561ffd482469ca63ce0f531f0..574b29848cce31e6bfd93021f=
752b518cebf73b7 100644
> --- a/tools/perf/util/unwind-libdw.h
> +++ b/tools/perf/util/unwind-libdw.h
> @@ -9,7 +9,15 @@ struct machine;
>  struct perf_sample;
>  struct thread;
>
> -bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *ar=
g);
> +bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *arg)=
;
> +bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg);
> +bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg);
>
>  struct unwind_info {
>         Dwfl                    *dwfl;
>
> ---
> base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
> change-id: 20260105-cross-arch-unwind-7238af40fb14
>
> Best regards,
> --
> Shimin Guo <shimin.guo@skydio.com>

Less code in arch is always going to lgtm :-)

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

