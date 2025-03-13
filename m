Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64297C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fjmg6y6epERkmCFEdU9cZzXStizJ6iZ4h+Z1Q4QWRvk=; b=uwLDUCccLjv2yJGvyk3XNZmt1s
	HYoG67nXQXy6Qcoq2xfLrjAVlGhW1G/keMNxeLDbSityY8L+udUnWOhUJ6x15P2lvlyqh2viUpAx1
	jhz6p2B8ejPTPgfuINfCHMjnBWLJArKMiKb4aQkLv0W6JyMkpbehzFJ89So3AkU468D+DVPFE8pKq
	XLd7lnBbuH90o+Si3tZ9+qoMigNsbk6TkEhii6u3IxDt9QBsqMiGd0YOiB1ni/li0qySKS0AyBvLX
	MC5+kUOonGjro29jY9RZweiEMfwtD3gITTVx7Ct06jU6ooBnnAAHGDskfJai6EieR59ccJtO/38l6
	L5VuFj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshkU-0000000BFey-2o9i;
	Thu, 13 Mar 2025 12:33:18 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshii-0000000BFQh-1gES
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 12:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741869088; x=1773405088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SaIYexesddvO0UWpmRz0MzTzyVkL/mdX/8rqZt/hSb4=;
  b=hgzDi35JTJqmywopeUpr27IGiRGw+iv7PXHfmbkxZ046+ozsxLa3p/Cq
   EA2qdB0CNqz6vjEXghAGAOXpWWWt/KxsbnZ62vlrwNZevf8EUtDyjEwA8
   Xi8EOmEzMAsC7htI+X+1FrgKNgw+WPl4E0ePSZjsfH2x4zglyPgMmnSH+
   eaaZZkPiSd6GmyJOXniR8pMhjbmceq7iOOFvBNis8LpWekPI3Qs1seoy7
   H+YbDAQ0Cg50lNavFiqUOQZNTVdD7VC5MXeL4G4dWkPooqhES31Y+MNNr
   H4AUHGfn/INIhEM4x+NKWHAnSN4Ww8bxz4j5NvIneQRtbGaUwpqP1FgTa
   w==;
X-CSE-ConnectionGUID: AJG2d82AQ724N6zyQA609Q==
X-CSE-MsgGUID: pEqjqZIdSOavJlJpHJ1NAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30571974"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="30571974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:31:27 -0700
X-CSE-ConnectionGUID: jQelpd4eTZ2rpBfxbdM9hA==
X-CSE-MsgGUID: JO4NOY5VRgq94b7DdOX/ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121441131"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:31:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tshiY-00000002Aba-2whI;
	Thu, 13 Mar 2025 14:31:18 +0200
Date: Thu, 13 Mar 2025 14:31:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_053128_459115_AC2E0376 
X-CRM114-Status: GOOD (  19.77  )
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

On Thu, Mar 13, 2025 at 09:18:18AM +0200, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.

...

> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
> +					  const struct iio_chan_spec *template,
> +					  int max_chan_id,
> +					  struct iio_chan_spec **cs)
> +{
> +	struct iio_chan_spec *chan_array, *chan;
> +	int num_chan = 0, ret;

Unneeded assignment.

> +	num_chan = iio_adc_device_num_channels(dev);
> +	if (num_chan < 1)
> +		return num_chan;

This is really interesting code. So, if the above returns negative error code,
we return it, if it returns 0, we return success (but 0 channels)?

Shouldn't we do *cs = NULL; at the case of 0 channels if it's a success?
(Under success I assume that returned values are okay to go with, and cs in
your case will be left uninitialised or contain something we don't control.

> +	chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
> +				  GFP_KERNEL);
> +	if (!chan_array)
> +		return -ENOMEM;
> +
> +	chan = &chan_array[0];
> +
> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
> +		u32 ch;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
> +			return ret;

> +		if (max_chan_id != -1 && ch > max_chan_id)
> +			return -ERANGE;

Hmm... What if max_chan_id is equal to an error code?
Or in other words, why -1 is special and not all negative numbers?

Also note, you used unsigned type and compare it to int which,
in case of being negative will give promotion. The ch will not be
big enough in most cases (unless it's great than (INT_MAX + 1).

TL;DR: you have a potential integer overflow here.

> +		*chan = *template;
> +		chan->channel = ch;
> +		chan++;
> +	}
> +
> +	*cs = chan_array;
> +
> +	return num_chan;
> +}

-- 
With Best Regards,
Andy Shevchenko



