Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C20CCD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbTl273WowpTVFd0f4oge0/+s8K6R22iN2Gqank6L1c=; b=vYjdmI2JzpElHo+DZi6sMqUdtx
	Wf5YiA8zAlKHK+d0yJXUhyww+6SliTAYbU0G+gyy+v1hELWoCj+Cmc7/FUWH5PB6yHeVU61aZAw/p
	2j4Q6vMINwS2POQNg6XId3EppxTrewivbr/fmgl/Vn44SacytSh/Pjdgb0Tzut5pE9ir886srxJeo
	xFg6QmCI+h0h6VX2f+iHDEQCwm0mFFUq/MT4lktm/2+Xy++UTNMHJNh/q0A13FspW+YQr8css2CW+
	clBxeIc9bI4pQl/KnR/WrXjRJJMFQXu37J/A0/SFQ3g/1ORGQqYhxLm2/f1BFiowzsL88wLK4aqTV
	DJt8ychg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRFm-0000000GlNr-2ONP;
	Mon, 25 May 2026 09:05:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRFj-0000000GlMk-1a4k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:05:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 92C751A36AE;
	Mon, 25 May 2026 09:05:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54B44603DC;
	Mon, 25 May 2026 09:05:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B71FC10812103;
	Mon, 25 May 2026 11:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779699932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EbTl273WowpTVFd0f4oge0/+s8K6R22iN2Gqank6L1c=;
	b=Fx+Uvlj9hDV8t2hT+BbSnAxNsdOpOaJIechqvnvpMOkSitZzXRjbsdPmMEWqyKUFfSsFqJ
	09p3+5rjCc8SD5giFz2CNAPnkmaK402kZ1+6NUodo6410UYt45sJg+eUEcarYV6jiVsG7K
	3r7plioTNGCAIgXGCNJ+2+ZTHyduDJ07uQslX/NevZyhzexSjWxmYTd3uD3CWiJVY0Dx6L
	1Io8kWVF0On9LOxU2++gFB1HzzqUg55GF2+VuffbtA126LB+ZWF26BfdlTvZICqiAoOO3B
	zd+yqqxctwthai14JAAAUMFcgFwq3eBOVqm4oxh90R+vs0N3KX+iOH5nwmbVzw==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 11:05:16 +0200
Message-Id: <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
Cc: "Andrey Konovalov" <andreyknvl@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "X86 ML" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Dmitry Vyukov"
 <dvyukov@google.com>, "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, <ebpf@linuxfoundation.org>,
 "Bastien Curutchet" <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>, "bpf"
 <bpf@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, "Network
 Development" <netdev@vger.kernel.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "kasan-dev"
 <kasan-dev@googlegroups.com>, "linux-mm" <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <alexei.starovoitov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
 <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
 <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
In-Reply-To: <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_020539_567281_A0A131D2 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri May 22, 2026 at 7:13 PM CEST, Emil Tsalapatis wrote:
> On Fri May 22, 2026 at 10:14 AM EDT, Alexis Lothor=C3=A9 wrote:
>> On Tue Apr 14, 2026 at 4:38 PM CEST, Alexei Starovoitov wrote:
>>> On Tue, Apr 14, 2026 at 6:24=E2=80=AFAM Alexis Lothor=C3=A9
>>> <alexis.lothore@bootlin.com> wrote:
>>>>
>>>> On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
>>>> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fo=
undation)
>>>> > <alexis.lothore@bootlin.com> wrote:
>>
>> [...]
>>
>>>> >> +config BPF_JIT_KASAN
>>>> >> +       bool
>>>> >> +       depends on HAVE_EBPF_JIT_KASAN
>>>> >> +       default y if BPF_JIT && KASAN_GENERIC
>>>> >
>>>> > Should this be "depends on KASAN && KASAN_GENERIC"?
>>>>
>>>> Meaning, making it an explicit user-selectable option ?
>>>>
>>>> If so, the current design choice is voluntary and based on the feedbac=
k
>>>> received on the original RFC, where I have been suggested to
>>>> automatically enable the KASAN instrumentation in BPF programs if KASA=
N
>>>> support is enabled in the kernel ([1]). But if a user-selectable toggl=
e
>>>> is eventually a better solution, I'm fine with changing it.
>>>
>>> Let's not add more config knobs.
>>> Even this patch looks redundant.
>>> Inside JIT do instrumentation when KASAN_GENERIC is set.
>>
>> (with quite some delay) I think it would be better to keep this new
>> BPF_JIT_KASAN, because aside from the possibility to use it in
>> bpf_jit_comp.c, it allows to update tests affected by KASAN
>> instrumentation in a nicer way. For example, the test_loader subtests
>> that monitor JITted instructions are confused by KASAN. I can either
>> skip them or make them smarter when KASAN is enabled for BPF, but in
>> both cases, it would be nicer to just adapt the behavior based on a
>> generic CONFIG_BPF_JIT_KASAN, rather than sprinkling some "if
>> jit_enabled AND CONFIG_KASAN_GENERIC AND ARCH_X86" in selftests. That
>> still does not make it a config knob, that just creates an internal
>> Kconfig option that is automatically turned on when KASAN and JIT are
>> enabled at build time.
>
> Having a togglable config knob gives us the option to set up KASAN for
> the kernel but not for BPF, and I don't see why we'd want that. Imo we ar=
e
> already paying the cost of KASAN for the rest of the kernel, there is no
> incentive to not run it for the BPF JIT. Having to eat the complexity cos=
t
> in the selftests seems reasonable if the alternative means a cleaner
> interface for the user (preventing them from choosing an unreasonable
> combination of options).

Again, this does not expose a togglable knob, this is a purely internal
kconfig, automatically enabled if CONFIG_KASAN_GENERIC is set and if the
architecture-specific Kconfig defines HAVE_EBPF_JIT_KASAN (since we want
it for x86 only), and there would be no way to enable KASAN for kernel
only and not for BPF, or the other way around. What I am proposing is
just an internal, architecture-agnostice kconfig to avoid conditioning
some selftests to any architecture.=20

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


