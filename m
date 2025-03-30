Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB78C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqNImVvEUcMouk=; b=J7zYxT2FukXw/N/szIVBkpypoJ
	5ppPIDAkAicfHhpgmvMVO7CxNKd6PNdeaCfbHkqLSSN17qrE8H6ZxPsBTV7fFPGrzKVkfD+yWXfGY
	6nspEB3pJamBdqWVFVPW6f8tCIKNFmPf79LrB5A6ICmut5SL8Ob6lbVwtM4rRP+IKN6tJ/rDKY262
	Q/KvCDdGwd+oCIFcHW3fvYt5aH8ZjCkt+X5T9ndV5+81NlY5Ag0kUiE4jeHWh4QOywReu0CI4OYrt
	Sx80DYCb8TLk7/lKU/t4i6ZMlcr3wjeRrDShauReqK8yncmTx6MXLDgKaG4XjatjgfmUbE/VK6rrf
	hMRPqzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyoQH-0000000Fzgr-1sOP;
	Sun, 30 Mar 2025 08:53:41 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyoOV-0000000FzA9-4BFJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 08:51:53 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 42846114011B;
	Sun, 30 Mar 2025 04:51:48 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sun, 30 Mar 2025 04:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1743324708; x=1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqN
	ImVvEUcMouk=; b=DJnJtTkx4FtwTGs+MCsrm43hFIkfqw4YaAN/iAf6TgpR0LbC
	o+1eLQsYmMCqFU1GY8C+JR/xcq53SyuUQywH6k3f+PP1xqqCMv9G5aU89r5KCy7E
	esU9ANb6BbU6oi4EDQAzKVSib3TPZUA7xmK25k/ZZsKjfKtCF6MoRwSqR4WaoGe8
	O5OzmT+DbH6fhcpx1/IDh8wahLKCbFydU1W83a2yls0+1pkAqVzGrWsoPFPE5XyJ
	Y/XUuouU25KflRa/Z0Ls1fDdWHp1E198ihXjdvNIjSRzMTLSmO6B00nsLqG++heE
	fHBafwieQnBMeyIkmNAQbORXHzaf3WjS83JPyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743324708; x=
	1743411108; bh=dTqWupLjl7cdoWEq+RC/Hw7jFYiUJzqNImVvEUcMouk=; b=E
	1rLm3UZ5lxXQ2IfWIxo+qXUsKga+l/AU8skmGxFy4QX4/GQMa7NMcwYOkgewM8MM
	Ck2QOI5duUsk+T0zZ73+5fRGnrHWUJpLxQfmTBxKHvLxZ37Bzst3f4/D9Aet4zPK
	vOgJMbpaqGbLUZxVKfusy3ZI1dT+e+3LN1NpU4mmUtL35tL+byFt99Z6c/pV4ZSN
	uUeqpQfeoHqKB5nu19xAOrAniDep7IG7sgoWkpNOmIRjPokDdFYgVM+pSzZrLWEv
	GnTOHRPwGChr0agwfrfbJJy/ClTXEAOTmVJpcLQ8GfyQO2s3598YjeYrrFFrG+l/
	rFhIHueaTk3zZB6vnEPsg==
X-ME-Sender: <xms:IQbpZzmp2KoRE1ljRh7hr-SHuOTQ2BaiFqboNbdzG_3Q0dfu64n51w>
    <xme:IQbpZ21fyxznLm7bF4IiUP9f_YTDHzitZJ2fyRbK0EmkF6a6No9IdIhjWcm98H6T1
    A2xYMiPn647jbr-MX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeiieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkh
    hosehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrnhguihdrsh
    hhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrvhgvvghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhg
X-ME-Proxy: <xmx:IQbpZ5rnL3CUphbOwpi10Itieqzl_zNrcEz9pXzntZMIsAR_r15lcA>
    <xmx:IQbpZ7lkVSFcsxeK4r1GNWXI3qP-UoeTeih7LDrpKSLezZoXZ4wdPg>
    <xmx:IQbpZx3dqW678wETZPJesy7jhheRYZyXtPWyvLhjpFCIv-K2IQuvLA>
    <xmx:IQbpZ6vPnTiLL8VLuFuGSM6VQQv3--z4cZRdI-xpQHE9Lvz7z9kgOg>
    <xmx:JAbpZ7MTq30YCxSfV2OaJOKEeOCcrUXIfDBhrimcqMIKp5boESOGqfpz>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0DB1BA006F; Sun, 30 Mar 2025 04:51:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T14a5dff03e1db70d
Date: Sun, 30 Mar 2025 10:50:53 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Hector Martin" <marcan@marcan.st>
Message-Id: <b647d45f-32e3-4864-8a94-2e0b819fba18@app.fastmail.com>
In-Reply-To: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
 <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_015152_277610_4EF95CB8 
X-CRM114-Status: GOOD (  11.28  )
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

On Sat, Mar 22, 2025, at 14:23, Andy Shevchenko wrote:
> Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
>> Hi Sven,
>> 
>> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
>> > From: Sven Peter <sven@svenpeter.dev>
>> > 
>> > Add the missing register bits to the defines and also switch
>> > those to use the BIT macro which is much more readable than
>> > using hardcoded masks
>> > 
>> > Co-developed-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Hector Martin <marcan@marcan.st>
>> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
>> 
>> Just this patch merged to i2c/i2c-host.
>
> This needs an update as well. The proper header for BIT() et al. is bits.h.
> bitfield.h is for FIELD_*() et al.

Ugh, good catch. Since this commit is already on the way upstream I'll send a fix
(and another one to sort the headers alphabetically while I'm at it anyway).


Thanks,


Sven

