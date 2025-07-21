Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E059C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCzTE0/M04ZrBoYlaj7sUzSG2J5ofpFGwGe0LtgTQEg=; b=UKukNcYa6U2Wyy3Nk2UtgkxxER
	GGTO6qPW6DE6iUhCzO9u6z30+18A6J956ZPvhaAGT0+B1ZFaakhmNteIzW9ybJQH7GXRNXhyzFH4B
	5KS/vMCaJy1nLcWbZzPCYkRmTATtsdkQ0eknHXoAVQeszU3ZU553b88s7WK3dD+iGOZFmDur5rray
	j6H3ddPQ6qYv7wz0SwABF0bdH0Za27xwmAfnjGuMeEmREr7aYKmA+mr7KyW6x39uBapvZ+T1+3SXG
	kgeUKDdTufzB3R5voPpmxstRMZNI5pDaDQ0FEVm18lDHB3oKLvQss/o7mB5blFyakQG0FacFP2byz
	zsKYbpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduTm-00000000Kzr-06YN;
	Mon, 21 Jul 2025 17:39:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsta-000000008OI-3Vuw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:57:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34CDD153B;
	Mon, 21 Jul 2025 08:57:36 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D597F3F66E;
	Mon, 21 Jul 2025 08:57:35 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:57:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
	willy@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
	joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
	kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, hughd@google.com,
	yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v5 7/7] arm64: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <aH5jbAYKoACvspj4@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-8-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718090244.21092-8-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085742_913355_08F4109E 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, Jul 18, 2025 at 02:32:44PM +0530, Dev Jain wrote:
> Override the generic definition of modify_prot_start_ptes() to use
> get_and_clear_full_ptes(). This helper does a TLBI only for the starting
> and ending contpte block of the range, whereas the current implementation
> will call ptep_get_and_clear() for every contpte block, thus doing a
> TLBI on every contpte block. Therefore, we have a performance win.
> 
> The arm64 definition of pte_accessible() allows us to batch in the
> errata specific case:
> 
> #define pte_accessible(mm, pte)	\
> 	(mm_tlb_flush_pending(mm) ? pte_present(pte) : pte_valid(pte))
> 
> All ptes are obviously present in the folio batch, and they are also valid.
> 
> Override the generic definition of modify_prot_commit_ptes() to simply
> use set_ptes() to map the new ptes into the pagetable.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

The arm64 changes look fine to me:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

