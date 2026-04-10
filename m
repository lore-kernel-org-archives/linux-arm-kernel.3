Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B6F44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:From:Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4LNMj6lgIltlmZWf+E5PDMda2hOSl/xZGWYEn7LnYk=; b=sBUqzOezGHgc/EG1PTipoQTUS6
	/N2caDc+DN7p5okVk5efF7xkCslaRS4PcDr9psGyESTX+NOTZiTixjMdMswN2fBDjyB3dl+zYaJ9E
	CayL4hktTNguTf9yavj8bY2NCZsd6ViVkjC62BliqiukeEH6mDGtS2+HA8H3iF+OVG6khw6ESzOSl
	ecyXdyVG4jJ2Iuz0IgNfaAIDDmlpd5olcf+VbzAYHuLiivxdfVduH7gABFGh1G0Ky3n2eOaPoy+HO
	T6MAC8Xrb2L7Indv7/zKKD7/h1lHZdK9kleWKDTp2M/mfMp3oTOsoUHobs3xXl++gOVxkFJM/NYOd
	ssUge3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCJV-0000000CLcr-1GK9;
	Fri, 10 Apr 2026 13:54:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCJR-0000000CLcQ-15LY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:54:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d5e87a507so1591191f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775829259; x=1776434059; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4LNMj6lgIltlmZWf+E5PDMda2hOSl/xZGWYEn7LnYk=;
        b=aBvE5uCQLBfKIZfMWcnWCE96v8zbvcpIciLEwkgWYjIqio/Lo/Mkm7/bm2Zra7/uAb
         WCdpmk0+Zh2pgjGmKmkNUtF8Oavde8pjnYd3UsqJt0Y9vGgka2UFIFAravUUcXKMTfZG
         +kWm8k3N6G2zHh2dmqZt0VEnBKURbWwHLh8+xbED9aVeDr8KGvR/vZU88wGsb7qPnhw2
         Tkpo0Ss1wL30l8LcI4oT160bJg+WpwhYwdMrteBW2JMzD5FlObm19R5NA9KJcouXzhOX
         7GFhImJg0fHfN3p8bWz5xNJzk+i+3xMSFZ20qMcy0/JJU4FJY8enUOea/UelJzhGPLSH
         B/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829259; x=1776434059;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4LNMj6lgIltlmZWf+E5PDMda2hOSl/xZGWYEn7LnYk=;
        b=MUhAYwt0Qz/AWa2u9VF2NkqmBNlYVSrwEYS1dZXi8B1COm4ZSgZZxmj0UlWbPCOFG0
         RYLfQMdSddQ7GE1hNYdLRXmqUS0r+yptUV4/VVoM2ycDNe4a/j+BHYi+r8tx896c9dng
         scUcP5mAP3au/f4m7S8SW65CMgN9g6D6VibXSIptrFzon59Uaw+ALiSA5a9/9DsIw5qg
         DhCtTODMez3RqNdykKn0KkzImdDk/Ig+1kAJBMd2bd4wMeoWuM4cf9oawSghlKYW9+0E
         KUHsm3XX1kfpbcHNAsi6fFoHjYoA6pEdSQhvtvblIVwkepqRCOsbYxFrLB6tRCgzeoOa
         O/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVZMN61uCpQtKGo/mWe2jhy9CxAAIhi5a9vfUSpdt/aT4r22/Qrk8XbKy80QepzQ7YvrDMofBuhbyrLZa7jSY53@lists.infradead.org
X-Gm-Message-State: AOJu0YxpLojG0eQHoTByEjLxf3CnLEOdY8zDFi3o9FLn33O9elOaTYgq
	ZkykJpZvj4ETL9sOIMo/8QKoou/gJMmPAt8KoH9w/+kdoFou4R/he2c1XdjQn0IUngc=
X-Gm-Gg: AeBDieuGo3Cuo8SVHAZ/ALYCRiDWAUKwNsfvpnLke0WglMxZ/35wBHnKQ3usHrvse3R
	XGSb1inSkfMKzu8QNDLQJobbJ3/njT+Xxiyn9urKv7qulv1QijxXmQPlSys/8iRRA3p9fElsXyd
	IcO7U6voNBaYcdkTcS0lhJhrCDKv/vTEyIdnBuxZlY8mqBtOZsxZtW+OcPERbw761jh1W0xKB4Y
	EMmXXLY1u/Wax2f1gYUbs21LFhoBMOIEUVclhNp+SxWX76X8wEJTrIt+6jcasEsYKXyA41MfNLh
	dCT7sjTqfSK69Svxtl7o48xDB/hGQHf35IwsW9RdPkxOvAmU+se6StJtoHAq8H4lSLxWkESuZw2
	HeroF5xHPlt/BhDQO98g4ZYgLMGjVWvS5Zlss5ar9wEj9XiAY0j5Qbn7Q3xnfH/pxq/sIMduKii
	kW3ZkAysuU7xP0Zg==
