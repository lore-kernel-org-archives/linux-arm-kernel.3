Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CDCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWH5Yh+nfNkhViTbYNqipEjh8g2q2E/FDO5nZPhRnPs=; b=yJz3FjVynMwkCWeEvJTVKhv3AR
	WLaZ8Udh0Us4iZElgDfst+7f/toKqMpqikCXTRB17WAMTewZ5EX/8MUVAFK5zAA96qp4o3aIpX08c
	b7fJRpvnji9m+eeUIqcoAuIXTk/qgYBcnAf22TW1NwBJFq/uhz4JedwK48rkZe6ZUrx/rE7Z/e236
	3ZiO3/cYsWMxKb8rBHhq1mLwbAGvzMYRPYVUpTWRww2GwYYbaGNKmNy2WSshsCAaYDLKN7k9f1weT
	DOiULxukXZLtK5fCA9DHzC5gjeSiX5yc5XROjRtwbBzvCmEmY/5KfbOfjuZryC9YF+QWx9S+OxT4Y
	tgRYSbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMAN-0000000BQwB-0JLl;
	Mon, 12 Oct 2026 19:58:35 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMAI-0000000BQv1-3V2W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791835111; x=1823371111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svyaTnJKl2TYexbkp/vhzflZQy5dYZbMzF9dkVFPBPg=;
  b=Zolt4SjTHKXyXCvLei5lK8afeotD3420G54BtWEUZs48La5yfiwEj/Zq
   BbUzHdmH8P0j0OSd3SPhHofRO9n3bemFg8efWFh6rfYEEDPsaRGrsK8iH
   v1aIto42Cf24R8TJL3cUnM26ZpYTxqMbTAZn4uFMtt0VV2myitvrd9vEc
   QWu10Ea0usK/yEt9NFuGsqaW8+cDRNOMUmiLUf8cxr8WM3iDgB0zUdVy7
   On9PexPmDS8JbiNNiiDDQQPIpDgz6tiCZdaUb3cGiOnKfrERaeamg6+X3
   6v7viZWfNBeFQ58Xgg0ppHLLTd/jIrj0Wn6z+TAah9SiczP9f9NJZfTyp
   w==;
X-CSE-ConnectionGUID: r7inK0nTR1SDzRAUt6anpQ==
X-CSE-MsgGUID: DHSFRDSXSUS790nEtq9PYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="447847"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="447847"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:58:30 -0700
X-CSE-ConnectionGUID: Qfp4xOXGRHaLFx0Gl49dRg==
X-CSE-MsgGUID: XQRCHPb8RSGkWbPwEH2PVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2730507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:58:27 -0700
Date: Mon, 12 Oct 2026 22:58:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] PM: runtime: Propagate last_busy from dependent to
 dependency
Message-ID: <as074Em1m9d5s1yO@ashevche-desk.local>
References: <20261002230714.507921-1-briannorris@chromium.org>
 <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <asEdiIT7l49vhn7i@ashevche-desk.local>
 <asPm6HYpEIAYJ4a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asPm6HYpEIAYJ4a3@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_125830_882907_4EEA7A07 
X-CRM114-Status: GOOD (  32.72  )
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

On Mon, Oct 05, 2026 at 11:05:28AM -0700, Brian Norris wrote:
> On Sat, Oct 03, 2026 at 06:21:44PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 02, 2026 at 04:03:07PM -0700, Brian Norris wrote:

...

> > > Cc: Ulf Hansson <ulfh@kernel.org>
> > 
> > Can go under the '---' cutter, so it won't pollute the commit message in the
> > Git history.
> 
> This is a well-documented convention.
> 
> Documentation/process/submitting-patches.rst
> 
>   If a person has had the opportunity to comment on a patch, but has not
>   provided such comments, you may optionally add a ``Cc:`` tag to the patch.
>   This tag documents that potentially interested parties have been included in
>   the discussion.
> 
> I'm directly referencing Ulf's suggestions (Link tag), so I'm also
> making it explicit that I'm CC'ing him.

This piece of the documentation was written long time ago before we have got
the kernel.org controlled mailing archives (now it's lore.kernel.org). I argue
that this piece is outdated and we need to look at all aspects of the commit
message. Perhaps having one might not lead to the issue, but exempli gratia 20
is. I still think it should be moved to under '---' to show the good example.

> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > 
> >  Cc: ...

...

> > > +/*
> > > + * Propagate last_busy timestamp from one device to another. This can, for
> > > + * example, prevent overactive suspend when a dependency's usage is primarily
> > > + * driven by one of its dependents.
> > > + */

^^^

> > But here you already have an outdated ones, no? Why is this not a problem?
> 
> The "target" device (a supplier or parent) can't suspend before this
> point, because the dependent device still holds a reference -- so an
> "outdated" last_busy is not relevant yet. The target last_busy *might*
> become relevant after this point, so this is the point at which it needs
> updated (propagated).
> 
> That's what I mean in the commit message by:
> 
>   propagate last_busy timestamps from a dependent device to its
>   dependencies any time it may allow a dependency to suspend -- i.e.,
>   when releasing a refcount for its parent or suppliers.
> 
> Please let me know if I should add some clarification somewhere --
> perhaps also in the comments here on rpm_propagate_last_busy()? Or if
> you see some other problem in the reasoning.

Perhaps a word to the top function comment?

-- 
With Best Regards,
Andy Shevchenko



