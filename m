Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB642105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSh+HhoPJ0SY1zFY7W+mpHEtKzNjjIalCshjCsFIhTA=; b=1cjpo0w2pxpNIJ1SgaoRWVD4uQ
	lenrGDV4VQHoaw7f9uKJWOoMQ7ElVypN8OqapL7M0K1A42250qvFMDZH9nqnOR+qUl2pax/Y0cBxb
	fr1N2UVS6EVonZrcwwk9rp8IZKN03giuop8Wyg19Hdm1GdKcKW78kACNeydjfmvM6X9cRRcccR/ah
	z0Me3HSKOV6yHPWGb2dDULZUbwF10DYvMjYtkRZ0uXnnFVyMV/A+x/wgT1IaJ7leAncnk4CpcDeJW
	mj2kOjDGRPBJf4Z6OChvFoMYzGCmHVHupDbQky/AAN8FimQON9DFSsTVt2mMF1iy0TjnUg7HFR2mI
	NgsKCHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysO-0000000HOTG-1siq;
	Fri, 13 Mar 2026 09:32:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysK-0000000HORu-22Z0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773394329; x=1804930329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nppF1ad9T9XazH1yCnKiKJ8QR0oAlqI2g7/jhh/8t+U=;
  b=GIoQ+vlcGhn2I8zc5Y+XMDCJFQ7S8j4OekBp6dVBg7mGDh7dyEJpUqKf
   QhDPhlUbYoWW/5SLLvi25PNdurNL0LFNcludBiDV21JJv7gQ6um+8GgaY
   6rVy+JUp+eLAd1K2XXtUkIYU2Cr4PSQpOtn6kMB55+m/nedlIbSTYE7nc
   1YrlSDxog3427RIQcp8ATdSybKbI43QsGoQJagjDJfclNZnMaZeKVQWXk
   SRu/nX5Opt5kvYqMpZpbN3IuWdSjPCeL/rA8HIUU9hBXpptwS+bLWQbmG
   +A8H7KHNu12+QBOWl8bokrzvur9zawOx5ITIzeVLtjUs/H2w9mZncmzoF
   w==;
X-CSE-ConnectionGUID: MMlBUdpGRZa3mh1QYcxEPw==
X-CSE-MsgGUID: MwIQMxkWQDC2wr8oyvFyGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74394804"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74394804"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:32:08 -0700
X-CSE-ConnectionGUID: NP6vg9yORXaGSdK0VshM0w==
X-CSE-MsgGUID: gAA72zLVTO2mDXcG1uOzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="217135271"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:31:58 -0700
Date: Fri, 13 Mar 2026 11:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Alisa-Dariana Roman <alisa.roman@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Marius Cristea <marius.cristea@microchip.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Benson Leung <bleung@chromium.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Ariana Lazar <ariana.lazar@microchip.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kurt Borja <kuurtb@gmail.com>, Waqar Hameed <waqar.hameed@axis.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	chuguangqing <chuguangqing@inspur.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	=?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] iio: cleanup: uintptr_t to unsigned long
Message-ID: <abPZjEE82AIxSgB6@ashevche-desk.local>
References: <20260313013435.25731-1-tomasborquez13@gmail.com>
 <20260313071014.2102-1-tomasborquez13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313071014.2102-1-tomasborquez13@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_023208_573075_FD59770F 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri, Mar 13, 2026 at 04:10:14AM -0300, Tomas Borquez wrote:
> Linus has been explicit that uintptr_t should not be used in the kernel.
> 
> The iio_chan_spec_ext_info struct uses uintptr_t for the private field
> and in its read/write function pointer signatures. Jonathan Cameron noted
> this should be cleaned up in one go across all users [1].
> 
> Update the struct definition in iio.h and backend.h, along with all
> drivers implementing or using iio_chan_spec_ext_info callbacks.
> 
> No functional change intended.
> 
> [1] https://lore.kernel.org/linux-iio/20260111122034.174c754c@jic23-huawei/
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>

Please, really, take your time and study process documentation!
No new version, especially that SPAMS so many people, in less
than 24h. You must give a chance other people to review.

This version effectively ignores all my comments I just gave against v1.
So big NAK again!

-- 
With Best Regards,
Andy Shevchenko



