Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFAAE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFwlQkeBuVVKF7aoJ1D/RHyGTpxwdFnPqmTgswCXsyw=; b=Zeg6qO5vD64opY8wQ/e5srGvX7
	+VRdeGTZ3JqMZG5aEUNstDEZGRaKloh6ByIdKbio3Z2BjMpSLrgOcaN7noODqBcX/f/WRWv5cvKob
	jqN+pdCcHcbRKlLCoxKQKnRZ1IZLwxGvl1bx5nXD0JUuRNEHEnvjUuErlHRnSkvEAE8f0EU5V3z58
	ML3dfDY338mJruTA0GvGIgrFGHMPpymsbinIkb2fDbDbWrslTYIuk87DngpSLFYN6vqhiF/dxwnxK
	lNsjrJnYjwIpf8/BkPXN6wNuz9/yI/9oCIcWBrc3vmTQUNoNANnUAGxTKxEJPQFQH94uvwWcbedFx
	yqPH1Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3bR-0000000BNDh-1y4B;
	Thu, 19 Feb 2026 12:57:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3bO-0000000BNCu-461z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 12:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9EDA40D6D;
	Thu, 19 Feb 2026 12:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68F8C4CEF7;
	Thu, 19 Feb 2026 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771505873;
	bh=jpZTDBxRqP3+2aDtWWPQ+jOqOlSnzz+w78qLLpTsI6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2aEOl0FOR23XvFymiX0dandFEhCqzlrQyKXXOL9dWHJZiyWklKlI1R6nT3P1Q7AR
	 5c/ctxxOad7CgaYuB2Zh/4kGDtLnF5ufXabj7+tX61sqMlIEYMJFkOFMUbOlvlabWh
	 sxuh2wekeblkYTlRqKlkK0sIXB1qO98+sjFwkrT+a37SpHRiIhIOJsImPL/ILJ1+Zz
	 ncB2GM6h9atW+4sMo0OSbpqf3aYu3VE0t+S8hu0p4C7JbAz2U+deumrdCTkw5fqVBh
	 CzSDob5JTmZttbVTjvER4zxuOOc0kxadyztgHpAV45OR/cvduZX529IE2pam+RnjnG
	 SB6ytYoZWfRng==
Date: Thu, 19 Feb 2026 12:57:47 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Michael Williams <Michael.Williams@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aZcIy1Or4c5-i7Tm@willie-the-truck>
References: <20260123-james-spe-relaxation-v1-1-4ccb88fa7bc5@linaro.org>
 <aYD08d42SewAAQCB@willie-the-truck>
 <aebe99ad-1189-4372-83e3-385f33829bd2@linaro.org>
 <aYHXCkFZcVm1L_25@willie-the-truck>
 <e7d53952-59f6-4990-83fb-1182641af29f@linaro.org>
 <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <705acb39-2eef-4e61-aec1-b9503e788299@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_045755_060283_2D440FFB 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Feb 19, 2026 at 12:08:27PM +0000, James Clark wrote:
> I'm back to drag this up again. So I think all of the above discussion
> relies on the ordering given by the indirect read needed for the "might
> ignore a direct write..." part. But it's _might_ ignore a direct write, it's
> possible for an implementation to not do that, so there are two possible
> implementations:
> 
> #1 Where there is an indirect read to give the write ignore outcome
> #2 Where there is no write ignore outcome so it doesn't require an
>    indirect read
> 
> For #2 there's nothing to force the ordering. We're writing to two different
> registers (PMBPTR_EL1 and PMBLIMITR_EL1) and we have to have the
> PMBLIMITR_EL1 write come second for the buffer to be considered configured
> correctly. For example if the old value of PMBPTR_EL1 is higher than the new
> PMBLIMITR_EL1 and the write to PMBLIMITR_EL1 happens first then it's
> misconfigured. That's why we think we need the isb() here.

I thought profiling was disabled in these cases, so why is it
misconfigured?

If it is misconfigured, what can go wrong given that we're either stopped
or pmscr is clear?

Will

