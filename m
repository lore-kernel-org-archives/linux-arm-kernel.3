Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E917D730BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkYhMFUzna61l24QjGi23lZLklSn1MZcKMUIKqU2kd8=; b=kG9mw15zVDWaB09DgV/ZHFYNVz
	cPqOyP9K6QX/lmnuVtT8JPOr9z28wGBzadNBxEm2u/q68NufpqSxBZdVspGFv9qS7xxFPsWWo5A4k
	yhdIr2LTi8OwtrOc2RQcjqPPhK70J5P1kSiIf9pX7wPjLf3p6DMt6YlreI37a9Zg58eGioddwBcr7
	ozXNQG7Mx1gwuDfzMJintzEgKRIszYRYBs/5EyuJMdN32H+XQ0Gug9HBEEOlUmZcxI1XaCu6HYswQ
	zmVjaPba6aFVL/ST+wNamgQPAulOfnDpFPBaeYkUjY6pdi1tH0XlXLW4B53BCutaYSpP/kmq7rqUI
	VEnXdQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZeH-00000001gqM-2wCh;
	Fri, 03 Apr 2026 08:13:01 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZeE-00000001gpl-0F7T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:13:00 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4461CEC0360;
	Fri,  3 Apr 2026 04:12:54 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Fri, 03 Apr 2026 04:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gruenbichler.email; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775203974; x=1775290374; bh=EkYhMFUzna
	61l24QjGi23lZLklSn1MZcKMUIKqU2kd8=; b=cncFbwVlYl69uKE3djnhbp0xHH
	+d4PTQgMcU/Fc52bZdy5I9kzgi86rHRJPBvD8D1uCCVX8bx6X5OOl96x55vGSOJb
	MqUmC9ZE99m9f8RStyzuuwtmQ03jpM6lO0quWPjXPGSmlUzJWh4SqvcoJpcHy/1Y
	lCkOnXrTyno6ZUVRppaxAJWt02BuEj2UN4eM1vwwuKFZWfXn6mjEoQTqnipEh1O7
	0N1eBDCxhfF4q+bJYoCXpVqz3xtPkxj/q2rdnXXGdhZIWwem+XLdUlt9eS9yCBVs
	UwqoV3MVFOlrTGIhlwnVnmiKzVJOqDV4sCCM0XbziLK+aqUmwcoV7R9R3xWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775203974; x=
	1775290374; bh=EkYhMFUzna61l24QjGi23lZLklSn1MZcKMUIKqU2kd8=; b=h
	gC//gygIrrgxbzQkL9IscVEbKkXbvCcpzbW2JBM82ZYg1dx4XipXUwAQ19I3kCyx
	MiYKPr8Wh8He588BtrF7r/I/lSwl8BVoX0eTYeASmu8sc5OeqP10WpxD0bWZwqi1
	9lxh++2L/F/k2qtClVfd7rrMOK/vpvaO61zr6P4gENxZuyL6cc3kVchH/yyXR8e6
	GJQ/V/5+PIfw3OfAWMGL6PiFmVpYQj9xPiQLDLpEK2915dm+jKgt+n2XdEKqJKEu
	VbBpqoV+gtmr6Ofh4bJ+LSTyWYHy9+na0NUOfvtm19fJ4NKGGS/oriLAuzQsMPeL
	ZKwiN6oV57b5lghlVRszg==
