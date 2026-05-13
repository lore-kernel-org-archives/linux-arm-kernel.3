Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F2CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/8KQY9AZ2MgnmlvrkySNiD6OvsOjNfWo9JevZKubrk=; b=cQhfaNxKDdpKUgCpHxlX8mRwj2
	XvhXCnHZ0Uh5lNedKAkSonz7fps6eXI7rKB1g4QAS4hPdnHRrJsqHNA2GEwZvjNZ/hFJ0DafnnTtd
	BUpMDN5PnRtUdeW66rqezKikSbEOnxh9CFxQfDHfIT9E0b7gj9AmdZbHit8XtjJf1Vo8g+BwlDwTL
	xdQ9WW6vd7jWPHou/mzSoOiSLM7CpEp2nDVyL3qu/CU9k9o0TJQgFQ383upC2KFrkq465/lfH2tL9
	yuzXj4h0ZXasEMjdu4VzaSP3i0TY5UlP5TVUoAQJmtTzuADsmqr55LRp9qqP4awUXybd5rhp6Wpka
	5wO9rjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7Dz-00000002Got-1P2Q;
	Wed, 13 May 2026 10:53:59 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN7Dw-00000002Go7-1BjW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669636; x=1810205636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1AxrIZee8mUjA5ewU8xipjThvn2WeWg0jk/1WI0ykVk=;
  b=JQddftd3UdHADdVVAGu4HFvqcSDYeZKSh/1ICbIQ6hEZrdBQQybDn/iF
   O5xnO4U0/Wa+YpYxlEZT6kSjqBDiHINZH6VkyOVNHc9ZyK/tpTj0hoZBR
   oFwCl9UmfT3lT+ddIpqZG50kwNDN0RAIHh82xcx5OHfOvNY5KIJtUmJeZ
   TmiP3EwI0ojDGc2c4NFIjlEJIKUFIY0e/WavXPxguJdJ4HBNyv7b5Oo2n
   LYBnQPUujThtJwPjlWVvKQFzrEggKkdEzBeGTJAEbNwZwNCj+zz7j1XS+
   2hQHbHwRB5M6u5P+K48PtLXDnIASnDxFv2NAh9gXLmA6WSHD94WDj1Rv9
   w==;
X-CSE-ConnectionGUID: d7aI4c5lQU+u/IZ/z1ZOoA==
X-CSE-MsgGUID: NWsaTRi8SPmGT+/NA17iDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79449521"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79449521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:53:56 -0700
X-CSE-ConnectionGUID: XPRGVeq3Rmy5HvACLGK81Q==
X-CSE-MsgGUID: ayfzuQmoTYq7p7cJC1RroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231665666"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:53:53 -0700
Date: Wed, 13 May 2026 13:53:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: sun20i-gpadc: support non-contiguous channel
 lookups
Message-ID: <agRYPp5JQ3CyCQHJ@ashevche-desk.local>
References: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_035356_339723_713AE398 
X-CRM114-Status: GOOD (  13.97  )
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

On Wed, May 13, 2026 at 11:51:31AM +0200, Michal Piekos wrote:
> Using consumer driver like iio-hwmon which resolve channels thorugh
> io-channels phandles will fail for sparse channels because IIO core
> threats phandle argument as index into channel array.
>         eg. <&gpadc 1> will fail if there is only channel@1 specified
> 
> Add fwnode_xlate which maps DT phandle to the registered channel whose

.fwnode_xlate()

> chan->channel matches the hardware channel number. It allows sparse
> channel maps to be consumed by drivers like iio-hwmon.

...

> +static int sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> +		const struct fwnode_reference_args *iiospec)

Broken indentation (I understand the motivation to shift left, but I leave it
to Jonathan on how to proceed with this).

> +{
> +	int i;
> +
> +	for (i = 0; i < indio_dev->num_channels; i++)

	for (unsigned int i = 0; i < indio_dev->num_channels; i++)

> +		if (indio_dev->channels[i].channel == iiospec->args[0])
> +			return i;
> +
> +	return -EINVAL;
> +}

-- 
With Best Regards,
Andy Shevchenko



