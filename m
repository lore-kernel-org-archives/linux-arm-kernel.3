Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A240E9E31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 01:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AteVZ7Dt/6NPuj41q9ANIYjSOQ/ZqhGsME93Ny+Mmnk=; b=Sk8RYqLlAsAtjnE+gpatvo7rf0
	joGg9tKnG5FarnsHvztXpI3Zwht2HbK1Zj35+hhhAw/oVL8MeYB17M4w5vX0WgKoBk8xDo9OoDQn1
	ajs5koT/0xliQT8PXoMOyaSytAH8lDkTgpRs5kNAjNrHjXNGZuVAWp4nePBFSeIJ7qXcGHwziWa9B
	CVjIwae5LI4gvcDNcaf7gOPbUs3FcggzX4b7ZkBzULW5PRl04BWl0GCiuk6vD+kbY1cNgkH/iHXbF
	Pk4X14EQo7eTrhC0WqnEfbaBd1sDgh0KxzEJ3ZEKf1pkLAAy62Ss8XJ38VSw6iF7up0jZSZhU8Me6
	x/gEV6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLFr-00000001Fvz-1u4W;
	Thu, 12 Feb 2026 01:12:27 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLFo-00000001FvX-43bn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 01:12:26 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b7da62b487so244262eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 17:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858744; x=1771463544; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AteVZ7Dt/6NPuj41q9ANIYjSOQ/ZqhGsME93Ny+Mmnk=;
        b=l5Wv0P+TApOI/xxkx3ync+Ig+DXw2ociumlR5IJ8kIvChWr2Ct4pBq0lzG/cUHF/iN
         YfzqLAdrw9sINtYA4usZ7WClnN2DZXUwqbQltpYLtFLVQfnDS3p6whXTMsi5XhOSEv8F
         IlOu71ONIedYoRsfMuamPVGTmwJ3uJf23ubnRK6UCTI0RG1OeJRzTlCkyznknJca7DsN
         skMNrUrGcujzNcRtENG1gTOSq8Jc5hbZRupHGVhNi2FagzjU4B3qUKsafIzD4Ji/Kjam
         qxbpLxlgPkmpmn/jB8DW5L8eJkjdzHfkt9Ru0jxv3RbMpU3RHelD+INCaTd9yJCM53tE
         0HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858744; x=1771463544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AteVZ7Dt/6NPuj41q9ANIYjSOQ/ZqhGsME93Ny+Mmnk=;
        b=BO8jWD9YrxvVkoOCRqPwkgdpZXcrUPYYNxuyjyD3w+wJuRbdPMbrJtri978eIPpNQm
         17FhxUYLDwjYL0BdWvyUoqGbYA/nb2Dm6JS+eDsJzPtvkHOakqx9kzPsWUBg8hk61RRH
         Baii6ol1nl6jC9yu5aSj9ohqvd6Rh/1v4JNih+DhAWHleO1ofimSkhMjh6kJg/4lwSVj
         fw3BT2ITlLjno6jADRGIrLMtxDcaDt/2VuRzHDMLuzEM3bwy+qjJ5ZVFehrJ9uWc+MVT
         RqTVK+aWVknj3JpIMKGX9nee0MQnzlYJXvKjI5a59MFrOP8od35cY8ZE0H4Y+TCAxry6
         g5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgDd34h8DPhBHByigMtgV2LQIx8vY2Ac8UWIjGvbWpBNFGf7nTdpn1wdppeUIQN1jaBDFuJvQXR0s/7/ANTup@lists.infradead.org
X-Gm-Message-State: AOJu0YxVfdOnD5vgUZ5eHOTJ5g2Rj8Pra4o/WYiZAQCvF/8e2kwAQlIf
	+DD5EL7XC8mj6lnL9lprWZyAC3SN/JSCfK2f+dcMYyoKO4PFJljohb4c
