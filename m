Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F78E7DF0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w23UccHUTjyhsGlITZ9UvMBSmTVB20TCYOypQr/YWEI=; b=ELKguzP7UnXbmucDlmvrXjuft2
	yQz7uDwfKWzrzNRIFFWKiSfiH6hdUkfeGL7bbNcouHrfChODfGdGCTI7DumpJT5j/nICY36HyAp4R
	apr4E5BtSysyEOJOIKkiAn/s4hDDQr2WuDXeF+nPvu0cRN5GmpOuMOaU8aQN8BawjPvvqI/e+jOuZ
	tR9aQjuxYP9DZI+6XDVXv+QLRoCi/cGbdWXAjwx8Gq8J3Yo8VmflpdcSFKpxeOGC8aIafA1asPptK
	0hsFTPYFSpyude6BoWKi4fMhpd9X18/yq08QSZwHKfaMtvoDZGf1odK/sVhf5ZS4iCc5DKZvkR2bY
	wyYA8wFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzCk-00000005U4N-1vn0;
	Mon, 02 Feb 2026 19:03:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzCi-00000005U4G-2pPi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C472360010;
	Mon,  2 Feb 2026 19:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDDCC116C6;
	Mon,  2 Feb 2026 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770058999;
	bh=lZPsa1GunFyucDAD7fgMY5uSKYZgjqehKmPOKc3dDUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhHaX8iwvXw9OaAzOwaFPJ8T/Zdqy6xTmliOvyQ7VNvBAOYHdWnMhRHzGmXr5mNrC
	 wCazlmo/mUe6jn3ammP8FDXnifPcH/W1FEU7ymTUh+u97ORkQez8OFpmPCR1+5LUwc
	 kjHoUbEgppo9gyjcPg/V2sOlquV15JsqdE4KHQrfZBOQbaq4/pX4O+CuMsEOTNgrPQ
	 oZwM258Rek34NJo8poqSqC/eMXkeRRslb9zZ55/j5pBRbB9CmYVW6hf6Bavf7Hd11w
	 JHag0IJNJMMaR3iE36eKZPTt4zE2Az7kiDvUvsoUsG6BjTdReNH+xWnSFfUeGrUu3e
	 bCULUQaok3waA==
Date: Mon, 2 Feb 2026 19:03:13 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aYD08d42SewAAQCB@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
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

On Fri, Jan 23, 2026 at 04:03:53PM +0000, James Clark wrote:
> The Arm ARM known issues document [1] states that the architecture will
> be relaxed so that the profiling buffer must be correctly configured
> when ProfilingBufferEnabled() && !SPEProfilingStopped() &&
> PMBLIMITR_EL1.FM != DISCARD:
> 
>   R24557
> 
>   While the Profiling Buffer is enabled, profiling is not stopped, and
>   Discard mode is not enabled, all of the following must be true:
> 
>   * The current write pointer must be at least one sample record below
>     the write limit pointer.
> 
> The same relaxation also says that writes may be completely ignored:
> 
>   When the Profiling Buffer is enabled, profiling is not stopped, and
>   Discard mode is not enabled, the PE might ignore a direct write to any
>   of the following Profiling Buffer registers, other than a direct write
>   to PMBLIMITR_EL1 that clears PMBLIMITR_EL1.E from 1 to 0:
> 
>   * The current write pointer, PMBPTR_EL1.
>   * The Limit pointer, PMBLIMITR_EL1.
>   * PMBSR_EL1.

Thinking about this some more, does that mean that the direct write to
PMBPTR_EL1 performs an indirect read of PMBLIMITR_EL1 so that it can
determine the write-ignore semantics? If so, doesn't that mean that
we'll get order against a subsequent direct write of PMBLIMITR_EL1
without an ISB thanks to table "D24-1 Synchronization requirements"
which says that an indirect read followed by a direct write doesn't
require synchronisation?

There's also a sentence above the table stating:

"Direct writes to System registers are not allowed to affect any
 instructions appearing in program order before the direct write."

so after all that, I'm not really sure why the ISB is required.

Will

