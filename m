Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE91C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixzMkuT2wsK+6EL9PnWaaXjCqguB1YXG4PuWxLjqF5Y=; b=YKWh6I6v8v1vGrqL3hQ/Lkl/qm
	FZfyisy2CgVv+m3PdfqGv8hpLtht0axlhCwIOK/CkmO/MLEp/1c9ksc4dHAKyWvjjGAMUU7Q72/0O
	JEVlgJCKC+Lm6eVn3k+7KCzDy3wViT9P0WPz2B12soMJXBBRNL15XpMNYJYZ+qSw+FWOWHQinw6eH
	xhCw2fcsNmDWPNsGeKX/m9AWPyRosrfAZ3/u4vwKGwL1euPqGgnasv4+78zKAYJBKSaUBTXhzcFid
	puUpo3uNUKE1AohyWcvZ36JhpNG76DU+OTbP6oYzejsjS3jH8VmD+TVJ0PlFA7g1HQGuGG7hhhHJw
	MH/LF9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQUb-00000000LIP-0Wxd;
	Thu, 16 Jul 2026 18:07:29 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQUY-00000000LHU-0S1c;
	Thu, 16 Jul 2026 18:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225247; x=1815761247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zU61iR89W7q/QfMisKJJhMrwLX8REl16SCm0WWEqt0=;
  b=fhg61Dh3Wd46gWKL9ZC1SP3bEprBgu6gMBlF4qsHadRjVhOy3FVWlwNN
   SYezHP5o2yzSK8CYU4/0+E4u7a0DCKY+fm+6/0g+Z6DUs8XkpHDdl9qCb
   H4ex7rOtKin9S58jl2YGJ99mnoKO6pN4RChFqocYgfutGOaOVPl1m6Gii
   b8DFSKjTIMLM3XIX3SdPndxx9xqQ3Fm7e9I/dbamc0PRJt3XkU1GQolJd
   fSObOsTDU8VUB9qk8Q1Oojy9jHAzlkzz46+UwKa3Am2axznHfUYF1ux6o
   T2BVJCzYQJv6Wf/nRa5FK5OhN6DTpldeLr3CNwYJ8ObN128OTMGINV0ho
   Q==;
X-CSE-ConnectionGUID: rYbMLO5SQ9iWc5gvj/Kl/g==
X-CSE-MsgGUID: WalfNqL2TLuKMzl/N+G2Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95250927"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="95250927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:26 -0700
X-CSE-ConnectionGUID: APJCwIcNR12AYNk0i8vioQ==
X-CSE-MsgGUID: qNYSOzF+SJGatiaUqRLDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253929056"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:16 -0700
Date: Thu, 16 Jul 2026 21:07:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/4] nvmem: apple-spmi: improve calling safety with
 wrapper functions
Message-ID: <alkd0WWr3KX7MS5O@ashevche-desk.local>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-4-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716142415.28718-4-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_110726_190471_D02A8DA0 
X-CRM114-Status: GOOD (  12.86  )
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

On Thu, Jul 16, 2026 at 04:24:10PM +0200, Link Mauve wrote:
> This driver used to cast the regmap_bulk_*() functions to void *,
> bypassing any compiler safety around incompatible function pointers.
> 
> With two small wrappers, which just convert the void * priv parameter
> into the wanted struct regmap *, we can remove the void * cast
> altogether.

Reported-by: ?

> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

...

> +static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
> +				 void *val, size_t bytes)
> +{

> +	struct regmap *regmap = priv;

No need :-)

> +	return regmap_bulk_read(regmap, offset, val, bytes);
> +}

static int apple_spmi_nvmem_read(void *map, unsigned int offset,
				 void *val, size_t bytes)
{
	return regmap_bulk_read(map, offset, val, bytes);
}

...

> +static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
> +				  const void *val, size_t bytes)
> +{
> +	struct regmap *regmap = priv;
> +	return regmap_bulk_write(regmap, offset, val, bytes);
> +}

In the similar way as above.

...

> -		.reg_read = (void *)regmap_bulk_read,
> -		.reg_write_const = (void *)regmap_bulk_write,
> +		.reg_read = apple_spmi_nvmem_read,
> +		.reg_write_const = apple_spmi_nvmem_write,

I think the proper ordering is to address this first (before your main change)
and update later with const argument. Yes, it will be a bit more changes, but
it will be cleaner.

-- 
With Best Regards,
Andy Shevchenko



