Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C82C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/VJuHpZmriQDG6Wjb+YX5WSz735IUlOm/KBT5XyhpU=; b=Xgm7ZRDI8XCX+V2U4pbvtUL8tL
	vmIeblNXpOBtLEO3rbbdNc/ra7jKl0jk12dw709t2jouc8GjRh0O138X1t21JfapkosYn6PM6JiOk
	fzzqSGO+W84/xZFnpuH/q26m8Z9fmTbaiHc5I7+6Q6/t+gQ6Mg3TXhY2rjbFMIr9sLqrOovwq72ND
	qqZmK8J9bhlQp2iq/3GCcqyV9fj3E4NYD80lhLK6giUgQxNfh3wVxJdTneXdfYKpkqj8P77Bwbgyc
	QuY+OsTfj2i964xAucmSr8ADY5pF4uKPK3L68Vduof5ENfQyMa/m4PBLBUt5pSRBI88r74WAExUz8
	V5+tRa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEos-000000042YA-322Z;
	Sat, 03 May 2025 15:30:26 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEmv-000000042N1-0rpa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 15:28:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6919B11401D4;
	Sat,  3 May 2025 11:28:23 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Sat, 03 May 2025 11:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746286103;
	 x=1746372503; bh=X/VJuHpZmriQDG6Wjb+YX5WSz735IUlOm/KBT5XyhpU=; b=
	bK+McnfCBVJmyOli2mLWF/kTQ5b9v2WaRPbvTBXLFfehzBOjixrNNBK5/MJaC4Xk
	aI+j150LvTB0vZHNMBVVyxxNsq/SsHrzrsnRKlOXhcfgiriuR+qjSXnXUbsd9JKP
	tTOuoCemW1/bptdqGBspzcQTShiRr0J04LI60f7TCtf/bATwdV5Yw5yCCTIzaTpM
	r5p/gZL6JPaMZTtgwRiGFs/OvcZtHSSoFtgsYkiEw+SiHSdcxTAOkgz9lWOc00F8
	GIZRrhUXYyXGWUWfLws6/5ATMgpxwD1E/bVDjlRNBf2/qi612KGI68u9gGwH7+J7
	2LvholexsTrbhhTQ3296sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746286103; x=
	1746372503; bh=X/VJuHpZmriQDG6Wjb+YX5WSz735IUlOm/KBT5XyhpU=; b=w
	SW01QNBaaW8pM6rwm4ZYtBszzwHM+iUzJwy8w+kJHmYxHM7g5B5DEJCCFHCQ7c+5
	ufU97aME4WypAFLO8aI1EE/3l9/lf1Jta0ft9RuPe7NwWKNMHsGcK1Tr0y0LthCb
	KroXA3s8jVdd/ZGFrXuDZcDAHBPw74SNc9OkDfujX8rtUJju4xEFSRuG4Pq6Joyd
	aRnX/t9Ul/VjapL8mZ4pxxrJay22bhg/d07FjTDYqv63LiYYLdMZeOZ8C8vgxJxM
	lL/yIpEdPzdmvjKSp/xyIeg8QU59ARYDIY1K+wbyHTczwoDVRMHXXV3vjKYegamX
	EuACLas1gP6kVM+Jay9bw==
X-ME-Sender: <xms:FjYWaAChXzHiD9bh78_JYddAsk96lGoQj6YYLDJ80fdq2vXRdc9N3w>
    <xme:FjYWaCipU6QwWF_wvdolw5P0yTHLhR1cRvEychRh54JObdnufqmbkFKzGS8CT20px
    D0Mm2u7-P92fxHFcZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:FjYWaDlO2bkC9T2tPVrBKTnqq5A6DW2cqjvTRu2j1bl2gySp94YjCQ>
    <xmx:FjYWaGzwPC3kPXEbSHyE_MHI6oJ3swhlG9nAeybQkKz7fVtnh6rqtw>
    <xmx:FjYWaFQqx4rBd0DrxxsQs-4J5rydDplz7BUKGX7K6aLPkw1W_crQrA>
    <xmx:FjYWaBYaK2XLRl73r5FvfX9kmPvl305DO6nLLvvLRa2zAN75CIFVfg>
    <xmx:FzYWaNckJLZqYQDkdggNnpC4bfuAPUk3cU30cQ3wKZk4wHGqQaSqXz25>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 92E7D2220073; Sat,  3 May 2025 11:28:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te0d92eb33a48e4f6
Date: Sat, 03 May 2025 17:26:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Rutland" <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, "Mark Brown" <broonie@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Will Deacon" <will@kernel.org>
Message-Id: <5dda6773-7a91-476b-bd0f-73eaa8f95ced@app.fastmail.com>
In-Reply-To: <aBYtk_Azv84QA9C3@J2N7QTR9R3>
References: <20250430173240.4023627-1-mark.rutland@arm.com>
 <bb9783ec-126d-4938-a6f3-dd5930f1c3b6@app.fastmail.com>
 <aBYtk_Azv84QA9C3@J2N7QTR9R3>
Subject: Re: [PATCH] arm64/fpsimd: Avoid warning when sve_to_fpsimd() is unused
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_082826_131397_0B25C16A 
X-CRM114-Status: GOOD (  13.17  )
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

On Sat, May 3, 2025, at 16:52, Mark Rutland wrote:
> On Sat, May 03, 2025 at 04:10:43PM +0200, Arnd Bergmann wrote:
>> On Wed, Apr 30, 2025, at 19:32, Mark Rutland wrote:
>
> Fair, though with W=1 there's an existing issue with sme_free() that no-one has
> complained about:
>
> | [mark@lakrids:~/src/linux]% git clean -qfdx
> | [mark@lakrids:~/src/linux]% usekorg-llvm 19.1.0 make ARCH=arm64 
> LLVM=1 -s defconfig             
> | [mark@lakrids:~/src/linux]% ./scripts/config -d ARM64_SVE             
>              
> | [mark@lakrids:~/src/linux]% usekorg-llvm 19.1.0 make ARCH=arm64 
> LLVM=1 -s W=1 arch/arm64/kernel/fpsimd.o
> | arch/arm64/kernel/fpsimd.c:208:20: warning: unused function 
> 'sme_free' [-Wunused-function]
> |   208 | static inline void sme_free(struct task_struct *t) { }
> |       |                    ^~~~~~~~
> | arch/arm64/kernel/fpsimd.c:676:20: warning: unused function 
> 'sve_to_fpsimd' [-Wunused-function]
> |   676 | static inline void sve_to_fpsimd(struct task_struct *task)
> |       |                    ^~~~~~~~~~~~~
> | 2 warnings generated.
>
> ... so we'd want to do something consistent there (and probably for a
> few related functions).
>
> How important is fixing W=1? I note we have a *tonne* of warnings today;
> so I assume we can punt that to a future cleanup?

There are usually new warnings coming in, while there are developers
chipping away at the existing ones, either doing one warning throughout
the tree, or fixing all warnings in a particular subsystem.

I've spent some time on fixing the -Wunused-const-variable warnings,
and others have done similar patches, so we can hopefully turn that
on by default soon. I haven't looked at the unused inline functions
in a while, so I don't know much there would be to do on this one. 

     Arnd

