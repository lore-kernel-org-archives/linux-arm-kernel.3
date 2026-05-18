Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC83CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8eaGO5hgcLDZiHe+NGazkdC+iIYeiqtQm0azf4g7eg=; b=xe7bSbL2ElbDZBpHndc1QT89Eq
	1SWoO6Z64SynkqTtdujFyYTDeucQSfa/zKODCTBMGAgnNImmxRw/osOJ3/pFheVeziiNUjgj9osSI
	UbkiH9vFlpyBUWlA1KZn7YUYGSgR1VYJhjpQfejpa2IiIyqzZPchyfW39wXABMvC+EpGtfZct7O1M
	VjhTLXFaYQMc77losnwqsQ8dyqxcztOcPrR1JNy2aR+TA8WkafLl+ajE8Yeyzj95QD8yUIxUUt/36
	ZzBgwRLPwjyjyId19wnjdKS2aeMSCTB9h4PoeXGkrcBPE1fApYKntBsR16TOz7j5lNTHqz8dpx6c0
	K75VbdSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsKL-0000000EZgT-22Th;
	Mon, 18 May 2026 07:23:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsKJ-0000000EZfw-2nfM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779089027; x=1810625027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nn3A3vAmindilk1fNlnp7BEXPwv+U3vQxYhSLEMgtF8=;
  b=MKLXSzWtKW/b50emsY0bVEtTzayzm+v9jL+G90e2w6DQ/tVPfJtE/rrp
   ZlYgmCFsP8q2X68lC1zam4E7VLjIg68toupnlikxTVChL7asIAqVwRiDh
   04OI0WhIjBng7OTQdWENsSwMirix9oR1sD/9LaoVFabzdca3S0FYFHnTu
   UU+OxZpJ0WINu+fyFt2mGteuc1BzDrdkaaaSvY4rwle5ImLHIG0n4SLGk
   UgoSuDnJEtMKpcjTBDg6ab92LZ3N3jIj6BDQ5vaRjhXpAJ6UrCOnr4cxL
   Zi3NXcsyyO/S1OQ9+fykCY3c83iObR2aTatM9iHJDUVDLbKfqn5YLE+8G
   A==;
X-CSE-ConnectionGUID: Ubd1QHkrTlqETM1Y9VKkPw==
X-CSE-MsgGUID: 1QVRK8L/Sc2Q+2odmHdlVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79789009"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79789009"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:23:46 -0700
X-CSE-ConnectionGUID: TTUB0lTQSJu1MzH6wr1ojw==
X-CSE-MsgGUID: i2NpznmuR4iym3GJQD2XPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="263125293"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:23:42 -0700
Date: Mon, 18 May 2026 10:23:40 +0300
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
Message-ID: <agq-fF6dNl-fRVXE@ashevche-desk.local>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_002347_726593_026A92D5 
X-CRM114-Status: GOOD (  22.33  )
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

On Sun, May 17, 2026 at 02:22:03PM -0500, David Lechner wrote:
> On 5/17/26 1:17 PM, David Lechner wrote:
> > While looking around the code, I noticed that there are a lot of places
> > were we are manually filling all of the fields of an IIO timestamp.
> > 
> > This is error-prone (as seen in the first patch) and more verbose than
> > it needs to be.
> > 
> > I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> > macro for doing a struct assignment. This does require a cast, which
> > makes it a bit more verbose, but we were already doing that in to
> > drivers, so I went with it anyway.
> > 
> > If we want to consider alternatives, we could make a iio helper function
> > or macro like the first and second patches did.
> > 
> I should have looked harder for existing alternatives. Just found one
> more that avoids the cast via a local variable (in ad4170-4.c):
> 
> 	/* Add timestamp channel */
> 	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);
> 
> 	st->chans[chan_num] = ts_chan;
> 
> And similar code is found in ad7192.c.

See my patch. The above with my patch applied can be simplified to the
inline use.

-- 
With Best Regards,
Andy Shevchenko



