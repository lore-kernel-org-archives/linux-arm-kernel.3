Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185D7CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn3HJmw1LqF1sl88KtOEIxVUxtlj7baFmpOOANtcNAA=; b=G1y8c5cPOH0qJEatiqhvTFZqDQ
	PbsoJzzRCQgi8B80pX+zS7BZqbZFTQSIcDu/zauCFIEd/aCrCsfWePEpKDXNnhj5hRvidXDgCirPD
	p74KBLd/0YFLVK5YLzGDqPSShISfGV8PRHwoxH4idIPAm7/o+27zcLUhPmhg8LtOz8bK1u9UyDsb/
	dk4wDhLDaFKSbngH/eDLe9+Texn0jCZyPlCWt4tu+CbwOAidjGV52SSRs+LwkozN/KY6gvD/fZcMm
	hxVmxQDboiLTNCDGWu4dNf4EFmj8rPWqSda75Vo85KHLG276MG0ObYkM0RtKufTCSRNGnrmMG0CXA
	rxi2OPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2qs-00000000aEX-0gdK;
	Wed, 29 Oct 2025 09:52:22 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2qp-00000000aDX-2lbV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:52:20 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bbc2a8586so2589334e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731538; x=1762336338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dn3HJmw1LqF1sl88KtOEIxVUxtlj7baFmpOOANtcNAA=;
        b=BUfNbZbi2EB24qgjMav8cPbq9OU6BCJP/26aZinK3XeKIlOnei993IdBgb5LVQhjVc
         vTO2oNhYhegYw+fCraTZAOdgzoNl4ywJi4ZZ+1Sax0qnFdfvJpnwIVrhvlAfExZhC73K
         nRtn2MuxFQsPwhKn8tBwkeaNNQ9lNKupv5cmZZYWfBkHjgA//rT+uVytvAxaI750mAD/
         d5AR0hT3hiTvdV+H54rGwwPZWuV3tQeQ5YOZwwgrPNQZCvEjUg7hiSslQVuudMD3VSXc
         S2dSdXV70afffkvyzo7Hjgjv/36+GwR0a/2WNMvtNBqTMJbKKLJ+Xvvz4Pr9S5CbhlDD
         e1lg==
X-Forwarded-Encrypted: i=1; AJvYcCUPnCWkF9+8tTvbRKezAYBmnIJg97hPmp7v3u9V7APHYJ9uj0tCJKqkKaykkYH1sLcC3SJHlI7/kVnRQb74Z4mn@lists.infradead.org
X-Gm-Message-State: AOJu0YySVJc4pR+jBYZ8aglZE9y7z1PV3dJ9h1Q9BoiHohNuLhoXZN3j
	HahYpXyMGji+wuVvOdWL/KPnTtXf/AEZdOG/dxZfM1DDL30qT4zNeuWcG4L/PITA
X-Gm-Gg: ASbGncv1VycjfDh2Ml1TeqqelQSgs9BA/nBgSdZ1siEgsJeQZueEcNtjjHZk1dRbAKY
	VcgVlcUmKrnjffaNOuhBKMzJ5Im0KsyUvYk7bQdZKRT2PcQ4D5A3d8mGmuIfZUvdzjs101/74co
	W3LGGt6m0IXqc4Bq+tahwRDq4ZuuZYCW5YhhaN0/Vx/a/pMtFElQ3euC7aRUg1VpJQgQyvae3yl
	ubuoV3lO/sCCjct14wmhaRmmXXsm3PcNOoEe37DxYmNvm9jMTlGavNn+7flSd1ZP1dl7Y40V/Bq
	oFXZ5UCUKTAukbZ3q9/6fV/j3R7NSt0YJNOXtwYX+bJWk2r4RZa0LmvkiFiZ6hpEI8sNjkp6G/W
	iplTb1cRcmqMCDQFp0vCjWWFs6eQ3oj5jDpFNTQy5pK1+zqVUw1Nb056kWEx514ksg9E52eLG4i
	M1ekTjZuEKnH6ojSrWoeMGuEyUWQQbqOk5rnQ4r3vx5Cx81WOVado6
X-Google-Smtp-Source: AGHT+IG/GNbg1uTZvYZwIw6c9VfCaWoxL23T/MNPbagPkQ1zf5jB+UmCN2VVTmfSp4fiN4HG8jwlFA==
X-Received: by 2002:a05:6122:221f:b0:557:c841:14dd with SMTP id 71dfb90a1353d-558142aa381mr566948e0c.16.1761731537996;
        Wed, 29 Oct 2025 02:52:17 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac10f4sm5194728e0c.1.2025.10.29.02.52.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:52:17 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54aa30f4093so2580493e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUylSYNpCc320p0rB7d+h463sTGnAvIgucy17RRipRfGnEQo61d64l+lKKB3iH2UK5irH7eU1+GlP1OOY4ibI1Y@lists.infradead.org
