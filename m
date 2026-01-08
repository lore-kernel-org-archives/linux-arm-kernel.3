Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09350D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJp3kbRDibQZP4ezlU2rD6fXyAOAEb4WDi9o81OCimk=; b=HIk7aIMsR9ZVWgtJrNtk1hwpYM
	xX6l41CKtTjECApJKDRr0g96N9qx3FRY4bSStUajzeOz0LNu34S+ngJtdOi1Vj7ihLzboMMMW2szW
	ObJJO9HEXt7Cxu0rWeyiegxTbHEGzW7oU2TxfDHbnwUBaI9HwuYtrKEDXR0blgs9Zo7lP8rdKpDgB
	62ykUyZdttBS1VkO7zZz5sg5wlAEdPWAADJhMAGu9r4HyOLwkfiPzFAwG/o6XP4ARWCLOWwkkSudX
	xdeVjP3spgtt6++8+pBhu04s3DnK+D0cktGH9IA3Mq7mpps2V4/yjl1ZI1qMm7hGQYuTdxyEVEjVY
	6/oXu/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJe-00000000hmM-0lRF;
	Thu, 08 Jan 2026 19:05:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvJb-00000000hjW-37uB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 19:05:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7a72874af1so657566966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767899097; x=1768503897; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XJp3kbRDibQZP4ezlU2rD6fXyAOAEb4WDi9o81OCimk=;
        b=QfcQCu7xoagheFXXQVEO7kCsv9GEFcvnSC3KryBzLgpJ7FJx0oxSAg8sUsblJKNI+1
         ZtYITfCMdQeG+Wt/2jZYMZYE9r9rZc39Y85Ex178dZqoV6ogiLUn3yzcNUlTvriHshvg
         PxDdAi9OamCQIN0/Ia9jIUhmcCFVt01QNiZTcjLFw7ejeYc2nMEzOrKRNZ5iEVikeQvP
         Z8skEjrejBvansQS2YMGAwMGEWeSbmGhsmGg5vzgt7MH9gDf7K+fixWzdPuEwP2/YYla
         15HH+3AMUsb1Ul0OTmILCGxufL7nRjVwjMaN0sOd0aS/WeHuNlIqZ9xqjaq3VfguSnnc
         ryAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767899097; x=1768503897;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJp3kbRDibQZP4ezlU2rD6fXyAOAEb4WDi9o81OCimk=;
        b=YIU+bX7iU5gg+jfp0dvszRcNq4ozoizJ3kldDCg76Hh1kqVkKH/MYSBm9EmmCer1bT
         7fAG1/eC+4x1UrasGePlgR5w9rWwAh/O4oTeD8dIug9xzD3WqSy98G/ShRHme5TT8SAE
         APp6oegxFly/v07cqOQ/MeDq7S4AoXVqLpWm6DmKQ9MmGL2l/kqB5V9vZp6Cunw3Gn8E
         0wnqGOb8dWedfKDvWhvMSx/68WAgy/9dur9Odsz6JXgPtj14VokGPZyakJOBxQAogEp0
         QfvACESuEA+FeM5b3l/7KuHCTunX/iYrZvqsovM7bHro3h4BOOICX8aXXTjNc4yyRWAD
         r+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXpMxkFKuM2PalnP3NQND52Cn9C5w+kutQe4+ki9BcO+mdOOg/3O5bs0pLJaIdA1IMz1cyhS2fmBi/vk3+p6ZH6@lists.infradead.org
X-Gm-Message-State: AOJu0YxrLLifNCstps08SQZCuBEBdScWjVSlpR+8oIW0X04leIfcD9Yn
	rFeBCJWyfhRSjatAXgXlt8bYwPJU0ccGCIILPToG4rXwzrQvwvCwocaIs6ZGoAaD0Ko=