X-Gm-Gg: AZuq6aL9bu9jVqTCcNXVA4CLlIqvpdXSH33Syv8+2HEJJXQRgO5Y4dGU8VtEZiTBj/P
	426PmPhprBuS2O1hNverrMss+ichogVEmAkGNf/aqFvO29+1nlmFndyI5PH1L80AOmgF/hgkWHJ
	WZ8gEi2v5Xo8SyUVNzktzeu9oGInj+hjMMa5E1I6JJv/W4vMb/UBmJggjjWRbMZUtw3B4Q7vw2g
	85YIcYh6IA8dhDAt9YPbdCWmEOzOUebetFcbxWY3G+vltkE+2yqAqxksdQfymvBhvOmJgaEfmL0
	uI3r8z4oqanH8JXa+1/E6vvqK81zYrlTzbPiEhtqxKuS7SZtFqbOrA1Sm+gHTepVQoBxUrYSTox
	Ak/XOGlXGV2mcoF+In9ymJGDDWPmnDY4F3NhBLRYuxwuqf2HFq22K9pzXAdNjq2cvpDGSQ52o71
	P4YGPTITpIGih46lD95KWVToC7OhuHDHqBjVU+U3HnecA69OtUsARV/HS3cpbUZ8w=
X-Received: by 2002:a05:7300:572c:b0:2ba:9560:af0 with SMTP id 5a478bee46e88-2baa7fb1856mr565278eec.14.1770858743621;
        Wed, 11 Feb 2026 17:12:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcea9b7sm2441009eec.25.2026.02.11.17.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:12:23 -0800 (PST)
Date: Wed, 11 Feb 2026 17:12:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <aY0oY-1rbLL3ract@google.com>
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
 <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
 <aYz2_pE53G67vv0v@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYz2_pE53G67vv0v@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_171225_023931_9A7A3DCB 
X-CRM114-Status: GOOD (  42.49  )
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

On Wed, Feb 11, 2026 at 01:40:44PM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 11, 2026 at 05:31:52PM +0100, Arnd Bergmann wrote:
> > On Wed, Feb 11, 2026, at 14:13, Bartosz Golaszewski wrote:
> > > Currently the board file for Nokia 770 creates dummy software nodes not
> > > attached in any way to the actual GPIO controller devices and uses the
> > > fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> > > software node lookup. This behavior is wrong and we want to remove it.
> > > To that end, we need to first convert all existing users to creating
> > > actual fwnode links.
> > >
> > > Create real software nodes for GPIO controllers on OMAP16xx and
> > > reference them from the software nodes in the nokia board file.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > 
> > I don't see mistakes here, and I don't want to throw a wrench in
> > this patch, but I wonder if there is a way to take this one step further:
> > 
> > > @@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
> > >  		iounmap(base);
> > > 
> > >  		platform_device_register(omap16xx_gpio_dev[i]);
> > > +
> > > +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> > > +					       omap16xx_gpio_swnodes[i]);
> > > +
> > > +		if (ret) {
> > > +			dev_err(&pdev->dev, "Failed to add software node.\n");
> > > +			return ret;
> > > +		}
> > 
> > I was planning to go through the remaining 'static struct platform_device'
> > definitions in arch/arm/ after the planned board file removal and
> > try to convert these to 'platform_device_info' or similar, using
> > platform_device_register_full(). Since that function already contains
> > code to dynamically allocate the software_node, I had hoped that
> > a lot of this would just go away.
> > 
> > However, I see that your patch creates pointers to those software_node
> > instances, so  think that would become a bit harder, but I have not
> > actually tried it.
> > 
> > Do you know if there is a good way to do this without using static
> > platform devices?
> 
> I wonder if something like below will help reducing boilerplate...

And then we can change the gpio16xx like this (on top of Bartosz
changes):

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 177621cb4784..a42f13890b94 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -26,7 +26,7 @@
 #define SYSCONFIG_WORD			0x14
 
 /* mpu gpio */
