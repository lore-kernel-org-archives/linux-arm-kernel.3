Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06A3D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZdQpQM+Ll/dzAXiRWlRAltB6INpn0ZVXa7OWjOETcs=; b=BYsZf4KzhqHpwjQjfQ5lAkgtP6
	4LVKKrmc3bmDWHkQ+89H0qONeqduZeY+arJ+QPr+dFewezfHIYeZmtgFf2J7yJbyPuWWDjEpyJPtC
	HDkL180tkEVa++EoWfF8R9k94Dl/t7rIOFxpM09SxDvm92bzyNI4FBcCTSr3LpKQ79vxDYeS3zb99
	F3KJlPkSJ82UmwEEQXw/1/ZRpXogn3zUccGzZuFgKcmV4XNB6Em2E0ls0QNVHKLtdYYPMkBcyVGsl
	d0MmCQB5fG4TRArY7R/EqNil37KvvNpqKQH0h2Vyd98aLvip7AqIqNim8D7MGgPo9J3gfk4KdZtQA
	52V3gUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t816Q-0000000EZJx-1agG;
	Mon, 04 Nov 2024 17:42:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80aR-0000000ETVQ-0zT5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE2DA5C4B47;
	Mon,  4 Nov 2024 17:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99354C4CECE;
	Mon,  4 Nov 2024 17:09:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Drop setting PTE_TYPE_PAGE in pte_mkcont()
Date: Mon,  4 Nov 2024 17:09:50 +0000
Message-Id: <173074012624.2444105.5179272721710586496.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241104041617.3804617-1-anshuman.khandual@arm.com>
References: <20241104041617.3804617-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090955_339263_CC2DEBA4 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, 04 Nov 2024 09:46:17 +0530, Anshuman Khandual wrote:
> PTE_TYPE_PAGE bits were being set in pte_mkcont() because PTE_TABLE_BIT was
> being cleared in pte_mkhuge(). But after arch_make_huge_pte() modification,
> which dropped pte_mkhuge() completely, setting back PTE_TYPE_PAGE bits are
> no longer necessary. Hence this changes pte_mkcont() to just set PTE_CONT.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Drop setting PTE_TYPE_PAGE in pte_mkcont()
      https://git.kernel.org/arm64/c/ced841702ee7

-- 
Catalin


