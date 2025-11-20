Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A3CFA443
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtgPiJbmwivP6WOtMw3QkiX1afWQsJ61vmD2/VH+c5A=; b=w7EFB6Vy0Q8NAFXdE+Ncwh6jlb
	LzEtIme/BnEW6kbLarK/ctnqgd5SnT+vgAOKJiUUNg77Dg9QaQpqLIr/DYETNwBASVPYmcNDCDs3c
	XRKGjUWyU7dKxMa3gizR9GE1SRamb6XxmqUbDbYjPz4Zdr5KgR+bBCprEVcG7TLe7fHE8qPTa/MJN
	BEt4SI8bOWOks5vhdzNelupaZrmRVQvJKvW4tK7MBK3muD7NJvALsK2TH+c+NYz0+X5K3P2i1vPlm
	1DdGN2uAKEq0b/N40ACnV/UBt1BngvUGZdP+G3PYK2CqcyZDzgt+FAQ07pi7K9JMLdDmYqZXmC/LV
	ombBUtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMA7c-00000007GgM-3qMf;
	Thu, 20 Nov 2025 19:15:12 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMA7a-00000007Gfd-1cx1;
	Thu, 20 Nov 2025 19:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763666110; x=1795202110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpSmpsR9NetbPJhQGjxFutnFsKHftqvhMSFwh84zcwA=;
  b=HZ44JE1Xh5airIdPVCvxxBjnT6Ix2uvwXbQh6z0l+XQuibRKJV2VFEMS
   QviMX1NeWkfNbjj2sPgjmOxzvDCIm4ZNDDoBARPlhcu3usRJVNytnxMPi
   voCtIobJgzdzUydvK8SPbVOdX/4egAZ6zWBuUfLfYfy8SxKT8V/+/qDn/
   Qz0DVbjBrpSfMdzBqvk/gQlaEOoTOoRVZwx3hPtiTtSpuBPCcmL3NpA+6
   fCftNr/o6Pgqe0saMfhQm3gT4uFlHYgOxT7N6CzPsSVQjuzdS3baP+wZO
   TSjmcEVDddYfg1FvTpTSyV4oaH7+Kf/z3+/CsQwXECPzvkxX6PdPDSG8Z
   A==;
X-CSE-ConnectionGUID: euZFbMa7QKi2v3EXp5Yi8w==
X-CSE-MsgGUID: CE4BJnBTRl6QljbwBvfqGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65838715"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65838715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:15:09 -0800
X-CSE-ConnectionGUID: Lj2UXwM4QvSoozpG9EqitA==
X-CSE-MsgGUID: JRP7KrHGShi83szIQwo8rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191308310"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.97])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:15:04 -0800
Date: Thu, 20 Nov 2025 21:15:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>, Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
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
Message-ID: <aR9otpWZkPZrb9ug@smile.fi.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_111510_476333_AFD384E0 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, Nov 13, 2025 at 04:12:56PM +0100, Andy Shevchenko wrote:
> A handful of the DMAengine drivers use same routine to calculate the number of
> SG entries needed for the given DMA transfer. Provide a common helper for them
> and convert.
> 
> I left the new helper on SG level of API because brief grepping shows potential
> candidates outside of DMA engine, e.g.:
> 
>   drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
>   drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */

Vinod, what is your plan on the DMAengine patches? (Asking not only about this series)
Please, tell if anything needs to be done from my side to help them being pulled.

-- 
With Best Regards,
Andy Shevchenko



