Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8062ECD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY4I8lMoFI92sp/KvSm+KBFNyjnf2+5FqBSVyBYIdTY=; b=MyTwsQnqqjPSqZzvpo4meabm8k
	MtwWVHxvBdu6nVxfX6qdXUi5F3VeY5TUBhlOnexwbgIMdZuJVgib9YJJNdCZPyjl2Jq2dcqGaK9B3
	ZCZL750nWBgH8hMuroeYnq9ROHwUmtGSgd39AZPCrykuPkV4zsYaSl9LEgl+FSEw+DhAu9/W4+mCj
	a8jheWv8uDUJZUr/RgViqkd7nASLOVNGNaGiXByflsNI7L8MOWD9h564x+Dx5M0sa7jOTRuMiDzN7
	dbQUlfl3hC43X5r5TKwKWfj22Goqxjk3uxWR6y6E3CI0t1i2ezgqJmi+4s6KLpkc0lQc4iKevGAZI
	9LmOTWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTRR-0000000BVjo-3l0i;
	Fri, 22 May 2026 17:13:45 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTRN-0000000BVir-31cc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:13:44 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2f0ad52830cso9805409eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779470020; x=1780074820; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY4I8lMoFI92sp/KvSm+KBFNyjnf2+5FqBSVyBYIdTY=;
        b=Pt6UI4LGgJyrhZuMgY58ROgSowXwfhOsj4NHdSnz/x/whFbjI6AMQ1PUNpWhZj9Z+O
         kkyg9YHVPZBoYRBrQkeLnm0Eu+ec+LQvTnUeLF9B+/fGrhIIRnAPHnu6pZu/x7vHPXiJ
         E8r/gbYJYikfxKKOoaH3yt/g9aZUcLG3SSfaMyyE0NOZ9EFKWqwS/2IHBHbAWz0QGJhk
         WvFsaovl5D4TrgcW4IYVGM0BrmLJsA2GwAHZ7UN1VoeL1SHg+CSLeiIo6SgXD0HESBJY
         0ZjALf2sdN41pkBAN0HLeBBfgFzA6D104l2Gpztbue2G5gQroGxcz2kL0iMkkI+AUr88
         WFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470020; x=1780074820;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY4I8lMoFI92sp/KvSm+KBFNyjnf2+5FqBSVyBYIdTY=;
        b=I3yhbwZng8lj3IJKQM320JsB7ZL9kXKwSt9h7d/APrNUX5SIiKRW0A0IKwB35pJjU3
         jGGmTx2iJKlsu8InGwTj8MNRlQ0wpLbpnk/1o5OO1vfrgmK3tDTQ7psdxMyLV9K5xgtQ
         IR9eUHDkqtd6EfQXAa6VEmJtylC4SuoXwZd2FwIKWg+Gdqb0h+AGn8lQuw9adwqtiP9K
         7vB9lWfPGsueCcfs8AgN7Sh3yr/TbSAH9R+blu5aAFxI+IFP6J6oIMmyJrWS3cxyG40k
         Th6yLOMtPdOrIRJlqDlryhDDE17DH6c2tJKybBg1ouWq656HIkb01ronh/1IvTbo7cPR
         pXuA==
X-Forwarded-Encrypted: i=1; AFNElJ9qgx+1qtKULQUO3fF6xHR9IFxtbLEk0ugwLNfGbeCw24tFCo2WW5kgcCjjmjgttz/GMmgygmG/aO4EmrJfd8nm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy2iOt9ok3x7ziycZU8aJwJxOELeGNWN3YdY29iY6S6n8HZEsT
	8C6ydYet0SWqG1RgsnE00Tag7uYMixVFRqJvlGw5L2a+oU7lOYz5XSH+9g/GDMK7VN4=
