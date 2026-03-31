Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A32FF60D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vPhM1HlGd7sZKnJ0Xu3/FLaiZPI+74K/5fhTjFXwSE=; b=TFfLsWSXvSY/mhZEgEj16Bp8kK
	Ck54TtWWsI2ulw1bfseWoUbmjDfLoEQz66fuRUyBGbSiqeNSVYHNXaxhAZzFO6fx4P3M1KjdN4yBC
	mDUJ6bG/oz4FrOJ7+mH7Hu4BUAMyu6RIOyMYZ9zl8yWTYvgrX0q3KCeosbqeuSYaDNmcPG19UFOKt
	/0x7MN4n0KUAyDL/6fLd8pdG0pY1T7u/Gb/Ngl0hGMICFUmM8iSR02vBdH6LfkEeTffD5vHzFQ/sj
	P8uIe8wXYjneTe+ymtlsEsMXoRRJmfIU+C1KJEAp66feYrzS6sCmR8BRLSNaB2/ngyajn+T99s878
	ZjFiq6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ut9-0000000Cddi-2F5v;
	Tue, 31 Mar 2026 08:55:55 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ut6-0000000CddJ-1jDl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774947353; x=1806483353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mjXdhJ0yvbX1f3PTXSl1lMhjR7w4O0ZEOdEGUX/Cgvc=;
  b=h1sqxCBhJGVm/7xh/vC7RWfujNQQkNS/hkPY4hfqXtJUjPPhmXN8wMZD
   CEBi8L58JBh8QYjQHACOsqmpR2j123PJfFdRTC1XDfEfnt7S+zhYzAF7X
   fQ1mrKgtUDgCHyaLtOM+nYL10g2WlCVx4JGMllSh/FvMunCRriThUsE5w
   D+zKm62ayl/LmKCjgv40uDQ+RErrOrpV9ppApIMlwASDsLdU1Xjjhm5NK
   Xe1CKkBcMXWMekz6wTB+hym1PNNOqF7cESLkRTIhcDY6ysQXnj23uubv1
   6q6HArbJmFK0HSmXqIhobMJIKEb6tlVI/9qSYqZloGpEUEuiHMdDSxwtm
   g==;
X-CSE-ConnectionGUID: xfgaKH8dT1WSac4lxR0poA==
X-CSE-MsgGUID: b9DSw7o6RnK6eUzWn3Ob5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75669470"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75669470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:55:51 -0700
X-CSE-ConnectionGUID: xJ1h9dFFR2S3YhGdPQQcnw==
X-CSE-MsgGUID: ZNoiYFOwSnK2Fp72Y8dkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226272857"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:55:46 -0700
Date: Tue, 31 Mar 2026 11:55:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acuMD7Oly4XWW4n8@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local>
 <acruxMNdnUlyRHiy@google.com>
 <acto3TE1AR8iTzF0@ashevche-desk.local>
 <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_015552_501469_6FC35D13 
X-CRM114-Status: GOOD (  23.58  )
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

On Mon, Mar 30, 2026 at 11:52:34PM -0700, Dmitry Torokhov wrote:
> On March 30, 2026 11:25:33 PM PDT, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
> >> On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
> >> > On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:

...

> >> > > -static void __exit software_node_exit(void)
> >> > > -{
> >> > > -	ida_destroy(&swnode_root_ids);
> >> > > -	kset_unregister(swnode_kset);
> >> > >  }
> >> > > -__exitcall(software_node_exit);
> >> > 
> >> > Why? What's wrong with the __exitcall?
> >> 
> >> It's dead code. Always was, always will be.
> >> 
> >> Maybe split in a separate patch, but I sometimes feel the idea of "one
> >> change" is taken to extreme and adds to both developer's and maintainers
> >> burden by needing to keep track of extra patches.
> >
> >Why does __exitcall() exist then? It's also used in other places.
> >I think it's generally good to have a possibility to clean up
> >after run.
> 
> The code section will be discarded when the kernel finishes booting so it
> only increases image size on disk. 

Almost true. Interesting microblaze case, where it's not discarded.
But I can't find where it's actually used on any architecture.

> >A bit of archaeology:
> >
> >The first time it appeared was in the bcc2152647b8 ("Import 2.4.0-test3pre3").
> >Then somehow spread a bit (but not much).
> 
> And it shows how useful it is. Maybe it had some purpose a long time ago, but
> at present time this code will never be executed since it cannot be built as
> a module.

Are you sure about definition of __exitcall? As I read init.h the macro
is defined when it's not a MODULE.

Anyways, if we going to drop that, it should be in a separate change
explaining all these.

-- 
With Best Regards,
Andy Shevchenko



