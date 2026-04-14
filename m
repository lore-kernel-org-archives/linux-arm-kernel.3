Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209B2F9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBYaHCpG8hC1NEAoLKhT2eDDnp5ePCFis5i2nukgCY4=; b=kBB12fhtzXFxoMrteqJGrNEr+l
	kIOIH+c3Wu+E8/GZ5xjp9cIE/wq+34r2/bO3DPsXUJQhJZdonNiT26t01eBBqmL0Mga199b6CWuDu
	mHk7fNE0IBiR6fQJWLoeqMnY2YpYHnr6+MC6zJ9g3aPDy97GOV5eHE32QHV0oimQ2wP8cYIqalk7Q
	/0hlCmPQjWA062+j3cug3uKdD1p9DkqNbmRQhQVxACnJ94PJHld9oT6c8+WTa8MFJLBx65vBtSLkJ
	eJLndYUU92bdMlV+2EmH7jRiYHyTTyCG6H7j6o+wLnag/SLgUvEM/27HpqkMxfoh2cIefgUJotPBf
	5dfugSHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe3c-0000000HOXN-2jMn;
	Tue, 14 Apr 2026 13:44:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe3Y-0000000HOWU-20QK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:43:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1406BC5AAAC;
	Tue, 14 Apr 2026 13:44:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E416660410;
	Tue, 14 Apr 2026 13:43:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 450DD10450118;
	Tue, 14 Apr 2026 15:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776174232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fBYaHCpG8hC1NEAoLKhT2eDDnp5ePCFis5i2nukgCY4=;
	b=S6AAfSv+oUeOvIrxD+z5bbdfpbvEOB21uXEtXvB4AqMh4FY8aCuyB3wHwx9r7WuVdHJYL+
	rD0/08M7IBbmkTkrkT4y4rKcwWyqFckHbY0d9PtwNrkx7DaSk7KT0vztBafKaTOmUOws5w
	qAGaNH/SCsFaeSpXq+U1fXnRnSb6RTAFiP4wAme1fA2E/ecJefwxeRaUPgj3ZmXhRt7wxY
	aas0aDmqQnMSQ8xEcyHooL1//5S5S9RSul/ZsJlUWSIBozq2b3PI6l6xl3ldUHUduj47SE
	koioV9P/g0ItanZHdEow/RtOOTONKeljDR3QB5PLNB90x26lfEpu4eQqk7yUEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:43:42 +0200
Message-Id: <DHSX7PABLUSN.1VYMRZ02DFZEL@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 8/8] selftests/bpf: add tests to validate
 KASAN on JIT programs
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Andrey Ryabinin"
 <ryabinin.a.a@gmail.com>, "Alexander Potapenko" <glider@google.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrey Konovalov" <andreyknvl@gmail.com>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-8-1a5831230821@bootlin.com>
 <CA+fCnZekgcEgsZnRrOB=+HoG=neRg=oLTt2jStyrPJ6mYf2ctQ@mail.gmail.com>
In-Reply-To: <CA+fCnZekgcEgsZnRrOB=+HoG=neRg=oLTt2jStyrPJ6mYf2ctQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064357_105789_556FF990 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue Apr 14, 2026 at 12:20 AM CEST, Andrey Konovalov wrote:
> On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundat=
ion)
> <alexis.lothore@bootlin.com> wrote:
>>
>> Add a basic KASAN test runner that loads and test-run programs that can
>> trigger memory management bugs. The test captures kernel logs and ensure
>> that the expected KASAN splat is emitted by searching for the
>> corresponding first lines in the report.
>>
>> This version implements two faulty programs triggering either a
>> user-after-free, or an out-of-bounds memory usage. The bugs are
>> triggered thanks to some dedicated kfuncs in bpf_testmod.c, but two
>> different techniques are used, as some cases can be quite hard to
>> trigger in a pure "black box" approach:
>> - for reads, we can make the used kfuncs return some faulty pointers
>>   that ebpf programs will manipulate, they will generate legitimate
>>   kasan reports as a consequence
>> - applying the same trick for faulty writes is harder, as ebpf programs
>>   can't write kernel data freely. So ebpf programs can call another
>>   specific testing kfunc that will alter the shadow memory matching the
>>   passed memory (eg: a map). When the program will try to write to the
>>   corresponding memory, it will trigger a report as well.
>>
>> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boo=
tlin.com>
>> ---
>> The way of bringing kasan_poison into bpf_testmod is definitely not
>> ideal.  But I would like to validate the testing approach (triggering
>> real faulty accesses, which is hard on some cases, VS manually poisoning
>> BPF-manipulated memory) before eventually making clean bridges between
>> KASAN APIs and bpf_testmod.c, if the latter approach is the valid one.
>
> Would it make sense to put these tests into KASAN KUnit tests in
> mm/kasan/kasan_test_c.c? I assume there is a kernel API to JIT BPF
> programs from the kernel itself?

Possibly indeed, but I think one important use case will be the
possibility to run those tests in BPF CI ([1]), and this depends on
those tests being integrated in the test_progs framework
(tools/testing/selftests/bpf)

[1] https://github.com/kernel-patches/bpf/pulls

> There, you can just call kasan_poison(), some tests already do this.
> And you can also extend the KASAN KUnit test framework to find out
> whether the bad access is a read or write, if you want to check this.

Alexis
--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


