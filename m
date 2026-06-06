Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10868CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNfkwEURV/025o1JMSHop7cofA++kyQHuGoph8UTpwE=; b=rC+b/rydCS7ea/lnzEw48eZ+nZ
	2eobd1vB9ceBYHUaxi+XXtMtwnJp1I3IX7uMmHwyPXy6m9rwa3yE87e6EuoIilljg6xirul/8LWtn
	DS6lbxG8eOKY3WgYhNlPHZmDREOIV8RjEQJZRvDsTyqabC2xRq2lV3vmG+CDaqSjJ+BOpSl0LhVoS
	vWSlw1LClyc6nwgfvq0/lajwts8bfUk9ahC/au3vUQrNmvT6If6rVElQ7OlnjeY3+6LwS4Ya0lNed
	uUXL4fYQ6/vjjyPRE68mvH65VX0JVobPD5WbB56z3OwHyybbYbowNFLqTVq3B+Mp0i04E6UjMwRwU
	QVSui33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVtXW-00000001hoA-39Vo;
	Sat, 06 Jun 2026 16:06:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVtXS-00000001hnj-07Wi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 16:06:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE08C4E42;
	Sat,  6 Jun 2026 09:06:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A11B3F632;
	Sat,  6 Jun 2026 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780761976; bh=snvrP3iXAE7+rPVGPdv2I0d1O8un1BOK8oUMCKBNj7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fioo/WXR+6E2VeHXtpMTCyYZU27JnoxYA6CB0uRghrHJ5aZZyaaIcZRxJ0aH7JFsW
	 xngkbzIzYdlUW15WY/Z2u7zCjIdmVIrsHgk/6sOUrC+EbqbHreg/CDeoNlbonXt/pY
	 t9S0fleMOnVpzuZZbKKbyRo+Fo9udRji81CSAdsM=
Date: Sat, 6 Jun 2026 17:06:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tejun Heo <tj@kernel.org>
Cc: bot+bpf-ci@kernel.org, void@manifault.com, arighi@nvidia.com,
	changwoo@igalia.com, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@linux.dev, memxor@gmail.com,
	peterz@infradead.org, will@kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, david@kernel.org, rppt@kernel.org,
	emil@etsalapatis.com, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next] bpf: Replace scratch PTE atomically when
 allocating arena pages
Message-ID: <aiRFcz78QTZdIHHB@arm.com>
References: <20260601183728.1800490-1-tj@kernel.org>
 <f45f02410d23c99d14f3577da9b27a327816b5a0904bdeefc8e229eac760d1cf@mail.kernel.org>
 <8f133924fbf8d259340f3057e505f663@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f133924fbf8d259340f3057e505f663@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_090623_842550_67154112 
X-CRM114-Status: GOOD (  12.52  )
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

On Tue, Jun 02, 2026 at 12:09:11PM -1000, Tejun Heo wrote:
> On Mon, Jun 01, 2026 at 08:15:34PM +0000, bot+bpf-ci@kernel.org wrote:
> > After the real page is installed without a flush, can that stale
> > kaddr -> scratch_page translation persist, so that later kernel-side
> > accesses at kaddr reach the shared per-arena scratch page instead of
> > the freshly allocated page?
> 
> It can on x86, but it's harmless: that CPU faulted on an unallocated
> address and got scratch-recovered, so reaching either the scratch or the
> real page is fine. No flush needed.

I think for arm64 it will be slightly different. After making the pte
invalid, we flush the TLBs and subsequent access will be fault. However,
ptep_try_set() is missing __set_pte_complete() with the necessary
barriers. A subsequent access may fault rather than hit the old or the
new page. Something like below, as a fixup for 258df8fce42f ("mm: Add
ptep_try_set() for lockless empty-slot installs"):

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3ce0f2a6cab6..dc8525431273 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1838,7 +1838,11 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
+	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+		return false;
+
+	__set_pte_complete(new_pte);
+	return true;
 }
 #define ptep_try_set ptep_try_set
 

-- 
Catalin

