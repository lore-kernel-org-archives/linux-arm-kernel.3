Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB0DCF65D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWnRMm8JIW6RRZE3bFdtRoDUnwtaey1IxHsaQqPMrzA=; b=xIU89/PUmBw7kZdRpm5LRdaizq
	uYm/pFIOOY36G2fUQ5ZGr1bSW/2R2r962Tc8Nwjmmnoz6RNKm3NVenN7vVyf3qBx5DnPIgveloJX6
	brQ3mTreGd025Qpj/vyo2chd+/+mzcDd5u0ZqbYq0Z9RDdxumXxQFxyLoztuC/8x52sbDYfArwYsQ
	s8j9q7LCg1O5HVDDDX2qrzErUa8jfMPHyQFsuEefyPuSxNetkGk/0YeaeJe1iqrP6+mgv3QuzSKBH
	CmZxYkscSqetF4/pWixabWPFOKaTNPg1sxh39SjhB/tPqIxutl5VydajdktBeACwQWubvtoqiu3kg
	0gTVgC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkJ-0000000CGwn-29FP;
	Mon, 26 Jan 2026 10:22:59 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJkG-0000000CGwC-2xgl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422976; x=1800958976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YmwLlwxCohpODw33KGlJTwGnb4/sXa4Sj0U7Xi4pE+8=;
  b=iDPdyFDV8H+08iL6MqCowQusdUI9MKcYUUvplLDJO1euDlJA/6W29iBV
   96hgyrtkZYMFB3olMbbV8KMh7gnz/PFWCH3cTlRqRZUV6WPVu7Vp5JyRb
   QsF4yJOmaT4+1rTPc/BTBwPKz0CsK00SEhm0UfpmMy/7yxCWezR3WkFix
   rjwzT30tB65flLos6qtOfOEG+bD1HfoYUoya7u49lEw/uI37eBEWZxhKJ
   /scOqf1EAUaWvHomcNjLbkUQ9jjRfyCsRfI6YO8uGVbIsys1vSjnktkXF
   jhgf1jZH6BdxrlX1ybyGtP5fyJOzHBuZyPVBqkx7Vd8h1dVnzOSvcA7bs
   w==;
X-CSE-ConnectionGUID: +fM31vseQdGW62Mb9ndSEw==
X-CSE-MsgGUID: fVWnT8PTSdSUtVkMRCOG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70313141"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70313141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:22:56 -0800
X-CSE-ConnectionGUID: dluJNQIKS+uO/wx/ncC5bw==
X-CSE-MsgGUID: UbxLvLiVR+28CR/E2fga4A==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:22:47 -0800
Date: Mon, 26 Jan 2026 12:22:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 0/4] hwspinlock: refactor headers into public
 provider/consumer pair
Message-ID: <aXdAdZRBH7ZhZtju@smile.fi.intel.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
 <aXc7DxsqiCGdfzxi@smile.fi.intel.com>
 <20260126111440.67394323@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126111440.67394323@posteo.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_022256_793614_E5AA01EA 
X-CRM114-Status: GOOD (  36.00  )
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

On Mon, Jan 26, 2026 at 10:14:46AM +0000, Wilken Gottwalt wrote:
> On Mon, 26 Jan 2026 11:59:43 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Sun, Jan 25, 2026 at 07:46:51PM +0100, Wolfram Sang wrote:
> > > TLDR: I want to create a hwspinlock provider outside of the hwspinlock
> > > directory. So, I refactored the headers into a provider/consumer pair.
> > > Which seems to me like a reasonable seperation anyhow. No functional
> > > changes. My build tests went fine and buildbots are happy, too.
> > > 
> > > Longer explanation:
> > > 
> > > There is a device (MFIS) in newer Renesas SoCs which combines various
> > > things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
> > > strictly separated. Registers are kind of mixed and its register
> > > unprotection scheme will need one of its own locks. I tried various
> > > paths to handle this device (MFD, auxiliary bus) but I concluded that
> > > the sub-device dependencies give enough reasons for a single driver in
> > > drivers/soc/. So, this series will allow me to instantiate a hwspinlock
> > > provider from the other directory.
> > > 
> > > Patches 1+2 do the actual refactoring with a fallback being in place. I
> > > used '-B' with git-format-patch in this RFC, so the actual changes are
> > > more visible when the headers are moved.
> > > 
> > > Patch 3 converts all the users. There are not many. We could try to get
> > > all the acks for this single patch. Or I can break it into single
> > > patches and send them to subsystems. I don't mind.
> > > 
> > > Patch 4 simply removes the fallback.
> > > 
> > > Looking forward to comments on this approach. If the hwspinlock
> > > maintainers like it as is, I would kindly propose to apply patches 1+2
> > > after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
> > > avoid chasing a moving target and b) this would remove one dependency of
> > > the hwspinlock driver I originally intend to upstream, of course.
> > > 
> > > I would take care of patches 3+4 as needed.
> > > 
> > > A branch can be found here:
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes
> > > 
> > > Patches are based on linux-next as of 2026-01-21.
> > > 
> > > Opinions?
> > 
> > I don't like the idea of sharing internal stuff. Why would we need to have
> > a struct hwspinlock to be visible?
> > 
> 
> I see what Wolfram wants to achieve. It is the same issue I encounterd while I
> wrote the sun6i hwspinlock driver. Currently it is impossible to write external
> (out-of-kernel-tree) drivers because of internal structures. And it was a pain
> in the ass for testing purposes. I prefer to be able to write external hwspinlock
> drivers.

I am not against _that_. I'm against the implementation. At least I can't see
the impediment in making that struct opaque. Maybe I missed something. That's
why I'm asking why we need it to be visible to the entire world.

-- 
With Best Regards,
Andy Shevchenko



