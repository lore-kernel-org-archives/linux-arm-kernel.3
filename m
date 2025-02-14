Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61044C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=; b=CtlMN8P+4PzeFOdoMR4bwt/u9s
	xkOJt1hmDD+ioD3iD0StzHommauBP7kdm82yjbIJdMzB12bBlJAV4Nifr3HwgE/Zn6QwYPZP+OrQY
	dLftEBD3QcZ2S9mkWirqW1IFkXg3pDtzIY7lsyrzxWB2eXjDzcFToe+X4Z8Q0zgH8OkfGzdvM58Pi
	2kRWja7s51ZpPEoaTW+EHiCXSqDVFn5m2tPW/4N5IUGZvyIWjgkiovcqxM6i5+UiyQhfKn8/CxBu9
	XU8YjJVvnnN9XYv2dcfNOmbjoipATO6fjZDb+Dm3OKq1++ZEzKOSeROCWjqMhLDqmMB4CUTDMmBVo
	HC/zC7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0tv-0000000Fxmj-0wC1;
	Fri, 14 Feb 2025 18:58:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Iv-0000000Fr9N-15Qy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:20:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f32c1c787so214335f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739557243; x=1740162043; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
        b=arWrpM51SjA/A1sFkPU3dGxiiaCrV5KTSdG91sFiD/jGOPh7eQHxXBNhXzxykq6eYz
         Gmj5kqB+5/CPjbmO6GYXFiUVv0D6mM8eqzVje8j8udzhy8+tW0nIkjGwWy49Nvmv6ZRz
         ljKip56FMVD4dKsRV4BXrSZdXKsvWSOJwzLulvLPZEywA9LIeN/9AOyl0vIQw8wUj6iU
         9sIn6RX60/Wn3yyriVw1ZzTGKMy4UIP7V3DbT+qodWZe6V2jThPwjIB8A0kPGVJfuDKE
         0YRFzDOlrgKeDznh2jbRCLJxy27BzXKmnxBDLKqS3zav1MVObKO3c6/scf3dtG5sCAuN
         +eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739557243; x=1740162043;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
        b=dMY65lCT/u8XWQ28JCuzd95a/6PEQOozmE3+emsVRT4tQ41TFwiLtTrt2JOrFxHKPR
         K2WzoB8QkIQspQEovJTGeg3I7ng+gUGX+xFJXJRZAmQp6iAPyGOzV5XeSLhhGvnKi/64
         3ISt68eSRqCcUdxk1cqHgJhEf5vS4PGVOyqS5ULcli6Wn3r6fvOw8++WIm7wkXg6qgZa
         5NZk2+rDX5r8mdWR+MbrLNd9mXtMhRXCPBnq+gyttNvFLwrm1OaSGhUYfHkKr0fpb+Hh
         KBQ2o1QGKvRIzD32/AgnzBmALnNr/himlLWzciFoGvqxTNOvfPEIXjHIfDZDpzIXypj+
         UbEA==
X-Forwarded-Encrypted: i=1; AJvYcCUXxdG7KaKfc7NL1IfHiGOHa2lJA1xE8Rv1fg2gSO2ZHUQW9pmgVeCJ37SrzBDslgTRey3IdaHgzeDFKRMwXij2@lists.infradead.org
X-Gm-Message-State: AOJu0YzAixuj1VA3AzbZgvWF5gnDf8eQNOGMkqibjtpiuMBryjE8lHHj
	bbmEAdwxA4E3E/6GqfGDl/p64htk8NxzQcygFmzov5K2JLcrnyrrJjknSQy8dPk=
X-Gm-Gg: ASbGnctn04atG+Y0rSuVXYbU60+ms/JtOe7r4dymDBNRMoz19+GEl4Bg9pcDddsDSZd
	farN3aVLgfroj1jYzB5IHG8MaJIhgcr0l8E26AE/ucjBE+fp8L+cCS+Rf20frXWSkJvPabw/KLi
	83bSw9Uu/oKdSXlAF2nQKpdEaNWrpOlRhMcdICygioO+pcXBpZp+Xbwpkm2Q5IEQs+nB9a/v/m+
	qqx4Zb7HRlVBZrSlo9Yt5N1z7auoekMjQtqrQ6O5y7tIjvxml2MvHibqCo8hmKEbF3NBE9H7y9Z
	logdQ8wLo721ww==
X-Google-Smtp-Source: AGHT+IHsTHTiL3wJj3nrHf3yF9cKckC3Rmpa9H0r1If+8TaecjIo4Dqny2vOXtw6IlfG2e9gn40oVw==
X-Received: by 2002:a05:6000:1542:b0:38d:d4b5:84d5 with SMTP id ffacd0b85a97d-38f33f14a9dmr31093f8f.8.1739557243484;
        Fri, 14 Feb 2025 10:20:43 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7018:8c7:bdd4:3436])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43961884e88sm49912865e9.26.2025.02.14.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:20:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,
  "Stephen Boyd" <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  Danilo Krummrich <dakr@kernel.org>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Douglas Anderson <dianders@chromium.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de Goede
 <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  <linux-kernel@vger.kernel.org>,  <linux-riscv@lists.infradead.org>,
  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
In-Reply-To: <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch> (Ira Weiny's
	message of "Fri, 14 Feb 2025 10:15:36 -0600")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
	<67af6c284c349_1614f3294dd@iweiny-mobl.notmuch>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 19:20:40 +0100
Message-ID: <1jr040xu9z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102045_310281_17E84458 
X-CRM114-Status: GOOD (  22.54  )
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

On Fri 14 Feb 2025 at 10:15, Ira Weiny <ira.weiny@intel.com> wrote:

> Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>> 
>> Use it and remove some boilerplate code.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
>>  1 file changed, 6 insertions(+), 50 deletions(-)
>> 
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
>>  	struct clk_hw_onecell_data clk_data;
>>  };
>>  
>> -#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> I see the Kconfig ...
>
>         select AUXILIARY_BUS if RESET_CONTROLLER
>
> But I don't see how this code is omitted without AUXILIARY_BUS.  Is this
> kconfig check safe to remove?

Ahhh that's what this directive was for.

I thought it was really odd to have an #if on RESET while auxialiary
device was supposed to properly decouple the clock and reset part.

To keep things as they were I'll add an #if on CONFIG_AUXILIARY_BUS I
wonder if this driver should select CONFIG_AUXILIARY_BUS instead ?

>
> Ira
>
>> -
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> -{
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>  
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>  
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> -}
>> -
>> -#else /* !CONFIG_RESET_CONTROLLER */
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
>> +	if (IS_ERR_OR_NULL(adev))
>> +		return PTR_ERR(adev);
>>  
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>>  	return 0;
>>  }
>>  
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> -
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>>  	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
>> @@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> 
>> -- 
>> 2.45.2
>> 

-- 
Jerome

