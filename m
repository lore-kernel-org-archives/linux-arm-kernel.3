Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TPmynEg4L3W9SLte6TNVmun4smbBMxeh7xOy3SlPw4=; b=LT3hsgMgEv/bhZKaESMsNUbUpH
	MV4tvs8JxavokwXmty6fx6AjZC29Rv+YnGsMwkLUavGAb+GtIKW/9m5a3cIWH78fRRgU3zLD2mPrP
	JoRzlwrphIQ4mBKSRbOuGQy5m68dAGhgZdFmmveuXqOKSOGFeP9bTyhoifj5vTH9D5pwhUYh6DTZH
	6sHVsXMi91mDJJVxLVHFaPTbMnI/UeDqK4oVPT0yBIkAld/nrV8UYIT5eobBT0vtql+ug64pScUGL
	s0lnTIfVUjT2LqNWEpvrBvqBhqm/Fv4l/OwwzvHvqxjknRWPSj9bBnR0376Fg2iKfFTqUGuRE7dAo
	5+Aa78hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgli-0000000B2lM-00ms;
	Thu, 13 Mar 2025 11:30:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgiQ-0000000B2NE-2x3S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15804A46DBB;
	Thu, 13 Mar 2025 11:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7018DC4CEE5;
	Thu, 13 Mar 2025 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741865225;
	bh=H3Sm9drDYVSjHR0XGaZA7OInsYmljvw1bNb0smU/DtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLlLZEPGuZaF+vWTcpzYAFYzGPShEx7NHj0ul2aaX1eN0GGEx+pM8w7xCEVwvrcMh
	 4xP8Yo2MEciS0wVCgHYmkDOqptKjIJnc5OubeOlWxl+0KxkiGhhu9teq1h+nNY30qa
	 PGFR8KOXWKdaDFWv+PB/H5+V8oTywOB2O6t3+acetjNzx5zVJvwvVEkqdxGz95rLXV
	 v9vn7Pthz+whbfRTcL/t103RZxIzl0hNMiEBBCcxjA0XV7gC6AqOrxsrtdGzwHUQWj
	 6vt3EJ6TMV8oWviZ+XfRWCbskhtGTCOLlrOvJwkHPsj984E1qsxvM9wk60n4Wpa22D
	 nV2MlVBPgtQ4g==
Date: Thu, 13 Mar 2025 11:26:59 +0000
From: Will Deacon <will@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, qperret@google.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, shan.gavin@gmail.com
Subject: Re: [PATCH] KVM: arm64: Drop sort_memblock_regions()
Message-ID: <20250313112659.GA7223@willie-the-truck>
References: <20250311043718.91004-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311043718.91004-1-gshan@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_042706_806025_B5794B14 
X-CRM114-Status: GOOD (  10.82  )
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

On Tue, Mar 11, 2025 at 02:37:18PM +1000, Gavin Shan wrote:
> Drop sort_memblock_regions() and avoid sorting the copied memory
> regions to be ascending order on their base addresses, because the
> source memory regions should have been sorted correctly when they
> are added by memblock_add() or its variants.
> 
> This is generally reverting commit a14307f5310c ("KVM: arm64: Sort
> the hypervisor memblocks"). No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  arch/arm64/kvm/pkvm.c | 19 -------------------
>  1 file changed, 19 deletions(-)

It's not especially obvious from the memblock API that the memblocks
are sorted and so for_each_mem_region() will traverse the regions in
order. But it does appear to be true, so I suppose this is fine:

Acked-by: Will Deacon <will@kernel.org>

Will

