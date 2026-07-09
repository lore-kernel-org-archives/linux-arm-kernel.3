Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A73C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A7QPbu0+2KEHtIpgVDSTRvmsxY6yPUK3BF9orDh9j8=; b=gMvNygo8oDIDm2N++ugexilaTs
	snD3ua2Axqd9zv8r2IL4X0ZcpFKDkj8dtEhHUliZOofls22lO15Bi1T8NNnyS2wSV7pZ6Bq6sJNcw
	GAXO5vQ8x5qAfSmzyq408GH7YzPzd1eU9MpJLDb7V23UdOj33c1NYpIjg/iO4EK+Pqsg5jXZV3jde
	ixuYnE21jmbuEVxFu3lnGeWWRSLUSWImawtoYk7rGhLn7ximPbZmc2i+gZaEE+kjwK62U1nME16Ja
	bsMOgVQ1+BHUi8B8HaB9Cn8mUA6En+3POAnejTVI2vVAV7AYzXiYW8/yWmuhaBB3HtmWzMGwV8Ydj
	xSzDNicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmAc-00000001zXd-3Iam;
	Thu, 09 Jul 2026 10:39:54 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmAa-00000001zWn-07Kn;
	Thu, 09 Jul 2026 10:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593592; x=1815129592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2sU0s40xkGwnyMyr3Gohlub14CCeKxZuEHRaPaL50k=;
  b=gonoslVatCxe+Y1dLk5FHk1ngxJuISGjzckB627cHz024n08dBrnUWmS
   ukz5ap9iznQ05qaVOi3T0uZAPZd7sDm562qVUZKmKYmbIKi9Bq31TVefD
   r0W5m/a2JgCmVf63bVHxZvKvFIvTtNSeDppjIuLSEQjDUoyw7/dxeuVbQ
   KXYQWKM2JwAr3yWrZ+K0+l2gMiAxSwc+OPQImWVxiyjEyfEhJD75ipOeV
   M9YLnFPYNan29+IoRiqCZScDLQk7jNF8z+Vn4Jux8+CDo1G8imslU8GHA
   YORr93ZUqO4iNYjuPwwWTWeHLJzHpjO7NkUIQwM9+9K91vTchvWtYS4vb
   g==;
X-CSE-ConnectionGUID: M3n5D1JqQ0GYle9UnGGayQ==
X-CSE-MsgGUID: 1FjHlwC5TSuummhjJR7lsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88097648"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88097648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:39:51 -0700
X-CSE-ConnectionGUID: DE8TRutyRcquJ0DgXoxDVw==
X-CSE-MsgGUID: Dgg5Foy1TwGE9qWU1O2mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292740125"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:39:47 -0700
Date: Thu, 9 Jul 2026 13:39:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/14] usb: hub: Use usb_hub_set_port_power() to
 control port power everywhere
Message-ID: <ak96cA264qq_FS1r@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033952_074785_A1E6DF2A 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, Jul 09, 2026 at 05:57:13PM +0800, Chen-Yu Tsai wrote:
> There are still some instances in the USB hub driver where port power is
> directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.
> 
> Switch these instances over to usb_hub_set_port_power() so that only one
> unified function to do this exists. This makes adding external power
> control with the power sequencing API easier and consistently applied.

Makes sense even on its own.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



