Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651D0CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+s64GK9sRe7Ba9QSYpVmauI2rPUhreOrzjI+20x0pA=; b=h4Jj6yv56DomAbGjG7teKYy8Jw
	8auxSLXMo0ekfuEfJH5LkW5soHfoO8T6j6iTebryUv7XbSmzZYc4SKKaDEvnF+xMRbPUwgGrqv4Ue
	2z6vX1SMrWTEok3+n1e4d7Bg/pPlTGCKQ3d8jUlPHDFF4nWl1lmkyyOn9kGSw4gs9+s9rxDz1PdHt
	KPpTHDRFSPnwPzBG4bWttIk/e0ztZQY8AXF7ZOzbK7vk7tRmHi4jnD+vo7/PpU4Mzkl9saLmaKksT
	5/W52it8+KjnF+1213tMj4uPwHucO7cle2BP3f07jbYvPNd6E6PaBfqGzhOHBX1vsznY+1h+efcUO
	wy/jY7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXheV-00000009i8Y-2mVT;
	Thu, 11 Jun 2026 15:49:07 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXheT-00000009i8B-1sMi;
	Thu, 11 Jun 2026 15:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781192946; x=1812728946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eEPYqYwCfV36F7DpKmyY/mBn0JlkcYgtEybyysUnTek=;
  b=Px6/3q0tJb/h5EXqpu3Be/HGRyfZnmX/11m6hO+VGajO7ebDF2WmYbvl
   7L/PmGMI5q6PZjJEJELuFlR348WifepwSD3+8rHknhOhJAf/2eVQaRA4n
   PXNNCj1QImvHOpCX4sY0eN6HCeFyYCPG/OU+z2NwBavntb/XdWbtQ2pea
   LTbbEMYHctEy6ZS5d7NYCInQGZAVJWdnRbeh3KCXG4QC4Z1yMvgf4VqrB
   r/Xfvpfu4TUsVkxW6i9EtHIoNgSNUTOkUMSL6Oey86rLuh+SKERLvA+T4
   E0pzLe0OzV7tPlrmN8ckeFywNK6hOZc6W1qKEKK9o+bgnARU04PiBoTwU
   w==;
X-CSE-ConnectionGUID: JB8C8F1VS7q6uL7z0Rv7kg==
X-CSE-MsgGUID: SHAhd+3AR1mVFv2c10HuAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82200642"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82200642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:49:04 -0700
X-CSE-ConnectionGUID: vgWRVW9xQsScdhid1DOZgw==
X-CSE-MsgGUID: Z/YOgAYiTEymviQBo+GIyw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 08:48:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E591098; Thu, 11 Jun 2026 17:48:57 +0200 (CEST)
Date: Thu, 11 Jun 2026 18:48:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <airY6IMz2KFz_z9j@kuha>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local>
 <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
 <aipz2zMFcdnZYTxS@ashevche-desk.local>
 <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdRN7YitmMX8PknbzLh+MdsWm+dDg0MLtCVYOorqNobTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_084905_554683_0E921F54 
X-CRM114-Status: GOOD (  25.98  )
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

On Thu, Jun 11, 2026 at 11:35:13AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 11, 2026 at 10:37 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote:
> > > On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> said:
> > > > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> > > >> When a USB hub port is connected to a connector in a firmware node
> > > >> graph, the port itself has a node in the graph.
> > > >>
> > > >> Associate the port's firmware node with the USB port's device,
> > > >> usb_port::dev. This is used in later changes for the M.2 slot power
> > > >> sequencing provider to match against the requesting port.
> > > >
> > > > Okay, would this affect ACPI-based systems? if so, how?
> > > > Can you elaborate on that, please?
> > >
> > > Is it possible that there's an ACPI device node associated with the port like
> > > on some DT systems? I don't think so and there should be no impact IMO but I
> > > also don't know enough about ACPI.

There are device nodes for the USB ports in ACPI, and I think they get
always assigned in drivers/usb/core/usb-acpi.c.

> > The API is agnostic. There is a possibility to have software nodes associated
> > with the port. I think the best is to be sure that ACPI-aware people who are
> > experts in USB will check this (Heikki?).

I can't say what's the impact from this patch - I'm not an expert with
this side of USB. Is there a danger that we end up overwriting the
ACPI node for the port, or something else?

> Even if there is a software node - it shouldn't really matter. It will
> just be assigned to the port device.

thanks,

-- 
heikki

