Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A94CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 18:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jAWN7k7t02orWRY0qbvN/AjQukJfCyfGtVSiZx1COw=; b=JfGzx52UTbNnqhR8m4bM2ztYHD
	G8fnNWOXnvaK7doS0NIvGRYPbPmmvnXVCCLMGVMIULLv2TPyjJcKWp34DI/Rq4DF3wlwfb1okFnBr
	aSJ7vGbtFI6UdkP7ke3e4XnmaSsCeKOaoDvTOYf1GofssR91RhNtEdM7r4VG0NSsKrmHKVjEQz4LW
	weSnpDfE/u1hjXwHV5UkBk88tX0uBhvZmHfGJT3ZbuZpyWIZbtMRhG5LdYCx2Acel8TplWyyrChy5
	6lTrPIRK0BZChNtiSjX7Xts72k0jGupkohRDeUjMVGP73XsCFkBLC/WDOn5YZJs913OGH5Y6CzeKb
	CFdGL65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5uJ-00000006l12-3GtI;
	Tue, 23 Jun 2026 18:31:35 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5uG-00000006l07-3vOK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 18:31:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782239493; x=1813775493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/CHkWCxKFKJxBpWJ4OZug3VCBnEclX5h1FZJe5iM2DQ=;
  b=i/wFR9qeZ/0Iu2TwNpRrAYsjFo4TNokd4T3+99fNNGrfHdCsE4sAF5Gs
   6VjeUWISKgAPjLEy6KNSJFDufaTlkd0CDP4JlSoCzKP//Uz/xSV1/T72C
   PEsZ9BH3mudajzLPDxEZqPUqUp8amXZJ1oURw3sOIcQcVa/ZRVm8V4sm2
   4IUBkGQSivYOlfgl1Q9Eu/BqnWDecoHa8D+77UHMBKw6lth3GDq+nnAac
   y+4qZBLCI9qnW2TrC1+HUq/7kgM0fZsodW4lAFwAH3j5KqBhq+pOWm48i
   ULzM61nGL5eJEDf8fVYAWXLYz4dPQrSSReRiDyCFtfmfkcGTCbKrbDNYp
   A==;
X-CSE-ConnectionGUID: M3x+XOxRRF6QeVgyF7rEtw==
X-CSE-MsgGUID: Q9FMfsvtSZSme/9mzvtA9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94110575"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94110575"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:31:32 -0700
X-CSE-ConnectionGUID: tEX+s1a8QDyOsWxvD4ZH/w==
X-CSE-MsgGUID: ac9PgAfZRaKbo7qcpLsHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="273285631"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:31:28 -0700
Date: Tue, 23 Jun 2026 21:31:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] nvmem: microchip-otpc: add tag-based packet
 lookup
Message-ID: <ajrQ_WWkHYC9seDq@ashevche-desk.local>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-6-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623105944.128840-6-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_113133_086750_6E975DC8 
X-CRM114-Status: GOOD (  24.53  )
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

On Tue, Jun 23, 2026 at 04:29:37PM +0530, Varshini Rajendran wrote:
> Add support for accessing OTP packets by their 4-byte ASCII tag while
> preserving backward compatibility with the existing ID-based lookup.
> 
> The OTP memory layout can vary across devices and may change over time,
> making the packet ID approach unreliable when the memory map is not
> known in advance. The packet tag provides a reliable way to identify
> and access packets without prior knowledge of the OTP memory layout.
> 
> Two offset encoding are now supported:
>   1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
>      Used in DT as: reg = <OTP_PKT(1) 76>;
>   2. TAG-based: offset = 4-byte ASCII packet tag
>      Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> 
> The driver resolves offsets matching valid legacy selectors (multiples
> of 4 within the packet count) through ID lookup, falling back to tag
> lookup for other values. This ensures existing device trees continue
> to work while enabling new tag-based access.
> 
> During probe, packet meta data including the tag is read and cached.
> The driver also validates OTP memory accessibility and emulation mode
> status. When the boot packet is not configured, emulation mode allows
> access to the other packets. When both are not available an
> informational message is logged.
> 
> The stride of the nvmem memory is set to 1 in order to support tag based
> offsets, comment in the header file is updated accordingly.

...

>  #define MCHP_OTPC_SIZE			(11 * 1024)

Side note: At some point maybe (11 * SZ_1K) with help of sizes.h?

...

> +/**
> + * mchp_otpc_resolve_packet() - resolve offset to packet
> + * @otpc: OTPC private data
> + * @off: NVMEM offset (legacy ID-based or TAG-based)
> + *
> + * Legacy offsets (multiples of 4 within valid ID range) are resolved
> + * through ID lookup. Other offsets are treated as 4-byte ASCII tags.
> + *
> + * Return: pointer to packet if found, NULL otherwise
> + */
> +static struct mchp_otpc_packet *mchp_otpc_resolve_packet(struct mchp_otpc *otpc,
> +							 u32 off)
> +{
> +	/*
> +	 * Legacy id based packet access: offset = id * 4
> +	 * Inside the driver we use continuous unsigned integer numbers
> +	 * for packet id, thus divide off by 4 before passing it to
> +	 * mchp_otpc_id_to_packet().
> +	 */
> +
> +	if (!(off % 4) && (off / 4) < otpc->npackets)
> +		return mchp_otpc_id_to_packet(otpc, off / 4);

Hmm... I was thinking about something like temporary variables for these two.
Note, in some cases the compiler may issue a single instruction when it sees
both together. That's why in many GPIO drivers we use something like

	unsigned int offset = foo / 8;
	unsigned int shift = foo % 8;

or similar.

> +	/*
> +	 * TAG-based packet access: offset is a 4-byte ASCII tag
> +	 */
> +	return mchp_otpc_tag_to_packet(otpc, off);
> +}

...

>  {
>  	struct nvmem_device *nvmem;
>  	struct mchp_otpc *otpc;
> -	u32 size;
> +	u32 size, tmp;
>  	int ret;
> +	bool emul_enable;

Perhaps keep the reversed xmas tree order?

-- 
With Best Regards,
Andy Shevchenko



