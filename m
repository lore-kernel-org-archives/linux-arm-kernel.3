Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpzQbnLdagNuUxuQR/6JxQR5FVOFTqBbuMpnc5Onjr8=; b=2k0ML9l0hN322Iu2A8lrpOfHNH
	dbMdKu8d8tDeOU3qrDCY1IMN++jvBB2sMAsDIPyNRCXyT1Qjg1wlAjHIKGUWvvaP8RdpnVrfswW8M
	lDXAlAdY4S7E5CLgpso9yrN/p7xIYytrQn+gIrBj88I5PYjfr7c8IYDiGOA7CQCoi9/dvEES8xDCD
	E7yHRyIMVGWVU9ccPU929qZT1Hay4qMQwZR0wZCVjB8sqYsbjR1CpHDln+coayHttANx82EJE/6TG
	iB7++jThdpnYvTSTi65h75s9oLr1TB9d2tD5Ip/+VGfTTaX9+T7LrlCoYQDeIl5eK3uzIWlddZB9H
	7m/W990A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj224-0000000G8Dg-17Qi;
	Fri, 14 Feb 2025 20:11:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Es-0000000FqW1-0Bvi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:16:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4395578be70so24507685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739556992; x=1740161792; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpzQbnLdagNuUxuQR/6JxQR5FVOFTqBbuMpnc5Onjr8=;
        b=iXWfJPSE3KB8WUccuzDoBo6HWz3hD9aZ2rawEBkTmD2ac7vk/+/BpJ0DD9u+zgwz3P
         6t4sDcMiRr5hyASY7Y7RvSd7m0fQvJCnVEC4tDqv3Wccqlq+eCX6FoIWvIl9U4OnSAqO
         EFDxy0iMxs2CX/rIzwPbR1ObIzl8i38FE2Hej6ggaCyd5e3J3zReamE6HLnHpL/0m5tj
         tGp35CUXccMtFKk/CD7UzIdV8wa85JlG75J4VhXwB7NU2TqorQ1sXwmxrmwtVngBXizD
         Dd6UmNbAQOjM/EWey7t0cWjjPRkAzSmByrMUnlG0pplKtYfYVuasM9JwQ893gfXaFCkk
         uJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556992; x=1740161792;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzQbnLdagNuUxuQR/6JxQR5FVOFTqBbuMpnc5Onjr8=;
        b=fMFJBOwm4t5o6ZjzoCerZhjypN7k8h08/tOgNfIZAA/BGB3vT1kkb0x2SeZ4ckcnzB
         Aa2IizmGo34rfzyZ4aW6GdhLLsiw2ODIfNMBTccbCYwQdJN9QsGe/BaYjbCH3hsAxN+v
         VOjWkC4xeW0xSowZkN2mGBKKIMOL9PhpN+SL48M3wwjZG2tljEELo/uSTPoyVkpQZyyd
         zlKEbjLy9nIQ8CWVICqLRybd5dXevasoF5WW5m1Wf6aovTt1CV1LTDZAGVfSh3lJ/gMG
         wJ34Ff1swTUfepqs1N6NMVsoN43I6Jybf0a5tWhGuomFK6/vpaELah6L+r/HMauGGeyj
         tjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxjZ/O+KVx9HGltwTtXHGjMYyNrrQ6VtGj5m0KyXUQzyuqRrxSMk1UD4o1iGMPkFCB5PQ8gCk/CSGeTnALb1R6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh+W0Ry8qq3/vO4BbCiuMURoUE2j9BJdOtFYU9WwlNOiC/KQcZ
	45DJl15hiPR6iabixzyGuEofMfUl1xSRgPBhJWOBvSaVXVAQtVylGYidzr1WMKg=
X-Gm-Gg: ASbGncuM7jBKLH0gDdhypahwfVUNM378l7rgriMI9u0jwBqBBnC406r8BDIYmCVjXG8
	cZA28Elghhseec0wU5McChRp+s1p8q6XmAAqVBNaNXdsvbguFepxVR8YGPvv8Xsm9vAf4HHLrRP
	qDlRmTEMX28ezWpyeAvEOW2y9i6fqnT2b/O3AtyXi5qJp7dMcaQKnMWU1AEkUR0M01X1p26Wxbt
	9BlCYmAm8NpAoEZVGYfSsZm4Yn/e3FcsUBpg1MwzoGGIZewFPw7vc6v2MTaYc1KgPAnVUsh0iLA
	U246GLNwtpYwvw==
