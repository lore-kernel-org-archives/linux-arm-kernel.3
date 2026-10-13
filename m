Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA183CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGkWIGEM6jHHCAHhvIONIePGFqd8EjAxzOXAogPtvww=; b=Q15l7UnYleNiCvMsKDn6yMS9gO
	ig7HKlM+SOICW+JDhWOv0tsG6r46DpiLT4vZwX7u4Wwqh45b+t21WOtsKZdMBhCb0L3m/gnzSJVry
	YB7hrLchQW4bZLClxT/b9ESmfVlZr4ObcAqPg+/w+XgAvi7yYKZlrwh5v+hFgFpmWLxUjIS4gR/xl
	Q8JvWjFd6iO+tUWnzxYGQdpncSWDtQkFUp62Fz8FRYE/Wzu0tXu3RXd457eZSJ6ZUK4FI2/wSaLTJ
	NHFjJTtl4A+wafuvm2NjaZ4MNFrFiJfuSjN1Q3XBBKg58B5NdX7POD5jZiVp93q3OT3QG2Fs1dM9T
	+T8Z6YCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVjJ-0000000C7Fy-3pG4;
	Tue, 13 Oct 2026 06:11:17 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVjH-0000000C7Fb-2JyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791871876; x=1823407876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bZCryCaE81/PP/pc+Hgv31p+qdLWaTjK3f7Lg80CbBM=;
  b=GXoUvSjUDtoQi9Tuy0D1nZO6Coxpr+z6WKTk0iNlh3+sd5x0yvbqLatY
   ggHL425BDtN+aHg5S9cXkauX+joCX0d/QzKiVkPNWhSIG8xQbIEVL6qXX
   u/Qr+Dj51kh5bPDArpbSevqXPC+nKugYS4gz2IB5LVFajkfSp9bKjAIMF
   EVYF2VDHDMnT+fU730QmdR1CdBEaUkmwqUTOX93j0CI/Zu3zzFkyI++RE
   p6qUvrQb80WLggBQSzPYF4KQyUMHvlNSj5zOhokLaCPsdRMQ8FyUgdXVN
   B1BNkDNbFwHsuXGTrdQA9NaTDD70i9qRONO7jEXvyKzEMP1Udt39IG+at
   Q==;
X-CSE-ConnectionGUID: vGkhHZ4+QryYPgrNjn18xA==
X-CSE-MsgGUID: IWyNcK7XSjapTftcMJjbuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="592550"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="592550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:11:15 -0700
X-CSE-ConnectionGUID: bUS/U4RbRLOGF0ixRHSvRQ==
X-CSE-MsgGUID: P88hj0ooTWqjFlVDp4fQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="981242"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:11:11 -0700
Date: Tue, 13 Oct 2026 09:11:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] PM: runtime: Propagate last_busy from dependent to
 dependency
Message-ID: <as3LfIU9bi5GY2cm@ashevche-desk.local>
References: <20261002230714.507921-1-briannorris@chromium.org>
 <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <asEdiIT7l49vhn7i@ashevche-desk.local>
 <asPm6HYpEIAYJ4a3@google.com>
 <as074Em1m9d5s1yO@ashevche-desk.local>
 <as1qe_J37Njol797@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as1qe_J37Njol797@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_231115_666124_86808FF6 
X-CRM114-Status: GOOD (  35.84  )
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

On Mon, Oct 12, 2026 at 04:17:15PM -0700, Brian Norris wrote:
> On Mon, Oct 12, 2026 at 10:58:24PM +0300, Andy Shevchenko wrote:
> > On Mon, Oct 05, 2026 at 11:05:28AM -0700, Brian Norris wrote:
> > > On Sat, Oct 03, 2026 at 06:21:44PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Oct 02, 2026 at 04:03:07PM -0700, Brian Norris wrote:

...

> > > > > Cc: Ulf Hansson <ulfh@kernel.org>
> > > > 
> > > > Can go under the '---' cutter, so it won't pollute the commit message in the
> > > > Git history.
> > > 
> > > This is a well-documented convention.
> > > 
> > > Documentation/process/submitting-patches.rst
> > > 
> > >   If a person has had the opportunity to comment on a patch, but has not
> > >   provided such comments, you may optionally add a ``Cc:`` tag to the patch.
> > >   This tag documents that potentially interested parties have been included in
> > >   the discussion.
> > > 
> > > I'm directly referencing Ulf's suggestions (Link tag), so I'm also
> > > making it explicit that I'm CC'ing him.
> > 
> > This piece of the documentation was written long time ago before we have got
> > the kernel.org controlled mailing archives (now it's lore.kernel.org). I argue
> > that this piece is outdated and we need to look at all aspects of the commit
> > message. Perhaps having one might not lead to the issue, but exempli gratia 20
> > is. I still think it should be moved to under '---' to show the good example.
> 
> Well, it's not 20; it's 1, with a clear reason.

Yes, I aware of that — "having one might not lead to the issue".

> So not sure what you're saying. Anyway, I've prepped that for v2.

> Do you think you could propose a documentation update, if it's really so
> out-of-date with current practice?

I posted some a few months ago, when I pointed out to that noise in the commit
messages, it was like a pushback, but since that I have convinced several
developers to follow, so it might be worth to try again (but it should not be
insisting, just a recommendation). Also note, that even in the cited piece
there is no clear point where to put that Cc tag. It's only required for
stable backporting process to be in the commit message, otherwise that tag
may well be located after the '---' line which still makes it a (email)
tag, but visible in the commit message.

> FWIW, a quick look at the v7.1..v7.2 git log shows over 10,000 Cc lines
> that aren't for stable@ or similar, with over 900 different addressees,
> across roughly 1300 different commits. (For comparison, there are 17,833
> commits in v7.1..v7.2.)

Have you checked in dynamics? (Note, most of those Cc comes from Andrew
Morton's scripts and TIP tree.)

I used this:

$ git log --no-merges --grep '^Cc:' --pretty="%(trailers:key=Cc)" v<$A>..v<$B> | grep -v '^$' | grep -v 'stable@vger.kernel.org' | grep -v stable.*@kernel.org | wc -l

where <$A> and <$B> give a range.

v6.19..v7.0: 11525
v7.0..v7.1: 11594
v7.1..v7.2: 10946
v7.2..v7.3-rc7: 8696

You see, it works!

> It seems like you'll have a hard job trying to apply your rule to
> everybody's changes, especially if it conflicts with the documentation.

As I explained above it doesn't really conflict, it rather old established
process when people want to have that Cc be recorded, now we have
lore.kernel.org for that and I successfully convinced several people to follow.

> > > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > > ---
> > > > 
> > > >  Cc: ...

-- 
With Best Regards,
Andy Shevchenko



