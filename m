Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84044CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3odjPKg0raewtAWyX2qeq1zPtEEMLRG1OzYoFe5p0E=; b=rcemHI3wiwH15JyCJEJRpKhvmx
	8TNQQAWD1RuEzvqHh1FS8vVYp1yfmt2QkE+bhLdvh+N/fMA7PMTAyjWsgF/T93a7etY1jZGuk+0lP
	L7u6hpkHSnYl0+ETXY9T1KSKDQCYnV7SnrrLVTBpG0trlxt4t3P2ktWopft8Y9ggwJkL9TdyW55Ia
	P0grAfIKkATt44VFMT6OoF2+PAFJfucyuAkozAL+gljW0/zLNr0GWMOtyLwSJ6ZqH/CSPVr+crCab
	nbEP95DdP+0aBndmKw98SO9wb5vg32MeJ11AxKrD0jBjQudVZiP/pNTKKJIo0hkeP6Xr2XO28d/mc
	tN+vE6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYiw-0000000B05Q-1sd8;
	Fri, 02 Oct 2026 08:34:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYit-0000000B053-3dhv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790930072; x=1822466072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KlofZvJbEKRfC9/pPIiIB0BQQWbJgdRDIvxhFmb7jg=;
  b=dk3zUdNZDTOsvDB0ZcBEBaOb0ZGFlvIZpnKrNlF+IWonw5MsoZnr0Kpt
   kdPDo9cJ9gnvbWoeCi0/DZzr42JVudu2xj8dAcAlRTahIP/sEcXCy6wDd
   1eNrDtSQaO6lZBZV9UN17lmk/l8mEmt6TuGzOai7sse50Ia/iAX/yuKQe
   zEZw2kOCs0LPDIgUcJloL/Zo3A+KzV4nF8sHYyomZS7nwzpePcuRQNB2d
   y0lLDzfPbOxdMn2OUFNcNhoNNrK4sNBmaWYfNK9mjxcd92uGVl14Y7Y3w
   5kyYePJrYSy8oKueEJnTbvDoEM6nx3k2jSRXlNOStaLISKaxlUPNKzHXv
   g==;
X-CSE-ConnectionGUID: u/WkKmQjSICzIk3TvIbi+A==
X-CSE-MsgGUID: 9bXE28+TTSSzc/N4si2VVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102369782"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102369782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:34:31 -0700
X-CSE-ConnectionGUID: D+ozLVgTQLWiIdHdGnSY6Q==
X-CSE-MsgGUID: oWQTTd30TXKky1l7gTyKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304166086"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:34:27 -0700
Date: Fri, 2 Oct 2026 11:34:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: aspeed: Use syscon phandle for trimming
 data when available
Message-ID: <ar9skaV0Vii8oX6G@ashevche-desk.local>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
 <20261001-ast27xx-adc-upstream-v2-2-2f9c15cc0064@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-ast27xx-adc-upstream-v2-2-2f9c15cc0064@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013431_920734_1BBED62F 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, Oct 01, 2026 at 05:50:37PM +0800, Billy Tsai wrote:
> aspeed_adc_set_trim_data() locates the SCU holding the ADC's
> reference-voltage trimming data with of_find_node_by_name(NULL,
> "syscon"), a global search that matches the first device-tree node
> named "syscon" regardless of which SCU instance it actually is.
> 
> On AST2700, which splits its SCU into "syscon0" (soc0) and "syscon1"
> (soc1), both nodes share the same node name "syscon" and only differ
> by label and unit address, so the lookup always resolves to syscon0
> even though the ADC's trimming data lives in syscon1.
> 
> Use the new "aspeed,trim-syscon" phandle property when present to look
> up the correct regmap directly, falling back to the old global by-name
> search when the property is absent so existing device trees keep
> working.

...

> -	syscon = of_find_node_by_name(NULL, "syscon");
> -	if (syscon == NULL) {
> -		dev_warn(data->dev, "Couldn't find syscon node\n");
> -		return -EOPNOTSUPP;
> +	scu = syscon_regmap_lookup_by_phandle_optional(data->dev->of_node, "aspeed,trim-syscon");

Do not dereference of_node, use dev_of_node(), it will help in the future
if we want to reorganise firmware nodes in the struct device.

> +	if (!scu) {
> +		/*
> +		 * No "aspeed,trim-syscon" phandle: either a single-SCU SoC, or a DTB
> +		 * predating the property. Fall back to the old global
> +		 * by-name lookup for backward compatibility.
> +		 */

So, why not doing

	struct device_node *np;
	const char *propname;
	...
	np = dev_of_node(data->dev);
	propname = "aspeed,trim-syscon";
	if (of_property_present(np, propname)) {
		scu = syscon_regmap_lookup_by_phandle(np, propname);
		...
	}
	...

?

> +		syscon = of_find_node_by_name(NULL, "syscon");
> +		if (syscon == NULL) {
> +			dev_warn(data->dev, "Couldn't find syscon node\n");
> +			return -EOPNOTSUPP;
> +		}
> +		scu = syscon_node_to_regmap(syscon);
> +		of_node_put(syscon);
>  	}
> -	scu = syscon_node_to_regmap(syscon);
> -	of_node_put(syscon);
>  	if (IS_ERR(scu)) {
>  		dev_warn(data->dev, "Failed to get syscon regmap\n");
>  		return -EOPNOTSUPP;

-- 
With Best Regards,
Andy Shevchenko



