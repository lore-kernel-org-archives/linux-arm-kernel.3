Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE71CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljC0rX/6kR+YLwHCh+ohNYlzkNz2nTF18vqzelk0SCQ=; b=NQQqxmtU4IjKYl/NeqX12Trxem
	9L9qKvsUx13GdtSmSileEm7oEC9a4vxtfX36PkOLfClTy/JVfcLYRenvoyjw1rvUUkqCD+gBk8BAS
	DFFn+ASt3Rz0KYKqp20teN0q00QFTKJEF9s/fkcZ5PyofPHboXHfmXBpJd+Vj6C4Af4yzDsSlWITN
	0/J4JpXmpGDTSIL9rFtreqnItjmPPG0qCN7x1YWokp0IbCU2ZEIA3Pm8f/aYQ2mL2r0dZshLlZEho
	lVwYGT5xZmBQz5ZhoWjaq6mdYuWmcKkoS08vZb5JGsOVHljY8k5zqjSVjSkbNz0SXQMIanR5I5UTO
	sAOSNBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAhN-0000000FTKg-2Y8D;
	Tue, 05 May 2026 08:00:09 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAhK-0000000FTJ0-3CGd;
	Tue, 05 May 2026 08:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777968007; x=1809504007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e5TdMMMshQ/NUER+c6FHekX5QCigzt9bH/+8TPl1gr4=;
  b=NslxZJSFxswAMOIt5yPZ6dLo7q1JgMIq/WGlegkwuVA1WHlIUml4wB9h
   3JCysagYIstCNZNBO/ybhKaWDpRnzyaFfusYS0mdb7D4M6vyOo3yaGTNQ
   1H0gLmsXFa3N7kxUnMzYf/9mtMY45emwwDDMmmtxJtfO5I3CdhkUF4mXQ
   2ZyHZumvhwH1OTRzHUPX7DycAFN1rPPTUK5zfXdQW1MJljq4IkttJWMwW
   0y0/MmQkZes1SkunyRjtAY0yOZe6ijsffOH/ojkg0eGuxzMvj8IPs6JXx
   l5jKIBN0CCWJbogTIpr1uuOF0lC3k2nEUKK8KWxfirUwXF+UZcwtZpeKr
   g==;
X-CSE-ConnectionGUID: HnMLZE/oQY6dEAkGHr/iJw==
X-CSE-MsgGUID: PoVdb/SGTgiqUKUItR8anw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="101498995"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="101498995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:00:06 -0700
X-CSE-ConnectionGUID: hxN2Bkm8R72rAe/47L/e8g==
X-CSE-MsgGUID: 9D/82zBaSFapcfnhxHpoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="266089021"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:00:00 -0700
Date: Tue, 5 May 2026 10:59:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 05/13] nvmem: add mt6323 PMIC EFUSE driver
Message-ID: <afmjfWtt7Vii6xfH@ashevche-desk.local>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-5-799b58b355ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-mt6323-v1-5-799b58b355ff@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_010006_874841_41535C95 
X-CRM114-Status: GOOD (  17.45  )
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

On Mon, May 04, 2026 at 09:24:57PM +0300, Roman Vivchar via B4 Relay wrote:

> Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> thermal sensor calibration values.

Besides below comments, check for the similar issues that previous patches in
the series have.

...

> +#include <linux/device.h>

Not needed as platform_device.h implies this ("is this good or bad?" is a
different story).

> +#include <linux/io.h>
> +#include <linux/mfd/mt6323/registers.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

Follow IWYU. At least missing types.h.

...

> +struct mt6323_efuse {
> +	struct regmap *regmap;
> +};

Do you really need a custom wrapper data structure? Can't regmap be used
directly?

...

> +static int mt6323_efuse_read(void *context, unsigned int offset, void *val,
> +			     size_t bytes)
> +{
> +	struct mt6323_efuse *efuse = context;
> +	u32 tmp;

> +	u16 *buf = val;

Really? CPU order all the time?

> +	int i, ret;

Why is 'i' signed?

> +	for (i = 0; i < bytes; i += 2) {

sizeof()?

And since 'i' is used only inside the loop

	for (size_t i = 0; i < bytes; i += sizeof(*buf)) {

> +		ret = regmap_read(efuse->regmap,
> +				  MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> +		if (ret)
> +			return ret;
> +		buf[i / 2] = tmp;
> +	}

+ blank line.

Isn't this reimplementation of bulk read? Why the latter may not be used?

> +	return 0;
> +}

...

> +static const struct of_device_id mt6323_efuse_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-efuse" },
> +	{ /* sentinel */ },

Having trailing comma in the terminator is nonsense. Do we expect anything
behind it?

> +};

-- 
With Best Regards,
Andy Shevchenko



