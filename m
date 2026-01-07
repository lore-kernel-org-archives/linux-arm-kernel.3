Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAF4CFD641
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrBlQj4UNq5bX0P2Oj0hlsW+yiO8yPsf9QHL05Ffxd4=; b=MhaDsYajYdS7TkkO4DSaWqQAHe
	pAv/Fr7qggjtKoEIk0XQfHkXPaS1PoB4YgP/Ds7QXZHysVzKAXgQvuFEbYCVxv2bOPZzKbM24phn5
	VZzAfevcN1uifzGZJpPsqhQEJqjf5sY8dvX7lCKMsxAjaiub810rt30QH8R1zR8fg9YvDJ7E2vyyG
	svi1BmuvLreONeh4A7tUJfPVx8Noh2ZjVd9v0Pp3t/ktOWPtC3AbOJgTLxacNri/3HSAMICFcNQJ7
	fBXW6LI/qZCIEka+sRbFtTLhT6ufrBhgLYvhapO2WfyBrJ5bAWca9VPTG0DvvQokvmQdO/+yiRb/B
	eLkxthWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdURM-0000000F5Ct-1C48;
	Wed, 07 Jan 2026 14:23:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdURJ-0000000F5C9-3pe6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:23:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso8248775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767795788; x=1768400588; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lrBlQj4UNq5bX0P2Oj0hlsW+yiO8yPsf9QHL05Ffxd4=;
        b=mQWWnyT2SW/SfZJSXPJ27M7nT+I6KYBKKWQ/pV0YZwIFRLnBEYky2zLLeDjOxyK+Uk
         sSC0PWo2abMvVCyQMlARvuhdBfvNBp+aiC1rjbseMCAmPTltI2ZA396MbQthxCQ3kXWw
         IXJksw8JzYUFZ214MR8CMBMxwn7uqy5CCj01b9LLn8Q1+mH6Tyk4C7XFW3cN8HuxP013
         tMuKAWGYuiyxB5gJ7/UPy2FX2bDCrQcP3hU+9PphbnZWzRrEmV9Wioq6hwA3YwUZEalE
         ljbDTKryj7LH3jRbo6UeSpxg2uF71fVXDutM8YBZAQy3PA6NTVc3tJFApNk7c8iKUQVb
         t9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795788; x=1768400588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrBlQj4UNq5bX0P2Oj0hlsW+yiO8yPsf9QHL05Ffxd4=;
        b=htylrAFh8fCDS+QMOoIATbTV+ILiY7HfRHlpx3SJ6RMMLE10/mpbOx3WAeNoFj/Yhe
         Z6c01QXNkw1dVj/kGBs/JCeOgIPKwXoEym3OAthG3wbEvns0uHygPmBrTa95vZYxLcCl
         itkFTh84GWvAPCj6kTB4xZa7Qydse0cK1/mTeDsiqscHZOAMKv6UF6rfhGaF/T3H06XZ
         OgWJSK8v2QDeXSLue7FKp9hMVKtN/PnURDTJRc/w/sok8ogcscQNeubjiBcxnVUKAldt
         sGQbNTP/CEs/g9f7/aSlNbphY240MWbMbB0cmzHDsZM8t1wyleKaAr8UoN65wcVskWrg
         SpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwV9yXE8TvQ+OrD6VrhiS/ajOtkEe5UGZ4aTC6KVmu6/KIIskxXp+lj/Sb9kppB3UVgrXMTc4rTs3nx0jmP/lT@lists.infradead.org
X-Gm-Message-State: AOJu0YyZy/F3tfnTWgSEScbXRUUC75Gtg2ObB3adU6jZXxuqICnmByxB
	L6RLi/YKl4XSDEwxHFMxlDudfHmlYaR16T13+M+XaNH0giseSiZEAkaP
