Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6ABC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1e/jm15u8XZjMQynOeGZ5fjJarSB1qSJ5JLVb8liuK8=; b=XfT4n18hIKSR21sNKnCMFAzKyQ
	X4UXNJChK2dMII23JdxMOJPZKD4gt2pzCryy+uZL7W24jauWAy08L8WorQi7jz8qCsa5WVVLoCT3g
	UjGBtnyeHOCEBHPiNk45hWjP+1LmZ/ZEHTe6+NmGuIi0sdpXH4rZj7ub8B5NKSTO+YifBYVvSYKKU
	AW5lTjKYN81dNfOf6CKBy5seBGRYi/dF4v3sCnzEdo9/sDlvCANKmeblyduPkTe2Mf97KSqG8FdhJ
	+hD8vHwOPDAEhbYLZMM238tqbwqDCZNKMHBlZzzH6r6l9/QDa09mw/7wdx7l+VXGG0KNcuS52IyvM
	JlXNdlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihcd-0000000CoU3-2nTe;
	Thu, 13 Feb 2025 22:23:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihbD-0000000CoLx-0V0a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 22:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1e/jm15u8XZjMQynOeGZ5fjJarSB1qSJ5JLVb8liuK8=; b=LEUc2vUGqSqUTzpip2KHW2No3q
	nByTBNXiyDQrzoWAiJlAkUqJBO4KyYyPUa6mJaBUCEsBrq5U+Z1Wlvm3VXO/7c+yTATkJlosN5s0Z
	bh3NVOcCzxfCSaVBGNTRpNjlJuPU6IDwCuPaagBVSd329GvAPV0K+y2xy4jxE104p4Ej3GV14cmFM
	JfLEDdvbS+QdhAzE8o8wvxwhit1mQ2eIlAQbrcx4B9mBj4vveGUZqxMB7Y9NmjnaJft+2gt8dNdc2
	0Xv/OJykZde2uxLrPrIO1Rkx6VqCOpqysz+JwW/OyD1JPVo0YhToJbS+C6EqBI8XOM+IlE4vhRk01
	wjQdxAlQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihb6-000000017gi-0D4v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 22:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7179A42795;
	Thu, 13 Feb 2025 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D6FC4CED1;
	Thu, 13 Feb 2025 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739485331;
	bh=1CK4Id1eVmFWpaG9sBn/f5OOpSSTObssqjz+m90Pw/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AR3Dgd/Thu5XTheN4qPYo+SAQXGxp5T4IpvAt/Kc4zZjty/EuSjXV+G969chRz5Wr
	 ePiwdGtrSNhp5UkXpqAN500/3ouTTulmfDuFn5GqTS0HT8iBZCCNU/4wyBGJZSszWN
	 CZDwr2kjIatY8CSN9qJ6seR2CmCARMKYiC7dj+Mo+gc2PMYZ19xXHhms8rL+YrJVKU
	 FKwF87uYsTGue7jqMY+3OGpYXy9QE9mfOZ4yMf2oi+1gaP02ZzcbZz+RmfLHDgicwT
	 LGiq+ek9d0UUigac1MkJ9fyl83N0i95T7wMxlwmTL0Zw+knhL2q+uYMqAGrXKvsm7r
	 BcpZCuX1Avv1w==
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
In-Reply-To: <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org>
 <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org>
 <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
Date: Thu, 13 Feb 2025 22:21:56 +0000
Message-ID: <mb61pr0411o57.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_222219_983363_ADE97728 
X-CRM114-Status: GOOD (  17.31  )
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

> On Thu, Feb 13, 2025 at 12:38=E2=80=AFAM Puranjay Mohan <puranjay@kernel.=
org> wrote:
> [...]
>>
>> P.S. - The livepatch doesn't have copy_process() but only copy_signal(),
>> yours had copy_process() somehow.
>
> In my build, copy_signal is inlined to copy_process, unless I add noinlin=
e.
> If I do add noinline, the issue will not reproduce.
>
> I tried more combinations. The issue doesn't reproduce if I either
> 1) add noinline to copy_signal, so we are not patching the whole
>    copy_process function;
> or
> 2) Switch compiler from gcc 14.2.1 to gcc 11.5.0.
>
> So it appears something in gcc 14.2.1 is causing live patch to fail
> for copy_process().

So, can you test your RFC set (without SFRAME) with gcc 14.2.1, so we
can be sure that it is not a sframe problem?

And about having the .sframe section in the livepatch module, I realised
that this set doesn't include support for reading/using sframe data from
any module(livepatches included), so the patch I added for generating
.sframe in kpatch is irrelevant because it is a no-op with the current setu=
p.

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ65whhQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nXWqAP9pVx9qJCjxq8KKmY3TYqtRawZ5avzZ
L9AnG4+ojKoTFgEAjMbsGnNIDh7r5dpbZs7ds6oAq67Xuxw73oRLsXNrrgY=
=wSlN
-----END PGP SIGNATURE-----
--=-=-=--

