Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BCEC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOqyrEbThUNu8kjTdwYn5QaXe7g+9MiXUqx8MLf4IGE=; b=n07KonO7vjBFbq4z9c+/julJD9
	u0257j4SNUjlefqtX82qyXbqVo04qQHQhWNhBCa068U2UqpY/Ig+FX4HDNvCKtX0ulEB1T9VeBZN8
	QCi3nkepJQoWP7vEWQ88xKubEc0QsZQgFUZtxYl5oP/v5YM4i5CbZZwsm/j0qs3sd6O3ZvPjLUWZU
	E1/bLX2rQV3L3WXVc1gIuip5Px9Mlvew29s4UtfaRn2TDCaqI8fs0zE/ZOF/Q7FcgB3RWZeh9AUGZ
	VA5NzxgreIVdFn5ZHBuva+z/q1/u7S9NSgLrCS6zb0ujv7Tlg9Pf1iAf2jpz+lqpFZEVKWjEsAVYJ
	yviI1WXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwkk-000000072QT-2b1q;
	Wed, 16 Jul 2025 07:40:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwiJ-000000072CV-2adm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 07:38:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 525E1444FC;
	Wed, 16 Jul 2025 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752651481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOqyrEbThUNu8kjTdwYn5QaXe7g+9MiXUqx8MLf4IGE=;
	b=hK4Bw9jRab/6Cok5R5487qjPcLp0nbakwx4NSy24zxfV/91Rhu8aVKvFIXXiTcoS6bBLgI
	jhDMkJbcEvaGsA5dojIPFtavKMWASnsdwGoTR7z7RtGCtF6yH8vkG3B4PHp0vNcKO67cqW
	mr97hFp1KdYsxF6YS6IhPSV7YnIMqhruGQCj1p8cREYw1a3c2I3/1GzYzh6W8jWB8Mc5Hr
	kkXUgWKMDSdiOBQqiin/iBNIe91TGzvDQP1voXbxPYBF2rtLgeufyYRIxBhfPsx//1mKuK
	YyGXecYfTJah/5AL2Mhic946zySddzeg4EJPVTbCrWAhj7QDr+hmmFYuNq0qIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:37:59 +0200
Message-Id: <DBDB3I5H4PW1.39J6V9NEXG2LI@bootlin.com>
Subject: Re: [PATCH 1/2] bpf, arm64: remove structs on stack constraint
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Mykola Lysenko" <mykolal@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, <ebpf@linuxfoundation.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "bpf" <bpf@vger.kernel.org>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Will Deacon"
 <will@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
 <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
 <aHZYcY_9JtK8so3C@willie-the-truck>
 <DBCONB7XHN7E.2UQMMG6RICMFY@bootlin.com>
 <aHZmOVpcoyTvGY1u@willie-the-truck>
 <CAADnVQK=x7p6zjvNbv0iqOfE73DM3j0nGSGrFX+pVExLMkJb=w@mail.gmail.com>
In-Reply-To: <CAADnVQK=x7p6zjvNbv0iqOfE73DM3j0nGSGrFX+pVExLMkJb=w@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekgeelvdekvdevhfdvgfeiffeuieelfffgleeivdelheelvdeiveetfedtiedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdejpdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesi
 hhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_003803_806656_35556720 
X-CRM114-Status: GOOD (  39.17  )
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

