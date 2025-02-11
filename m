Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6A4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt/0iFar5WRl6aZpHewFb36ggb3LydDYcBs0BC+08Ys=; b=Ajc2kFfps0g9zrZ+KNkTiruptZ
	eIAKBK3qm576bjLboQzhHlqr/lP66EpwvhCKAtWODIW3ccihJWnAqCWKQPpnFnvE7JO7fNen9Frqp
	QW/kv6sOjn3/owwjGXDEUp8CW3rTVzO7BtlXi8OVivFrTyPzD4THVf/48MU10G5XLuWxdq/mDBmPK
	fx9oMAmzMaBVvG8aNn2l2yhYoljzBj0iGqJgBQUqbQzLDOFqZBkhoRzv0lKI90NDKNb0N9Jm1prNd
	6DUd2UEJ5LWExR5WGmYXmsVzH7Rrwli4M2W+XH6kY81ja1KlxeoorGo9g7+8SW6Uw3ixIYPADdco+
	Rk52qILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuTV-00000004lQM-1zSr;
	Tue, 11 Feb 2025 17:55:09 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuS4-00000004lFZ-2Urt;
	Tue, 11 Feb 2025 17:53:42 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3FF6725400A1;
	Tue, 11 Feb 2025 12:53:38 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 12:53:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739296418;
	 x=1739382818; bh=Rt/0iFar5WRl6aZpHewFb36ggb3LydDYcBs0BC+08Ys=; b=
	xdIFMDytym6Gl76ox2nUrc/+Rjo4HHYbnFvPzDNfmVJOT9CbDLyBqAyNfdN20VvJ
	cgRQoXlnRZjr2VYKwkjXMlgUTPljbfnh7gMsvoEUjJsBMIDHV2ycpiRFGvSn+mil
	WJRoThppckQb3/r9fdkuv3RUB1qUQJWR/u+7qNoLliX7o8gbH0WV88JyiLr8EwCI
	xRHB0HrK2VgTGXyk0gkmNLjj2ZJGz7JVHmtpqFfxgJbJXF6guOsss8jWZpQINLcW
	PBGs2Hlu+BY2FpZGBn3wt/8ZYhkMR7IGByPbF9e6AYceOoo1ZeGciKOZXIxsgMcg
	4COTvD+U4Lft3Q6iJanI5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739296418; x=
	1739382818; bh=Rt/0iFar5WRl6aZpHewFb36ggb3LydDYcBs0BC+08Ys=; b=0
	DlcNb++aMvOAm9oNraH3ejZxfReC6Y5fc46AmdRDkwW41nHo/qiXXIiPqElpcSU3
	ncLOLV0a4ryIT2HlNb1QYW9yzWYjth1gqibyvMZ45CJB/v8EWZ9yMMYiryM2aY18
	MOryAESqjt4NKB2WC56yFBkPay4H+V1JixCq4pJdJHOo35lzPew+aub6VXmzOBED
	A8q2k/UfbmT1N3+eez9ZV8Wpc9ujl4wfznFJDVrVJ4X6n3DccfCHzSaj9iE2W6mr
	rvZFlSThPkLhKse2UvhMbsBzctqVUyzuHFqqMGDbTNZrBEMXrYYIW3r35Gwlh8AL
	CooNgkovAVGWzDnuxzE6Q==
X-ME-Sender: <xms:n46rZ1jbUikOuSHxPTNNI2Cn7iRliRmpGRTsc3wYuJIXL8oZqFXn6w>
    <xme:n46rZ6CQbtYAPvcFaBPAwgi143Vf5FX51PXqi39uc7VVRDo4tSUoKSfCWwJcZOZ_J
    iJ-mByPO2v0FNoTaGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeetfeduheevuddtuefgueevffeludehheefheff
    ueejudelvdehiedvffelffejtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthht
    ohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepphgrlhhmvg
    hrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgv
    lhgvhidrvgguuhdprhgtphhtthhopehhohifrghruggthhhuleehsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepihhrohhgvghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohep
    phgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprggurhhirghnrd
    hhuhhnthgvrhesihhnthgvlhdrtghomhdprhgtphhtthhopegrtghmvgeskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:n46rZ1Gs461BZbHoB9llQOxf7KMqllCx5S0qZC49xXmC6Ekq-z9a_Q>
    <xmx:n46rZ6SQUPRD6LEilvVLC7euKo6wczwsgWyqxzrWXi1iq-sAjHGEJg>
    <xmx:n46rZyyytDPl5S3GDTuFiezwfj_9ZZfJ5VcUxIg-xVlUFZ0Z7MgTcA>
    <xmx:n46rZw4BekUScJ0AeZP8wT0i2Ihr0coN7ugZeUxPwPHwDHTGC5FweQ>
    <xmx:oo6rZ78X6Hck3eR5im0KEY5fY3R-pQAhJVlM8zz_igsWuAdMEONPZbEH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 76E112220072; Tue, 11 Feb 2025 12:53:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 18:53:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Howard Chu" <howardchu95@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Kan Liang" <kan.liang@linux.intel.com>,
 "John Garry" <john.g.garry@oracle.com>, "Will Deacon" <will@kernel.org>,
 "James Clark" <james.clark@linaro.org>,
 "Mike Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>,
 guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <0195f9a0-5198-4ee0-b4ff-ea7126dc8299@app.fastmail.com>
