Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C21ACCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZujy5RyZQPpS/B7fMM89Md6mmAqnnHN2hXMNBPPI4A=; b=Uyk66Epe0QRi7CXsc4+aopYkV9
	KgrMiu1tk5uI0r74ytZXRUfOLWOcBGqLQw0CoHTkheimphklwqMbJg4yBfNmNKw1qI+7BylnraHR3
	iLpJtaj22Ko32zAiggJ2yzGuJlB65vlqivSotGiF5MAWtWdaaQTdiUa7ceRTJ5a8C89XsmNfyhtdn
	TDmSNy/iQXauf7C15FnMhJKNm0y439gt89hPGCmgju5cQt25LIZsFsc6yw39gj8m2CZmNUieHLkqE
	kl44MVZo+WIKYPHNGRKpA306at0Q1gbFU70UBpRM9H/tRa869QIQ5LajJLacI2RiauirlOtP9BvhH
	JesYHbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrFU-00000009XwF-0NOG;
	Mon, 03 Nov 2025 09:53:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrFR-00000009XuU-1OWM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:53:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so3715292a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762163591; x=1762768391; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HZujy5RyZQPpS/B7fMM89Md6mmAqnnHN2hXMNBPPI4A=;
        b=SoRZ86raojk/1ekHerwRGY7UtXRIrUWblnTBBUsSQmzHLbd/cSKipQudECdX/ZCyNX
         ei//PoIlk+i0ej1z5vAkKMoziZYLwfKSHq1TpjPa4Eu6N7zKs7Fus9Q9MA1HbxtKanG8
         l8apg7yj8l1qoaX21XjryxOT/jm9CHJJwyMJFDTFojMA44mMQ4rg6y7Logy6bu1xSPEK
         HbstfanWF8Hjd/7sALYoRlowinWHO+ZrmUGHoSSoUGg2dl87r4WhTsSjitLBmapzkr0F
         S04vxYzbOFTXW57kpOI838BtGRA9unkVswdEekOfnLS5k8P0PtBkWhNXiotOC4VuGPih
         DlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163591; x=1762768391;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZujy5RyZQPpS/B7fMM89Md6mmAqnnHN2hXMNBPPI4A=;
        b=wQ15CUDVXY7+3pcJLR7vSw87Gu4D0lkUw3iOpEQanBACbFRgSJceVTEK4OajoKRDmY
         0ClmuryuBu7VaCTaepElgmgsGbFPKzKPEzYosKjSpCBVoZnCt7Z3146FKy5XlpAs3Ej1
         BKPLRQG29Ulj/G2Z7OQFqWLgRFuZUOTZwspbN2bcQhBVP43HKOjS8tZFAXbc1svbpQIk
         BvBmvi63Cb2Ias2tFu6eN+Y/CG9mjdQ7qyI6QvXz1J+fCI7wfBpgpbTQsf8nz1B8T7qo
         LqJtA9oIJfKo3kdJDry2gypN0e3e9GZ0pkBb5DL52K7oHXnX/A40x97y3SKqgAxAMJYM
         j1rw==
X-Gm-Message-State: AOJu0YznwVeqNBe8osulMVKlnWpH3/HWQFVxUxnkMTtX4OJPLWNktw6C
	hAMZuqpwOQMDMnBmIE0ZNsLfO3rd9lebs10O0H5QEd9omnP4GKjo1qh+T+WaueJqfBA=
X-Gm-Gg: ASbGncsynF0A8KOcrs93SY2+fPGZ2ldVsh1nECrhCmzG8XPpA1tNdeX1/d57bY0Tjvy
	xu8SLIMBTLMh2eCR62W6q1+Kg2D+8UEjYBT8k6/t+PWRMqoB8pIErp45pc9MubYb7anFH/3IkAc
	82Xh1NAezP45MOl7KD90ZV3KolzgFrCh+iY/r9nbPdSpsnPv9FobwP6GNF0cWyH9/D5wdZ7J9iz
	4W7xafn0uZYL34AuLZ4EVysNpKQFZcSdFYvQamHLXqzT075AV2xaACMUwBOWygvJOrvZH7BnshA
	LDMX02HdWNI6oQEKnUIECNMcpGnLm8yQu1D8rPpZNpLYS/nYZUUboaTyE5q+7yXCP3uaS+oGxe3
	Rbud2chUbnR3jP8tQEjGICXKcIXQy2KnIAdCnUDJ9p7q3ICx/fuOQr5sJIj2x7E6tvGhWewgpOz
	TlNbU=
X-Google-Smtp-Source: AGHT+IH0XLkhBGBEBrjFCAiczuv1OaHI5lWHegxYCSgvZSSDCU/n+R533fMF6s3brHmr7a1bpTeQAg==
X-Received: by 2002:a05:6402:1449:b0:63b:f22d:9254 with SMTP id 4fb4d7f45d1cf-64077015c6bmr9656591a12.23.1762163591131;
        Mon, 03 Nov 2025 01:53:11 -0800 (PST)
Received: from localhost ([62.246.251.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640b977e6acsm3482562a12.25.2025.11.03.01.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:53:10 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6f1a36b59259780986f7fd765ebf513541f37af75e85296bc10e552bba7a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 03 Nov 2025 10:53:01 +0100
Message-Id: <DDYYUTR0HNLU.1HP4LN58RESHB@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Markus Schneider-Pargmann
 (TI.com)" <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin
 Francis" <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>,
 "Akashdeep Kaur" <a-kaur@ti.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com> <20251030-topic-am62-dt-partialio-v6-15-v4-5-6b520dfa8591@baylibre.com> <32b13258-19dd-4ba7-a13b-daaf3804a7c8@ti.com>
In-Reply-To: <32b13258-19dd-4ba7-a13b-daaf3804a7c8@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_015313_387745_B760DB22 
X-CRM114-Status: GOOD (  12.58  )
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

--6f1a36b59259780986f7fd765ebf513541f37af75e85296bc10e552bba7a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Mon Nov 3, 2025 at 4:51 AM CET, Vignesh Raghavendra wrote:
> Hi Markus
>
> [...]
>
> On 30/10/25 14:47, Markus Schneider-Pargmann (TI.com) wrote:
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
>
> MCU peripherals are under control of MCU R5 which would be running a
> safety application on AM62A class of SoC. So these peripherals should
> not be enabled by default here.

Thanks, I will not enable them in the next version.

Best
Markus

>
>>  #include "k3-am62a-ti-ipc-firmware.dtsi"


--6f1a36b59259780986f7fd765ebf513541f37af75e85296bc10e552bba7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQh7fhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNb
TAEA1S7xS5EppfI4CRVsDyo+NgkSSzMABfetOW8WKnVRCvQBAOaC+6F5lj6/hK4p
P+3TYeQDFHuCNlyLoFqdWJ1hCbsC
=D67h
-----END PGP SIGNATURE-----

--6f1a36b59259780986f7fd765ebf513541f37af75e85296bc10e552bba7a--

