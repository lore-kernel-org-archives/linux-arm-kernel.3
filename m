Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC94E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ3uPxGHW9GwceDWDOZp20va51AUDdsf3QJ+X4bmhMo=; b=hMnEE71PMaC3CHVU1m5YHRRYLJ
	yB3KRsteTwH0XX/RcYxm82di0q6jucjhqHpdlYLTh/AR4dN4Ix1X2GN/1kBcnqgud+nMXUDjbFBsd
	Q8bGpXykNvoB6fhTzscLwBbIapMUV3NpqDmHbh+Vr4NvUOuJ0YRc25THZmslcs5zSosYbJiCnJ3Zc
	b8hG6G5gr2DN6Tnbc5BSroHD7FsK+kb45kJWvdmg8RaQ8p4lbRePJcfW8Lt2wTLEgglOMkLtwpGR/
	ygmf8CnElG/Nc9ajHOuTfiLxF4Aum7CqXfYkFZ/Ue11spbmSq30HWd0lwUE0m2xH+p6L6YPz+ppfh
	vJCQML6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrYT-0000000D2NS-3Kx6;
	Wed, 04 Dec 2024 15:44:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrWc-0000000D244-1hIZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:42:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4349cc45219so62906175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733326968; x=1733931768; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dZ3uPxGHW9GwceDWDOZp20va51AUDdsf3QJ+X4bmhMo=;
        b=INw/zRoT+25M7C3PN0Tji1AQKnmAsjpPw2HAkiMtZkYyYBC8HFvbl0UNbWjP0nAD37
         BhhCac1oFfon7YsffF9T4yZ4/ytN5I08nurhYPaYj2hqvmZnnhePhXAGj/tUVm9cDrgQ
         Cewf39Eed6Q4lfgAeiIDB1ZsH3vuPa7vC2B1YCI1XCVn6RisRLcbgZ2hPHgS6cTs416f
         X8kq7gxiJvK8gyEzjIMekFaMjbMzLpk4zTzh36kN2iUc62WsgjnMrBG0kg4imL696cXl
         GLZ3ivuPb988IAyRI0S3GQsrZsUCCh6Pb+PykLnSiJe++hlHhIIYuHwGWUjZvrIG9BeP
         kaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733326968; x=1733931768;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZ3uPxGHW9GwceDWDOZp20va51AUDdsf3QJ+X4bmhMo=;
        b=BCGJVHsGzV5LncBJU1tFof0X1GGr8BOsU60HkkSaeIL32jXaA6GwnDzCng6xJ3OOMP
         hxzg9k1fh1hMq6vO1wf+J2UoXrpDityO9TH6pED1tekBCgvZDFc0pyrK0qySodwzsors
         39TnLCkXrq2SB1jTruws4yEKcNCM0R6ADUo5XxJmyr7MhGr6d3nZkG/j+FIRrtq6PRyy
         XJfZGMOxkYOuIMUluDoUR4a2fJ6BbdTlZKbwhJcAQ8+WlUYGnSNtKQzGPdA5RA8h7j4u
         EajW8geAws/sCCTBcaOWAbj7aglhziKacjU4/H0GA5Qu7rQLtj/ESZJU8M7W0/H6LCif
         9jGg==
X-Forwarded-Encrypted: i=1; AJvYcCXyfDp7Be5pBBrtF2jT7WY5YQ8pJE+6yDLX2fCSdFc9RTxHbh14t1zFgjjzSAybnjeNzFPCsULXqAuRbSEsgksq@lists.infradead.org
X-Gm-Message-State: AOJu0YxLEYwH1Qkq2m6prI0MFXWQMGgG0FcQkjnVjGPcNQlajR0g6g2f
	S7dOBn+o+YovKxn15wDQp14hekLSduNM/e8awj9O0mK6ihnTOeMjwY5/wuMVtJw=
X-Gm-Gg: ASbGncv7mB9OFoWEiKEfYaMZWW7qxC1KPQaQ1U/QIcBuxfNWJaqqywixbbxuGzTiaEu
	AQ3qxqhoyj1PT/hYTmwrk4CKN2s6oBKyzh61G3DHeO9Oe2UnbwyFoJe8lpPzlTBrz3PFtH/a/ET
	BsE3T6ld3lRZJbqhZNOyIcJ4naGH1kzESwPI/cTZJ6XbbYRjnigNBh8I73mo8gzPAHQgroclVog
	lgQOBrtLpjcEoYQVl8Xl1IQ91DKKjAlv4H489XbB2qE1DoD9xbkAQ==
X-Google-Smtp-Source: AGHT+IG8d+GIp7N1rLmweG1s9QVjHKMOxpL6iKDNzEJzmEVoVKRVhmtWfMeaWkWFRVe64V9BiKR57g==
X-Received: by 2002:a05:600c:4ecf:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-434d0a14eb7mr70707555e9.30.1733326967904;
        Wed, 04 Dec 2024 07:42:47 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b131sm29295485e9.7.2024.12.04.07.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:42:47 -0800 (PST)
