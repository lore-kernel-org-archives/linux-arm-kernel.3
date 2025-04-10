Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGBRp/mJ44odAQ+DK3ZQeuktW6/k2UiJ6GrDt9QhUkQ=; b=S4pT7CJlWOJTUL54eJE+e5DzwU
	nI6tcyITQCVuzcFLu/L4WS5TbJC99Utnsxc7ZdlntyjXC4AvFdNq2jrQXcwnWvTc6Q1L8hm9WHEqP
	bCU04G+eFk2OMlSmxwMvecm7W1CKtGHd20/+Je5Ol6aGqkFBI2DLW5hsdcoTQMLsXYnrUViGN8ePc
	WpvPUH4mqDTRi/kKK+my1wshNJwd2Cn7iF3p240x+ZiLvlTBz1Z8mwKpLarbmUZlXFMeHeV6upz9d
	faU1/Dr1uXb19akPlR0hHAbspQIJNpg9KD/+pXXKQC3GI+KRFqnA7456uY9UsJ6dCVOWys0/O7t1r
	jjqzrORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uPm-0000000B7sM-3iwb;
	Thu, 10 Apr 2025 16:06:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tce-0000000Aymv-1UtY;
	Thu, 10 Apr 2025 15:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298120; x=1775834120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V4GHZJ8ckeMnMp0rIGnPoc0LafTsnMm513zi7ZBVHVQ=;
  b=CROV4MqHXSGRrysn0smbGdwbh+/D7iWjm6THt1yJxbQ/YVZ7YTPK55in
   Dtd7hacN4FxRk/ng3DwDV5cfaRu7VnpKgAP5IWnBbuCOwCxOdyVYMeRYQ
   Z64I1dwezzk3RMwcK0xGHLIqU15Tw5zrWFtOr2m9bQ01CasZPhGcaFCdu
   l37do29E9a32b0LJXFqQXS1uCRp0A+QTNMTKlZLYfGWstAFn0C7M+Uj5q
   om67Yduxrdb3lsb/XTr89ILMY7dgNrs2HueHdDxjcBpHPSzQ7fJEkrHyw
   NdPxHrK8zXDoxigbQmZM2IkffjHWmES2WIQKxTgFMpDqdGQrR4zPlDcYV
   w==;
X-CSE-ConnectionGUID: PuDLA/e7TyalFsI+T7E1DA==
X-CSE-MsgGUID: SbqTe0BXSTSM+xYDplzTwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48534422"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="48534422"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:15:18 -0700
X-CSE-ConnectionGUID: vQ7lhxf+QZ2w5KQxjMC4EQ==
X-CSE-MsgGUID: XLyoK8lKQ9C7x/NfnQcgNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128912597"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:15:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CE9BF11F74E;
	Thu, 10 Apr 2025 18:15:12 +0300 (EEST)
Date: Thu, 10 Apr 2025 15:15:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/3] hwrng: atmel - Add a local variable for struct
 device pointer
Message-ID: <Z_fggNyPaotb2mYh@kekkonen.localdomain>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
 <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
 <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_d2fcuWPiel_OnT@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_081520_413032_BF75D5B4 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Herbert,

On Thu, Apr 10, 2025 at 03:42:53PM +0800, Herbert Xu wrote:
> On Thu, Apr 10, 2025 at 10:06:21AM +0300, Sakari Ailus wrote:
> > Add a local variable for a struct device pointer instead of obtaining the
> > hwrng priv field and casting it as a struct device pointer whenever it's
> > needed.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/char/hw_random/atmel-rng.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> > index 143406bc6939..5192c39ebaeb 100644
> > --- a/drivers/char/hw_random/atmel-rng.c
> > +++ b/drivers/char/hw_random/atmel-rng.c
> > @@ -56,12 +56,13 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
> >  			   bool wait)
> >  {
> >  	struct atmel_trng *trng = container_of(rng, struct atmel_trng, rng);
> > +	struct device *dev = (struct device *)trng->rng.priv;
> 
> Please stop using the priv field and instead add a struct device
> pointer to struct atmel_trng.

Thanks for the review. I'll do that in v2.

-- 
Regards,

Sakari Ailus

