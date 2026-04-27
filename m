Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BDFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enlPWmXbCXiBTtPjtrqyyDQhH4YVYS+iBt6pkMFkQHE=; b=k56XEEfkY9WyWNDooP7HGLs678
	22JcYE0GiiSeL3gKDbzeXycFzQQ234MqNz10WUW941X3OkhwbRDDH/RX48Q/HeWPLiPb+wis/RmRp
	ONxYfN5/1VhhnCREQeFnSc0B15tg8qpJyV6bnwWyB3MsR02olX4YCWPc4ZwHeNEL9LopsfUOYvq90
	SoRLheP9mnDu6HR9R44+iq1/ysD3i2OH0NNzz7xKcdKrjU5aUl03oVzW01U+EI166KTZl+jaKJpvs
	cHzwfSPW6pEDy9N/41pMkD/yP9kK/LiboCB6POrR/0If5LhDimWbF4apUZLFl4ybxRvA3Wrw67TUk
	1upVbGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHbI-0000000GUCV-4Bt2;
	Mon, 27 Apr 2026 08:45:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHbF-0000000GUC8-0NLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:45:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A24BE1A343D;
	Mon, 27 Apr 2026 08:45:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D3D9600D1;
	Mon, 27 Apr 2026 08:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E94B10722389;
	Mon, 27 Apr 2026 10:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777279546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=enlPWmXbCXiBTtPjtrqyyDQhH4YVYS+iBt6pkMFkQHE=;
	b=WJbcAploUg0VmF8Pr+sfgdotkcsE+3i3sOgj0VN9GILZjM/dn7k2l6yEnDFaLgNnsHB2ke
	rIiFoGiqvbcbZUtxKswbsaRljyz+xXTtAxqH/KKDTh71KwOwbOw8l/vQCMnSwhlcMo4xCC
	xoIgVMfDds0upX6YXNRrk8BNT5gtD69tE0EPWoJGdDPyPEFVH4WSMc76pnmesP3PyyGxoi
	WSBqZVZb+deNlGfh7SjsbGBSVzPwbj+XpuWgjdaPkUDHoOr+AiZQXiqXcxWBxKDn39Kuzf
	8xtuEKI55YCnUaxvGQOliOLdPRRmK0uaNRPXrzMWGxybldX6FdIJZBopPxlCjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 10:45:34 +0200
Message-Id: <DI3T0IKVGW9X.KVYWOQJN3PCI@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 0/8] bpf: add support for KASAN checks in
 JITed programs
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
In-Reply-To: <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_014553_268750_AD507AB2 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Ihor,
thanks a lot for the review and help !

On Sat Apr 25, 2026 at 1:10 AM CEST, Ihor Solodrai wrote:
> On 4/13/26 11:28 AM, Alexis Lothor=C3=83=C2=A9 (eBPF Foundation) wrote:
>> Hello,
>> this series aims to bring basic support for KASAN checks to BPF JITed
>> programs. This follows the first RFC posted in [1].

[...]

>> The series is marked and sent as RFC:
>> - to allow collecting feedback early and make sure that it goes into the
>>   right direction
>> - because it depends on Xu's work to pass data between the verifier and
>>   JIT compilers. This work is not merged yet, see [2]. I have been
>>   tracking the various revisions he sent on the ML and based my local
>>   branch on his work
>> - because tests brought by this series currently can't run on BPF CI:
>>   they expect kasan multishot to be enabled, otherwise the first test
>>   will make all other kasan-related tests fail.
>
> AFAICT this can be trivially fixed on BPF CI side, we just need to set
> kasan_multi_shot for the VMs running the tests. I will do that, your
> next revision doesn't have to be and RFC.

Sweet, much appreciated :)

I've started receiving some Sashiko reviews on the series (likely thanks
to some of your actions), I'll take a look into those and prepare a
(non-RFC) v2.

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


