Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08C0CFD364
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqRqCK4rs9Q1IMwj7iTmtoWcpWNcNdp7HNUySR+q5Z4=; b=s0a8g541WIEgLvJgCdvVCDUru3
	CFy9soWD5kwMSq1TlYzK5Azp6D90b0EuxRI3XsqXYyGAq122dUgOKR9PQp0vYMBrUhaNUP+JBQb3S
	x2nCRawBlaWyeuJprwTKx5hp628AbwUdbHrhHr8Je2lNs+vDdEYOPMFmA5IZ+sLxLMaRLgyhLQ00+
	hodtBOWNNpaRipEytg+KdTQ57NliOwKyvLduYGboFsf31uYnXSltAPPGdSS/0Eb+sfE1xPixEYjar
	RbL45EmD66dFBEs1LEmkdsiNEwKNAVGIULNSjVsspkjN+eG4qT+h/pp8d6hyekqbBzEynI4tair3x
	K9QMQ93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnrm-0000000CvXb-2CPW;
	Tue, 25 Nov 2025 07:53:38 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnrg-0000000CvWl-1Fnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 07:53:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4CF43AA6;
	Tue, 25 Nov 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1764057207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqRqCK4rs9Q1IMwj7iTmtoWcpWNcNdp7HNUySR+q5Z4=;
	b=KneGVY3Puoqf0Rvj9nDxDabG/UNWWRnzfAtjo+uVfGfzImpELfAFw6tFC8p6BOOCnnz8mO
	ULbM7eE6kCknKDnWQEOKEHIGHns7L6sxMxmGipNHcg/nmDUNOkhHeHUoHbyt+Grp3iLNbx
	Z0GOE7lpy9D3qoyCeCOG+Pyt1KAScshhNRCZwGEj/ExC3rE29R88WPMAGRpwta74c2loFz
	pUnC8XMIr1B4grD3uZZ1+ROXUOSvIuBKy++EatIFv78PLtO+bLc7JfPTDBSD6qykRNo+YV
	XrWDoCiXEW4V5kMge+qCqlnxMiToyIJH3iANoNUtpcCJM3wd93arEF+nXH8AtQ==
Date: Tue, 25 Nov 2025 08:53:22 +0100
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, oe-kbuild-all@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource
 arrays as const
Message-ID: <aSVgcoNNeLJshwvU@yoseli-yocto.yoseli.org>
References: <20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27@yoseli.org>
 <202511250103.RMNoU3xH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511250103.RMNoU3xH-lkp@intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedtledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepudfhuedvtdetgfefveekvddvjeehfeeffffhleeludejleefudefkefhudfhuddunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkegvtdgumeekrgguudemvggvvgelmeelhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemkegvtdgumeekrgguudemvggvvgelmeelhegspdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudehpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrg
 hdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopeholhhivhhirgesshgvlhgvnhhitgdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_235333_009798_1A68F2DE 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, Nov 25, 2025 at 01:48:24AM +0800, kernel test robot wrote:
> Hi Jean-Michel,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Michel-Hautbois/m68k-coldfire-Mark-platform-device-resource-arrays-as-const/20251124-210737
> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> patch link:    https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-1-f447251dad27%40yoseli.org
> patch subject: [PATCH v3 1/3] m68k: coldfire: Mark platform device resource arrays as const
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250103.RMNoU3xH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250103.RMNoU3xH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/m68k/coldfire/device.c:141:35: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      141 |         .resource               = mcf_fec0_resources,
>          |                                   ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +/const +141 arch/m68k/coldfire/device.c

Frank, I mentionned this warning in v2, do you have a suggestion ?

Thanks !
JM

> 
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  136  
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  137  static struct platform_device mcf_fec0 = {
> bea8bcb12da09b arch/m68k/platform/coldfire/device.c Steven King       2012-06-06  138  	.name			= FEC_NAME,
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  139  	.id			= 0,
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  140  	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24 @141  	.resource		= mcf_fec0_resources,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  142  	.dev = {
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  143  		.dma_mask		= &mcf_fec0.dev.coherent_dma_mask,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  144  		.coherent_dma_mask	= DMA_BIT_MASK(32),
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  145  		.platform_data		= FEC_PDATA,
> f61e64310b7573 arch/m68k/coldfire/device.c          Greg Ungerer      2018-03-28  146  	}
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  147  };
> 63a24cf8cc330e arch/m68k/coldfire/device.c          Antonio Quartulli 2024-10-29  148  #endif /* MCFFEC_BASE0 */
> b7ce7f0d0efc1a arch/m68k/platform/coldfire/device.c Greg Ungerer      2011-12-24  149  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