X-Received: by 2002:a05:6102:942:b0:5d7:de89:ddd6 with SMTP id
 ada2fe7eead31-5db9057bad9mr557441137.1.1761731536861; Wed, 29 Oct 2025
 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com> <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com> <TY2PPF5CB9A1BE6CF8336D211641A18E2DEF2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <71df9bdf-53b2-45e2-a9e3-5b00a556f957@lunn.ch> <TY2PPF5CB9A1BE6F3E95C7FD61CF4F90ECAF2FEA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <fdbc471f-514e-4521-b7a1-dcf6127d64ff@lunn.ch> <TY2PPF5CB9A1BE6DD93D0F397C961D5CB5AF2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <01573262-69a8-44cf-ae02-2e9842c59dde@lunn.ch> <CAMuHMdXAOPemhTjdJqminXhi+1+Dsc5rN1GLqAUcfF3ZyphRoQ@mail.gmail.com>
 <TY2PPF5CB9A1BE6D0FC241696E44EB1F463F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
In-Reply-To: <TY2PPF5CB9A1BE6D0FC241696E44EB1F463F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:52:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKsyt_bXaJ=smtCaGst_5O2trQakxmaKp2K1Jzc=Y9uA@mail.gmail.com>
X-Gm-Features: AWmQ_bnPsVrgzrwpS4yuU54P6rGfuwJuhD3QhZm5C-G0nVGXJf4URRbbI7AGLcc
Message-ID: <CAMuHMdWKsyt_bXaJ=smtCaGst_5O2trQakxmaKp2K1Jzc=Y9uA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device tree
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, BMC-SW <BMC-SW@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_025219_712164_318EEDC5 
X-CRM114-Status: GOOD (  32.39  )
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

Hi Ryan,

On Wed, 29 Oct 2025 at 03:38, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> > Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC=
 device
> > On Mon, 27 Oct 2025 at 13:01, Andrew Lunn <andrew@lunn.ch> wrote:
> > > On Mon, Oct 27, 2025 at 02:42:01AM +0000, Ryan Chen wrote:
> > > > > Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial
> > > > > AST2700 SoC device tree
> > > > >
> > > > > > SoC0, referred to as the CPU die, contains a dual-core
> > > > > > Cortex-A35 cluster and two Cortex-M4 cores, along with its own
> > > > > > clock/reset domains and high-speed peripheral set.
> > > > >
> > > > > > SoC1, referred to as the I/O die, contains the Boot MCU and its
> > > > > > own clock/reset domains and low-speed peripheral set, and is
> > > > > > responsible for system boot and control functions.
> > > > >
> > > > > So is the same .dtsi file shared by both systems?
> > > >
> > > > This .dtsi represents the Cortex-A35 view only and is not shared
> > > > with the Cortex-M4 or the Boot MCU side, since they are separate
> > > > 32-bit and 64-bit systems running independent firmware.
> > >
> > > DT describes the hardware. The .dtsi file could be shared, you just
> > > need different status =3D <>; lines in the dtb blob.
> > >
> > > > > How do you partition devices
> > > > > so each CPU cluster knows it has exclusive access to which periph=
erals?
> > > >
> > > > Before the system is fully brought up, Boot MCU configure hardware
> > > > controllers handle the resource partitioning to ensure exclusive ac=
cess.
> > >
> > > Are you saying it modifies the .dtb blob and changes some status =3D
> > > "okay"; to "disabled";?
> >
> > "reserved" is the appropriate status value for that.
>
> Thanks for the clarification.
>
> Since the SoC-level .dtsi is shared by all users (potentially other platf=
orms),
> I don=E2=80=99t actually know in advance which peripherals will be assign=
ed to
> which CPU. For this reason, marking nodes as `status =3D "reserved"` in t=
he
> .dtsi might be misleading.

Sure, not in the SoC-specific .dtsi.

> I think it=E2=80=99s more appropriate to keep all peripherals as
> `status =3D "disabled"` in the common .dtsi, and let each board-level .dt=
s or
> firmware-specific DT decide whether a device should be `okay` or `reserve=
d`
> depending on the actual resource assignment.

Correct.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

