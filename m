Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCF0C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCFoKaCk6m7j1gJUhrAt5cQVvO90lzEt/5aJ+1KQK2I=; b=wTRDPwFCV94Yj0kumr9o0h/bYX
	aiqBf+TeuH8kqC5YfgV5IPHIBrmdUblUPl///SwI2nymmjptFRIWXHPvEhbs593srifY5q+Kz/QHY
	XzNfVZPlyfaf1jTf0kNGwl2WIrXzm3ZGZRqk+6XtCsqOhd7XnUkrYTvokuMDze1tiZR95CSbPrdt+
	Yay2vvHrxw8/4fniap9Y7Kz1G1OLVwGWMxRq458ksdqVTM1eT7FY9yJVEEKfyz92wfh7MiqjLByxK
	gabNJX33D//oivVKgS5jNaRC+02G9w6iuZk0Gz3Lc8KwZx/2vwuwEmMzZ5+wd0f+sI3ZBc/hyaoVF
	Q4Vu78Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2Uf-0000000D13u-0JuS;
	Fri, 25 Sep 2026 09:45:25 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2Uc-0000000D13E-1xSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790329523; x=1821865523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u03sCXgRX7pcyePoPYi95dX0Tff82Nq1OTABJ1meNc0=;
  b=M133wOniLPTEo+C9wIkDcAvVVZJH5iXfDSrJgsl0irevmHADXPdN8D8K
   wmYbnkNpTokGRebY9g1WQWYFU5zGYcFS0dSFMOuQvzGxO/XbiiXwYbFR8
   m/L0pV+VlQTqDbyBXfVupKCdEcfEEuifBZN8LxejDwvb/I24FH9x4GT4Z
   TlBHC06a2D+6pblZAi2Gw5PRU7gWPWm+H2tWWZQ7Tkx3pY9zkZiMLJjeC
   f/ri7QdWanHaw8++SchicdEo0gsKBCY3IJ03xIqeeYECSVODGYqTCR4Cg
   ohAfiENnhSP07B+W0r8z4IDltyxCnlWJjwIHwqDjfwfPmzvFJvqf/qa9k
   Q==;
X-CSE-ConnectionGUID: oP3eAaqqRfW5vUKnu/FHTQ==
X-CSE-MsgGUID: avYOSquxTPW+crNt1f7UuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90019988"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90019988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:45:20 -0700
X-CSE-ConnectionGUID: wdn0TnkBRpSrePz8THZskQ==
X-CSE-MsgGUID: lcRbf3LGT5+3e3PDRzZSIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277458396"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.27])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:45:15 -0700
Date: Fri, 25 Sep 2026 12:45:13 +0300
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
Subject: Re: [PATCH RFC 01/11] ACPI: irq: Return -EPROBE_DEFER on missing IRQ
 domain
Message-ID: <arZCqRJHaCp-pgWI@ashevche-desk.local>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-1-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-1-2c62125d0085@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_024522_544521_4A74EEAF 
X-CRM114-Status: GOOD (  13.49  )
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

On Fri, Sep 25, 2026 at 09:48:00AM +0200, Lorenzo Pieralisi wrote:
> acpi_register_gsi() might fail if the IRQ domain a GSI belongs to has
> not been registered yet by the respective interrupt controller driver.
> 
> Return -EPROBE_DEFER in this case so that the mapping can be retried
> later by deferring the probe for the driver that requested the IRQ
> mapping.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>

You may keep the Cc list under the '---' cutter, so this noise won't make
the commit message. The email will be still send to the respective people
and someone can harvest it in the lore archive if needed in the future
(when commit gets accepted).

Note, you may keep that part in your local Git tree (in the commit message)
and handle with `b4 trailers`.

> ---

-- 
With Best Regards,
Andy Shevchenko



