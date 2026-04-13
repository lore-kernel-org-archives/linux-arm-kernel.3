Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F5F531DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=; b=Z9YqYX8Xx0jJ+VofDwCrmXUEqb
	LA1rZThfP2VzsTAtnVV2v6OASM2wSRaPUnthMfIwH391t/eTS39U3LCWR9QEt5/7zGECrbW6NDK4r
	c35752koK5gIBKaP+YLzg3NgLji5KdU5HGPLYMKmSD42ttsuZ1TrO2yXHt4y/e9JFj0AuwVHrd0cn
	fhkDvcn8/lB60XkLSRb+3UtaLbFWx2f96H3Q/a1B6NVRpu+qJHO/OqLgNTVhJvnjV/lixKIhcrWIn
	CrX/1R8doScB5bv2sVZ7r+gp64wJh9Z8SGHK94NlU8gjJ8WXppDuhpMDQ6x2bmhwf3vcIV7dn3W5U
	oHbS0KUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPds-0000000GR7g-43QA;
	Mon, 13 Apr 2026 22:20:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPdq-0000000GR6t-0RVK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:20:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3166284f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 15:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118824; cv=none;
        d=google.com; s=arc-20240605;
        b=ZS4oEvydgAdxAq1owazp3v1qIU0aRKjcCn5u6KDcHeLijpW6Gfv/lKBNaX2lMkrTDw
         EkrW+U1/4C8RaTBR+QoryF+1o/TUAto0b4Y/B4FIDgaQUuicUzV5n2RhjzC1JpiI6OOE
         kyOUfKPdGL2Pa5qipCJwP22GPd8NMJlvjUt1eUyuOkk6MdUKsqe5lvUOLJQNtEGF4HLr
         ErzWjEz4q8RR/4sg8vs+116ffsd2O7wuxoJ29itP7HSj7aNY6GmOz4HeluBCBcNGSf7p
         HhDTjjyJPC20CfeOvr04fA+dHL9i2hBCvvwhEc3cQPuoasloebtsmI5kY4M3SBJSXR9m
         Qgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        fh=fiZYQvLEHVPzV2YRz86AQrcdPp4bR0b4squdWTHiXmA=;
        b=jinJzUhypMFttTlT41fAKRJk6KJb/LnjtlG4MNqU8DcNTpgoat3oUWXyEnXbJOAhUz
         7NCipwhmsB+tjLVaL6KcCn1qZczWdmzF53gYRnWxtPC3GefnSBRpiaxG4NGiQMIKDHxH
         uuFSKviTJTyg58+jgVTs6bJ0vNDAEejEn+UkZ65c79zvTYlyjXB2ID6bJV+HeHqZXq1y
         1E2HqS1fL+cQBXCtr2ozuhnVqnwC7uKdB6sC4n2bulMHKPuOjWAxjyLZRZo6ExSJcvYz
         i2mOhtgE2vifuBnKvr2zYkV8WLfftCz33ALAUMFMRExA6P+MQLXBAPUsLX42PwVTrz4f
         rQiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118824; x=1776723624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        b=sjVU+oYx1kFjq3+thKmF9dwG4WzQBG+R3WHDMP8G1bbr/oXEIZAWFV+/puZ8aww5pK
         HUQ/6HR3pQkZvSNTSCuBa3C3yA3Txf6h9GL90BXUiHDrniFsPypKkEPHWYt2qLfo/M5x
         Z/wOMz5bs3B3AYXU1+wFuo4sdhQiLN85CoKY3j8I1ehuANPOWCuOsMlV1cyzTJ1qk8XM
         hfX3sQcbP3ehK+XkTDLkq3+3Q7arL0JMCTyBWFxQ5ByORhe4pkAtvaVwkR1mUyQsqSjD
         sW5HDXdWr7Rm23RH2r8lPYPDT4Do+ig7BHMvG+v+wuggdgCpaYU61iyqqxP21Cma5Ss2
         kX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118824; x=1776723624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fp+8IeHiDM+bCUp+Ky89VxSnxaC5A7VFTmU45Et8ZaE=;
        b=qR6UCiM1LrXAlaT6hBF7YZG1QniF0RbiHBtjq6C0Zn6BtGzl95GaeSLhWdJ8tZrzO1
         8Yf8HZABtWAJ3YepcTrWs78OLIVib5LIj2xxOqg84OMa1n6XVn0ibrHfg6GkVvo/9uWm
         m5IUr/IuyfXTajtjq+y0yt/yp7D9gCp+1bAicTnsZdUiV2V3mbVn52fdyHJRnYyLvWmq
         NfYOKscx4hXvWaBjPdK1DOmJKUlx6haj36/YLioJObmmDahgz6bWYiv3adTDVBrHb6JU
         ex11L2orSFP200+UNtVHObWyP5Z8ZNg57GlMr0SFzaT+woThbxTPwxSRLDYDSwqLGP6B
         ZHqg==
