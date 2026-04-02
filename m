Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE94D6AAF5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz8YcwWkdWOvxMK3RVth/0rCZCw77MdxTEXEAAB58s4=; b=Hy9rlxGwMjqnljtgLe2EgGbFC9
	HThU66a2DG+J6hgeXxdiqfwGBFVar+rGBkuveCvm0GkjY7K0Q9Ez5Jk1JF9USq1trGYImWgtvJi3B
	JsnzGy3E945g7bwUr7eAdfx21Q+795IDfsHevJ4ST8xbxBboHKFcVz6xKHgV90r7EkGrYVbhwdt0t
	k9gwbRQ2tr54CNCjUntJMr7FJ6BcwNhBcDQVgfjzizwWrJQtG3MeygouPbEOuzUZWALR06uroPsNe
	6Zr1ESA1Bz+hrWlOYqa/CzfOLzbG+WqO1k47y53CwXpWJQwLgaAKyXUg910HOFVUEbLP2BfouG8ls
	vfzwBUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Lu5-00000000b4h-3rXD;
	Thu, 02 Apr 2026 17:32:25 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Lu3-00000000b47-3oFb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:32:24 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1393163eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775151143; x=1775755943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz8YcwWkdWOvxMK3RVth/0rCZCw77MdxTEXEAAB58s4=;
        b=dixOl8AeRMzVirmvDfiGzTnRnA6vroaGBWX0aS9J6+JV+kC7dRwEKvM6X01NGm6oAY
         Gx0iSB6rNIVDyQPjg6naC9QE3XeBCnAcwG4zuFq5dA7huRUzJhYFoIwbKd+/FkZ/NW+D
         eebg8eaMW73DCcbQuzGsdvIDnmyquD9cDMnLPbmQD0cLjLMdZhiX2OlYAg055yii/ufd
         JOQTXwkmPoqgLRIp7RhcC2LSF0kkcDRLgMmaR1FarqqYWYY+/PY1L9gMB0w1Vv/qCl+e
         wd1yJabayeV2LBAkmgG4guO8KIp5HBKL7aD6KoNSSMLvLqG1oAVd2ijL2PDJnws6fSNh
         cgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775151143; x=1775755943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz8YcwWkdWOvxMK3RVth/0rCZCw77MdxTEXEAAB58s4=;
        b=D8Yz39Eky2jKGrwLX0ELSckeGXyoaehlhay4hknjPWVEbONEZ4AnjDlNcZ0bYw2l5X
         096jm158V2dGP0PV44+4mcyuRmmcfy2MiUeixOgCX+7qDWeIVPgkJH2On4C4YYr3Q+gA
         O2N6LONzYGc+TYM1+F6X8Mmo3TVqs9j7DEZOrFAPA/u8M9CDU4MLKBtR8RR65P27ddD8
         VaHLsjQMI1L7amXemDu9vWd3OD+3+92UgsVSXKNWaXrAASGpB/jpuFA8tx25/C4lBOKy
         EIX+QE2iVhZ4ulWhkCT3iQGyJ+VZXoAFv981+231TM725f8IhH+4tNoRK+ryeZFyMoQD
         x4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWZRLf8Ts5zajkr/GPNCjU2THFWVVUqQMRzQRiLfAsptgFl4MiJix/ZFHnrb075ZGLc38m2mbm5nrsFWAdO7ISe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcoq+vA7+zq2Fp/csxOuQwI36FW2n1mSSVcmtILNtiXYHGRcRJ
	s2BarQT6f/H4xWQ+zbpw2B9uv4QT/w8I8rtMcHaLytpNbtmvcq0JPFr6
X-Gm-Gg: AeBDiett/WsFqfPTCZmNWi5tKAswBioJ/FLN+kQbYDqitJ/8qwQ1dtoJhkzVYvI8KOA
	N34pKJJqzqZD6qmta2c5oPLctGgW0pYB7c++d2X+FxxayXSyDRP1rnELpYvjKY+aeeOAYjmWelk
	3GOyYiB+rKzuyPKGL3BpK52U5LvqxCtYxbp1gvM9HcT2XJCZ41coMHqquxTaNKVMSpDss4YpeL+
	RJVNCzmQ9HNQy5cpsVeQUvp/8lcUvmEO7ITNSSu4ZPEUzXdlvtbAWefssHloAEQZtLbv/8HGSKa
	iefBhH1xhhlQzMhS9TXWc72vLlpdSkiCyLaE1NtHazp/6PrxgPSgCNj/pwT9d6QVjTURD3HYkou
	Fc7zuoaK6C+HfeUM9P++YRmh/3tyh+ojn/bGg2WZOSninYbMCL+5abT7UWumin+8UIWHq7qksVE
	VGLTQSi9hg3nCdCKOIBSYt3mliU0JzEKTuSdkHzXgsrzK/HTuKwHY7vfvkn49FMXR3
X-Received: by 2002:a05:7300:6da8:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2cbfc073927mr1038eec.26.1775151142569;
        Thu, 02 Apr 2026 10:32:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm3001257eec.0.2026.04.02.10.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:32:21 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:32:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <ac6n1p3eLVFzumbt@google.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_103223_947620_0CA9C8C7 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, Apr 02, 2026 at 04:15:05PM +0200, Bartosz Golaszewski wrote:
> @@ -244,6 +263,13 @@ static int __init omap16xx_gpio_init(void)
>  		iounmap(base);
>  
>  		platform_device_register(omap16xx_gpio_dev[i]);
> +
> +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> +					       omap16xx_gpio_swnodes[i]);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to add software node.\n");
> +			return ret;
> +		}

I think the best and safest way is to convert to using
platform_driver_register_full() and set swnode in the relevant "info"
instance.

Thanks.

-- 
Dmitry

