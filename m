Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9186C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni2J59PvZ402xhEiYbQS7z3/DPTmjUedbVMOjYoksPo=; b=dILUD1yxxaw9jth4DkEMqEBEnu
	q2Lgb++3nWuqgmP6u4pOihli+N73P0ZJaHQlNgftbgk7rnJs5Gpn/ZXY5pHvAmAyLZosJP1MD+5n4
	dENCdpIKt143GY0ttOidIgzGSmeqtngy/vLB5tv5tF2DimJ5qrY/sKwOXzh6peojEvA+Tl5fOlHDF
	sw6FcUjurE9emKbucFKaiXjM1Sd5rKPQhp8BQy1h9duw4Rn7D29CucdQEEFvzaN9+Ajvxk0kn7zYP
	+duyzRfDguNTSGmEGC2+FVDRi70ESYuAYCHXtbE4QJ+3iW3R9RLc1bKdpAoM9mW6AyuYBUXEF+x4J
	pEu0ye/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whldH-00000001rps-2bFb;
	Thu, 09 Jul 2026 10:05:27 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whldF-00000001rpG-0hEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783591526; x=1815127526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kynRmd6VkJDJaKnAtp481E/LYoCY9IfgfoGNoe6Bgsc=;
  b=bR+M0CV4l1kr3OnHYLiy6aVCPkN9U4sugdomOgGwqI8Opl3n2LcSLrYz
   pEfjwvHynJE9TWgCkVLdK/vV6in3/MedLvxV1qa9lwAzyE+W/nmf5X7yU
   d4b/QWtMQXpBiZV7Z1CTRXrBKQp4nv/moozCASMdZrjiD7lcbsIQIdynG
   vEDShyOeY0+1EMsySB1t7Ygqlh5V7lDYb9QRE9X5KqImjHvAQE+rxYn8C
   IdkdJnSBtfm2t5QZ0I2YEvQdJswTQMnWRPgPdgGPBPYUZH87tkZ+DlUdL
   9Z7hgupLIuSRLtPfQxkXd6wn9RmeylDAx7yEntLRDiBAh6Q+vFaQMwMpw
   w==;
X-CSE-ConnectionGUID: rDjvfOlNTgWq8SgzsH9hmQ==
X-CSE-MsgGUID: kERNywtdTgGknTtyc1X3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84286574"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84286574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:05:25 -0700
X-CSE-ConnectionGUID: hTUNBWWGR3eFq+am3Mq5pg==
X-CSE-MsgGUID: 7Ic9mailTa6mlsefKI3aRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255200185"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:05:22 -0700
Date: Thu, 9 Jul 2026 13:05:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 0/7] I2C Mux per channel bus speed
Message-ID: <ak9yXzjO_DwJXXgD@ashevche-desk.local>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
 <ak6m6srzX8dd6_nT@ashevche-desk.local>
 <ak9c6nGBsgMTP099@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9c6nGBsgMTP099@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_030525_250756_09D44BCA 
X-CRM114-Status: GOOD (  23.75  )
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

On Thu, Jul 09, 2026 at 10:33:46AM +0200, Marcus Folkesson wrote:
> On Wed, Jul 08, 2026 at 10:37:14PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 08, 2026 at 02:16:12PM +0200, Marcus Folkesson wrote:

...

> > > - Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c
> > 
> > Can you point to the discussion where it was suggested, please?
> > It was like ages ago (too many patches to review) and I probably
> > missed and/or forgot the rationale for that. Also if we move
> > to i2c-mux, why do we leave it in the adapter namespace?
> 
> Hrm, it seems like the mailing list wasn't CC:ed for that comment.

Please, be sure next time everything like this important will be available
to all.

> It was suggested by Peter and the rationale to remove it was:
> 
> "
> I'not sure it's a good idea to expose {__,}i2c_adapter_set_clk_freq().
> 
> Do we really want to make it so simple for random (non-mux) I2C drivers
> to muck about with the bus speed? Any bus speed changes not coordinated
> with mux-locked bus speed changes are going to be problematic. This is
> shown by the discussion about D2 for the multi-level mux-locked example
> (patch 5/5) -> it is problematic even when the bus speed is changed by
> the mux code itself.
> 
> I think these helpers should be moved from i2c.h to i2c-mux.c.
> "

Okay, let's assume I'm fine with this reasoning, I would still go with
the proper namespace. Otherwise it's inconsistent.

-- 
With Best Regards,
Andy Shevchenko



