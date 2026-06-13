Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1BCCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9grc44daxqBIZcosao5jKPSGCBZitxm1ELHMoNm91o=; b=rO7yb05XcZ74WdMeb4Xofcnp3H
	lbWFa/9Qg8t5DB9eosoqadiBs/gjMHnNq53PsXV8Kd/ffmIEZ2jfaQUJJ/hN4KkaDQ/lwgnlzFvOI
	hPLCiWgq0gehZPPBfdz1a0AJ3Lcfnttxj8XSliswl5NZjbz/ndMe0S25Is0XEeAwHb84lLXr6rfTe
	P/YHBmj8m20Ffj4cyecELfbei/Z+fBbuPQOpYK3hTiLAOSbnvAYom9PBEieP8Lw4p5d9kfyOQk3FF
	E0pcDrgp88ZXFg1zdUdPQ5JmdO5oT0ygRRsuktgSWqvGqT9wuT9xXUKIht43akSCkkSUex4zgDwXL
	dbOjUONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYO0i-0000000CJ7m-2OTD;
	Sat, 13 Jun 2026 13:02:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYO0g-0000000CJ5R-0z29;
	Sat, 13 Jun 2026 13:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355770; x=1812891770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uxJGwCAsMcpFZ/9RNw7yRRDOB6tqapy/6259X4loI4s=;
  b=Oju7etMKZoEbc17Fiz0v0dDpVVYglk5urSFBMgQR9GSD8oKwXQtJEeYE
   G1IHAENH7osmydGnAsfByaTim7Rmz43984NlvKSKPNHPAbakN0WdPguOt
   m4QrNWufI42H6rU5I/Z1SGJFs/lxBcKpuE8ZS03Veri9GTdpPVmyGybuB
   EixvM5dxFa/bVOhu6B9gX7q+9CEnanTLnTSCLrRXCVdTdeacfJ5CYc8ow
   Gmj9v+3T4Ff/adUm+2NvaQ6zrBfHnovfVYfDSDKfOsnivvWvCanNXmWKQ
   V++ZjeiMScKevevcW/HO3ELF8xjnQOxg4nAimfIgvfIBpQeqSo0m4cHpk
   A==;
X-CSE-ConnectionGUID: LwBdWzkLT3SsrjuQ80Sb3g==
X-CSE-MsgGUID: G4PJvkg0Ss280hEGMD7dxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82014785"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="82014785"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:00:48 -0700
X-CSE-ConnectionGUID: 9YFHfovRT2GI8xWhDYQGUA==
X-CSE-MsgGUID: xEQJQI/xSEusBaz11tHecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246931274"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.184])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:00:43 -0700
Date: Sat, 13 Jun 2026 16:00:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <ai1UeO-BZQEEheml@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
 <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_060250_307008_CBF3775E 
X-CRM114-Status: GOOD (  18.66  )
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

On Fri, Jun 12, 2026 at 04:20:18PM +0900, Chen-Yu Tsai wrote:
> On Wed, Jun 10, 2026 at 11:08 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:

...

> > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> > > +                                                       struct fwnode_handle *prev)
> > > +{
> > > +     struct fwnode_handle *ep;
> >
> > Unused?
> >
> > > +     while (1) {
> >
> > This is usually harder to read and follow. It's like "pay much attention on
> > the code", but here no rocket science, no code to really pay attention to.
> >
> > > +             prev = fwnode_get_next_child_node(port, prev);
> > > +             if (!prev)
> > > +                     break;
> > > +
> > > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > > +                      "non endpoint node is used (%pfw)", prev))
> > > +                     continue;
> > > +
> > > +             break;
> > > +     }
> > > +
> > > +     return prev;
> > > +}
> >
> > So, this can be rewritten as
> >
> >         ep = prev;
> >         do {
> >                 ep = fwnode_get_next_child_node(port, ep);
> >                 if (fwnode_name_eq(ep, "endpoint"))
> >                         break;
> >
> >                 WARN_ON(ep, ...);
> >         } while (ep);
> >
> >         return ep;
> >
> > But also big question why? to WARN*(). There is no use in the entire
> > property.c.
> 
> Will drop. This function was lifted from drivers/of/property.c then
> adapted to the fwnode APIs, so it still has the structure of its
> origin. With the WARN() gone, rewriting it as do {} while() becomes:
> 
> do {
>         prev = fwnode_get_next_child_node(port, prev);
>         if (prev && fwnode_name_eq(prev, "endpoint"))

'prev &&' is not needed.

>                 break;
> } while (prev);
> 
> return prev;

-- 
With Best Regards,
Andy Shevchenko



