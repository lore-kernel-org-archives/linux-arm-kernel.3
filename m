Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp/G7w1A+B5iB9xypMRwbHjmVP0G4137s4ALIQdYdC8=; b=nbmxp7TL60OaSzudaxYcTz/UP8
	cLrW41CydmFD0SBIv5gC9yWgCtRiVE7vrv/pIuGwOVIUDHNmTU/VUf1Q/28xKM5cpLTJ4Ku7YKubU
	37XkBbfdxaVGXpzytg050KtKHL+AYmsy58Gm/0CxA5RIgrDDZUT8JqH+GwHlW9jYv3r1QKgglSi+W
	o7evUknnEMiLhB7Jj3atWi47pOumQJzFi9b0l6OPYbYSqShJQXrZGWMvGcuI6UxMmfl0/VbJWNh9Z
	7R8JvEGH4cJUKes+L8Yg3QwPRvHMLEpKpxZVL1ghRBZZjwcKHrL11F+EZR0WFgrxntnjScEgWDXpJ
	59c6PDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXKA-00000008rSb-3lIx;
	Wed, 08 Jan 2025 14:46:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXIu-00000008r50-1pCR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E14DA5C4B60;
	Wed,  8 Jan 2025 14:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D40C4CED3;
	Wed,  8 Jan 2025 14:45:02 +0000 (UTC)
Date: Wed, 8 Jan 2025 14:45:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Sangmoon Kim <sangmoon.kim@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ardb@kernel.org
Subject: Re: [PATCH] docs: arm64: update memory layout for vmemmap region
Message-ID: <Z36PbN-s7YCR2HQi@arm.com>
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>
 <20250102065554.1533781-1-sangmoon.kim@samsung.com>
 <20250108135748.GA9367@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108135748.GA9367@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_064504_516014_64C129F5 
X-CRM114-Status: GOOD (  17.59  )
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

On Wed, Jan 08, 2025 at 01:57:48PM +0000, Will Deacon wrote:
> On Thu, Jan 02, 2025 at 03:52:37PM +0900, Sangmoon Kim wrote:
> > Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
> > the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
> > region above vmemmap region") have placed PCI I/O and fixmap region
> > above vmemmap region.
> > 
> > And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
> > page size to dimension region") has moved vmemmap region to higher
> > address.
> > 
> > Update document as the memory layout modified by the previous patches.
> > 
> > Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
> > ---
> >  Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> To be honest with you, this document is pretty stale (it doesn't even
> mention 16k pages) and almost impossible to keep in-sync with the code.
> I'd be inclined to remove these tables; we have ptdump support if people
> really want to see where things are.

I agree. They were somewhat useful in the early days when we didn't have
as many combinations but now they get outdated easily and I'm not sure
anyone still uses them as a reference.

-- 
Catalin

