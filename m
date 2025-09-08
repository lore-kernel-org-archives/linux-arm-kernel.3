Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA58CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUvupcsRCkQfs+P8J05KpMp2C799/IJHD4VTsiVCzQU=; b=emaeFCNQeimKCfm8LDRc0kJXGr
	OTAui8SoN8b+UHAGfSzld/Zzi2YPcupbUrZKpi7hcoQAXepDv3KJvssqWuD/vVTEug2s0euaaBq8u
	Wg9UuLNUrx6ZNKYD59J0jcxJUQkPE2/NdLHspNVvpPvyKz4yijCDIQ7Yi4PTeB7ITi7XKpll+lRG/
	MIybS8QIzWPIWCdy7HUOXmsB+squqCioL9ZyhyR654YQ/5SAFJavVPny5ETWpTI9ySPW14jZxoasg
	fhBsj+u/RLb3Y4matw3tGGILxIO/XM4231IynhiAsiW7CAiagIX4sd7bsnGn2A/pGq7b1mOw2IMZt
	tJYPT08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDL-00000004rLN-1Vaf;
	Tue, 09 Sep 2025 06:52:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvko1-00000002q70-426h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 22:57:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3e751508f21so87580f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757372268; x=1757977068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUvupcsRCkQfs+P8J05KpMp2C799/IJHD4VTsiVCzQU=;
        b=kp4LFWVa7ptR3rr89ILTuMcBbu7zjbklPktWfYaolwQ/tJukQFLD8ylj0ErzYvNonm
         TqbqKv0sn2s8hDYdnIXomuOlrWGvxIeJ24iKOBw3cHo6gh6M1sUve8OEkteFKQRJC/GP
         tDWpimJ0WJVRmwtc1znZN5qzOMp5dzV+gssneY5yv5nXBTdl6LT/2cxMGx8w+MQR0s0H
         YJGHztpgHY4HDXK61jHA5ezSCpcl5l3ry4OlMDllaeCwEfvhbSzW/gnmjxDfCkq4Nkdh
         SsmwVUQLWMNIVg1lHzRLnvfW6y2JDEzG4+QyZoxr6FmWnQCzAwxiJ0btinG0YF2bpskB
         bmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757372268; x=1757977068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUvupcsRCkQfs+P8J05KpMp2C799/IJHD4VTsiVCzQU=;
        b=cHxwM8l2ttv90iYgH8yQ1mtR3Hwc6qkRoErTKzEjcDUXeKAkmQWlcA52+dZ0cG8K4A
         fgzOdMGmQhC+DiMUT1sUxaYbdJ/I2xUfIQXjr7lqOqiWtdMVoKxWXSSHilocOBLjulhW
         WWvXolup0L9z2cKoZZfIlSCZP97Q6KTFo51q2qNMarEC4miwp9Fu9ePmgFBEmsFSjg2g
         +xmFKs3l3i/AQkIxqXAR67ic/GouVF5ey4v+U+KOI5KDFfPBClVY1AGznTwQ3/h3x2D1
         rQqaYZFAvFvzwv3GLCG94d942JADiDouvSgeCYr/G0WDQh+yUKFe9B1aQxT1ZEIc6phU
         nbdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+zWUWdeZTGkbAb3aQ19lqLGUsbsCBc80VvYhbNAQnv0RGy26RvtjI59glUb0WFSh7xkwSbYpgB60cNsXLhujO@lists.infradead.org
X-Gm-Message-State: AOJu0YwW5OnNfXqQmKVfS4ae5440PNpzzHFjbzpEWtfJ8cIKY4teiHrS
	aAO5iKCXRpzshtd22oTeOtn8qcx+Auj/VnyIhZlqj3tiyRePvCmbOIhi
X-Gm-Gg: ASbGnctjv5e3wjSlMaOUZR9f1WpYiRxAphg4rH2C7dmiQzkxtwAPOrfbvFnNd56BWAA
	UTpEXDc2YMFiJyx12O3AEhRBpCsUKd4jcLDXtyB7GQ7CSBg45wai/RQmd22vphxTxXEHNGbZj3y
	uYQRQu9HBXeDb/5QHuhJcLR/7yjAb6lHBavLHsJUii2jPO/RLFDI/QC33orwJ4J4kOQf2M0ApTV
	lTj8iZjTv+C9P8Se+y+jntARGBiaXZY2iskHH9esVFxFe4l9GD9FSVqPxDgoJBQsP/SLpDEUCJk
	egpIsl9v2fO9KEqSTInWqFLLFtQipwjBulY8Rn3zSF8xq4KIBlZv9j5x2+bvm5QC5XZXuhLqfwn
	KYySB3UK0GPlpjyqUsvdhggRAWAR+MiW3SJXSzzuXRa8BeG17ymuner9z6toKU8cTPKbndO18tj
	VQtnbENY+x
