Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DB7E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsmKBVKplqHqzj+4kwJxOm//rkER8jse8Kuh1bXyrIA=; b=Ufy2jVVVGwfld4B2aKC7RLOvpR
	EZGFAhIDuvB6s7o6X3lAYrkQXv+YEBC/v9jNctAH5DAhR6PYvsDDxbbrEeg4dS5ivUvBgc2jDPMIm
	kbuHFprdGNHaoRNBehmZz6WTcy8LwZHcD+1eIWPpggrOlzxSE0rsrMcoBX5aOiOPvnjwpdnRrBsmg
	jVz0b3bJxWruCFfE2IcZp37IggPbzU0D/32N3/i/arAnVEkgygovAzQXJ1g0fGnvZpkxk5aEHlir2
	+BhnYyYd5xJjrMNdlsxVLK09o0VHTjPWLvgbEK4NYl4KRUiTui11B/pfNKQz/wJn3b/9l7cHA3YTv
	5Yf6TUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe3D-000000059LU-2em6;
	Fri, 20 Dec 2024 14:32:23 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe20-0000000598U-0Eti
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:31:13 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2341725401DE;
	Fri, 20 Dec 2024 09:31:04 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 09:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734705063;
	 x=1734791463; bh=gsmKBVKplqHqzj+4kwJxOm//rkER8jse8Kuh1bXyrIA=; b=
	Wz/KG6IZ/dI71kGCo09p2O1Y24JF9NKrY6IZXMuv4krvKjUZPAxvEirTZ72N9xpn
	hD+my3AjjxAWmVooMkf4EgMj06pToN3Cbhhzy8rgJ+zQmabEkneYFpZ8vGkoWnYc
	E/GUaDG3UFRXa3Eq79aWbsutbagylNeGLKpkKJjmjgJJOnxAFGUGZ1CAyAGrCtlF
	xt7wCh1x7bIgyoMtRUWuinLGiUtEWOLPEL2C1oKoFqiehueGE5RtUTxed2UYLm3t
	pzD+0V3mBK/PwN7as8kM9zOzz52pgeXa5opCfp3Dv8pk8k4IKlCajuaTbrSnh1QS
	tAb1Xk8CMKBGfIjA8FVuLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734705063; x=
	1734791463; bh=gsmKBVKplqHqzj+4kwJxOm//rkER8jse8Kuh1bXyrIA=; b=T
	N2RLaN8UW65kC6uLcHIcUsQ8edXE98oo6VLjZGZvq2ztrTINd2MXbWLsFKJ03Ywe
	lXlz30Cr901fghAQx9FMYxqh+BVEo4Ci3umNWR5pxr7mcIIDtEZniUzjy6aepREV
	2g54SkEJDk44UDMUrvumfLHKyLrwxkQJcGTz7HZYJxkoXxtD73xffW6YcVDl+kJn
	uEZNOiD1xf4Q0RRLpSZe5/M7mBDFjAleaLSqSdhS7u3puXs2ue147jU6Hi4e0b4b
	nZCvWr1PRtnPqt5/qMZHnQI0S8YVweVGJ8qE+a+4HfVQH7oVzb9oPdWZaonI54Ql
	cxgzcEGpZE5sGcMinCiYA==
X-ME-Sender: <xms:p39lZ8mo3PsK3YNh5WKeqXVdKQyEBt9aNJMzXdlVjVzgjM568eY0Xg>
    <xme:p39lZ72P2quhogQAeD6QhPyYjEoZC5Dt23Oumi9aPle8x_sKKT8_rL7iNux7W3amm
    VSWdkkJqyri5tyK0UE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvihgurdhlrghighhhthesrg
    gtuhhlrggsrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdp
    rhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhope
    hlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprhhoshhtvggu
    thesghhoohgumhhishdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:p39lZ6pZz-jbm-zrPd2_lqP7FnRcWOg67GEhfGqd7JoggTGyUT5Lzw>
    <xmx:p39lZ4lVc8S9iVK5hzndfyADZrT04huYOzDKUQdD_I9hBYdbu0tABg>
    <xmx:p39lZ61FhCimReulOeJK1gtUih8Tc0B8EehCyND-Db5owo_OHOt2uw>
    <xmx:p39lZ_u0TdkybIK3P4iwheL4_yk1zVXgDOp7mT7Mm1DosA4fcxdmWQ>
    <xmx:p39lZzEP388RN8j-nfBgyUp16FUCv7pFWfjgbd8Zn4xSE4iDZVm7YBMV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 063E02220072; Fri, 20 Dec 2024 09:31:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 15:30:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "David Laight" <David.Laight@aculab.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Clark Williams" <clrkwllms@kernel.org>,
 "Jason Baron" <jbaron@akamai.com>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Steven Rostedt" <rostedt@goodmis.org>
