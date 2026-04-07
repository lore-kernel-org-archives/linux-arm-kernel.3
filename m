Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8611EEDB7F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHDax/vOjKJjBTonTfGRm/kISPuj82J/Kcdwc81cP9E=; b=EDd1H5F6kFGZp/77abMlI/xW8L
	f19WTLceU5jGJpI42xzMUHhgtTygAbBb7osdb4ymIOHs6zTmIpVdy7/eiauDQ4yOVQRp9Po5Ph6wl
	GRJLaVXxuIbz/6/FnIbEbWvEKrVqgT2+EauAlOcSeGxkT+FaRGfUbKZ8ebPSBbPc2m8ohQS6hCtS3
	8shewFOfK1OWCyIHi5YCFvX3tba242FqhFxAKFe4ov++v70vzIiZCV70dgenglEF5/WowdrGCf+uH
	DBC+jpQoBlFPdojx15YYs+O6eipkXs2dKC47gKwjyOTunNUOeLwSmJZXCdmgRSDLXg9c1+IATSCml
	TwF2eObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA42y-00000006L6M-2Ikt;
	Tue, 07 Apr 2026 10:52:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA42x-00000006L5r-02eN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:52:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A0BD175A;
	Tue,  7 Apr 2026 03:52:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 631303F641;
	Tue,  7 Apr 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775559157; bh=1ncnVOsuWYAw3IF70eygWx6t1LxyZ2q+2MYl6USa5l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goTgIKJYCyiF0jjX3GevgPVxT47rpBu2snee3BGmA92MrZOu157NaMc9wiRHl+pbD
	 V1ckcrJt/bqn6L3vwXy5FtANYeLFvbH776nrjcSMNW+xw6C6lnfOktzPfx7lWuXq/q
	 lloWUp2GS5oXGbVTH2omprFCSbY4afyBtZWPW+Hc=
Date: Tue, 7 Apr 2026 11:52:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adTh8d9k3y5ybemL@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com>
 <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_035239_140109_7F7F8AD4 
X-CRM114-Status: GOOD (  45.39  )
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

On Tue, Apr 07, 2026 at 11:13:07AM +0100, Ryan Roberts wrote:
> On 07/04/2026 10:32, Catalin Marinas wrote:
> > On Tue, Apr 07, 2026 at 09:43:42AM +0100, Ryan Roberts wrote:
> >> On 03/04/2026 11:31, Catalin Marinas wrote:
> >>> On Thu, Apr 02, 2026 at 09:43:59PM +0100, Catalin Marinas wrote:
> >>>> Another thing I couldn't get my head around - IIUC is_realm_world()
> >>>> won't return true for map_mem() yet (if in a realm). Can we have realms
> >>>> on hardware that does not support BBML2_NOABORT? We may not have
> >>>> configuration with rodata_full set (it should be complementary to realm
> >>>> support).
> >>>
> >>> With rodata_full==false, can_set_direct_map() returns false initially
> >>> but after arm64_rsi_init() it starts returning true if is_realm_world().
> >>> The side-effect is that map_mem() goes for block mappings and
> >>> linear_map_requires_bbml2 set to false. Later on,
> >>> linear_map_maybe_split_to_ptes() will skip the splitting.
> >>>
> >>> Unless I'm missing something, is_realm_world() calls in
> >>> force_pte_mapping() and can_set_direct_map() are useless. I'd remove
> >>> them and either require BBML2_NOABORT with CCA or get the user to force
> >>> rodata_full when running in realms. Or move arm64_rsi_init() even
> >>> earlier?
> >>
> >> I'd need Suzuki to comment on this. As I said in the other mail, I was treating
> >> this like a pre-existing bug. But I guess linear_map_requires_bbml2 ending up
> >> wrong is a problem here. I'm not sure it's quite as simple as requiring
> >> BBML2_NOABORT with CCA as we still need can_set_direct_map() to return true if
> >> we are in a realm.
> > 
> > can_set_direct_map() == true is not a property of the realm but rather a
> > requirement. 
> 
> Yes indeed. It would be better to call it might_set_direct_map() or something
> like that...

The way it is used means "is allowed to set the direct map". I guess
"may set..." works as well. My reading of "might" is more like in
might_sleep(), more of hint than a permission check.

If you only look at the linear_map_requires_bbml2 setting in map_mem(),
yes, something like might_set_direct_map() makes sense but that's not
how this function is used in the rest of the kernel (to reject the
direct map change if not supported).

> > In the absence of BBML2_NOABORT, I guess the test was added
> > under the assumption that force_pte_mapping() also returns true if
> > is_realm_world(). We might as well add a variable or static label to
> > track whether can_set_direct_map() is possible and avoid tests that
> > duplicate force_pte_mapping().
> 
> I'm not sure I follow. We have linear_map_requires_bbml2 which is inteded to
> track this shape of thing;

As the name implies, linear_map_requires_bbml2 tracks only this -
BBML2_NOABORT is required because the linear map uses large blocks.
Prior to your patches, that's only used as far as
linear_map_maybe_split_to_ptes() and if splitting took place, this
variable is no longer relevant (should be turned to false but since it's
not used, it doesn't matter).

With your patches, its use was extended to runtime and I think it
remains true even if linear_map_maybe_split_to_ptes() changed the block
mappings. Do we need this:

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dcee56bb622a..595d35fdd8c3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -988,6 +988,7 @@ void __init linear_map_maybe_split_to_ptes(void)
 	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort()) {
 		init_idmap_kpti_bbml2_flag();
 		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
+		linear_map_requires_bbml2 = false;
 	}
 }
 

> if we have forced pte mapping then the value of
> can_set_direct_map() is irrelevant - we will never need to split because we are
> already pte-mapped.

can_set_direct_map() is used in other places, so its value is relevant,
e.g. sys_memfd_secret() is rejected if this function returns false.

> But if can_set_direct_map() initially returns false because
> is_realm_world() incorrectly returns false in the early boot environment, then
> linear_map_requires_bbml2 will be set to false, and we will incorrectly
> short-circuit splitting any block mappings in split_kernel_leaf_mapping().
> 
> I think we are agreed on the problem. But I don't understand how tracking
> can_set_direct_map() in a cached variable helps with that.

It's not about the map_mem() decision and linear_map_requires_bbml2
setting but rather its other uses like sys_memfd_secret().

> > This won't solve the is_realm_world() changing polarity during boot but
> > at least we know it won't suddenly make can_set_direct_map() return
> > true when it shouldn't.
> 
> But is_real_world() _should_ make can_set_direct_map() return true, shouldn't
> it?

Yes but not directly. If is_realm_world() is true, we either have
(linear_map_requires_bbml2 && system_supports_bbml2_noabort()) or
linear_map_requires_bbml2 is false and we have pte mappings. Adding
is_realm_world() to can_set_direct_map() does not imply any of these.
It's just a hope that something before actually ensured the conditions
are true.

It might be better if we rename the current function to
might_set_direct_map() and introduce a new can_set_direct_map() that
actually tells the truth if all the conditions are met. I suggested a
variable or static label but checking some conditions related to the
actual linear map work as well, just not is_realm_world() directly.

-- 
Catalin

