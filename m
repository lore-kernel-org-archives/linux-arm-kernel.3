Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDA7D5C0FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTZmlS9z0f3b5tU5aBqgRBFdFJQOb0TAMHawwM5wEjE=; b=YNeQ17Y1btGBJZR1RaDSgxkkdn
	ag0fPreuWsbwwJTdrzJNYD/XA79ceEadqu4sjf3M7Hyl2Rt2PZviGbKIuT5V26PGSwFkniJ1PkO0g
	YmaqSPaFWVGC5y3HwTvNfatHzIfl1m3iffIpHcgbkwGO9WL6yxVIqADIdwMX4/jc3vI9yGmsuPgyy
	d5Yfqn+ncaA/QwySBhPIvDTvbAdz0KYaTeH6TxC3DqR7be4z+bNLZqI3Vu060VFMiUW+Iv49bX8WI
	BIY3Mszm0LkI3TEnioGYUCyGxgkbPa1tZnsCFlKXOH1j5ci6EfMJHpp/QgH7+LZIZcWSfhjf6lp25
	LELzJxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9fAq-0000000CogV-3rCi;
	Sat, 09 Nov 2024 06:42:20 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9f94-0000000CoYN-1XaX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 06:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dominikbrodowski.net;
	s=k10.isilmar-4; t=1731134425;
	bh=m68XOFghE54ivU2dcmIYLk882k+HwPd8s6RJ2NuvOUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0Ck6tLN37f+wQFu3UsQKdc+QFgC4L455vHgvRwEu/CVsrintIaqw0BGGgBpyMvdW
	 3KihegNFT/LSWiBGJHrh2x4bq2Tw/x8qpX2tSqHkcHUtNaZ4IJ2gQGC4GnUZTUiCLQ
	 r56r2k3qqEKDP0FwBJlQPXH7YxXcxu81/eip498VpxpX7p3tYsQfg0wB+5KyAZvFv+
	 5cuD7F/DteExPqXttlt9JrilrD6jrYzfKLgGkoZpUZzbqFgWkNrjt5d36ItgqB3Xx/
	 ncV2XBUlHYtqXvveXkMXoNho0jTuTbMH4TEpAUqHdct6wbuMCY+YILmbceORQa2Unv
	 BubNYu8gN0QBA==
Received: from shine.dominikbrodowski.net (shine.brodo.linta [10.2.0.112])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 03AE8200602;
	Sat,  9 Nov 2024 06:40:24 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id B3D61A006B; Sat, 09 Nov 2024 07:40:15 +0100 (CET)
Date: Sat, 9 Nov 2024 07:40:15 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
 <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_224031_009672_7F7ECCC5 
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

Am Fri, Nov 08, 2024 at 10:35:41AM +0200 schrieb Andy Shevchenko:
> On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> > On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Looks right to me, some testing would be even better
> > because I never trust these flags to get right.
> 
> I also would like to have this, but seems the only odd fixer was active ca.
> 2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
> series will be postponed for unknown period of time, which I do not prefer,
> rather I will fix any regressions later (but I doubt there are here).

As I don't have such hardware, I cannot help with testing, but from the
PCMCIA point of view:

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik

