Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15787D73EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 05:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11po5vsI+nQjV6QlVaif/0UDHWD2whNpBcYSGCpKE2w=; b=NUBdVxofUAC2Fnr4v1exAa8HTp
	/TKdybeiVvguZDcizoMicsEZNSRc8i9CHl+dcQ2+vveOJkPTG/WBq4gt/+SOmIvM/GdAUedEBIlgt
	RUZE7eWp24dcmHjtKshutbWQ4ZtmUyYoAEyzhE1V9yf6/vrhFEjAPKLX/Tw2Np+70gbJmOKenWzsD
	3uhtoSUK7fbN8iOgVznZUXs1uTt9LI4aj9ionMOp9LEJZgX2eNgX8XOxg0gOihZbzwPMEXDhNoBcY
	ti7DuBU6lhSB4FV+CsqTKLwRBxXIcHFje7/HSpg/3gPshBBgxwdACzajKQgN17mOIysrVjszFWoVm
	aiuAQNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlh8k-000000013aM-3Xmm;
	Fri, 30 Jan 2026 05:33:54 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlh8i-000000013a1-0f5F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 05:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769751232; x=1801287232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Im+HvNbj0ndXZaZVUPje1i7Nrb7blygWvVN9bRfpCts=;
  b=AP+3nzMpW3lmjEKMGd2HzDV/8utWX3fTpMNKvjcy/POr8+2Zkznjb0JQ
   WvVZUnl5nOLdvTLgPTGOfJ82S2W517Q7Xx/lzDebskrD4lM9J1TRMxoIc
   4OihHLkJU91sayedNXwnMoi43oJA2gqwfwRpr517q8vqHgbfa41tqMIpi
   rLHR81GtYcNGdjeZMVjrpFNrQmi0lExANL0b7WolWzksV/HcN54o846f/
   PLk6+QYx8UIJxsFQfg4EkeW8e6q9xmVBthkfXoM04Qk6gPfBzPKwBqDzb
   V0pOVu2PxzXDqp9FAuVQdvZXvdexYoNBeAgdCn2Yt8VDgqtF+hnJU3XNb
   A==;
X-CSE-ConnectionGUID: 2ELeBkZZSf6j/fMWgBKSIQ==
X-CSE-MsgGUID: vWZ1h9g2QOijeVVgvaIAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71036908"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="71036908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:33:48 -0800
X-CSE-ConnectionGUID: SfVn35EeQP6FDwAlkmE0vw==
X-CSE-MsgGUID: sYVCc8fCQ++1lWOh6CTfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213298390"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.227])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 21:33:45 -0800
Date: Fri, 30 Jan 2026 07:33:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <aXxCt6N0RyfgoC7D@smile.fi.intel.com>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
 <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
 <20260129161404.GA1118793-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129161404.GA1118793-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_213352_266044_7E069028 
X-CRM114-Status: GOOD (  34.22  )
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

On Thu, Jan 29, 2026 at 10:14:04AM -0600, Rob Herring wrote:
> On Wed, Jan 28, 2026 at 04:45:12PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 28, 2026 at 03:34:02PM +0100, Andrew Lunn wrote:
> > > On Wed, Jan 28, 2026 at 12:21:41PM +0100, Michal Simek wrote:
> > > > On 1/28/26 11:37, Krzysztof Kozlowski wrote:
> > > > > On Tue, Jan 27, 2026 at 09:03:55PM +0000, Abdurrahman Hussain wrote:
> > > > > > The xiic driver is designed to operate without explicit clock configuration
> > > > > 
> > > > > And if you change this in the driver, then you change bindings?
> > > > > 
> > > > > You miss here explanation based on hardware - how does the hardware work
> > > > > if nothing ticks it clocks?
> > > > 
> > > > Hardware obviously have clock input which needs to be connected. Without it
> > > > it won't work.
> > > 
> > > Should ACPI potential limitations be making the DT description less
> > > accurate?
> > > 
> > > Would it not be better that the driver has an DT binding and an ACPI
> > > binding? Where there are common properties, common functions can be
> > > used to retrieve them. However, if ACPI lacks usable clocks, use the
> > > of_ method to get the clock from DT, and skip it for ACPI.
> > 
> > Why should we use of_ methods? If this is required we can check the type of
> > fwnode and act accordingly, but I think this should go deeper into some
> > treewide available helpers, because now some drivers repeat the mantra.
> > 
> > But how do the driver get the clock frequency (if needed for some register
> > settings and/or calculations)? DT seems to have well established property
> > 'clock-frequency' for that. Can we consider it as "ACPI binding" as well?
> 
> Well established and somewhat deprecated. Generally, 'clocks' should be 
> used instead. There are some exceptions like I2C buses here to set the 
> bus frequency (or max freq). We probably should have used 
> 'bus-frequency' in this case, but that predates me.
> 
> ACPI can use whatever the ACPI binding maintainers want. If you know who 
> they are, please let me know. :)

There is no such "entity" AFAIK, as on ACPI side we try pushing vendors to make
their efforts to bring a standard. Nevertheless, we have players, like MSFT, who
make decisions on their own (hence we have tons of "extensions" to the ACPI and
other specifications. Speaking of the standard, we have UEFI, MIPI and problably
others that have their own properties (but standard) and they usually use dedicated
prefixes (uefi-*, mipi-*). Also we have custom vendor specific ones, for example,
Intel in some cases (legit I suppose, as it's about Intel's IP) provides intc-*
properties. In many cases, though we have utilisation of the DT properties and
vendors more or less follow that. (Disclaimer: I described how I see it's done,
and not how I think it has to be done)

-- 
With Best Regards,
Andy Shevchenko



