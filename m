Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10730CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 05:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWnObvvYz2jxVvNJZ4O4Otjd3qRMPJxYo5uUEck8zsM=; b=fx1jv4gAfiU8OmNMN5PA03MvzM
	pc5Tzv98/9ACP3dgGtAXtABJYeB5jfEeOQB402a8FdPLJI2a+ZTVkGOjy2oTKgVTsH+J8OtOo1Pqe
	UI7XeuyFlUvPgT4jcDXW1x+5FDHhUWqzuS4MeSY2uFXZbVVkv07N05CW9ReI6C6zg9nZ28i5p5c1v
	6LuxItwYmfyBsOXqYXvGQs5rdVAkQ7M8FiDbYcyjZWp9Fye96heUGmtyE55m97/PiNLcdf4BjToXs
	n+IHY4kR2cGzU/jCjzlFJE7p8FweTPIoL2PLKW0gKp2WdInOobP81vxOEot8k9PWmkHVrvxO9WexL
	j+ywbJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZT8-00000003YvH-00NZ;
	Wed, 20 May 2026 05:27:46 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZT4-00000003Yur-49gQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 05:27:44 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-12ddbe104ccso3128057c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 22:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779254862; x=1779859662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWnObvvYz2jxVvNJZ4O4Otjd3qRMPJxYo5uUEck8zsM=;
        b=Sx7v90jEOjOxD+CxOqS+ajEJ17UiSHNmZYNd8z1Uv28bdYES38gv10S+qn3b5zEZks
         UKQ/3MJsBBOyjXiOdAADROcqatVQbWqNffB9JfLpYfMB5TzojfsMEGwa7kF+U33BUoZK
         blQTwCaIxKot/1uPKx+GZUspFgnaZ6ZtPQT9lCyBEWcMGINnDVtLLzQjn7SHTyUxEsxl
         DGUeQtSrj87mXLMsAkRoEHzTOOXzENwYErL+xnZ3a9F5We99dn4Vyecfig6Vi/GOk3Zh
         GATsOpJQj2gsGP5ynd5TGul0lalSJYH4LrWSXrDHtFIII5EYnsuFs9Du4BpryHKRB/7E
         Sb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779254862; x=1779859662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWnObvvYz2jxVvNJZ4O4Otjd3qRMPJxYo5uUEck8zsM=;
        b=LOR3c8tFdZjUEG2AG9qm++YHR4R+K8zoWOaAaAwRzkz04z88vzogq0DfGDb9cIjHqi
         gYsCHmvmeKjdPWXvErVoK4HSbNxDxWX4d6q0J7IHK5Ki3d7D4v/z69t/VIzaMutSgTqy
         +j4yLJWVXebjXKeOVpUsZ9lrQP6UIg5H0nJ+ad+xN8Md0gViSIzDcd+eYT4c17LwdBVJ
         MiAZ3Ousm6AAH5PSc2xzI/KaoWL/Biw9Xh5pscTMVz4Ot9AYcM+9lMig6GDIq7AVEpmw
         lG3UactPFAEzK0BXgYpr+rYgfaRTgKcDDdqVO/snE0QeU/3VxBheOrx5EHi1jSEVObkg
         vCWQ==
X-Forwarded-Encrypted: i=1; AFNElJ93FtxHTWsSvAWCYuuJgTFXrHOFGAsiFHYSVvO7QchIJTU9nzPEvkXqF04QZp8wiCCNcLhQ24hi48HxffjL5erx@lists.infradead.org
X-Gm-Message-State: AOJu0YwV8Oss+7Z1LFDiij7zs8hKDBm+OUyljQXuC2JH/ESFurXlcZOr
	twiT5Fy9jjIAVIo5jQ/dyZIfTq6qqi+ogYkfAO0X7mImp/nw+izFmXsA