In-Reply-To: <CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-6-irogers@google.com>
 <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com>
 <CAP-5=fUi4RYebxCGYZVHVEt0BpWVmUA6+-vDQfbai25_KJRs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating all system
 call tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_095341_094000_A68AEADC 
X-CRM114-Status: GOOD (  44.97  )
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

On Tue, Feb 11, 2025, at 18:24, Ian Rogers wrote:
> On Tue, Feb 11, 2025 at 12:09=E2=80=AFAM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
>> > "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfil=
e"
>> > common,64,renameat,rlimit,memfd_secret EM_AARCH64
>> > +cat >> "$outfile" <<EOF
>> > +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) ||
>> > defined(__aarch64__)
>>
>> Hardcoding the set of ABIs in the middle of the script seems
>> too fragile to me, I'm worried that these get out of sync quickly.
>
> I agree, again this is carrying forward a behavior and at least after
> these changes the location is just one place. Do you have any
> suggestions on how to do better?

Not sure, but I have some patches that I was planning to send
that puts these into arch/*/kernel/Makefile.syscalls for all
architectures in a consistent way. Ideally we'd use the same
Makefile contents for tools/perf in order to trivially sync
them, but I'm also happy to hear other suggestions.

Your patches are currently ahead of mine, so I don't want to
hold you up.=20

> Fwiw, I wonder a related problem/question that has come up primarily
> with Arnaldo and Howard is in having a way to determine system call
> argument types so that perf trace can pretty print them. For example,
> if via BTF it is found an argument is a "const char*" then it is
> assumed to be a string, but a "char *" is not as it may just be an out
> argument. There's a source for more information in the syzkaller
> project:
> https://github.com/google/syzkaller/blob/master/sys/linux/sys.txt
> Perhaps there's a way to generate this information from the Linux
> build and feed it into perf's build. It is out-of-scope for what I'm
> trying to do here, but I thought it worth a mention given my general
> ignorance on wider things.

Yes, this is also something I've been trying to work on. In particular
the calling conventions for 64-bit register arguments on 32-bit
targets need some help. My plan for this is to have a consistent
mapping of internal (sys_foo()) function names to argument lists,
instead of having some calls that are slightly different depending
on the architecture or ABI.

This should be in a machine-readable format so it can be parsed
not only by perf but also any other project that needs a list
(libc, gdb, qemu, strace, rust, ...)

>> > +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
>> > +EOF
>> > +build_tables
>> > "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfil=
e"
>> > common,64,n64 EM_MIPS
>> > +cat >> "$outfile" <<EOF
>> > +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)
>>
>> What about n32/o32? The syscall tables are completely different here.
>
> So perf hasn't historically supported them and no one is asking for
> support. Generating more tables isn't the problem, but we need to have
> some way of determining which table to use for n32/o32. I see
> EF_MIPS_ABI_O32 and EF_MIPS_ABI_O64, so we could add support by
> extending the lookup of the table to be both of e_machine and e_flags.
> I'm less clear on choosing n32. That said, back in the 90s I was
> working to port MIPS code to Itanium via binary translation. Given now
> Itanium is obsolete, I'm not sure it is worth adding complexity for
> the sake of MIPS. I'm happy to do what others feel is best here, but
> my default position is just to carry what the existing behavior is
> forward.

I think the way it actually works on mips is that all syscalls are
allowed in any task and the actual number identifies both the
ABI and the syscall. In some variant, the same is true on arm
(oabi/eabi) and x86-64 (64/x32), but oabi and x32 are both too
obsolete to put much work into them.

There is still some interest in mips, maybe you can poke the
maintainers and see if someone is willing to help out since you
have done the bulk of the work already.

>> > +EOF
>> > +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl"
>> > "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
>> > +cat >> "$outfile" <<EOF
>> > +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)
>>
>> This skips the 32-bit table, though I think that one is already
>> planned to be discontinued in the future.
>
> Thankfully we have awesome s390 devs on the mailing list, hopefully
> they'll shout out if I'm doing things wrong.

I also remembered that I had a patch to bring the s390 syscall.tbl
into the same format as the others, since the behavior is currently
a bit different for compat calls. I think there is also a chance
that they want to discontinue 32-bit mode entirely, given that
the last 32-bit machine was discontinued over 20 years ago, and
support for native 32-bit kernels got removed 10 years ago
after Debian 8 moved to 64 bit.

If they are confident that there are no more remaining users that
rely on 32-bit binaries, we could both save some work.

>> > +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_=
64__)
>> > +EOF
>> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.t=
bl"
>> > "$outfile" common,32,i386 EM_386
>> > +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.t=
bl"
>> > "$outfile" common,64 EM_X86_64
>> > +cat >> "$outfile" <<EOF
>> > +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) ||
>> > defined(__x86_64__)
>>
>> This misses the x32 table.
>
> Again I'm carrying forward a behavior. Would it be worth adding x32?

I would probably document it in the file as an intentional
omission, same as for arm oabi

> That said there is likely other context
> that I'm unaware of as I'm surprised x32 still exists.

There are a handful of people still testing it, and some still
using it, but I agree it completely failed to get enough
traction to be worth maintaining.

I view x32 (and the corresponding arm64 ilp32 mode that never
made it in) mostly as an exercise in benchmark(et)ing, since
it showed noticeably higher results in some versions of specint
and some compiler workloads, compared to both normal 32-bit and
64-bit modes. The time that we already wasted on maintaining
it must have long surpassed any such benefits though, so I
certainly don't want to waste more time on it.

     Arnd

