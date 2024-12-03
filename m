Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C9E6C610
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=har3faI8rWqjG1DeufIBkpWXrmN5D7dbzN2EbW5L5A4=; b=NvNvMqwpZs2EXQKXDLl59Zcrhl
	NIGFuHC26xD9V6LNBgoaghQ61zFoQjhEzlS1Z/5VzphIl4+m9ssDQ2RrsdPM1lSDmeIe27sXj3TjN
	zqH8euSRIuNNd6jgUSH/WHVAxgOdzJ0/VgQANyFyFnB9agv72/kuPkjRBj7Qtrd8AGilSF5ailnhR
	7lb4SHz7V0dNJY6ws3YI5nsRQbB8FAsDoFq1Kqjrc08PiJSEN1bEoACSOXWBCL5OjrHEGgL3rIU5m
	KjWRolhy9vLX3/91hoyB32JktSNzDvu1aPcYVc3F4Dz4pvrJpraG/L+1WctVKOkmNrUWIdinSxmxG
	hNtq5dlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINGc-00000008VQW-2mf9;
	Tue, 03 Dec 2024 07:24:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINFb-00000008VCq-2S6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:23:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385dfb168cbso2431804f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 23:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733210594; x=1733815394; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=har3faI8rWqjG1DeufIBkpWXrmN5D7dbzN2EbW5L5A4=;
        b=UiRY2ueuMUot8ElVRnBNOSzd/QyWIXEOs25jj6LR0zKvN/3zSR81NJsf5PfIvqnSER
         e8OWHOZiWP9iopSMlmMvgVKyPOqaF5TN6bbCqTnY9+jKK/UE3e3CYp3Ur2sOHvBxsh4E
         PXQ/boVsIMyakKM2Ssif8J6htvTmI7sUy5EhPWVlFiEYv8gjSNPw+sn+Q/nZcvrjwPhs
         R+t+UBc2L0pzeUstQCwO67D5F++2WPfevhMZj8AQIIv1sQlr+GtNzfxk5zls1p2I/QFt
         FjHo+ok6azFd21yrUxHy0gS4K+V5NN4wQ0gH5ueI9XkQLhca72ZWwq6p4AYbrXNmRD20
         2ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733210594; x=1733815394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=har3faI8rWqjG1DeufIBkpWXrmN5D7dbzN2EbW5L5A4=;
        b=kzBKdVSsfmu5J4NWQadkv+jQH32OT+LCVWzCHd1mZGPXoHGGM2Or/qze2ppSp2/ob0
         ePq5a8KfJsxs1D1P8DEq5R4czSYSN8tt062k8NTL3DnF+FJX/QA0ylO+LkQU6g/3xe6s
         xhr8GVc8sguHw2h2UQ7Vtvp0+L8EYYN1QmI4Lyl1t4Sd6T6eD246JckJ+sbA0RovGDrM
         ZgVgTIoWA1jx/XAU+cX2ENgQgHjQ+h++s0sre2KZu8UIRk8atv8EORz0qzt+nb5uA/XG
         jn1zIdlkXuC+P6KhcoRu74PHJKf5FXUjRH+Y426WqXdi4H4KUzb8A/dShCvy26qrvwIt
         5zmA==
X-Forwarded-Encrypted: i=1; AJvYcCUZYjZtAXaKsgaR7dSs67ZU2Z8/m3XuYtfwI7WA21in0n42GCl0GYBHJdYCSxPrmXqtQdWUsHtGftWg3dxnSrL8@lists.infradead.org
X-Gm-Message-State: AOJu0YwGrsyVJp5RRkOUvURumJWTyeoqNz7DMZMmPOHEkAuzQGWGlHLg
	zr5gtAPM0RPCip1eSaGoTb5pqds5mez7wuWpCabgamz+Vz+f7Lc/mYJEvUqNSt4=
X-Gm-Gg: ASbGncs3fuXU4RAE7xmqV0JUSddfXVTxBkWolZzCg0gN+oGk0RxHpuW2HPXcJtz1GXq
	Mp5MmbcDZszlFuaF+7UUwVShxiXDdzc09rCGlyBDAeXr7H9vS2h7dQYbE680FFz0LmGP0RlGBxy
	mrAlOUKYXWxNMxMpbif6nprrzVtTq9Rz+HTmfkRJcWckAoATkUQaB7niSRw+fPxDneilX6Sgez+
	XkieG5xoiViYclD5CHz5NZg/pNJ5wQ4FyskSik/AEC2osW1iktjE0Y=