X-Google-Smtp-Source: AGHT+IFBN3j/Zjv2CLSxpQNFmRLH07Um+mn6wIlqNWgyJFTqmPU8STnXQY2KZybJYPY9YWV6H4qloQ==
X-Received: by 2002:a05:6000:154c:b0:38f:2025:9c2b with SMTP id ffacd0b85a97d-38f20259e49mr13952599f8f.33.1739556991710;
        Fri, 14 Feb 2025 10:16:31 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7018:8c7:bdd4:3436])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258cccd3sm5221627f8f.23.2025.02.14.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021437-washout-stonewall-d13e@gregkh> (Greg Kroah-Hartman's
	message of "Fri, 14 Feb 2025 17:33:35 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 19:16:30 +0100
Message-ID: <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_101634_080469_E653D8FD 
X-CRM114-Status: GOOD (  42.70  )
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

On Fri 14 Feb 2025 at 17:33, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 11, 2025 at 06:27:58PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/auxiliary_bus.h | 10 +++++
>>  2 files changed, 98 insertions(+)
>
> I like the idea, see much the same of what I recently did for the "faux"
> bus here:
> 	https://lore.kernel.org/all/2025021023-sandstorm-precise-9f5d@gregkh/

Reading this, I'm getting the feeling that some (most?) simple auxiliary
driver might be better off migrating to "faux", instead of what I'm
proposing here ? Is this what you are suggesting ?

Few Q:
Is there some sort of 'platform_data' (sorry for the lack of a better
term, no provocation intended ;) ) ... it there a
simple way to pass an arbitrary struct to the created device with 'faux' ?

The difference between aux and faux I'm seeing it that aux seems to
decouple things a bit more. The only thing aux needs is a module name to
pop something up, while faux needs a reference to the ops instead.

I can see the appeal to use aux for maintainers trying to decouple
different subsystems.

>
> Some review comments:
>
>> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
>> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
>> --- a/drivers/base/auxiliary.c
>> +++ b/drivers/base/auxiliary.c
>> @@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>>  }
>>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>>  
>> +static void auxiliary_device_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>> +
>> +	kfree(auxdev);
>> +}
>> +
>> +static struct auxiliary_device *auxiliary_device_create(struct device *dev,
>> +							const char *modname,
>> +							const char *devname,
>> +							void *platform_data,
>
> Can you have the caller set the platform_data if they need/want it after
> the device is created?  Or do you need that in the probe callback?

My assumption was that it is needed in probe, but I guess that entirely
depends on the driver. If that was ever needed, it could be added later
I think.

>
> And can't this be a global function too for those that don't want to
> deal with devm stuff?

There was a note about that in the cover-letter of the v1 but I did not
repeat it after.

It can be exported but I had no use for it so I thought It was better not
export it until it was actually needed. I really do not have a strong
preference over this.

>
>> +							int id)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> +	if (!auxdev)
>> +		return ERR_PTR(-ENOMEM);
>
> Ick, who cares what the error value really is?  Why not just do NULL or
> a valid pointer?  That makes the caller much simpler to handle, right?
>

Sure why not

>> +
>> +	auxdev->id = id;
>> +	auxdev->name = devname;
>> +	auxdev->dev.parent = dev;
>> +	auxdev->dev.platform_data = platform_data;
>> +	auxdev->dev.release = auxiliary_device_release;
>> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> +
>> +	ret = auxiliary_device_init(auxdev);
>
> Only way this will fail is if you forgot to set parent or a valid name.
> So why not check for devname being non-NULL above this?

If auxiliary_device_init() ever changes it would be easy to forget to
update that and lead to something nasty to debug, don't you think ?

If you are OK with this, I could update in this direction.

>
>> +	if (ret) {
>> +		kfree(auxdev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = __auxiliary_device_add(auxdev, modname);
>> +	if (ret) {
>> +		/*
>> +		 * NOTE: It may look odd but auxdev should not be freed
>> +		 * here. auxiliary_device_uninit() calls device_put()
>> +		 * which call the device release function, freeing auxdev.
>> +		 */
>> +		auxiliary_device_uninit(auxdev);
>
> Yes it is odd, are you SURE you should be calling device_del() on the
> device if this fails?  auxiliary_device_uninit(), makes sense so why not
> just call that here?

I'm confused ... I am call auxiliary_device_uninit() here. What do you
mean ? 

>
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return auxdev;
>> +}
>> +
>> +static void auxiliary_device_destroy(void *_auxdev)
>> +{
>> +	struct auxiliary_device *auxdev = _auxdev;
>> +
>> +	auxiliary_device_delete(auxdev);
>> +	auxiliary_device_uninit(auxdev);
>> +}
>> +
>> +/**
>> + * __devm_auxiliary_device_create - create a device on the auxiliary bus
>> + * @dev: parent device
>> + * @modname: module name used to create the auxiliary driver name.
>> + * @devname: auxiliary bus device name
>> + * @platform_data: auxiliary bus device platform data
>> + * @id: auxiliary bus device id
>> + *
>> + * Device managed helper to create an auxiliary bus device.
>> + * The device create matches driver 'modname.devname' on the auxiliary bus.
>> + */
>> +struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
>> +							const char *modname,
>> +							const char *devname,
>> +							void *platform_data,
>> +							int id)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
>> +	if (IS_ERR(auxdev))
>> +		return auxdev;
>> +
>> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
>> +				       auxdev);
>
> Oh this is going to be messy, but I trust that callers know what they
> are doing here.  Good luck!  :)
>
> thanks,
>
> greg k-h

-- 
Jerome

