Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EBE10854DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXpsELZKftDIWDSYTtONuHeCL8BGU4IC3+ywbMNuIIc=; b=Vncp3uli7a4PbwJ3uD9fUy3o4y
	PXnvb0p+VM7zOMfcQuI/f7uRtvvBYd7y2acLy5sVWdpY1B9LCcfRLs61BbOBRrqkGxr3LFWcOKic4
	7Df+uZJjqSSSz4MUCh91CMLzbWZztxUfaEIw+aRisCUkrUHSM2e2MPR9hA4CrNnpYTXggl6Be8uTr
	UxrUaKm1gFgGbKmMx2nPBBeuYngC6AqB2XIYosO01lpkN3i4BEZhazg9ucOj7B8eRRLRw5zLl5l13
	YTA74D6yjDj1axkIk+JcmIKdW0k9OtVUxwRjSBGwLt3v42vubDUA+2em3CJmZr0lkBYwIjsOp6U6j
	IIbcRaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nUJ-00000008A78-1th1;
	Wed, 18 Mar 2026 09:46:51 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2nUG-00000008A6k-1ZhX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 09:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773827208; x=1805363208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ihjhU69L0KQ3hSQ0nv4BylA0DtPfOoTddmdqvoNOxvU=;
  b=hcDMTHb3TET3aq+KdaxtNNb+xs9hLN5czU4laBkI/KNDt++L9WB8oVDs
   jdazPV71sKFYCKQpRO0zF5laHOl+sGZGNYg4TSJ2Ei9a4+Scx6Ht43SiR
   1S7xiI/edw3rL5MmTtFuB0YUd1rxIrzJ21SAuj8AMkZOcmgNuk2kkHXmA
   Buz+qb1Y62AsytUopNjgW4oZdTIV3uIcohwfsKhXjjA0qagW5NqGx0atI
   W36kks+Gm6aGjCiFDz2Zz1NOmKd0g8C9vKenTkIyFl/TlgM30SK675Be6
   Jm6IfRwgYHG7n/7wP2X/reKJURLPw3MdDyFDbKcqMFWcTq6DT1G2TiH4Q
   A==;
X-CSE-ConnectionGUID: AiGbkraXSrWSKt12MKC6QA==
X-CSE-MsgGUID: VQngaLiMRfGXL/bCPscyMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92445786"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92445786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:46:44 -0700
X-CSE-ConnectionGUID: qElVMAsgSNywk+Ymp68ONA==
X-CSE-MsgGUID: l7BvO4LYShC41yWRpNUvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227515662"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.240])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:46:40 -0700
Date: Wed, 18 Mar 2026 11:46:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Michal Simek <michal.simek@amd.com>,
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
Message-ID: <abp0fWQVqhNeQVG7@ashevche-desk.local>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-4-sai.krishna.potthuri@amd.com>
 <aZgS2c45nGTozHkv@smile.fi.intel.com>
 <fab2599c-e749-4aa1-8157-c7ac358c6f36@amd.com>
 <aZgWvjWBusT_JQgE@smile.fi.intel.com>
 <ca6050a2-72a5-4d13-b89c-10e78364e5fc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca6050a2-72a5-4d13-b89c-10e78364e5fc@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_024648_443600_EA2AE89E 
X-CRM114-Status: GOOD (  26.95  )
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

On Wed, Mar 18, 2026 at 02:43:41PM +0530, Sai Krishna Potthuri wrote:
> On 2/20/2026 1:39 PM, Andy Shevchenko wrote:
> > On Fri, Feb 20, 2026 at 08:54:26AM +0100, Michal Simek wrote:
> > > On 2/20/26 08:52, Andy Shevchenko wrote:
> > > > On Fri, Feb 20, 2026 at 11:09:39AM +0530, Sai Krishna Potthuri wrote:
> > > > > Replace module_platform_driver() macro with custom init and exit functions
> > > > > to prepare for supporting multiple bus interfaces (platform + I2C).
> > > > 
> > > > No, this is not how it should be done.
> > > 
> > > And how should it be done? separate file?
> > 
> > I answered somewhere else, but I can elaborate here as well.
> > 
> > The idea, yes, to have the driver in the parts:
> >   _core.c
> >   _platform.c
> >   _i2c.c
> > 
> > To achieve that, it needs first to split the driver followed by likely
> > conversion to regmap. With that done it may be used in i2c with a little
> > code added into _i2c.c.
> > 
> > We have examples in kernel for that.
> > 
> > 0daede80f870 ("i2c: designware: Convert driver to using regmap API")
> > fcb82a939df8 ("i2c: designware: Add Baikal-T1 System I2C support")
> 
> Sorry for the delayed response. I have gone through regmap implementation to
> understand the approach and started converting the XADC driver accordingly.
> During the implementation, I see few challenges with using the standard
> regmap MMIO and I2C interfaces, which requires defining custom regmap
> read/write hooks for both MMIO and I2C.
> 
> For the platform/MMIO case,
> Zynq platform has its own FIFO-based mechanism for hardware reads and
> writes, whereas the AXI variants require additional offset manipulation
> before accessing the registers. These platform-specific requirements force
> us to use custom read/write implementations rather than the standard regmap
> MMIO helpers.
> 
> For the I2C case,
> 32-bit DRP packet needs to be framed before issuing any I2C transactions.
> Since this packet framing logic is specific to the XADC DRP interface, it
> again requires a custom read/write implementations.
> 
> Considering all these, regmap may end up as a wrapper on top of these custom
> xadc_ops read/write functions, which may not add any additional value. Since
> the XADC driver already has the xadc_ops to support custom read/write
> implementations, can we continue using the existing xadc_ops read/write
> paths and skip the regmap conversion?

Thanks for elaboration. Indeed, the regmap approach in this situation gives
not much of benefit (there still is, nevertheless).

So, the compromise may be done in a way that you define custom IO accessors
and respecting callbacks in the private data structure first, then split
the driver to _core and existing _platform driver. Add _i2c on top of this
refactoring.

> Please let me know if I am missing anything in my understanding.

> I will still proceed with splitting the driver into three files (core,
> platform, and I2C), as you suggested.

Sure, this needs to be done independently on regmap.

-- 
With Best Regards,
Andy Shevchenko



