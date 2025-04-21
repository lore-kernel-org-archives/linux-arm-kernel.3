Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58648C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze/KZBLQ8SAn7srsJbazi617+XiMAQ4PSnAV1iGpND0=; b=n4o52J3YkQ2HiX86ieu1OK8lNj
	SzxE6gyvoyriOORTlc2nrRM90/eEV/MYZS+AUE1mqsLo/wYAHR+ILpemE3PFWPkbLOA1pg9tg3Ves
	nMmOQQ63ffAxjqFcTHyjY54sblsO4Ok7+APhkPjw74WkFtLd4fQmU3JJuXIZKdssdiXmOd8fp/v4+
	Zwv+FaahLLsbWdLZBsOlf49hO/85DhXN5QFxHIGfTyaucYaV6J3prMmAHGStnxkwtYID2XBnYW4Zp
	jwBa6Oq+SNCiDkFP8Lus6Q317ZijJcZ0PWArtIaITG2JgQaKoI2c5XoYKUbmqgOX87CiR4vgoRRUr
	4Vmhgv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zkq-00000005LjV-045u;
	Mon, 21 Apr 2025 22:36:44 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zPO-00000005Il2-3zxK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:14:36 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-525b44ec88aso1993802e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745273673; x=1745878473; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze/KZBLQ8SAn7srsJbazi617+XiMAQ4PSnAV1iGpND0=;
        b=apEkHFc1THDt2LzpEtwNq3vN3qaY2Rj+6Cn7acwUAuyHgRIlI9bo+j9kjDIv1DJC0U
         eLkNc21hEwM3x9k0Cy+JihOyXTR8enBjXv5ZQvkbVXhNzh+6xAfNZvvKhNWx+EOnhMpl
         AmuD7pw8tQYEZuPTdWzsiMyYH512eW52ZnR6i5bxGnXL3F1cff1B/cOAEqglL8L+RQ4d
         POnIeW3RPgYUn3ePlLMd96a4Ptb4cMGqeNJGmOpPSTTPlgj09oIdoABppNWtcKGlK2WF
         2d+CixaR0XnSYoiZdABfEwMjIv9ZbnS3hSe0pZbgco3TPX1YdM6eVM5CwRPUzVSuoIzM
         TzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745273673; x=1745878473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze/KZBLQ8SAn7srsJbazi617+XiMAQ4PSnAV1iGpND0=;
        b=knXMrhODuZTj9OKNla31yP64W3/dZq2cS7HFjRuXlXkrFFhAuQT1fBVmNeRnhXVjGb
         pP86dM8Hhg8ERxtlTugscxrww6R23oTbKIPpYfbGI1JpzbFSELCNY1P7B1mTWEDSRB1/
         R5eWMFiAiNz0+64JIZNK79OWozD/AgNEN2zDdCVpUXz5DgYCbJ6RZY9oeVouLvjc0DMV
         CqWr5Blv8Vy/n5JlATvmTJNX634Zm1rVaTAKxKosq6eDx6XOUdE2uuGHq6XmwLKUiTkt
         UqX7hzNKgXHNZh2x/KjF86cCJmOjE65cUlFA7i5SpqrdwGdE+lNtm5eXu5zr13oqLA4+
         va5w==
X-Gm-Message-State: AOJu0YxtWaVFJSQ1SU1GuSHS81PFSrjFTbK/j+JTxOWRy/fAbVdvKbDE
	Vjmvaij6itoxXAzN+nDahLsrmb6BqkZKdhEHrTZWsifMIbR9GkSh7TKqliH3YmbgrU/m96rc5zC
	YTGdS826zfEDmEADLVX4u7qCAIicW6cOgDR07
X-Gm-Gg: ASbGncvODTQjLc1zf/H62/4gAs0BoJDFtc5VKsZgeU9s434vOTRbdukLbxRJpEpYQG+
	zc718jiSJr+kf1Fh9X6chktHjq6FJrgi2hH1vfKI+NoBxFa/+YPJOdctGTndNGosbat15ko/DhH
	+FQmPHRcRb39QlNv5Hrv+/6A==
