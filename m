Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D8EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eagcih7gQ/E0aNfelN22ndMMCDGMvVxcLtEyEfE050=; b=LTeV54nevZZzLQWaRV1Ry/20+y
	5FmZuP3EwN4o/Acvpi8m2+b30SZ0gARQrYWJQcDMMD7poyUBxAjRjTLMvvcPk3VrWhMZWoG6l8rEo
	O4XYG/QYzRCs49ft92Xo9FdU15KhxbUDaGTCfmLacxR0F2EjEjcHuWbCDMS44ijMaihEkQdHkFrnf
	VvdxioMcoCq7iUdwpOOB3WYCLQdV25JbsyB323NNyJg7LfS5PMSBH6sRSyCVnAItfuuca6BhWCtE6
	WI6sIebpXGIfaIqhOAND651oNZQrV28hOrmMsbvhIWvOZW793srgvrzK/CaYNzs+BrNBPchwk4vzk
	rglzmpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNTT-0000000C5Yk-1XaW;
	Thu, 03 Jul 2025 17:11:51 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKxG-0000000Bfy0-0Hgg;
	Thu, 03 Jul 2025 14:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751553026; x=1783089026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7Tp7mxCk+lHbCkMLaMMOj3pQFJ6m6rrmptwiX2ag3U=;
  b=jKDvTvg9OTeZk6aN26AbrWKtf6vDd1WzkOniu/z4LJQemcO9B5z2vbXL
   RcND9fucq/ws5K04dSjyr0WIU6v1ZKQYFOO6+Py2y6XewST7otljk6vJ1
   r5+kZlZOBRDZQ50G9JcJ2dF16o5XFTlXVfGrWE5ir/NYHiFYHyBiveIvt
   26lG1tsrN+Cx03BoKFBWMf+R5p5XON/T/39NB3ckAGrHNH+1vRodEbllt
   LfdjbFz9c2ScK+leXrj1/rIyZVYyGdX7aEUQMyQCkCwVjhEvwilhcbFQC
   WA/hdYzgRNZurgYH18PBp+jTEb85Kyk9il0CdyurG9KdZDIWJAGb73ZFS
   w==;
X-CSE-ConnectionGUID: IbvaxHcJS86u8BMLm+lfmg==
X-CSE-MsgGUID: 7YR6OxaLR8iO4N8Ki8P6yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79319353"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="79319353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:30:26 -0700
X-CSE-ConnectionGUID: eA+mFOxLQj+7OWl0Mm1sDw==
X-CSE-MsgGUID: pF6OSx0VSE+KewFcfBhPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="153814024"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:30:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uXKx8-0000000CEAh-3598;
	Thu, 03 Jul 2025 17:30:18 +0300
Date: Thu, 3 Jul 2025 17:30:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 0/6] iio: Add support for MT6363/6373 Auxiliary ADC
Message-ID: <aGaT-rSmUoukjvR7@smile.fi.intel.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_073026_131606_8E4301A5 
X-CRM114-Status: UNSURE (   9.91  )
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

On Thu, Jul 03, 2025 at 04:11:40PM +0200, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Added error checks to all regmap r/w operations
>  - Moved adc_vref addition to different commit
>  - Various other fixes
> 
> This series adds support for the Auxiliary ADC IP found on the new
> MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
> the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.

Overall LGTM, but one nit-pick in one patch.

-- 
With Best Regards,
Andy Shevchenko



