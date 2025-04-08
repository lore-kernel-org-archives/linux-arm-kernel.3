Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD234C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe/pDEo2guyYHlVB8bG9VreJJk3m2ca7soHvKl38b0Q=; b=zk1qF+7BYDbyc0PDSW5hmk1qjt
	Spw6JOzB96zLCXB29Y7Ycf0wViXwt1Ouz2HPYvtTesJuINA7tdb/fiNjuvz4GqB0nZ5U+7VvHZHkQ
	dL6mvQ9c1XXk3Yw6+kOw3j62+9HAuEV2FIX8aylwVpwgOKk7Gz6JHAUaxAlXxcXec8QbCX6hegQB4
	xjWVoCWsBmuHVaKVUTVp9J/pbBa8Zg78cnc2HY8Ux7OA1xf3aI9EOQNRleNXp4yYJYKHpWIKGbNSf
	C4E52AZ2F9iGsulIlba9BpPBl0WX/twB6uuBennvWs7rVywUhvK65DJYpBUxG3IwG9XOeHd25VcpD
	BLnLh3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29HY-00000004G0f-1IdT;
	Tue, 08 Apr 2025 13:46:28 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28jw-000000045al-2uik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:11:46 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id DE5841380120;
	Tue,  8 Apr 2025 09:11:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 09:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744117902;
	 x=1744204302; bh=pe/pDEo2guyYHlVB8bG9VreJJk3m2ca7soHvKl38b0Q=; b=
	Z3dIpbMw0Y/mYAqGZZg05ku4GQKx2KTKYEH+2+8z3sSbrcLlfVEtTdhD7ThHC5hr
	n6WvlMqOjQxfQ8vEu27QZ1w8K/8cQXFvB2H9fTBRHzOPKvPOS9o/r45TQMgLBieW
	+0Tmf4+M2RxlY2KMXR6rt64U8DrrP/BPhZIZTkhmeXWVELHlxLLMuikurXX3Oj1Y
	K/6Iun73MgWvnl8Hx6+/PKGOV5EQm/n37JuUCIO1SvsM91mGX5dkSkKQVmYe92+2
	bzQjr5WFwkPnA3kgbw8CqIXbujYBH9ZhJhTwUW38S0rER5B+KWy323CwOetKjKro
	N+y5tQIZmKhTH3hiDyrTtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744117902; x=
	1744204302; bh=pe/pDEo2guyYHlVB8bG9VreJJk3m2ca7soHvKl38b0Q=; b=a
	1r82MnE8x+eDKresOkBHjcK51fL8yVo1GCSCWhEwT2CdvJLFiE6SPd2AvIYieZXa
	1HJn4+7d5qKGumBkabqXEpaCi+OZMP1RavQleKRG4TDt5wI5r1613Ibq4olhHKTh
	GPLx+eruJJmqaO4oe0O3K4lQROsFt5JfzlC8ZAMYstihPzIrC+8RDUI+N9VSI6/e
	x/vfyHPDxGhCw84MEcelcHeG44WV5dWY1d4w8MpSqgP/e3M7IbVd8EEDa2+aKsHn
	zR9j/QJMkE1E5J5pnPXhmLhP3DF5jHGTnMs8AEdobasdGhX+jNN9AaLFe7RNW7Nv
	uBOq+bMDtmje3YHkAM7/g==
X-ME-Sender: <xms:jCD1Z-ExvXpqn2sg3rEx2-Xnn59sSmhsFiJC3LsFX7vbjn4km22C-Q>
    <xme:jCD1Z_V-wJ4DLOAf-imCZH-rbHo0Y04LDw-xzERZwbKCvVVO4yBEAYzgAZ8RF2KWp
    DzVpPKu-QzTbUbMp9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepnhhitg
    holhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopegsrhhgvghrshhtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepuhgsihiijhgrkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthht
    oheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:jCD1Z4KEQgHpqujUSvewbhMIDiixonJu826h9tZNwMUiyZgDMq_WMw>
    <xmx:jCD1Z4GjGnW5AE22FtLVCLpmg_JvW1BHs5ij00Qs-qdTfr1LjDpbxQ>
    <xmx:jCD1Z0VIbaBHoETv9OiwIZLLgkFGTbTNTMXnd426SIg3ym1g_H1v-A>
    <xmx:jCD1Z7Nf-HMFDpE0ig6ondYGRraX5O8AcRjLgNdSlsz3K6nvqCqwDA>
    <xmx:jiD1Z5GqzXRg4-GbhYQiQ6WCz_wTcyXhm5aT6gXidLvryV-wq-Q5lQff>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06B8E2220073; Tue,  8 Apr 2025 09:11:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0f9b5cbc403118ed
Date: Tue, 08 Apr 2025 15:10:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Brian Gerst" <brgerst@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Ingo Molnar" <mingo@redhat.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Marc Zyngier" <maz@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Takashi Iwai" <tiwai@suse.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Uros Bizjak" <ubizjak@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, x86@kernel.org
Message-Id: <f79695b7-f0c0-442f-963d-6ecae246ebf5@app.fastmail.com>
In-Reply-To: <20250408084642.GA1768@willie-the-truck>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
 <20250408084642.GA1768@willie-the-truck>
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_061144_811380_BC3EC10A 
X-CRM114-Status: GOOD (  14.61  )
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

On Tue, Apr 8, 2025, at 10:46, Will Deacon wrote:
> Hi Arnd,
>
> On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
>> the individual feature checks can go away for simplification.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  arch/arm64/Kconfig              | 37 ++-------------------------------
>>  arch/arm64/Makefile             | 21 ++-----------------
>>  arch/arm64/include/asm/rwonce.h |  4 ----
>>  arch/arm64/kvm/Kconfig          |  1 -
>>  arch/arm64/lib/xor-neon.c       |  2 +-
>>  5 files changed, 5 insertions(+), 60 deletions(-)
>
> Since some of these checks are dynamic (i.e. they try passing various
> options to the tools to see if they barf), have you checked that the
> minimum supported version of clang implements them all?

I did some randconfig build testing with clang-13/lld-13, since that
is the oldest supported version, and checked that the options are
all supported. I'm pretty sure it's been there for a long time before
that already.

      Arnd

