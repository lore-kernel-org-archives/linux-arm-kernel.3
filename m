Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED937FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHr9re7c+MC9vs7acP5SkgKfaBkyLESOUyri7tbOzhY=; b=unY6dVxexWdrwIexhsAWa9gOj8
	+73ohsjFpPqz6zB6MArSh2v/Ye8d3NUW60tBkgnCb1oKHUhso8ydAfQEsBzeoJqawHcfbLiEnM4S6
	n4ICOYzaL3hmqvUdst5emWpNYml9+zUScb/SqOMZkWJ4LqzhA9ENPGb4HD08F4MxW1wDNPxAkFDdS
	JWnBD0K6XGaln8u4AaRk3qzLX9JNG6xzwsQ+aZgiqBfz40MdjusffwagpWStgzU5XLJMAlxQDghqY
	1aPbJ1ZcgbEiSo7ws1rHLS2o/gXvANeW5hkh/xlnQAPwZG/dQwHflXoIOMHF7rtkcktspvBKSFoGO
	EN/+AnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIcC-0000000Gc3I-0ozm;
	Mon, 27 Apr 2026 09:50:56 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIc9-0000000Gc2x-1nNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777283454; x=1808819454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K16jtHwF4yPp9JMkktT1aUmSgbxm+THDb6sgljMPb2c=;
  b=ciWngVOXrAT8c5QQ8UP+AIhYKUBRplYoBN6UxdOuCPfWe/hNY+n+7Gkt
   uq3uTAepsBoNFQb3vO6wpWktBMSH4ozA/cRSWRl5rYgPF9GuaQ06Ac4+f
   4mLzdUQG0mSkv4fZRp2M7/RfuSyK0+RR63GAckyS9U4ryU8zgFlLPAtvP
   OY+Xav5hoeeyCy2tDQ2BwwXRB8JMgxnADpB3D7K95RshoSfpguWg9LMKM
   llY4YI4Zr5HgHoiZEQ91Dc+gh3r2VZ6WeVBOwbduKSh8D7Z6QDavu0Isk
   WdRX4K180y7UgRuuPX9rt3WWlG1lCg8Evltu4MgaW9R52HvfWdowPuS5K
   w==;
X-CSE-ConnectionGUID: itk7a7xNRsmlQijiooSqGg==
X-CSE-MsgGUID: n5gzV6gURCyDEJoNpUfTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81775566"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="81775566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:50:53 -0700
X-CSE-ConnectionGUID: 5qUJxnBrSHmyDPhP+Wj8bg==
X-CSE-MsgGUID: diT0lo2hQ7OD2PTyqy3B/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237555452"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:50:50 -0700
Date: Mon, 27 Apr 2026 12:50:48 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Caio Morais <caiomorais@usp.br>, andy@kernel.org, dlechner@baylibre.com,
	jic23@kernel.org, michal.simek@amd.com, nuno.sa@analog.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/3] iio: adc: xilinx-xadc: remove unnecessary includes
 and add missing ones
Message-ID: <ae8xeI8VVUWn6OqQ@ashevche-desk.local>
References: <20260426211834.3318306-1-caiomorais@usp.br>
 <20260426211834.3318306-2-caiomorais@usp.br>
 <CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-zz-2cG7SJr1iKNQ0H81TVMXLQh3omkxJc9YRW673Kqqw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_025053_597270_0A324752 
X-CRM114-Status: GOOD (  11.58  )
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

On Mon, Apr 27, 2026 at 08:42:55AM +0200, Joshua Crofts wrote:
> On Sun, 26 Apr 2026 at 23:20, Caio Morais <caiomorais@usp.br> wrote:
> >
> > Signed-off-by: Caio Morais <caiomorais@usp.br>
> > ---
> 
> You're missing the commit message body. While it's understandable
> what changes you've done in this patch, it's good to expand the idea
> further (what you did, how you did it, why you did it). This goes for all
> of the patches in your series.

Dunno if it's your first review (congrats in that case!), but I fully agree with.
We do not accept patches with the empty commit message bodies.
(*Yes, it used to be okay twenty ears ago, but now.)


-- 
With Best Regards,
Andy Shevchenko



