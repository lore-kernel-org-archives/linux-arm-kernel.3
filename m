Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C723CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwS+iJdNpXOcAfr78aAlhoAIdQrsbmE7H7gbmvGzahA=; b=S0HK68LfpAGhfK7vgArJmBeasD
	YjUXmwMcQ/d0HA+X78nfOtppFxu7B58XPmRsYYuDKJE9gXc0Zx3zufx/2z0bZAoG4k7DnQkDoUtbF
	9/two3lrvJYM0zEH8EmjjwUMqOejD9zRUQsCEJ5v8xOF0bN0+3tOc0T+c3PFa8aoVDXZoJVhOGbIS
	y8wZU2qK3ZTyMzqQ7GZ0g5i1/i07iXI0Orh0xtvpVdL/hgnGpFAPElOMdkARW0K0KSXaTyEBV4LKF
	0CPxH2eXYV7rHO8PnMU/j3ipTAQum8Kn0u5Gyw08cBpSEEHiKzV6Vbbb8vdeLMTv2glxOK8NaNoK2
	dOtwLEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTyE-0000000A9Sf-174A;
	Thu, 13 Feb 2025 07:49:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTvY-0000000A8vk-1Y7l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B162A403DB;
	Thu, 13 Feb 2025 07:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2887C4CED1;
	Thu, 13 Feb 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432787;
	bh=JGGbLDBxCkqR8K/NNEPGyugpXiMGBbR2y/dGhIlBpSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W47A3+26jJO+aOSyBxEQffv5xzRZH6zJsXCpbhKr2RKv6VurJxmYSBHg19HA1sCru
	 L6hKZePewkqAsotyeSTjuiRTJv6VFoSYZ/TZxiOILMWzhabQte/4eZZTnDornch7Bb
	 9RsoJv52jtJA2WtujUA+URSzzyouzSGpubHGnUdWiwy4E21JCyuEXgjEYYOoZQvGZD
	 usTfaOk2wWSpuejQ4JYDOW10+H3TEfUbI5YIfiZmJhNCZhijECx0A8ew1x2L+ngu/L
	 vTEeAc5Wo+fWFSL2BzUZfauY5ZuTvM0VFooa9FAnjQDG+d1ZcV6QflUAP5tl4tP1oR
	 BDmrH8yEkVFAA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 roman.gushchin@linux.dev, Will Deacon <will@kernel.org>, Ian Rogers
 <irogers@google.com>, linux-toolchains@vger.kernel.org,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
Date: Thu, 13 Feb 2025 07:46:21 +0000
Message-ID: <mb61py0yaz3qq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_234628_540669_668D3735 
X-CRM114-Status: GOOD (  23.57  )
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Song Liu <song@kernel.org> writes:

> On Wed, Feb 12, 2025 at 6:45=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.o=
rg> wrote:
>>
>> On Wed, Feb 12, 2025 at 06:36:04PM -0800, Song Liu wrote:
>> > > > [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_stati=
c]
>> > >
>> > > Does that copy_process+0xfdc/0xfd58 resolve to this line in
>> > > copy_process()?
>> > >
>> > >                         refcount_inc(&current->signal->sigcnt);
>> > >
>> > > Maybe the klp rela reference to 'current' is bogus, or resolving to =
the
>> > > wrong address somehow?
>> >
>> > It resolves the following line.
>> >
>> > p->signal->tty =3D tty_kref_get(current->signal->tty);
>> >
>> > I am not quite sure how 'current' should be resolved.
>>
>> Hm, on arm64 it looks like the value of 'current' is stored in the
>> SP_EL0 register.  So I guess that shouldn't need any relocations.
>>
>> > The size of copy_process (0xfd58) is wrong. It is only about
>> > 5.5kB in size. Also, the copy_process function in the .ko file
>> > looks very broken. I will try a few more things.
>
> When I try each step of kpatch-build, the copy_process function
> looks reasonable (according to gdb-disassemble) in fork.o and
> output.o. However, copy_process looks weird in livepatch-special-static.o,
> which is generated by ld:
>
> ld -EL  -maarch64linux -z norelro -z noexecstack
> --no-warn-rwx-segments -T ././kpatch.lds  -r -o
> livepatch-special-static.o ./patch-hook.o ./output.o
>
> I have attached these files to the email. I am not sure whether
> the email server will let them through.

I think, I am missing something here,

I did :

objdump -Dr livepatch-special-static.o | less

and

objdump -Dr output.o | less

and the disassembly of copy_process() looks exactly same.

> Indu, does this look like an issue with ld?
>
> Thanks,
> Song

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ62jThQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nSJWAP9HM6jijr9CHiI0TTsvKU41K4RJKnSA
ACLOomAKVD3b2gEA+ZOrgnaTgwLNMQtfl4tcQIKU78wweS2kXsAjr2V4/wA=
=HUa3
-----END PGP SIGNATURE-----
--=-=-=--

