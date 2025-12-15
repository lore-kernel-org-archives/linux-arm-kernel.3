Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B646BD5B862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNrk+UI4IkMp50i07CJaj6LbEGpa1Mp51JO7XcHRu1w=; b=E4SNLzEIFF7r3plubcvFuF5FJZ
	vlkiF1TBv6FSSjiGoowgs5wxd572fECHOOLO1jZXzGCY8pPSchJ8yMzXc0FGJqbTbDlodn1r92gnZ
	6C4Cqjp+rG170Mf4E7dif62C3L/Fb1pHQaqwkGVnh96o0PNVxtAW4wXmNhy7xi20NTougsWUdtTtS
	HMHO94AFl0Dmys2Wk7ohtTiZ71O/moGncMQbcD5mAg/RDDELw0yIK2pWCjfYbDHKN33kUzZTFAMYr
	VNcTsqa9vEbVWn3ByLvSgq56cPER0BO2lcfL69pw8EvKVIoprsYKIVisgL6I9WUNeGBgJ5E5/FGb2
	prW7lDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD8P-000000047cB-2lm7;
	Mon, 15 Dec 2025 18:17:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD8N-000000047bM-24yB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:17:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85DB4FEC;
	Mon, 15 Dec 2025 10:17:14 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09723F694;
	Mon, 15 Dec 2025 10:17:19 -0800 (PST)
Date: Mon, 15 Dec 2025 18:17:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing>,
	David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH] arm64: mm: Simplify check in arch_kfence_init_pool()
Message-ID: <176582226392.1756467.15532050189041554427.b4-ty@arm.com>
References: <20251119130016.283216-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130016.283216-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_101723_572488_6E84E6CD 
X-CRM114-Status: UNSURE (   9.80  )
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

On Wed, 19 Nov 2025 13:00:16 +0000, Kevin Brodsky wrote:
> TL;DR: checking force_pte_mapping() in arch_kfence_init_pool() is
> sufficient
> 
> Commit ce2b3a50ad92 ("arm64: mm: Don't sleep in
> split_kernel_leaf_mapping() when in atomic context") recently added
> an arm64 implementation of arch_kfence_init_pool() to ensure that
> the KFENCE pool is PTE-mapped. Assuming that the pool was not
> initialised early, block splitting is necessary if the linear
> mapping is not fully PTE-mapped, in other words if
> force_pte_mapping() is false.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Simplify check in arch_kfence_init_pool()
      https://git.kernel.org/arm64/c/b7737c38e7cb

-- 
Catalin

