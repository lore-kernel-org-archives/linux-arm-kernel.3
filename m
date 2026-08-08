Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E5C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 20:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW3/wHK6arLrbCF7ZYUm52uQhZiuFpzDxuofDG4/EkY=; b=GP+yEUyTjrpI38VrIEKAmMPaFD
	RZD5Oc03DAyDk+1BOesi6H4dEWtKSmY8np2wq7aFTVwKExZE10sq2171sHFVwg9oqajZ5o7wQdPK/
	5nSxceyN0u+jwCTXA2m8ShEMzSw/pt04Q6FnUr8Gr4OBwm9Bdl5qe5yJ/4OPnVGNlvtXveLJaiqA9
	oQpnPCiCRVhBF//Ze/aGoOnRqsgyK8n19R37s30/5lmAEQOk2X1bp80RxGCXd7tDbIKEJlcQPrIxI
	K0zTHdKkEf0Pl1PdjObTrvlmQpO0QM9GvNDf4jEH3vl5ltUqHUafzABA2ghftZ/YXgqhoN2AF0QTH
	Ia3BObBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wso1u-00000009jUK-00t5;
	Sat, 08 Aug 2026 20:52:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wso1r-00000009jTz-2AsX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 20:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786222347; x=1817758347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udPPUG7YUJ+eyh17qdQwjE9kRRrsNEriEz/GGK9oFgA=;
  b=an/uot9c22hPborTwM1zNbK2CW7eTNJ5IIO3NV/ABWBXAusJ5ag4165m
   M40KdwS2TK2SBRZncYaPZe89pf6h27jgtTjeydggc+uwIdNAq/SINWXQk
   vDp233MM+MzAMSNJczD50GUvqEv7XwkjmBhsC7l5Z/ct1jOKjshYIZG7b
   KSo8gddjLIAmqUrDBNp+kQT1BIWiQXBbHhohSiNSC0nYA3PZ+m35HrOTt
   kSvrdxNe1xLzqsgPF2UvfacLkLokJMIyS3WTuP1z5k1q4/8wZSALa3yWS
   4d9PGJZzZZrDdXLayiA8upgCL6aECdpTwI8xmccTqh2E3qwJefyGaEER6
   g==;
X-CSE-ConnectionGUID: aAE0wnq4T1a8sRZ4Qi+xFA==
X-CSE-MsgGUID: +j+OWAsXT86m2nufGqzv1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="112341519"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="112341519"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 13:52:24 -0700
X-CSE-ConnectionGUID: qcZMscCWQk+11TuVWfxZow==
X-CSE-MsgGUID: o3UoJiz5RGmlvoWW3BCrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="287378575"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 13:52:19 -0700
Date: Sat, 8 Aug 2026 23:52:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, radu.sabau@analog.com,
	joshua.crofts1@gmail.com, jorge.marques@analog.com,
	Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
	antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
	mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/17] nvmem: microchip-otpc: nvmem: microchip-otpc:
 add tag-based packet lookup
Message-ID: <aneXAPGifAS2PG9G@ashevche-desk.local>
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-10-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806074024.531259-10-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_135227_571203_7EAC2C5F 
X-CRM114-Status: GOOD (  19.12  )
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

On Thu, Aug 06, 2026 at 01:10:16PM +0530, Varshini Rajendran wrote:
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
> +
> +	for (i = 0; i < 4; i++) {

	for (unsigned int i = 0; i < sizeof(tag); i++) {

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



