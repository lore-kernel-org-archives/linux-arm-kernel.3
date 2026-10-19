Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE24CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIN7EzkDzQl8H8JPzWXMSWTj6oh2CoeuqfC0+91gJ+Q=; b=BqrK088vFEHwHJuceDFZ6Pj6gp
	9x7SqUZZtL+gbtBVdySgT+VM6oc3FaF7NmiXped9goQIgsUC+ywSTl1832d4z4CqiR//sXJhEAbJm
	5pP4itMIsYpy5VeYZUzGBu/W1Xte/GXJNXVhf6A3wctBbNl+gYkL4Iy4L5zoWT7tvwGRAzCmELA+f
	BCg/FPyg35+8O8s1AGcFfiM2I8D5y3kN1n0US7kgPeDaf19eQ/dR40CqnNyn+usU8rsW5Qu6GtJj6
	5mHWbOQmFGRViNxTzzdYke5uxQyoCYLsO05/wjfSJ6ZuYdHf2vbimv4H8/8G3mhQTWcNX7uV8lStL
	+/vXu72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIitF-00000006t0m-1zIJ;
	Mon, 19 Oct 2026 08:38:41 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIitC-00000006t0R-1xsr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792399118; x=1823935118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XA1A2IIHw4o7SLmRgWiGcPv/uCAK121PMRqCz04TzZo=;
  b=YZy6oNuAzNikkw3e/Oyi1azxpzOz14LI/QMNuJcx41gbM1QetlnJlGVc
   2MiBzOzC4s5Tg3BfcZV2lrjRmRkTyD5Zz+++YHYoXfbWhkqDgir78P8pl
   nYpvdzt6wuiQJj3ENVeB5i7C8fQu0OL7LCWYFTKdGxta37e/irhz4Cmmz
   5vQB5D/pvw4rrqHtRYOta3yJGBISM05oyWG8krh0xtJd22/w05Vawce9W
   whpfPQgu8qiRNfZOCSxQ3VJnZp0MnE57DK33B47tpIUFSewJb4EtMDdD2
   LT1N2JINpIu7amrL8GRt2aoqQcvuRY2xQtfEan8q1v8GGnX8ruY4ZPyhW
   g==;
X-CSE-ConnectionGUID: Zn7FHAvlSLmubn9Aub3sVQ==
X-CSE-MsgGUID: lFYhKZmURgORKHX62/XwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="979023"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979023"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:38:38 -0700
X-CSE-ConnectionGUID: DvakjlgDTqKzmamS6MZ+rA==
X-CSE-MsgGUID: QcNNV21KTYSyf7ORGohkRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4325289"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:38:35 -0700
Date: Mon, 19 Oct 2026 11:38:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atXXCYimAdgGhZsa@ashevche-desk.local>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <atXLd6SdHNr0UcjI@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atXLd6SdHNr0UcjI@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_013838_542125_542C1284 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, Oct 19, 2026 at 09:51:40AM +0200, Uwe Kleine-König wrote:
> On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:

...

> > Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
> > Fixes: c526404a4a92 ("serial: 8250: Fix corner case for port matching")
> > Fixes: 7ab80d1e7243 ("serial: 8250: fix compile error with hub6_match_port() when compiled as a module")
> > Fixes: da7b5fd4e17f ("serial: 8250_hub6: add missing include for hub6_match_port()")
> > Fixes: 3d406299d882 ("serial: 8250_hub6: add hub6_match_port()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I wonder about the amount of Fixes: lines

We have patches up to 23 Fixes lines IIRC.

-- 
With Best Regards,
Andy Shevchenko



