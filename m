Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A2CED620
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+31Milj8nYVrvJ8nC3Pg+VcuZ0i1JhaSqz3VlPj1A0=; b=S58rvXNbmBDNZlQeyMJ+oDVFe8
	gWudLYDBVDHs1NkOB3BllCiz67TsVvSUlb+KIwCK81dvQH/cK1wKVV9LTi3T8bJ6W+dmaIGgbGmMf
	ly5/QCiC8pHr5AQXUz3XDYjXiuDN8uCrhGKatonYArRKypJt6hsPMimD23hYPXf1Nt6TjbcrVkSV+
	NYcnj8LgK0tCIUJXk6OdFmwSsK00CJAGOR5+VCUIwVRseGyUYtUyDuqVISGpr1WAO2rifaBIHR3o1
	t2nfgmjboYA/bdkntoYPEodzqVTLyrXtuNf0hzpoqhQZOvnDO70mjl7bKFxxQDgnE0gyJEUbCb2/C
	Idm9ukJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMVE-00000000XzA-0KnH;
	Tue, 18 Nov 2025 14:16:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMVB-00000000XxR-0E13
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:16:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779a637712so21888465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763475371; x=1764080171; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9+31Milj8nYVrvJ8nC3Pg+VcuZ0i1JhaSqz3VlPj1A0=;
        b=ohpGdfAbQ+sVQ7Azo5ydlNFZ9dKxB8lLCHRR3vwak/lyLJkVCSWkC8LKzLmu5MvpIB
         GZrbMf2KyVuz1LfaNGcz9pp+2pkswVq2q2lfbPKvvgseW9KeHz5vNq5G3CWOKbilWJ8V
         GxChCDBwrjT60N+lW7rRT/66tuv/ll/fcys4CXpMBzUPDC0mH+mh5Vn9Yb9zEyJAFw6P
         Zsh8HnY5utdUib2527ZODOzF2G5qvz6HveqKLQNza2rtgr9EGkAkv7givCbGJ49vkMKK
         YplCpPgMdJKoOnMco0XxGGreFKVJebz2HAs5113VzcTmlb6GCbaSmebIWKwpmD4aB3Zk
         DCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475371; x=1764080171;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+31Milj8nYVrvJ8nC3Pg+VcuZ0i1JhaSqz3VlPj1A0=;
        b=N8UWrqz8dLpOFKafj0JvvmTn9lxKsmYPBO00QrVURyk/ekbCX3hxkaq1mbUwPDuly7
         NVg0xB/HgBVEsgXycEc+mKU3UPFmw+alhZSJ6pgL2FZJ9nKn0aba4OXa3sNzwr2Qx/W2
         OhfUhEwHdX8xBtREzpVPUSmMjKsoO7mocP6rhuTm8uaUGSVhNoFPT0sG+iHAhWrZMNpW
         O2ZJNKyLwPIEoMf3q92OjjMO1lkHWtoi0oPgWDFMLGUodteqpRxR9K+3WH9YldkJ2iOV
         yYYkHYf1kLIBsiFB5CsELYn96KQplNLWxopOoNjlVMrvOiXVXQPHmqsP0njQWh9vFW+7
         e2Fw==
X-Gm-Message-State: AOJu0YyoeGVcQODjDfRmDyP0W8S2uqP0T7C6PrdSQVNwyqJnNDn9GlbS
	S6/SUToUbW8M7D3cisVvNAUdiPGyiDJS67U5WHx4ryob5AA8DUo/j+ckQPjZo0yNVH4=
X-Gm-Gg: ASbGnctXopgvm6zqDnJ7HQSXQtMQSlAy2sfKfXf2KG7guAVmUGj+XfOPHct2qA5Nk4E
	5XtuJytxH7pN1hrtnS2z8dDQDMExWRiVKsS8eoyqtXGSj3i7d+YBvN7bor4vcqj8Ksc8bf0YLf0
	GTkWb9bbHiySdMEB3mKwCf298AY693CKTuhZc9TZt+tQeT7nbRCb55p5zXioWMyO7+G2b1vH/Rt
	8LWAp1niilQvQrPjOkmNiiudRjaN59LwZMLWTD14+5kPh49VwFtMajPhJSe0XS3zDFHlNUni6JD
	5eCeAxCdT4pR1Pb+6ilWlAA3bC03o1xiVnCWbMb5W5cnYzFXChJ7O17RTOeO1IDI4Did/FgmBkC
	gqNk4UhIS3v47XGAFQ37wB8LXpB9EQ6ynbyEfhI43oUdwpj3UUjC/OeExwPJCk7Paj80fHbpS2w
	JAHE/2