X-ME-Sender: <xms:hXbPaU0lnZReNw0I2KyIkkpsYE67csDV8Bhw5c4-mAbSJLY9CKNpiA>
    <xme:hXbPaZ7j9npNOk_oN8epLA-yCSfuTaKC-LdQCZbCIRWAoeK4wMvliE3Owa90JNElZ
    f7_JzMb4Byqv1k2NXHU6N9i_Hiz9ExsppmCoY_9KOY70MS8JfBFKqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertdejnecuhfhrohhmpefhrggsihgrnhcu
    ifhrtphnsghitghhlhgvrhcuoeguvggsihgrnhesfhgrsghirghnrdhgrhhuvghnsghitg
    hhlhgvrhdrvghmrghilheqnecuggftrfgrthhtvghrnhephedujefhieelhfeiieetkeef
    gfekgfffvdegfefggfejtdektdehudefheelhefgnecuffhomhgrihhnpehgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    peguvggsihgrnhesfhgrsghirghnrdhgrhhuvghnsghitghhlhgvrhdrvghmrghilhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhmkhdo
    khgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhish
    hirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghhuphhtrghruhgu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hXbPafT1n9mlFz3LeN2M9coMgiG10furdBYIBh8uP_4lA4Ff3ViKNw>
    <xmx:hXbPaVumkcLNGvMd90StAxAKsZgCxjTejmiYQvvauOJV07e88ryLxw>
    <xmx:hXbPaZHG3XrLB2JeplWkYKSeCcaQCDUMFOtIcT1WlLU0uNsK8U4ETQ>
    <xmx:hXbPaeyHIW4F7g5FBUdf_k6otEHqqL05abC8pZGrdbCW7srMlVo8ZQ>
    <xmx:hnbPaXf44G-2s8CsT1dbGcVUJpJQnTWGCF9cYAO7pKuxhebuJ-sasyWS>
Feedback-ID: i1739464b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 93A6DC40071; Fri,  3 Apr 2026 04:12:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AJ9MI3eEke2w
Date: Fri, 03 Apr 2026 10:12:33 +0200
From: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
To: "Miguel Ojeda" <ojeda@kernel.org>,
 "Christian Schrrefl" <chrisi.schrefl@gmail.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>
Cc: "Rudraksha Gupta" <guptarud@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
In-Reply-To: <20260331190053.482607-1-ojeda@kernel.org>
References: <20260331190053.482607-1-ojeda@kernel.org>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011258_774085_A6548F72 
X-CRM114-Status: GOOD (  17.79  )
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

On Tue, Mar 31, 2026, at 9:00 PM, Miguel Ojeda wrote:
> Hi Christian, Russell, arm, Fabian,
>
> For Rust 1.85.0, for arm32, for the `rustdoc` target (i.e. all those
> combined), I am seeing:
>
>       RUSTDOC   
> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs
>     error: target feature `fp-armv8` cannot be toggled with 
> `#[target_feature]`: Rust ties `fp-armv8` to `neon`
>         --> 
> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/arm_shared/neon/generated.rs:7538:48
>          |
>     7538 | #[cfg_attr(target_arch = "arm", target_feature(enable = 
> "fp-armv8,v8"))]
>          |                                                
> ^^^^^^^^^^^^^^^^^^^^^
>
> The issue is [1], was introduced in Rust 1.85.0 and was fixed already in
> Rust 1.85.1 [2]:
>
>   Link: https://github.com/rust-lang/rust/issues/137366 [1]
>   Link: https://github.com/rust-lang/rust/pull/137632 [2]
>
> It is unfortunate since our minimum is going to be 1.85.0 since that is
> what Debian Stable has (even if patches may be on top) -- I generally
> test the latest patch versions for each minor, but I noticed this since
> I also test the actual minimum, and I am bumping it to 1.85.0.
>
> To be clear, it is likely almost no one actually cares about this, since
> nobody complained yet, and this can easily be fixed using the already
> released Rust 1.85.1.
>
> By the way, what is Debian's policy on upstream Rust patch versions?

In unstable, we pull them in usually by virtue of lagging behind a bit anyway.

In stable there is no policy per se - both importing a new smallish important
upstream release, or cherry-picking patches are options in general. A few
packages with clear upstream LTS policies are updated often (systemd, glibc,
the kernel itself, firefox-esr and chromium would be the most popular
examples). If there is no upstream stable release series that matches Debian
stable policies, the usual approach is to do a targeted backport of just the
fixes.

It's a bit unfortunate that the timing lined up like it did, because given the
lack of rustc LTS, usually there are no point releases for the version to be
included in Debian stable anyway.

It's up to the stable release managers how big of a delta is acceptable.

I will check how the full diff for 1.85.1 looks like compared to just picking
the rustdoc fix referenced above, and then file a stable update request. AFAIU
either option works for you?

The next Trixie point release is slated for May 16th, so we still have a bit of
time to discuss this with SRM.

Fabian

