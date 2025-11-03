Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B98CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2BHpzk7kIeiAv5eTPa8RXCYmZyLyQBEbp3r9rXmWIk=; b=JpT+JQ9o7JvliUazlAbIGz/GnT
	Y/l9+1Jnw+gdHEk0ibeay2OEEUi1vz+GUaePd6eZUIs44Qs/UIwOfKOsmu55p1l4BS93rGBHTiB5j
	rS/VCANRRTemVYr6PDZyv7rKQUTyQu/MiHpCVNtDWVufss6/3Y48IvPLv2dILtFUoxHOs2bHkQz0M
	PXqhERIgsEeUvc7E3Qazna4S41vBXXE2PFLBqTSDGbgoARhsKELWCR0PZMR1B40DVb/x5/QFYyBJD
	msQ7Of6QsnEqqjoK0RKScM832Q0KfoarvY5b6P+iE54DMOxtlyiMrRvhEXYAnwfLHE5QhSFQz7E/I
	H69gKi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpJM-00000009OLq-0ODb;
	Mon, 03 Nov 2025 07:49:08 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpJJ-00000009OL6-2JEr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 07:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762156146; x=1793692146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJgeVbNpUoGoHD1/sYkEHKgZWHINzoEgg34xJW4Po0k=;
  b=lpstO1d8Mm6Np+2J8sydWF6nRhOfgiTV2XRieT4MbHMHlGsUmmL9Koot
   APO77OQyzZG5K/88gmra+SMCvtD0uamQL4KJuA/JPqykj9emqqcjQbreI
   7szMqntgtXQ9uYuOnXBWV6M8lO7TRygllNrQK8NvXwCqpQusOjLkVvCYk
   b11hCZjDEMRIT5s8jHtU7T+HBs5MMUibVtNOK+YgMnm0f0/igxsNEvaPm
   AyoT5v2/ID394DjnT7QNMbVs5ssCNWH5MEWGmwjNWZTh9PH4Az9r5EuvX
   4rZGRLlhDtbT0huc79y2Iq+wPN84V1Pb+ggzbyIbmxRyS6qcmo/KMHusj
   Q==;
X-CSE-ConnectionGUID: /6v0EoL2TF+efZRONgog1g==
X-CSE-MsgGUID: TT8XrEgyTDuvT3atid+1Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75577338"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75577338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:48:55 -0800
X-CSE-ConnectionGUID: 3675MS2DRWyz6L0nyQ0PPQ==
X-CSE-MsgGUID: Bfa3tw9zQYyOQGbhail1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187117193"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:48:52 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vFpJ0-000000054xb-3Tzt;
	Mon, 03 Nov 2025 09:48:46 +0200
Date: Mon, 3 Nov 2025 09:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Raag Jadav <raag.jadav@intel.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Tero Kristo <kristo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: clk: keystone: sci-clk: use devm_kmemdup_array() once more in
 ti_sci_scan_clocks_from_fw()
Message-ID: <aQheXQLhrn_fOnyz@smile.fi.intel.com>
References: <a8e94921-a426-4db8-aed6-b6e17e88b8e3@web.de>
 <aQTLHlv2_V9Pgjk3@smile.fi.intel.com>
 <06be737a-365d-4a2e-89dd-72fe415bc7d5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06be737a-365d-4a2e-89dd-72fe415bc7d5@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_234905_600040_0C56E503 
X-CRM114-Status: GOOD (  13.27  )
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

On Fri, Oct 31, 2025 at 04:06:59PM +0100, Markus Elfring wrote:
> >> Fixes: 3c13933c60338ce6fb2369bd0e93f91e52ddc17d ("clk: keystone: sci-clk: add support for dynamically probing clocks")
> > 
> > Wrong format of Fixes tag, please keep the SHA at bare minumum.
> 
> I got an other impression.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc3#n145
> 
> Would you find information from the commit 6356f18f09dc0781650c4f128ea48745fa48c415
> ("Align git commit ID abbreviation guidelines and checks") interesting also
> for this technical detail?

Even the above mentioned commit doesn't do like you have done. 12+ doesn't mean
the full length. The rule of thumb is to use the minimum that doesn't give a
clash. And you may read the Linus' thoughts on the Geert's work. I.o.w. don't solve
the issue that doesn't exist.

-- 
With Best Regards,
Andy Shevchenko



