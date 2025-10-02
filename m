Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5372DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2BhPJFUA5rMfvZ1uL3WhmuxW8QfF3Kklsw/mp/nZyk=; b=XVxbkj0bvomKup8jdDNLd26PcB
	ZXuy81uidKI3BZtGYo/ayTTO+2BVCeFhgpQ7Qq9AMaymWy2V7PKAOnbsZpW4GtG/hKeDTABiLAPNy
	nfvbOvvhiVphRhKsep1Yy4Uq5uyGfGcAQ4XF7EtnXrQnuGITdb56dD9nKC4fEVHLIcpYOMjmaZyES
	KOD5BTcyJrGZVzTccglqe3OxfQ2Z7IRMhYqx16Zp1JjCdc59IePOYTXqLDz7UtQbtor7S9qcexOQB
	ybzaUFQTWhzmxdK9aYqIl6CM6iJqMTifUBzCCJbEAOxlClkg3Kt+c5lQI3q7rW+96DQ3Ea8JqVM92
	pCdVE22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FTo-0000000A80a-3Cm6;
	Thu, 02 Oct 2025 09:20:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FTm-0000000A7zy-1Itz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 09:20:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so8069555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759396800; x=1760001600; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s2BhPJFUA5rMfvZ1uL3WhmuxW8QfF3Kklsw/mp/nZyk=;
        b=rtEMmC9MdNjAYa0eJozMfXxCULB8a9FwzGjbO+chCu7KBcRVzsE35Qk+OeLZyb8COR
         pBMiwIl8Vr7akvPilSjC3vMbhRf542dH8urGNy+sfmXOk7OMBEeP7izhzrtQr6ua7Vn9
         xKgYNjStpfn9asnsqHY0M2T/lLz1arYe5rUysVSX/GYiolhBmaSQf+0KSsm+lgkygnIL
         S9ax3BaAFtn5MXgZE5mBvFnRJdZxw5olQ5RQE0+yedHOSChjw+EVSjl2VoBPdM5dDYve
         UrYdW+TZ47K8JGKxALo0ap5OpC2ex0/dS0zsThTumkcdV2HLmxt8CFz8zf/TTp6zvRPC
         Fhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396800; x=1760001600;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2BhPJFUA5rMfvZ1uL3WhmuxW8QfF3Kklsw/mp/nZyk=;
        b=N7hxh3EWkZ/FjA7/aTF8XJFWeLcHWgAl5hW6WuaD4BM4ss8/nq2JN0kTN2FJ9ADwWG
         gD0RZWpPFMj+XW2e8kP0x+hY0Vvh50H2gWPobKAVpRLG47/whi3tV1qU8u9rlAXLoalr
         Zu9tLyhdBQv6tskb/4K/o9OF+XV3nogHEFummQOqcuhd6sFpEXenEj5Rok9yUHCquqeg
         SgGMzXtzPs4QQOZwjVl9a72vnKcj6UGY9cfu4xL0xzvvUz8aBBOHCJxSYbkTH28//Gc8
         lziDzUpYdZwe2iaj+0GZczDbbZ6cRTMZtkP0ojMJ7ZYX6h1S88yo2zAEbEY94/lGJZE+
         6lPA==
X-Forwarded-Encrypted: i=1; AJvYcCXl1uRzI0LxJgPQlmZlh8brJ3Fq0Fgd6j/LV1KSdYarVzSz/5J0MNsRH+/Id7SmJ0rip0dxSgbSDR+XBAWNscnG@lists.infradead.org
X-Gm-Message-State: AOJu0YyupRNqzpoMAPsFmQ2D/oVCvrTfL1DSbwWpjXV0BPOf2+mGuV2h
	/KRD0LuUmk6bKJQ40dP6UPhNI3v2K0mDkrB5rbZKsXryskQCZqAFfAcfnFonqwfXYII=
X-Gm-Gg: ASbGncsjeixhnZ0ZAy2l2SKCBOB2PeU+L0otIFLQ58WK3QOx6AllZj8744EDu8LJy2e
	lOnwYPJVFESRFOF7R1ehTAQQY5jV+7TYaRyLZb+qCdsF6C2/9x1SiltWDeE+DePs3tFitMgT5a0
	u5Qjuw+VRwYQ3VW29nkp+cREaooM5siDKaNTa8asAIovDLwI3oHwdJELzk+XChAks5IpP8qpbGp
	zd446fOMUKYHKyF04JNzaEgcbUNZTLaXOGe91orqoQunmP7qnH8E6mtn4sbA+Nhpd3Z2N4qg/tX
	/pd3h9A/C4EX6hr/GLajlJtuiMygW43X2bgOqC3VcELHUHpryvCLZ/TpBe6XeotIYFxDY88ulam
	RnpapkGnur13n9lMfDxcHDw7OZBZpVQP6OhMmRjLhvQDO5QMbVsTcX0dvyEck47AADUNYgg==
