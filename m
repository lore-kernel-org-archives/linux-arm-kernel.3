Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04044C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75nElkeyX/1rftfHH9IMo3FcFB/4yMecwRs8lFAe3OE=; b=psfuYoGPzqJznRxSRsJ53t38Uz
	doORbYPWwCsXAAL/ovBj55msU/j6kKbrMwUKwvko1nkXhBoS5+BA6E3Vfpj3cvp4W5Rxp+rzBLfeZ
	wMFGihjP+1SaLiw79QFRAWG/Hj6uDuh30+M1A76/kV4m2eT9Z44wLMeWq29YXeE938ACS3kWKA/C/
	EdxPzgRW2jed3QNbvL3WJses+5MI1djY8wYEAbYii6OfG1kuLocB82Z+MctQ4sgY46qearrAbrZAY
	6QIzUrUdcClBpDc9BGH8azhuXiTgfKz42PqtEmUdVjmfe1Reb1MSNnYGm7dXS2vKaGa0l+4ehyhud
	wj9p2Asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHCh-0000000AOOS-3ZOh;
	Tue, 21 Jul 2026 20:36:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHCg-0000000AOOF-41oR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:36:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F33A3601D9;
	Tue, 21 Jul 2026 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9AC1F00A3A;
	Tue, 21 Jul 2026 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784666197;
	bh=75nElkeyX/1rftfHH9IMo3FcFB/4yMecwRs8lFAe3OE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XLQwPvZ9xtGdL+DY6bGaWTnkoRGbd9wQqD5w1Arm5TIeVUGypID8HUCBGnz9J8BB0
	 Yo5uCAe6oRTZsXgu4C8V9DsfiA5c8LCvitKVd4cAK1Bd9q5+aNkMoju59xFum2nqUX
	 G4MuLqf+yYanRswvoRSguhUqrQUGE3l3AbfRt5AA=
Date: Tue, 21 Jul 2026 13:36:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Will Deacon <will@kernel.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, kernel-team@android.com, riel@surriel.com,
 vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, apopple@nvidia.com, rcampbell@nvidia.com,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, ak@linux.intel.com, nao.horiguchi@gmail.com,
 mel@csn.ul.ie, j-nomura@ce.jp.nec.com, pfalcato@suse.de, tglx@kernel.org,
 dave.hansen@intel.com, jpoimboe@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
Subject: Re: [PATCH v3 0/6] Fix incorrect access of hugetlb pte entries
Message-Id: <20260721133636.df1a012df895054d3fd34a2e@linux-foundation.org>
In-Reply-To: <178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
References: <20260703114202.365553-1-dev.jain@arm.com>
	<178464737122.1305746.12295190523058911270.b4-ty@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 21 Jul 2026 18:18:38 +0100 Will Deacon <will@kernel.org> wrote:

> On Fri, 03 Jul 2026 11:41:53 +0000, Dev Jain wrote:
> > There are various places which use ptep_get() to get the pte entry
> > corresponding to a hugetlb folio. Some arches (like s390) have special
> > handling to compute the pteval, so they provide huge_ptep_get(). Use this
> > helper consistently.
> > 
> > Additionally, some code paths may provide huge_ptep_get with an unaligned
> > address. This is a problem on arm64 (I checked other arches and it looks
> > fine for them), which is fixed in patch 1. The fix is made to be
> > to huge_ptep_get() - that is wider churn and we can do that later.
> > 
> > [...]
> 
> Applied first patch to arm64 (for-next/fixes), thanks!
> 
> [1/6] arm64: make huge_ptep_get handled unaligned addresses
>       https://git.kernel.org/arm64/c/9175a8c7cfe88
> 
> I'm hoping Andrew can drop this from the mm tree to avoid a duplicate,
> but I didn't hear back yet and I'd like to land the fix.

I can redo Dev's series to omit [1/6].  The patches apply that way, but
there might be build-time or runtime issues running the other patches
without [1/6] present, haven't looked.

Also, review indicates that the changelog requires updating
(https://lore.kernel.org/all/2b9d60a2-8698-46b0-80ae-b8747a66a85b@kernel.org/)
and I believe that Dev plans to do that.

IOW, it would be better to carry this in mm.git with your ack.

Do you plan to upstream this in 7.2-rcX?  If so then I can hang onto
this patch until it appears in mainline.  Or something.

