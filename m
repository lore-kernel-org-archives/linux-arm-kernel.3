Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAC6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ/5ptxNXx2Wzzp0kBOWoONMJBsbeO0IvepzVsIiae4=; b=lAEBHZYHNJG2zXa+zIlVJEu2RQ
	AqvZU610MGc9jKhkeVmvl4yprcvCVSc6qpCUazua917wrn5daNDjm4NqUiLW3oEK2hOxsvHaDl7EO
	VrhwIMrThRvVXOudgrzsO0jI6CsfIW9IPK+YH2NjS5AtJ7nFjmmlEvVRQDGZtOjIDLrOmnAaYV16f
	oqzVFVUMzjQzT4Ns4TGTe27yb0A8v5v1C3I2CpizVYMGwMDDrpacjthWD6mUdxUfL+zsi7UBUl5hj
	tPe2HEdIPLglyS1I4bIAmUZTnhsunVi/apOAaldRF+t5Qy+udnlBTRI1UIehfx83jDysDeoIT1Jvw
	glLdoa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tircK-0000000EEU4-3nJD;
	Fri, 14 Feb 2025 09:04:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirVE-0000000ECgt-2mQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF77F5C591B;
	Fri, 14 Feb 2025 08:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915AAC4CED1;
	Fri, 14 Feb 2025 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739523411;
	bh=UuVe/NHpjUQBGvgHKZMk6upQjW6kuksHuEMlSdnEBFk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PLb5V+BPTWLjazx/H83Tlhn74+H9KFyzUk70ajeyViFUEAIYZCVfwNOYniwwZdbDB
	 PCmyg9F3+AxavgCGQOFIzm7QYLgH8p3WfaJCInKint0/6RkUlEeIth6x8yt+eVlNW4
	 +nzeWYTsuGLpDt3tjy/6AkA/thvnUMOvuKiEtWKU9URaXha9qC0h5fJfXJa/qAxDS7
	 ax8uJ00j6qqPPXBmuduhc5J/ZMMXznnWIPCb/tpJCZmKlafaMmFGTHf8EKLuMLDx+U
	 IARv8fIvL9Z/CPO8DK2rglf1FxrhTSmGU6vyPM/JNiex1/u4PTeRp3kmCfoJeTWrzk
	 E+vr+SRKF//0w==
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
In-Reply-To: <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com>
 <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org>
 <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org>
 <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
 <mb61pr0411o57.fsf@kernel.org>
 <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
Date: Fri, 14 Feb 2025 08:56:45 +0000
Message-ID: <mb61p7c5sdhv6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005652_786978_09B8D2F4 
X-CRM114-Status: GOOD (  29.14  )
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

> On Thu, Feb 13, 2025 at 2:22=E2=80=AFPM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
>>
>> Song Liu <song@kernel.org> writes:
>>
>> > On Thu, Feb 13, 2025 at 12:38=E2=80=AFAM Puranjay Mohan <puranjay@kern=
el.org> wrote:
>> > [...]
>> >>
>> >> P.S. - The livepatch doesn't have copy_process() but only copy_signal=
(),
>> >> yours had copy_process() somehow.
>> >
>> > In my build, copy_signal is inlined to copy_process, unless I add noin=
line.
>> > If I do add noinline, the issue will not reproduce.
>> >
>> > I tried more combinations. The issue doesn't reproduce if I either
>> > 1) add noinline to copy_signal, so we are not patching the whole
>> >    copy_process function;
>> > or
>> > 2) Switch compiler from gcc 14.2.1 to gcc 11.5.0.
>> >
>> > So it appears something in gcc 14.2.1 is causing live patch to fail
>> > for copy_process().
>>
>> So, can you test your RFC set (without SFRAME) with gcc 14.2.1, so we
>> can be sure that it is not a sframe problem?
>>
>> And about having the .sframe section in the livepatch module, I realised
>> that this set doesn't include support for reading/using sframe data from
>> any module(livepatches included), so the patch I added for generating
>> .sframe in kpatch is irrelevant because it is a no-op with the current s=
etup.
>
> Puranjay,
>
> Could you please try the following?
>
> 1. Use gcc 11.4.1;
> 2. Add __always_inline to copy_signal();
> 3. Build kernel, and livepatch with the same test (we need to
>     add __always_inline to the .patch file).
> 4. Run gdb livepatch-xxx.ko
> 5. In gdb do disassemble copy_process.
>
> In my tests, both gcc-14.2.1 and gcc-11.5.0 generated a .ko file
> that looks weird in gdb-disassemble. Specifically, readels shows
> copy_process is about 5.5kB, but gdb-disassemble only shows
> 140 bytes or so for copy_process. clang doesn't seem to have
> this problem.
>
> I am really curious whether you have the same problem in your
> setup.

Hi Song,

I did this test and found the same issue as you (gdb assembly broken),
but I can see this issue even without the inlining. I think GDB tried to
load the debuginfo and that is somehow broken therefore it fails to
disassemblt properly.

But even with inlining, I couldn't see the warning about the refcount
with my setup.

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZ68FThQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2nWlnAQCVrkv46a1mIlCe/RDFg5P7r37Eq6h/
l5JEZS8o3EforwEAlJ1jBINFDr3sUWWrWm5r01MsNlkRrRlDUXf93um+dgU=
=ADzt
-----END PGP SIGNATURE-----
--=-=-=--

