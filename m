Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqsMIXwOsJeGB08gVWdph9sZwEx6lDZKvMOT2i0sdL0=; b=4OvER8qYxCmrv8NDoPbAv982+P
	D+8LfR2GMUR7HhHiQkCJnHf8X+9Lh5/hJwBVXW/j8ZopOpIRTMBXb4yZA3WjPXvTagkSROqiVpJvQ
	bxsdLplJu13x7kOawhGkgctIgbs9oiM6Bc91nhcBxgcXIG1FUUug/xuzCRbeR40+4fQtx2D4WXmY8
	z8sMdZHAeaPuDr6Vib/AxfSq7hqsUHnHzRQvjNU7T/rsAxMuO1XVvc9U8AeHk4cn2jCNfa8NxuO81
	LAbWKVyCy0mBk7bQ1hxTJ/msV5kgt/uyfhetMxSABw446sQNNFfLrZjvEQtHsVzBydSeks/tgrhZ7
	BDSvkXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDLO-0000000HKIH-1wwj;
	Thu, 18 Sep 2025 12:02:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDLM-0000000HKHJ-2pe1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AF1644596;
	Thu, 18 Sep 2025 12:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D759C4CEE7;
	Thu, 18 Sep 2025 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196952;
	bh=bVeWEJiNP54v9HHCnkHFZfXnvx/rOcUNSBvMjkgyhS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHdXLWTWe81Hr7D8UJ9M7UtdDmsICuUafn2rMYUdF1XX2O1yxvz5e5XyKC/vf8zbM
	 yS+ZDjw1BtgLZJIJXD+e72eMQRISDM5jfWfRakC0NEM8krBbcPMghbkaLfrIxlc+c4
	 MI2BrA3SjJfAyj7CjYvDpubznZn+dwvziJyckuVsXDS3/xp8z51+kWA1PAzk6ySS2+
	 lzDWNr2jCFkrGSxsKuNRRPlDp7UX6LPhzGg9DAMs/zU7GMMVKDkvNjmWkOemRQLAJl
	 /9lVJf/0ki5FYhPdYx270ogPF8/+Zj7lnnYfe9XodLrQTEWCI5MBbUjNzguU9ReVgj
	 etxcHmehnhnWg==
Date: Thu, 18 Sep 2025 13:02:26 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64/ptdump: Add cmdline 'early_ptdump'
Message-ID: <aMv00p44PyZZv7cH@willie-the-truck>
References: <20250910094623.2356282-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910094623.2356282-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050232_731022_C71D7F17 
X-CRM114-Status: GOOD (  15.26  )
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

On Wed, Sep 10, 2025 at 03:16:20PM +0530, Anshuman Khandual wrote:
> Enable early kernel page table dump for debug purpose when required through
> a new kernel command line option 'early_ptdump'. But first this reorganizes
> ptdump_init() separating out the debugfs creation, so that it can be called
> early on in setup_arch(). This also adds kernel dmesg console print support
> for existing pt_dump_seq_[printf|puts]() helpers.
> 
> This series applies on v6.17-rc5
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-efi@vger.kernel.org

I'm really not convinced this is particularly useful and I've certainly
never felt the need to have something like it. If you're debugging really
early page-table issues, why you want to rely on all the ptdump
infrastructure to get logs out?

On the other hand, if people do find this useful, then I think it should
be implemented in the core code rather than done behind its back in the
arch code.

Will