X-Received: by 2002:a05:6000:1a8d:b0:43c:fde6:212d with SMTP id ffacd0b85a97d-43d642cd3ddmr4879713f8f.33.1775829259168;
        Fri, 10 Apr 2026 06:54:19 -0700 (PDT)
Received: from localhost ([195.52.170.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5061fsm7375169f8f.30.2026.04.10.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:54:18 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 10 Apr 2026 15:54:13 +0200
Message-Id: <DHPIXKPIY6JT.2DWJ2PKTQAOLX@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring"
 <robh@kernel.org>, "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com> <6a4aecff-f662-4620-8572-3309ea6a81e2@ti.com>
In-Reply-To: <6a4aecff-f662-4620-8572-3309ea6a81e2@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_065421_325434_3D9790DD 
X-CRM114-Status: GOOD (  22.03  )
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva
 Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall
 Willis <k-willis@ti.com>, Vishal
 Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Thu Apr 9, 2026 at 11:46 AM CEST, Vignesh Raghavendra wrote:
> Hi Markus
>
> On 08/04/26 20:33, Rob Herring wrote:
>> On Wed, Mar 18, 2026 at 10:14=E2=80=AFAM Markus Schneider-Pargmann (TI)
>> <msp@baylibre.com> wrote:
>>>
>>> Hi,
>>>
>>> Split the firmware memory region in more specific parts so it is better
>>> described where which information is stored. Specifically the LPM metad=
ata
>>> region is important as bootloader software like U-Boot has to know wher=
e
>>> that data is to be able to read that data and resume from RAM.
>>>
>>> IO+DDR is a deep sleep state in which a few pins are set to be sensitiv=
e
>>> for wakeup while the DDR is kept in self refresh. Everything else is
>>> powered off.
>>>
>>> The changes in this series were suggested as part of the IO+DDR u-boot =
series:
>>>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
>>>
>>> There are currently no real users of the memory-region that is split in
>>> this series. The size of the memory-region in total stays the same.
>>> The new layout is derived from the software running on the r5f
>>> processor:
>>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exam=
ples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-cl=
ang/linker.cmd#L172
>>>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/sour=
ce/drivers/device_manager/sciclient.h#L459
>>>
>>> Additionally the two important devicetree nodes for resuming from IO+DD=
R
>>> have the bootph-pre-ram flag added as this data needs to be read before
>>> the RAM is in use.
>>>
>>> Best
>>> Markus
>>>
>>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>> ---
>>> Changes in v3:
>>> - Squash the enforcement of the memory-region-names requirement in the
>>>   patch adding the memory-region-names, as suggested.
>>> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v=
6-19-v2-0-37cb7ceec658@baylibre.com
>>>
>>> Changes in v2:
>>> - Make memory-region-names required if memory-region is present
>>> - Fixup memory-region and memory-region-names conditions. Require eithe=
r
>>>   2 or 6 regions for memory-region and memory-region-names
>>> - Reword and restructure the binding documentation for memory-region an=
d
>>>   memory-region-names
>>> - Add memory-region-names to all uses of memory-region
>>> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v=
6-19-v1-0-12fe72bb40d2@baylibre.com
>>>
>>> ---
>>> Markus Schneider-Pargmann (TI) (7):
>>>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>>>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names
>>>       arm64: dts: ti: k3: Use memory-region-names for r5f
>>>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>>>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>>>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>>>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
>>=20
>> TI folks, Please make sure these dts patches are picked up for 7.1.
>> There's now a crap load of warnings in next with the binding change:
>>=20
>>      58 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a
>> required property
>
> [...]
>
>> If they aren't applied, making  'memory-region-names' required needs
>> to be dropped from the binding.
>>
>
> This breaks DT backward compatibility. Why is memory-region-names now a
> required item and cannot be assumed as "dma" and "firmware" as default?
> Is that intentional (should have at least had a Fixes tag then if the
> original definition was wrong)?

Conor suggested to make the memory-region-names required for easier
distinction of the layouts:
  https://lore.kernel.org/all/20260303-payphone-pancake-b6068c545bc3@spud/

And a follow-up discussion here:
  https://lore.kernel.org/all/20260313-kettle-craftily-aa087e6b74db@spud/

Also I don't think it really breaks backward compatibility. I don't
think there is any user for it and the previous binding documentation
only refers to it as reserved regions.

Best
Markus


--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCadkBBRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNI
+gD/bX5c82CD398I8HEnZJc39F6jPtpkaVpl2P0YheGnP04A/A+ZeGo88XB9ZT1V
/HaA36gs9iIvFQU73v8Wnpl46jAE
=78z7
-----END PGP SIGNATURE-----

--6be3ff7f8d2777e4e57718e09ed562d196b76b38ee2a26325068e941d4a3--

