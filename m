Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D3EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54X5WjRpSQ/RD6fL5K3quunAx4z4Slx9K6zsOyuw+O8=; b=aMO0YLnkIS2EWYLiZMQ2oSac8M
	J+uPVEY3FE2p7Ce+B5aGjFzy0nrU2/UoEjwQsIbM1Rr+QtO57qkh5zeH84LDm/tC7GqoaII7O/tW0
	fMqcuAc0xaRlPq0EdgQBdjN3wAMAV3eGG8g+2fnZBvW7usO8uKKpLVFT3NaW1LqBCF4Hwya5Fx4Bz
	WrynuVNY//A73tOLbeGeeEJ8CXulwc5BuQzyPXUAW+3btR33wggW4Pj4Y8K0H062heappYja7maBq
	YQEMMDShAC0F5ALIICn6Lf02D2I8PcZDBoCYpTHGPdcAnu5xNxRTdCL4I0U3sgstg/Zb3kxs2L20W
	fJaSj82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RF9-00000005sJN-46lK;
	Mon, 07 Sep 2026 04:46:07 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RF7-00000005sIQ-168K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788756365; x=1820292365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MvbHHEL5/a5EqTe+dAnJ+mIvKAY5vNH6ijYKQPM4nCI=;
  b=ieeUz08MoVbqFVVqDk+IWlPnmBLnP8JkcEIW9ax6jH4NUOFT4kTE3Qy3
   WjvPAWgplIAGe4d7v4aZx1imzKyEYZL4NXDGvdf5T5hbV1b03zzjfbGAq
   3OIEpu98f3iWjqQux9qblP2ebUfH4M6Qxb3hapDf/rjaV9CTGenid57NT
   sbKwNoteN+HQaDLbRg2nB065KtrcVdDfWLDVoeW8y2D3B6fACF4+Fj+xv
   NH1WpZwMtZ520rpNzPXHGIVehJS5EHwZAuHWW+qPkBg9c/szN+LGO5475
   D2smBlAPpYSihsf5EwzTGt3Rvks8F95nc90z+lhsX5hLKr+1q4Os+4dfs
   Q==;
X-CSE-ConnectionGUID: Ks7QauQwQ5SXbIjipHf0Gw==
X-CSE-MsgGUID: u8+kTuUMTISNR4QOJRq/6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="93022624"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="93022624"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 21:46:02 -0700
X-CSE-ConnectionGUID: 6Svu84RsS9W24VILoF1UaQ==
X-CSE-MsgGUID: 7Pmz5ViORtuzSLnZnlMKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="274406097"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 21:45:56 -0700
Date: Mon, 7 Sep 2026 07:45:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v6 08/13] gpio: regmap: support write_data_after_dir
 and girq
Message-ID: <ap5BgWtHMAxl28wF@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-8-e918514cb3b1@ambarella.com>
 <apqxwRgi-uVKkOpr@ashevche-desk.local>
 <27a1901.423e.1a07a183bd4.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27a1901.423e.1a07a183bd4.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214605_370039_A942A509 
X-CRM114-Status: GOOD (  17.70  )
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

On Mon, Sep 07, 2026 at 12:20:03PM +0800, zl020895 wrote:

> > Are you going to fix this HW in the next version of the SoC?
> No — Ambarella does not use write_data_after_dir. It only preserves the
> existing ARM PL061 quirk already documented in gpio-pl061 (data writes
> ignored while the pin is still an input). Only pl061_arm sets the flag.

Ah, this is a good news!

In any case when documenting that flag, please also mention that any new HW
should not use it as it's considered buggy (glitches during direction change
are guaranteed).

> I will also make the first gpio_regmap_set() conditional so the quirk
> path writes once after direction_output, not twice.

I see that original pl061 actually writes twice. TBH I don't know the best
effort here and if it's really required to do so. Probably others have
better ideas...

> > This needs to be in a separate update. Also we need to understand why
> > it is required.
> OK, girq will be a separate patch. PL061 keeps a custom chained
> irqchip (not regmap-irq); gpio_regmap today only takes irq_domain or
> regmap_irq_chip, so we passed girq to keep the usual gpio_irq_chip +
> gpiochip_add flow. Open to using a caller-created irq_domain instead if
> you prefer.

If there is a chained IRQ, look how PMIC drivers usually do similar setups.
First what comes to my mind is drivers/mfd/intel_soc_pmic_bxtwc.c.

-- 
With Best Regards,
Andy Shevchenko



