Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A2FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOh4WQfnuwV0RRmXk/kJZmjUbfSLzNUggJ67FJX7Euw=; b=kpGvYLv4ezZ4m3N8J7zZl4ttGo
	xOAu435X5OLj6vmaKCO9J16wFGQVYzFnzt+fGbAy+DlKh7HwwD1iXRExdxlUquqkquozlVAjwY8NA
	knRnKVkE223u+b1arfkrLfrcxBTnx3FWd7kr6VarhL2hFQ+YOFdfRcgixqU+F4P/GLcj5G0bM5cU1
	WsYDqpollXUcP0/Bl27Pp+BaUUN0UYsL3/9LrzQOQnchB328GiCBnvFIx0oU+XdWji7CAjTUmzGb1
	kl+z9K6X1Fzw1Ur2AKVsWcv/eSnoU1a8emkwzA0Nir/0ZeIO7OrPsq919sMS8Wk3Oy7EOs+vGcXeP
	1WuS3EPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHHj-0000000Bsm5-0EeN;
	Tue, 06 May 2025 12:20:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFLO-0000000BXZV-2Req
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:16:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 353BF113E;
	Tue,  6 May 2025 03:16:00 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B1003F5A1;
	Tue,  6 May 2025 03:16:09 -0700 (PDT)
Date: Tue, 6 May 2025 11:16:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 9/9] coresight: Refactor runtime PM
Message-ID: <20250506101604.GD177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
 <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031610_660903_C8DB148E 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, May 02, 2025 at 02:15:49PM +0530, Anshuman Khandual wrote:
> 
> On 4/23/25 20:47, Leo Yan wrote:
> > The validation for driver data pointers and clock pointers are redundant
> > in the runtime PM callbacks.  After a driver's probing, its driver data
> > and clocks have been initialized successfully, this ensures it is safe
> > to access driver data and clocks in the runtime PM callbacks.  A corner
> > case is a clock pointer is NULL, in this case, the clock core layer can
> > handle it properly.  So remove these redundant checking.
> > 
> > In runtime resume, respect values returned from clock function and add
> > error handling.
> 
> Although not checking drvdata and drvdata->apb_clk does make sense, but
> why change the semantics on the resume paths as well, which now returns
> stored error value from clk_prepare_enable().

Let us assume if a clock fails to enable during the resume flow, with
current code, we miss a chance to detect issues in the first place.

I understand the clock enabling failures are rare, but propagating an
error in the resume callbacks would help identify potential issues.

It seems to me that this patch does not change the semantics of the
resume paths.  It enhances the resume flow for early error reporting.

Thanks,
Leo

