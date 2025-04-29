Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FED8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgHYrCuAYBh/+wT9qkxJRBGRGWlq5vDOI3F8EXCgLIs=; b=18/ie+2fXE5i6B9yb1JnQIWGdP
	+o4Fj12FkN5WvqTJ6CvsScDbKjH6KtJhkB8iUTBGAVXTTRK//efh6i+44+LjMA8gpwyEiQSBGjOy0
	gNwUyPcmFqV7lIFiPRpfEspCjf63sYiNJ0lwCodVOUegHZzwI77GL6JZ9hEgyw9sUWnrK6QfJ4rJy
	NHTVx11QMF2qAnC/Noi5ARMMUxzZlXzpRV05KCvOfNNOgx2BL4+QvQyJaxiLStSqDxW3RAJcwZfhb
	WoKbkL1z5Y7zurO6wX47dSAiX7ohmblajjCoQWTDRXOG7YKbtGkLty/vaJ9ftbfxxmaSb4woji6qc
	3FinXtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mws-0000000A8ov-3MmM;
	Tue, 29 Apr 2025 15:32:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mcX-0000000A4S9-40a1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD3DD43A68;
	Tue, 29 Apr 2025 15:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C9CC4CEE3;
	Tue, 29 Apr 2025 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939500;
	bh=Pw85bvKPW6geuN8xPdqHYexwbeo0OkIKHWasRYgOIos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YyyFw6Fsm6++9CK1frNzVIQeOEQqqQqGbMpdcVzy3ZiWvSj93T5zhUQuNGaP2Unbq
	 Kyr3lY0lukc+qc2jlOuXRMp/e1XiVAoFVU3oVJssFGnFm6o4SgGbiBMftUAvEx7fUP
	 aEs+xutn42NvvkhDR6bI/GcvAnwBCOm7aXE+XleRacxH+hV3eg1AFCaza4Fl/VWe0q
	 twwTd67Li1d5nS1YL57uUJleMrBKtRDp6v4jkJNP8/diLI4NLQutyH2r/Bd1Gq6spQ
	 8GbklanWVi/bdStemi061oC8CSPyXGWNiT1rE57eEHc8gwBInWcQ/uEvsUrh6ZFpbZ
	 o6jLQ7+fmG4JA==
Date: Tue, 29 Apr 2025 16:11:36 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Implement pte_po_index() for permission
 overlay index
Message-ID: <20250429151134.GB26272@willie-the-truck>
References: <20250415054442.2287891-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415054442.2287891-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_081142_016613_2C5CDB3A 
X-CRM114-Status: GOOD (  13.14  )
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

On Tue, Apr 15, 2025 at 11:14:42AM +0530, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
> the permission overlay index from the pte. However, FIELD_GET() doesn't
> work for 128 bit quanitites. Since we are about to add support for D128
> pgtables, let's create a specific helper, pte_po_index() which can do
> the required mask and shift regardless of the data type width.

You say:

"we are about to add support for D128 pgtables"

but all I've seen so far are piecemeal patches like this and it's hard
to know what to do with them, to be honest. Somebody could reasonably
turn up next week and clean this up to use FIELD_GET() again.

Grepping around, I also see that the KVM page-table code uses the FIELD_*
macros on page-table entries, so perhaps we're better off adding support
for 128-bit types to those instead of trying to avoid them?

Will

