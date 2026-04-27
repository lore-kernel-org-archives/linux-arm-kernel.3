Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18687FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eN9fuIJeo6tTmU+dyy1+AD3nSrA6DwapPgxS8t9kd/Q=; b=CwEDgbPY9cJBtgTItmXExGjb2V
	XrqlDbo+zuMfcMkg/mt6pcqr1a28KdT68PJmK5GolPyIgAiyePpcnEJ858dqQK3/Rct1q5jO6WN8A
	sMrnQt4KRrp/70+PA3yEAoe2RZ85LBKL5CIqJTFBNE+hNJgpKd3Z5ohSzg8uZn2ANqAEsWERh9BJT
	fPMruv46X93AbkI6uQ4mXAPsvKlnyMSvJP1FtuScyiyGnChGc9RUSiMxH5GtEfofGUtDR5PkBG3jw
	TFIU/opc6ibTlsLlF/Y42jsDZaap7qAugyOEIwgn2w8p0S2gGOABFLlmmxNv3ZfDuWFUWlWC89Gws
	BtXq+rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI3F-0000000GYCA-03iL;
	Mon, 27 Apr 2026 09:14:49 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI3C-0000000GYBS-0l9a;
	Mon, 27 Apr 2026 09:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777281286; x=1808817286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+VUSESxJWMNTH6/hMlY6WIVcBb885TUUzzoYZQMV9Q=;
  b=UuIkBla5F3ptf0XTed5QGXlC4UG5CqImPWDtYJnKdbjQfatKFhjHdsjE
   /2RprKLjAk6qw0ZqaMNuz7zQ1UFD9MvAQza29+JLjuYPPWrjd309qi/NX
   XsISoGASIRyECNJIMpYXUuBkukP7r8P6UKGeVkS/rM2t9sT41yXEqmjHh
   FAoUvxHtJKwle6V7GoUt0MB826n5hKwruB2fAodnKJCbLo4nZe2YFfXay
   5sLz4bVb10NbZ5J8UJiCuSGXoLOLhmp8NQtgmNVOR5gI4tIJ6quFtYTio
   URufd3JL5/Ng8AJ9u6Hs0YNHYb9Ao+Utyk0n8vZtcZuPlPCWBl4CRGsgt
   A==;
X-CSE-ConnectionGUID: lBsXkNZPTy2SX7Zt9kBIXw==
X-CSE-MsgGUID: LfdMTYDITQeLHB4rS18NLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88477583"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="88477583"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:14:45 -0700
X-CSE-ConnectionGUID: uLrFl3k6Tdyd56DCCZyGYQ==
X-CSE-MsgGUID: Q7wB3U6GRN6hTKKuowFyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="233852015"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:14:43 -0700
Date: Mon, 27 Apr 2026 12:14:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <ae8pAGBGGOvsURka@ashevche-desk.local>
References: <20260427085458.38546-1-salah.triki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427085458.38546-1-salah.triki@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021446_278544_CD148BB8 
X-CRM114-Status: GOOD (  13.58  )
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

On Mon, Apr 27, 2026 at 09:54:57AM +0100, Salah Triki wrote:
> In mt6358_read_imp(), the return value of regmap_read() is currently
> ignored. This is problematic because if the bus read fails the variable
> val_v remains uninitialized.
> 
> The function subsequently assigns this uninitialized stack value to
> *vbat, leading to incorrect measurement results being reported to
> the IIO subsystem without any error indication.
> 
> Update the function to check the return value of regmap_read(). Ensure
> that mt6358_stop_imp_conv() is still called to clean up the hardware
> state before returning the error code.

Sounds like this deserves a Fixes tag, but the problem is that the whole driver
is written like this. Why does having this fixed make it special?

-- 
With Best Regards,
Andy Shevchenko



