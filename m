Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DACD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKFdCB2wZNv95BnFtdwGhXUwjN9oGo5H15q3Af+UsUE=; b=oVo2NuLymw+FCmKNFr6Pyv62g5
	l8OQPHGfe+SUgRdFP7616NFhwzYbgZwZ/eQJHMdxDuYob9g/Ud+FCTh8fcdaeRba+7M9AJnKkrzAP
	xNFWE8RChL64MjUm3s0ITUHB8z7lYdnjHGJVwd/B72/biBZRbrL87qQVraWUzMHQESJFyoI8dAPUB
	hXxcZdOjjEGfWpdm+EXo2FiTqNd19h0PH7RR3+qzsfI88b5FSnrn5X7VBIs+JNc+6FVVD+L1+uvzN
	55EVNpLR2R6xAkw4mHpf/LATdJ5QHlN2v1aJpfDUaXs2dID6WeLanvglWN5dnCuRTfFhZ10uRVdKF
	kWsQ+RLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxq8-000000062nw-48wg;
	Tue, 23 Jun 2026 09:54:44 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxq6-000000062nS-2DfP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782208483; x=1813744483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkFETun7c0Vx4s11aeriB3dobfV+C7MaHaRn0CTIr/s=;
  b=C+9taZSLjnPwV95MSZDaxcSNc9LBDjQpQrBz6zgSam/SYq6YPhmMOhiZ
   s2xZVSX+7PrWtql5B0F47yqDuZIRi3WxsH4harVgQzH5qcL72GHrFXZhE
   bs6QDpn6ZUCntjwxTsZqTWRbnV6ukwDWE/SYJlFces/Fz5nGbMdAly4h4
   eHGPzt6MYdBb/RZQ1D532okIr3yJkNgCljYd7IlUqmuJMV84GPOkRvxx5
   tsV2j+AlgOdWK5HeypDkruytlrgfAhUxp0CiTYvJIqOXAT0jb65FPW0Ne
   A19hb7fCl5VkvWIQBYqrMHbnBopxut6CB/W5dtakM7GGsvRoJFSrHkxfA
   Q==;
X-CSE-ConnectionGUID: nDYVXfrQTCi/NCPNz6ZcIQ==
X-CSE-MsgGUID: ASI96ms7R1+iTgaXcthtew==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93537213"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93537213"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:54:42 -0700
X-CSE-ConnectionGUID: q3/WUKbKSVmUc1Zi61eWcg==
X-CSE-MsgGUID: ufxCW/2fRTqRcD7q5+9NWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="248326947"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 02:54:39 -0700
Date: Tue, 23 Jun 2026 12:54:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Olivier MOYSAN <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: stm32-dfsdm: Treat flags as booleans
Message-ID: <ajpX3E2zHYh2e8FG@ashevche-desk.local>
References: <20260612215151.1886851-1-robh@kernel.org>
 <ai1dhJWb9vKqxEEe@ashevche-desk.local>
 <20260621151026.69714694@jic23-huawei>
 <46fce99d-9dd5-435b-95cd-86ed4771aa83@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46fce99d-9dd5-435b-95cd-86ed4771aa83@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_025442_577988_EE9F517C 
X-CRM114-Status: GOOD (  34.33  )
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

On Tue, Jun 23, 2026 at 11:43:49AM +0200, Olivier MOYSAN wrote:
> On 6/21/26 16:10, Jonathan Cameron wrote:
> > On Sat, 13 Jun 2026 16:39:16 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > On Fri, Jun 12, 2026 at 04:51:50PM -0500, Rob Herring (Arm) wrote:

...

> > > > -	ret = of_property_read_u32_index(indio_dev->dev.of_node,
> > > > -					 "st,adc-alt-channel", chan_idx,
> > > > -					 &df_ch->alt_si);
> > > 
> > > > +	df_ch->alt_si = of_property_present(indio_dev->dev.of_node,
> > > 
> > > I believe it still has another (serious?) issue. We usually don't use indio_dev
> > > for device properties. It's not a device that is described in DT.
> > > It seems the only driver in IIO that does that. Note, I haven't conducted any
> > > deeper research, it might be (however I'm quite in doubt) that this is correct
> > > use and one device registers a few indio_dev:s.
> > 
> > It is curious.  The registration sequence in this driver is complex, but I'm not
> > seeing anything that sets the fwnode for the struct iio_dev->dev before calling
> > the init() callbacks that end up in this code.  It is set later by iio_device_register()
> > (iirc that has something to do with consumers turning up later).
> > 
> > St folk could you take a look at this and see what we are missing
> > if it does currently work?
> > 
> > For now I'll apply this patch but might need to drop it if a fix clashes
> > with it.
> 
> I confirm that the current legacy path is functional
> (With the st,adc-alt-channel property fix applied)

Yeah, it's here
https://elixir.bootlin.com/linux/v7.1.1/source/drivers/iio/adc/stm32-dfsdm-adc.c#L1772
and should gone. Basically one wants to replace all these to use device and
fwnode propery APIs and proper device node, without that hack.

> It currently works because the driver initializes np from dev->of_node in
> probe, and that value is then used in init callbacks.
> 
> I agree that this approach is not robust, as it depends on initialization
> sequencing and on using an IIO object that is not the DT owner object. I
> will prepare a patch to use the DT device directly as the single source for
> DT properties.
> 
> I also suggest keeping a fallback path for st,adc-alt-channel so we do not
> break legacy DTs that have not yet migrated to the new binding.
> I prepare this also.

-- 
With Best Regards,
Andy Shevchenko



