Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B272CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPzxhl5A2vCjE+tX3cc2Xu+QNXbQb+GYtT6YGGU4Vz8=; b=K38iDpCdQ04yv0OrGcp+q6ByV4
	Fqbu1Gw2OACY0p1ADf5I6IhEUrcfdSuWff2izRPiozN2tkyadfHYreobMMmt4BlqpdB3SLYsbhFEE
	RV+sV3pORSg9oOQo9fBlEzzL09uMVlfYbzIdqnKyfxVQ6HUj3thWMniAofspy1WaELLQFryjGHTye
	cRm2kEEOMiNhor8YwJxQsI/xMSSc04EYinkR4JSaLlT20WLgAdaehn8eDpzeFBztkX7bhDNJLJyE1
	h6YfIGB8HZVjbL8fLBspheAAjT4wpQJVNovp4lUEw+3xGWPnrzBTEwDbiqyNUQggj5t7httGzX1uD
	bDsmEUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvIc-00000006Gp8-3Dqi;
	Tue, 09 Sep 2025 10:10:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtrP-00000005cRb-0u8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:37:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3d44d734cabso3654872f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757407074; x=1758011874; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FPzxhl5A2vCjE+tX3cc2Xu+QNXbQb+GYtT6YGGU4Vz8=;
        b=m0gYFOoXLJa71OSql0A1PFtFwaSEKsSx6VP/sGLLCb6kQmMu8OC5sqsk8VoiABTLaX
         iFdDHpQdnFbe5/6Rydsu3Fi+iuoVo+vkGB5ktZbB/pofCzvn5NLbRYw8je3B2rY1r17N
         GtEWNMXurJWHmnrk2PeJYfn6MPmww9v2c3GDoYSXzGsySxg3ZwRk11KlrUxecup4xzuh
         a4ktSuXzxraYpbMn5luR3h3DBZrn1utfOa07jRPfJgj1pYoHFXIdBhOl55OHFOSr7fOf
         Gg0TnOu4JAoStpEBxHhqkQFFQ/IbDBqYp6F0NwXgClsEetdCToRQSgYQget0LO8pypGd
         P98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407074; x=1758011874;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPzxhl5A2vCjE+tX3cc2Xu+QNXbQb+GYtT6YGGU4Vz8=;
        b=kVsCuLwJn5ew78dPNRUZS08pjuwlzJA1bKZfmkz7XdTLTtaVsFSHxohAUP1R32IgDN
         b7ApUkeL0IYMZJN7z4uv9t5u7w/FANUCk6EMsH0zNxG9FUU68deBKXKMiIR1r3RF0PdG
         /vp5CUuurBmXdwphHfyaxfFnldder41QCuc/9Gk6VtBQmQQZwS1XJk9k22Ja3AnS94Kz
         i7LYXV9kHloFvnY8GK8ifk6s/uVIwv1ar4HuIKB1p6FeHhn2KUzzmLNBI93duzoHFJOg
         UsJ/tX1SMN6Fkj/2gh+UtsNLPA0FY+kl/zdy52MS3t2pnk3KPjxFqqG1KT3povwpOxxf
         hh1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM6XnOKxlyBoOaxJYbCGl1xwSotP9wIF1V0I3+NyHQBWFPqwpxCVVLcauWkHjeZ8SeD2R7SM3ehVsooDIji7i5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7vihvJFwxUka/Zve+J2AGfqHrCooIzc0zWkgs4E3xGAol2NLL
	HpBd/8Z19DU5J8AKUyS0Qga0WFem1ySed6Mps8xlS7Io+jjvPsxHBz+UYMCDJjO80pQ=
X-Gm-Gg: ASbGncv3/QZo8StKGFvKlsL+VllXrfwkjmwq6YGedJS1FGnvQJT5fi1hA4/MW0BgnQN
	b/SCJumOLJIbOLqcsmPLmA/nTntl158MEmPAnKHA/ThAF4hPyJx20zSlIYkmsk3rQpctD2z4YIx
	7mGl6nUOPtmonA14fJ5VDlcuZHeVSCHO9W34uSR+O9GWB6a3u6GtO4e55U2nNzYksARgeXzeZ0V
	LrBfFdu7kuCkhx5rccdRPSdtDZAPE0hvfPCJVYGSbrG9N2RFJC2z8n1dNBi8Jywwz+0nj4NNcEF
	hxEf6Ct0lreu0XAlk/NdZK92cW/KtgQmm/PH7RhX3YKEPGmtNXoNvBsYtOHIKb2iGU7vhGE6MXd
	Kdy5kNS44r9NcDeu1XXiHrBNfNg==
