Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4E5D6DDD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdhHbTzTKc3SMetmKy+wNf6PkpzJgq0XFpQInOkKr7k=; b=0qsJIVDOYrAfXxU2RoE634K+GO
	Hd13ktOmyKaU7qEOV1hlYjEWqnYcQTR6sj5ndT2DXjjq5MVE8gizutJAcq8MfTlsw9VC8k++8qEKl
	EGL1NNwb5ukOLoRtD2WhWl3N/KrTYLmngnM2ZSe99De6cfDyKN9qkZRZGSwNrsBci0UwtdPFzFx03
	aZLakaWDWeLCRKa7L70FNUVh22ac+7NsfI+gGXKJMabUDBBtEG8mXNvtLHiv0Q+/ZPIpU13XbRUHP
	9p5rdPNNTjbYl5ZDeaPOCCL64HdA9GBwcqPGRgW/LSUrksGfL2cdgkMwZsf2gpBQrgfADB6eNv3Bc
	oRNoI5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqMt-00000001sBB-2JQ1;
	Fri, 15 Nov 2024 07:03:47 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBqLx-00000001s0z-2fNI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 07:02:51 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4635b03a3cdso98971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 23:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731654167; x=1732258967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdhHbTzTKc3SMetmKy+wNf6PkpzJgq0XFpQInOkKr7k=;
        b=lEdouqpAZc72ZawmY7klsxWS+TfRHC8HQvHKyeuNxGe84uLbRcM7Ax2j9uaahwcLGS
         BqNCVPMdl94HOotVTeGK8Q3guRO/M7g+zVLPJsPe51u/CQoNflkHvdWqJ1Y8pHRDxCgx
         L5q8qJiTTliYS9i3iQrdOVfoVtK/9Fqwu2q+eQJQ2TffsmA24tszlmbV3D8HnsobN7Ol
         xcAEGmM4amUoG/3toQNPGQlHbeEkwppO8TAR0pHGYVCXHoGTdU52BYQ5dewEZgUhiRe1
         yp0TJT/zckVEnGp47Rrfpu2vTrfdOHiXp/uSv1M57iow+2WgyxSqHIFAK6VvgOKw8MKo
         9X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654167; x=1732258967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdhHbTzTKc3SMetmKy+wNf6PkpzJgq0XFpQInOkKr7k=;
        b=LzPDJSJ4uH+IVrxRmqrJd45VyTRlYkcn1nC/A5kIb1OVJEdnjEvpU2boTRD34Flash
         U89cqM0xMgQs31HmmUlpiTlU1aiaW9GNQ+9DHXkDqjAlvqmmhkRh52rhSnAi8twW8SHx
         Q/0GBtaHSdYs2TD1VylpM3O7VPMrI3x5VQcCkLCa5etvojTO8zQU7Q+uRb2FW+QyR1kB
         wL+ppaKuWMnTlWpuFGn8O0M9lKIFbDY7oeBy4LUQ4jF5DBqX6t25iWBFA7cJkfAb1MMi
         FMUTR35DCYnsAvkIo/+PcFLXuftkZkrCX+cT+A8K7C6TGbQqQ2FIA1eqDFTaKLHKtQYz
         Pnyw==
X-Forwarded-Encrypted: i=1; AJvYcCWPvA9tiu4XnPDR93nFuLJwT2522gYcUsDmFZzEnceOMCRltbyjtRsmJL/BHpSe52S9ItJJLDNe1lotp7cBvn2n@lists.infradead.org
X-Gm-Message-State: AOJu0YyqxH/osyahbjO9uMWgIY4E1MYh7kAijGVs1av+GVEh8lUusz0P
	6tJMXlQatEtKVMw8hDJoWyv66CuOXsLEQdVWYEISexlCx7w0e65pwfcn0Fa6CNr3Pc5sWiOMYzA
	dyVqMUXmc5YOuiGr9F31D6GfXJqZrfncrmMZo
