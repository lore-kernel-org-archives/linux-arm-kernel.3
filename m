Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34411FF60D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/G1wS5F4h/i9w9JT0RqaIDuLXwdlm8/of08oi4rpKE=; b=LZm28i+SEZznraEaeE3Wbf82W/
	tNC/achLAxRZ5MwCV+fG1aIAqNtTLtqLZDjiom0IonoMQDlJfZlIidWBgJy2Pkm8oMAGe6peNd1WT
	x2eIqAq/D0q7ZbtHYW8dO9O+Nmq6ChWPjkRmjhon0mVW/Cbxyd83jngBc3Dvg8TRHMgRrfQ3/4IPA
	yOudn/R8gFcnc7DWFk2YfNZ6MzbqzF0mF0D2alWjDrMZYNbbtvsDgszfG5bYrTAQpGEJEiTFghGuU
	dp5a2lfTDXsNo73kaE7SPcZWBFsoBz9W/lgCaFEpuei1xAmTPDUMWnbwk/likMK9tTpyU6ss3nU3+
	6AP+QCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SXp-0000000CMEA-0cvG;
	Tue, 31 Mar 2026 06:25:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SXm-0000000CMDh-3YZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774938343; x=1806474343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3VFiO/9e0/Dwa/+IPq3LFbEGBlbpH2h2kskMyOOM2wU=;
  b=leoltrvGLmfotH+eL4fxzE5XBU4cyScZQZuiP6jOw3VGLPfVS2whwj3L
   ihx5SVZQOetmSj0HqP/5p1kqmfagRM7NFjvzOgjFkOkiph3Qk+zdDnxBs
   3mGZjiNsEcK7m73eNn3TqAAVE+bjcfjq9PK9onGZ/6dy1cnJ6xsNuJfq+
   2tRKa1LuV64VqC/Itggsa1Lp5QCogM+A8XGCobGxj5yIk/U3xzCYm5Gku
   yLVswq2leNZQZatbmhszYpfnwoXS3mEYcbO2TgiGgWD/Ui13/p9Lfph7i
   OjuBcwHlxoaSjN0sEF/B5SW1zr5faaPeLNTzKR1aHLNGttjt0dFRTgWui
   A==;
X-CSE-ConnectionGUID: HCk5e2ufRyegjf+S18ZW1A==
X-CSE-MsgGUID: EJaFsqg6QsS7ajQO1PJg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93323397"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93323397"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:25:41 -0700
X-CSE-ConnectionGUID: tM5AvxKvTS20bU+YYeM05g==
X-CSE-MsgGUID: XLXLMmThTjauDlTqrccrPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230730554"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:25:35 -0700
Date: Tue, 31 Mar 2026 09:25:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acto3TE1AR8iTzF0@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local>
 <acruxMNdnUlyRHiy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acruxMNdnUlyRHiy@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_232542_931622_78CE44F7 
X-CRM114-Status: GOOD (  14.72  )
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

On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
> > On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:

...

> > > -static void __exit software_node_exit(void)
> > > -{
> > > -	ida_destroy(&swnode_root_ids);
> > > -	kset_unregister(swnode_kset);
> > >  }
> > > -__exitcall(software_node_exit);
> > 
> > Why? What's wrong with the __exitcall?
> 
> It's dead code. Always was, always will be.
> 
> Maybe split in a separate patch, but I sometimes feel the idea of "one
> change" is taken to extreme and adds to both developer's and maintainers
> burden by needing to keep track of extra patches.

Why does __exitcall() exist then? It's also used in other places.
I think it's generally good to have a possibility to clean up
after run.

A bit of archaeology:

The first time it appeared was in the bcc2152647b8 ("Import 2.4.0-test3pre3").
Then somehow spread a bit (but not much).

-- 
With Best Regards,
Andy Shevchenko



