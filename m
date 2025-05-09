Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D60C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNm4dzYjL0hNtY0TgZJ2Uq8YBkIqeHB8LTvt0QE8KZw=; b=hVoWtdCn+FEIAUf1/qYskkEk5N
	x0tpCvXnmbE+hShnd+5zZg1aLd6Tkg9q0AtGXSthX57w9ThmEfAqVsC9kDN2z9vO4Co4jV6MDtVSR
	mxsuUJUzQwA7Ot34Ltq0HIXUe+C22EjTwYjaW/r9pZSoSPM3/8DbrSKYWopwEDb/NG+6ZOHVYq7cp
	X/wMmnValtmrTRxbefMQTB4yBqREzo2ta2O1PjFpBRDPTmSJK8tILs/F2sqEOpkVpBz5quasJDAfZ
	FA05jvQPDepath6M8jXaoO20r8JnEGdlTVdsIYwQypIxP6OMq84M9tuh6izoe5FvhuO5bcWEIWWtG
	vQdx8dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIGA-00000002lav-1bjp;
	Fri, 09 May 2025 07:35:06 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDID3-00000002l18-1432
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:31:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad221e3e5a2so45774366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746775911; x=1747380711; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNm4dzYjL0hNtY0TgZJ2Uq8YBkIqeHB8LTvt0QE8KZw=;
        b=3UoiIjdCZ/Siyk5Co+omojDnWFDTdo2tZt9LE62MMrAj2KxI36eVKWTP55l6A6RcNw
         Kc4MEaGyObIOLZmPpY2yO4Mf2nDTDZmVBMmiq1VjcJtwUvzhjRk3w7j8cL9XibmcwfnX
         axMqNvVdz+UVIPomNX0kGi/lfVFnqqg0DhLUwZK55rl3VYnHx6jft461Y84aZf4B7Bno
         avKClZO5QOed1lpnF0RlJkNh3uo3C06M9tDiHaP0ZCeR82H34+9DRvYI5oX30LiJxwx0
         xpBq9c8bp9Ld/0JFqAUNjidANZPBwHkvk+ORdOX8L/41zpsPDzQidCv17sFdg1PoGasD
         eFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746775911; x=1747380711;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNm4dzYjL0hNtY0TgZJ2Uq8YBkIqeHB8LTvt0QE8KZw=;
        b=fmIEZ4IVwhvv4GtwrTnGr5c+dQuOhn3h27Krw0syDWEIl1LAp7ZSMUIUevLlwLHpeD
         q1MJqV36qxPC5O10d8346LXi9sXUrut5CGOCIKFdGZsqmdsU4R7q2JoynPh5JiCbRTOt
         6fo+BCZXJTw+o285fIF2NjnMXke5bfFZThLjIbE30X0y6Qwis+DsA3RVyXMX5/C6IX2G
         JT/wJeaKxmVd6XTgi8hnDFt72KUn+IIkL9FC1M3+5cC1xRMH/wSrzSi9Y6PFTrKXYcxb
         RadhJKRPXhX7JlL3fWl1Fjsc+Z1UE/26UofHF+CKeR7rGaizmUt0vLtzmu9YCZEjPqHq
         ATxA==
X-Gm-Message-State: AOJu0YyDqcF2u4VPVxjPBqX2tKAkZri3yDIAhDxw7zCm3p/cfFBeY95k
	hyZOyYoubVC1LgdxJ1So+qv56q/QSPlUYnqZTMTOiMShqQIyc82zyXdqfeAg/s0=
X-Gm-Gg: ASbGncs09wLPXpWHxODk58Xejh/ISezJjb+/G36wGtqVGJ7ehRHDO1nMd7iKh1h2ZZ9
	mGlOPV5qIArCxDRlZvryz0KE1pRC2d4n0+XCVnyEtIbhR53ScKq9OkwBgdlN1rJe4DN/2tsSJY5
	fLBfN63Nn7b4GhBitLxIt8Z3NesoHsNYgEXMxZovY7saKNDiikDn6B+S0lFUyFjTj13+GcLfuSj
	CecOZUFTWA/AqhbKIyd7sqY4Krpa+SDPNhCJG86AVH6Ae3X2CHkDp+K5GfupITHTI5qDMM3FH+w
	uZqKk+aoOM0GvYK1n9/Q9jZbFvHubadkRDBoVWqGAQwVlg==
