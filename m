Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C435BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzdXtldMP/qdQ6dqTfr0IByI0xo4hvqL9urRTnIwb6s=; b=0XAd8kqCjV++SHcVMKONMaiQPx
	Hp67TipN9PN2RRDer5s/Zcd3Vip+ZZuAHa3kVUh1GXExu+3JfhFIfKZ4yPcrQbkg/7h1IoFUQT9de
	ZJDJK8deQDmIj+7e1IOcWkdK7XGPonFch6tQFqVQn1YAjmpP4CJdu89KSjQdEwp9/El6NOLtdaCmR
	IEL9yDH5C2Q1Nz9f3MpePu1gBx5juD7SVRWK3130FUFVtDQ5BfOKK4E/rz6LXxzRPYWp+/UHO7MAu
	Vip2JtEsiAzydI13ByIL9Sa3JRJ99nwlrIndBDbBL0dkYcPRygmglDWddnfeHTQbtxAuauCnAtvNh
	nLw/JFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S1z-0000000DZ5c-2jdH;
	Fri, 18 Sep 2026 06:25:07 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S1x-0000000DZ4h-0Yzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789712705; x=1821248705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kMWoUije5yTrC+y3H2eCV42peF2ZwHmEpdZ1AzMBN08=;
  b=Q/G8cbH8IYMGqS6X4PrOGD9B4Uj4DLhriKBGgwAFnZJHC0k66Rfjj8/r
   JCs0ZdNyhLnvLU/i5/WeNEjFli9LTSnLHCIUqaLc7GQKK/JhQM48I6fZ/
   GJwFnb8rVLpeBWGGMOtYxcPdNqv0T/AjCk7TEe+UpZBmGYaDDPyhRhQye
   Z77ILAeM4WSIGcTesrRZNfgfO3ZVZAXwtzr6AxYqTePpT8dZqlVXHUaDX
   PDzHcFn9NYjh10gFOxcy+Tv9yZ3zevGHxOMLDAbqKfBNw8wVRbeGlJpvv
   iaBrLo2W5wodrZBpMDtEBQdwYu2FFCC8SsxP7r4Nh9g8FD0up5UnE6AoT
   Q==;
X-CSE-ConnectionGUID: Cfinp4P7Ri6yZR+a6hvC5g==
X-CSE-MsgGUID: ZxKXbvydTV2nlA6m+Kef+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100858535"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100858535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:25:04 -0700
X-CSE-ConnectionGUID: nik7p8FETbK9DCqO6zw0zw==
X-CSE-MsgGUID: VmqEWhMvSN6swG9gHq3yag==
X-ExtLoop1: 1
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:24:59 -0700
Date: Fri, 18 Sep 2026 09:24:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqzZOZ2ovBc6affP@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlpoBJJXfZgsMxT@parshuram>
 <aqlwRkNcs_UqKjWs@parshuram>
 <aql6u3T0nnSVr-FC@SMW015318>
 <aqws8pN2rfS9-dCC@parshuram>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqws8pN2rfS9-dCC@parshuram>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_232505_184839_94EC7C02 
X-CRM114-Status: GOOD (  13.88  )
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

On Thu, Sep 17, 2026 at 11:39:54PM +0530, Vinod Koul wrote:
> On 15-09-26, 12:04, Frank Li wrote:
> > On Tue, Sep 15, 2026 at 09:50:22PM +0530, Vinod Koul wrote:
> > > On 15-09-26, 21:22, Vinod Koul wrote:

...

> > > > > Traditional naming would be
> > > > > dma/engine/provider.h

(Actually majority of the subsystems use driver.h.)

> > > > > dma/engine/consumer.h
> > > >
> > > > consumer and provider and good names.. I would retain the full dmaengine
> > > > everywhere please. dma causes confusion already!
> > >
> > > Thinking about it again, drivers/dma/dmaengine.h should be the provider
> > 
> > There some dmaengine code outside drivers/dma directory, like
> > drivers/crypto/ccp/ccp-dmaengine.c
> 
> They chose to be outside, their choice... They need to be updated as
> well to point to ../../dma/dmaengine.h :-)

Hmm... It's rare to make such a requirement in the kernel for the resources
like this. All I know about (GPIO, regulator, pwrseq, IIO), they split and
provide the interfaces to the whole kernel.

-- 
With Best Regards,
Andy Shevchenko



