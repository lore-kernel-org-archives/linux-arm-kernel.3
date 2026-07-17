Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A7C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AT67KQjTJR7dEo6McJ2yM4H/bn6stxcaWzCw0maUZj4=; b=4vrfr2Zl/oH2IC7hkMtPl9gVmS
	BPya+yoh3jAL7vTJeVp/5JQn6kxeNPS6N70KQB2g2rw3zuMpsWLTHZLTO/EL8jfv7a9LgO1zUdg8w
	rqHTiMUbvLLDD84rCHk11/BZ+q0xFbx0SRJxmgCuuCjI/ZMijbuyeaSrTakowpWKXLi2tVZJMDgPE
	0GFGvI+04sHEDsOhRdt3j8zSPNvrkOmw6G1OGttWvmFG2uXF3juHCLXkf4f2mDR4/HKP0KsL2367U
	krwmpYRb93PnwA2ntiq/gMBBFSkKQmPOJMUjNkgkoB2akYQfNp5+pjggjtbg0oR/vpMDHJtCIO0n2
	Wyaj60Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfjN-00000001xAf-0YQA;
	Fri, 17 Jul 2026 10:23:45 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfjK-00000001x9u-3wo2;
	Fri, 17 Jul 2026 10:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784283823; x=1815819823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGvidDqf6jtkfzTcLaP8DnYMHTXgmGClLCAu67eKaQY=;
  b=dmEvF4kHnGvgn1hlqCETkwDEpSA100OHtvH/f9dkgQmwxBNp+oL2MrU9
   RQuVnfKDqIX2fXGQt7/vDaGQPwSUvzK2163je045ZYmSq45BfFQgpZ9bW
   jNNrchifQ8btRxcCDl7tEuoCq7G+2SfrSecPHqqECw8V2diOqD4uKb/Tg
   5chUdk7z3Egx7uy1ZHkdHZ38E0xPcqVSzKRROL7jDA7OzbudOruiVEmXR
   dDM/DMcpIKwuzHY4sZw1VsYZ+p+ElMLd0VQSkuhhXf0g7Il4rJB4hE14f
   ZOxBr+54TN/dkHUh8wLRx2NpTktvc62Lr7QJDfvfJDIG2HSv5GaDTQIVZ
   Q==;
X-CSE-ConnectionGUID: cgA7JaMfTkia1kYc2TOIQQ==
X-CSE-MsgGUID: wuoV66JfSeGt84etlJ6yPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95555317"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="95555317"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:23:41 -0700
X-CSE-ConnectionGUID: HwnTdJuoTTmMif+Zc0HdWA==
X-CSE-MsgGUID: Bz+8y56PT0i4xLSMqjGqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="258745095"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:23:35 -0700
Date: Fri, 17 Jul 2026 13:23:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Ming Yu <tmyu0@nuvoton.com>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] gpio: Remove redundant dev_err()/dev_err_probe()
Message-ID: <aloCpCgDYjps9yQu@ashevche-desk.local>
References: <20260717083037.284134-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717083037.284134-1-panchuang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_032342_992551_45FF89E2 
X-CRM114-Status: GOOD (  12.20  )
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

On Fri, Jul 17, 2026 at 04:30:33PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.


...

> -	if (err != 0) {
> -		dev_err(chip->parent, "can't request IRQ#%d: %d\n",
> -			adnp->client->irq, err);
> +	if (err != 0)

This style is discouraged, so while at it, please replace with

	if (err)

>  		return err;
> -	}
>  
>  	return 0;

...

> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -489,10 +489,8 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
>  					       IRQF_SHARED,
>  					       "brcmstb-gpio-wake", priv);
>  
> -			if (err < 0) {
> -				dev_err(dev, "Couldn't request wake IRQ");
> +			if (err < 0)

This style might be okay, but has no sense, we know that there is no positive
out from this function, so, please also replace with

			if (err)

>  				goto out_free_domain;
> -			}
>  		}
>  		priv->irq_chip.irq_set_wake = brcmstb_gpio_irq_set_wake;
>  	}

...

> +++ b/drivers/gpio/gpio-max77620.c
> @@ -356,10 +356,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
>  					max77620_gpio_irqhandler, IRQF_ONESHOT,
>  					"max77620-gpio", mgpio);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}

Ditto. And so on...

-- 
With Best Regards,
Andy Shevchenko



