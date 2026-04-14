Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B302F9D0D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=; b=LFEdwU7HX9rrl1tfk8voXExy8/
	NJD0wynYG6v9RE+zTvLjiVkvmuE5u6s45RAx2/m6Cynlih1gfALwOgxx3BAi0lQ8nmSm5ICnjIOPO
	gGuzv6y7Wdo0kQVpyT6CaF8ad5gtJR73DdRiGz1kLGYygMYdgX83fC20koIPi/HAfvD5Ayvi00ewP
	IrcNDjabufOE5KFnswLsx8jUauRJOI0ZGoEJ8FRJkRtb84U9fdV1jcn6R+aBkrQ65eR1LtPMhJuvQ
	7fU4IQZcV9PCEJ24WIRNbhGLS+MtJF4kH3lXLZdi6VsH1rjKMnQCHpE86yIU+CwLpUbPKs0PFCwje
	wGX944cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeuk-0000000HT8P-3ko8;
	Tue, 14 Apr 2026 14:38:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeuh-0000000HT7r-3gtf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:38:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso4829136f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177530; cv=none;
        d=google.com; s=arc-20240605;
        b=hmWe6hmOq+34u2uo43gCTeD9b4QWS6RbWAPTxJrODXSOhU+/Z120bHtcTuYlVrqAVe
         f+0GA9sw+Ra53bfbkyWSFR47+cogNFCSzU4Htsug+MjYc95h4g/I1jC6WpztGSmHnx3M
         HS92xFFSG2HtyHom0STz1Mc5OZxKkj/F74+1Jdab7DBuI5+x6wK4Ex2T1HFdnQt+/tt7
         5QSGF3uSV6oyPp9tIrhgEtCHm96nYtdwdHaMcXvfDkG+wIBwkx9/0Hns3oRZFzh0KdiN
         /kDsWRIGXjW88W3eNHIxdy+LLXc97J+ekDFIecfYJBnfi1yN3g14Le6xm6tRZFU67Qj/
         1zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        fh=u6/0hCjB4+yZGEMw8Uwzud4mqW0wVBlRBLoGUv6ccB4=;
        b=Er+bEDiAKRo8AjdHaHoMtSHERvM7vfab4ui7k0I8IhTa3g8903NnUn1FUYwiVGVoPr
         5/hWynxLMXkLPLiTerGwy5f2NnXCH976WNkuOMUe43ysroR90eHiNKUoO7/Vub5lnpzm
         p2EHy+IU3Lnn/OYiuU0YmPfxl6WtdQtEFPc6N1Pu4ICqn+UjCzJVwkUZB1KJzylANKSi
         lqNGuBY+/ktA3WJrIj8/UCObF8DuYXG6fBo4pe7/W1oyCqxIE7WdlddKqrJ7KwVki8Xs
         6wp93gFGIcIDIxo1XJG2MgsTtQEvWXmr/UqhhEOCAbScKykTI6FUzEnW7+zURNJgx3Xh
         ucnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177530; x=1776782330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        b=TMf3FETtpo0FiTLdqhPuOGXhjxnaPrd1z4FMRsjzO5ZAyHJ2SsJngHYvbEifCk7iYf
         ny8x/hkbNcXZeUb95MHFW4D4XlujdZIMPKuICXuw/kMjI+DhvxST1aI07qeuylV9zniY
         d3gJc2nhNu+gplyQ0VRPMXGqfeIrD7ui+jX/9Eihxx/GLSGfKZCaxxWA9lx1DNAwsQC5
         rje4GXVuyM3XTkeeeH7YrJIc1AmeijSKudhuuUS7+3xLpkreIt2pBx1yYRNCATC0JIrH
         xJBoLTZvzKgTd7Vj2uSjvECmvce56EhZF0yZ3HByuLZ7CwDcbqBENHwHF+veSdH6QpRo
         3QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177530; x=1776782330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3FcHIl3IgssSn4hNhLSe6L719nynY/t+2SO5yRqP3Y=;
        b=QtgAG+gjo4usovFKRfR8bkWRdyuPrqeXLv151Ku8OdfMxArs0cH5HP4a+W3/crch3j
         /OuILXEhmyW4DWNGnReWJk2Vh1Oe8ZfCHftAgR2WFeOceZzzSgjl8U9XwRPLvcEqwaaL
         Mw474L9/Lk34vwk0GdaeDrDbC0Yd8LxecYhX0oUBHs0Vk82BJlTW8FsWR+kb4JLZ1nsK
         fuUyVhI2IopKVsdojWkAXi0EVp0im9tLYm37Rzb7xrCCgOeay1NSEmG1zBmcBuqL1WGu
         FWOh6uJ4HrKR9CiY78NUbRBt9zmUVQE6b8poooLHeyfEG0fA/9S6HC/GDBF7AuQ2NRoL
         x+jg==
