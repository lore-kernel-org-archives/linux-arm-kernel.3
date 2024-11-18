Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FA7D60CFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 23:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK6bzE8aI/V2pC6nlWjgg4fvEcS2VY0hiKfSVmi168k=; b=ChAvFKwZ/L56uLjwHoaUsTRaPE
	FacPFxDeb+yA58kUpN4Be9EWNbXwoNkc3GdfOqjuF6C5faDj/JG6dVX7xcLqKS5wbb7/4s0WwfgKe
	6X6oM9UQSdGEqu82a+kTsHZSSuP5gCWQ0h0TlnvYf8lvudHwzWmmHWS/sN/oCV5vLdJFt90cM59Ti
	luXDn82w+x4i1yiGtVw3CujbhWe9AbbWmu+E/EFUX9aZu3+ZCnuFRSCLVu0CIuqREU7ASc47ApKPH
	uzQVtuViwLCrAiw5LrLFZbJAOi3guqCZUm6GUZMLl78/b11VwQUl06HnKYSNHhssziqk6PmiehkNF
	Xwy8lUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDBW4-0000000AtLH-1FOC;
	Mon, 18 Nov 2024 23:50:48 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDBV7-0000000AtDX-1ylu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 23:49:50 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4608dddaa35so128291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731973787; x=1732578587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK6bzE8aI/V2pC6nlWjgg4fvEcS2VY0hiKfSVmi168k=;
        b=jnIVT8JzGRChGrwDItoCH8nvfiRlkDLZO+eNsJ/o1ZIJAj64S6h66S6bHDNcevwwFB
         RCcVr3TO8l15fAZS/P8wFJfhKX4pWw7oxjfVnM0IEw86UWrFQqynEST1qua+onxPjS25
         w1FscZIK4ZvHFd/4mX8X++o9UI6YnAGW3l4cv2iGnoqw4GkmfJl2o5Trh30lB+dXiD5c
         nHP/ZUpt6KkzOUZXlhBFDgZgTHCjHyp+iBFKu0h5W0GR4z62HGTzNTMmFrHACP+i2ZtK
         OeALx7peh4K4QR097//r2gurLMXwtrtwOK2ZjRPS7Maap2ZaEbxfDgdzeaQRAO4hsTjI
         fciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731973787; x=1732578587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK6bzE8aI/V2pC6nlWjgg4fvEcS2VY0hiKfSVmi168k=;
        b=vu0X6KAVKFX09dRKarUkrT7NvsWgshhayJ7o2jMoFksPcOHtSvS3J3lnX1wx7Jg23K
         hGeXliSY8UkguNZddYHSd4JzdKWepUbckNqyQWyCo8ZWY/a4aJqruveFh8jc7VyTagFU
         0H7UvAGV6FKTFFBe0lMOyIgH8oEr7m07XJ9URPPiPpxpZSLz2Hxv4HWVhNAUsUt2PcH/
         CVxWcV538nJaVKItWAUVDo4ZnJGs/sNiPxCqW4V7YlF7GV0Tqh40P/jb6UPLJA1/U0Vj
         VNer3WbhhKpfd3F1XfV0szDaUT2L7wNCB/1nS1S3KMF5jU+OhubfXSrmL2N7KGiNUK1Q
         T7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjw0myp8N01YsIHCoPfhXpMzl0nj0QfkJlVWFW3gtVZyfeAheW5QaCn9dL9NCHHA+TALHdW1oTouRrKvCKgulI@lists.infradead.org
X-Gm-Message-State: AOJu0YxXqA8hXTsw56BOyyvjyk0DoRcK1c6MPk0/qIkkPT9QbpBlaghO
	D4G4XbZUUf2UgwGvlMh1zUU2CLKoBS1KUn5exz5tS/YsZVL91pZFDHlpycWomY8qjl+9UUwR9EB
	T8GFHzJ18HAP6SlH1kewK+uufdQl7Rg+rop4y
X-Gm-Gg: ASbGnculxU87ScturpmlPo55GoZIWXu7Fdn+ZwDp3R6qmxVdrF4zSxwwMtDLZxqjER2
	0x8TI0Bb3wGf4zwYGdKJOp8F+FdwwPi04NAEpa1GtUgS7fwnJxDN2VuUecqEQ4Q==
X-Google-Smtp-Source: AGHT+IFZwt76OGyj44JQnW6JI/5s2J93C6DIK6J7wzakmW8yqQSea3vMGSHEwAzZUnUOrt5xqan1wN37RWPJqIC6h2Q=
X-Received: by 2002:ac8:59d0:0:b0:460:463d:78dd with SMTP id
 d75a77b69052e-463937a8f55mr1170181cf.4.1731973787136; Mon, 18 Nov 2024
 15:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com>
In-Reply-To: <20241118222540.27495-1-yabinc@google.com>
From: Rong Xu <xur@google.com>
Date: Mon, 18 Nov 2024 15:49:35 -0800
Message-ID: <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
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
X-CRM114-CacheID: sfid-20241118_154949_529049_C735C5C0 
X-CRM114-Status: GOOD (  22.30  )
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

This patch looks good to me.

I assume the profile format change in the Android doc will be submitted soo=
n.
Since "extbinary" is a superset of "binary", using the "extbinary"
format profile
in Android shouldn't cause any compatibility issues.

Reviewed-by: Rong Xu <xur.google.com>

-Rong

On Mon, Nov 18, 2024 at 2:25=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
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
>
> Change-Logs in V2:
>
> 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> 2. Create an issue and a change to use extbinary format in instructions:
>    https://github.com/Linaro/OpenCSD/issues/65
>    https://android-review.googlesource.com/c/platform/system/extras/+/336=
2107
>
>  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
>  arch/arm64/Kconfig                  |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tool=
s/autofdo.rst
> index 1f0a451e9ccd..a890e84a2fdd 100644
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
> +   - For ARM platforms with ETM trace:
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

