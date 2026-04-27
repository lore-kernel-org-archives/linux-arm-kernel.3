Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51093FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXqEElTwN2Tki8IktRXTfIVL9D01k/xyxgMf0ctrAd4=; b=XncSL1cwI7UxfmSTX6kNr0N9D/
	uiwvU8eQ7ai2cK2AcGjDIN1wVVQnpanw11cQ9q8QchKCqUhs/tfftAnteNuEVrE6KlWVUDBN/5pFj
	1NozlyIMFYv6yI2NBw7p5qjF0B92WNDYrX1WHNqboxocXJuGkpjVikpkUUYVdhQVGRGxAWc9Ql9Y9
	ibv5JMiWh6JEJQnjdGqyp+pEkQ69LRPc/oq8VwTFZJWJWsmLFAc3Td1wVT6zw4EbuHsVoc8keYtVB
	+b29lyrjnKyZcqEaLnmLQRM7MfNarqsBMkTON+VN2FnBF+c6viNTdYLtgXrcHM8KhHtNGyQA3vuJt
	Ih850HlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjl-0000000GV3f-2Kw8;
	Mon, 27 Apr 2026 08:54:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHjh-0000000GUyx-3jOT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:54:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32E231A342E;
	Mon, 27 Apr 2026 08:54:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00C60600D1;
	Mon, 27 Apr 2026 08:54:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6B410722270;
	Mon, 27 Apr 2026 10:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777280074; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TXqEElTwN2Tki8IktRXTfIVL9D01k/xyxgMf0ctrAd4=;
	b=S6fWitaVDU/VTZT6yPZJGXT7mUzoaUUbLCjgB4vRC3fCgw3YaEa8rUxESSeQ4XM7sjxdld
	w2wJkszlpI/+wJv4VqWfh21mPO0o4KNiRTj9oqzk+O10QqDUfqSImMWvLhCIOcLEjFMtyG
	sUY57bQmm2xTj8ZjKaHYGBs4eCyHXGr/RuUPsVyddOb3ET/DEUbe3cIOjRYxQgYqhcHujv
	mmeRT0Ooj0pRPIPSI9VdRSjRGsZnUXRi8k6doRZ/9vcuXQtb+ezrvE5e+kTwdL2pM/S1MO
	LmYK6n6Izjxt4mzCaSxAD8ryLg7XzSE0B+bbHBjSDcwj2rcfoRc1SPkXzxFAtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 10:54:24 +0200
Message-Id: <DI3T7A3A3LWQ.1WBAS2CWS2343@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 0/8] bpf: add support for KASAN checks in
 JITed programs
Cc: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "X86 ML" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <ebpf@linuxfoundation.org>, "Bastien
 Curutchet" <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>, "bpf"
 <bpf@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, "Network
 Development" <netdev@vger.kernel.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "kasan-dev"
 <kasan-dev@googlegroups.com>, "linux-mm" <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
 <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
In-Reply-To: <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_015438_102074_A912D6F9 
X-CRM114-Status: GOOD (  11.79  )
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

On Sat Apr 25, 2026 at 1:28 AM CEST, Alexei Starovoitov wrote:
> On Fri, Apr 24, 2026 at 4:10=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linu=
x.dev> wrote:
>>
>> I wonder if it's feasible to implement KASAN support on the verifier
>> side in post-verification fixups. AI slop for illustration:
>>
>>   ;; Original (1 BPF insn):
>>   dst =3D *(u64 *)(src + off)           ; BPF_LDX | BPF_MEM | BPF_DW
>>
>>   ;; Rewrite (~7 BPF insns):
>>   r_tmp1 =3D src                         ; BPF_MOV64_REG
>>   r_tmp1 +=3D off                        ; BPF_ALU64 | BPF_ADD | K   (fu=
ll address)
>>   r_tmp2 =3D r_tmp1                      ; copy
>>   r_tmp2 >>=3D 3                         ; KASAN_SHADOW_SCALE_SHIFT
>>   r_tmp2 +=3D KASAN_SHADOW_OFFSET        ; shadow address
>>   r_tmp3 =3D *(u8 *)(r_tmp2 + 0)         ; BPF_LDX | BPF_B   (load shado=
w byte)
>>   if r_tmp3 !=3D 0 goto +2               ; BPF_JNE | PC+2
>>   dst =3D *(u64 *)(src + off)            ; original access (fast path)
>>   goto +1                              ; skip slowpath
>>   call __asan_report_load8             ; BPF kfunc
>>   dst =3D *(u64 *)(src + off)            ; retry the access after report=
 (non-fatal)
>>
>> A sort of inline kasan directly in BPF.
>>
>> There are plenty of issues with it: instruction limit, exposing asan
>> API as kfuncs, etc. On the flip side we get cross-arch support out of
>> the box with no or mininal JIT changes.
>>
>> Honestly I'm not excited about this approach, but curious if anyone
>> thought about this, or maybe it was already discussed?
>
> We discussed this.
> It won't work because we don't have that many temp registers for once
> and second it has to preserve all (both callee and caller saved regs).
> This is arch specific.

This "fast path" was indeed part of my initial proposal. For the record:

https://lore.kernel.org/bpf/DG7UG112AVBC.JKYISDTAM30T@bootlin.com/

in the "Basic instrumentation" block.


--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


