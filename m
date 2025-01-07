Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773D6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTche2GWf/tGbfGS8TY0NoTgBlifP+RPy5etXL8dfCw=; b=F05pIkhgELfs9PCyTsnFQjCmUK
	bwaQoaIYdnJdQS1cYMVFwbcD+UlKX+dhpwr1awXpW8jOgWBW4CIIZ5CI3S6bCr9GbBYDuntHdo5HC
	vh/T+enq/U/NP+UZAkn/VZ2ITVhAdUtmsxY1K/FGNibto1hEFVcusWOkfLEfue9F7cZDh/LOHuV7V
	9hXla2JwLlczH318oB0RRBGsDt4bcKkV2v1WqERufYlK/gs7jTbJ81rN2/IwYalfOn6ehbyUryZ6+
	Qh14BKjBTAv1B5q4HmFmwxcR8AXRzX2yD/cGxYbdJf6tdZJ0rhueWbigaxHoKfvJjeL1w+Y/wtUmU
	uvB1fwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8eG-00000004l8u-4BrX;
	Tue, 07 Jan 2025 12:25:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8d3-00000004kwF-2ySk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4DC05C5606;
	Tue,  7 Jan 2025 12:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0701FC4CEE1;
	Tue,  7 Jan 2025 12:24:10 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:24:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Rename pte_mkpresent() as pte_mkvalid()
Message-ID: <Z30c6F5zzEQ7JWYE@arm.com>
References: <20250107023016.829416-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107023016.829416-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_042413_793199_C5894119 
X-CRM114-Status: UNSURE (   8.91  )
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

On Tue, Jan 07, 2025 at 08:00:16AM +0530, Anshuman Khandual wrote:
> pte_present() is no longer synonymous with pte_valid() as it also tests for
> pte_present_invalid() as well. Hence pte_mkpresent() is misleading, because
> all that does is make an entry mapped, via setting PTE_VALID. Hence rename
> the helper as pte_mkvalid() which reflects its functionality appropriately.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

