Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D67D3F082
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvHKA+K7TUM65OMddStf3ba4SlICuMtJpdIRzvLQ96k=; b=ubUDHkV/QDlZN9JOVvn4IdejWe
	nuG/u+dse+Fmkp6fmhasB9fKcMK6LU39nxz+Knv5g0pY5RQign0tN/cghV91k7vWwdxdQYt25hvzB
	F9SSYtFKvy4Pta+r1dZpa+IKNEoVSr+wLFBQyYP96rBOICkTwx6amflkYK2hc7aTL8tWg5nWLIyA7
	65dYass+BtPjUiTFoy87uEkmSXDGFzJ3oovINzDNUJvqoKrLRuY2KvPZ7MfdxwnRqxf4hxPaHFSDw
	LIgV+1lp3ahp8yFXd0h6Z3O3vUO1vBKHhYBDAmCNtdO0TG5kXZdgWE29KSXpUzv7aWfsC4KAfYG6T
	sqZT9cGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7hY-0000000GJFh-3WQG;
	Wed, 28 Jan 2026 15:43:28 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7hW-0000000GJEs-1M71
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769615006; x=1801151006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQSgejY1A/+GDVs72frruYIXekaBlGtguMeTaoWvT3Y=;
  b=D9EFrTG2gvhohHiVtF7DaxnmvZATkeUqcPiRe4NHwRv96QTBLXZRRMqV
   t5/z4tYvG1Omtz3f96zCX4GJmo0nCE4y7o1a4mA+4K7Jf14N76muLz1C4
   YsIj6NS1EQ5WwEP9I13ST5rJv1f/c7oFkUhnNKbCVoq6kfRhSCpsq/DQ1
   tZ0xv5nQW6JCCDAyIHgvZtcBcOAL0OUcp8tImW9RHyY/qTJi5PPa2UK01
   8etoKkKzySSUmweE/6zp20vCvzU0fyc5X74a3sjmi5AK93gE2s4DVzCJA
   ghk17JgulHeLpAfsgnedH9EpmqTpkc5s5HkwE51t1FmAwMuna/70DJx5J
   A==;
X-CSE-ConnectionGUID: oi50xf8jROm1j2dEu+NNEw==
X-CSE-MsgGUID: OJ4r92JaSaihtlxxYm6VYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70029623"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70029623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:43:25 -0800
X-CSE-ConnectionGUID: 8iZq+VOyQ4u7jfUKW3qguA==
X-CSE-MsgGUID: yYbDE6b3S8yn2waeuq0EFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208735649"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:43:22 -0800
Date: Wed, 28 Jan 2026 17:43:19 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/7] dt-bindings: i2c: xiic: make clocks optional
Message-ID: <aXoul5n9sA1UmqoS@smile.fi.intel.com>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-1-e82e2f6f657c@nexthop.ai>
 <20260128-remarkable-airborne-chihuahua-a1a16c@quoll>
 <66c7435c-a936-413e-a016-c860d448c971@amd.com>
 <fc00f8cf-b566-4694-82fe-76010d2f7c78@lunn.ch>
 <aXog-KBw7Bp-VEC4@smile.fi.intel.com>
 <5dc423be-c1f4-4a59-abcc-807f63b25f3f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dc423be-c1f4-4a59-abcc-807f63b25f3f@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074326_381470_915104FB 
X-CRM114-Status: GOOD (  27.47  )
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

On Wed, Jan 28, 2026 at 04:00:30PM +0100, Michal Simek wrote:
> On 1/28/26 15:45, Andy Shevchenko wrote:
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
> "clock-frequency" property in i2c is used for selecting i2c speed 100/400kHz.
> 
> Clock frequency in this driver is about describing clock coming to IP itself.
> Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml

Ah, I see, then is_of_node() probably is the compromise how to deal with
this setup.

-- 
With Best Regards,
Andy Shevchenko



