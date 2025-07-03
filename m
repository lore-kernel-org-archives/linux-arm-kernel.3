Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C3EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkkfXkgiKSoWp3Wmt4rSi0jtVVgHMseHF6s00lnxL8c=; b=ESenSAsB7e0PqKL/ZTDks3SxT4
	0vR2Upjqrn9fNnQMUR1O/EMAcd3sZ9N+KOsEt8xlsLvkEDnvFdNE85cgb5FIu2/+TTt2FMNJ8KJaa
	36bMAUWiRgaDOnb4Stenp9Px+mAgBF3HctmcpSKvSPWmTuHwdiFzKilPy6dhYlfq+UD7EGpyk9JMY
	teE+DI6g2pzV/XTePktQ02F3+CyDfdAPxAqvTO7Q2rY1ad5wBcOYA8eKYc002r+9N3QE4baLEhkfa
	1PtN8385CwcceNodJg5YeWSgLhlm5sDfDUcqHKmThRZS/e9wEyni5kavakVgX6NTHVbx8Y1a99yds
	XNITMglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNOg-0000000C4wP-3DnH;
	Thu, 03 Jul 2025 17:06:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKvO-0000000BfUM-0GqQ;
	Thu, 03 Jul 2025 14:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751552910; x=1783088910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdOiIKGzccCM8RErNFNe99zd9fwOK9DCthug8lO8Z6o=;
  b=IwNv9E0U6NE3SWqn75Xn1WOU5gl+/0Q8P1MmZ8G+YPwF/mUO104WrId5
   uUTAilObIzCLF8+sBqO4X7Ne5jG7NagUAWLnuKsK8HVPDrCtXcEk2MWsS
   DYJiTpQdLKBTaRBNx70QMGnyQ+bzNzZRybJo+zP7VfrgvisiItkbsp80n
   hVxAON3e5v0oAPYl03S80l6da0PwNIVxW6UVOVU41+07JAouvZBusRM1d
   G34Y/c7oEs0H2Xrled9Gd2DIkxBaFruVCVhb9Qao3UDiq0GfQLcsj47Yt
   063RGyPYK6AxB30Sbe3wvLd/3d0xq8EARWALvSGZhF0okUnbDfLr1UGFD
   A==;
X-CSE-ConnectionGUID: q94PEfKORtWE8LzUuKvbzg==
X-CSE-MsgGUID: 4UDKyhXYSo6Hf4DjMmIb/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76428403"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="76428403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:28:29 -0700
X-CSE-ConnectionGUID: CYkZp2T+SbuWhmncdTXPFw==
X-CSE-MsgGUID: WO/ooU8XSsS2eIyewNFEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154750352"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:28:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uXKvG-0000000CE9C-0huU;
	Thu, 03 Jul 2025 17:28:22 +0300
Date: Thu, 3 Jul 2025 17:28:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/6] iio: adc: mt6359: Move reference voltage to
 platform data
Message-ID: <aGaThTSAriz46D7T@smile.fi.intel.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
 <20250703141146.171431-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703141146.171431-5-angelogioacchino.delregno@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072830_147367_AF2448C1 
X-CRM114-Status: UNSURE (   9.04  )
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

On Thu, Jul 03, 2025 at 04:11:44PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation to add support for new PMICs, add a `vref_mv`

I still think that the vref_mV is a better naming.

> the AUXADC_VOLT_FULL definition.
> 
> As a consequence, the definition was also removed.

-- 
With Best Regards,
Andy Shevchenko



