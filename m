Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCADCD6AAE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkCD8wM/qtUrNEg2vN1s6p8xtYLdZo4rTamfMzPaJXM=; b=QoluS+yWffkUEmsZ46ScT+wZPd
	ozLlBT0yVbG44xAjX6RQwzgHe9sKBRlFi7E3CXmx/y7j+Wf6jUjJRXONQOCmYXhgJ4U+bFbNPCD+3
	zvp2IFc0SGK58OW+Quf2MVBXejROb1/Tz4rMBfyuC6FZP8YdKE50VrIJdkRgqDSWzg3sCzzNurt/l
	INBvmH3KtEYcBxGDIhnfQpOfYA69lTgA6SwpYJYnsGm8vGcRCvRxsSFpm/Rnp1OHN9pm72W9nw4+7
	msTSxOhcMHNtWGe/o9je/oHxUjx0QuZkIbrJUwp48rPKEeuzXkRF9vk9luRlOycTOM0U98GIh7M3J
	U2WY/aRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kn9-00000000VOY-087l;
	Thu, 02 Apr 2026 16:21:11 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kn6-00000000VO9-0Qex
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775146868; x=1806682868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GujdQjZozNiu5xy5BhxV8QzkK0PAVPSJEakluqbDb2k=;
  b=A16uy0iXAJy25E80Ct9zNgLgPdYJEkgquRMkXNeDDPsoyyo6v5bRuNJd
   Skh9kIqoR2kbIe3cq1lYSP3znOe/1WnIJBK6IPsxg86KiFcp6TCzavub3
   6/PIc1N/QYJ3lFE6i+WxLqvfQw32b81ChDVAFH+5LpK6+OLwWDWmCdo0k
   Kj/9/3L4x3o7TfRDwQ4TWSfoINVhLXaJBqKVSbeI5+J104iwGw0LNjbi0
   XWUvJ6N4oaaJzGJwW7coBB6D+leBKwA6ekAZQamYotuNc2DJBoqdBVe6i
   BtVtEfH02uc96oqqmsaS7FXU5yG5cISnhKp9RfAH6htQKd9WGyIm75mZ8
   g==;
X-CSE-ConnectionGUID: 2S58HEMiQKmdAylD7PGroA==
X-CSE-MsgGUID: gWdu8PZEReO5PMlbt168Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="63760789"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="63760789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:21:06 -0700
X-CSE-ConnectionGUID: 80euU5L7TgqPnrTtsw4CKQ==
X-CSE-MsgGUID: UBI1ni8OTnaF1n3N+HjjFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="226893234"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:21:01 -0700
Date: Thu, 2 Apr 2026 19:20:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 3/4] driver core: make software nodes available earlier
Message-ID: <ac6XasInVzlqtuPu@ashevche-desk.local>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-3-d730db3dd299@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-3-d730db3dd299@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_092108_161284_A647AF39 
X-CRM114-Status: UNSURE (   9.89  )
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

On Thu, Apr 02, 2026 at 04:15:04PM +0200, Bartosz Golaszewski wrote:
> Software nodes are currently initialized in a function registered as
> a postcore_initcall(). However, some devices may want to register
> software nodes earlier than that (or also in a postcore_initcall() where
> they're at the merci of the link order). Move the initialization to
> driver_init() making swnode available much earlier as well as making
> their initialization time deterministic.

Okay, if people want this, why not.
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