X-Google-Smtp-Source: AGHT+IGg0i6a2B3te9LDxvEgp3QrhqP/Q1WTFXitfKeGMGPC0YklWmvswc4gwg37W4RFfYtxkzp3bg==
X-Received: by 2002:a05:600c:4753:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4778fe60658mr164479575e9.17.1763475370874;
        Tue, 18 Nov 2025 06:16:10 -0800 (PST)
Received: from localhost ([62.246.248.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6a1sm356351435e9.11.2025.11.18.06.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:16:10 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=aa063a6c377d27e792288f5a4381ff30b0ef12a8fb75f7bd390f2ba44b77;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 15:16:04 +0100
Message-Id: <DEBVUEKJ6R6G.33Y7W087DCFBT@baylibre.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin
 Francis" <sebin.francis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann (TI.com)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com> <20251103-topic-am62-dt-partialio-v6-15-v5-5-b8d9ff5f2742@baylibre.com> <fafe395e-b8d2-4a46-9884-7241b24d3b06@ti.com>
In-Reply-To: <fafe395e-b8d2-4a46-9884-7241b24d3b06@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_061613_120470_4A597A0A 
X-CRM114-Status: GOOD (  19.08  )
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

--aa063a6c377d27e792288f5a4381ff30b0ef12a8fb75f7bd390f2ba44b77
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Tue Nov 11, 2025 at 9:57 PM CET, Kendall Willis wrote:
> On 11/3/25 06:39, Markus Schneider-Pargmann (TI.com) wrote:
>> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
>> powered during Partial-IO and I/O Only + DDR and are capable of waking
>> up the system in these states. Specify the states in which these units
>> can do a wakeup on this board.
>>=20
>> Note that the UARTs are not capable of wakeup in Partial-IO because of
>> of a UART mux on the board not being powered during Partial-IO.
>>=20
>> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
>> Partial-IO. Add these as wakeup pinctrl entries for both devices.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 69 +++++++++++++++++++++++++=
++++++++
>>   1 file changed, 69 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index af591fe6ae4f0a91991d2904a9a61905a0eeb614..b61370db6986308ec97983f7=
96b993a26debcabc 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -233,6 +233,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKU=
P_UART0_RTSn */
>>   &wkup_uart0 {
>>   	pinctrl-names =3D "default";
>>   	pinctrl-0 =3D <&wkup_uart0_pins_default>;
>> +	wakeup-source =3D <&system_io_ddr>,
>> +			<&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>>   	status =3D "reserved";
>>   };
>>  =20
>> @@ -426,6 +430,42 @@ pmic_irq_pins_default: pmic-irq-default-pins {
>>   			AM62AX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (E11) MCU_GPIO0_0 */
>>   		>;
>>   	};
>> +
>> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN=
0_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
>> +		>;
>> +	};
>> +
>> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
>> +		pinctrl-single,pins =3D <
>> +			AM62AX_MCU_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN=
1_RX */
>> +		>;
>> +	};
>>   };
>>  =20
>>   &mcu_gpio0 {
>> @@ -852,4 +892,33 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQ=
S */
>>   	};
>>   };
>>  =20
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
>> +};
>
> Did you mean to set the status =3D "okay" for mcu_mcan0 and mcu_mcan1? Th=
e=20
> nodes would still be disabled without it since in k3-am62a-mcu.dtsi the=
=20
> status is set to "disabled". Same goes for the patch you sent for AM62P.

Thanks for your reviews. Yes, I removed it after I got his feedback from
Vignesh:

  MCU peripherals are under control of MCU R5 which would be running a
  safety application on AM62A class of SoC. So these peripherals should
  not be enabled by default here.

https://lore.kernel.org/lkml/32b13258-19dd-4ba7-a13b-daaf3804a7c8@ti.com/

Best
Markus

--aa063a6c377d27e792288f5a4381ff30b0ef12a8fb75f7bd390f2ba44b77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaRx/pBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPG
NwEA9FjeunL7yBrOX00iogrZ0GZ2oU+OVEh3bv7p4qvQO3gBAIfYc1DnBsioZXJv
MaO1A9L2xjuJbAJEeyn4hbazJtgF
=oSTG
-----END PGP SIGNATURE-----

--aa063a6c377d27e792288f5a4381ff30b0ef12a8fb75f7bd390f2ba44b77--