X-Google-Smtp-Source: AGHT+IGFY+CbQVY2RNO5FrloUQSNGkLpTLZZd3Iw5vqTDy31kdS591iFBn0tWIOYy70yOYW8CLpAlg==
X-Received: by 2002:a05:6000:2385:b0:3ca:a70d:5710 with SMTP id ffacd0b85a97d-3e64bedfe82mr7375351f8f.41.1757407073557;
        Tue, 09 Sep 2025 01:37:53 -0700 (PDT)
Received: from localhost ([195.52.61.108])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7521ca1c1sm1728849f8f.24.2025.09.09.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:37:52 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4856b23f253d4ec58fd417d6be2d91cf025155c02cab64c8d8f827067e17;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 09 Sep 2025 10:37:47 +0200
Message-Id: <DCO4T9E3SGQ5.1J2ARMXFB9ONJ@baylibre.com>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Enable Main
 UART wakeup
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Kendall Willis"
 <k-willis@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Cc: <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
 <khilman@baylibre.com>, <a-kaur@ti.com>
X-Mailer: aerc 0.20.1
References: <20250904212827.3730314-1-k-willis@ti.com>
 <20250904212827.3730314-2-k-willis@ti.com>
 <DCO4RGJBMTRM.1XNHG5EHBPS24@baylibre.com>
In-Reply-To: <DCO4RGJBMTRM.1XNHG5EHBPS24@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_013755_283370_2D155B43 
X-CRM114-Status: GOOD (  18.92  )
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

--4856b23f253d4ec58fd417d6be2d91cf025155c02cab64c8d8f827067e17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 9, 2025 at 10:35 AM CEST, Markus Schneider-Pargmann wrote:
> On Thu Sep 4, 2025 at 11:28 PM CEST, Kendall Willis wrote:
>> The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
>> is enabled. Add the necessary pins needed to wakeup the system. Add the
>> system idle states that the Main UART can wakeup the system from.
>>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 24 +++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64=
/boot/dts/ti/k3-am62x-sk-common.dtsi
>> index 13e1d36123d51..72801cf890d20 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> @@ -163,14 +163,26 @@ &phy_gmii_sel {
>> =20
>>  &main_pmx0 {
>>  	/* First pad number is ALW package and second is AMC package */
>> -	main_uart0_pins_default: main-uart0-default-pins {
>> +	main_uart0_tx_pins_default: main-uart0-tx-default-pins {
>>  		bootph-all;
>>  		pinctrl-single,pins =3D <
>> -			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
>>  			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
>>  		>;
>>  	};
>> =20
>> +	main_uart0_rx_pins_default: main-uart0-rx-default-pins {
>> +		bootph-all;
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
>> +		>;
>> +	};
>> +
>> +	main_uart0_rx_pins_wakeup: main-uart0-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62X_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (D14/A13) UART0_RX=
D */
>> +		>;
>> +	};
>> +
>>  	main_uart1_pins_default: main-uart1-default-pins {
>>  		bootph-pre-ram;
>>  		pinctrl-single,pins =3D <
>> @@ -342,8 +354,12 @@ &wkup_uart0 {
>>  &main_uart0 {
>>  	bootph-all;
>>  	status =3D "okay";
>> -	pinctrl-names =3D "default";
>> -	pinctrl-0 =3D <&main_uart0_pins_default>;
>> +	pinctrl-names =3D "default", "wakeup";
>
> I think you may need to add this to the DT binding of the uart device
> as well.

Nevermind, I just saw your other series, can you please mention the
other series as a dependency in the cover letter?

>
> Best
> Markus
>
>> +	pinctrl-0 =3D <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_defa=
ult>;
>> +	pinctrl-1 =3D <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_wake=
up>;
>> +	wakeup-source =3D <&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>>  };
>> =20
>>  &main_uart1 {


--4856b23f253d4ec58fd417d6be2d91cf025155c02cab64c8d8f827067e17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaL/nWxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMC
ggD+KJ4+mIFOxqZ/OOfUILmagchKuJNiUOwdInV0goSql4sBAJYAIM5L0vr0Eqqo
w1Qatmm1+IfunotaRO+Sd8q8eUUB
=1rxv
-----END PGP SIGNATURE-----

--4856b23f253d4ec58fd417d6be2d91cf025155c02cab64c8d8f827067e17--

