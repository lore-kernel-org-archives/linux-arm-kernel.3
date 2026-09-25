Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200FCC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OQ8eo5O4PtPcQG6bQi2yyE2gp1xU4Qec3/koUqK79k=; b=jglM+IEbolMHx5YiO3e0biakl3
	OXV1OVcG+0axnO8ZXoxMBWjYVQHS1E9yCMptI8+Y+CwTwTQmVTeCJq3r33EbY+K3kSATRkEsk7PNA
	RNPf5g+TywrwWsOrgOFdYE4wzaxFXxSrttAngQv2/xhoju9d6JbUlCax2Ipwq3bnvArA/cbPtWAMH
	wpe0NWnvrw5e+u+GselSws13caobL4whoBtSAvkiwaFGFXaQ7M8VyzrXeexXzDt1Yr1sG4wz6zo3F
	mIMUUV+qkjlasSIYvoyInbG5GBZH+NsAJBsuFephXmgi4AWTHxtWrup64fzpt0AdNHbVQq2bvv/on
	ujFIiuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2dN-0000000D3qR-3U1l;
	Fri, 25 Sep 2026 09:54:25 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2dK-0000000D3ou-3yRX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790330063; x=1821866063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJhvgsbYBkkTxrz9e8S/lyMN4dNTTNoAlaAJzf+q3Ps=;
  b=npDY0J8DBK9uIwTBXZNeRou8V8xmVzPxHwxtwWGBqS1IVmNTxsckSLlm
   iO5urO6XmP04kvjEB9bC+fPDCu3GH/+cqVzBjJakgw3Aa9RPg0PyyhNPh
   zsJB+S2zmuL4+bY2qb9alBH/wMi6tRI4KgrelvSVmpkU0qVIZesU9RdjY
   iYo6o1yXJq2HpHlW1JRlfQ3QJfgPrNyUs7lPaTv+zJZle6rJ+b0kFrsLJ
   Vqd/9liyDUREp7aMj2LZoS1zztlEn1IDjQXTfzNOSN8Wp7p6woWysfRt5
   LY9Vh2elEfC/YKqivDl3oK4++kUd22eFdvKpuXp44xqh2pc/d7SQuljSa
   Q==;
X-CSE-ConnectionGUID: xNamUJBKRZiIH7/C4AwzEw==
X-CSE-MsgGUID: 6uYCXnjcQWO3WQ3re95Z5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101286665"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101286665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:54:22 -0700
X-CSE-ConnectionGUID: LGW9EsPVR0isVUO96e4kkA==
X-CSE-MsgGUID: 4MntE1JoRG6EoE5n75P90w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274386881"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:54:18 -0700
Date: Fri, 25 Sep 2026 12:54:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 03/11] driver core: platform: Add static ACPI nodes
 IRQ retrieval/mapping code
Message-ID: <arZEx0113s0bbkXJ@ashevche-desk.local>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-3-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-3-2c62125d0085@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_025423_021847_A4E8A029 
X-CRM114-Status: GOOD (  14.83  )
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

On Fri, Sep 25, 2026 at 09:48:02AM +0200, Lorenzo Pieralisi wrote:
> ACPI static fwnodes types are not contemplated in the current
> 
> platform_get_irq_affinity()
> 
> implementation that is there to retrieve and map IRQs for a device.
> 
> Add fwnode_irq_get() to platform_get_irq_affinity() for static ACPI fwnodes
> to overcome this shortcoming, enabling IRQ retrieval and mapping for the
> ACPI static fwnode type.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> ---

Same about the Cc list...

...

> +	if (is_acpi_static_node(fwnode)) {
> +		ret = fwnode_irq_get(fwnode, num);
> +		if (ret > 0 || ret == -EPROBE_DEFER)
> +			goto out;
> +	}

This even doesn't sound right. If you know this is an ACPI-only feature what
the fwnode has all to do with it? Call the respective ACPI-oriented function.

-- 
With Best Regards,
Andy Shevchenko



