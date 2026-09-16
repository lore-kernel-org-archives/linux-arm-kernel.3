Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6067BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=; b=LENO+UPm9SMxFEjBpq2qcj0xb4
	9Eiarfh5PgA2KxHbYcwM8fqW79yw4ee3YoVPUFJWnf3hosiHdn7mwcOYt57pqBVZSq8/im7ja8jqB
	4khClOU2f4icpT8jRvzX3a5wdIybC+6OmylsQIlAnC4YCqazT4uLG2ako+z8luqErnlfE1a6LQ9DU
	TYp8XgG2L5SHQ7u4e5pPTKv/wF5NM7knvM6IbLLrIQS9K6wRCtEmYUQhq96FDBsiNCTvFsNGbMjJP
	+6NgSIdDQWwooonOQ4PJJk+LrT/jPDc0rggUa66iuARCWrieuuMsFo8o9kMbv1YiAVeMk/hW4HKVd
	dtV+CigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mnD-00000008xon-2r1K;
	Wed, 16 Sep 2026 10:23:07 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mn9-00000008xnz-2cEs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:23:05 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so331160f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789554181; x=1790158981; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=AMEXjC7RoIJouu7sfFcFS59GmqOMd56dGFZbNo5mj7uiCCsQBEcP1HfVKBFD9TpnOl
         QhY5zIbJPI6Wd6oXcIZJP8eFnUbStvsiM6lJoGD51M/kSB31fHeOdTPqFqofQnK7TIzV
         UT8WR6F8opoo4NiPLa02ObcRBMSIRoeOAjMEVd5EzLSqx1sFj9ISB00GJJoDpq2Wset9
         NrFGc6bNg7PwrscFc9Ub8LXEz9TtMhq3QbOQ7dgB1s460jZC+GSH99GtyKC3ktEfY7K6
         KeoGjVROlUcWxHNeQTwnGQxB5a1KEqmK7MqUndlsu1UFVxDvP0skgk7huXqR+R5SL0g0
         bwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554181; x=1790158981;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MusB319/W5rKi26RtEZ1yy6e5hMKt8D1KmhppeMb+Rg=;
        b=bWZ/1/EG36STN7vztXJxP32wg1qH8VFyKm1LB6srxZzbJfvSJWMfES9Z0cq1x3K0LZ
         OwQhC3dEFxaPS1QLvFX7Nu3lglwNsqPNFBBOWfn3yoqXbRnufX8zl1xHRiLx6wi9xBfG
         oviJkwea8hi2WKZD8sfIu3twMnjL8rk65n8cj3NwWM0ZfHQ8Ny0WOib7VFlz0tyy1xO8
         L2nTbTIfca/YjID5Cdd4W9l++7zosvnKoFC08LF6YNkgfFd9liMKps+dRMKZSjdivrv/
         NXh9IRK0wv6AlJcl82DtITJczQIZOqSP1FSDiJHhJD4ygjeeMI4gyAfWlTbArTAPrU8U
         /ZvA==
X-Forwarded-Encrypted: i=1; AKwUvBwaoRm/Eq2vG7Rs/IqcDdifZxLxydTZFJP/UCddSQSayGMmULpIHIB3PRHo19xhtccKZd+1VhtIhc2uaQJbls5h@lists.infradead.org
X-Gm-Message-State: AFuF++nQOqTu6k40x/9XMG3I/lWQRp1WSUAnfaNHuD1fA3ou9aCz6bEh
	pqYqT6RiFkdF0D2sXaB96fzTIePwVBP/Vaqk+9FBSCorSg9cCw/VXTe5XYeoJ80RlkI=
X-Gm-Gg: AYBFou2w3irXypviNXVIY4T55AX69qzf0kdPQS1zUg/7zT7KUeRh2aqrtsdnjfd/pto
	Cp7MJxQIfY0PKlRd+B25l+YolQVRGAWjYmeLhlzY1NBTaotDskYGM6lIuEkx49NKHHchBSxwHra
	OCrAl/p8YP5C/x0OC21IuyVTKVDhecKBKDyfgHVLNLijXdIoHrF8QzOlQopEtfeE6raDRBRYyc6
	MnedQM5eoonAgqnq3D5L699R3iwJ/cYoqjvlgDqDa4xrpLgDmyYbWF7cN2hoO2SMpGmaDFTre2i
	yoYQB1eYT+MIoaIsVcUwaZV0shMft/OfiBqwuo8viuol2m1xvTIyHcJ9Fx6SuaApaElmTxirY18
	DyuFaUNXPiJOrtobnyyaAikIWmFP7Nj2TOCgO6jtW/SqjmPftaczElPW3zIrRENBANL68gs8DC7
	HFBAZhq7uBaOoE9dLkc2CDdCg9O/Z4sBLVy/YjmV4gvv0qIp1SkILboe1TwSV32FSSk7uD5Xh21
	Qpt
X-Received: by 2002:a05:6000:1789:b0:487:528:cd3b with SMTP id ffacd0b85a97d-4870d057324mr2601650f8f.53.1789554181539;
        Wed, 16 Sep 2026 03:23:01 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm6429347f8f.14.2026.09.16.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:23:00 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 12:22:55 +0200
Message-Id: <DLGO0EVE0R9G.3MLT4ORYWOK8D@baylibre.com>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Judith Mendez" <jm@ti.com>,
 "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis" <afd@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>,
 "Kendall Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911074213.uucibicxngghf4rt@famine>
In-Reply-To: <20260911074213.uucibicxngghf4rt@famine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_032303_679244_F0C6D9DD 
X-CRM114-Status: GOOD (  14.94  )
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

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 9:42 AM CEST, Nishanth Menon wrote:
> On 14:39-20260903, Markus Schneider-Pargmann (TI) wrote:
> [...]
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch=
/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> index 84dfbfd1986c..a343166b815e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>> @@ -53,6 +53,7 @@ &wkup_r5fss0_core0 {
>>  			      "lpm-metadata", "lpm-context",
>>  			      "dm-firmware";
>>  	status =3D "okay";
>> +	bootph-pre-ram;
>
> Additionally, please check for dt style (status comes last and has an
> EoL prefix).
>
> Documentation/devicetree/bindings/dts-coding-style.rst
>
> Could you kindly see closer with dt-style-check --strict as well (it is
> a bit noisy atm, but it does need manual check on the log)
>
> This specific one was caught by review-prompts[1].
>
> [1] https://github.com/masoncl/review-prompts

Thanks, indeed, I will fix these. Also thanks for the link I didn't know
that existed.

Best
Markus

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpt/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN/
DwD/TUtAHwXUjrcmYytdre2lYelDM8Hv7O5A38tPdzGKZyEBALivuMFtjvENBV4o
sYGZRRl4K26KXxKWAlRx8OBIAYwJ
=8jd7
-----END PGP SIGNATURE-----

--68b57a79f45fdd2628e3309e87a886a7672c2f724b17241988aa32f7178f--

