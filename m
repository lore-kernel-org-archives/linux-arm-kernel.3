Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3303CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Q6p/KiNHqv49UA1SnTb+Yaprb1pd/5n2oQ6uG61w0=; b=kIYw2KeBkOs8qdaW7X55VIZesq
	IybFxLdt+uT/pR24wlKJtx5lc+rqUgATaX8qJtDAj8YokwDU6CU7ecNuT1DCTxMsZUkOoVyAuaUF6
	LujxjETUcow1YI2TbiKwhaXVdB343aY2e/rn+l0hCuUV9W9ZbB6nBek6TBPTltTX+OJ83SwL+S4/e
	351PBnMGsz2kDHh4oUOG6b5TfYcdk64SueS1dqMUAMFc6plL8eqz/e8xo15IUGsW67749F+JXxziG
	GqIN95RRzTPlfEd7vh+aj5ZevXuK7SJAjq6V1ui4+22IWec202b59BeA3vP6PCESSJJAZ8JSBOAY5
	fyF71yLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Lv5-0000000G5yc-1lvs;
	Wed, 24 Sep 2025 09:36:15 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Lv1-0000000G5tl-1rNu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:36:14 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b04ba58a84fso1114358666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758706569; x=1759311369; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5Q6p/KiNHqv49UA1SnTb+Yaprb1pd/5n2oQ6uG61w0=;
        b=ZWzqTSeiLLf2/cQG7ooSKx97rKn0LO820S1zmuUevO3tr2+7sv8ENCp0FizYjLIsRm
         xgH7cwVjWKk1YY2wtqwFGa+YBcGPHhpljG2QwCC6r+HDbcfiGBcbwKgTwwsKBnxpIWV6
         09KMCOX4/l62+nPYxmRZRGGLdTA1BLItYJhwRmc+ODk95MpiQGr4Ifnt/4xx7Tny7Tmd
         uo6yrk3DwgRasenrNn2jpDfHcDllleeRrKZSE03Lol0R1BeUge7CO/PYmqHqlkgMw6QY
         6Z1uORLdIY9WYCm2DDHKylAjd9pUL5PBMi6XBqtjUUcOCrtkmQreAwFvSrzhGSrUuMsj
         DVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758706569; x=1759311369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5Q6p/KiNHqv49UA1SnTb+Yaprb1pd/5n2oQ6uG61w0=;
        b=aAlGtl15YMjSTfavfk+dBZbg510UMFqd03gGkRyGE6rSgTDsC5H+hFQ+wwnyQ4v/zg
         6GRmqZZvQBa3mkWhkkG3+HgA0qStgbNc4Uo+Fr2ftEHzbwh019QgUIuqXWInNe+0Kfko
         +4aIUthFc6H8Vlj2W2TtXZwmhDkdr6S0SI0UDZ7sOvvt6advWwvxqLQQ5JYv9pqKmVys
         B/KlCnTe1mXn/JXDbca2I9qbq9PmEsRjlFYQdAaCk5a3yQ9ea1fDenV4cwBwTLeq06ws
         Ba+Wc7H/WrE1RMog3skzMEVC9O3hSodj5wcuwC9u+c4++WSrVXafdnl4N3yAIptf0ZnD
         7xrg==
X-Forwarded-Encrypted: i=1; AJvYcCVrBj5uVUqvJ80JHinZWqIPRf01d5/XN+mumDqr8rEHvPVrGqyT6M5P+9T76G+6iZjXeQbXks57ytqMCe6h0+VZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5LRPyMp+62/bifu9cEdIpGZhRAKkHh9sjiTrI37pQbi7hEBK
	Bs6LqH/Ar1Yn7pdeIAZ6sjm4VdpbIo6B2wdVhJ43hwfCPQH/RuXmJPWxjvAjZjQA3JQ=
