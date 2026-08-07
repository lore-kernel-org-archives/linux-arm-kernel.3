Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6811C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADKYK61uwD3vOJ4FyynAd2jPqClwCE/ra1ysXe5V4HI=; b=Mhe8ZcuUB4+wYPkeMJpUN3pzBX
	ADEtAsVVjoCCW32Mw0zGjoewcbbCO4w2fj/lgcX+eLBEIhEo/oUUO2Unh9JAG/xX2Z8nCWEsfTYqM
	botVA0/UNMZIIyspPYgxAuYVXSZ7S0SDGqz3O0X0BILhMOIYVvYsDkrMCFveApt0nSm3rcSz24bnr
	12ClhYaNTqUBYQpm8Ea9LBhffbTqSPMldW7k2rmMmD20jPAhJMhGHgY6pl9BRJqCl8WoWvCSRv9/4
	A8qTaJ2fVPv2tsVGUpiazWvjcTTtJUU1ie4GWVhxRYDKxdb8D3sFfye4XySjuGrhrIzWu+ZFCiCbd
	7Ic9CmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws90w-00000006utm-4137;
	Fri, 07 Aug 2026 01:04:46 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws90u-00000006ut8-15zE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 01:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786064684; x=1817600684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1TDGJ8xLMlQRc6WuVobqlf19ekTKvIbqQe4pL8uXtI0=;
  b=jGgK22Ad0VGrLlbFHsl5YC18DUXyJrSTflTalQc2KC7qyDD1UfIZXe9x
   N81Pk5IIRpmc6wLRIJTuAJMjxXwIe+ItekkkO01m04KZmwvdeDPk6YGS3
   gCBE01Lx7njCxVOUvGn83QHKo65IImLQAYg13vLvhc5u68xDJhx5RtxMX
   Py1PdntjC6avaHfCb5AppTVo1b6WqX/XWL8eBnkDRXPgP/kSKtXJaJhrd
   IfETQj7Qdavi6Cu3WC2cKDA2bYbaIjXJT/E41fGiIuJBX/FXNMf7HbvWk
   5n8zzepjm8SOP5NcNEiM3hmoj+mp6gtN+v+NDzs54JW8N7VgIVFfHKxeu
   w==;
X-CSE-ConnectionGUID: VN3x4wR5TsuFZ58fEc+cqQ==
X-CSE-MsgGUID: BDaFcKi8QYmNxgkVr87irw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86524133"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86524133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 18:04:42 -0700
X-CSE-ConnectionGUID: oqw5d/kFQ4Cx6+1qU/2lCw==
X-CSE-MsgGUID: 1RzVVBy2R0S1ycLIoc+apQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="286933851"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 18:04:37 -0700
Date: Fri, 7 Aug 2026 04:04:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, radu.sabau@analog.com,
	Jonathan.Santos@analog.com, jorge.marques@analog.com,
	joshua.crofts1@gmail.com, jishnu.prakash@oss.qualcomm.com,
	antoniu.miclaus@analog.com, mazziesaccount@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/16] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
Message-ID: <anUvI309X_TVQbi1@ashevche-desk.local>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-9-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727122633.117435-9-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_180444_344121_B1E36B36 
X-CRM114-Status: GOOD (  18.77  )
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

On Mon, Jul 27, 2026 at 05:56:25PM +0530, Varshini Rajendran wrote:
> Add support for accessing OTP packets by their tag which is a FourCC
> while preserving backward compatibility with the existing ID-based
> lookup.
> 
> The OTP memory layout can vary across devices and may change over time,
> making the packet ID approach unreliable when the memory map is not
> known in advance. The packet tag provides a reliable way to identify
> and access packets without prior knowledge of the OTP memory layout.
> 
> Two offset encodings are now supported:
>   1. Legacy ID-based: offset = OTP_PKT(id) = id * 4
>      Used in DT as: reg = <OTP_PKT(1) 76>;
>   2. TAG-based: offset = 4-byte ASCII packet tag (FourCC)
>      Used in DT as: reg = <0x41435354 0x4c>; (tag "ACST")
> 
> The driver resolves offsets matching valid legacy selectors (multiples
> of 4 within the packet count) through ID lookup, falling back to tag
> lookup for other valid values. This ensures existing device trees
> continue to work while enabling new tag-based access. During probe,
> packet meta data including the tag is read and cached.
> 
> The stride of the nvmem memory is set to 1 in order to support tag based
> offsets, comment in the header file is updated accordingly.

...

> +static bool mchp_otpc_is_valid_fourcc(u32 tag)
> +{
> +	int i;
> +	u8 c;

> +	for (i = 0; i < 4; i++) {

	for (unsigned int i = 0; i < 4; i++) {

> +		c = (tag >> (i * 8)) & 0xff;
> +		if (c < 0x20 || c > 0x7e)
> +			return false;
> +	}
> +
> +	return true;
> +}

-- 
With Best Regards,
Andy Shevchenko



