Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F2EF8FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcPcjxeukKsYB7IDVAKVeqvBRVav0s7BSZS7nHb+R2g=; b=bm7m8ee4arHNPtNr+WdSnTytMr
	CPDz1OMvWkw/1ADE0OPEVDNSqXzogNET1Ms+YzmQX6fpCDT1bLvOqdfU6sRp4gD4ngp8wn4tiMdwz
	5oc8rQNd49hIcG6tuT48DY/YbACBhfCcdqowqhvJN4XrJekhhjoL7VXp/YmjEXlqDyn/ZIaIIELit
	QxRUoTZw/Gg0ri+OXxXGYTIr019CT607ilt35XvclFLfdf8pGnwWVB80uv2RF6XhqtWUVqD4K69Ha
	Dc+ii85wOzB6B3BdlOvIGydHYrne+JdlX8MBfOIJ/OLYtUxf5XGpFI+xTDVaRj4G4EB+4EXWAXs5r
	gGIpof9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmSZ-0000000HGRH-2Pbn;
	Wed, 04 Mar 2026 13:40:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmSS-0000000HGQh-3dog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772631612; x=1804167612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsf7B5BIfmLnSGKb0te7TGmSKf659fCCwB8op44vRBc=;
  b=lmARoB0BcgngBphzdb7arS0CxSQfY7RxXTPr1BtEZsXrjLxx/KsIGoKR
   6/Y3iK3vhk/sSJWmpTTEcaWeR0sHdhliC2xcl8f8l3UVtnz4I0IdniEJT
   8B9nAZ4aqZ8z7QNO5WxECdHTHaqf7VFOO35b+XQLyYfhiR/GQ+vExiBe6
   m+rUEh0pNANRnIMQmY7y7Go2jPOI/9MKgUwUh9Jx9YG1k2LakSV0L5ph7
   X6UD3SGlW9VkxzphiJa5bNwdKHmgXX0TIHLnm9eH3Fne8d6tL+UFd0Ki2
   Zt/u3uXGi361J0GCPuPGD3K8dU/9jM/Nn324wqZ9UgwdF40Q5CGUugzlF
   g==;
X-CSE-ConnectionGUID: /tbjaeKVQ16U+enugNoUxg==
X-CSE-MsgGUID: QkRTMn1/TEGtRaLT/5U9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73388962"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73388962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:40:11 -0800
X-CSE-ConnectionGUID: G3suj1SrQaS914RpDC0FCw==
X-CSE-MsgGUID: 0pq5Dn1tS4W65Mys0QLAQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218305788"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.127])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:40:07 -0800
Date: Wed, 4 Mar 2026 15:40:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Christofer Jonason <christofer.jonason@guidelinegeo.com>
Cc: jic23@kernel.org, lars@metafoo.de, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, michal.simek@amd.com,
	victor.jonsson@guidelinegeo.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
Message-ID: <aag2NQTBysQYMU--@ashevche-desk.local>
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_054012_945160_05E3809E 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Mar 04, 2026 at 10:07:27AM +0100, Christofer Jonason wrote:
> xadc_postdisable() unconditionally sets the sequencer to continuous
> mode. For dual external multiplexer configurations this is incorrect:
> simultaneous sampling mode is required so that ADC-A samples through
> the mux on VAUX[0-7] while ADC-B simultaneously samples through the
> mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
> VAUX[8-15] channels return incorrect data.
> 
> Since postdisable is also called from xadc_probe() to set the initial
> idle state, the wrong sequencer mode is active from the moment the
> driver loads.
> 
> The preenable path already uses xadc_get_seq_mode() which returns
> SIMULTANEOUS for dual mux. Fix postdisable to do the same.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