X-Google-Smtp-Source: AGHT+IEBRTCI9kTr2GaMmpOwf42xSL7WvOji9iBJAETgoGhwFplwSkmVArxI7pFy/yaqzpELkNP5Hg==
X-Received: by 2002:a17:906:4796:b0:ad1:e672:271f with SMTP id a640c23a62f3a-ad218f4ca71mr253684166b.18.1746775911001;
        Fri, 09 May 2025 00:31:51 -0700 (PDT)
Received: from localhost ([2001:4090:a244:802a:8179:d45a:7862:147])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad219855beasm107999666b.171.2025.05.09.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:31:50 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 09:31:39 +0200
Message-Id: <D9RGDM0LGOTW.2X74PNAIA5N3F@baylibre.com>
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin
 Francis" <sebin.francis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>
X-Mailer: aerc 0.20.1
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com> <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com> <d4f21cdc-bb0c-4c78-aeea-f6e5c75fa5f1@ti.com>
In-Reply-To: <d4f21cdc-bb0c-4c78-aeea-f6e5c75fa5f1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_003153_557468_745AA5C7 
X-CRM114-Status: GOOD (  18.37  )
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

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 7, 2025 at 6:56 PM CEST, Kendall Willis wrote:
> On 4/21/25 03:14, Markus Schneider-Pargmann wrote:
>> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
>> powered during Partial-IO and IO+DDR and are capable of waking up the
>> system in these states. Specify the states in which these units can do a
>> wakeup on this board.
>>=20
>> Note that the UARTs are not capable of wakeup in Partial-IO because of
>> of a UART mux on the board not being powered during Partial-IO.
>>=20
>> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
>> Partial-IO. Add these as wakeup pinctrl entries for both devices.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++=
++++++++
>>   1 file changed, 76 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9=
e17d6d8e33869f92 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -741,3 +741,79 @@ dpi1_out: endpoint {
>>   		};
>>   	};
>>   };
>> +
>> +&mcu_mcan0 {
>> +	pinctrl-names =3D "default", "wakeup";
>> +	pinctrl-0 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_defaul=
t>;
>> +	pinctrl-1 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup=
>;
>> +	wakeup-source =3D <&system_partial_io>,
>> +			<&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +	status =3D "okay";
>> +};
>> +
>> +&mcu_mcan1 {
>> +	pinctrl-names =3D "default", "wakeup";
>> +	pinctrl-0 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_defaul=
t>;
>> +	pinctrl-1 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup=
>;
>> +	wakeup-source =3D <&system_partial_io>,
>> +			<&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +	status =3D "okay";
>> +};
>> +
>> +&mcu_uart0 {
>> +	wakeup-source =3D <&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +};
>> +
>> +&wkup_uart0 {
>> +	wakeup-source =3D <&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>> +};
> Hi Markus,
>
> I noticed wkup_uart0 is already referenced earlier in the dts. Could the=
=20
> wakeup-source property be added into the first reference?
>> +
>> +&mcu_pmx0 {
> Same thing with mcu_pmx0. Is there a reason for separating it from when=
=20
> it was referenced originally?
>> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
>> +		>;
>> +	};
>> +};Additionally, this patch does not apply cleanly to linux-next and nee=
ds=20
> to be fixed and rebased.

Thank you, I will fix your points and rebase once the dt-schema
idle-state-name question is resolved.

Best
Markus

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaB2vXREcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU+IQAP4nYmMI1mFLobgy/oXSnCX2D+tGGACd+6+h
bR5vzYUiagD8CelMTAx7Q4zlt086hjOX+Nk+R4ub5YtvyvU/1iO8rAc=
=Do60
-----END PGP SIGNATURE-----

--06cfbbe9f92dcc8b1f71cc9bc0c83b1518c968538f5e87fe30c24b0e071e--

