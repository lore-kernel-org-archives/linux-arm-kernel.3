Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E9ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95+WMjT/Hs/mVnHspUM0uZ6xKoXsB4sb3maqiVp/3V0=; b=kQsYiu0G6HiR6AfxYEWog7eBX+
	aElZBnnTE2V9vrj3EKzxOo8/W4E5iwsFro0dmfrm/nYiXJBx6MIedyepeR37OgqVJfWruBxuhnRyq
	FgEwO/BdCRIS/T/alJnWmT4aglYNBVAE4seLYSsubgksQidEsribRyxKp1Tm2yipE7TpQ3FGUJ2U+
	uB2kSY1rAuK6qJS6nWj+LkxyFs8wjVl7pBowY/uh4gZWVdAUwpGp4YM5OSv+WVpMMATdT6JBW6Cp6
	W0oEN4H1RsVu7PEWXFURPnlGTfi3TSVsz7veZGXjNjkKTmMPdAGiCVs9jQsev262xTiE5eXTS8z9+
	/6uei48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITtm-00000005hUO-2cu7;
	Mon, 10 Nov 2025 15:33:42 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITti-00000005hTe-3TPo;
	Mon, 10 Nov 2025 15:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762788819; x=1794324819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+rymyB2H1GCpplFZN98ExnpzW0O9nCkV8E0c0HQjmWE=;
  b=XRKfu3CRPDgITpGbxwp8IXyZGQAJh8w1PCfeJR8n+UjQ6Rbp72fifoZ3
   JmGXZ0MRuqmtZq43EkFjA90tfp/VIkb21yzX2br/Is1afmyTSdtirAytX
   ifeIA0fL/jU4oBesDHnod4lvlVG43RDMTccUNY6/vQIsgwM0YzlRjeGYr
   gH8BnoaHN2atx9tRpETSZteE1bNFMulOa3+3ma+LJGpE4nYFP0nKjcGK2
   Jm6MCqQxeTda/9ZDrZXeJ/LFnD01X8EcCO5qgawtk7IBQG7iFzfAQTVQ+
   OIM/XVEEDVtB2OoO1F5bsOaLAew8u1METKdsuncVDCNJ+yIPlaZi4yVDZ
   A==;
X-CSE-ConnectionGUID: EXksjOI0QUmP3NKYeFCUTQ==
X-CSE-MsgGUID: EKEj+0DsS+KjAhwWwKBgBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64769441"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64769441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:33:38 -0800
X-CSE-ConnectionGUID: IwSUOry/SDKpLQ2tpxmPnA==
X-CSE-MsgGUID: fQundh82RRibb0QT8W8jhQ==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:33:33 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vITtZ-00000007V6M-2rxB;
	Mon, 10 Nov 2025 17:33:29 +0200
Date: Mon, 10 Nov 2025 17:33:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 01/13] scatterlist: introduce sg_nents_for_dma() helper
Message-ID: <aRIFyR0maAfZF7MN@smile.fi.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-2-andriy.shevchenko@linux.intel.com>
 <waid6zxayuxacb6sntlxwgyjia3w25sfz2tzxxzb4tkqgmx63o@ndpztxeh6o32>
 <jea2owcqtjeomlbwkfopt3ujsnakn4p3xeyqhh7s4kowf7k7dr@deyg5pky5udo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jea2owcqtjeomlbwkfopt3ujsnakn4p3xeyqhh7s4kowf7k7dr@deyg5pky5udo>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_073339_271192_26D0E22A 
X-CRM114-Status: GOOD (  15.54  )
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

On Mon, Nov 10, 2025 at 09:21:18AM -0600, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 09:05:26AM -0600, Bjorn Andersson wrote:
> > On Mon, Nov 10, 2025 at 11:23:28AM +0100, Andy Shevchenko wrote:

...

> > >  int sg_nents(struct scatterlist *sg);
> > >  int sg_nents_for_len(struct scatterlist *sg, u64 len);
> > > +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len);


^^^

> > > +int sg_nents_for_dma(struct scatterlist *sgl, unsigned int sglen, size_t len)
> 
> All but two clients store the value in an unsigned int. Changing the
> return type to unsigned int also signals that the function is just
> returning a count (no errors).

The type is chosen for the consistency with the existing APIs.
So, I prefer consistency in this case, if we need to change type, we need to do
that for all above APIs I believe. And this is out of the scope here.

Personally I was also puzzled of the choice as *nents members are all unsigned
int in the scatterlist.h.

...

> > We need an EXPORT_SYMBOL() here.

Good catch! I'll add it in next version.

> > With that, this looks good to me.
> > 
> > Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko



