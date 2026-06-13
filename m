Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC9DCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=; b=bnNux6xrq90ExOGhirCKUq6yV3
	xaa47jD0WbG6deqnyemYtMbCmJns7yXg2BNh7Rc6DZ3JtMMJ5/ftbsAD3NLKhWf/CnovyXy0taesN
	bXG98QrlRJn5PlCFFsnCsPENNsrAKVp7hmkBPHWXxEhO9QUkmUIhs2fo43iTXZFccH8JW/LxjJgN2
	95FWnEba7uxk6erxr6cHP4X8DvmOJz7HruZ8/dKH7HCNlgKyqO5hfDC1CVEjycmvwh4cY05l6f/wI
	SDa2FnULdUkGYw57cTswYGbbe0IYR8ACoyD+8ilxNcuvv2aml3Y2aTSUulmkAQvxTqbZjm+KxJ642
	+5BD0VIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKop-0000000C7q3-3Xkc;
	Sat, 13 Jun 2026 09:38:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKon-0000000C7pO-45nT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:38:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-46019b190b6so1428872f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781343500; x=1781948300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=mgaJLpWpv26YqA2KQQKC4pjbIsTlhqGzBBtyLlFS6Bwx7sqJencKNqVD+nxkqsI4oZ
         0qJAyDfhm7nMbgZh2JyimHc/EkSV3VINbLpeQbAY8xcTl8nZQ/BBQAZV7851ogg5Wgig
         5Y1flcjw7RBq5mVAcM2EXF+1MRSFokhBmh1oslOtW1d14cCnkG+f6M32feIyVq4qFDMx
         AECPMTHojy3l7HJYzwSO7l8xa029LQUqf94XpAAyB/VROcvW9IgUzMJtRjtOkmP/59Ez
         1urqQfo2J9Vl939x5vPZ/OXeuu3IP6dI1Orjvst+01UNOhQzsrBSy4TyRNJyyOE0CyOo
         EgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781343500; x=1781948300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSPcHOrJhwoZ6fKHrLRI2q23k/nKTvAXHvk0RF9YXD0=;
        b=L5CoRsIaipOHk+r8pBPudMcYuMvMtFDqADMDAiZUSyxy2e/jplItb+iMXPpi3dN3TM
         gdeuSBxXAWgE+MDInbe/2TAA3tlb8PbNOKTUyApg+DwARkau8TqIiRq8CTxXbPpQU7Ro
         Do/2l9K22J2pyIAlPvxpJEF5PWGVgol6dc1TSJRxnI/jByxCySQlccMWL48y6tWH74aT
         hUB6fmTAk/AUqSQrHQW+3IZ6wuTuDnVbmSDviZqcO/IzRnUdTh0Qv9mJwJjWBmfbIIzz
         NEKByuWl7wYcrD+9PEUKFyQtloRzhXRMtOZ7BJmyJFdFYKL7bX9UXJoURxscvm0LLwuM
         2K6g==
X-Gm-Message-State: AOJu0YxJd7AgiNFxoK6toeLsNq3r/Cgc/DHC0Pmn0OUmHial1GlR6TWg
	Zii6N4tY8yDPkcaxNkJQiJP++LQWYO2QwbMaUx2n+lEaZx+BSIabC5olW+n9kfCO
X-Gm-Gg: Acq92OH5BufAhbywjDHCF1+UhEiVoZQ4PFhljygWwJd47FqH0c8K7598u/MP1iQ+a3e
	DHF1P2gU6QI17n9+Pn6rpFdWJO0tYbdVgqPTBevP0sYtb0twnTzebcDtcC189Y8M78OQYTE3Xlm
	uuYaRbVbfMcKBYRMgT0NGaogVM6znHsTsDwMJFctmtWdVYzVUKJlKmLJ2CNw6M4sJqOdKScc2iA
	M4FKyBWW+Y3HdQiz8vt0kKGXhG5I/q9vAuQ1EFsRMxbp1Qzs5FPN0J2ROXWcAH0VXbIXPN450nG
	zRZ75KLmJriAhgZ4OdTTGEoraH1RR7nkz+WOiQGXap8S4mqZiZOab2zYEMSjoPGen7sIMv7bDt2
	Qfm+jMimFZMJ3d+qOxF6D4X8e5x2Bwpidc/6s3FfeD7+R4AVjx3GjXH8oCQjmJ8ZxWv73aWjG+x
	8HyKiuUCnIsDBzzoQXq5Otbp0TDDYazPi1gUz0ZXhUIkHM
X-Received: by 2002:a05:6000:2684:b0:45e:f228:830d with SMTP id ffacd0b85a97d-46077d40be6mr3398045f8f.23.1781343500099;
        Sat, 13 Jun 2026 02:38:20 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e592csm14464581f8f.36.2026.06.13.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 02:38:19 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Sat, 13 Jun 2026 11:38:17 +0200
Message-ID: <FE7Vh4yfTmGMM24i18Wwwg@gmail.com>
In-Reply-To: <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
 <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_023822_028591_BEDCD39D 
X-CRM114-Status: GOOD (  23.82  )
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

Dne sobota, 13. junij 2026 ob 10:34:42 Srednjeevropski poletni =C4=8Das je =
Alexander Sverdlin napisal(a):
> Hi Jernej,
>=20
> On Sat, 2026-06-13 at 10:22 +0200, Jernej =C5=A0krabec wrote:
> > Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das j=
e Alexander Sverdlin napisal(a):
> > > Add reserved-memory node carving out Trusted Firmware-A region spanni=
ng
> > > fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> > > itself passes the address range in the fdt to U-Boot, U-Boot currently
> > > only reserves this memory internally, but doesn't carve out the region
> > > in the fdt passed to Linux.
> > >=20
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> >=20
> > NAK. It is job of boot procedure to properly inject TF-A reserved node.
> > Any issue should be fixed there.
>=20
>=20
> like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
> ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
>     Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ? ;-)

I was against that too.

It's time to be fixed in bootloader.

Best regards,
Jernej

>=20
> > Best regards,
> > Jernej Skrabec
> >=20
> > > ---
> > > Changelog:
> > > v4:
> > > - new patch
> > >=20
> > >   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-a100.dtsi
> > > index 7cb06b19b5a5..d8391663fd1d 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> > > @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
> > >   		#clock-cells =3D <0>;
> > >   	};
> > >  =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		/*
> > > +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> > > +		 * This is added by BL31 itself, but some bootloaders fail
> > > +		 * to propagate this into the DTB handed to kernels.
> > > +		 */
> > > +		secmon@40000000 {
> > > +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> > > +			no-map;
> > > +		};
> > > +	};
> > > +
> > >   	timer {
> > >   		compatible =3D "arm,armv8-timer";
> > >   		interrupts =3D <GIC_PPI 13
>=20
>=20





