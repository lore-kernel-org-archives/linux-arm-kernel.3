Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D49DC54FD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xtXdCtvlT29zy4+yTo7wp/NBjeAECye+r07j4ZJzOs=; b=40NRK8vQILsWUcgqq8QPItgahE
	Pvwqh1j1ny6bex2nMfKuYF4GQL2bKqkOcBUkp3DlIYBCjVAi7PXXhiISKROeRXgBaG2Atku2c9W5O
	YK2tNLW/waylFjMq+Vh1oYss3RrRUZ8Esd/D+mE2Mypj9KsDls2uiXfTtGG8sxPE/Scx6fRU349YX
	APMzt+MS4yehmPzBynleeOWHp2tTkDnGiLjjOsm+qz/lLrbl5ZOcSRexExrZqCQtCAVT4BqB1uUb2
	in8L46bxcWR7n6FpiWBRmbdRGv1D00vRubbdvzoqgnDWLH5nTcsDxuBR5eoVUjHlL+WKcXGXoKawX
	1no16csA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLH9-0000000DMpb-18tn;
	Fri, 20 Feb 2026 07:50:11 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLH6-0000000DMo5-41Cj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 07:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573809; x=1803109809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+AoRFtzUL4Di9TqIr6oRG/bKUTY7As8hvY/CM5Ll5Q=;
  b=DonsXwmmX3Gqy2NX4cBoFNfu52y1gqdsQ0pL5T+Gf9W8nDPcjwdEkghd
   R8+EH/H14W1twvws5ogMs/Hp6XtGoE6iev7SqQd13s4ZoFnNZ53gYmhmx
   IzgJlfvKJKkuQU6H9jwdiGEQM8kElMWo4o1zimqCuP9HXUkiGMyLtytLD
   DR6pz3Lzp8DjG4BEK1z6xGCt/vvOJjwu8Gi6OJwl9gbwG9laAegu2e/cf
   J8Ru8Xclj71E8RhscdsOfQFHXCwgGBXN5q5xrUS+uAU6WK6Vn7g5iE1ah
   1Z3gEzsiVHTX9k11myhRBYFu0brbBA2ShafJRLg6S9zSrs5rBMxICleu6
   Q==;
X-CSE-ConnectionGUID: QAksga1hTVKBI8OfhijSRQ==
X-CSE-MsgGUID: lXIkE8lwR8qs+0secAFbhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72368105"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72368105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:50:06 -0800
X-CSE-ConnectionGUID: dVA7vvsSTwy3CnrSSKBAjw==
X-CSE-MsgGUID: FbwUmViSRP6JIypUstUI5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="218920013"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:50:02 -0800
Date: Fri, 20 Feb 2026 09:50:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH 1/5] iio: adc: xilinx-xadc: Add helper functions for the
 device setup
Message-ID: <aZgSKB300JRB4yvl@smile.fi.intel.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-2-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220053941.611415-2-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_235009_036175_9C5E826E 
X-CRM114-Status: GOOD (  19.25  )
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

On Fri, Feb 20, 2026 at 11:09:37AM +0530, Sai Krishna Potthuri wrote:
> Refactor the platform driver probe function by extracting device
> setup and configuration logic into reusable helper functions:
> xadc_device_setup(): handles IIO device allocation and basic setup
> xadc_device_configure(): handles device tree parsing and bipolar mask
> configuration

Reformat text like:

- xadc_device_setup():
  handles IIO device allocation and basic setup

- xadc_device_configure():
  handles device tree parsing and bipolar mask configuration

> This refactoring reduces code duplication and prepares for sharing the
> common setup logic between platform and I2C drivers.

TBH without seeing the rest, this patch looks like an unneeded churn.

...

> +static struct iio_dev *xadc_device_setup(struct device *dev, int size,
> +					 const struct xadc_ops **ops)
> +{
> +	struct iio_dev *indio_dev;
> +
> +	*ops = device_get_match_data(dev);

> +	if (!*ops)
> +		return ERR_PTR(-ENODEV);

This is a dead code as it seems that ops is mandatory. So in case if it's
missed it will mean that the contribution was never ever being tested.
If it's tested, the check above is a dead code and hence no need to put
it here.

> +	indio_dev = devm_iio_device_alloc(dev, size);
> +	if (!indio_dev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	indio_dev->name = xadc_type_names[(*ops)->type];
> +	indio_dev->info = &xadc_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	return indio_dev;
> +}
> +
> +static int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev,
> +				 int irq, unsigned int *conf0, unsigned int *bipolar_mask)
> +{
> +	int ret, i;

Why is 'i' signed? Also see below.

> +
> +	ret = xadc_parse_dt(indio_dev, conf0, irq);
> +	if (ret)
> +		return ret;
> +
> +	*bipolar_mask = 0;
> +	for (i = 0; i < indio_dev->num_channels; i++) {

The iterator is not used outside the loop, hence

	for (unsigned int i = 0; i < indio_dev->num_channels; i++) {

will be good choice.

> +		if (indio_dev->channels[i].scan_type.sign == 's')
> +			*bipolar_mask |= BIT(indio_dev->channels[i].scan_index);
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