-static struct resource omap16xx_mpu_gpio_resources[] = {
+static const struct resource omap16xx_mpu_gpio_resources[] __initconst = {
 	{
 		.start	= OMAP1_MPUIO_VBASE,
 		.end	= OMAP1_MPUIO_VBASE + SZ_2K - 1,
@@ -38,7 +38,7 @@ static struct resource omap16xx_mpu_gpio_resources[] = {
 	},
 };
 
-static struct omap_gpio_reg_offs omap16xx_mpuio_regs = {
+static const struct omap_gpio_reg_offs omap16xx_mpuio_regs = {
 	.revision       = USHRT_MAX,
 	.direction	= OMAP_MPUIO_IO_CNTL,
 	.datain		= OMAP_MPUIO_INPUT_LATCH,
@@ -49,27 +49,27 @@ static struct omap_gpio_reg_offs omap16xx_mpuio_regs = {
 	.irqctrl	= OMAP_MPUIO_GPIO_INT_EDGE,
 };
 
-static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
+static const struct omap_gpio_platform_data omap16xx_mpu_gpio_config __initconst = {
 	.is_mpuio		= true,
 	.bank_width		= 16,
 	.bank_stride		= 1,
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
-const struct software_node omap16xx_mpu_gpio_swnode = { };
+static const struct software_node omap16xx_mpu_gpio_swnode;
 
-static struct platform_device omap16xx_mpu_gpio = {
-	.name           = "omap_gpio",
-	.id             = 0,
-	.dev            = {
-		.platform_data = &omap16xx_mpu_gpio_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
-	.resource = omap16xx_mpu_gpio_resources,
+static const struct platform_device_info omap16xx_mpu_gpio_info __initconst = {
+	.name = "omap_gpio",
+	.id = 0,
+	.data = &omap16xx_mpu_gpio_config,
+	.size_data = sizeof(omap16xx_mpu_gpio_config),
+	.res = omap16xx_mpu_gpio_resources,
+	.num_res = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
+	.swnode = &omap16xx_mpu_gpio_swnode,
 };
 
 /* gpio1 */
-static struct resource omap16xx_gpio1_resources[] = {
+static const struct resource omap16xx_gpio1_resources[] __initconst = {
 	{
 		.start	= OMAP1610_GPIO1_BASE,
 		.end	= OMAP1610_GPIO1_BASE + SZ_2K - 1,
@@ -81,7 +81,7 @@ static struct resource omap16xx_gpio1_resources[] = {
 	},
 };
 
-static struct omap_gpio_reg_offs omap16xx_gpio_regs = {
+static const struct omap_gpio_reg_offs omap16xx_gpio_regs = {
 	.revision       = OMAP1610_GPIO_REVISION,
 	.direction	= OMAP1610_GPIO_DIRECTION,
 	.set_dataout	= OMAP1610_GPIO_SET_DATAOUT,
@@ -97,25 +97,25 @@ static struct omap_gpio_reg_offs omap16xx_gpio_regs = {
 	.edgectrl2	= OMAP1610_GPIO_EDGE_CTRL2,
 };
 
-static struct omap_gpio_platform_data omap16xx_gpio1_config = {
+static const struct omap_gpio_platform_data omap16xx_gpio1_config __initconst = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-const struct software_node omap16xx_gpio1_swnode = { };
+static const struct software_node omap16xx_gpio1_swnode;
 
-static struct platform_device omap16xx_gpio1 = {
-	.name           = "omap_gpio",
-	.id             = 1,
-	.dev            = {
-		.platform_data = &omap16xx_gpio1_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio1_resources),
-	.resource = omap16xx_gpio1_resources,
+static const struct platform_device_info omap16xx_gpio1_info __initconst = {
+	.name = "omap_gpio",
+	.id = 1,
+	.data = &omap16xx_gpio1_config,
+	.size_data = sizeof(omap16xx_gpio1_config),
+	.res = omap16xx_gpio1_resources,
+	.num_res = ARRAY_SIZE(omap16xx_gpio1_resources),
+	.swnode = &omap16xx_gpio1_swnode,
 };
 
 /* gpio2 */
-static struct resource omap16xx_gpio2_resources[] = {
+static const struct resource omap16xx_gpio2_resources[] __initconst = {
 	{
 		.start	= OMAP1610_GPIO2_BASE,
 		.end	= OMAP1610_GPIO2_BASE + SZ_2K - 1,
@@ -127,25 +127,25 @@ static struct resource omap16xx_gpio2_resources[] = {
 	},
 };
 
-static const struct software_node omap16xx_gpio2_swnode = { };
+static const struct software_node omap16xx_gpio2_swnode;
 
-static struct omap_gpio_platform_data omap16xx_gpio2_config = {
+static const struct omap_gpio_platform_data omap16xx_gpio2_config __initconst = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio2 = {
-	.name           = "omap_gpio",
-	.id             = 2,
-	.dev            = {
-		.platform_data = &omap16xx_gpio2_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio2_resources),
-	.resource = omap16xx_gpio2_resources,
+static const struct platform_device_info omap16xx_gpio2_info __initconst = {
+	.name = "omap_gpio",
+	.id = 2,
+	.data = &omap16xx_gpio2_config,
+	.size_data = sizeof(omap16xx_gpio2_config),
+	.res = omap16xx_gpio2_resources,
+	.num_res = ARRAY_SIZE(omap16xx_gpio2_resources),
+	.swnode = &omap16xx_gpio2_swnode,
 };
 
 /* gpio3 */
-static struct resource omap16xx_gpio3_resources[] = {
+static const struct resource omap16xx_gpio3_resources[] __initconst = {
 	{
 		.start	= OMAP1610_GPIO3_BASE,
 		.end	= OMAP1610_GPIO3_BASE + SZ_2K - 1,
@@ -157,25 +157,25 @@ static struct resource omap16xx_gpio3_resources[] = {
 	},
 };
 
-static struct omap_gpio_platform_data omap16xx_gpio3_config = {
+static const struct omap_gpio_platform_data omap16xx_gpio3_config __initconst = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static const struct software_node omap16xx_gpio3_swnode = { };
+static const struct software_node omap16xx_gpio3_swnode;
 
-static struct platform_device omap16xx_gpio3 = {
-	.name           = "omap_gpio",
-	.id             = 3,
-	.dev            = {
-		.platform_data = &omap16xx_gpio3_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio3_resources),
-	.resource = omap16xx_gpio3_resources,
+static const struct platform_device_info omap16xx_gpio3_info __initconst = {
+	.name = "omap_gpio",
+	.id = 3,
+	.data = &omap16xx_gpio3_config,
+	.size_data = sizeof(omap16xx_gpio3_config),
+	.res = omap16xx_gpio3_resources,
+	.num_res = ARRAY_SIZE(omap16xx_gpio3_resources),
+	.swnode = &omap16xx_gpio3_swnode,
 };
 
 /* gpio4 */
-static struct resource omap16xx_gpio4_resources[] = {
+static const struct resource omap16xx_gpio4_resources[] __initconst = {
 	{
 		.start	= OMAP1610_GPIO4_BASE,
 		.end	= OMAP1610_GPIO4_BASE + SZ_2K - 1,
@@ -187,37 +187,29 @@ static struct resource omap16xx_gpio4_resources[] = {
 	},
 };
 
-static struct omap_gpio_platform_data omap16xx_gpio4_config = {
+static const struct omap_gpio_platform_data omap16xx_gpio4_config __initconst = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static const struct software_node omap16xx_gpio4_swnode = { };
-
-static struct platform_device omap16xx_gpio4 = {
-	.name           = "omap_gpio",
-	.id             = 4,
-	.dev            = {
-		.platform_data = &omap16xx_gpio4_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio4_resources),
-	.resource = omap16xx_gpio4_resources,
-};
+static const struct software_node omap16xx_gpio4_swnode;
 
-static struct platform_device *omap16xx_gpio_dev[] __initdata = {
-	&omap16xx_mpu_gpio,
-	&omap16xx_gpio1,
-	&omap16xx_gpio2,
-	&omap16xx_gpio3,
-	&omap16xx_gpio4,
+static const struct platform_device_info omap16xx_gpio4_info __initconst = {
+	.name = "omap_gpio",
+	.id = 4,
+	.data = &omap16xx_gpio4_config,
+	.size_data = sizeof(omap16xx_gpio4_config),
+	.res = omap16xx_gpio4_resources,
+	.num_res = ARRAY_SIZE(omap16xx_gpio4_resources),
+	.swnode = &omap16xx_gpio4_swnode,
 };
 
-static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
-	&omap16xx_mpu_gpio_swnode,
-	&omap16xx_gpio1_swnode,
-	&omap16xx_gpio2_swnode,
-	&omap16xx_gpio3_swnode,
-	&omap16xx_gpio4_swnode,
+static const struct platform_device_info * const omap16xx_gpio_dev[] __initconst = {
+	&omap16xx_mpu_gpio_info,
+	&omap16xx_gpio1_info,
+	&omap16xx_gpio2_info,
+	&omap16xx_gpio3_info,
+	&omap16xx_gpio4_info,
 };
 
 /*
@@ -227,11 +219,7 @@ static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
  */
 static int __init omap16xx_gpio_init(void)
 {
-	int i, ret;
-	void __iomem *base;
-	struct resource *res;
-	struct platform_device *pdev;
-	struct omap_gpio_platform_data *pdata;
+	int i;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -240,36 +228,41 @@ static int __init omap16xx_gpio_init(void)
 	 * Enable system clock for GPIO module.
 	 * The CAM_CLK_CTRL *is* really the right place.
 	 */
-	omap_writel(omap_readl(ULPD_CAM_CLK_CTRL) | 0x04,
-					ULPD_CAM_CLK_CTRL);
+	omap_writel(omap_readl(ULPD_CAM_CLK_CTRL) | 0x04, ULPD_CAM_CLK_CTRL);
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
-		pdev = omap16xx_gpio_dev[i];
-		pdata = pdev->dev.platform_data;
+		const struct platform_device_info *pdev_info = omap16xx_gpio_dev[i];
+		const struct resource *res = NULL;
+		struct platform_device *pdev;
+		void __iomem *base;
+		int j;
+
+		for (j = 0; j < pdev_info->num_res; j++) {
+			if (resource_type(&pdev_info->res[j]) == IORESOURCE_MEM) {
+				res = &pdev_info->res[j];
+				break;
+			}
+		}
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		if (unlikely(!res)) {
-			dev_err(&pdev->dev, "Invalid mem resource.\n");
+			pr_err("gpio%d: Invalid mem resource.\n", i);
 			return -ENODEV;
 		}
 
 		base = ioremap(res->start, resource_size(res));
 		if (unlikely(!base)) {
-			dev_err(&pdev->dev, "ioremap failed.\n");
+			pr_err("gpio%d: ioremap failed.\n", i);
 			return -ENOMEM;
 		}
 
 		__raw_writel(SYSCONFIG_WORD, base + OMAP1610_GPIO_SYSCONFIG);
 		iounmap(base);
 
-		platform_device_register(omap16xx_gpio_dev[i]);
-
-		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
-					       omap16xx_gpio_swnodes[i]);
-
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to add software node.\n");
-			return ret;
+		pdev = platform_device_register_full(pdev_info);
+		if (IS_ERR(pdev)) {
+			pr_err("gpio%d: Failed to register device: %ld\n",
+			       i, PTR_ERR(pdev));
+			return PTR_ERR(pdev);
 		}
 	}
 
> 
> Thanks.
> 

-- 
Dmitry

