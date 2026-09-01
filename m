Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225EC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=; b=pLMjcjJ3B2YfLRVKLPVQ65Aan6
	/Rp/vvgt7UbpjR3WXKaS6A22tQb0pGEaejBgvE90h5p9cS/EqkeBmXYncwpLlZMwhw/YSiHe8mQYv
	/rWPUtNyK0AM/c43ivgW3YAEr7hH4W4RmIeuMOCVxeTFP1sGBYKNj8YEz5Uvmk4LvNxpfwwPSO4d4
	CE/V3nQV9XsX7NDIDk5UYiidG56v99pZXhOrD9lFyZRZrzF+mqjYxXzh/pmUDHwEdXc3iz0SF3OR2
	ThIOOhviKGKL0E7FWXeeUA0jIf3GTHd9X90ohhdaG7aRygP4zggYhk4l4caJs0esqIOPQVH2jCwpT
	TifTuAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Klw-0000000BQZf-2ocU;
	Tue, 01 Sep 2026 09:27:16 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Klu-0000000BQYN-1q9d;
	Tue, 01 Sep 2026 09:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788254814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cELpdRA5MqYthZUDYMBNVCiJz6LkZkvB2kG9NiSJa1/+bujCGJWnrClWtlzf2Mx/feTAY4P3q9hmxhAt+4tTjBNFbeIoNk/5Q9DduNlypASdeuYc8986Y54lcjEYhrRuFqRe5djlb8JvKxWRxuCRyRQtc/nuVrAzZKRar6oPe1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788254814; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=; 
	b=nfGhH4fpIuLXqaDlBAf9j92SMOt5yrZTlmhpfg7RxRrdZfJxGR9BA31OfVN6XX5ItynFFjuRBwTgiI4UN0rb7eLW9y/KiH3hcu1snIcx4CYVmTw4hNoClODKpPpFqWsGVZzsC88rNfU/7YFEp1FE3tcR62ve/FbLyqBi01v9rhM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788254814;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=WBNE7bb+LspvvsDuZbtWPwLg8gdow8Zcr50MxcZHNoo=;
	b=bW1ntzi3KdmC1QB0gXmsJjQwoQBvg7S5/aL7aa//AhJQaMGzSz/babx98M37ylhg
	c0IVKi2zGuw7mpm8YJEwrjMb/HyQqoqKTu9QjGHGeCD6V/re0uuvSUIDiLQ4q5jzwau
	Vew7VZKFqnJGt88JVzrCu7U/SHqglQ1xSVNRBlD0=
Received: by mx.zohomail.com with SMTPS id 1788254812080376.5012000638063;
	Tue, 1 Sep 2026 02:26:52 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 37336181B0C; Tue, 01 Sep 2026 11:26:36 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:26:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Message-ID: <apaVTYiKviNsydUG@venus>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
 <apBi5sGBpPfwTW4G@vaman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3dlaegreqn3h62kc"
Content-Disposition: inline
In-Reply-To: <apBi5sGBpPfwTW4G@vaman>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.233.38
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022714_504344_9DC0C77B 
X-CRM114-Status: GOOD (  20.95  )
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


--3dlaegreqn3h62kc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
MIME-Version: 1.0

Hello Vinod,

On Thu, Aug 27, 2026 at 09:46:38PM +0530, Vinod Koul wrote:
> On 13-08-26, 22:52, Sebastian Reichel wrote:
> > Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> > if the configuration changes or cable orientation changes. This is a
> > problem, as the consumer device will run into undefined behavior.
> >=20
> > With the new PHY notifier API introduced in this patch, the consumer
> > driver can hook into reset events coming from a PHY device to handle the
> > PHY going down gracefully.
>=20
> Hmmm how will phy get notified for these events. Typically there is a
> separate hotplug mechanism to take care of cable changes.
>=20
> Looking at implementation of this, It seems to me there is checked on
> power-on, so maybe notifier maynot be right one... ?

With USB-C you have the TCPM (Type-C Port Manager), which will send
notifications when the plug orientation changed or a different mux
configuration is needed (both information are sourced from USB PD).
You can see typec_switch_register() and typec_mux_register()
registering handlers for these events.

Effectively there is:

1. TCPM providing information about the hardware configuration
2. USB controller driver requesting the USB side (software request)
3. DP controller driver requesting the DP side (software request)

These are combined into the desired PHY state.

If the USB controller driver requested the PHY (happens during
normal driver probe of dwc3) and then you plug a device into the
USB-C port, which changes the mux configuration, the PHY needs to
be restarted/reset. Accessing the USB controller while the PHY is
restarted results in an SError. This part of the series will
mitigate the problem.

Greetings,

-- Sebastian

--3dlaegreqn3h62kc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqWmkgACgkQ2O7X88g7
+pq2yw/9FIRH2tguovlpTzibRD3SnDZDhFzWm7UzNHTuOCL8oXbNeEyCytCKUI64
s1YUTzTNFPRNWl1Zg7KPKNa1RPieRjbqRfgeSLm5DscxeNojst6q4pEwZR21LpLn
+esC2NWPx4Sdx8l7+idIZEQTOiRJgvOOrmvaOdWPCj9j+FprkM1l4SkUt9ZKt3Uy
9T0Ud2hZwSD/hsoT9t2DTzINRv/LIPjBCuaNIglzAgRZYlFjIZQYH0n/ag0XAqat
gXNN2GwPTAZBdLn4SUXmrfFOzPedCQeJA35eGg6MCNsfeSJOAL+X2LCWMs6aYsJL
iJPz2eITM/0o8fP8Fo+7b8ELqaEYiEDpbpbgLxtE97dwlHu3T+6j5+u+MfNqX5J/
gQ8OcmjnlLQOejlJyQlS4c4cKboUE7VRCVNJ8J5K6N7OiqiVPMvgb+wRdFEcoara
zllZekiW1kzY9JfYHDTA2n42E7X6uKl0+/VkhD/jnMlqoRXbRUK/GWXyaaOnDruY
Reyi2fv12V94rAQXIL6DqZeHClUpaPBRgplQZarklVpnONpfUAla/UR9Enf7bul0
qJQyJsUys8hjwKQy+VKtqdt+ac9y2/T7MISxuhtpKVkJWh+5IaLaVsveIbdxFjnK
QJ343srZH6CrqqJ3ZznRZUrddocBc8LTEEAQkXOnMDTGdlP2WZI=
=nOU6
-----END PGP SIGNATURE-----

--3dlaegreqn3h62kc--

