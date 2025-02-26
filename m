Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41771C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJOVUaEbEe6p/jkQ+JF9OschaIAolCJP1VscMEZ1ICs=; b=2vQ6l8xTFxiljxXI2s8PVuy7cM
	zqQngJxG8iOBTr7zC+1TYyEJ4qLe8RkwtZM094d/aYO46t+F79+aUjhaDMyVgNfDrEwDwj4pKHAuo
	eb16MJ2s6E+JpaSGPttqPlayo0Ix0o4Wnn5Xv0LLYvx8CBjSbVmkPtyM7fwEJi2cP8tVqjAwkVwNO
	HR4V2uGEDtOXAjMUcRw/1EajzXrozvMtLUXG8HTqnuf2AwLVEd5HhStj9jnNYP9xsdg86qIKjCObN
	SgfzacVYVlTu6nODgGmQTBSAzdoSn5G/z5hPtdgSV1KgBSVKmqVU/Gs1fIElfNQxMGhTcFxhcn7Jl
	W8/c2rhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFs-00000004HSU-2KVD;
	Wed, 26 Feb 2025 15:23:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIBz-000000042G3-16fb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 14:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VJOVUaEbEe6p/jkQ+JF9OschaIAolCJP1VscMEZ1ICs=; b=mJYb8cfJrmIoTEI+xXOKAVs4/J
	7+bgnBwjABW3FK03ANmtSSSh7h59BE2YDtJmMMTwPdaaN+KSRu4lUTlrXHkFGXRRfDMtZlbeUcbiY
	diZtWvhIK63bUkDuNwhJB8zpPH64JQWBAmkZbFj23pHJrWV1E4AZ8H6E4CixEHi+10u23KiMgzkgT
	QKnL66Eri0N8ke06GnP3psMqjuBHYBwXrDHJXmYzqIEPmubd36o7nc6VnWBBUgeAjfOaqw4RpKzKd
	H0pxGr18NRLAfRzwKh+QLpTS7pR1w17dRo0CPqqXoUKHJO4O/KitKu9uczaV/PDHlbR/dtG6w3WEc
	vzrOO+8Q==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIBv-00000003cQw-2L2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740579315; x=1772115315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DQfqoYcLRD2Zeo+43lklnMk6+hDgT7YZ/1xvKUYxQ1o=;
  b=lQed7ImJVoAdiuv4xb0boVfzBv/Cab7Z/LIvNo9C6ua91WCkSHH0jZvd
   RKsnyGOI6CiqD4MtD5B1cSgxTKNw2of9N88H9Zp+IpSU+eSN1q69up4BX
   wuW0sTrXCqrkfVFgl5wvl7ZBCFPkdzLY7vk1B6yPKmarr7cBYm1qRKPqU
   sB+/M+OTai/wYVdOCV5xoLWIMcSV7gvJacZ1F2oKHwMCVjKwhuPMdp0ys
   lQ5VUzCKkOSgvBwyLJ1U7gPHg76Gkz4VL2f9DQS1R1l48KU+tnbBMJ9um
   k75ZTKgzCzv+s9/CB7TDGMiHkFYTTRxQfNp9DrXKLlaP3nSprvdq9fjOI
   w==;
X-CSE-ConnectionGUID: vQsxp4dUTiqT7lEj8yECaQ==
X-CSE-MsgGUID: VzJboMjVSC+Es+/LnMBoUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52817164"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="52817164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:11:23 -0800
X-CSE-ConnectionGUID: SfzjqrcRQU6U9pWwkoyKjw==
X-CSE-MsgGUID: DAtu5ZbIRzCICP2T7HfhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121960718"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:11:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnI7y-0000000FLJp-1jew;
	Wed, 26 Feb 2025 16:11:10 +0200
Date: Wed, 26 Feb 2025 16:11:10 +0200
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
Message-ID: <Z78g_uiXumn4mvET@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com>
 <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_141516_348789_8F770AAD 
X-CRM114-Status: GOOD (  35.57  )
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

On Wed, Feb 26, 2025 at 04:04:02PM +0200, Matti Vaittinen wrote:
> On 25/02/2025 15:59, Andy Shevchenko wrote:
> > On Tue, Feb 25, 2025 at 03:29:17PM +0200, Matti Vaittinen wrote:
> > > On 25/02/2025 12:39, Andy Shevchenko wrote:
> > > > On Tue, Feb 25, 2025 at 12:29:31PM +0200, Matti Vaittinen wrote:
> > > > > On 25/02/2025 12:21, Andy Shevchenko wrote:
> > > > > > On Tue, Feb 25, 2025 at 11:40:16AM +0200, Heikki Krogerus wrote:

...

> > > > > > > 
> > > > > > > I did not check how many users are you proposing for this, but if
> > > > > > > there's only one, then IMO this should not be a global function yet.
> > > > > > > It just feels to special case to me. But let's see what the others
> > > > > > > think.
> > > > > > 
> > > > > > The problem is that if somebody hides it, we might potentially see
> > > > > > a duplication in the future. So I _slightly_ prefer to publish and
> > > > > > then drop that after a few cycles if no users appear.
> > > > > 
> > > > > After taking a very quick grep I spotted one other existing place where we
> > > > > might be able to do direct conversion to use this function.
> > > > > 
> > > > > drivers/net/ethernet/freescale/gianfar.c
> > > > > 
> > > > > That'd be 2 users.
> > > > 
> > > > I haven't checked myself, I believe your judgement,
> > > 
> > > I took a better look and you obviously shouldn't believe :) The gianfar used
> > > of_node instead of the fwnode. So, it'd be a single caller at starters.
> > 
> > ...which is the same as dev_of_node(), which means that you can use your
> > function there.
> 
> I'm unsure what you mean. The proposed function
> device_get_child_node_count_named() takes device pointer. I don't see how
> dev_of_node() helps converting node to device?

dev_of_node() takes the device pointer and dev_fwnode() takes that as well,
it means that there is no difference which one to use OF-centric or fwnode
API in this particular case. Just make sure that the function (and there
is also a second loop AFAICS) takes struct device *dev instead of struct
device_node *np as a parameter.

> I think I could actually kill the whole gfar_of_group_count() function and
> replace it with a direct call to the device_get_child_node_count_named() -
> but I am not at all convinced that'd be worth including the property.h to a
> file which is currently using only of_* -stuff. Well, I suppose it can be
> asked from netdev peeps but I am not convinced they see it as a great idea.
> 
> If I misunderstood your meaning - please elaborate.

The driver is quite old and has a lot of room to improve. Briefly looking it
may be almost fully converted to fwnode, but it's not your call (only if you
wish). Nevertheless, using agnostic APIs if they reduce code base is fine.
We have drivers that do OF and fwnode mixed approach (for various reasons,
one of which is the new API that is absent in OF realm.

-- 
With Best Regards,
Andy Shevchenko



