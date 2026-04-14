Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC86F9D0EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIr13OXyvqQI13ILw4f4y0L0essgxoSoxIUr/ZMmVb4=; b=YlHTB4PPw3cpvd/ZpxSEFHdk87
	TPdX3wfwNsUoB8Gwx3/XmZ+l2GoX+sQKmJHyEt5bMBankwSSVyqcrpQsLTECSn3PIBupDfakvr7mu
	D973hxC0RRI7y61reALUxk5yjRzxKotq5yPaRUurY4QC1hirWzL9C8PawBCHWPDnOFfHooHKoalMc
	C+F7Hfdv0BAfVD/jddZu6K5EAHs449UzMuIGLVZaYbkOXAb1lVydG1K16DGcdNp5NUxcKQx1vRby6
	ye3X+DQwLuuUBNzz5b/de8eichA68RNUCjY2LB5IuXJWDJdFulMj8LLzDrs9f+VypNs8Lo9VUHyD+
	W6yIU+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCii6-000000006yi-1iKw;
	Tue, 14 Apr 2026 18:42:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCii2-000000006xn-264s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 18:42:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0576C5AAB4;
	Tue, 14 Apr 2026 18:42:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A0AB60410;
	Tue, 14 Apr 2026 18:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8DF710451333;
	Tue, 14 Apr 2026 20:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776192115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PIr13OXyvqQI13ILw4f4y0L0essgxoSoxIUr/ZMmVb4=;
	b=LJlMRDg+IR59Wd/DECLqU70wLASm1Z510eZOEYERg65QVMD7HevQcKcFSFn4ExyLIN9Wcu
	eZPRoEPIMbNNyEhW6ixrnG0gP6QRyaA64iP3a4hxRrbhU/QWuTCH4aZ36RE+uK8FYkyljL
	QUiKvI64VGrTMaDSQRwQ6Ot3AorBs1Y5UNJBo0jNrCvmEasqN+jIVXValz6c8fRSFOmKfs
	XAO75NGEjOi4zCGbhKMOvpz1fZ6pOrJyAVLNyiELzgr5CNVU14ocpDTafsWCkxnjHktiJr
	Q77KcdFV9qwJPOElw6PEmuEU5ULPjUTGDVeUrl1tC4ffCCtjAg2sugdc6CutDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 20:41:42 +0200
Message-Id: <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
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
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
In-Reply-To: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_114202_996981_1839B439 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue Apr 14, 2026 at 4:36 PM CEST, Alexei Starovoitov wrote:
> On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:
>>
>> Hi Andrey, thanks for the prompt review !
>>
>> On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
>> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foun=
dation)
>> > <alexis.lothore@bootlin.com> wrote:
>> >>
>>
>> [...]
>>
>> >> +#ifdef CONFIG_KASAN_GENERIC
>> >> +void __asan_load1(void *p);
>> >> +void __asan_store1(void *p);
>> >> +void __asan_load2(void *p);
>> >> +void __asan_store2(void *p);
>> >> +void __asan_load4(void *p);
>> >> +void __asan_store4(void *p);
>> >> +void __asan_load8(void *p);
>> >> +void __asan_store8(void *p);
>> >> +void __asan_load16(void *p);
>> >> +void __asan_store16(void *p);
>> >> +#endif /* CONFIG_KASAN_GENERIC */
>> >
>> > This looks ugly, let's not do this unless it's really required.
>> >
>> > You can just use kasan_check_read/write() instead - these are public
>> > wrappers around the same shadow memory checking functions. And they
>> > also work with the SW_TAGS mode, in case the BPF would want to use
>> > that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
>> > that checks a single byte, but it can be extended in the future if
>> > required to be used by BPF.)
>>
>> ACK, I'll try to use those kasan_check_read and kasan_check_write rather
>> than __asan_{load,store}X.
>
> No. The performance penalty will be too high.

Since we are mentioning it, I did not consider yet any performance
comparision/benchmarking (and I am not really familiar with usual bpf
performance validation practices for new bpf features). Is there any
existing test I should take a look at for this ? Maybe some specific
benches in tools/testing/selftests/bpf/bench ?=20

> hw_tags won't work without corresponding JIT work.
> I see no point sacrificing performance for aesthetics.
> __asan_load/storeX is what compilers emit.
> In that sense JIT is a compiler it should emit exactly the same.




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


