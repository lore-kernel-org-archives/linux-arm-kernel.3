Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE06D77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8nfTUegB8fjxclWjlfclgW0KhQ588wIU7+kJJcS9SQ=; b=D5fbI9pbMxPXkyFHVfoygg+1y3
	c3i7cBjux2YHqvp2EizvL/3SPtPi4x5cAqw7iZbjbpXnQ6EgCtJ6r4v4NNBsbJvRqTG7iadJ8+Yna
	GnajTQh00KCod9zTN8GN+1yP4VNughp/Eowrn/yGG89po1Rr0fY8i6yTdAbT6LrlAEEqY/9/2HiWx
	LFbALnomhjZGKPijaxLHBWkPxlWR0c0JbtwLe2JW1PT+B6wlbv2PfhIefpo15407JBLTaVGqL5N0R
	/TeKtfNK3QkpMOgnyfEWCBvpSI+ijkvaU03XpYfsL3Qn+zFnYxQlVwRJatuNrld024957EeRHeBQT
	l/1U5GyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKT3-00000009FQt-1eTK;
	Fri, 23 Jan 2026 16:57:05 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKT0-00000009FQL-4C14
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769187423; x=1800723423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ETja2x9jbkMhnduG6jPpAI5mgl3pccMdrptMXW31rbs=;
  b=jxzXRfYSst2hYkW+EOgsOtyQmYWO69nuXA6WKHMq4c5ApdiUwgLjQEBm
   1ksOys9ZUVYj9cMB+CY4KcX+dg5X+vhbiZatkkeX/wuHTrmc3R1ttMvxt
   Jjq3t3fkIDRA/Za6BErVgs0UPct18L4vo4N9I/iVuYbbhK7EkZBhPAu+h
   mZoAQKDnQZcCdeZCcgSHY55lx7Omkf2YLFQGgBX23UWE60X/zqRBaF5VS
   GMD/0IK7bNUybwa6J2lsoCizh3lycdOv7PENe2fW1F88n6r5sjQA1XDVX
   zQTn8cFL10aNYjeoaGt+8dTM9OX2FysCh2SVifaB0pwgh9cKAwVTDMaMC
   w==;
X-CSE-ConnectionGUID: 5ywXMlc7SveXgTvUY9Y/IQ==
X-CSE-MsgGUID: yIUEZZgVQ3OZJPnkor59Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70501038"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70501038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 08:57:01 -0800
X-CSE-ConnectionGUID: MwOpywMySKGwSHbVjeVEAg==
X-CSE-MsgGUID: tv6wIPEiRhqocY18Bga9dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206185987"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 08:56:58 -0800
Date: Fri, 23 Jan 2026 18:56:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] i2c: xiic: use generic device property accessors
Message-ID: <aXOoV-rbEGRur_UI@smile.fi.intel.com>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085703_078026_6B06316C 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, Jan 23, 2026 at 04:34:13PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> Switch to generic device property accessors.
> 
> Switch to managed devm_ functions to simplify error handling.
> 
> Make the clock optional since the driver is designed to operate without
> explicit configuration in firmware thus making it useful on platforms
> where clock is not or cannot be provided.

...

> Changes in v4:
> - Reorder the cosmetic patch to be the first in the series.

No. that's not what I meant. I meant that the line that adds a temporary
variable should be moved from the last patch to the first one. The order
of the _patches_ was fine, now it's broken again.

Take your time and try to play with the patches locally to see my point.

Next week v5 would be nice to have that addresses my point.

> - Amend the mutex_init patch to also switch to the managed pm_runtime_
>   variant.

-- 
With Best Regards,
Andy Shevchenko