X-Google-Smtp-Source: AGHT+IHNyN6qy4Z/EdCypF+HkDEY2JT93OD46/zVWVzUsfkBn/dv6BYtFe56OQfZXkQXUnUBziSXtw==
X-Received: by 2002:a05:6000:2f87:b0:3d9:2fa8:1009 with SMTP id ffacd0b85a97d-3e64c3acf34mr7435111f8f.45.1757372268165;
        Mon, 08 Sep 2025 15:57:48 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca2aesm56321f8f.26.2025.09.08.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 15:57:47 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Tue, 09 Sep 2025 00:57:46 +0200
Message-ID: <12736197.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <5617fd78-32aa-44f4-9f9c-16349b3f8450@wp.pl>
References: <20250818163520.1004528-1-olek2@wp.pl> <2012341.PYKUYFuaPT@jernej-laptop>
 <5617fd78-32aa-44f4-9f9c-16349b3f8450@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_155750_009818_32EE3306 
X-CRM114-Status: GOOD (  22.88  )
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

Dne torek, 9. september 2025 ob 00:11:46 Srednjeevropski poletni =C4=8Das j=
e Aleksander Jan Bajkowski napisal(a):
> Hi Jernej,
>=20
> On 9/8/25 16:45, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 18. avgust 2025 ob 18:35:13 Srednjeevropski poletni =C4=
=8Das je Aleksander Jan Bajkowski napisal(a):
> >> This patch adds support for Ethernet LEDs.
> > How did you tested this? According to linux-sunxi wiki, this board has
> > RTL8211E, while LED control is supported only with RTL8211F driver.
>=20
>=20
> For testing, I used OpenWRT snapshot with kernel 6.12. OpenWRT backported
> patches from kernel 6.16 that add LED control support. Realtek RTL8211E
> supports LED control since commit:
> 708686132ba02659267c0cebcc414348ece389a5 ("net: phy: realtek: Add=20
> support for PHY LEDs on RTL8211E")

Ah, I haven't checked the latest code. Alright.

>=20
> >
> >> Signed-off-by: Aleksander Jan Bajkowski<olek2@wp.pl>
> >> ---
> >>   .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20 +++++++++++++++++=
++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts =
b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> index 0f29da7d51e6..7688f565ec9b 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> >> @@ -7,6 +7,7 @@
> >>  =20
> >>   #include <dt-bindings/gpio/gpio.h>
> >>   #include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/leds/common.h>
> >>   #include <dt-bindings/pinctrl/sun4i-a10.h>
> >>  =20
> >>   / {
> >> @@ -132,6 +133,25 @@ &external_mdio {
> >>   	ext_rgmii_phy: ethernet-phy@1 {
> >>   		compatible =3D "ethernet-phy-ieee802.3-c22";
> >>   		reg =3D <1>;
> >> +
> >> +		leds {
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >> +
> >> +			led@0 {
> >> +				reg =3D <0>;
> >> +				color =3D <LED_COLOR_ID_GREEN>;
> >> +				function =3D LED_FUNCTION_LAN;
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> >> +
> >> +			led@1 {
> >> +				reg =3D <1>;
> >> +				color =3D <LED_COLOR_ID_AMBER>;
> >> +				function =3D LED_FUNCTION_LAN;
> >> +				linux,default-trigger =3D "netdev";
> >> +			};
> > Schematic says LED0 is "Yellow" or Amber in this DT. So LED1 should be =
green.
> >
> > Also, I'm not sure if trigger really needs to be added, since PHY netwo=
rk
> > will set it as such.
>=20
> I think there is a mistake in the schematic. Setting the trigger on LED0
> illuminates the green LED. My tests found that the netdev trigger isn't
> set by default.

Ok.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



