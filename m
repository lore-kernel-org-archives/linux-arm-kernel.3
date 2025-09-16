Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E401BCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrK6H5TeIHD81mFHQs75Jltr0eszG6u3DdurAUYQRw8=; b=oelk7htHPlpxsPJ+RCA30QmIUz
	T+814TNJIUxrkvUoPEu1rwyLCtIxeKujl+T1vNGeKdcCE9hR3lsZ91eS22/l9wSrYYpdN1/raW4Ct
	Psbs8GOBvXxuy07kCIOZlaf6ORjJO9OnS9T4gc08LhnwHQUZ7gvzYOyE8KaO2iZB4NxzEOu4yJ2J2
	5FgBrsCGWuVOQBDmeU+ec5SK+6NHEWsw4AH8Dqn2TBS9kbPQla7JEMpjrniKeJZGd6URAeWxA8M3T
	XFznrbqolZvZA2CPUR5/liPLrCAHkIzyLe5Zn04cdV6KF7kT/9QXF79UxXH+MNZAcIkcnd/LQ5SGb
	D93XudaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd9i-00000009C4b-0xTZ;
	Tue, 16 Sep 2025 21:24:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyd9g-00000009C3e-0YJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE09A41928;
	Tue, 16 Sep 2025 21:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7D9C4CEEB;
	Tue, 16 Sep 2025 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758057842;
	bh=Bsn4ypPMfuiV5NKNpmlXvY24AALUkCPIKhmhGYho/EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qyml6Vna2GlmWkaHpV2CzqTk/TiBPjZFisqocFlAqeSVjcfs9QIL2KzoA2KrY5pth
	 b7MhxxY7U5YhZNnxStCjrINja9Rv8OsCLHAjxZEYv5tOw0bmp30+g9oKjw02QZIG+6
	 mkHMJpbEAVYH3laODVT6tYnMxROLMQDMQ252ByfrlVf/HnMeJqzvTO9vXw7TDhY9bn
	 rQo5KY91IqevgCelioj87QElpShoX32TVqKGe5FU68bOYlLZm/o2FzLy19YpqJWfaW
	 OXGbe76phmRsRCy/t3kTfprp4UeQQd6ea5WaxuMFsTEZ2SdWulXiPZH852bB7Mj7KU
	 Yu5AuBqGksktg==
Date: Tue, 16 Sep 2025 22:23:54 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
	catalin.marinas@arm.com, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v7 1/2] kasan/hw-tags: introduce kasan.write_only option
Message-ID: <aMnVarvAvQuJCWXy@willie-the-truck>
References: <20250903150020.1131840-1-yeoreum.yun@arm.com>
 <20250903150020.1131840-2-yeoreum.yun@arm.com>
 <aMm69C3IGuDHF248@willie-the-truck>
 <aMnGUr9zeutyPpAg@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMnGUr9zeutyPpAg@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_142404_188947_63AC39A8 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Sep 16, 2025 at 09:19:30PM +0100, Yeoreum Yun wrote:
> > On Wed, Sep 03, 2025 at 04:00:19PM +0100, Yeoreum Yun wrote:
> > > +	switch (kasan_arg_write_only) {
> > > +	case KASAN_ARG_WRITE_ONLY_DEFAULT:
> > > +		/* Default is specified by kasan_flag_write_only definition. */
> > > +		break;
> > > +	case KASAN_ARG_WRITE_ONLY_OFF:
> > > +		kasan_flag_write_only = false;
> > > +		break;
> > > +	case KASAN_ARG_WRITE_ONLY_ON:
> > > +		kasan_flag_write_only = true;
> > > +		break;
> > > +	}
> > > +
> > >  	kasan_init_tags();
> >
> > I'm probably missing something here, but why have 'enum
> > kasan_arg_write_only' at all? What stops you from setting
> > 'kasan_flag_write_only' directly from early_kasan_flag_write_only()?
> >
> > This all looks weirdly over-engineered, as though 'kasan_flag_write_only'
> > is expected to be statically initialised to something other than 'false'.
> 
> For the conherent pattern for other options.
> Since other options manage arg value and internal state separately,
> I just followed former ancestor.

I'm not sure it's the best option to blindly follow the existing code
here. To pick another kasan "mode" at random, 'kasan_flag_vmalloc' is
initialised differently depending on CONFIG_KASAN_VMALLOC and so
allowing for the default value to differ based on the kernel
configuration makes sense.

But that doesn't apply here.

I'd recommend starting simple and just having the 'flag', especially as
you already made a small mistake because of mixing up the 'flag' with
the 'arg'.

Will

