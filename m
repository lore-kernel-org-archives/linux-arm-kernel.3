Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C6C54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX3s8isatuTCCCjqEM8RiICloxmXstLMMRcnUOuH9tg=; b=U9+PBTFQsa30RE7n+Y+k2H7TBy
	3XwZHG1JoME9Yf+pOBQe+rIUG5cpF1775DFQ3IQA1zK0dZ525oGMpSPvNArbzo3v/Y6ESVq7APerZ
	9GAJsGC5FFbmzcd/hTfWOZCVTpBOCqWo91u8/GrCMs84Q+ijyhA9Ba3Ywt3JpLJQTGIt7+siC64UL
	2P31KJOnFd+egUK7IIwgmdSh/E5fMM9dY4hFfOFuMlz/YIoknV7WAjFsMkd6RHyaynCD/dCHQnSEl
	H7Bjsxlpj9qTxIdjv2UamEHf5YQkI2i/EfjZ4ApWaNscVtVva+DrQ/fie3nYfcDvxPE3+eSAuyP/8
	M/Y7AJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLa3-0000000DOFW-3rJw;
	Fri, 20 Feb 2026 08:09:43 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLa1-0000000DOFC-0WcN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771574982; x=1803110982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k+Nn6h3w6tcNXtGfFrHNQpODw0l7JijVpV0PqpUPkDI=;
  b=DcF9NtmUWKzRBj8joYO3K1zP0dpQAkDdLwtFGO3h8jxAn0016qTXD8cd
   5sGFrhHdKOszwPZfXdjh+7Qe6IQQLlBKodxQO/Jc3NntDfQMl2G/ViUr7
   PR14TyJZ3RRI8s7uvDafz92CdVKho7OVFgrsk8bqB07+R6mVKqfucJ/XJ
   jyi/IEB97STQR3HS/DrnuPl66sLrJRD51/efblHJmOvPGhWqJMxHn6lMj
   IW7e7iePFl6uyjep7t0Z4Ba7KMBWr/gn8PXZDDFdWa+y81wL7TwOeWTAP
   Qbr2JyMGHCr5/Kg5+fVtY1T4/7x6oYmLLESYWMn6pqrKXEWKCmESrHOoI
   A==;
X-CSE-ConnectionGUID: MnhwvQESSii0MnEt1eMwZQ==
X-CSE-MsgGUID: d3lHoI+gQYa/KIRkJ0s49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72370102"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72370102"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 00:09:41 -0800
X-CSE-ConnectionGUID: Bu6Ho8eLSmaxjN84JdfduA==
X-CSE-MsgGUID: oDSMhlRYTg+Px/GACX7hTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="219796663"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 00:09:37 -0800
Date: Fri, 20 Feb 2026 10:09:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH 3/5] iio: adc: xilinx-xadc: Replace module macro with
 custom init/exit functions
Message-ID: <aZgWvjWBusT_JQgE@smile.fi.intel.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-4-sai.krishna.potthuri@amd.com>
 <aZgS2c45nGTozHkv@smile.fi.intel.com>
 <fab2599c-e749-4aa1-8157-c7ac358c6f36@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fab2599c-e749-4aa1-8157-c7ac358c6f36@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_000941_236136_F6389511 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Feb 20, 2026 at 08:54:26AM +0100, Michal Simek wrote:
> On 2/20/26 08:52, Andy Shevchenko wrote:
> > On Fri, Feb 20, 2026 at 11:09:39AM +0530, Sai Krishna Potthuri wrote:
> > > Replace module_platform_driver() macro with custom init and exit functions
> > > to prepare for supporting multiple bus interfaces (platform + I2C).
> > 
> > No, this is not how it should be done.
> 
> And how should it be done? separate file?

I answered somewhere else, but I can elaborate here as well.

The idea, yes, to have the driver in the parts:
 _core.c
 _platform.c
 _i2c.c

To achieve that, it needs first to split the driver followed by likely
conversion to regmap. With that done it may be used in i2c with a little
code added into _i2c.c.

We have examples in kernel for that.

0daede80f870 ("i2c: designware: Convert driver to using regmap API")
fcb82a939df8 ("i2c: designware: Add Baikal-T1 System I2C support")



-- 
With Best Regards,
Andy Shevchenko