X-Gm-Gg: ASbGncvhosCZWw8xxmgJQKy14x7g6QRevZEjHIZXblEYu4M98zeN5HFUur17lPiqehE
	ot5/fMm/5ibtQNHd+Gg9o95u3Rsdsog==
X-Google-Smtp-Source: AGHT+IEZQumBx9rAByuSeR05qYBdTIlqZ++eXdNrS2altRO43l1pCrcUxa66OFIF831o8TKPmzacL49GHPpAP9FS1l8=
X-Received: by 2002:a05:622a:47ce:b0:461:32e9:c5f1 with SMTP id
 d75a77b69052e-463637282c0mr2202191cf.10.1731654167227; Thu, 14 Nov 2024
 23:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20241115051107.3374417-1-yabinc@google.com>
In-Reply-To: <20241115051107.3374417-1-yabinc@google.com>
From: Rong Xu <xur@google.com>
Date: Thu, 14 Nov 2024 23:02:35 -0800
Message-ID: <CAF1bQ=R=481iZu1Zp8p42zvGd_oLrU-K9UHtSe9TbZUDkS8Qkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Yabin Cui <yabinc@google.com>
Cc: Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_230249_726855_4A274278 
X-CRM114-Status: GOOD (  25.19  )
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

Hi Yabin,

Thanks for working to enable this on ARM64 and test the performance on Andr=
oid!
Please see my comments below.

Thanks,

-Rong

On Thu, Nov 14, 2024 at 9:11=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> selected.
>
> On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> Experiments on Android show 4% improvement in cold app startup time
> and 13% improvement in binder benchmarks.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
>  arch/arm64/Kconfig                  |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tool=
s/autofdo.rst
> index 1f0a451e9ccd..f0952e3e8490 100644
> --- a/Documentation/dev-tools/autofdo.rst
> +++ b/Documentation/dev-tools/autofdo.rst
> @@ -55,7 +55,7 @@ process consists of the following steps:
>     workload to gather execution frequency data. This data is
>     collected using hardware sampling, via perf. AutoFDO is most
>     effective on platforms supporting advanced PMU features like
> -   LBR on Intel machines.
> +   LBR on Intel machines, ETM traces on ARM machines.
>
>  #. AutoFDO profile generation: Perf output file is converted to
>     the AutoFDO profile via offline tools.
> @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
>
>        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a =
-N -b -c <count> -o <perf_file> -- <loadtest>
>
> +   - For ARM platforms:

The instructions for SPE might be different. Can we change to "- For
ARM platforms with ETM trace:"

> +
> +     Follow the instructions in the `Linaro OpenCSD document
> +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fd=
o/autofdo.md`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <load=
test>
> +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di500009=
il
> +
> +     For ARM platforms running Android, follow the instructions in the
> +     `Android simpleperf document
> +     <https://android.googlesource.com/platform/system/extras/+/main/sim=
pleperf/doc/collect_etm_data_for_autofdo.md>`_
> +     to record ETM traces for AutoFDO::

The instructions in "Step 3: Convert ETM data to AutoFDO profile"
currently use create_llvm_prof to generate
 a "binary" profile format. This is incompatible with the default
FSAFDO format used for the kernel, which
 requires an "extbinary" format.

To correct this, please update the instructions to include the flag
"-format extbinary" in the
create_llvm_prof command.

Using a non-FSAFDO profile with FSAFDO can negatively impact performance.
Therefore, I recommend rerunning the test with the updated flag to
potentially achieve better results.

> +
> +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> +
>  4) (Optional) Download the raw perf file to the host machine.
>
>  5) To generate an AutoFDO profile, two offline tools are available:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..c3814df5e391 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -103,6 +103,7 @@ config ARM64
>         select ARCH_SUPPORTS_PER_VMA_LOCK
>         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>         select ARCH_SUPPORTS_RT
> +       select ARCH_SUPPORTS_AUTOFDO_CLANG
>         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>         select ARCH_WANT_DEFAULT_BPF_JIT
> --
> 2.47.0.338.g60cca15819-goog
>

