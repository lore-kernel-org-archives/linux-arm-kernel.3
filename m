Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F33CED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khBBGoTOUjoaTT9X0lGIPWbOdcGNUEbDr4AIJZdiXlU=; b=uV5h8+Ui2OSPgqG0PvSiHuum+h
	lbCoz2jBklgfYVwJnQ7bosvCJad2v3Y5Qs53GpTq1H7qDvgnEQGgXZL/0W2lczsdDVWUmYsz6GEO+
	IljE6Z4xW7x4vU9G3XXfEOwOgeJH8B7zHo+/AjBso7LcHAkiMIwkvvs79SuzeTDtg8p2NUklxcUwn
	lmaJx2tgLsGO5VM9VdW9fgEUs650T0IVBrQrdtUtb3u7ed1FvyG3V3LIKLNWrep1hN/TCOcP206hm
	RklSpuWqukXa/fiJexpC1rzzoCfPOXBpyT7nXOrIlWcCxUkjIS7zhXJ7Ync8+diBbx4IprH0LfE+5
	b1pEmftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL2Y-00000000R1T-2Hyp;
	Tue, 18 Nov 2025 12:42:34 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLL2V-00000000R0y-0Nkk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763469751; x=1795005751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=omW4v+Tc3Le2QAQshFJbpuP+L60KdBKt3nR18RcALXs=;
  b=Q9G+011k6uKEmI6zxQuBr0ei6+ohyErGEQZJkmcg5Egw4bHMQCyYw4jJ
   KXnu2X9cWiwenlzaCaNxsCIROFAbFu7TF4Vw9erDDwzpiJRA28teZNSTe
   q6q06r6JJo0FnbBmKIrETBKVz9br+VjkNDefKF08PZduBdozk/kvh8m3N
   XHwvqdx079H/zJGPZblhm//IuuGLE1OQSiwzfHCPccmk4TAg+r0VISuvu
   8F2RAHMA0gYumlDBUAAvB8kgt7bId9BMb3unEmbzkd2OhoN+zpzkWD83j
   e7IomYVgZwgQ880KQDew8HsKO/emUqBtjmviqW5QEmkvKmRPCnRwlvYgg
   w==;
X-CSE-ConnectionGUID: 3ePFz5I8RxW5V2ikROFsLw==
X-CSE-MsgGUID: aweTQz0eTsOVzaO7JIR/fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65369810"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65369810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:42:29 -0800
X-CSE-ConnectionGUID: O+PKAPd1TESN5U62SXzP0A==
X-CSE-MsgGUID: EmcXUBzwSMyUDkqlVl+y7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221655749"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2025 04:42:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 78E0098; Tue, 18 Nov 2025 13:42:25 +0100 (CET)
Date: Tue, 18 Nov 2025 13:42:25 +0100
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Christian Bruel <christian.bruel@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 1/1] PCI: stm32: Don't use "proxy" headers
Message-ID: <aRxpsc02hGW1w_hu@black.igk.intel.com>
References: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
 <20251117204348.GA2522408@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117204348.GA2522408@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_044231_224861_B2E5A7B5 
X-CRM114-Status: GOOD (  15.38  )
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

On Mon, Nov 17, 2025 at 02:43:48PM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 14, 2025 at 07:52:01PM +0100, Andy Shevchenko wrote:
> > Update header inclusions to follow IWYU (Include What You Use)
> > principle.
> > 
> > In particular, replace of_gpio.h, which is subject to remove by the GPIOLIB
> > subsystem, with the respective headers that are being used by the driver.
> 
> Thanks, Andy!  It looks like a lot of work to figure this out by hand.

True.

> Is there a tool to figure this out?  Maybe something I could run when
> reviewing patches?

I have a déjà vu answering this question. Was it you last time who asked
the same?

The tool is iwyu which is heavily tuned for the kernel use by Jonathan (Cc'ed).
But I do it manually.

> IWYU seems like a nice principle but I couldn't find any mention in
> Documentation/.  Should it be covered there somehow?

Perhaps. Maybe we can start with IIO, where it's a highly recommended thing
for the new code submissions.

-- 
With Best Regards,
Andy Shevchenko



