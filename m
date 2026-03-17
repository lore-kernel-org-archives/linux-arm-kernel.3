Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AC4F3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFc1txCHJ7VWbssQ2CUY/GWLthm/ApUCxrhW842rGWc=; b=Eodd6WGWffUk0aRKRPHGTYCFsv
	wuqNHr35VhL/cTm7LetjEbsVUfEHBwNv+SlPctTaL9r1l17qMvCl4zAIqXTTDPBUa0psTONl47yKy
	Np0RA/omKDysWg1zlU3RYIZFOD1WSv5glOkxvaZI7yAyZLq+L49ylU5E6KSfMRf2q58if6lDpzL0+
	RBAWXmoF6VcVN102forg25g7QiVnPGK8g4LOA42p2sF/Ka8yVle1QEVegw7yVOVrja3jUd7OHWuzq
	8PN2Kz0oS+9Ziwy2GNNEf7lC2B7OB5ouuHvf1fvrQK5DC2HgLOz6VqlrYSXb+0RowDF61ModmReNZ
	9EzuSf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PQ3-00000005gzk-3CKt;
	Tue, 17 Mar 2026 08:04:51 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PQ1-00000005gzL-21qT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773734689; x=1805270689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C5+6ibWMe+6CGLCJ89fg6/WRPHNmqm+d8HkwRrykciE=;
  b=LuXHwYu09kAJpet9IUj4dhKXM4mbHHT9ogIFyKxT0e0c8H7MNIKi+idk
   BWIZjFvZ0/WciIYz9oSR7BRImdQTJBi3LnbpPzPw2oE3g1ZeF9oPvhbo0
   AHdasPmdX2+9+sSr2xsw30d+iV2FdrMKuezsn7TCI+X5aGIle4hZwoIws
   7B9mcyo1dGuijBLq4lmb4uuhJa9MmN+9PUC1NzUeoEJGKVUwKRpMQsFmR
   gfRYQl92QsD7SSCPbcD6BxUlOgzkrlnNbP58D4MHgSINThG8y1JlByZqe
   1vHlzuFaOgnHxDpbJHReAewGs/Etfg9zXKCmzik0jD/9wD6xONMglIvng
   A==;
X-CSE-ConnectionGUID: bna31CLqSBmYo0R5oYEzyg==
X-CSE-MsgGUID: 6ph9wY4sTyOW+aVeQ0i6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100214531"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="100214531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:04:44 -0700
X-CSE-ConnectionGUID: 2FRFFUu5ROiSZGHfQOS4eQ==
X-CSE-MsgGUID: 6ilrKriWSSuart1nhUvBbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222244723"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:04:37 -0700
Date: Tue, 17 Mar 2026 10:04:34 +0200
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
Message-ID: <abkLEgrZbdb03VWg@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro>
 <abkD-VLprcbbEbB1@ashevche-desk.local>
 <abkF0GO01sMcOhvb@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkF0GO01sMcOhvb@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_010449_539668_2C2A6A01 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Mar 17, 2026 at 08:42:08AM +0100, Wolfram Sang wrote:

> > > ... this change costs some memory on every system. Maybe it can be
> > > avoided?
> > 
> > How much memory does it cost? On most 64-bit architectures is +4 bytes,
> > rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> > +0 bytes. I expect that 64-bit machines will cope with this bump.
> 
> I am not opposing that the issue should be fixed. If it is not possible
> to take the lock everywhere, this is a proper solution. But if we don't
> have to use more memory, then we could save it. Our new SoC easily has
> 'struct device' in the hundreds.

What's the alignment for the u8 member in your SoC? 4 bytes or 8 bytes?
(I assume it's 64-bit SoC.)

-- 
With Best Regards,
Andy Shevchenko



