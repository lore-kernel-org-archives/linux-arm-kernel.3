Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBA9F31E22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgLHoZPSxP+/HSo38JuFwdzO9UuodsjfeQQdHtfgreU=; b=VMcbZzMjCYugy+KHU4eMGmBF7F
	nTybpl2uwLG79IPYfmP4E/zK8tCueSvXVuwDVZr+8DXeFEuy1U2KGdn6lY8nViEnpZHKfLMAvfJLG
	O8ZX7UGQPkQrS6Epe0FodQZlZwEZ6t/Uwm8UpzfGf7+SnTzMaWp9200DhwgErTKr8m2CNXKPLmbkD
	We0FW9hTLKFud0LGMb0tJ/p+D4toxRH4rLya2xaP3AYK6nERRCPZMaun4NzbVsFY4tXqj/jwHxbXP
	UQGVeEk9M7X636ZsTXsrpbEAz8v81UNwoCwN2b47ftnsbCJXR3s1BBJTDuVA53odrwUPyySm/9WHx
	GlM5sd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAq4L-0000000Ae5J-1ZrD;
	Thu, 09 Apr 2026 14:09:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAq4I-0000000Ae4m-3jOf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:09:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67300328E;
	Thu,  9 Apr 2026 07:09:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73AF13F632;
	Thu,  9 Apr 2026 07:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775743750; bh=ipsSLoMfiPqYFIbUKTrfChsu5vns0/lAN8ULtLYM75Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sv1jHw2MnnzhZ95ZAtsy9ohqi0q0sg1raSFQx/D6Sc5yebvU6+mk44j5jcp2D4bp3
	 ATO69PDQQiFKd9MZtDbzDQqM4+w8ktvn2NUL4sT400bYAKEpXXSG0RFrMumBZxBfCs
	 zCd5yijVGGncEZrFYCl3JX5qrICdlR/kARi3old4=
Date: Thu, 9 Apr 2026 15:09:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adezAR6w9yNfILsn@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <1db93bd3-cb47-445b-b8ca-6de6f04b41cc@arm.com>
 <adU9KxLC7yKgmyJy@arm.com>
 <d1ecba64-898f-433b-93d4-7a33b9c3f378@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1ecba64-898f-433b-93d4-7a33b9c3f378@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_070915_100191_A823C128 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, Apr 09, 2026 at 10:38:03AM +0100, Suzuki K Poulose wrote:
> On 07/04/2026 18:21, Catalin Marinas wrote:
> > a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> > introduced force_pte_mapping() but it just copied the logic in the
> > existing can_set_direct_map(). Looking at the linear_map_requires_bbml2
> > assignment, we get (!is_realm_world() && is_realm_world()) and it
> > cancels out, no effect on it but we don't get pte mappings either (even
> > if we don't have BBML2).
> 
> Yep, that's right.
> > 
> > I think we need at least some safety checks:
> > 
> > 1. BBML2_NOABORT support on the boot CPU - continue with the existing
> >     logic (as per Ryan's series)
> > 
> > 2. !system_supports_bbml2_noabort() - split in
> >     linear_map_maybe_split_to_ptes(). This does not currently happen
> >     because linear_map_requires_bbml2 may be false in the absence of
> >     rodata=full. Not sure how to fix this without some variable telling
> >     us how the linear map was mapped. The requires_bbml2 flag doesn't
> > 
> > 3. Panic in arm64_rsi_init() if !BBML2_NOABORT on the boot CPU _and_ we
> >     have block mappings already. People can avoid it with rodata=full
> 
> It looks like this will be a common case :-(
> 
> > 
> > 4. If (3) is a common case, a better alternative is to rewrite the
> >     linear map sometime after arm64_rsi_init() but before we call
> >     split_kernel_leaf_mapping().
> 
> We will explore this route.
> 
> The other option is to move the RSI detection (and the PSCI probe)
> earlier to be able to make better decisions early on. I will play with
> that a bit too.

I thought we could reuse linear_map_split_to_ptes() but this function
assumes that the primary CPU supports BBML2_NOABORT. To do this live,
we'd have to clone the active kernel pgtable hierarchy, switch to it and
then continue with the splitting. kasan_init_shadow() does a bit of this
but not fully as it only cares about the shadow mapping.

Hmm, maybe probing the RSI early is easier ;).

-- 
Catalin

