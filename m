Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8534FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBIHNrKa3q0TcAPhv7FZnqmIPWWJ4xBe477HBYWJmbI=; b=jHQl9OZCwHA2eJVN0+joRDJ0D+
	79H8krVH0DJy7u9GkkIk2yTiSnJuSWgkMbghJQklpAAI7IB9OfT32kLjlTZPJFOgNTEt2kiYD1ZuN
	Sb7nMllyBqQtFDMviUiIgfU/emyQDfALUkK+8eJMXl75aCvwHKuqcpfCAnU5MoM5HdmqpIEz8/gyA
	ggaFbZuvW8Q7PkNhZR0pvnggrfaHykl3IvlmzBRolPKpbZq7Zx7FXP7OkRtm6goolqgA9N6BotE5+
	acaoZ6JLXwlD1VmJCprCU4H4W0ve3KW08tO94Lgm8Cu039GushHDYsaAaBf9Wq+Oaybxm3q8ygMOv
	tU3xN42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBmM-0000000Dnth-0xtf;
	Wed, 13 Aug 2025 13:44:34 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFM-0000000DixI-09Re
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090628; x=1786626628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nktccLI6Vyh+dNjuTt+DN10VQm+RUmARhoT+8pH3d+I=;
  b=ekmeMIj7tNCxymP1neABoV2/jAyUXlcQ/sZtTuO60G3k8FQjcZctNKiN
   20wy7AVO4h6/2lwVvZk1+W14i8Nbfc7Q4ZbBPXMTf4CKOfLIpY5Ne0qh3
   /3SK9y0mH+ySLoHuSpI9PGqr6PX735sTKQs4Fiqv/lWHGyXmBdRFmIDOa
   qnO3ic2WNA+45LnrmSbjxM1Gbtc3tBVeBHBd9JHe0qa6s/FZKbfe9vqSM
   M+ubQHTVTJRDd8ow6B5P0uepP3tQwjxWC/JzsCzSH3IFBpQy4iyX7WGx5
   zym2hyyrTy3TMXR1bSEYfO6pasENAogP2aZNpecBJp1qr8npPTPKQv1Au
   g==;
X-CSE-ConnectionGUID: qkG+wzbmRSSlBxlQuD0g5g==
X-CSE-MsgGUID: NqD5KeK4TP+3nK175iW6Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61184715"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61184715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:10:27 -0700
X-CSE-ConnectionGUID: PzikrBUYRHyezXnZN6ASeg==
X-CSE-MsgGUID: bobAyAJ5TbG0sdG9yjNitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166732304"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:10:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umBFD-00000005RP9-3obq;
	Wed, 13 Aug 2025 16:10:19 +0300
Date: Wed, 13 Aug 2025 16:10:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Message-ID: <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061028_086129_66E00143 
X-CRM114-Status: GOOD (  25.92  )
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

On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:

...

> > TBH this sounds to me like trying to hack the solution and as you pointed out
> > the problem is in pinctrl state changes. I think it may affect not only I2C case.
> 
> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
> in that.
> 
> > And I didn't get how recovery code affects the initialisation (enumeration).
> 
> Without the fix, it is not possible to initiate a transaction on the bus, which
> in turn prevents enumeration.

But why? As you said below the first pin control state is changed during the
probe, which is fine, and the culprit one happens on the recovery. Why is
recovery involved in probe? This is quite confusing...

> > Do we set pin control state back and forth during probe? May be this is a root cause?
> 
> Yes, basically. The state gets changed back and forth twice. Once in driver
> probe before the controller gets initialized, then once again in
> i2c_gpio_init_generic_recovery(). The problem is caused by the second state
> change as it runs after the controller gets enabled which confuses the hardware.

...

> >>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
> >>  {
> >>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
> > 
> >>  		return 0;
> >>  	}
> >>  
> >> +	bri->init_recovery = i2c_pxa_init_recovery_cb;
> > 
> > This is unfortunate. I would keep the naming schema consistent, i.e. rename
> > existing function and use its original name for the new callback.
> 
> I agree, but since the change is targeted also to stable kernels, I wanted to
> keep the change as minimal as possible.

Renaming is not a big deal AFAICS, but leaving this _cb will be confusing in a
long term. I prefer name to be changed.

> >>  	bri->prepare_recovery = i2c_pxa_prepare_recovery;
> >>  	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
> >>  	bri->recover_bus = i2c_generic_scl_recovery;

-- 
With Best Regards,
Andy Shevchenko



