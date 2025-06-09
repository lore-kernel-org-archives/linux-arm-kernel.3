Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDA4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+Q1F/m6OOwsvbv6S8H7xhHidfQ0S01QU2Lw4DC5Uso=; b=GkPToGn9zrypxP4KohUu+NVcyo
	MNHdBHh1C2g9hLUUL/hlUaQcHO7ibIEmXGh3SeFvhkqZ7oh0lUr2LTtqUPlDFKHdxR1L8yD+ULphA
	KsB3maxdrXY/X08iNd43wDhg8S19IS3fyIFYW/UNm70iFASMPcTaDv1tvQXVB6lavc3K4DIQ1R0yR
	DT0w09RedfSBZUx386lZdRq6uoFx7nUQZPgS/IwsgOzhZfXJ92avhOtIvJTM4mIlJlpptFuBI0/kP
	ArLUWJSKH6MEsq8KM09QnP3OFezGiVdT9doyCo6idkIQmRpi9wVwdyb4fmSof7F8FVjCAAO63S7vA
	ynQu/63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOghY-00000004qxb-2ZE3;
	Mon, 09 Jun 2025 17:54:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfal-00000004iT8-17dy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 16:43:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD181515;
	Mon,  9 Jun 2025 09:43:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FA973F673;
	Mon,  9 Jun 2025 09:43:22 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:43:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] coresight: Appropriately disable trace bus clocks
Message-ID: <20250609164320.GM8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-5-423b3f1f241d@arm.com>
 <89f9fede-3a0f-4ed6-a42d-43827f7a4fca@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f9fede-3a0f-4ed6-a42d-43827f7a4fca@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_094323_347850_46A2F1E1 
X-CRM114-Status: GOOD (  15.79  )
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

On Mon, Jun 09, 2025 at 05:14:09PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 09/06/2025 17:00, Leo Yan wrote:
> > Some CoreSight components have trace bus clocks 'atclk' and are enabled
> > using clk_prepare_enable().  These clocks are not disabled when modules
> > exit.
> > 
> > As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> > The benefit is the driver model layer can automatically disable and
> > release clocks.
> > 
> > Check the returned value with IS_ERR() to detect errors but leave the
> > NULL pointer case if the clock is not found.  And remove the error
> > handling codes which are no longer needed.
> > 
> > Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
> > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Can we consolidate the ATCLK handling to the core coresight helper for
> APB clocks ?  It is an optional clock for all devices anyways ?

Yes. ATCLK is always optional.

Could you check the patch 07? It is exactly a consolidation to put ATCLK
and APB clocks into a central place.

Thanks,
Leo