X-Google-Smtp-Source: AGHT+IG/NOcXjFAExqQ0F5f6jl7y9cNorOaeuQVYtVLDO/J9NGcpJBFDj38O5aqVvTeq5nIo+I6kZg==
X-Received: by 2002:a5d:648f:0:b0:385:e36a:e19f with SMTP id ffacd0b85a97d-385fd419194mr994522f8f.41.1733210593694;
        Mon, 02 Dec 2024 23:23:13 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dec66e0esm12193749f8f.43.2024.12.02.23.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:23:13 -0800 (PST)
Message-ID: <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 07:23:12 +0000
In-Reply-To: <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_232315_667059_94EC6B24 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, 2024-12-03 at 06:47 +0000, Andr=C3=A9 Draszik wrote:
> Hi Thomas,
>=20
> Thanks for looking into this!
>=20
> > From: Thomas Antoine <t.antoine@uclouvain.be>
> >=20
> > The Maxim max77759 fuel gauge has the same interface as the Maxim max17=
20x
> > except for the non-volatile memory slave address which is not available=
.
>=20
> It is not fully compatible, and it also has a lot more registers.
>=20
> For example, the voltage now is not in register 0xda as this driver assum=
es.
> With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
> doesn't exist in max77759
>=20
> I haven't compared in depth yet, though.

Regarding the regmap in this driver, please see below comparison I had
collected some time ago:

	regmap_reg_range(0x24, 0x26), // exists
	regmap_reg_range(0x30, 0x31), // exists
	regmap_reg_range(0x33, 0x34), // exists
	regmap_reg_range(0x37, 0x37), // exists
	regmap_reg_range(0x3B, 0x3C), // exists
	regmap_reg_range(0x40, 0x41), // exists
	regmap_reg_range(0x43, 0x44), // exists
	regmap_reg_range(0x47, 0x49), // exists
	regmap_reg_range(0x4B, 0x4C), // exists
	regmap_reg_range(0x4E, 0xAF), // 0x4e 0x4f exists
	regmap_reg_range(0xB1, 0xB3), // exists
	regmap_reg_range(0xB5, 0xB7), // exists
	regmap_reg_range(0xBF, 0xD0), // 0xd0 exists
	0xd1 .. 0xdb don't exist
	regmap_reg_range(0xDB, 0xDB),
	regmap_reg_range(0xE0, 0xFF), // 0xfb 0xff exist

the comments refer to whether or not the register exists in max77759

>=20
> > No slave is available at address 0xb of the i2c bus, which is coherent
> > with the following driver from google: line 5836 disables non-volatile
> > memory for m5 gauge.
> >=20
> > Link:
> > https://android.googlesource.com/kernel/google-modules/bms/+/1a68c36bef=
474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
> >=20
> > Add support for the max77759 by allowing to use the non-volatile
> > memory or not based on the chip. Value for RSense comes from the follow=
ing
> > stock devicetree:
> >=20
> > Link:
> > https://android.googlesource.com/kernel/devices/google/gs101/+/33eca36d=
43da6c2b6a546806eb3e7411bbe6d60d/dts/gs101-raviole-battery.dtsi
> >=20
> > Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> > ---
> > =C2=A0drivers/power/supply/max1720x_battery.c | 71 ++++++++++++++++++++=
+++++++-
> > -----
> > =C2=A01 file changed, 59 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/power/supply/max1720x_battery.c
> > b/drivers/power/supply/max1720x_battery.c
> > index
> > 33105419e2427bb37963bda9948b647c239f8faa..faf336938dd4306dd2ceeb0a84b90=
ca8
> > 0ad41a9f 100644
> > --- a/drivers/power/supply/max1720x_battery.c
> > +++ b/drivers/power/supply/max1720x_battery.c
> > @@ -13,6 +13,7 @@
> > =C2=A0#include <linux/nvmem-provider.h>
> > =C2=A0#include <linux/power_supply.h>
> > =C2=A0#include <linux/regmap.h>
> > +#include <linux/types.h>
>=20
> Please keep file names in alphabetical order.

Ignore that, it's too early :-)



Cheers,
Andre'


