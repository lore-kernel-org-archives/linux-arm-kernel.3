Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236610F6FD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZYDMra8MoYZEjEdeOlMT6GlZ/T6YvcsPcFSeDCnMVw=; b=iMuvZqvWOJTtJMA58Q0O8XYxtq
	WMMAvSyfy7Pe0RmW0HXOdg10b2tmnR9SEwyj7nzBKWKlu3+JNkNBka9fipp1Oxkhs/BZ8APDtrC3C
	Vxjh8LlPlkaWMbuYShy2Y+/hGWCFNj8DTb16m3dnvSHvL4Ia914AWu0z8AHHK2TtuDn8AmQkHMkVE
	Jf0IBd6isLRSoUbDUNe170dDRyKWsfOljoGCw9Foqh/ITqZd2wnOauMt3PndNOhHTN38L3pPFBFdu
	VgxaV1KKKntg5T6R2PH8jP/AQv0IR2RfWE5KPwRuFBGdcrvZAelzKO9Lm1pYymYSFSoLQocRRgEK6
	o6lC3Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ykP-0000000FlGz-1ATM;
	Wed, 01 Apr 2026 16:48:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ykN-0000000FlGg-3USt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 189E360120
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Apr 2026 16:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854D7C19421;
	Wed,  1 Apr 2026 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062130;
	bh=gQj+QgzcJJQt8oGoQE05yGLbjAMd3D2jR9zdzGyP7VQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WOkCEne4MKb3ffUPUTYBMtcBemO8LVSwA4luETTlhoNlwQd4IP8iCp54clr7Q4KfN
	 kaShlDIhOeNIldAqh8RUK+ZoEgLHnmhQvgvTWRIZeTNtykZC8+KQaIWwcifMesdCDD
	 LLAtCoGqL7HqSSzw1YasXd0kO6YCoU06f1TdMzyfItmNpE18fgMyO04po9nPnM+h2s
	 VeVv5YsMffmx2c4E5MLDADPX5lXjfCfeeJLMEew6v+GxdWTPIdaKXtaB2Fq5FjPVZf
	 pp+mIPsptV68J4UGumhFYMWUf1mEtre8M8jlQQbJDLeqqN0sKkuYeWM3gBeChI+DiK
	 RdQqeFYszwf1A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6E6BFF4006A;
	Wed,  1 Apr 2026 12:48:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 12:48:49 -0400
X-ME-Sender: <xms:cUzNaaFOzwFEV3Zclvi8j3J7RxPbaxlhgxcDhpulXgrjerTov9Fw5Q>
    <xme:cUzNaWL04_vqDWaQnIJctHOjv9bJCJFI9QeVaVbPHor2USwNjUbJhsx1teU06UCHl
    JR_IgBIiGQEH9KaBhaVCi_tFDuO7rAsaXFBMQLgsJgTMTqvsCd70CcK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peguvghmhigrnhhshhesghhmrghilhdrtghomhdprhgtphhtthhopegvsghighhgvghrsh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtg
    hrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cUzNaZMOJKK4YGzwooSGw8QYTQFKqCsAvr6z5KrxmaSDGKUWolZA-Q>
    <xmx:cUzNaXaUjKYZPZXrmb-XePklSx8yuI9UY0XbB5IYEbXYbm-D6GapCw>
    <xmx:cUzNabxN8O-05KqrlF5bsH6sw9gb0GT5qEXuqphVrtUZkju5pYOuuA>
    <xmx:cUzNaaLnpNsxT-sV8oK5YrpVXuAIp_a9pxQOUgHHoujrMufs2amyug>
    <xmx:cUzNadq-vFV0hhkvISmW5Nlt2HO9Ls58wkdZiV7rxFMuUStlUhS0Oh-1>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4DACB700065; Wed,  1 Apr 2026 12:48:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A8AYNq7FA6_V
Date: Wed, 01 Apr 2026 18:48:28 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Demian Shulhan" <demyansh@gmail.com>
Message-Id: <e3f27e82-604c-4744-a2e9-bbf72dbafa44@app.fastmail.com>
In-Reply-To: <20260331224156.GB45047@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-12-ardb@kernel.org> <20260331224156.GB45047@quark>
Subject: Re: [PATCH 5/5] lib/crc: arm: Enable arm64's NEON intrinsics implementation of
 crc64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Wed, 1 Apr 2026, at 00:41, Eric Biggers wrote:
> On Mon, Mar 30, 2026 at 04:46:36PM +0200, Ard Biesheuvel wrote:
>> Enable big-endian support only on GCC - the code generated by Clang is
>> horribly broken.
> [...]
>> +#if defined(CONFIG_ARM) && defined(CONFIG_CC_IS_CLANG)
>> +static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
>> +{
>> +	uint64_t l = vgetq_lane_u64(a, 0);
>> +	uint64_t m = vgetq_lane_u64(b, 0);
>> +	uint64x2_t result;
>> +
>> +	asm("vmull.p64	%q0, %1, %2" : "=w"(result) : "w"(l), "w"(m));
>> +
>> +	return result;
>> +}
>
> Perhaps omit big endian support, and use the inline asm implementation
> of these functions with both gcc and clang?  The more unique
> combinations need to be tested to cover all the code, the higher the
> chance of one being missed in testing.
>

Yeah that should work.

> Also, leaving shared code in lib/crc/arm64/ will be confusing.  How
> about lib/crc/arm-common/, and crc64_nvme_arm64_c => crc64_nvme_neon()?
> Or even just put crc64-neon.c directly in lib/crc/.
>

Yeah the latter seems the most straight-forward.

