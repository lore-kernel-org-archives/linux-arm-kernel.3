Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DDFFED9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1go/Q9Y2kV8d7AE4AdJH2lTJpN0U41+HUpsGP+cP8us=; b=aOoSc0udFKSwud0gg/oU55JD1D
	13WbDwwmq+hI3yOoppwMfYaGzlOVcnlpi/bUO5gZkZvUB8FuCH82T5UYHhV++lh9PXu5s3vkgYzHe
	095mUQTssJn7YOPThhktI1vtNoCi1bQw3lD1xmUPR8od4+4E887GubRncUt4DsHuA+1eOyzXaYdO8
	SKHPH441cH7wxLMadp9IhqlYJ9Iv+Ql7ND7PX4qbQJXq5ufPLX3jlkrXZ4l9UJfLo5QH20r3Kr0dI
	SujqRnlRNXoOdSOWIhUrG28XOuUkf5LVHLWv783ZLSlBmbnRdtTrAy7UmLvoIVAZQJXyJLgT89Eb3
	Msq45Cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vuy-00000006g7h-2wID;
	Tue, 17 Mar 2026 15:01:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vuw-00000006g7L-3Tgf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 169A944332
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 15:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E79C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773759670;
	bh=ydG4GHfqkHkHDuSuLUdy0Q7ztXjPaMqngHmf5z9Ukx4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LJDbHT4UUxji09+X6OoZaKjxoYWlXyItbjBfH/YiX6gZHspOltElxkkyv3i49uQpP
	 BvdLgFO3YcZjEx5CC+G9dK2C/u41QsqHyvzG0CQEOzMukfIZFTaZ9yNdKVfYZE1QCA
	 XymvYymcQSiQTjXCo2kRuWg8Isyf0ptJN9CJPfzY+ShZ6t5Z8e1elX8wW9bQIZ5dRq
	 EpUhTqQ4Uop5zC5qExcr+dkCVtI5NSFnGmELYm/2Q2B3Gn5C9RzyURDWCf/W7Q+RX8
	 WvBpHvkwlGEHC87nw+9pazfroXZmZSwiCqHMSl3HSFBePgYs8K9Fvf5yEcu4xFGw7d
	 A+afukhsS51mQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BE81AF4006F;
	Tue, 17 Mar 2026 11:01:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 11:01:08 -0400
X-ME-Sender: <xms:tGy5aWZEPFPpoiSxAFBHwhk1xf1o-L1CXMhCoMfK9NtasUNpC2cdCQ>
    <xme:tGy5aUOXs_MyDp3_pkHjnomZgBj7mRAHs7wIB-BP3eXmHHIHAOvf2lXgbUyFYBC4q
    AKYPTvRwKEYUTn5ZnbzpKpHBOyQWxir7fZPF5lUu0xJJgqSAtXtxtI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejhfetveehvefhteekgeelffdtgffgvddtkeeguddvvdduuddvieetjeff
    veefjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohephhgvlhhlohesphgvphhpvghrghhrrgihrdighiii
X-ME-Proxy: <xmx:tGy5abC6FH2K5elXiGZB7o35tE7JgpF-Db-V6DNJDBRQKTcwVpHXcQ>
    <xmx:tGy5afWq7XQPlYQwoVB1TqPj8jHKWfju11NcyT58_2-qwZjEg87Crw>
    <xmx:tGy5aRAe5w0SPEKvWf0YGHpEZemB-PuH2usua67YBxBJlwXhJ3DDDg>
    <xmx:tGy5aa96wHW2ykixEOxluRvrEAtZEykFW8MVAqIYAvH3M7U4GBPUnw>
    <xmx:tGy5aQGKbHRQ4smLtnpNXR0R7Hs1ZpndvkPHBZC43235SMD19mNtE5nt>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 96DDF70006A; Tue, 17 Mar 2026 11:01:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ao84xJFSPmL7
Date: Tue, 17 Mar 2026 16:00:48 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Pepper Gray" <hello@peppergray.xyz>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>
Message-Id: <af9c99e2-10f6-41d6-af81-8291578f2b43@app.fastmail.com>
In-Reply-To: <CAHLDejz=-kHt4xXmf3K4A+jj5aj+JD3LJta7SGEOK6G4SxxGdQ@mail.gmail.com>
References: <CAC+fAGbCjQSGbtkbGr5Qb=tPez1i4KZ7TtC0DPHxGbC0wLvBAw@mail.gmail.com>
 <abLGwg1aFyoCosHi@willie-the-truck>
 <4141e534-0d81-45f7-a341-98ae1a6dcd8b@app.fastmail.com>
 <CAHLDejw4XKZ3-dbFFRYVGAZyYkmkzW5cdkvJNVJ9p3ARMUUyjQ@mail.gmail.com>
 <abRB-raKFBZItDQP@willie-the-truck>
 <CAHLDejz=-kHt4xXmf3K4A+jj5aj+JD3LJta7SGEOK6G4SxxGdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/scs: Fix handling of advance_loc4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_080110_933730_BE496826 
X-CRM114-Status: GOOD (  10.45  )
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


On Tue, 17 Mar 2026, at 03:36, Pepper Gray wrote:
> I have created a script that configures, builds and runs a rootfs to 
> reproduce the error:
> https://github.com/peppergrayxyz/arm64-scs
>
> I also attached the kernel, amdgpu module and build log as release.
>

Thanks, that is really helpful. I suppose amdgpu.ko ends up with some huge functions after inlining where the distance between instructions that are relevant in terms of unwind data is large enough to require the 32-bit advance opcode.

I should note, though, that the SCS patching logic is really only useful for distro kernels that might run on a wide range of hardware. In the case of Gentoo, I'd expect the shadow call stack to be either enabled or disabled unconditionally, depending on whether the user wants to rely on pointer authentication (PAC) or SCS (or neither). The dynamic behaviour was added mainly to avoid the overhead of running with PAC and SCS enabled at the same time.





