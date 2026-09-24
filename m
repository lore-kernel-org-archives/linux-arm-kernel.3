Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B2C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCKNP1/0Rmn/MpEJDFlfeRm+6kBNel4+d5ZQMPI2k9c=; b=zI2T5WgYEyuvB4H+OOQmmXySEI
	stMJgCr0Zpe9Rmw7ZjkWDsiDGwyPV4Tka5FMHAZn5uYw0xcFnl/+Fp8QJ+Nw2qkh7ABKwTq/gE8F+
	OhZe+t2gzohElKrM6v9hPu3TRogH4xsY9NJryMgUdq3tvdYvr46XpaZkoE1jmsxTDYhIt+cdzzkst
	g/OGyckNBfLiZYerNXOZmgLIzZPh4ZiQUUDpnfSDONO2oaPBkKDbuJkChidWUZG9mi7RzK17T59KB
	RRq/Zq5sUJZZAFQCro7QP3Zqw3o989jLvdz+Zfj9oIkGgM3EFWdy2Hp2QHd5scnxyJYRJ0udeHdma
	sBd9QmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gYU-0000000Agn0-0OZn;
	Thu, 24 Sep 2026 10:19:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gYR-0000000AgmL-2N5E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:19:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2FDD1516;
	Thu, 24 Sep 2026 03:19:45 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDBE23F86C;
	Thu, 24 Sep 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790245189; bh=H6qyIMrYe7iz8AdnWWG5WmMCCAcRYN1m8wWC3Jo6rHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESQY3ynobYcSFvJBweaWPCannUZiil7EoNCgE+R4PbydTgpus0xNezG8/nolmGUWL
	 b7NvGrhlB+zRMF4BFEVy1qvd2wIJAcvY7KvGIvFvXie4xaumiZ3tI1pkPMh66ylagf
	 iQDYSyAyJD1vFph1jUsqQtWSfK616sYEggvla6AY=
Date: Thu, 24 Sep 2026 11:19:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 0/2] arm64/mm: Standardize printing for pgtable entries
Message-ID: <arT5QXAXFD6u9tOB@arm.com>
References: <20260916044933.2689426-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916044933.2689426-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_031951_731246_B4A1CA17 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, Sep 16, 2026 at 10:19:31AM +0530, Anshuman Khandual wrote:
> Standardize printing for pgtable entries using recently introduced generic
> helper ptval_bytes_to_hex_str() in core MM which automatically enables 128
> bits entries when added later.
> 
> But first move __check_safe_pte_update() outside <asm/pgtable.h> to avoid
> a cyclic dependency while accessing these afore mentioned core MM helpers
> defined in <linux/pgtable.h>. This replaces the original page table entry
> print standardisation proposal which was part of the D128 series.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-11-anshuman.khandual@arm.com/
> 
> This series applies on v7.3-rc3 but after the following.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

I think this one was queued by Andrew, so I can't take these two patches
via the arm64 tree. I'm fine with Andrew picking them up as long as
there are no serious conflicts (I just started queuing stuff for arm64,
so can't tell for sure).

For this series,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