Message-Id: <4d8ee82a-b767-4c3f-9735-2a1e0f6bbc8b@app.fastmail.com>
In-Reply-To: <CACRpkdYihj15SRp5t_8Aq4i4jtgP1-VLOSbbKG+ozLgiAuLgmQ@mail.gmail.com>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-4-arnd@kernel.org>
 <d54e11cf3f4d4216b5cecf29b761cd45@AcuMS.aculab.com>
 <CACRpkdYihj15SRp5t_8Aq4i4jtgP1-VLOSbbKG+ozLgiAuLgmQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: drop CONFIG_HIGHPTE support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063108_659082_FB0D5615 
X-CRM114-Status: GOOD (  21.80  )
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

On Fri, Dec 20, 2024, at 14:10, Linus Walleij wrote:
> On Sat, Dec 14, 2024 at 7:41=E2=80=AFPM David Laight <David.Laight@acu=
lab.com> wrote:
>
>> From: Arnd Bergmann
>> > Sent: 10 December 2024 16:06
>> ...
>> > Since Arm is the last architecture remaining that uses this, and al=
most
>> > no 32-bit machines support more than 4GB of RAM, the cost of contin=
uing
>> > to maintain HIGHPTE seems unjustified, so remove it here to allow
>> > simplifying the generic page table handling.
>>
>> 'Picking at nits' 'highmem' support was needed for systems with 4GB o=
f RAM
>> in order to use more than 3GB or 3.5GB (depending on the bios) because
>> of the physical addresses that are reserved for PCI (and other MMIO).

What you mean here is CONFIG_HIGHMEM64G on x86, not CONFIG_HIGHMEM
or CONFIG_HIGHPTE.

> Wow I didn't know that, there are so many reasons why highmem is used
> by different architectures.
>
> On ARM it was originally added for a certain Marvell system with
> a mere 2GB of RAM:
> commit 053a96ca11a9785a7e63fc89eed4514a6446ec58
>
> The reason was that since the virtual address space is just 4GB and
> we have reserved virtual kernel memory from (typically) 0xc0000000
> only ~1GB can be linearly accessed by the kernel (actually less than
> that).
>
> This wasn't a problem since no ARM system was using more than
> 1GB until Nico ran into it.
>
> So the ARM "high memory" is something to do with virtual memory
> size rather than physical memory reservations as in the x86 case.

HIGHMEM works the exact same way on the major 32-bit architectures
(x86, arm, powerpc): With the default TASK_SIZE and PAGE_OFFSET
of set to 3GB (0xc0000000) you have 1GB left that is use for
the linear lowmem and the vmalloc area,  leaving between 786MB
and 900MB for lowmem, unless you shrink TASK_SIZE (CONFIG_VMSPLIT_*).

The most common systems (Intel Pentium M, PowerPC 74xx, Arm
Cortex-A9) have a 4GB address limit and have to fit both RAM and
MMIO or PCI into that, which is where the 3GB (Pentium M) through
3.9GB (i.MX6, Calxeda Highbank) total-RAM limit comes from.

The 4GB physical address limit is broken by CONFIG_PHYS_ADDR_T_64BIT
on some x86 server chipsets (Serverworks GC, HP F8, IBM Summit,
Intel 450GX, ...), Arm Cortex-A15 and PowerPC e500/e600 cores,
which gets you to the point where you fill up all your lowmem
before using all of highmem.

HIGHPTE was added when x86 servers to to 32GB, at which point
the lowmem is mostly filled with page tables for typical
workloads.

Other architectures (mips, sparc, arc, ...) have some but not
all of the above, HIGHPTE was only ever a thing on x86,
arm and frv.

     Arnd