X-Gm-Gg: ASbGncvgjPHhRoqS1IHRA9b1oR8o/l60w3n9J5f3L9F9LsP6HmWUZhYpT8/a2pdNmSo
	eamjsJ2QgKo0OP166ZDkuI+gn7OuSF12TiUruo2BX+bF5cIK5hiaF1ZtbuMQQeQ/o3JqGm6IYyt
	rbe6J+5aXocdCNm9Q80TbcSVeVfPNGPY5t6Pkg+OpJOwzGXfTHur1W1u1C+d6bEeH3hdWHgC3Na
	rcI67++RjVnay+U425J2f2tJeviJ2Gcyx6oSaM9fQQ7jsTqPIPg39wfgMW9vUOCOsusWkSYKgRl
	Y7SnjAHMnOEqQCfcaJBlqhy5NtwX6ua9HaC4wvY3AfyWPj+5NgUhYvdFD3TQy6qBUkkh08tfJ9N
	xaX60jtLoRzyyHis=
X-Google-Smtp-Source: AGHT+IFrVuMeV3DxBIcNMAPLjIp8Ym4ceTLMZRcoC30nbyeaEZUcstVPsEO8E6Kunah/gyUeusxbdw==
X-Received: by 2002:a17:907:94d1:b0:b0f:29f3:94f7 with SMTP id a640c23a62f3a-b3020c37aaemr508846066b.0.1758706569095;
        Wed, 24 Sep 2025 02:36:09 -0700 (PDT)
Received: from localhost ([195.52.61.108])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62fa5f14e64sm12481067a12.25.2025.09.24.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:36:08 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f7cc4d2a582e78fc50c0277a2c40522eee0e153b07f7e60887709f76b82e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 24 Sep 2025 11:36:00 +0200
Message-Id: <DD0XG03P3KDH.5763ZFCO92H0@baylibre.com>
Cc: "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vishal
 Mahaveer" <vishalm@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Dhruva
 Gole" <d-gole@ti.com>, "Sebin Francis" <sebin.francis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com> <20250812-topic-am62-dt-partialio-v6-15-v2-7-25352364a0ac@baylibre.com> <20250923182450.5rqwz2pkn2gjt2vh@uda0506412>
In-Reply-To: <20250923182450.5rqwz2pkn2gjt2vh@uda0506412>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_023611_749960_E0FA85ED 
X-CRM114-Status: GOOD (  16.68  )
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

--f7cc4d2a582e78fc50c0277a2c40522eee0e153b07f7e60887709f76b82e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Tue Sep 23, 2025 at 8:24 PM CEST, Kendall Willis wrote:
> On 11:15-20250812, Markus Schneider-Pargmann wrote:
>> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
>> powered during Partial-IO and IO+DDR and are capable of waking up the
>> system in these states. Specify the states in which these units can do a
>> wakeup on this board.
>>=20
>
> nit: s/"IO+DD"/"I/O Only + DDR"
>
>> Note that the UARTs are not capable of wakeup in Partial-IO because of
>> of a UART mux on the board not being powered during Partial-IO.
>>=20
>> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
>> Partial-IO. Add these as wakeup pinctrl entries for both devices.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>=20
>> - Merge devicetree nodes in k3-am62p5-sk.dts
>> ---
>>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 71 ++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 71 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62p5-sk.dts
>> index 899da7896563b43021de14eda1b0058a5c6d36da..a2dffb5e243f543c90081eea=
cdc0758b38bd0eb9 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -762,12 +762,52 @@ AM62PX_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (D7) WKU=
P_UART0_TXD */
>>  		>;
>>  		bootph-all;
>>  	};
>> +
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
>>  };
>>=20
>
> AM62PX_MCU_IOPAD should be used for consistency.

Thanks for your reviews, everything fixed for the next version.

Best
Markus

--f7cc4d2a582e78fc50c0277a2c40522eee0e153b07f7e60887709f76b82e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaNO7gBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMl
JgEA/mISSoRZhk6VfAJFaK9lIaKSXc+xnPgUPVfC4DEzh/UBANaYGyPZmqpr68a/
lc3eBY0abnF1USiw+jz0CqS7BpgA
=evl8
-----END PGP SIGNATURE-----

--f7cc4d2a582e78fc50c0277a2c40522eee0e153b07f7e60887709f76b82e--

