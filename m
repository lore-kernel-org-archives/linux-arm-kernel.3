Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4974CCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jULzgmU90GwExwiOegz46rYdLgOhwZJMHx733RDhwSw=; b=LS4NY5sLnkI2AsXaxuQZkk+CdY
	0YLirE7WTHWT0/cpGpjxOmz2rPs8L+/mBX4amykZgEr5nuHN86b58EyoCW0jxb5+tyJqUoc1nK/qo
	glWTTSHrjioaJ4mFXT3rWP94ybMz52ZHs5KyfFOSY7PipCYwnOfF5ellB9GmbdrLUjcK+UZj97y18
	RBG6igppkwW4LxHy3uaNkeYcYZ0FLXMgW6+9gsTF6zQhAjWqwLVXWMvCeqz24uZ8acFTrwecVygTC
	K85KOsCVqTvUn6i6NEMRHuleK/QzbhsTSZ1Cqh5utXnaC5M/JhNCI6DcfI5tkgmfC5o6+HbixRoFO
	qU39Pmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPGl-0000000BelN-1SYa;
	Mon, 12 Oct 2026 23:17:23 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPGi-0000000Bekn-3jcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 23:17:22 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15354aa70e8so2563879c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791847039; x=1792451839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jULzgmU90GwExwiOegz46rYdLgOhwZJMHx733RDhwSw=;
        b=SXc8xG0XZ8Sp4OaduL0PaCG4MMnt43GkWzAtV51E5ZTUirShYzLalqAQXWPpnhBwQ/
         duh1Hg6EkCaoojSvnuyXGBLpzNMtzB9s/wqDXWgbzTCLyGWPUwPI1sxYBiH98fVEklg/
         4xY2Pqjzq/XAoj8a/aJlrbcQ/B7AJDSVjPLP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791847039; x=1792451839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jULzgmU90GwExwiOegz46rYdLgOhwZJMHx733RDhwSw=;
        b=Qld51wRHysOoqGeff/eySLQnp84MYzJr4cfNg6siiSz+WwHTjBgmkcNg2IExbL2T8C
         PIVHzt6LzA1hLGC9RvAau068jYyGVz5m2Ej4whYR+Ows3N28JaopL4hRAApXssndaiNF
         QUZC4Z8K7zKRdktWmIwzDZDedXnjUVShYFWOjIAyvTvu7LZE6abZbi3GLS9zFyYvJTF2
         0xaz4zTlZidfRS0PchwZdSQSNPGWPlA5HmIg9YH6aB2gxf3Wbrf5CgHz6ivVxLTNJXTs
         5O6PFsWXay5/IlTqDsBeurmcgdsFOmjnwW+mejIKWeZQ3xRTaE3DEwkt4ZwEYMQVRoEO
         d3EA==
X-Forwarded-Encrypted: i=1; AKwUvBy8NgMvclHLA5hcFx7+zs1XzI/dz40galrkOkdm5YTwa/kEOQ13s6NiTtuCIJ8d6NdqraIgVxIeVIUDnBXA84U+@lists.infradead.org
X-Gm-Message-State: AFq9FYI+ZGBhiWNlgjDr8jwu/Z4IT72Nc3r720QTiZ52qzESUGiopsIt
	XzrtHpWuIq3AIiaCh9QDXBY5bG/3OV4LdxYsppzW5ulWJVWAWX8ldAYejlf6Jm1IUg==
X-Gm-Gg: AYBFou1aGbls5b3Gd7a3mjwFMsX7o/SD5Yq8wIdd+P3n8VSnyjsRGA8s2qbyVX9HEIv
	hfEuelI9WdzfxSRMq1hMuHhAuZSKejsnKmHp84iBvwM0/EVju7ipdMSX5uRXfZAw221IUuzkcDb
	lnqJw3Xk1Nlx7hmwfioC24jIAU4qYDdVm+MtAGpfKudhu9dbyN7qO+Ozb3kB2/nY8KaR0u+u8pW
	gVUTKyzwXS5dMwqlh5Tm6XB4SUl1qPEw2Qs+CHq3OVn1UzJH0nWwE1NxxHMv76t4peyQvRmF9ws
	hJm2Ckm61hGoXPeX2rB+1acs6cNq30WJbDvncB7ZJW+D1wVZ2qehCqBcVMykThPM2OYPxaDrXr5
	GHBwBL5cHvDm2Jb/ya6m2Ox3/Q0p3NqIDh70NIu2VktCdmujXH65wbRO5jop7zVA84MA4HTBcP0
	9AZ+R3n/9tF06TJvCflHIv+AeoK+R9kGW9KKtGuuOYsYecpjHrUswUTXabPD3yjZABOWffuvbd9
	5tp4OBKflbwABmdN5mH3AszTDFkvjUJmfVngHd6m75NZbZl