X-Gm-Gg: Acq92OHGSRNt9fRG4V7CD+AGFwReS9qE77WC4rYLtI4b+CGnj3Ykzze3ZEydiz3Qy2f
	3v/cKuOeCTyEj5el/WSsZxMaIxeh79QVemhnCsz5g/ZmAOfzHzOOnX4Cjm9DBFtLxyg/hUj0nah
	pKSl16HSeyYPVyZZRuXWKIZ3oMAkbf7mWWtejNIIIMNd5470XSGpsefo+PVACjIPsluPSDTc2hP
	P+sRsMXoSvMS7xKbqKMi9wQFI2en/nxF1QaS2aS3kaBV7e0jsCpsZornzFo2jBLx0YyCk+BxqV1
	ukX+K1UUvU1oUiuzOXcQ+nRjr9WU/b6GE+69GGA1NcwftE+oILVQKNkJ0Ad6TZLgNzrDo+fkCZm
	txAZHOe9Cueh0ceQmCjikNrggzuQVdZR56YEMq3/R6PlPe3RKumiI80gp5QCUTv0YdpdcukwJwG
	3TMod7PuUgKMkwevw=
X-Received: by 2002:a05:7301:168b:b0:2be:833c:149d with SMTP id 5a478bee46e88-304491e11fcmr2091389eec.28.1779470020197;
        Fri, 22 May 2026 10:13:40 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::69da])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f3feadsm1872911eec.13.2026.05.22.10.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 10:13:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 13:13:35 -0400
Message-Id: <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
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
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
 <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
In-Reply-To: <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_101341_766028_B5E6E7D3 
X-CRM114-Status: GOOD (  22.35  )
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

On Fri May 22, 2026 at 10:14 AM EDT, Alexis Lothor=C3=A9 wrote:
> On Tue Apr 14, 2026 at 4:38 PM CEST, Alexei Starovoitov wrote:
>> On Tue, Apr 14, 2026 at 6:24=E2=80=AFAM Alexis Lothor=C3=A9
>> <alexis.lothore@bootlin.com> wrote:
>>>
>>> On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
>>> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fou=
ndation)
>>> > <alexis.lothore@bootlin.com> wrote:
>
> [...]
>
>>> >> +config BPF_JIT_KASAN
>>> >> +       bool
>>> >> +       depends on HAVE_EBPF_JIT_KASAN
>>> >> +       default y if BPF_JIT && KASAN_GENERIC
>>> >
>>> > Should this be "depends on KASAN && KASAN_GENERIC"?
>>>
>>> Meaning, making it an explicit user-selectable option ?
>>>
>>> If so, the current design choice is voluntary and based on the feedback
>>> received on the original RFC, where I have been suggested to
>>> automatically enable the KASAN instrumentation in BPF programs if KASAN
>>> support is enabled in the kernel ([1]). But if a user-selectable toggle
>>> is eventually a better solution, I'm fine with changing it.
>>
>> Let's not add more config knobs.
>> Even this patch looks redundant.
>> Inside JIT do instrumentation when KASAN_GENERIC is set.
>
> (with quite some delay) I think it would be better to keep this new
> BPF_JIT_KASAN, because aside from the possibility to use it in
> bpf_jit_comp.c, it allows to update tests affected by KASAN
> instrumentation in a nicer way. For example, the test_loader subtests
> that monitor JITted instructions are confused by KASAN. I can either
> skip them or make them smarter when KASAN is enabled for BPF, but in
> both cases, it would be nicer to just adapt the behavior based on a
> generic CONFIG_BPF_JIT_KASAN, rather than sprinkling some "if
> jit_enabled AND CONFIG_KASAN_GENERIC AND ARCH_X86" in selftests. That
> still does not make it a config knob, that just creates an internal
> Kconfig option that is automatically turned on when KASAN and JIT are
> enabled at build time.

Having a togglable config knob gives us the option to set up KASAN for
the kernel but not for BPF, and I don't see why we'd want that. Imo we are
already paying the cost of KASAN for the rest of the kernel, there is no
incentive to not run it for the BPF JIT. Having to eat the complexity cost
in the selftests seems reasonable if the alternative means a cleaner
interface for the user (preventing them from choosing an unreasonable
combination of options).

