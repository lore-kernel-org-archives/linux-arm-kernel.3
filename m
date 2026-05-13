Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AE3CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5We9s78McuChj9eMnGuhN39kzMN2bKZbMwAl8YuxDw=; b=YojmgrQoupj577ckUphvEUQWTC
	y3xz2kxDDwaMMZa1ipo34GPcvnHaDZLrA2/OFJxCo3ioWgj1KQSKx7OED+3lq391qbQ/5PReO9tdj
	GKA8Dd0vjtne2d67PcNfBaawQnFbqJJ69k0exffsGYQBpfXljMWUVcsodh2gPvUF3WbbLQ933XQ+2
	mcpzhMKlFZ4l3NFQWuQfU7nks4Vm5oG3r5z8ihZYPhBn6+BBWfBHlTkTB1Q0F8/B3QFU5Lo63RzlQ
	wucW0uDkbCcJt1cViqS+2HD34QH/F22EoY8puz1FH0Kd98hJjs01KEDpnY/QUyVmHykXHjVffJFBr
	irc9WLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFuk-00000003f8j-3B08;
	Wed, 13 May 2026 20:10:42 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFuh-00000003f8D-3pcK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778703040; x=1810239040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+q1v693MAGcslpV1s79s1V0yzFFNOoetpgIGymEEQmw=;
  b=cTwM9ebSBuOdw3LEfji2JH2MEpCGb1oZmH2JIq5ZsB8oz3iC8QrXneje
   0pwj2tOOQH5qu2X9d+0LwNcICenj9KoabVGBY2KCHW1jLbmjqvshkktG5
   1CDakaL1noudmJpZpOHOXaU1yKMbCWlSKMFH2r60ZbJxOQFQRjeH4/P5q
   1XcKrCoOuP2XjuALas2ZYCi2Vzb9TGY6mO+Iqm4lbSyw9MPCOgJBjfvwp
   jwiUwVsnEwuW3GocykZLHhPu5oqLAwOYNrgNKqdIG8UD6NYlfHr9PrUff
   jiLdCNM70+IfcsuzrGWmwpN/bHGiJjPIjJHHvQemARueo60RYUiLKuIkg
   A==;
X-CSE-ConnectionGUID: 0maMO5LwT46gOpufW3OPmA==
X-CSE-MsgGUID: lY2KjP1oRCaIdOiZnq0/Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78783756"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78783756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:38 -0700
X-CSE-ConnectionGUID: hqPYoZtcREGRjllT8qq3pQ==
X-CSE-MsgGUID: TvHpd68SS9OV9CIROPU+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237317710"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:10:34 -0700
Date: Wed, 13 May 2026 23:10:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: sun20i-gpadc: add A523 gpadc support
Message-ID: <agTat6mAnrf6uJWH@ashevche-desk.local>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
 <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-2-d5efde151dac@mmpsystems.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_131039_966223_951C6C25 
X-CRM114-Status: GOOD (  11.12  )
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

On Wed, May 13, 2026 at 06:59:43AM +0200, Michal Piekos wrote:
> A523 differs from existing sun20i-gpadc-iio by having two clocks; bus
> clock and module clock.
> 
> Change driver to enable all clocks.

...

>  	struct iio_dev *indio_dev;
>  	struct sun20i_gpadc_iio *info;
>  	struct reset_control *rst;
> -	struct clk *clk;
> +	struct clk_bulk_data *clks;

Try to follow reversed xmas tree order.

>  	int irq;
>  	int ret;

...

> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock\n");
> +	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret <= 0)
> +		return dev_err_probe(
> +			dev, ret,
> +			"failed to enable clocks or no clocks defined\n");

Is this done by clang-format or so? Please, don't do wrapping on the open
parenthesis. Also note for more than 10 years checkpatch does not complain
on the trailing string literals that go over 80 characters.

-- 
With Best Regards,
Andy Shevchenko



