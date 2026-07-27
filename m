Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E80C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRVEf5Eb6D1mxFXuIfRUzg6k6BO7YH/YCyiUv0ZB2L4=; b=swnKgpTfYC6CuZW/2r25WbJwRj
	X7hmZXHJ9g/IZEGcwPFfHlgodkehMdI5bwGmfEEofm8TVikKwxkMHGW7EZLFJL2I25WXTZ6cj85uC
	WkFfIh/pzzKxV46/2ZWU6cq1alXBDX7cpuSbIOVTUjTCVDz31vUJv9W5wAvTm6KPApy+lCQtp7bD8
	IYwMVN8WtJM7Wo4ReeABsrvwUlIU+WOwArqJKcpIYQ81WZ0wrQWtEt6v+FsyRKBmsYZW3wiIKkfiU
	J9mcBV2MwvOvtbl+8Dg01vrZWKs8DHPDsTUY2jL2+FNvAasi7rAdME9RYlP/Wb4IHA6DZEGuEslUY
	WOcgLnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLIo-00000002qLY-3h5R;
	Mon, 27 Jul 2026 13:23:30 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLIm-00000002qL3-3BkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785158608; x=1816694608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pcL3Ujn9dRR9maqYrHBCcnkr1bH2U7cX7wpTCk3sCU=;
  b=m47IsA76mS19lFxYfWry7Iiaz/gM1CNLy5W0j9Ryif+rWZQUdQJn+ukS
   4X3L2c7V9P7spXuGWxwMZE/UARupNSNCeSS0M1Zk9a4Yz/wX8c+LDwJUm
   nYWAoGuZvylhIviOk9Err/lqe8ORQ7HGn85Fe/6etse9KgRMNs2skxt7B
   nrJ500FqEXRMcqNuSzmLge0rwXnyq4/Au2ywjzkq09xccC3iZ9i8Fs1Bb
   dKss+feKpRmnW2Z7p8/Md1cZtBv92BJ8Gpj8/8yIm8M01RInJURidbJ8K
   1R5aOwxfSqxTe+rooueMRiDR/IVqKdPbGk8EqC38m7M9k+JdZjSpm9Ipy
   w==;
X-CSE-ConnectionGUID: fgdMO95CTReYL/aBF8dYSQ==
X-CSE-MsgGUID: Zxez1YkbSh+T7Dbau0MrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108520758"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="108520758"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:23:27 -0700
X-CSE-ConnectionGUID: rFuhpQTTT7SO9zph0JLhXw==
X-CSE-MsgGUID: MlxXu+csT3egRYyxci+Lkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="297641534"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2026 06:23:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 888BF99; Mon, 27 Jul 2026 15:23:23 +0200 (CEST)
Date: Mon, 27 Jul 2026 15:23:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <amdby6x3xQ0Z3-1G@black.igk.intel.com>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
 <amdVkYEiv_tOZuwG@black.igk.intel.com>
 <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_062328_868507_255F6417 
X-CRM114-Status: GOOD (  31.31  )
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

On Mon, Jul 27, 2026 at 03:05:35PM +0200, Sasha Finkelstein wrote:
> On Jul 27, 2026, at 14:56, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> > 
> > Hi,
> > 
> > On Sat, Jul 25, 2026 at 06:20:57PM +0200, Sasha Finkelstein wrote:
> >> From: Alyssa Milburn <amilburn@zall.org>
> >> 
> >> Make the core driver more bus-agnostic to prepare for SPMI variants of
> >> the tipd chip
> >> 
> >> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> >> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> >> ---
> >> drivers/usb/typec/tipd/Makefile           |   2 +-
> >> drivers/usb/typec/tipd/{core.c => core.h} | 109 ++++++++++++++++++++++++++++---------------------------------------------------------------------------------
> > 
> > That has to be a mistake, right? You don't move code into a header
> > like that.
> 
> Yes, it was a bad idea, already fixed in a v2 that will be sent in the
> near future.
> 
> >> +static struct tps6598x *tps6598x_from_device(struct device *dev)
> >> +{
> >> + struct i2c_client *client = i2c_verify_client(dev);
> >> + struct tps6598x *tps = i2c_get_clientdata(client);
> >> + return tps;
> >> +}
> > 
> > You should not need anything like that.
> 
> This should make more sense together with the following patch, as it
> can get the tps6598x from either the i2c or spmi backend.

You would only need this in the PM callbacks, and those you need to
keep in the glue drivers for i2c and spmi. The core.c can export
common functions for suspend and resume like I told you.

> >> --- /dev/null
> >> +++ b/drivers/usb/typec/tipd/i2c.c
> >> @@ -0,0 +1,86 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Driver for TI TPS6598x USB Power Delivery controller family
> >> + *
> >> + * Copyright (C) 2017, Intel Corporation
> >> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> + */
> > 
> > This driver is not coming from me.
> 
> I kept the attribution as both core and i2c are your driver, but split
> into two. Should I have done something else?

This will not be the same module as the core. You will have separate
modules for the core and for both glue driver.

Note. You can also refactor the core a little so that by default it
works with i2c, but it also exports the init/probe function so that it
can be used as a library with spmi. In that way you don't need to add
the i2c.c at all. But the you will depend on i2c also when you use the
spmi.

Thanks,

-- 
heikki

