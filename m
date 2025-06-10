Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D840C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E+KNU5fnCqGXAJbtAorgU4zErX6dPUNipRqfZoHALk=; b=VLlnGcE+B4Is4BAt47rY8yo4p8
	piyy/jWlWTuYJ9E+wxzIjxi/wCodTo4/o5xYVkdZfdPDi+h4HSZrVU+F+u5gXnMkz4YMx2Hs+z+6m
	5ouUFTbf5EoFSGWGaaik7JUN8lvS4jyfWwiTMhexuWiD1pwqahO1Sxxu9s1JK/QpF+1wi+1ij2lIk
	Sx3iha0CTUP8XUysh0QdH+64kO1VexzuojbGK/AOhH3G71rwYjabTMuzv6tQAJeLErulu0haZ/3rm
	S81C9HygNas5scaNMmQPHPndfpdYAkV4XWDFsES5Y2MdCj3yVN9Su4o128VyVcWqSMDijD5dqlGGx
	zwJ3jWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Hm-000000080R6-1RWM;
	Tue, 10 Jun 2025 20:09:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1z6-00000007Urh-3z3e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 327EAA5149C;
	Tue, 10 Jun 2025 16:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD72C4CEED;
	Tue, 10 Jun 2025 16:37:57 +0000 (UTC)
Date: Tue, 10 Jun 2025 17:37:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, david@redhat.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, mark.rutland@arm.com,
	yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false
 warning
Message-ID: <aEhfY2D-njOEBFst@arm.com>
References: <20250527082633.61073-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082633.61073-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_093801_052450_B405A066 
X-CRM114-Status: UNSURE (   9.68  )
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

On Tue, May 27, 2025 at 01:56:33PM +0530, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller
> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
> a pmd_present() check in pud_free_pmd_page().
> 
> This problem was found by code inspection.
> 
> Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
> Cc: <stable@vger.kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

