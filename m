Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D977C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1BIGeWS/EBR/8jLrt+tKcRGoZZ6nt2ib/zfegxmluE=; b=Qw3jfIsg76RFHsSobyGXa+zY8r
	nAUQKr6fvbW7HU2wd1/o9Q6DKPr5nZ5IZ/aKlllGT1LzG3PJN5AvWvGZjKcurdff4kreVXb7XFuk9
	jdSvevD0hO0jUflcAU8B1cW+kznhk2fyoVZZqIcNvCE8EMLjMuYwMdbz/C0BVeaO3loCwIwHGnFnS
	K8mVeT7uU8E/ZlCxheK/8NruGS9q64yBJFfY1b0J1Yfypv4l1l/UhsA4dZaP0D5PsyOnYSmL8naNu
	XdLT7Bg7g/2odqmTdccSSBmZ1XUUmjcfrYZ0QQxkyzr2bmncV31jgTBWShOkMuhutGBgmYTBqubSY
	WVvXrkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU5S-0000000ABS5-2UQz;
	Thu, 13 Feb 2025 07:56:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU2R-0000000AAgN-2Ysy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76F7BA41E99;
	Thu, 13 Feb 2025 07:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C112C4CED1;
	Thu, 13 Feb 2025 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739433214;
	bh=SlOp3q3mUFP/fD5O04MBbXfcN5XIWxmKvPTMhBlEFx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u1iOU9zYjjs59zBWlMZW/Ux+8qEGJUc1W4jtjvHX5PTc370uXfjQ9pmuHchWYCQ6t
	 XQLG07Z06HWQu59qNfSutUR9oy72B8R6lVAEGraiOUdqEBJRK1XWc7ksIUhfFnRiQN
	 5dfxHWyRf2xNlPM+b7cktk+wAn5qYTUIKHIk2vlgk0pmhrIeAI/KdisgUumeokdETx
	 5AAaZT/ab/wF5SyKnbyfKkpEbrzTKXbuAF/IyYIVXxqnR7ITWPeXxRcEPAHaxpal2L
	 jQUHk6/083eL8HJG2bMvFqK9LIfR2nnRR5QgQO14Do9jrl0nVLoRH+EKXHB7Bmg1gk
	 4Ci0gSbKPduDw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, roman.gushchin@linux.dev, Will Deacon
 <will@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
In-Reply-To: <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org>
 <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
Date: Thu, 13 Feb 2025 07:53:27 +0000
Message-ID: <mb61pv7tez3ew.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235335_777947_7D0FFA0A 
X-CRM114-Status: GOOD (  30.59  )
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

> On Wed, Feb 12, 2025 at 11:26=E2=80=AFPM Puranjay Mohan <puranjay@kernel.=
org> wrote:
>>
>> Song Liu <song@kernel.org> writes:
>>
>> > On Wed, Feb 12, 2025 at 4:10=E2=80=AFPM Indu Bhagat <indu.bhagat@oracl=
e.com> wrote:
>> >>
>> >> On 2/12/25 3:32 PM, Song Liu wrote:
>> >> > I run some tests with this set and my RFC set [1]. Most of
>> >> > the test is done with kpatch-build. I tested both Puranjay's
>> >> > version [3] and my version [4].
>> >> >
>> >> > For gcc 14.2.1, I have seen the following issue with this
>> >> > test [2]. This happens with both upstream and 6.13.2.
>> >> > The livepatch loaded fine, but the system spilled out the
>> >> > following warning quickly.
>> >> >
>> >>
>> >> In presence of the issue
>> >> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666, I'd expect b=
ad
>> >> data in SFrame section.  Which may be causing this symptom?
>> >>
>> >> To be clear, the issue affects loaded kernel modules.  I cannot tell =
for
>> >> certain - is there module loading involved in your test ?
>> >
>> > The KLP is a module, I guess that is also affected?
>> >
>> > During kpatch-build, we added some logic to drop the .sframe section.
>> > I guess this is wrong, as we need the .sframe section when we apply
>> > the next KLP. However, I don't think the issue is caused by missing
>> > .sframe section.
>>
>> Hi, I did the same testing and did not get the Warning.
>>
>> I am testing on the 6.12.11 kernel with GCC 11.4.1.
>
> Could you please also try kernel 6.13.2?
>
>> Just to verify, the patch we are testing is:
>
> Yes, this is the test patch.
>>
>> --- >8 ---
> [...]
>> --- 8< ---
>>
>> P.S. - I have a downstream patch for create-diff-object to generate .sfr=
ame sections for
>> livepatch module, will add it to the PR after some cleanups.
>
> Yeah, I think the .sframe section is still needed.
>

Hi Song,

Can you try with this:
https://github.com/puranjaymohan/kpatch/tree/arm64_wip

This has the .sframe logic patch, but it looks as if I wrote that code
in a 30 minute leetcode interview. I need to refactor it before I send
it for review with the main PR.

Can you test with this branch with your setup?

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ62k+RQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nZisAP9MPQWg3UbuY0yZpUIb4byCtNEENv9t
0uusw4iksm0tqAD/Z9W9tKL7DknJZNY4HVPTLUDdLbjgBRX557V7MwQn1ww=
=wnd5
-----END PGP SIGNATURE-----
--=-=-=--

