Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157BBC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzPUzo1ZFuJrmLl1YTl2mvMO+cL2ivWCUtu6gvWyZIg=; b=ePMymoUgWiWb+qvqqS0kTDtKr3
	WyIMNSTd0C3BUHzRBT21pnmjdznFBRCckSnff7wXLDyeF42ictBOBFChqB0usSyaPY1RYg8qEw6ee
	fIdMi12Fh83jLg9/7T/sOI/D37cPVE0DLb7L815Jo70+r+Yz7fGFglwOBA2OIwUBoGfPN4K5YIzgq
	tPGQqBby1sD099ZzeScRvje3IqHnvTaBdPJz6mBfpOuy7ds9ROsilmMMiS2gjWi+vtf3AzG7p1d3v
	2qdo8f/HR9qYi5lJaVanU1tk1SgeuQubkyXOslG6renOQBurhQEt/FMd6c2qVSo+b8Ix1ReuMqva7
	/3SHWzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6H-0000000FIvV-0txH;
	Fri, 27 Jun 2025 16:38:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBG4-0000000F9Jp-0W5s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 657BCA52F96;
	Fri, 27 Jun 2025 15:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1473C4CEF1;
	Fri, 27 Jun 2025 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039095;
	bh=qnP4YOpjMfM8Q3lD1C27ItqgDQYgW8oEOV1YtbKKHEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JR7j7+Lz5p5B1zT2B4zaiZJgjdTFI1XBa2vN12uoFRj5AXWoWm95AKOTzmR8QZsgM
	 PaTq9QPc4iiAVawt8GuaWwoe5ryOzUZrHI/3mElA87wLeu3z+AVCkL12BvtMc6nBn5
	 +xtKdhZLDcGcLRHmzbcoxEW6Hq7wIMSzz7WvOWUa/K0DZJ9ZLbtOtll10KmdwNJgcr
	 9eiuCKTA1eElRqMAeGOcRmMig9cHuMShegJ5xSZBwATidzmx+E4BQF9jHySMUsoZf7
	 DKc8TmO95UIJgiw5HHAS/M1wayqC3f7LmSPMVGDUBxO5be+U8T5s/FFgNXcUQ6ln5v
	 n7MxESe05wrsQ==
Date: Fri, 27 Jun 2025 16:44:50 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 01/13] arm64: debug: clean up single_step_handler logic
Message-ID: <aF68crbeST5WJMap@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-2-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-2-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084456_233685_5AB0D8FD 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 20, 2025 at 10:11:55PM +0100, Ada Couprie Diaz wrote:
> Remove the unnecessary boolean which always checks if the handler was found
> and return early instead.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/kernel/debug-monitors.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