X-Received: by 2002:a05:7022:1703:b0:166:b307:5855 with SMTP id a92af1059eb24-16a4ee7e657mr14543536c88.0.1791847038615;
        Mon, 12 Oct 2026 16:17:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4c0f:2208:f55a:d12f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-169a1becf08sm36095925c88.5.2026.10.12.16.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 16:17:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:17:15 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
Message-ID: <as1qe_J37Njol797@google.com>
References: <20261002230714.507921-1-briannorris@chromium.org>
 <20261002160309.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <asEdiIT7l49vhn7i@ashevche-desk.local>
 <asPm6HYpEIAYJ4a3@google.com>
 <as074Em1m9d5s1yO@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as074Em1m9d5s1yO@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_161720_976473_5CEC69B6 
X-CRM114-Status: GOOD (  42.28  )
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

(Note to self: drop linux-stm32@st-md-mailman.stormreply.com from future
postings. It's failing hard, and not (AFAICT) just because I'm not
subscribed.) 

On Mon, Oct 12, 2026 at 10:58:24PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 05, 2026 at 11:05:28AM -0700, Brian Norris wrote:
> > On Sat, Oct 03, 2026 at 06:21:44PM +0300, Andy Shevchenko wrote:
> > > On Fri, Oct 02, 2026 at 04:03:07PM -0700, Brian Norris wrote:
> 
> ...
> 
> > > > Cc: Ulf Hansson <ulfh@kernel.org>
> > > 
> > > Can go under the '---' cutter, so it won't pollute the commit message in the
> > > Git history.
> > 
> > This is a well-documented convention.
> > 
> > Documentation/process/submitting-patches.rst
> > 
> >   If a person has had the opportunity to comment on a patch, but has not
> >   provided such comments, you may optionally add a ``Cc:`` tag to the patch.
> >   This tag documents that potentially interested parties have been included in
> >   the discussion.
> > 
> > I'm directly referencing Ulf's suggestions (Link tag), so I'm also
> > making it explicit that I'm CC'ing him.
> 
> This piece of the documentation was written long time ago before we have got
> the kernel.org controlled mailing archives (now it's lore.kernel.org). I argue
> that this piece is outdated and we need to look at all aspects of the commit
> message. Perhaps having one might not lead to the issue, but exempli gratia 20
> is. I still think it should be moved to under '---' to show the good example.

Well, it's not 20; it's 1, with a clear reason. So not sure what you're
saying. Anyway, I've prepped that for v2.

Do you think you could propose a documentation update, if it's really so
out-of-date with current practice?

FWIW, a quick look at the v7.1..v7.2 git log shows over 10,000 Cc lines
that aren't for stable@ or similar, with over 900 different addressees,
across roughly 1300 different commits. (For comparison, there are 17,833
commits in v7.1..v7.2.)

It seems like you'll have a hard job trying to apply your rule to
everybody's changes, especially if it conflicts with the documentation.

> > > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > > ---
> > > 
> > >  Cc: ...
> 
> ...
> 
> > > > +/*
> > > > + * Propagate last_busy timestamp from one device to another. This can, for
> > > > + * example, prevent overactive suspend when a dependency's usage is primarily
> > > > + * driven by one of its dependents.
> > > > + */
> 
> ^^^
> 
> > > But here you already have an outdated ones, no? Why is this not a problem?
> > 
> > The "target" device (a supplier or parent) can't suspend before this
> > point, because the dependent device still holds a reference -- so an
> > "outdated" last_busy is not relevant yet. The target last_busy *might*
> > become relevant after this point, so this is the point at which it needs
> > updated (propagated).
> > 
> > That's what I mean in the commit message by:
> > 
> >   propagate last_busy timestamps from a dependent device to its
> >   dependencies any time it may allow a dependency to suspend -- i.e.,
> >   when releasing a refcount for its parent or suppliers.
> > 
> > Please let me know if I should add some clarification somewhere --
> > perhaps also in the comments here on rpm_propagate_last_busy()? Or if
> > you see some other problem in the reasoning.
> 
> Perhaps a word to the top function comment?

OK, I've tried to factor that into my drafts for an eventual v2.

Thanks!

Brian

