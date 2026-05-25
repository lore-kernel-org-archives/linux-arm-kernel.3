Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6ADCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzor4pOAcoXrq0r/dQWN3ieh5O1PmvSJQr5rj+ToVL8=; b=Y7iIOxLDMVav07c7Q+iA7oCCB8
	0JbT95dfeE3FqiWKWmOIPx9KcT39X47ZQUlkmoHOvBvfB4rGZ2llfAcdg15I6UpKJ2MQb8gG19+N4
	O/Db4BVdnb/LF2/oj/VDDmhMpNnK6Reea7vYVHnUCwxys6OnTN8Krgkslhdiw1a7uEJPuRmXy8re4
	NNE7VACflIF0ruCHifvVgCsV+SVZMyxQCsQCZ3se/9bUkIxq2/elnUc2ayadi5cNJxP6SJEzgLkI8
	ZKXTkuEPIMYqeBvzaaDdqZ9H5VQohJh1hy+4UUTst8CA2tq4VMar9UPsPWI3OR+PuIk3TH4B/JzGb
	j+YY6YQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZcZ-00000000BVp-3BMv;
	Mon, 25 May 2026 18:01:47 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRZcX-00000000BVR-1Zzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:01:47 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1329fc4bf77so7608127c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779732104; x=1780336904; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzor4pOAcoXrq0r/dQWN3ieh5O1PmvSJQr5rj+ToVL8=;
        b=fID1y1jMkPKlHW6DR9rPvbbMMFmSrZuCgdtcEJr9T6QLqVVccgh/OBFqhea+ORCbgo
         v28onRpV/DB0I91EaA8JjSWdYjINSeoAxyjpomkZ0EoikEq8TOemYTbOpn90wG5JwJyG
         ZegYwGPE8dTZCIrQ4FsLbPGmFS1kZspyj76cbCG7x2noyjnoj5yoQA1D+aAAGAewxTOY
         S9aKZR4bM05B65iOqPksUawryTvq5QNcruE6qUM8FfvERbP6U6VbsJ84G81ucEOboswp
         8Gw12CdRw5v/jdMtf1c7HhhTNVK7roSpJurT27PO+Bz2E1JS2ocqMWETl1Jg33PH7HKp
         XIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732104; x=1780336904;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fzor4pOAcoXrq0r/dQWN3ieh5O1PmvSJQr5rj+ToVL8=;
        b=jd7RtGUvrvwqOKCPxdjVtPXhKPDbZvEtYlfmjPobJaJNLeHOo68XjY+Hcf+aUdZkGV
         EKFVBNiCNNJUScaeuTJOe7w1naK2/DNoDn5+MG8jVn6V2naTTM3nBjhhnMhNYw7mBOYF
         CdEkZ0Lfg6SOIyqn8fQs5Z6JsIiB2YpD4VSVkecJcbGlEOHbcRC3MT/MBE9381bJZotH
         LjMr6qzYxjQaTNPQ1B8QMpDHLsM7n7zU/qZhIYCSwtlEIYA5ynI3QLR18vdcF/Mr7M+o
         TcM7Y/52jKJrzVtHzPhNT9J/fkxR4942Et91ALEOX2v/GSI3ZAzFuXzZnHWhyn5pwh5d
         5nYA==
X-Forwarded-Encrypted: i=1; AFNElJ8FaddV4DlJE1SXZKK+Lme8quPePZ3ek+kMwdhjBuFOmZRyHXihpiYwJbYUxp17I7MP0WjXhXBQoXghcX+BKKcF@lists.infradead.org
X-Gm-Message-State: AOJu0YyWahU/szRoNvyWj7YvexNNlCuLYK8Fsi8L3NhXK7rzy3aJO6dU
	o0FX4AtEt4NZ5wQp+4hfXVv4l+a5qKkB9SsHX6GCxJojqABoadP3xTL5qzb/OYTWv24=
X-Gm-Gg: Acq92OEzybLKLQnhhiFRb8x+5OLY1F2TUuPUcg2kQiHQTE8N756VxE+l/HyOk6Wv6FS
	aKpx9OUWAuD3ud89OhG0bwF5ZFTOOa8nASLj9Aho5khDHWoIT7zJRfA7AFFuykmStI53HwN39s1
	bXXEYQQDB1YsAb7CcXW+y2L+f/Txnplce5GYJrz6Cqsl3bzSCBe5iYcXntBJSZloh3WfLEe1Vp5
	LqJeF4BGHf/1r2p4nDlqnwv1NH72I/B1YIjMhdqNsCM7u8dZWMVWJ0dp/g4gqJrx8NlGenMnaEZ
	cfjg+Rqe1NDEEnNDlxMEjq4JSjVMceThWcMZKuwSoU/UTBp/zDgkoLYdYfhSECRJTcCRiamm9rU
	MCaJNeKnl9EEpsHwujWjZ789G2oDwzAKuF4rLJmgBmWbIydzINTYK4duPaGlSWsEN9nMlIZHLUB
	8oJO4=
