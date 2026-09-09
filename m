Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1EC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxktNH1jYyZIEUzAWfxj0P8SJ1rSrlekU5I3vsQjeEA=; b=SJPebh3NbA/n3T7Klwpp6zS9pW
	lQgv8cHEVHmTKnSKlTWasSXjFgplakUKCs5hPFoDCVkjDNLtTBtxm+3a28IIrUBHerIthXe9X9RB2
	UQx4TCCL8zOuUSB6SeEAab5aaA8rB4GbWYubagUsF0fz2T+yhmixH6xGKlcnzamRCgrakmMJIAYDB
	LjXpRJEQo23MhGQ4HZcKF77zsZEZ8Z0xYZyK9VDpI9DTg+Z8oRGULxtSz7s69xjT8tWwL8gjO1t+2
	pfCfdGsRMv3QHdURN2oNBSCbOyEKT2t4L7G2weftqmID+q9oCqVBaowmXhe1QNrwcno4HKKx9X1yg
	0u/rb8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IDy-0000000Blyb-3Ds8;
	Wed, 09 Sep 2026 13:20:26 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IDx-0000000Bly0-0B9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788960025; x=1820496025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a9xwEoqisLjUyYt72a9JUCd35booJM6VKKF6kbIjuGU=;
  b=QF0bob99Rj2Dg224jsoNOFalrNh5RPhWep0wm9sxXIPFNpS6a00iG6vp
   PYXIX6TMSrXnYoFlflv2+ks3p+dF4t1les5cF4QRsu1P9d7aV1i0TJ7Yb
   zl+twud7RqwLeAkqJtcD49nzZqmGWc69l3IrwrNCcMo2MJWql2ztA5kkJ
   C65hAI5kP/swNyqVb+rAfP00I8+Yq51IkKxfafs3DkJdxTSzKbPM8pnYI
   SPFBJr8TzvD5d0uKnUHyoxF3Ak2QXbXyqtyHhkVbQSbEWZ7F9OSVFqYhv
   rL5UQIeklKgy+8APJssn5vlbWRyyXZxLm8fJ4C+ss61h9kCZVn0WnuvsA
   A==;
X-CSE-ConnectionGUID: iPLVd1WwQ220M1I69U9AWw==
X-CSE-MsgGUID: 1tJx2HPrTem8BtOG5PPglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89416469"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89416469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:20:24 -0700
X-CSE-ConnectionGUID: W5dVsgoESWKVYyPV1g2qAw==
X-CSE-MsgGUID: HSc1w0UZQfiNP+dXSFcLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="271798898"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.249])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:20:21 -0700
Date: Wed, 9 Sep 2026 16:20:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed
 APIs
Message-ID: <aqFdEiBzwIAuqVhp@ashevche-desk.local>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_062025_127641_D182F997 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 08, 2026 at 10:53:53PM +0530, mdshahid03@gmail.com wrote:

> Changes in v4:
> - Move the ADC enable error-path cleanup simplification into the
>   clock conversion patch.
> - Simplify the ADC devm cleanup action.
> - Restore the blank line after the copyright header.

Cover letter is not only changelog, it also a summary of the series.
Patch wise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



