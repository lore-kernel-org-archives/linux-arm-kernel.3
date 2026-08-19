Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08C7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPo105aBcXPYGRbFY7xZLf4svXn084/42lIF3TwzV28=; b=RFmD06RibBS7GIoltPTD91uHo+
	04AD0wBCfp5JnMeQOGUiX4fCKX9kBKWroMePNyEk3S/p5qnJXHj39DO2mfCfvWnpVTfY6nU59nn20
	QDVqPn8JAwMClW+IP1RX/w8HpYe7nmpmMBpJzGZX1YlDT7qEpTCE5p8+t9qmwghLr2NrMArpW++MD
	ucE4DfFDJQl8L/UsuYflcgq/ofYJ0cNNZ0xLtv4i5Lp/PD7+QoWErnUNSsdTlCHTuuEWnI0IH5lh9
	JA7BonsvRlLCXV21lFthQ7qXMLn6TJtOpoljFgXpDbvmaBGDdvMrZl3TskgYHdmBhl8rmVSKe/K4w
	Rc7AJPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaiK-00000009ByG-0id8;
	Wed, 19 Aug 2026 07:27:56 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaiH-00000009Bxa-46t6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787124474; x=1818660474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G2kptcnbxzc2RLrx4I654mJLzlzkb8PupIu+d8FB6VQ=;
  b=lA6nfB+pjp9A+FEgVMMP+fRUaCaVKtq6b/8L2ymp3e/adUb13WzPITNX
   g14wjvRa+bW52WI5yIC6YZjC8wxggCvmVurI7J2Uqbd5cUJHGoHzPsQFK
   Veukm5aCqqOVT42DFGuB8SQ5pqcHepCqPLIe1PZEqv78w1aBAu4OFILYF
   43qMDW5p5FxSG3/knXoBxu2X6zffM0D6wuB8B5q4MzMDBGm4Fy9fyO82G
   pMXKtAlwt9hm/DU9j5dnmMEUzIybe5eOjlFMkFrXvQ7hiVOiwcgj5CLAx
   yV5fZatcEm1O7Rd61KeRroDVXNp85saO7vbzuuUvYiUL999M6EiWo2MFO
   w==;
X-CSE-ConnectionGUID: WtsynNS7QhOsCBbgexMdZw==
X-CSE-MsgGUID: 8y/+IQ1gTbe8FoiF/Ay5hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87646173"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87646173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:27:52 -0700
X-CSE-ConnectionGUID: J+3m20rtSdqiMKQ+W6sX2Q==
X-CSE-MsgGUID: i+ywqdASR2ib4M2LXoSg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269303976"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:27:46 -0700
Date: Wed, 19 Aug 2026 10:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re: Re: [PATCH v5 08/12] gpio: pl061: add Ambarella CV75 register
 layout variant
Message-ID: <aoVa74E4l4fy5Por@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-8-7bbb12f0360f@ambarella.com>
 <aoRoBYE_Ns0lu75-@ashevche-desk.local>
 <79f6dc8c.2c42c.1a018dadd29.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f6dc8c.2c42c.1a018dadd29.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_002754_032665_CCB21C47 
X-CRM114-Status: GOOD (  21.88  )
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

On Wed, Aug 19, 2026 at 03:09:51PM +0800, zl020895 wrote:
> 
> I followed Linus' guidance on the v2 pinctrl patch to reuse gpio-pl061 with a
> per-variant register layout, because the Ambarella banks share the PL061
> interrupt register model (IS/IBE/IEV/IE/RIS/MIS/IC). gpio-mmio/gpio-regmap
> cover the DATA/DIR side well, but they seem not provide that IRQ controller,
> so moving there would need a separate irqchip and would risk duplicating the
> PL061 IRQ logic Linus asked us not to fork.
> 
> 
> Would you prefer we keep the PL061 variant for that reason, or is there a
> gpio-mmio/gpio-regmap approach that also covers this interrupt model cleanly?
> We can rework either way once that is clear.

I haven't told we should duplicate. My suggestion is:
- convert current gpio-pl061 to use gpio-mmio / gpio-regmap (and I vote for the latter)
- add new regmap configuration and necessary layout for your case.

> ---- Replied Message ----
> | From | Andy Shevchenko<andriy.shevchenko@linux.intel.com> |
> | Date | 08/18/2026 22:11 |
> On Tue, Aug 18, 2026 at 06:31:22PM +0800, Long Zhao via B4 Relay wrote:
> 
> > Extend gpio-pl061 with a per-variant register layout so the Ambarella
> > CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.
> 
> This is reinvention of gpio-mmio.c (as a library). It has necessary facilities.
> Also gpio-regmap may be considered. So, switch this driver to use one of the
> above and the patch for the new device will be much simpler and elegant.

-- 
With Best Regards,
Andy Shevchenko



