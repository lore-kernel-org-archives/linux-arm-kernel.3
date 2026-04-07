Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED86FEEF44
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMXaVurIz+OvnlbZxjQiFTJcuO6e0LfYTwBBACJJ5Yg=; b=NIBNRsQC7n/x2tOj+BVBGO4B6Q
	PMRELLUAD1B5I56Lt7dIAPud80cPnv6Q1oSg27NwbBfIJ2cNOkVexvR02DG88I1L93D+T0ZAFWiwJ
	oN81Gk6lc0K3e7GDoeOA9CUkwS6+oMeU/TDhTwdwBsxHTdtx6M17TMHHC8s9qzjD37rOLLZJmzEJC
	xkTz/BWVQ8sl8twnhGhskHYjuBOPu4lrfePhnWxsyIZl6ZF7OG7y3lsbx/VViEZl0NN26KYVThq27
	jKn42ocUXLRUbSvtQfFu5kLq61k3getBxOT+hiiPJH7fWRgcup8u2x9FJXIFcRj+iNgGvO+YE49n4
	gVDnr7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7E3-00000006aQN-3nI5;
	Tue, 07 Apr 2026 14:16:19 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7E0-00000006aPu-31Uv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775571376; x=1807107376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=phr90QLyaq7RUo/A3Jc8HshSe4PIXcLlnVoGZR6dc3E=;
  b=jp1qobZW0PnLYMk4t8Wf+kOeA4ohq4QSiF0se7iPZN/hBQYkT9bTFRe9
   0XjnFzB05Qz4mSXaRPls8VspWJHhRicZqNWWL9mOOgyANSs/WVZorKA/1
   wO2yHIrGnHGWfAby54n+JkbONilOWT+iTX7Kdjptx74cBfURWhZN9Y/pe
   KWFx3R3Y5aHc/Ek2VgEeXSkGqYsl+Ny5fJgnqA7lWdU884h31zT2A4sMh
   cNnp0Q6Ojedhhd8vVkLRIeTv/gz91TNuKB/ypbYo1E0hmD8+hFxk9K+pw
   tqrNWn4KAGRkCnVRFGjQeNxruCoe3ojIAyZPVK2Bhi33IbRmVWTBsdkTt
   Q==;
X-CSE-ConnectionGUID: cuFoxuQzSa6xDwrmGqKXZw==
X-CSE-MsgGUID: D9VOJI1gTE2n3/cMp5rD8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76500319"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76500319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:16:15 -0700
X-CSE-ConnectionGUID: qewB1qKeTX+YTbDaPymkmQ==
X-CSE-MsgGUID: ctXyPk7pT+yPJmsv3N3spw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228440843"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:16:12 -0700
Date: Tue, 7 Apr 2026 17:16:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
Subject: Re: (subset) [PATCH v5 0/4] ARM: omap1: use real firmware node
 lookup for GPIOs on Nokia 770
Message-ID: <adURqCMlAIGjB8--@ashevche-desk.local>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <DHKF135KLNW5.3LT0J6T5TE3JD@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHKF135KLNW5.3LT0J6T5TE3JD@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_071616_826072_8B0083F8 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sat, Apr 04, 2026 at 03:47:24PM +0200, Danilo Krummrich wrote:
> On Thu Apr 2, 2026 at 4:15 PM CEST, Bartosz Golaszewski wrote:

>     [ Fix typo in the commit message: "s/merci/mercy/". - Danilo ]

Depends if Bart used French to sound that genuine.

-- 
With Best Regards,
Andy Shevchenko



