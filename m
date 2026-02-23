Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A3EC1120
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV7zWYF6J6WpT/f5e8g/euFwDkWlgKg+5Yw0o7YIYp0=; b=H+PC2sSBQIJr4lpDbiCvQtXch/
	AZjmgIasB+0QMh3435snSJEsfCCPqwOUANtjfjyhhDWJRh+5kkEaykHc1PtK0ELrA2zp9CIrHxjDc
	8orSjIqrZcaqd0n/sT1/xEOZk4QrG/IRiU5ewHH6dSeZ9q8yhGituVEUsxNLULAtUfXz13gz1b+I9
	rABLs3rQgK6Yzws8SZbf+pAFyX8bfFTO0hfa7Q2lxDnB+Mb2U1T4RjQOlWVBCJ0DlzYQavdSPBxbM
	6qeZpnKf/NAAlE4GPSCZh8RYd+DicEjB64Mc5sB3jrggYGl0Gh6JbggDLxXYioYIiYA3fULDtFXFT
	H/Gk/ZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubm0-00000000wSS-2h3P;
	Mon, 23 Feb 2026 19:39:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vublx-00000000wS3-3ioq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51571416A8;
	Mon, 23 Feb 2026 19:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775CCC116D0;
	Mon, 23 Feb 2026 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771875552;
	bh=IveoHd9zrLRR33yx6epdsO9eF0MPbX7n9btdHNCQv2o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kYk9VjnA/HYov/kkCKDpWeJ6E9SOQNpGx2QdxK4pbCdkshTk91n7/116gQW6D7RAV
	 fdPjG9EteJGvN/svoEfpKzSnG08xo60tT5uIIrPA5bd2Yl8vLD6AIn6I3MU6VgWTOH
	 eF4r4x0wQ8wCT0n7cpOI1oXZkoZXzb9QMwr+pEZLa8zSIZNwQ0RmmZxqSLT8b70NQg
	 E0Q6u7/A5NQgpkkU4PP76fTmwni3zeUWoFesRyz4owHuHGZc3rqNZIC/8u0Yk1IB09
	 2q8R40V9VDKt5GeXJWze5cCRC1Esw8UyXt6LPrGa4o/DSCNmP2FnBRgoWAhsSWh/2s
	 p7YBrEqRX6kEQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 538B9F40068;
	Mon, 23 Feb 2026 14:39:10 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 23 Feb 2026 14:39:10 -0500
X-ME-Sender: <xms:3qycaddGJqMakJznO8KINaxIcIUhszzQB6a7VPRKpqEBr9Wq2SVbmA>
    <xme:3qycaWAntHYIagFkdClUg8BW0W1z3wtjIFYiCac3xEkBhz5EKsTCNTVzZelSmA7ys
    6L7IN00Pd3__HCp6x1l3AqaBruiXTS4XLMRdI23SP-JvEYZzGe--j8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejhfetveehvefhteekgeelffdtgffgvddtkeeguddvvdduuddvieetjeff
    veefjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    feekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhitghkrd
    guvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehn
    phhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrd
    guvgdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgt
    phhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehjrghmvghsrd
    gsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhm
X-ME-Proxy: <xmx:3qycaTVDR64kR1jkDUKhlJw7ttsh1mfDYJPnYtybFwWmz_VWFQ9lbQ>
    <xmx:3qycaXSJmLqfdupxfVLz3XiAmF9afvvlTV3fA_mxt1V0uAVBbcEIRw>
    <xmx:3qycaTBcnIfDJonOBxIi3NLUy9hBMhQw1lYTTav-8RplZAABxoW3Cg>
    <xmx:3qycaekuqMGz8NKZr28U5CNsbCrrFj3msxkNFLOxvdt8BpW0DP7QYA>
    <xmx:3qycabmUs8as38t_yBivTwckVLq6-HlT36EIVzSmr1DhxHas2Lam8lk->
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 257E8700065; Mon, 23 Feb 2026 14:39:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AcM5pYIp-jco
Date: Mon, 23 Feb 2026 20:38:47 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Kees Cook" <kees@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <9ba5bb34-2356-4c10-a3d3-f122abe1073b@app.fastmail.com>
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_113913_995113_9CA7F169 
X-CRM114-Status: GOOD (  18.48  )
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



On Mon, 23 Feb 2026, at 20:10, Nathan Chancellor wrote:
> Hi all,
>
> The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions") in 6.19 to gain access to a Microsoft
> (originally Plan 9) extension around including a tagged structure/union
> anonymously in an other structure/union. Since then, Clang 23.0.0
> (current main) has added a flag to enable only that extension, rather
> than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
> narrower compiler option would have avoided the build error fixed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). While these errors are not expected to be common,
> using the narrower option when available has no drawbacks because the
> kernel only cares about this extension in '-fms-extensions', no others.
> While this could result in build errors for folks using
> '-fms-anonymous-structs' if a developer uses another extension in
> '-fms-extensions' (either intentionally or unintentionally), flagging
> these uses for further scrutiny seems worthwhile.
>
> This series converts the build system to use that flag when it is
> available. The first patch consolidates all of the C dialect flags into
> a single variable to make future updates to the dialect flags less
> painful, as updating the logic in every place that uses their custom
> built C flags is getting cumbersome (and C23 is looming). The second
> patch makes the actual switch.
>
> I would like Nicolas to carry this in the Kbuild tree for 7.1, please
> provide Acks as necessary.
>
> [1]: 
> https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956
>
> ---
> Nathan Chancellor (2):
>       kbuild: Consolidate C dialect options
>       kbuild: Use '-fms-anonymous-structs' if it is available
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