X-Forwarded-Encrypted: i=1; AFNElJ+slWCy8ATRCXwo3XqxybeqyFkbxfXBwt5mcYOKeN3pRKldQxVhlKHi7jfDFtP7apReIxYeSvMFNJRkmgZFtWQv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1PTkbFOS4jSiJGE4/okHYC729mMg7Ns7IiESM43XL5BGQOn6O
	RPaee30MCb8lxnDL/nuSyFfGRcItObzeRIqJxK2HHGIxg2s7EtuDIwInu45QWCklJJzpzGY7mOW
	D/XToS83kVRvC4IfEeaIJmy+w0VBvl70=
X-Gm-Gg: AeBDietOGEIzdnSbbmtbeApqW7YJNhdS4DhvChrfL6Cb/Zog4fgdOAMiYZBBXeG6P5y
	1yC17UvMPjqKIu9zOeQqFY3+JuFwJfggUQrrMo3ahWggHV6lKW3uFHN9/tW9YTQ9XV+gqie2g+/
	7aGC0abFztiWIvx3s6NdogiB2BOff3A4QPnebzvrDwzteIr6cEq3kmdMwHOYW10ZSRkSTgKJnys
	JRLXlbD+3rSCXqNumwzU2bZhTMn3PWwWow43qD6bsFMtGd/fhFK0Mf5RI/4ZrseRsvTot2lzi81
	IC9MW8ZN/RzhAKFiq2NC4PqEj023yFAe7FdKl55T
X-Received: by 2002:a05:6000:2303:b0:43d:7af0:3a8a with SMTP id
 ffacd0b85a97d-43d7af03dffmr7155232f8f.46.1776118824134; Mon, 13 Apr 2026
 15:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-3-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-3-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:20:13 +0200
X-Gm-Features: AQROBzASLHf5ILBNuw_x5OeLAHJGUfv8fbkKsOkNoaIfzCwURKyPvUbS0Z-ZunI
Message-ID: <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_152026_174409_57DBB808 
X-CRM114-Status: GOOD (  20.15  )
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

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enables
> KASAN (Kernel Address Sanitizer) memory access checks for JIT-compiled
> BPF programs, when both KASAN and JIT compiler are enabled. When
> enabled, the JIT compiler will emit shadow memory checks before memory
> loads and stores to detect use-after-free, out-of-bounds, and other
> memory safety bugs at runtime. The option is gated behind
> HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  kernel/bpf/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..28392adb3d7e 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig
> @@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
>  config HAVE_EBPF_JIT
>         bool
>
> +# KASAN support for JIT compiler
> +config HAVE_EBPF_JIT_KASAN
> +       bool
> +
>  # Used by archs to tell that they want the BPF JIT compiler enabled by
>  # default for kernels that were compiled with BPF JIT support.
>  config ARCH_WANT_DEFAULT_BPF_JIT
> @@ -101,4 +105,9 @@ config BPF_LSM
>
>           If you are unsure how to answer this question, answer N.
>
> +config BPF_JIT_KASAN
> +       bool
> +       depends on HAVE_EBPF_JIT_KASAN
> +       default y if BPF_JIT && KASAN_GENERIC

Should this be "depends on KASAN && KASAN_GENERIC"?


> +
>  endmenu # "BPF subsystem"
>
> --
> 2.53.0
>

