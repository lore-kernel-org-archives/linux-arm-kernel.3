Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE1FD706D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPn6IHFB3av8NwaUhQnPXimsAv1ybFnsn8TpD5pwo5E=; b=tCs6RL2OEpAvjbtuhNKqjsEIAn
	y9WqY4TEb2U2sjd/O/SyU/IFRX4GdLkhOl5d/fydAnCH6+C25H006BCZiN3yQUVQFHrguPdYRz+LR
	dCAQ/tLx6VRiLh5lAmiivJMhEdrmN/OL2XzXwzloF1iCornnsOlEo51vUcN7swLzhNsmwVAUtAf8G
	yEtgdksu+R1BheRT7o2ANZV7goVeu4Q4ddHKY6X9RGnazB2uVc2G6DakZMGcvXKmewxWRxgIWAI0b
	9oj3Xvc+oKDfM1D4yOOrWiQKvDQP6PrIcw9IDLb+DRWtoHwWaTJm05StDC6dV6gonMeeILRJlDq6m
	BlEgvsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RU0-00000005yEA-2iZo;
	Tue, 17 Mar 2026 10:17:04 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RTx-00000005yDS-1YKn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773742622; x=1805278622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I2H5RJoMGFDqFLBEur/g+zezU/OdI5LfzcovXuA1vSY=;
  b=aWEomMbThYXaZkE/Po8eNtPLEIKGprtrxKXg/wuGnM9Xk+VneHoTvNKZ
   159v6iimfup27IrvjwhTptOcRUbeTS2BltslNL9dZ7rnLO9GBe1hm95gL
   di51eqq4hGdYe4TIrb3ZMHR6+Sj9ppyjC5jEhlAI8yk0YQtQyy484Ql/T
   pvHJ4L9/bK3j8+GEUG4FHm/dIEJW+QsSMRPgMUu+xYIUf1NKpk0lP/Tn5
   sKoKAOxpoYksWYAViTmOXUoYrZ0FNlq4sqYbCFmtjf4CxrIfa3gzcNgVf
   CkSMRLQSYkIq7ZxnQX3bCdkqrVb+t6o+hK+CL/cU0/OLkkEZhZ4kq3u14
   w==;
X-CSE-ConnectionGUID: 0ySBhjeuSGC6GClXNIehGQ==
X-CSE-MsgGUID: qoOpxEZGRVCapeW9MB8VlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74472229"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74472229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:17:01 -0700
X-CSE-ConnectionGUID: YWwwfd8QSr+Yegj693ADXA==
X-CSE-MsgGUID: Bjwo4+7+Q/OCfHxBHIvODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="260126206"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 03:16:53 -0700
Date: Tue, 17 Mar 2026 12:16:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev, imx@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <abkqEni3phP8dqqw@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
 <abkLEgrZbdb03VWg@ashevche-desk.local>
 <abkLY4AAQuFlTRC7@ashevche-desk.local>
 <abkT_jpjIki6pvX1@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkT_jpjIki6pvX1@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_031701_443631_3A1C3458 
X-CRM114-Status: GOOD (  15.29  )
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

On Tue, Mar 17, 2026 at 09:42:38AM +0100, Wolfram Sang wrote:
> 
> > > What's the alignment for the u8 member in your SoC? 4 bytes or 8 bytes?
> > > (I assume it's 64-bit SoC.)
> > 
> > FWIW, with the given change it will be still inside 64-byte data structure
> > which most likely occupies a single cache line (before this patch and after
> > as well).
> 
> I consider this directon of the discussion irrelevant. If the number is
> (maybe? That's to be discussed!) needlessly bigger than 0, then it
> doesn't matter how big the number is.

That's why it was written 'FWIW', so it doesn't worth :-)

> Why don't you like the idea of taking the lock?

Like Danilo I am also not sure what lock protects fwnode accesses.

-- 
With Best Regards,
Andy Shevchenko



