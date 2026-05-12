Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E077CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4mIgacZbaZ/EYyQp1qEhWM3L40+B/IK5WJW6oJR8pc=; b=GdZd9Hov+wKD9BtCzKIpK9PEKN
	UqgjbvMTBwl5oQj5ZJV5IUaf3thUj2POREvTT+NEgsPcLEm6TlponuYnmdF21NXVwlowML8Rs57eM
	EGe/d8y3ekZpPGZnmHhBrq3mYJsH0tpzNyPH1sG+cyUdgY6uyTwR51K+rcas34izjilbWe6SIE2Fx
	ge6Gic7IchplLl/xiIE1G+4CdcqdWXnG8eKs0vUqpb2nammmGURj3+/+dIZvndnDWoDVfW3CnvqsQ
	Rk9d+dmoN5VQEeqNo1SQQr+sYTA8ffQT7pycOX/EJh6nPHA3/vdL1bQvlyHhEwlpYe3PNYnm3K7de
	N9U1G4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkv9-0000000GWCl-3DQg;
	Tue, 12 May 2026 11:05:03 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkv6-0000000GW0Z-2SwB;
	Tue, 12 May 2026 11:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778583901; x=1810119901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=211a2Vxapw/LkkPIC3ja7VhK866mFfc0k18gWRdnhG4=;
  b=KnqhyLsrYkf9hYzSjpFfZ3DX6irx2pFYGz254LWkIxdRgujW8AP6PWhB
   AB8ulnSqUoGjNlBuIyN4/lwtTWGwm4VbtwJ/OdIcqTZmV5DcYxAXiHGdx
   IxGeH5qqTwNE6m9FQHdiew+xBMD2XnmO89wmp02GNCM9O09ai9y7Yuh9R
   zPgS2/H80HereVrivV970aSaeh5q4sPCbjacjCoXiaxKbZklT4kp3nSGm
   w9sY49DJYJUssxCN7LsWNNLdKE3PyXrLlmOQVpjvRXCSRZ5YLd6A6RZxN
   v1AX9VHs5oT5gNQXahRf/yGQcBxQ/qPC8fRn82Y4dmwYIfzgD72OJ3Wwb
   g==;
X-CSE-ConnectionGUID: T50HCmdJQTO6hEuBiWTm/Q==
X-CSE-MsgGUID: p8GTC68MTVC1zwcTrnW/lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79472981"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79472981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:03:00 -0700
X-CSE-ConnectionGUID: W3uW7XpITSGWtGxlCqug2g==
X-CSE-MsgGUID: o+ExLhcIQcmFTXdW7A7Y+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242733224"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:02:54 -0700
Date: Tue, 12 May 2026 14:02:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
Message-ID: <agMI2phk0AQF6QP9@ashevche-desk.local>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
 <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
 <j2uhavC9edilBoD6VJnlz8cCmMPhE9rQavh1epqLk61zrlZ3k1rqlyj8fVYWnkddIY1fEfPk1DfcW09i39hd-Q7I9Y8Vxd0w8C2eCjVGLc4=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j2uhavC9edilBoD6VJnlz8cCmMPhE9rQavh1epqLk61zrlZ3k1rqlyj8fVYWnkddIY1fEfPk1DfcW09i39hd-Q7I9Y8Vxd0w8C2eCjVGLc4=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_040500_677991_577AC884 
X-CRM114-Status: GOOD (  21.03  )
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

On Tue, May 12, 2026 at 08:55:44AM +0000, Roman Vivchar wrote:
> On Tuesday, May 12th, 2026 at 10:05 AM, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, May 12, 2026 at 8:21 AM Roman Vivchar via B4 Relay
> > <devnull+rva333.protonmail.com@kernel.org> wrote:

...

> > > +#include <linux/kernel.h>
> >
> > No way the driver(s) nowadays use this header. Please, drop it and add
> > the ones that are really in use (there are missing ones).
> 
> Is there a tool or script that can check for IWYU?

The `iwyu` tool with customised configuration is the closest what we have
(but quite far from ideal), you can read this thread [2].

> For example,
> the u32 and s32 types are defined in the asm-generic/int-ll64.h, which
> is not used by any device driver. Instead, types.h should be used.
> It's difficult to guess which header to use for a given type/function.

I know. I got this knowledge because:
- I do a lot of reviews and patches and gathered it from the experience
- I am the one who reshuffled *some* of the headers

> I've tried include-what-you-use [1], but it gives bad results like
> "add #include <asm-generic/int-ll64.h> // for u32".

See above.

> > > +#include <linux/module.h>
> > > +#include <linux/nvmem-consumer.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regmap.h>
> >
> > > +#include <linux/slab.h>
> >
> > Is it used?
> 
> Yes, without slab.h the __free would complain about missing __free_kfree,
> which is DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T)).

Ah, indeed. I forgot that this is not the part of cleanup.h.

...

> 1: https://github.com/include-what-you-use/include-what-you-use
[2]: https://lore.kernel.org/all/20260512073505.1310-1-joshua.crofts1@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