On Tue Jul 15, 2025 at 5:40 PM CEST, Alexei Starovoitov wrote:
> On Tue, Jul 15, 2025 at 7:31=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
>>
>> On Tue, Jul 15, 2025 at 04:02:25PM +0200, Alexis Lothor=C3=A9 wrote:
>> > On Tue Jul 15, 2025 at 3:32 PM CEST, Will Deacon wrote:
>> > > On Wed, Jul 09, 2025 at 10:36:55AM +0200, Alexis Lothor=C3=A9 (eBPF =
Foundation) wrote:
>> > >> While introducing support for 9+ arguments for tracing programs on
>> > >> ARM64, commit 9014cf56f13d ("bpf, arm64: Support up to 12 function
>> > >> arguments") has also introduced a constraint preventing BPF trampol=
ines
>> > >> from being generated if the target function consumes a struct argum=
ent
>> > >> passed on stack, because of uncertainties around the exact struct
>> > >> location: if the struct has been marked as packed or with a custom
>> > >> alignment, this info is not reflected in BTF data, and so generated
>> > >> tracing trampolines could read the target function arguments at wro=
ng
>> > >> offsets.
>> > >>
>> > >> This issue is not specific to ARM64: there has been an attempt (see=
 [1])
>> > >> to bring the same constraint to other architectures JIT compilers. =
But
>> > >> discussions following this attempt led to the move of this constrai=
nt
>> > >> out of the kernel (see [2]): instead of preventing the kernel from
>> > >> generating trampolines for those functions consuming structs on sta=
ck,
>> > >> it is simpler to just make sure that those functions with uncertain
>> > >> struct arguments location are not encoded in BTF information, and s=
o
>> > >> that one can not even attempt to attach a tracing program to such
>> > >> function. The task is then deferred to pahole (see [3]).
>> > >>
>> > >> Now that the constraint is handled by pahole, remove it from the ar=
m64
>> > >> JIT compiler to keep it simple.
>> > >>
>> > >> [1] https://lore.kernel.org/bpf/20250613-deny_trampoline_structs_on=
_stack-v1-0-5be9211768c3@bootlin.com/
>> > >> [2] https://lore.kernel.org/bpf/CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAU=
H3y1K6x5bWcL-5pg@mail.gmail.com/
>> > >> [3] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-=
v3-0-29569e086c12@bootlin.com/
>> > >>
>> > >> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothor=
e@bootlin.com>
>> > >> ---
>> > >>  arch/arm64/net/bpf_jit_comp.c | 5 -----
>> > >>  1 file changed, 5 deletions(-)
>> > >
>> > > This is a question born more out of ignorance that insight, but how =
do
>> > > we ensure that the version of pahole being used is sufficiently
>> > > up-to-date that the in-kernel check is not required?
>> >
>> > Based on earlier discussions, I am not convinced it is worth maintaini=
ng
>> > the check depending on the pahole version used in BTF. Other architect=
ures
>> > exposing a JIT compiler don't have the in-kernel check and so are alre=
ady
>> > exposed to this very specific case, but discussions around my attempt =
to
>> > enforce the check on other JIT comp showed that the rarity of this cas=
e do
>> > not justify protecting it on kernel side (see [1]).
>>
>> I can understand why doing this in pahole rather than in each individual
>> JIT is preferable, but I don't think there's any harm leaving the
>> existing two line check in arm64 as long as older versions of pahole
>> might be used, is there? I wouldn't say that removing it really
>> simplifies the JIT compiler when you consider the rest of the
>> implementation.
>>
>> Of course, once the kernel requires a version of pahole recent enough
>> to contain [3], we should drop the check in the JIT compiler as the
>> one in pahole looks like it's more selective about the functions it
>> rejects.
>
> I frankly don't see the point in adding and maintaining such checks
> and code in the kernel for hypothetical cases that are not present
> in the kernel and highly unlikely ever be.
> The arm64 jit check was added out of abundance of caution.
> There was way too much "caution".

To complete Alexei's point: the check currently implemented in ARM64 JIT
comp is filtering _too many_ functions. It prevents attachment to any
function consuming a struct passed by value on the stack. But what we
really want is only about filtering those _when their alignment is
altered_, which is something that can not currently be deduced at runtime
in JIT comps. That's part of the reason why this has been moved to pahole.

I would also add that there is another small drawback about keeping this
check on ARM64 only, while not adding it to other JIT comps: we have to
keep filtering out some tests for ARM64, while the feature set is actually
the same as for the other archs. Sure, this discrepancy could be eliminated
once pahole minimum version in kernel build system contains the needed
development, as Will suggests, but I don't see that hapenning before many
months/years.

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


