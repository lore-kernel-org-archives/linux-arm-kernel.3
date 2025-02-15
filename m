Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA58C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bmNv65WfRWb5QFz5Qsh8fW49RgHC55otbly3llCagw=; b=gPgjhIsHfkiiWvPxM9OCEIQmXa
	Vv1I12mrEjDKMXdiFQLSEI3hHH7wL27DG2qbtrSmTZRlizSYIoRzE9ZQvLuab2633SGo4WposfPTS
	i8o2i4xIQ1LjeBXDU3vxaKp6y/4jPbvO3zUUr3JXiNC73teszCdpR9sJBUZMWmuu6LKat9M7c9G+l
	uDAZ4jkdSB1z6wHOldJKm0K3RpYBujUlwTa4K+2+PlphuPex38tJF2zQnVHQ2N+doX6Qy515qV66T
	bhMpAC9fp2waVdR9z3AXsNKeH7hszivazlraSxhrH2/85Qz3Rj25UtmkK446c5jxP11X6j/wA/PMT
	FlBspNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKlI-00000000Ni9-0VnG;
	Sat, 15 Feb 2025 16:11:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjKjp-00000000NZr-3CrK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 16:09:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4395b367329so18951155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 08:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739635791; x=1740240591; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6bmNv65WfRWb5QFz5Qsh8fW49RgHC55otbly3llCagw=;
        b=Daiye5TZyhvT6uTO+RlYlk205zH2gJ4LAh7V8adSjKgb85AI7AqRL76FmaJ1KHukYX
         unX8Tm7Femh5KZHfCyp5NCNOSttnfn8A6XcFshiVx7qC/95T5yXi0l0lI8iUWGLwFbWX
         q0UVclmiGIRexnUNqmlvtFzrL3xDro/sb9YB13Rt3ey1Jt/Wpf/jbUlhPe8HTxIHnH2r
         CDvRIC1LZmH7B/VL89OtMqHwVFfktarofYvenb0pZbCoSITuuLjX8WoiPRx/UNCiIf2U
         Ssh9XJ6pE+J0ZIuQkdrlsPKVNFSb8MhCTnjquL17LotfGP1NXo/FcvDHpET2ogyWwUJJ
         TWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739635791; x=1740240591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bmNv65WfRWb5QFz5Qsh8fW49RgHC55otbly3llCagw=;
        b=f2oWXQ0r/iBJcB3vu7jF9nr89tFxW7I3kthg1mi62GqxJf120B8y7nTWnNLyawRS52
         7XbCKDYvJTLlYfvhvN/VuO3set5pzw1FVNh6F6PRBWKQ4gqX8kZVEt8YdCfid2Ar0yXS
         Ic9yfhmTrlzCfWxyT4HbT3ZfDLySUS4OKv+ExjiN9XYFmmgoMQNid4rylBkFuwCFWgrK
         wmKUqKvsB211Dh7vLswTp5sTqnPfjQ86F6fds6oOXgTFxL932DbWHSrM96rc8ddeLR9a
         oHbS5JXiLeSP83bKFu72iMFJokFzYIDvbuvqeJpN/BzghdkT1EXDZnzvKUWsxizhfQDR
         C/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXMNq3BFMZLNzuu0dp1SEo75H7MfVoRgURC3haeKk5DaImzY1flYIGQMtX7BQtNp/3FKl8Ts7QNWSkTpbpx3JER@lists.infradead.org
X-Gm-Message-State: AOJu0YwLjXdbTIGdmQc+jk6VGueG/wlt89ppVnRkmgd2/S/Jwp6iYE/1
	czHnMoO3NE8UseCrWPOy0/5unXXo4N/7SRgKGVNoD4XyAWMxc9mOERBGriMOt94=
X-Gm-Gg: ASbGncuwytHKi+ZSPqeBo1pJ9zSBYsH7r3X3v9YyBAEqZNdd0ClpZ6Z0Z0R8WTaq/eE
	OLcLXpKQVSDDzch0np5ysya34uRdsEtdgErMNbhFiDrAgqbKJc30AnNpYPNJL8yoqAQKioypwzE
	envDeW64+JF7n7ZfL2JuablLmx2mhrPWqEI0mXyzbM3DCkDpkJBirXHT02Q19uovAMtd2sjfs+R
	YPllQnoOASUy7G9kWKPIbgiV7jruejzyYZx4Ucoke/nDaX8QMDcB/Yjzom+Uou0w47CIncGXblR
	JNfLgsPXVFoyy3+HPFw=