Message-ID: <8c1c633bbd5a81a06ee9c9f52dfa8b43cf493b7b.camel@linaro.org>
Subject: Re: [PATCH 8/9] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, Roy
 Luo <royluo@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Date: Wed, 04 Dec 2024 15:42:46 +0000
In-Reply-To: <Z1Bi2gRJefYy1tyo@vaman>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-8-1b7fce24960b@linaro.org>
	 <Z1Bi2gRJefYy1tyo@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_074250_442366_D8278512 
X-CRM114-Status: GOOD (  30.68  )
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

Hi Vinod,

Thanks for your review.

On Wed, 2024-12-04 at 19:40 +0530, Vinod Koul wrote:
> On 27-11-24, 10:58, Andr=C3=A9 Draszik wrote:
> > gs101's SS phy needs to be configured differently based on the
> > connector orientation, as the SS link can only be established if the
> > mux is configured correctly.
> >=20
> > The code to handle programming of the mux is in place already, this com=
mit
> > now adds the missing pieces to subscribe to the Type-C orientation
> > switch event.
> >=20
> > Note that for this all to work we rely on the USB controller
> > re-initialising us. It should invoke our .exit() upon cable unplug, and
> > during cable plug we'll receive the orientation event after which we
> > expect our .init() to be called.
> >=20
> > Above reinitialisation happens if the DWC3 controller can enter runtime
> > suspend automatically. For the DWC3 driver, this is an opt-in:
> > =C2=A0=C2=A0=C2=A0 echo auto > /sys/devices/.../11110000.usb/power/cont=
rol
> > Once done, things work as long as the UDC is not bound as otherwise it
> > stays busy because it doesn't cancel / stop outstanding TRBs. For now
> > we have to manually unbind the UDC in that case:
> > =C2=A0=C2=A0=C2=A0=C2=A0 echo "" > sys/kernel/config/usb_gadget/.../UDC
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 60 +++++++++++++++++++=
+++++++++++++
> > =C2=A02 files changed, 61 insertions(+)
> >=20
> > diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> > index f10afa3d7ff5..fc7bd1088576 100644
> > --- a/drivers/phy/samsung/Kconfig
> > +++ b/drivers/phy/samsung/Kconfig
> > @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
> > =C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> > =C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> > =C2=A0	depends on HAS_IOMEM
> > +	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
> > =C2=A0	depends on USB_DWC3_EXYNOS
> > =C2=A0	select GENERIC_PHY
> > =C2=A0	select MFD_SYSCON
> > diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/sam=
sung/phy-exynos5-usbdrd.c
> > index 1a34e9b4618a..2010d25ee817 100644
> > --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> > @@ -394,6 +394,7 @@ struct exynos5_usbdrd_phy_drvdata {
> > =C2=A0 * @extrefclk: frequency select settings when using 'separate
> > =C2=A0 *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reference clocks' for SS =
and HS operations
> > =C2=A0 * @regulators: regulators for phy
> > + * @sw: TypeC orientation switch handle
> > =C2=A0 * @orientation: TypeC connector orientation - normal or flipped
> > =C2=A0 */
> > =C2=A0struct exynos5_usbdrd_phy {
> > @@ -415,6 +416,7 @@ struct exynos5_usbdrd_phy {
> > =C2=A0	u32 extrefclk;
> > =C2=A0	struct regulator_bulk_data *regulators;
> > =C2=A0
> > +	struct typec_switch_dev *sw;
> > =C2=A0	enum typec_orientation orientation;
> > =C2=A0};
> > =C2=A0
> > @@ -1400,6 +1402,60 @@ static int exynos5_usbdrd_phy_clk_handle(struct =
exynos5_usbdrd_phy *phy_drd)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +#if IS_ENABLED(CONFIG_TYPEC)
> > +static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum typec_orientation orient=
ation)
> > +{
> > +	struct exynos5_usbdrd_phy *phy_drd =3D typec_switch_get_drvdata(sw);
> > +
> > +	scoped_guard(mutex, &phy_drd->phy_mutex)
> > +		phy_drd->orientation =3D orientation;
> > +
> > +	return 0;
> > +}
> > +
> > +static void exynos5_usbdrd_orien_switch_unregister(void *data)
> > +{
> > +	struct exynos5_usbdrd_phy *phy_drd =3D data;
> > +
> > +	typec_switch_unregister(phy_drd->sw);
> > +}
> > +
> > +static int exynos5_usbdrd_setup_notifiers(struct exynos5_usbdrd_phy *p=
hy_drd)
> > +{
> > +	int ret;
> > +
> > +	phy_drd->orientation =3D (enum typec_orientation)-1;
>=20
> Should this be TYPEC_ORIENTATION_NONE?

It's -1 so that exynos5_usbdrd_orien_sw_set() (patch 9) can
check against the current value after driver load.

That said, it should probably be moved into patch 9 where it
actually matters, or even be removed altogether, in combination
with that check in exynos5_usbdrd_orien_sw_set() from patch 9.

I had added the check because some (not all) other phy drivers
do that, but looking further at that, I believe it's not
actually necessary, exynos5_usbdrd_orien_sw_set() can execute
unconditionally.

Will remove this and related code in next version.

Cheers,
Andre'