X-Gm-Gg: AY/fxX7ADktIWkVxFzp2646wQlKFbxgAWlRcmh+azTzGLoZjyDxlVGWoTz6fQixZHoH
	gmcjJ1aNQH/KO38Rvenjtum3g4LxlAnQANvGH6iNHjxJ+BovCvtIzL4873qlayhFusq9EbC55ZF
	VIt7PzQPmESwjh9Fd4qw7nUXNLzDvoVLpGaqNs4VhA1F2rohR8DaudCgHDEQ3VHzT5s2gOUH6BY
	DtZ5djNz/PQ6VI2qI+b2ZLH1CaI2yfjw4kxjNwsQdjnvH0pdielbPrsngX5py5sGg6gR99GkVvv
	0xe6n/qmvg716mTqa/FKBj/bzSv9koeozgwva4upr6bo0/W97u2qiiwcphMAXtmS8irN3NSvsWg
	uVJYmU06Qd+fXsC9h+5DabiVIIhi1vdD0DzFh3tuwpoUtBAdz3ER6Y4GyUJtRDJVVcViV3+FDby
	GQUrFDmHJNkIKJHzLpASFhUjL8UeohuzDspB/PsT0Z/3K83RAM//haFDq1kKFNFO5HuhI=
X-Google-Smtp-Source: AGHT+IEmuNd/Qt3WtOx0ii6Kg8kTIcWNI7cbIrZ2DWSZKQmAlz52wmNUGTe+YLzDADT+PqNKD4TrJg==
X-Received: by 2002:a05:600c:1547:b0:47d:4044:4ada with SMTP id 5b1f17b1804b1-47d84b1a0abmr31546605e9.13.1767795787751;
        Wed, 07 Jan 2026 06:23:07 -0800 (PST)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm107667935e9.6.2026.01.07.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:23:07 -0800 (PST)
Message-ID: <96bebaef0d608d4d7bdbaf0fbabe3b1835b01400.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon
 <nm@ti.com>,  Vignesh Raghavendra	 <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur	 <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Jan 2026 15:23:07 +0100
In-Reply-To: <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
	 <979eb1054dbe116c2c8bb9920e94e3a93db5346c.camel@gmail.com>
	 <DFHSDXTVL4AU.2OQ9VB9TEJ75G@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_062310_312011_7DDD4511 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Markus,

short update from my side:

> > I think we would need to discuss this with TI via our FAE, because the =
change
> > in question has both been discussed with former FAE and the technical t=
eam
> > behind, and adopted in TI SDK.

I've reported this to the new FAE at TI, let's see how quickly relevant
people at TI could look into it... I unfortunately don't have access to
AM62A7 HW, but I've re-tested SD card on our AM623-based HW and I see no
issues under Linux.

>=20
> > > +			AM62AX_IOPAD(0x23c, PIN_INPUT_NOST, 0) /* (A21) MMC1_CMD */
> > > +			AM62AX_IOPAD(0x234, PIN_INPUT_NOST, 0) /* (B22) MMC1_CLK */
> > > +			AM62AX_IOPAD(0x230, PIN_INPUT_NOST, 0) /* (A22) MMC1_DAT0 */
> > > +			AM62AX_IOPAD(0x22c, PIN_INPUT_NOST, 0) /* (B21) MMC1_DAT1 */
> > > +			AM62AX_IOPAD(0x228, PIN_INPUT_NOST, 0) /* (C21) MMC1_DAT2 */
> > > +			AM62AX_IOPAD(0x224, PIN_INPUT_NOST, 0) /* (D22) MMC1_DAT3 */
> > > +			AM62AX_IOPAD(0x240, PIN_INPUT_NOST, 0) /* (D17) MMC1_SDCD */
>=20
> My board is setup to boot from SD card for easier u-boot testing. So
> only the mmc1 is relevant for my setup. I just tested which pins need
> NOST here for the boot to work, all DAT pins need the NOST variants,
> otherwise it does not boot here. Not sure if this is just my board or it
> fails on other boards as well.

Thanks for checking this!
I'm curious: is it only U-Boot issue? Does the card work properly if you
still have ST enabled in Linux?

I'm a bit hesitatnt to revert the ST on these (or any other) pins without
understanding what's going on in HW, because from all our discussions with
TI we've concluded that ST shall be used on all pins without any drawbacks.

Getting this back to TI will also help them to figure out the HW requiremen=
ts
and document them better.

I'll keep you informed, shall I have any new info...

--=20
Alexander Sverdlin.

