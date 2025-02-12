Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9987FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlCPPCMoqGTANvgdM81Ho64fytQhFh0y5vX0r3XRQ0E=; b=x0vFHGuXxDT0GuJb+cZXZhtZMz
	v/Qu7iUmzmvdMVJFSdaZE2sLJVSYQORUJAMvHoOKhtSmLDawvyWpkTbZQc89O2PdtWgMHP2U6jIzJ
	WqsCV2xVd3f4PdyCPajRNnWSw+amGopp+qKHTed63MWkDVbladXRp2WGk3iXT4wbjhM1jyAjq565M
	mmrTLhx1OTd3b4OINZZSnJKHG/nAWq4w6+DGpUjf3QWxc0PPO+f+DIZm4qvJDYXeD/LKA+wA5pFcv
	M7XlVcQGmkDFzSqtESyFlkZ+q0KJtW6kMRusUGlumQmW9Tgk2qbq/tFMGr7myfkdQGRL56Ux19xnP
	8GJp9jmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiI3O-00000008a4V-2WZw;
	Wed, 12 Feb 2025 19:05:46 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiI1y-00000008ZrY-13O5;
	Wed, 12 Feb 2025 19:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739387058; x=1770923058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BxoXSqBhEvRgMwVZ/Lsu4gBKNSrjVQ6Vg0s/Z8jm2bw=;
  b=CxO6A8hCMTmkhSJ3aM9SdEJ8LWAXcUY0qB8do8LRpH/ikX6Gy4C0VEcz
   RmqTeGo1C8ZJeeQAPvuvUlazNmXQxUFAtIq29iAjoYNRmqbTlYIuENwxd
   TmDsEkSU3gV6pTycoAOQUan/doRdl8EFEcd7ipdjl7KGooo7S0SE7J9kq
   2OvyIiKuFlSiqsCA/UGEvDRCJKeNP0pP3wBhmVH1Hc/ngPDTR9NgP+Y8s
   Iu8LiwJJ2ZAYSnv4oS09emJ7H3OJMZMbQxkteHdI+viU2rDQ3xkvK1RLK
   RWWf8dPoDDkx5rks3aY7zA0aXU939CXKbPoxWBJ/dIBzCYiW2Eyvw4wra
   w==;
X-CSE-ConnectionGUID: gSmL4KRBQP+nbv48/bOYFQ==
X-CSE-MsgGUID: xlYNxt7HSMiG5T2LAY1AZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50692898"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="50692898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:04:18 -0800
X-CSE-ConnectionGUID: 9fa88icUR72valktVDhKhw==
X-CSE-MsgGUID: Di7M1Du7RpyTDVR3QRe60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117915659"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:04:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiI1p-0000000Avre-3MI0;
	Wed, 12 Feb 2025 21:04:09 +0200
Date: Wed, 12 Feb 2025 21:04:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_110418_302513_AE7B5F5E 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed, Feb 12, 2025 at 07:36:46PM +0100, Geert Uytterhoeven wrote:
> On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > There are already a lot of drivers that have been using
> > i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> > to have the similar for 10-bit addresses.

...

> > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> 
> Having never used 10-bit addressing myself, or even looked into it,
> it took me a while to understand what this helper really does...
> So this returns the high byte of the artificial 16-bit address that
> must be used to address a target that uses 10-bit addressing?
> Hence I think this should be renamed, to better match its purpose.

Since you are giving a constructive feedback, please, propose the name.

> > +{
> > +       /*
> > +        * 10-bit address
> > +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> > +        *   addr_2: addr[7:0]
> 
> I think the second comment line does not belong here, as this function
> doesn't care about that part.

I think the comment is okay to stay. It explains the full picture which is
helpful. It may be extended to say that the function returns only addr_1.

> > +        */
> > +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> > +}
> 
> Probably you also want to add a similar but much simpler helper to
> return the low byte?

Wouldn't it be too much?

-- 
With Best Regards,
Andy Shevchenko