X-Google-Smtp-Source: AGHT+IHIFpkDmi1VU2+9VZXNZGV+SNIcJwRSxeDcMpiAWAFfIEuaOQqtErYVn3aR0Xr7bMMB0aIPHQ==
X-Received: by 2002:a05:600c:1382:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-46e6863e130mr20968605e9.7.1759396800370;
        Thu, 02 Oct 2025 02:20:00 -0700 (PDT)
Received: from localhost (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e61a029a0sm72705605e9.13.2025.10.02.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:19:59 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=55e5f674b6f0c4498d17272902032cc52f7b00d4661fa093516501d66420;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 02 Oct 2025 11:19:38 +0200
Message-Id: <DD7Q3TRDJQMG.3OXQED3HRBIL8@baylibre.com>
Cc: "Tero Kristo" <kristo@kernel.org>, "Santosh Shilimkar"
 <ssantosh@kernel.org>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/3] firmware: ti_sci: Partial-IO support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI.com)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com> <20251001170036.favd5zaieknywcch@amendable>
In-Reply-To: <20251001170036.favd5zaieknywcch@amendable>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_022002_383382_B8ED57BA 
X-CRM114-Status: GOOD (  20.05  )
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

--55e5f674b6f0c4498d17272902032cc52f7b00d4661fa093516501d66420
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nishanth,

On Wed Oct 1, 2025 at 7:00 PM CEST, Nishanth Menon wrote:
> On 16:37-20251001, Markus Schneider-Pargmann (TI.com) wrote:
>> Hi,
>>=20
>> This series adds support for Partial-IO to the ti-sci driver,
>> implementing the firmware interface necessary to enter this low power
>> state. It processes the wakeup-source properties from the devicetree and
>> communicates with the system firmware to enter Partial-IO mode when
>> appropriate wakeup sources are enabled.
>>=20
>> Partial-IO Overview
>> ------------------
>> Partial-IO is a low power system state in which nearly everything is
>> turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
>> wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
>> system on pin activity. Note that this does not resume the system as the
>> DDR is off as well. So this state can be considered a power-off state
>> with wakeup capabilities.
>>=20
>> A documentation can also be found in section 6.2.4 in the TRM:
>>   https://www.ti.com/lit/pdf/spruiv7
>>=20
>> Implementation Details
>> ----------------------
>> The complete Partial-IO feature requires three coordinated series, each
>> handling a different aspect of the implementation:
>>=20
>> 1. m_can driver series: Implements device-specific wakeup functionality
>>    for m_can devices, allowing them to be set as wakeup sources.
>>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-sourc=
e/v6.17?ref_type=3Dheads
>>    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-=
0-6972a810d63b@baylibre.com
>>=20
>> 2. Devicetree series: Defines system states and wakeup sources in the
>>    devicetree for am62, am62a and am62p.
>>    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio=
/v6.17?ref_type=3Dheads
>>    https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0=
-25352364a0ac@baylibre.com
>>=20
>> 3. This series (TI-SCI firmware): Implements the firmware interface to
>>    enter Partial-IO mode when appropriate wakeup sources are enabled.
>
> If this is the order of dependencies, I guess the series has to wait
> till CAN driver changes are merged? did I get that right?

Yes, the series has to wait for the m_can series as it containts the
dt-binding required for this series to work.

>
> Also surprised that the DT series is second in the dependency.. usually
> dts changes occur the last. but anyways..

Yes, true, they could be switched as well. The driver changes of course
won't work as long as the DT series is not merged, but they could be
merged in parallel as well. Neither the DT series nor this series modify
any bindings. Only the mcan series does.

Best
Markus

--55e5f674b6f0c4498d17272902032cc52f7b00d4661fa093516501d66420
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaN5DqhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPM
7AD9FZ7TKtdj9gutIa9BZ1ZQBz0wJHycBDoOSqrFQAbQ8UwA/RMHayb7a4PbZ8iy
j6khLzQ18Wvas902AD5rQ9z70soC
=sMun
-----END PGP SIGNATURE-----

--55e5f674b6f0c4498d17272902032cc52f7b00d4661fa093516501d66420--