X-Forwarded-Encrypted: i=1; AFNElJ/EOagvvprRdyNKYAM5d4UZKQa9XVlZgokOGgEuodsjbMMII9Ulk7wRJTamQpjouqw7yJGwwtl1kZZu9neD1vfj@lists.infradead.org
X-Gm-Message-State: AOJu0YyRS7nHjI2QPyg5eDCgo3eVEYHVJLTWcuxIS1x0ar0n6ZvAQp+X
	dKCObHMfUVdZUvQxLB2tRyYJ+z3eUOTQ+1ht6HfHhLs+LD6zGTTShEsaXz4keYLGaiOj0KF9NFz
	d3ZN9pSjGMZ9zbZwGq41ALWOHcengDPM=
X-Gm-Gg: AeBDievRPalQlvONPikspgXGA+3fMi+jBGVVLBn2/ws2O0ucFuvuDUMMDMnAfFkzpxM
	rqCzC1EtmS1rRcp0/KM0bllI5Sl7l0+WzG9B9ZrDVdOAVDm1uGzcLqompsrDwiIG9RX9wh0oEUA
	G9uFcd/l3miORLsFNGL1hcViuQdwhS5udpYMAoHQgtw+zwtDWUyJ67kWuA/wfAi78DoiGkYEELN
	lpIH1jw2GLhL/Efdj1jyfkcguEKGQBCnuzkN0Dpd0rEkI0reJQbwZdPxFZ+dwpTtsH3rTkMBclx
	Vuizh0jweTFGAtGzLkcdaJ+JgaQw+Zu+5GKxWRFJmQ34/jxPZ5oe3oGioSQLlzCPfFg2SamcJna
	RauRUkrDPPoTF3RqIXekSkwdRWw==
X-Received: by 2002:a5d:5d85:0:b0:43d:73de:abd2 with SMTP id
 ffacd0b85a97d-43d73dead51mr14691281f8f.26.1776177529609; Tue, 14 Apr 2026
 07:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com> <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
In-Reply-To: <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:38:38 -0700
X-Gm-Features: AQROBzAAc3g7dGJeHc3HZECQFqFuOBrJ_YiWzr60z_aqmL-sqKG6l_qunoKkETU
Message-ID: <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_073851_947083_B4645ADC 
X-CRM114-Status: GOOD (  25.68  )
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

On Tue, Apr 14, 2026 at 6:24=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enabl=
es
> >> KASAN (Kernel Address Sanitizer) memory access checks for JIT-compiled
> >> BPF programs, when both KASAN and JIT compiler are enabled. When
> >> enabled, the JIT compiler will emit shadow memory checks before memory
> >> loads and stores to detect use-after-free, out-of-bounds, and other
> >> memory safety bugs at runtime. The option is gated behind
> >> HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.
> >>
> >> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@b=
ootlin.com>
> >> ---
> >>  kernel/bpf/Kconfig | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> >> index eb3de35734f0..28392adb3d7e 100644
> >> --- a/kernel/bpf/Kconfig
> >> +++ b/kernel/bpf/Kconfig
> >> @@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
> >>  config HAVE_EBPF_JIT
> >>         bool
> >>
> >> +# KASAN support for JIT compiler
> >> +config HAVE_EBPF_JIT_KASAN
> >> +       bool
> >> +
> >>  # Used by archs to tell that they want the BPF JIT compiler enabled b=
y
> >>  # default for kernels that were compiled with BPF JIT support.
> >>  config ARCH_WANT_DEFAULT_BPF_JIT
> >> @@ -101,4 +105,9 @@ config BPF_LSM
> >>
> >>           If you are unsure how to answer this question, answer N.
> >>
> >> +config BPF_JIT_KASAN
> >> +       bool
> >> +       depends on HAVE_EBPF_JIT_KASAN
> >> +       default y if BPF_JIT && KASAN_GENERIC
> >
> > Should this be "depends on KASAN && KASAN_GENERIC"?
>
> Meaning, making it an explicit user-selectable option ?
>
> If so, the current design choice is voluntary and based on the feedback
> received on the original RFC, where I have been suggested to
> automatically enable the KASAN instrumentation in BPF programs if KASAN
> support is enabled in the kernel ([1]). But if a user-selectable toggle
> is eventually a better solution, I'm fine with changing it.

Let's not add more config knobs.
Even this patch looks redundant.
Inside JIT do instrumentation when KASAN_GENERIC is set.

