Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A711CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsgXH1uF6S66JuefmGrmiVjLJ5hbH9Yj+7AgC0U5bMk=; b=4jK8Rw9+eNBWxS/VXVtsahvvUN
	uvpYy9o3prsgcnOb80YMTgtoo2PSrSF/5vujZZxO2u9CueAG3ybD9B4ufQ6MrWPwKjI++JPGILZjz
	qMMVrtTuepnB1DIGL/eKK4PLhnlwvXyoVuYoSXYlNZaTdGj3XqB7LwhvGD9VB69CmMWea4mn/fYoI
	DJi0tTDeWmcpV2dEfm+3mLuXdMZlUc9qYk14xC1U37JFjqoGz7hQVEcK/cCEBVidxGQb8jRYJZuG5
	8HJjUaPcGowmpJQOKMrK93qYc7XwZRS43NPSD36nplSZiJwilFyPVz7roPnX+SFqBTknXhVZXvLWV
	/+QeK5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYnY-00000002CYH-1Nbv;
	Tue, 02 Sep 2025 21:44:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTp8-00000000wSC-2Is5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF38A6020C;
	Tue,  2 Sep 2025 16:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70636C4CEED;
	Tue,  2 Sep 2025 16:25:32 +0000 (UTC)
Date: Tue, 2 Sep 2025 17:25:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/2] arm64: tlbflush: Move invocation of
 __flush_tlb_range_op() to a macro
Message-ID: <aLcaeosv1G9uyWCP@arm.com>
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
 <20250829153510.2401161-2-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829153510.2401161-2-ryan.roberts@arm.com>
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

On Fri, Aug 29, 2025 at 04:35:07PM +0100, Ryan Roberts wrote:
> __flush_tlb_range_op() is a pre-processor macro that takes the TLBI
> operation as a string, and builds the instruction from it. This prevents
> passing the TLBI operation around as a variable. __flush_tlb_range_op()
> also takes 7 other arguments.
> 
> Adding extra invocations for different TLB operations means duplicating
> the whole thing, but those 7 extra arguments are the same each time.
> 
> Add an enum for the TLBI operations that __flush_tlb_range() uses, and a
> macro to pass the operation name as a string to __flush_tlb_range_op(),
> and the rest of the arguments using __VA_ARGS_.
> 
> The result is easier to add new TLBI operations to, and to modify any of
> the other arguments as they only appear once.
> 
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