X-Gm-Gg: AY/fxX4HJ7PNUMEUb6BpaPQeOzaXe758WV8jgaSvwHfJnfTTb6AyVV3jOiPl6trnaHp
	IdCepMSRGacu23rEAsrsqT2BnnZrKirWj7yCXSw2Qk/hNKo//cAx8qIW/IGWUrgqNSTXXSCfli0
	0QxWSvbi6vWejTpNCLYCzUtSO5McBk4eyWcHaYmAnzXEus4Y3wKya8ffapfvmOqlC0bxrcCvEDJ
	xr9DWIDzWPToBZqGjyt4UGq8GqeqxoZVWcxGKqpRjeLV0allzt+xcBAHDfYLaPTqTbGAo9dPrnA
	wS731H0vpPTXzNNrfQpyzU6bDnnwfr3RkLBI9h6voWzrjTi708KGrk3KK+bSdVU3LTpqrkVF/o0
	fVbQwnR/UGUU/XwONjqw2X7amjUT7dfZSxVrZsZjBU9jVxeOWxe3x9dglWKEli0+ySO4iisL/TS
	UePeU=
X-Google-Smtp-Source: AGHT+IHFbyH2Udw4Bw75NdZIIhSE1/uD0iJk9MPGkWdf0FiTFxZb2C5qCNkaZXVD8ufPMEM7axZCVQ==
X-Received: by 2002:a17:907:3eaa:b0:b73:9b49:2dc7 with SMTP id a640c23a62f3a-b8444fd1589mr810433566b.52.1767899093260;
        Thu, 08 Jan 2026 11:04:53 -0800 (PST)
Received: from localhost ([195.52.31.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233f2asm883679966b.13.2026.01.08.11.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:04:52 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7947329d98261ade7d2d40f049ba218cf4626c3400a81e7292b42acefe9d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 08 Jan 2026 20:04:44 +0100
Message-Id: <DFJFX7LVOKPI.3E0RKGCIGJZOR@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Alexander Sverdlin" <alexander.sverdlin@gmail.com>, "Markus
 Schneider-Pargmann (TI.com)" <msp@baylibre.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com> <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com> <5e116c9089bfa8d645eb044090a75523758c6743.camel@gmail.com>
In-Reply-To: <5e116c9089bfa8d645eb044090a75523758c6743.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_110459_808973_1C607E48 
X-CRM114-Status: GOOD (  16.64  )
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

--7947329d98261ade7d2d40f049ba218cf4626c3400a81e7292b42acefe9d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Alexander,

On Wed Jan 7, 2026 at 3:49 PM CET, Alexander Sverdlin wrote:
> Hi Markus,
>
> On Tue, 2026-01-06 at 18:25 +0100, Alexander Sverdlin wrote:
>> > =C2=A0	main_mmc1_pins_default: main-mmc1-default-pins {
>> > =C2=A0		pinctrl-single,pins =3D <
>> > -			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
>
> this is a bit trial-and-error, but maybe you could try to add missing clo=
ck
> retimer/loopback pin for test instead of disabling ST? Would this help:
>
> 			AM62AX_IOPAD(0x238, PIN_INPUT, 0) /* (N/A) MMC1_CLKLB */
>
> some SoCs from AM6x family seem to require it even though TRMs claim the =
default
> PoR state is the proper one.

Thanks, but adding that does not help unfortunately. And it seems ST
being enabled on that pin does not break it either. The data lines seem
to be the important ones.

Best
Markus

>
>> > -			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
>> > -			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
>> > -			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
>> > -			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
>> > -			AM62AX_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
>> > -			AM62AX_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
>>=20
>> All of these have ST enabled on PoR, according to TRM.
>>=20
>> > +			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
>> > +			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
>> > +			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
>> > +			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
>> > +			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
>> > +			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
>> > +			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */
>> > =C2=A0		>;
>> > =C2=A0		bootph-all;
>> > =C2=A0	};


--7947329d98261ade7d2d40f049ba218cf4626c3400a81e7292b42acefe9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaV//zRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOF
nQD/cu21gm/lNOgHb5baZ1th/s8xiWa8aurswOgo90T3OqYA/1en3p+Vn6oSouYA
dhhamdGyjVdH1yAP6BGMwtwcfBED
=WALh
-----END PGP SIGNATURE-----

--7947329d98261ade7d2d40f049ba218cf4626c3400a81e7292b42acefe9d--

