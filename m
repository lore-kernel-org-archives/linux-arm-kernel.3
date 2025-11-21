Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42509CFA75F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1dPKtKKJmj3IMfe4CyfskOugiUHTRNyn0MFvMIRuU0=; b=02ksvrdamDMd3jYcf/v2dnqapm
	hZDkiJ7PuZbzVSRndo6Mz5S7/2iqvYu69Ec5Payw1hP9ulnBEd6AgWxi+DahnzGMG6nCM9jnRBM5I
	4hB1iEjmwmscybfd4e59CZOEpCUsx98j9rWYSyUhjozUNrVFvG52/cEPAg8WW7SjG9vnaWAq4l24D
	sshR6j66qu3uNMdP2/9EoXFHlxKv/qaEoAJZkl9fizJ7pnJISoWif7Xt9cu9ee+BwC1eukOPdl2QI
	nJoRgRJ0oS6UK4oy5655NN+1YZC4MHFkysnyGnFQqypzsqI5+tIk5BPbUei/RXKEl8eYG3f4+mbS/
	UaSTwNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNJU-000000088UC-3mWL;
	Fri, 21 Nov 2025 09:20:20 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNJQ-000000088Tp-34v5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763716817; x=1795252817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIAMIZ0sD0LbqFA5wDFNCQuWZ6L0827P8gGkWTNvHMw=;
  b=WGH2kcL8xDpjgWvwSxT5kvOrGiFrA1z5wppALFMznbF5hQbdNrKG4ZUI
   TgvO6eWpumoNSkOzpxJxvbvoYWEBX52B0j1EIBLz9N4aHlfNbckTzZKzv
   N7QVzaHGPb5TToZOh8MTf2SsFY/vR2Ul316Txrk6xU/Ekz6/5H9O90S8r
   eoMFcqkJUVYEDRloZX5OKrpmzt2BCn33x2l8/0BePapEBTgInrYyy46+5
   LkxHaJyI+l0NauylPgopxw7yoLJQdpTH924goLIz4NxqkMCVYSumjaJlv
   wHfia+Bvq3ZGyStY6Vaycooc78x14r9a6VgCYy8YoxyoMUC05z/WqocVQ
   A==;
X-CSE-ConnectionGUID: jFDyX1aHSKqaSsNHD1xe2Q==
X-CSE-MsgGUID: P+52JuHcQ9WeKrA3z0QBYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65842353"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65842353"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 01:20:15 -0800
X-CSE-ConnectionGUID: Q13u732IQoKmAyiDHRVh9w==
X-CSE-MsgGUID: Th/xPFcITrmd6Q892tAdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="228939278"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 01:20:10 -0800
Date: Fri, 21 Nov 2025 11:20:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aSAux4n-1hzHfD6L@smile.fi.intel.com>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
 <aR22decsE0DYDUnS@xhacker>
 <m28qg0mnvl.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m28qg0mnvl.fsf@free.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012016_815779_DBA9F81B 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, Nov 20, 2025 at 09:48:30PM +0100, Robert Jarzmik wrote:
> Jisheng Zhang <jszhang@kernel.org> writes:
> > On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
> > 
> > hmm, each controller adds 16bytes, then even on 100 controller platforms
> > 1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there such
> > platform?
> Yes, actually most of them have around 64MB, at least the pxa25x and pxa27x.
> The pxa3xx might have more (thing 128MB, maybe 256MB).
> There are very old platforms, we're in 2003/2004 there ...
> 
> > From another side, recently UP support is removed from the core sched,
> > that removing adds more .text and .data overhead, so if the users really
> > care about this kind of 16bytes, it means he(she) can't afford even the
> > 16Bytes overhead, then I bet he(she) the always SMP in core sched, so
> > why not stick with the old kernel? What do you think?
> I think I would go with Andy's proposal, decouple the changes :
> - keep your changes in the PM callbaks
> - remove your change (put back the ifdef) in the data structure

It can't be done like this, unfortunately.

Either we need to waste a pointer and kmalloc() overheads at runtime, or keep
these bytes for !PM cases.

Alternatively we can drop this change and simply add a comment explaining
the memory requirements and why we don't want to always waste those bytes.

Ideally would be good to have some kind of struct_group() macro that is
dependent on IS_ENABLED() case. It may help in many cases like this then.

-- 
With Best Regards,
Andy Shevchenko