X-Google-Smtp-Source: AGHT+IFxHYOugr6C48wO68yTTOBk7oPHItPFJzeV9k+AVGrZNWzX1hubYeJVAkRQHrqSFyznWM7DLyj2iw3cza70BSU=
X-Received: by 2002:ac5:c252:0:b0:529:2644:5eec with SMTP id
 71dfb90a1353d-5292644603fmr7360353e0c.8.1745273672851; Mon, 21 Apr 2025
 15:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-2-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-2-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 21 Apr 2025 15:14:21 -0700
X-Gm-Features: ATxdqUFzGJwrYp9hInlANxzcemcPCph2eSPtOYX9msHSoocZGM8q3RrkHGLCnhk
Message-ID: <CADBMgpwh+9YxbGvyWwT3VjFLaAvdFFexHe-9yBmpOYsPsN-xrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_151434_991534_9B0A06C7 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> Match the name and signature of the equivalent in the x86 text-poke API.
> Making the src pointer const also allows this function to be
> interchangeable with memcpy().
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/include/asm/text-patching.h |  2 +-
>  arch/arm64/kernel/patching.c           | 12 ++++++------
>  arch/arm64/net/bpf_jit_comp.c          |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/=
asm/text-patching.h
> index 587bdb91ab7a6..450d806d11109 100644
> --- a/arch/arm64/include/asm/text-patching.h
> +++ b/arch/arm64/include/asm/text-patching.h
> @@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
>
>  int aarch64_insn_write_literal_u64(void *addr, u64 val);
>  void *aarch64_insn_set(void *dst, u32 insn, size_t len);
> -void *aarch64_insn_copy(void *dst, void *src, size_t len);
> +void *text_poke(void *dst, const void *src, size_t len);
>
>  int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
>  int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 1041bc67a3eee..e07dc32620053 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -102,9 +102,9 @@ noinstr int aarch64_insn_write_literal_u64(void *addr=
, u64 val)
>         return ret;
>  }
>
> -typedef void text_poke_f(void *dst, void *src, size_t patched, size_t le=
n);
> +typedef void text_poke_f(void *dst, const void *src, size_t patched, siz=
e_t len);
>
> -static void *__text_poke(text_poke_f func, void *addr, void *src, size_t=
 len)
> +static void *__text_poke(text_poke_f func, void *addr, const void *src, =
size_t len)
>  {
>         unsigned long flags;
>         size_t patched =3D 0;
> @@ -132,12 +132,12 @@ static void *__text_poke(text_poke_f func, void *ad=
dr, void *src, size_t len)
>         return addr;
>  }
>
> -static void text_poke_memcpy(void *dst, void *src, size_t patched, size_=
t len)
> +static void text_poke_memcpy(void *dst, const void *src, size_t patched,=
 size_t len)
>  {
>         copy_to_kernel_nofault(dst, src + patched, len);
>  }
>
> -static void text_poke_memset(void *dst, void *src, size_t patched, size_=
t len)
> +static void text_poke_memset(void *dst, const void *src, size_t patched,=
 size_t len)
>  {
>         u32 c =3D *(u32 *)src;
>
> @@ -145,14 +145,14 @@ static void text_poke_memset(void *dst, void *src, =
size_t patched, size_t len)
>  }
>
>  /**
> - * aarch64_insn_copy - Copy instructions into (an unused part of) RX mem=
ory
> + * text_poke - Copy instructions into (an unused part of) RX memory
>   * @dst: address to modify
>   * @src: source of the copy
>   * @len: length to copy
>   *
>   * Useful for JITs to dump new code blocks into unused regions of RX mem=
ory.
>   */
> -noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
> +noinstr void *text_poke(void *dst, const void *src, size_t len)
>  {
>         /* A64 instructions must be word aligned */
>         if ((uintptr_t)dst & 0x3)
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index 70d7c89d3ac90..b5be90edff410 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2047,7 +2047,7 @@ bool bpf_jit_supports_kfunc_call(void)
>
>  void *bpf_arch_text_copy(void *dst, void *src, size_t len)
>  {
> -       if (!aarch64_insn_copy(dst, src, len))
> +       if (!text_poke(dst, src, len))
>                 return ERR_PTR(-EINVAL);
>         return dst;
>  }
> --
> 2.49.0.604.gff1f9ca942-goog
>

Friendly ping.

