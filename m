Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF09CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBIVNcif2wkQdg5r0HmparyX7/p4Cy+GpGHPFwxTHl8=; b=yOTN5V1sqqcMqsjm2H7NKnJHTP
	kCZ2Zfr0Dz3PcF5gJ/BiobcGBrVGr4ARLemz+DsUzh1e84yHnWTeF8d5dNcjKW7XsqQqUJZo3CGDW
	EVAqPFDuDwGt9wxZEKCkfka/gwpEbhNFIJC6io0368uxiVnJmP5soUVkrNmciUM2r1VVmMm1Oadzy
	1hjAGqJhL/GMgNPwGlWCjYmLG3PO67efgGRG628If88NxAyaX9J7QDuHhjZws2sQXOjAV6icfAinW
	3B2JmVQwtdJ/CroReZRmN465C3MJCKLZR99e0dgheiIwMmAYu+fDSDY+QlRFH2eZVCmJT9xn1+9nf
	CYonSDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYDy-0000000BtVb-3Cv7;
	Mon, 24 Nov 2025 15:11:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYDv-0000000BtV6-39Aj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B440417B5;
	Mon, 24 Nov 2025 15:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9509AC4CEF1;
	Mon, 24 Nov 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997087;
	bh=B+qDEK+5a4QqhpoYF9b9tb+sSkdccGdDJ6yuZXTMx9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdxLvwev5DLJVRP0ZGuksgjqW6B6aIzNHugXWYQTzc61tdF2EiBTTmPCY1/E0HSVZ
	 E116BGy88AoR9h4ukGJ28hqjob28kwsyAyhfe0gq7FPGKblLTPavBO4V4waT84Z+RP
	 50scLnZ+GV4FjQZfiM+BXSyI/pzxOzRroN/E2MhIC4RlBtsvDYavcVshccYJRvvMgi
	 aZ+opHe30wCe8V0rFkw1kWiTTuxLIttXkr4ZQF0lt61fELx5vKTb0hu0E3oAiRcn/7
	 VcfT8c42ATCF4TLuagAebV0DDf6Xqi/hw143YEGnYEBikj2KIUM4O8f3wMgfMhihOe
	 F26LB7huUkB9w==
Date: Mon, 24 Nov 2025 15:11:22 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, rppt@kernel.org,
	shijie@os.amperecomputing.com, yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
Message-ID: <aSR1mn8jjzty5J9F@willie-the-truck>
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
 <6bc0fac0-3c00-4ecf-948e-5648584ec939@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bc0fac0-3c00-4ecf-948e-5648584ec939@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_071128_952402_47F50EB8 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, Nov 13, 2025 at 11:55:48AM +0000, Ryan Roberts wrote:
> On 12/11/2025 06:27, Dev Jain wrote:
> > The rodata=on security measure requires that any code path which does
> > vmalloc -> set_memory_ro/set_memory_rox must protect the linear map alias
> > too. Therefore, if such a call fails, we must abort set_memory_* and caller
> > must take appropriate action; currently we are suppressing the error, and
> > there is a real chance of such an error arising post commit a166563e7ec3
> > ("arm64: mm: support large block mapping when rodata=full"). Therefore,
> > propagate any error to the caller.
> > 
> > Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> It would be good to get this into v6.18 I guess?

I'm not sure I see the urgency. When the commit message says:

  "there is a real chance of such an error arising post commit a166563e7ec3"

afaict that's either due to -ENOMEM or some hideous issue with the
page-tables (e.g. the -EINVALs in pageattr_pXd_entry() seem completely
unnecessary to me).

Do you think failure is actually likely and recoverable?

Will