X-Gm-Gg: Acq92OEQ3CXLgtf5iTlNCRlocNKI10wKTWYJN7hSFh2vnKexwGbSB13DOUBMbCbeG5Y
	gOmVSO52yLpqWNFmtplhmkqqQVQkgQ8Ze9Foac9smbTRM9f8BHEOZ7EbZBoEknQ7hTMG6bn1vhM
	zEf9olhCgQKYOI+JAkpH92Fonsi+GzCrIOurFSBGgT0Rt1mPNjF3o+qCpb6oEJ4H1CofdPeZXns
	xaeDgF0gJnoUvTHMdPkQW3XarIz0VIPXVExghcfOiNYxvjOFG3L5htx4TaY0kH1fLEjIoAm82ri
	Zv6Rb1qneQmDaRWwsRA8le+ryxU01XBFGU8UoOptQPRaUofxpLzDTTNf0M/EPEMzpcdQhi7T3fV
	WUwr/1VIChOqO/bcatpeAm7MSnSUU+anUYaf9tnKYnSdepKQD4fO0pyRu3oAXizGjIEuc60N+tl
	q5USfhd0JDzEzHrAb8S86NF5PtusVary7BspPrx+VZ3ovvWqScwNRRB+Mm0ZBaG69+
X-Received: by 2002:a05:7022:e14:b0:135:d5d1:514 with SMTP id a92af1059eb24-135d5d1061cmr2290514c88.14.1779254861871;
        Tue, 19 May 2026 22:27:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7677:c3e6:c92a:e780])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm25863329c88.5.2026.05.19.22.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 22:27:41 -0700 (PDT)
Date: Tue, 19 May 2026 22:27:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
Message-ID: <ag1GJygtLgngKQqj@google.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
 <ag0Dn66ZVnbTc7J2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag0Dn66ZVnbTc7J2@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_222743_030477_54515D73 
X-CRM114-Status: GOOD (  26.79  )
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

On Tue, May 19, 2026 at 05:46:50PM -0700, Dmitry Torokhov wrote:
> On Mon, Mar 09, 2026 at 01:42:41PM +0100, Bartosz Golaszewski wrote:
> > With no more users, remove legacy machine hog API from the kernel.
> > 
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Argh! What is the replacement for this? I have patches for rsk7203 to
> use them to get rid of legacy gpio use, like this:
> 
> diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
> index f8760a91e2f1..5bbd3b31cffb 100644
> --- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
> +++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
> @@ -12,7 +12,7 @@
>  #include <linux/smsc911x.h>
>  #include <linux/input.h>
>  #include <linux/io.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/gpio/property.h>
>  #include <asm/machvec.h>
> @@ -165,6 +165,19 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
>  	},
>  };
>  
> +/* The base of the function GPIOs in the flat enum */
> +#define SH7203_FN_BASE GPIO_FN_PINT7_PB
> +
> +static struct gpiod_hog rsk7203_gpio_hogs[] = {
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_TXD0 - SH7203_FN_BASE,
> +		 "TXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_RXD0 - SH7203_FN_BASE,
> +		 "RXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_IRQ0_PB - SH7203_FN_BASE,
> +		 "IRQ0_PB", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
> +	{ }
> +};
> +
>  static int __init rsk7203_devices_setup(void)
>  {
>  	struct platform_device *pd;
> @@ -172,12 +185,10 @@ static int __init rsk7203_devices_setup(void)
>  	int i;
>  
>  	/* Select pins for SCIF0 */
> -	gpio_request(GPIO_FN_TXD0, NULL);
> -	gpio_request(GPIO_FN_RXD0, NULL);
> +	gpiod_add_hogs(rsk7203_gpio_hogs);
>  
>  	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
>  	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
> -	gpio_request(GPIO_FN_IRQ0_PB, NULL);
>  
>  	error = software_node_register_node_group(rsk7203_swnodes);
>  	if (error) {
> 
> 
> If there is no replacement maybe we can resurrect this? Or shoudl we
> have add swnode support for hogs?

Hmm, I guess it is already there so I should simply switch. Sorry about
the noise.

Thanks.

-- 
Dmitry

