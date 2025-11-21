Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2664DCFA47C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6tUmEDA5yvSV6c8BbKsvpAdUq7oMRNXNigiUL9/ixg=; b=yJHWhDdZanC8cVXWZtCymimwha
	WsFXBnQ9Nb1NEqSIgxogu9FQsjGoO2TcZZVYiONbHii5POopuqpjpZl4cy6T117p4nZsAgMZQD9lP
	A1CrXAfNB5SUDCn1hzncyLBI9/rIArFiC87QuU1O5XlzC8ce3eIqE/36MJaZOAw8ieSplcdeJKIos
	kiY3rB0lfUSm0IGCtHEG4KK9KJDDi2vm1bAFd6gwIs9j/h7vFL6OmKKcZAIqQkwlQvJggNeO7Pj34
	up5yBh/3CA3GPlMeXuNo533rbaE+pCxF1MQ7KIHhvpN/NOttWNR2/lYty2ok6PokEeySdeqD7ydw5
	ntrmws+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSDA-00000008WqA-3K3H;
	Fri, 21 Nov 2025 14:34:08 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSD7-00000008Wpd-1cRm;
	Fri, 21 Nov 2025 14:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763735645; x=1795271645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1XoUCF59kcMVVq7Hd7ANhG5TS1a7hgA1sXh6vlWZw8c=;
  b=Kz4mpo3qI37kv+lmFI7DRKdkQKKuKhJGCywCIY8UiDtaAAYp7/a7sVs6
   Dh/oN7kybDmX/K4EmLtTvnV3861yBaaAImzgOx+6F8cDdcMILtwl3U0CV
   thvg/znTEJNqnPr2Vycqsn6MfUCynJfiNR7iszxvXltcvSeFRKXs8Z+oA
   wMDEKW0McmYZbe/XyPwmYzYYgKXCdByZvVsfFBZ9ex3lheTFSpXm6lu3n
   zGYNAi9fHGX1r/phM93nVM/5+Wm84OSRyk4VHcL5NigTTi1wlCqOXeH5n
   P9XxyjBLr08lbJ6FDPJZ2J0zlsJxYPEO+F9tq1ccklgJNImVAfUluZhGM
   w==;
X-CSE-ConnectionGUID: RQ9L//g6QFG7JN+ccKo3jg==
X-CSE-MsgGUID: W20E/jrDTtq0qEI4V1CBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76512264"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="76512264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:34:03 -0800
X-CSE-ConnectionGUID: GDde5zVlRbCzdD62mN8+RA==
X-CSE-MsgGUID: PAMWWwzOSAiXoV+m4AVJKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="192155378"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:32:53 -0800
Date: Fri, 21 Nov 2025 16:32:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
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
Subject: Re: [PATCH v3 00/13] dmaengine: introduce sg_nents_for_dma() and
 convert users
Message-ID: <aSB4EwOqTs5Psg8i@smile.fi.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
 <aR9otpWZkPZrb9ug@smile.fi.intel.com>
 <aSBVwOs3igPF71DQ@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSBVwOs3igPF71DQ@vaman>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_063405_437847_D6F5E96B 
X-CRM114-Status: GOOD (  11.50  )
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

On Fri, Nov 21, 2025 at 05:36:24PM +0530, Vinod Koul wrote:
> On 20-11-25, 21:15, Andy Shevchenko wrote:
> > On Thu, Nov 13, 2025 at 04:12:56PM +0100, Andy Shevchenko wrote:
> > 
> > Vinod, what is your plan on the DMAengine patches? (Asking not only about this series)
> > Please, tell if anything needs to be done from my side to help them being pulled.
> 
> Sure would appreciate if folks can review, make it easier for me to
> pick. Yeah been behind for a bit, picking things now.
> 
> Reg this series, looks okay, who would ack patch 1?

You. :-) For the generic headers each subsystem maintainers may apply this.

-- 
With Best Regards,
Andy Shevchenko



