Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F15C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br152j0WOMhuT7TlkN9MSTRc/6dab39kFIjVrdSzeQw=; b=xSukvsDGLZlntRKecnML44dDSI
	fx2VVJGDx0V//t26HphIxYwrL4IUT6j1tnqMSkS5tQkB0OLPV3sYcJGAf9Y6/5aGV+viaqV2W8bca
	DVnmd1kYkvuUb8v1R+D1AGK0EjrSWaZ+KR5n5pA5pEELWtvByDI9CQXV1o2Rw0slzXz5dISDHsFH0
	fXGzbEnAIU6SNbGpvY3929xokTKuPC6S0r+hIem27pnW2MLq3SCTznVSVkoRobNAP49OEjrXmQRGF
	Q1vGOi8JyTMjcKZuy0ZJB3V18J+2mKcWL9M8kY40JoK9Kg0jZmKG5taa2xdncjZ8ZrDCLJz5zCOB2
	oj4kIn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhG-00000008TyN-3Bu5;
	Thu, 27 Feb 2025 19:37:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfD3-00000007orD-0lru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740667797; x=1772203797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+J4TVv0pmFUhasUbdo9cIKQLHkTdGgPrNJ8G6n+C/8=;
  b=lTZ6W9KywG0wSXdYZhOi/jxRFvoFdM4ARzxioaKlfdFhoR35Vi++DeUs
   xG5wtxALBfkJ9AjoXVijH0itE02xcwCLeq5dw1rbhvWdN70R4IpweUREZ
   pbaWt+0l0vSYMjWaRpFMX9fMcuzvbNQeZ/Y+g5ZwXUKEx5U/xgVWBNMQq
   xR9CJH6/kwZOGVtgd5r3WbszOOWS4ysfLT8NDcDT0okyNyQkEU6wNCvG3
   elxamHR9gB139wpYmfo1cHlkwNvWrotMPbAFqjbc/gCCWK+O+Aba428GS
   MZy8Wv4zksorXu9rZoDgdyvqJAGRcibcgi7U3pUCnPA6NW+vJjLhCv8mp
   A==;
X-CSE-ConnectionGUID: ERIFpSfPQha5CMq9cjN1Jw==
X-CSE-MsgGUID: xQsMCx0tQ9aGt6+aQfnlbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40735925"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="40735925"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:49:55 -0800
X-CSE-ConnectionGUID: QY9xDufQQdmIzsMP9JwSew==
X-CSE-MsgGUID: mjWrqQyOSxGjmaB+28Ev5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117070355"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:49:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnfCp-0000000Fcnn-1wW6;
	Thu, 27 Feb 2025 16:49:43 +0200
Date: Thu, 27 Feb 2025 16:49:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
Message-ID: <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
References: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
 <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
 <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064957_237542_CA660900 
X-CRM114-Status: GOOD (  49.72  )
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

On Thu, Feb 27, 2025 at 10:01:49AM +0200, Matti Vaittinen wrote:
> On 26/02/2025 16:11, Andy Shevchenko wrote:
> > On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
> > > On 25/02/2025 15:59, Andy Shevchenko wrote:
> > > > On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
> > > > > On 25/02/2025 12:39, Andy Shevchenko wrote:
> > > > > > On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
> > > > > > > On 25/02/2025 12:21, Andy Shevchenko wrote:
> > > > > > > > On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:

...

> > > > > > > > > 
> > > > > > > > > I did not check how many users are you proposing for this, but if
> > > > > > > > > there's only one, then IMO this should not be a global function yet.
> > > > > > > > > It just feels to special case to me. But let's see what the others
> > > > > > > > > think.
> > > > > > > > 
> > > > > > > > The problem is that if somebody hides it, we might potentially see
> > > > > > > > a duplication in the future. So I _slightly_ prefer to publish and
> > > > > > > > then drop that after a few cycles if no users appear.
> > > > > > > 
> > > > > > > After taking a very quick grep I spotted one other existing place where we
> > > > > > > might be able to do direct conversion to use this function.
> > > > > > > 
> > > > > > > drivers/net/ethernet/freescale/gianfar.c
> > > > > > > 
> > > > > > > That'd be 2 users.
> > > > > > 
> > > > > > I haven't checked myself, I believe your judgement,
> > > > > 
> > > > > I took a better look and you obviously shouldn't believe :) The gianfar used
> > > > > of_node instead of the fwnode. So, it'd be a single caller at starters.
> > > > 
> > > > ...which is the same as dev_of_node(), which means that you can use your
> > > > function there.
> > > 
> > > I'm unsure what you mean. The proposed function
> > > device_get_child_node_count_named() takes device pointer. I don't see how
> > > dev_of_node() helps converting node to device?
> > 
> > dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
> > it means that there is no difference which one to use OF-centric or fwnode
> 
> The proposed device_get_child_node_count_named() takes a device pointer. I
> don't see how dev_of_node() helps if there is just of_node and no device
> pointer available in the calling code.

???

The loops are working on

	struct device_node *np = pdev->dev.np;

which is the equivalent to

	struct device_node *np = dev_of_node(&pdev->dev);

which takes device pointer.

> (Well, as I wrote below, I could
> alter the gianfar code by dropping the gfar_of_group_count(), so that I have
> the device pointer in caller). Anyways, I don't see how dev_of_node() should
> help unless you're proposing I add a of_get_child_node_count_named() or
> somesuch - which I don't think makes sense.

Are you forbidding yourself to change the function prototype to take a device
pointer instead of device_node one? :-)

> > API in this particular case. Just make sure that the function (and there
> > is also a second loop AFAICS) takes struct device *dev instead of struct
> > device_node *np as a parameter.
> 
> I think I lost the track here :)

Make gfar_of_group_count() to take device pointer. As simple as that.

> > > I think I could actually kill the whole gfar_of_group_count() function and
> > > replace it with a direct call to the device_get_child_node_count_named() -
> > > but I am not at all convinced that'd be worth including the property.h to a
> > > file which is currently using only of_* -stuff. Well, I suppose it can be
> > > asked from netdev peeps but I am not convinced they see it as a great idea.
> > > 
> > > If I misunderstood your meaning - please elaborate.
> > 
> > The driver is quite old
> 
> I remember having to modify this driver somewhere around 2010 or so. :) Time
> flies.
> 
> > and has a lot of room to improve. Briefly looking it
> > may be almost fully converted to fwnode, but it's not your call (only if you
> > wish). Nevertheless, using agnostic APIs if they reduce code base is fine.
> > We have drivers that do OF and fwnode mixed approach (for various reasons,
> > one of which is the new API that is absent in OF realm.
> 
> Well, we can propose this to netdev people but I wouldn't be surprized if
> they requested full of_node => fwnode rewrite instead of removing simple
> looking loop and bringing mixture of fwnode and of_node in driver.

Without doing the proposal we will never know what they will think of all
this...

-- 
With Best Regards,
Andy Shevchenko



