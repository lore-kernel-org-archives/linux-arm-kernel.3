Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090EBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jLd67kjbC292DG9jJ6r6QNDPVFMi9aAXImnn3bx+Ew=; b=a5Lqzl3eYjPXdwzSobNBCqfEdT
	j24iGKB/WyGl75Uf9jvnx57R/nTVQS+5tjQKqDOm919/1FVKjPk8E9tQnp/zVW1IKPYKavYhDPfYQ
	4yBp0551cSVKsHGEQbNCtRw0x59ZUc62/Cnt5UQTddfPSQ2QIIwxScJbsKIZq850QI0HDqqRALGoU
	Jc6ysMTXG9iEEdWT+0DeAJjJpFLTLuwffphNs6+SHB6DhaahwRguGW6/qpaOydzOrGDMqtuehCMCA
	sOqt6U6zT8m/JoZ9BBCZCSlDUXU/7Zn3VaXyz12kgnZvympJOvbM/ZTU2WQPzvblnEmM1pVzY6jYW
	nHzyswjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidcI-0000000C9Od-3XSb;
	Thu, 13 Feb 2025 18:07:14 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticE8-0000000BniU-2tIE;
	Thu, 13 Feb 2025 16:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739464692; x=1771000692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4F6lLs5DIJbPs+bwuRZBqYEa3kLjWUhgDzZWRR+fM8=;
  b=axcWBZ+7WsgafvA1HPWo7UoyuASzT1FIDSUSm0yE2L3TNNsy+DNO8K+D
   g+dps3mdJW54nJ1cIwxd6n0sXQC1Ai06Plx+5/Frytzn4smojmRBskZ4v
   SuBwKzpSZTd3FBFRVPit82Ox2CQD+ODRGPZ/LhnlLIP3Gnl8mAUl8ESEa
   FCgPH4L9w/RnRE1Xl02LAKGAutHc+JsplyN/hhA+6c07OfDfbTcCOrTLx
   3n09DFtNkVnyEmx+Xrg03LCYiTmbsVgntc7HRzH/0NSfYSyjlqv8rXq5h
   HyKmSP+2QFlJ3t+4+okOEcxm37IZwdDfrzuEaeq+bc3SLElMO8h+SiHhs
   w==;
X-CSE-ConnectionGUID: BIt5O4QTRTWQi7laiTe2mw==
X-CSE-MsgGUID: VVdVN22nRsqFB/ymczNfsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57584182"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="57584182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:47 -0800
X-CSE-ConnectionGUID: niTSu+OLRH6SflrjdnL4zw==
X-CSE-MsgGUID: nDLWUmqKQx2tp+6jE5OMkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118279941"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ticDb-0000000BDvA-3sGX;
	Thu, 13 Feb 2025 18:37:39 +0200
Date: Thu, 13 Feb 2025 18:37:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64f08OhKlXuoYP-@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
 <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb1cb01-78b8-4ed4-b4fc-23fdac78ab21@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_083812_773153_5159E054 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, Feb 13, 2025 at 05:01:20PM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> > Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
> > No functional change intended.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Can we please do the helper conversion as one commit and the (much needed)
> cleanup of assigning len and de-duplicating the call to mtk_i2c_cmd() as
> two commits?
> 
> One with just the conversion, one with the cleanup (or in inverse order,
> as you wish).

Yes we can.

-- 
With Best Regards,
Andy Shevchenko



