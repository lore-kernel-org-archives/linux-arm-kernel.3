Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912DDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr3bbVJL95sW4v2Z0K1E6UBWpIQgfJn/LNEhD3U8dCU=; b=4s5/gx/oEwUFbxTJutTjm9aibh
	3U80mytMn9oEUCqbvohLjYRhX3GqDnTRYIQA7XBBAkoppBHxh8n7UUBGE7G/nRcVaeWudl4rYGUso
	MBXty/GySJBLxcEpTq4MqAz9Ckzv0dK9OVSGTvfQ/Im+HBa5eiIp7RZVkFwCsBSCs7eiIOJliemqt
	DvV8eBgOZO9LkGlJD6Z/UkedJzxG23F0AnTvmeA1+elXFJSzmjlWMrLBn0Gxmdxu+ihEOhhsl8WhP
	/4ORZ6QAloOP8wG4K8gg+2im3K5X8cwe7evG7TRB6XC0S6LSHHenBc9GVNLqXWqGF9f8rfbp/a/a2
	TA+QFPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2fv-0000000D4E4-3xxO;
	Fri, 25 Sep 2026 09:57:03 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2ft-0000000D4DQ-0Vcz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790330221; x=1821866221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RFkzEkH/pTrprYA0V564zxkPwGY1QFaLSdmuR9IK8tg=;
  b=WrbXD5eUwFbFZsIPlS7qwb3VVINmS6xSfh40IHXJ7ToQsm0cacMragvL
   QXo5PTSt8ECu8oNSHad5uNOIA5I0NoXKfQE3fM2IEvJnO3WFQQ8SZARZi
   W8TmHIDi27KsP3pfqeZu5hZAc21ARlgtqPt1LWHqJOjvg3SmmvvJpP6ls
   Fa/49Ubzm4kD27PZLMS5LxJwyt6D1ARpcXXoPyVhpAysNyqYR63LF0pN4
   wN+Gyx1NGq8TRopvK9pY8yjUOXS5K2VYiUQZ4VMyEKLtZSR1ET00acu2T
   PUTXwy/H9YXIcBPkUjELm3ClTrsbHu1SIYxer/sCDkX2hmWTtHX0/tR05
   A==;
X-CSE-ConnectionGUID: 8LFDFiArRMezN0+ebp7bRw==
X-CSE-MsgGUID: sPSqlUybQNiBiCUa3Fw9BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101640318"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101640318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:57:01 -0700
X-CSE-ConnectionGUID: iuXnh6rdSPysbnNxiqRMHw==
X-CSE-MsgGUID: 1dKCGk7BS4CQlO0D0rpNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="270769027"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:56:56 -0700
Date: Fri, 25 Sep 2026 12:56:53 +0300
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
Subject: Re: [PATCH RFC 06/11] ACPI: GTDT: Convert SBSA watchdog to IRQ
 properties
Message-ID: <arZFZf0p30jEHGsD@ashevche-desk.local>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-6-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-6-2c62125d0085@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_025701_200472_8EC8D6E3 
X-CRM114-Status: GOOD (  15.84  )
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

On Fri, Sep 25, 2026 at 09:48:05AM +0200, Lorenzo Pieralisi wrote:
> SBSA watchdog IRQs might be wired to interrupt controllers that are
> probed after the SBSA watchdog is probed and therefore the IRQ mappings
> cannot be carried out at platform device creation but deferred to
> SBSA watchdog probing through the platform_get_irq*() set of APIs.
> 
> To do that, stash the GSI number, trigger, polarity into standard
> properties attached to a software node that is attached to the
> platform device ACPI static fwnode, allowing the SBSA driver to
> retrieve those properties and map the IRQ when the SBSA driver
> is probed.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> ---

Same about the Cc list...

...

>  	struct resource res[] = {
>  		DEFINE_RES_MEM(wd->control_frame_address, SZ_4K),
>  		DEFINE_RES_MEM(wd->refresh_frame_address, SZ_4K),
> -		{},

Side note, even in the old code the last entry should be rather DEFINE_RES().
Because some APIs, such as resource_size() will not work on an 'empty'
resource.

>  	};

-- 
With Best Regards,
Andy Shevchenko



