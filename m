Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3852CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tidJ9fw1OYoBYaGiXNeJYbpawTJlwdZEByZ/V7kxknU=; b=1ALitNPeeo+qsfAC8Wxh8J2bZD
	+Uqwla10pr+/vmRhsbd7/IUx7aAatGdyEX6X4THUdg41o0lpLMjbv2sT9UF9Q4tIdpRx0kToZ6WwT
	v9nEUIQ16yxTpQP847xa+3Ooq3DqobSSf44oqq4GLZKPPcsougL3kpDrj+Ulk6rmxukPGpyBKIpt1
	jIUkqSJCgB/Rfm+LlSdWOOZQ2TZD21jivokO4lgXwgAkwfqzrCNWGOLHU+vtph5NDcoOoE351sPWq
	E0cKD6NgeguOq+kB3hYGAQw+NWh58ndFbJGF0wYqO725Dx9CIrU3itpv5/t8Rw9QW8x+rEHowDC2W
	ZKRj0Qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJFG-00000009ukm-1QBX;
	Mon, 13 Jul 2026 16:11:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJFD-00000009ukL-2zB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783959060; x=1815495060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZ/BOqdI0asVtPSpoTQNzl05BwwgREcjJn07zQcObpg=;
  b=H7UuQiWCNk5p6GHXQ5+XYNDxls7mluAsSqQTJob+SynoDrTkaO2ut5EV
   fdY2EW57naR6kYB9yW5eYoPjveII9Dmxl76huqQSTxiqLvA2AcR2ilRru
   y5FZPQ03q2K7lJQLRJZAm55/xenlx1VBkPtUVWy0oKKyREKdZsDjz9+O5
   2Zs7KRYyiHQypIutJJoS4WHgcfAgKkPklUK0bBo69vjwrX2FvlckjLgxN
   kV0ikebqu/UzBOLP7FiHTdO/tqLh3xmUzQhUkdmGCqSNcXvKOtv+g5Tww
   KEt/lH+S/S2mZv86TrWE4gtwR8VaHVIPFxI4PDVAs9RM5YVvNcvf5w8GY
   g==;
X-CSE-ConnectionGUID: swmVvkqdQ92HRqkICTy1Jw==
X-CSE-MsgGUID: RAS28kbaTeaNAwtUfV1igg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84536928"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84536928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:10:59 -0700
X-CSE-ConnectionGUID: 853GWs/YSl+HSJAOIgZ20A==
X-CSE-MsgGUID: rXLkjSZ9TLWvhbkbQGT0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253858335"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.88])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:10:56 -0700
Date: Mon, 13 Jul 2026 19:10:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 1/7] i2c: core: add callback to change bus frequency
Message-ID: <alUODujJFdtYElbY@ashevche-desk.local>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-1-72bb8af8ee8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-i2c-mux-v11-1-72bb8af8ee8c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091059_795678_C99A6106 
X-CRM114-Status: GOOD (  14.40  )
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

On Mon, Jul 13, 2026 at 09:19:57AM +0200, Marcus Folkesson wrote:
> All devices on the same I2C bus share the same clock line and the bus
> frequency has therefor be chosen so that all attached devices are able
> to tolarate that clock rate. IOW, the bus speed must be set for the
> slowest attached device.
> 
> With I2C multiplexers/switches on the other hand, it would be possible
> to have different "domains" that runs with different speeds.
> 
> Prepare for such a feature by provide an optional callback function to
> change bus frequency.
> 
> As a side effect, several bus drivers keep the bus speed in a
> private structure and can now have this value stored in a uniform way
> instead.

...

> +	u32 clock_hz;			/* bus clock speed */
> +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */

Ah, I thought you also updated to _Hz here...

But no need to resend just for that, only in case of a new version for
something else. (Or maybe Andi even can tweak this whilst applying...)

-- 
With Best Regards,
Andy Shevchenko