X-Google-Smtp-Source: AGHT+IFtTB7CGPjbTTAj53WRDs4x+r/fRGZXIjaCmxUn1B9Qy804cPMYsoMFiSnj7hJuF9dY96O+yA==
X-Received: by 2002:a5d:6d8d:0:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38f3406ca2emr3643311f8f.37.1739635791490;
        Sat, 15 Feb 2025 08:09:51 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06c95bsm103459305e9.17.2025.02.15.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 08:09:50 -0800 (PST)
Message-ID: <8e06da42c86b29dcb645d1bceaedae879e6aeca0.camel@linaro.org>
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Sat, 15 Feb 2025 16:09:48 +0000
In-Reply-To: <7c0dcf24-187c-4dc8-aa4a-4a8f814775b2@kernel.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
	 <CGME20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3@eucas1p1.samsung.com>
	 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
	 <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
	 <7c0dcf24-187c-4dc8-aa4a-4a8f814775b2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_080953_821765_0103943F 
X-CRM114-Status: GOOD (  33.80  )
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

Hi Krzysztof,

On Sat, 2025-02-15 at 11:07 +0100, Krzysztof Kozlowski wrote:
> On 14/02/2025 20:30, Marek Szyprowski wrote:
> > On 06.12.2024 17:31, Andr=C3=A9 Draszik wrote:
> > > gs101's SS phy needs to be configured differently based on the
> > > connector orientation, as the SS link can only be established if the
> > > mux is configured correctly.
> > >=20
> > > The code to handle programming of the mux is in place already, this c=
ommit
> > > now adds the missing pieces to subscribe to the Type-C orientation
> > > switch event.
> > >=20
> > > Note that for this all to work we rely on the USB controller
> > > re-initialising us. It should invoke our .exit() upon cable unplug, a=
nd
> > > during cable plug we'll receive the orientation event after which we
> > > expect our .init() to be called.
> > >=20
> > > Above reinitialisation happens if the DWC3 controller can enter runti=
me
> > > suspend automatically. For the DWC3 driver, this is an opt-in:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 echo auto > /sys/devices/.../11110000.usb/po=
wer/control
> > > Once done, things work as long as the UDC is not bound as otherwise i=
t
> > > stays busy because it doesn't cancel / stop outstanding TRBs. For now
> > > we have to manually unbind the UDC in that case:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "" > sys/kernel/config/usb_gadget=
/.../UDC
> > >=20
> > > Note that if the orientation-switch property is missing from the DT,
> > > the code will behave as before this commit (meaning for gs101 it will
> > > work in SS mode in one orientation only). Other platforms are not
> > > affected either way.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > >=20
> > > ---
> > > v3:
> > > * drop init to -1 of phy_drd->orientation (Vinod)
> > > * avoid #ifdef and switch to normal conditional IS_ENABLED() for
> > > =C2=A0=C2=A0 CONFIG_TYPEC
> > >=20
> > > v2:
> > > * move #include typec_mux.h from parent patch into this one (Peter)
> > > ---
> > > =C2=A0 drivers/phy/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > =C2=A0 drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++=
++++++++++++++++
> > > =C2=A0 2 files changed, 57 insertions(+)
> > >=20
> > > diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfi=
g
> > > index f10afa3d7ff5..fc7bd1088576 100644
> > > --- a/drivers/phy/samsung/Kconfig
> > > +++ b/drivers/phy/samsung/Kconfig
> > > @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
> > > =C2=A0=C2=A0	tristate "Exynos5 SoC series USB DRD PHY driver"
> > > =C2=A0=C2=A0	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
> > > =C2=A0=C2=A0	depends on HAS_IOMEM
> > > +	depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
>=20
> BTW, this syntax never made any sense - it did not work. The optional
> dependency is expressed as:
> 	depends on TYPEC || !TYPEC

The depends is required to get it to link. PHY_EXYNOS5_USBDRD
defaults to Y, while TYPEC defaults to M in the arm64 defconfig.
Using this expression, PHY_EXYNOS5_USBDRD changes to M.

Otherwise it won't link.


> but what it epxressed is that it is possible to build it without typec
> only for compile test, which is odd if this was meant to be optional.
> And further code:
> 	if (!IS_ENABLED(CONFIG_TYPEC))
>=20
> clearly suggests this should be optional.

Yes, it's meant to be optional.

Cheers,
Andre'


