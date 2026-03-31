Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5427D1061B26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gc+eYhkV9zE63J2DSp6MdJBxMIZ+phr6V0MIve/x9bI=; b=lngBuNNZer7tCx+bkS2c5rawVO
	qm+SyTTQN/zgz1/mi2hSyUCWzpGeRTdHjAPJISLnaJKOKJBRhbtpmN+cxvBChk8/yQ9SRe6WEGj/5
	gshIewVAfL2NFqMVTmb520uIzMXCgVZb7VjjjZp0OrP/G/WWFkYo1rfin8ZvYnUil8pcW/u5cPb4E
	YjhWcNCxujonlulyxxNjnQyInMQjpSuEXa/fCe30rAIJtANQP6mYM8xth2s/USBdhurhA8eGR5fBg
	pZaWJeaIyHviOVHRv6YRvtlwR26mun23kHQugdyQPAvJl4vp5Jf/rfQRJtd5jheref6jbQ/Bk7ehQ
	RvMsC9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WyZ-0000000CpfN-4BDG;
	Tue, 31 Mar 2026 11:09:40 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WyW-0000000Cpei-3o9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774955376; x=1806491376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LpiNwcecD6qE6BaocrRQkrHduswXspS89v1SmDxcGYY=;
  b=gwLhrCz7THVDua2Xkomb5/3CwIe64YkS7Oh7kjBTlJcfAAL8BXW2llQH
   ne/WU+SOo3L3bdnyyo4y1Pv9ZBfMB/NMlnRn1bn8Gnu97ctBaN4vF90rz
   giruMMTnQWvDbfIu0+C0KUvUHoe5sFOg1rntKVeCd3mvdfdyqwhaGytsO
   nGS//LY+9N4R7MfekpckbNYnbtpTJtp38Q+wl7tEdRP0AR1k7zzm9KrIW
   WDbM9BZVVXPPPUUx4GGnXvGEP1NHfvdAvRqG04MjmmwnCGsq33eKiwwxS
   tWX17A8efbFq2qnyUjKUeOIJsXy4ofXeJaM6A14C5U0CVYuaEkmBo/YZ/
   w==;
X-CSE-ConnectionGUID: NPDGdlMhTwiGyDh3omXaWg==
X-CSE-MsgGUID: Tu6FUjlLRzqz7BBaYKybpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79564592"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79564592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:09:35 -0700
X-CSE-ConnectionGUID: gzK6vAGlTtOKb5e4wFOCIQ==
X-CSE-MsgGUID: Cb2BImrJSVqLNPi0PBgcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231267662"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:09:31 -0700
Date: Tue, 31 Mar 2026 14:09:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acuraLhLVgyP-LUK@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local>
 <acruxMNdnUlyRHiy@google.com>
 <acto3TE1AR8iTzF0@ashevche-desk.local>
 <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
 <acuMD7Oly4XWW4n8@ashevche-desk.local>
 <9359e475-fc8e-4d32-9ab4-383710170553@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9359e475-fc8e-4d32-9ab4-383710170553@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_040936_987182_97C3D370 
X-CRM114-Status: GOOD (  28.33  )
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

On Tue, Mar 31, 2026 at 12:45:59PM +0200, Arnd Bergmann wrote:
> On Tue, Mar 31, 2026, at 10:55, Andy Shevchenko wrote:
> > On Mon, Mar 30, 2026 at 11:52:34PM -0700, Dmitry Torokhov wrote:
> >> On March 30, 2026 11:25:33 PM PDT, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> >On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
> >> 
> >> The code section will be discarded when the kernel finishes booting so it
> >> only increases image size on disk. 
> >
> > Almost true. Interesting microblaze case, where it's not discarded.
> > But I can't find where it's actually used on any architecture.
> 
> I'm pretty sure that is just mistake
> 
> >> >A bit of archaeology:
> >> >
> >> >The first time it appeared was in the bcc2152647b8 ("Import 2.4.0-test3pre3").
> >> >Then somehow spread a bit (but not much).
> >> 
> >> And it shows how useful it is. Maybe it had some purpose a long time ago, but
> >> at present time this code will never be executed since it cannot be built as
> >> a module.
> >
> > Are you sure about definition of __exitcall? As I read init.h the macro
> > is defined when it's not a MODULE.
> 
> I also tried to trace this back now, and from what I found, both
> the __init_call and __exit_call annotations gained __attribute_used__
> back in lniux-2.6.0 as a way to prevent both gcc-3.3 and gcc-3.4
> from warning about unused functions or discarding initcalls that
> are actually required.
> 
> My best guess is that __exit_call should just use
> __attribute__((unused)) instead of __attribute__((used)) and
> have the compiler drop it from built-in code instead of the linker:

But why do we need that at all? Can we just drop the full section for good.
Or i.o.w. where exactly is it being used in the current kernel?

-- 
With Best Regards,
Andy Shevchenko



