Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6590ED3F075
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp8xpYYjg1vhg0pi7Jl+mU+f2ABqLf33nK49eabpdXU=; b=KnBdhLWALma2Hb/iiaWHnjcCHA
	Rh5YiNJsVg84FIeKZs0T111MUx8ToJYOmuHZ59EHLSC0EXxNUD5uRHEjN8XW5bBf057zlVPx6f3W4
	fsR+5QgEaOUdUBc6aHUzDIH0nvGk6U2ekfqcUEP8soe/zfYSaWXw9pwkfEm/tEks8ST6zSkVvb7iX
	GGpBK7ExeUacPEoRSs6Y5Ck+nAkZnZYwq07NiASDJm9tqMY5+hPVtb6s2RenxUaoapU8lqZaY0bUZ
	IQTLwAYF/BsgesPXq5jrjtT98CuhBljuuTx8NdErwffNAirpJppzCosvOnxAW4/aVqRZSQJfXl+kM
	BTCOCLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6nO-0000000GCQ9-02F6;
	Wed, 28 Jan 2026 14:45:26 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6nI-0000000GCPl-0041
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769611520; x=1801147520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Noec6um4sg420tnSvek85Gdh+vG/B7APWADS2BN5M0=;
  b=X0bDYE+PaJtdXN2mBhzAAjKTRwtfhOxBQ8lt8/76AunrDDJhsTjen+Bb
   FI7+9g9rQzfzQvuzm9qlr+vhiPb3y9xiRY4QLvXi1VjbzSbN3znQgKP9Q
   Os2fEPvhZYxUmZ/KHIuoHZEQGMvthU1CnD0F0mHWurHyUo/qWNQ+Ui/tG
   +5Wr+xgrS70UcvSS/7ZaUXCFZk07jlfeo16B9QHD548NtMsEdMai2lxnn
   dphPmsvCczvZCq0puvI7fN7/DQTNgfX+5O8jyiugg6KhmASurp9f2DRxA
   AT8RZRpSG49PdT9wi4/bxvyQruqY9+qZAT6Oo911onJO+dQBy01OXJnS4
   Q==;
X-CSE-ConnectionGUID: cDQM+o5qTseY96WcOZiX1A==
X-CSE-MsgGUID: xmH30mEZQ4iG9Ga8/lSXrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93482245"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93482245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:45:17 -0800
X-CSE-ConnectionGUID: 7dzyFWYbSqCVtXSpEEOFJg==
X-CSE-MsgGUID: V/JExwARRnaYBRB6yGznUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207903992"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 06:45:15 -0800
Date: Wed, 28 Jan 2026 16:45:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_064520_105840_18E35FAE 
X-CRM114-Status: GOOD (  22.37  )
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

On Wed, Jan 28, 2026 at 03:34:02PM +0100, Andrew Lunn wrote:
> On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
> > On 1/28/26 11:37, Krzysztof Kozlowski wrote:
> > > On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> > > > The xiic driver is designed to operate without explicit clock configuration
> > > 
> > > And if you change this in the driver, then you change bindings?
> > > 
> > > You miss here explanation based on hardware - how does the hardware work
> > > if nothing ticks it clocks?
> > 
> > Hardware obviously have clock input which needs to be connected. Without it
> > it won't work.
> 
> Should ACPI potential limitations be making the DT description less
> accurate?
> 
> Would it not be better that the driver has an DT binding and an ACPI
> binding? Where there are common properties, common functions can be
> used to retrieve them. However, if ACPI lacks usable clocks, use the
> of_ method to get the clock from DT, and skip it for ACPI.

Why should we use of_ methods? If this is required we can check the type of
fwnode and act accordingly, but I think this should go deeper into some
treewide available helpers, because now some drivers repeat the mantra.

But how do the driver get the clock frequency (if needed for some register
settings and/or calculations)? DT seems to have well established property
'clock-frequency' for that. Can we consider it as "ACPI binding" as well?

-- 
With Best Regards,
Andy Shevchenko



