Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A6FE87841
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmEDjk7hFnD27Ay9VpPrj7+EMtF3kpsmht/Z0o3tAlc=; b=X+G2MYTJqOAEYQwzCg2iye3hYc
	YVKzoC5csPMYbNQwr89FskKtI2qnGgAg5C0RZEgOob+DFoiNx7YH9vMtLIrDfdggynRH4iI/GP3Kw
	NvYkcx92nNxzKcS8f4Bxrp3c5hIWjWB22ufyKR1ALcHdRBIxZHX8H+ETtviiDJaLFNXqAXPqH8R1c
	PsSGMJ83o+4WP4TZo5TteDTs2NkZioTVPrYpxCesE4+usYWzh8yUNrpZ1wU91LYmt3Ndkvu1YPP9c
	i/Le1FDvlflPx9Hpx/896fMiqoO4seo2HUxagPziuuORa5DA51/o88pZd4z2IbpaHFtoVvYZpKSkW
	p9xPV2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIad-00000006rGU-0bkN;
	Tue, 03 Feb 2026 15:45:19 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIab-00000006rFQ-1oeB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770133517; x=1801669517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0x3vFQU8/eP9ntepQ8YV4JtZJnkkQ0g4VvYS3BjMUJ4=;
  b=lSpMxwHWQxiA+76ol8mOwbZBdjdI26e/LNcH6IcYbrx/PcYrPM4y04re
   r71/lUrysIhD5sfM+VS81sknB3xmoYgKNolKdHTMxaEGoaim+O4cjGoSd
   sRxbW9jHoXKTM7rVGENW9fgHOwk1xZkr86acAtvdf42dreGidtb2A93jn
   likV8PFJFLDrpSGxMP/NQarFXHftlffc5LucZy218eVXR/mA4Z6mRRr3Q
   N+y+huKveLkeMQPAZ+4OIbQuPLpmwZs1Lksvjt2vgNT1hzSJ/QVjS/2oU
   fPuu7K9/yoUc09xQXhW965qcKcdekbr/hmHUWoErQX9IP2sdH4Hl015o9
   A==;
X-CSE-ConnectionGUID: 68kB8WLbS+iJgK2tpYQQ3g==
X-CSE-MsgGUID: 1kDSqfzSTbCi9SwFcTslzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81621447"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="81621447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:45:14 -0800
X-CSE-ConnectionGUID: XN+HF3k4S2Cl1Yo6oN3vLQ==
X-CSE-MsgGUID: BuX/WtSYRvWgfK4bwye7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214363128"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:45:12 -0800
Date: Tue, 3 Feb 2026 17:45:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
Message-ID: <aYIYBheQgIN71os8@smile.fi.intel.com>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074517_551494_424F0B55 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 02, 2026 at 08:37:23PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Use i2c_add_numbered_adapter() to allow platform devices to specify
> fixed bus numbers when needed.

Not sure about this. Doesn't it break the current approach? Please, double
check that.

-- 
With Best Regards,
Andy Shevchenko



