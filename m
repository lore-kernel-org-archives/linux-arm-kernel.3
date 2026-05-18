Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56D4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A5JaCT1DUL8jYVprWjV8CROiFVTsdjlPW2D4RdHgL0=; b=n0mRfT5Y4EO4ALylJip5LEqwtr
	RYMe5mXwAH+T7D62os7q1d/wsMEWd0EafPNirbRcj3L4jNdtiOIVlEtrLOmL7ls0L2NX863xidbaC
	QIY0vcwDKyB0tV7/VzEuNpbEl/LJG/QKiVDwc2CzYpfOunzLFEw+zNUWi4VA7SZrwp2rv8ajvs57i
	B1iDsyorLZkRuY9me4+C3IG1AXNvvINOjEGxfQjXWcv0PSDrX6HRjVra6c9QN37lri86QC2KxFEc5
	St2U853Dx5VY1GdnhyWksFy7QheHiUT/g20Q5WSrOHo9+udB3r0FsOZZsxgEPCTY2OzeLNGiPL/WM
	kSZH4d7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsBF-0000000EXlg-2vyY;
	Mon, 18 May 2026 07:14:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsBD-0000000EXl1-3w2C
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4A5JaCT1DUL8jYVprWjV8CROiFVTsdjlPW2D4RdHgL0=; b=cuKmLZjeUB1DTmI/VMBKBaTbhb
	5NshTcuWV1FDiqauNa9r7yNeBLz6yo8nfqt0Ai6ywFSxmf3DKuSKXMliOEldmn3tz0dvxTQ+yCGZx
	fa3+8N1DHivgPERg9XTP2hAJMlje825WbhZZuThXiea+unPh9pwPb+O2Kw2eEfGTSoCajKisBS1Yy
	nzwtaMX6kL5FrYoOiExv3zEq4dRJW1BUL5EvYf95lrtCpEmG/DFK/3TG+sHfu4IMmNvtm3R9J7P+8
	EmpHZcdmDvodCgieYTABu8ej387U8RfWQjYW8EGx3yNCDI/An8AW2fKBjPJEXYHyTjTmOYaut/0oF
	RKe/oIwQ==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsBA-0000000A7zy-0XTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779088461; x=1810624461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ch4+KzHRX15oTvy0eQozXsJdu2/rvZ4j7JoeMWZ9U1o=;
  b=AfISKY8B0kNgs8A39JvlcwrSWoDVHx0ooNm9hdScH7gP9gzFbCquQAhJ
   LZiRFKfHwjnYb2safUOnE71FJYRamJYYc2I/Wrfo3EnluDxlaEcX3mx+S
   7c4itMZd8tMv/vJ9UHr7/+ThEv5yHxJ8TI4I1qJM/GXDO/fhNzlNQVgzD
   D2u+9PxNNa3rsUHS64t+1lSucKBsL4smo5Dep/x8507DFmLImnp6KsIkk
   F8yCBa/a8t+dYiO8be65ghRpY2BMFZrW8L/Uu6uAmXO0Hb2XBHbBwb9a9
   5QzpTZYmze9KvO2vNsNrDjz5P2+qqcp3Vt8BZKhmsXDNoos0bQ5McxM9E
   A==;
X-CSE-ConnectionGUID: SX7xNDG3RuCOG/0P+o/2aQ==
X-CSE-MsgGUID: oMvdtSHBRa+OzI8XDRuzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="78958839"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="78958839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:14:17 -0700
X-CSE-ConnectionGUID: +Phijwm0Ska1e8wiM6r36g==
X-CSE-MsgGUID: EM438IG+RRW9tRuH3o9R/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="244324026"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:14:13 -0700
Date: Mon, 18 May 2026 10:14:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
Message-ID: <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <agq7PPw0qupI_8Dh@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agq7PPw0qupI_8Dh@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_081421_079063_107289C4 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
> > While looking around the code, I noticed that there are a lot of places
> > were we are manually filling all of the fields of an IIO timestamp.
> > 
> > This is error-prone (as seen in the first patch) and more verbose than
> > it needs to be.
> > 
> > I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> > macro for doing a struct assignment. This does require a cast, which
> 
> No, it's *not* a cast. It's a compound literal. And instead of doing this in
> every driver, add it to the macro (in a separate patch). Oh, let me just cook
> it for you (I added that to several cases in the past).

20260518071349.469748-1-andriy.shevchenko@linux.intel.com

> > makes it a bit more verbose, but we were already doing that in to
> > drivers, so I went with it anyway.
> 
> > If we want to consider alternatives, we could make a iio helper function
> > or macro like the first and second patches did.

-- 
With Best Regards,
Andy Shevchenko