X-Received: by 2002:a05:7022:ef01:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-1365fc7b48cmr5378838c88.34.1779732103455;
        Mon, 25 May 2026 11:01:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::cc2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a2e634csm7642048c88.2.2026.05.25.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 11:01:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 14:01:33 -0400
Message-Id: <DIRYDGLWJJWI.1PACVYJDRYBJ2@etsalapatis.com>
Subject: Re: [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Alexei Starovoitov"
 <alexei.starovoitov@gmail.com>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-3-1a5831230821@bootlin.com>
 <CA+fCnZf-o8tiv_tX9YB5eBUGx17OpztKZsEB6Awjw3WAqBAiUw@mail.gmail.com>
 <DHSWSSYRPUVC.2W3G3OU27L3HG@bootlin.com>
 <CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com>
 <DIP9O3BEWG3C.2BAHKYUIA4H4E@bootlin.com>
 <DIPDH3PCUDDG.EGYL0SYSG1IO@etsalapatis.com>
 <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
In-Reply-To: <DIRMYUXFYOVY.1LQV9E3OHGGBK@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_110145_667530_7EC9408E 
X-CRM114-Status: GOOD (  24.41  )
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

On Mon May 25, 2026 at 5:05 AM EDT, Alexis Lothor=C3=A9 wrote:
> On Fri May 22, 2026 at 7:13 PM CEST, Emil Tsalapatis wrote:
>> On Fri May 22, 2026 at 10:14 AM EDT, Alexis Lothor=C3=A9 wrote:
>>> On Tue Apr 14, 2026 at 4:38 PM CEST, Alexei Starovoitov wrote:
>>>> On Tue, Apr 14, 2026 at 6:24=E2=80=AFAM Alexis Lothor=C3=A9
>>>> <alexis.lothore@bootlin.com> wrote:
>>>>>
>>>>> On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
>>>>> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF F=
oundation)
>>>>> > <alexis.lothore@bootlin.com> wrote:
>>>
>>> [...]
>>>
>>>>> >> +config BPF_JIT_KASAN
>>>>> >> +       bool
>>>>> >> +       depends on HAVE_EBPF_JIT_KASAN
>>>>> >> +       default y if BPF_JIT && KASAN_GENERIC
>>>>> >
>>>>> > Should this be "depends on KASAN && KASAN_GENERIC"?
>>>>>
>>>>> Meaning, making it an explicit user-selectable option ?
>>>>>
>>>>> If so, the current design choice is voluntary and based on the feedba=
ck
>>>>> received on the original RFC, where I have been suggested to
>>>>> automatically enable the KASAN instrumentation in BPF programs if KAS=
AN
>>>>> support is enabled in the kernel ([1]). But if a user-selectable togg=
le
>>>>> is eventually a better solution, I'm fine with changing it.
>>>>
>>>> Let's not add more config knobs.
>>>> Even this patch looks redundant.
>>>> Inside JIT do instrumentation when KASAN_GENERIC is set.
>>>
>>> (with quite some delay) I think it would be better to keep this new
>>> BPF_JIT_KASAN, because aside from the possibility to use it in
>>> bpf_jit_comp.c, it allows to update tests affected by KASAN
>>> instrumentation in a nicer way. For example, the test_loader subtests
>>> that monitor JITted instructions are confused by KASAN. I can either
>>> skip them or make them smarter when KASAN is enabled for BPF, but in
>>> both cases, it would be nicer to just adapt the behavior based on a
>>> generic CONFIG_BPF_JIT_KASAN, rather than sprinkling some "if
>>> jit_enabled AND CONFIG_KASAN_GENERIC AND ARCH_X86" in selftests. That
>>> still does not make it a config knob, that just creates an internal
>>> Kconfig option that is automatically turned on when KASAN and JIT are
>>> enabled at build time.
>>
>> Having a togglable config knob gives us the option to set up KASAN for
>> the kernel but not for BPF, and I don't see why we'd want that. Imo we a=
re
>> already paying the cost of KASAN for the rest of the kernel, there is no
>> incentive to not run it for the BPF JIT. Having to eat the complexity co=
st
>> in the selftests seems reasonable if the alternative means a cleaner
>> interface for the user (preventing them from choosing an unreasonable
>> combination of options).
>
> Again, this does not expose a togglable knob, this is a purely internal
> kconfig, automatically enabled if CONFIG_KASAN_GENERIC is set and if the
> architecture-specific Kconfig defines HAVE_EBPF_JIT_KASAN (since we want
> it for x86 only), and there would be no way to enable KASAN for kernel
> only and not for BPF, or the other way around. What I am proposing is
> just an internal, architecture-agnostice kconfig to avoid conditioning
> some selftests to any architecture.=20

Makes sense, in this case this seems reasonable.

>
> Alexis


