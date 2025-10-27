Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A8CCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOYdLIvACytBpVHjrdATGnV0/c7ZzUCpXjvbRDnZ37c=; b=FgriWFuzpzA+9iSaj0t+Ps+q6m
	vusS/J8NBbUNBWMGm/9wN+x5nZkWowvlExoXluD4cwF1JnPZd+hxBHBwIx+6+2NoPzWr7/FaxXYvn
	9uyXZ1IxlFxJqvaGxP60lwSC8JBuXtN2eMWYk/OnukHeh0sKG6ciDyzoUs5RRH7DHH9jFYkVASebN
	tiMUUiV0kpACMWLuzQbzU7mQo022KZdgM8euVuhi/wutgPQQm+EDf/0+2FrPfjOsFXznUtHwVHHRe
	XafA/GOq+bW7Fx3+vmDeTKbzatLNRrsQzMRZE3iJLlL00OCBsjmn3ddUQl5bIV6SBxdNatZaYt/f+
	ErW8M+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMja-0000000Dw4q-1D3f;
	Mon, 27 Oct 2025 12:54:02 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMjX-0000000Dw4N-1vyk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:54:00 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54aa30f4093so1641306e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569637; x=1762174437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOYdLIvACytBpVHjrdATGnV0/c7ZzUCpXjvbRDnZ37c=;
        b=je/Ol2GtC/tpmI4B14e+6/n0kM8Slu8kSiacmu+2JwEffEDS9juUjiHX6AInDZOjrs
         4c5rniUYkRdQO/leK0xhE+8MEOUQCKGFvhsc10OvEI52FnI8QG6AR1KbqYf7Jag/9Le4
         C8HzmjathaTCMnWU/JuZJWvgjRTVulU4CA9Dr3GiKLc4/hQu1A4WroFbhbFm9Zz7CJIh
         Fpb6lwo+JS3MA+abOuDgJ9KWstGw7TpmLEgYPZaSLdQbgTzu8lGSmWwFRGTiGwuLCIeZ
         VcVm8mqGi28AQVrQZ43Z7kLwhG69tu5Uoa0/s0GCpLE3p2QmcS6sXrVSle8lkoN/rnMO
         UlBw==
X-Forwarded-Encrypted: i=1; AJvYcCWCYgMoGqqyhMGO6NmqGruSe4qjh1fTj079wf/2fwgaKFg8W8WeN2mO5wY3Nca73P5zV/A8dJa5agIzyY8/aKdl@lists.infradead.org
X-Gm-Message-State: AOJu0YyP8tbyRfBcd0eHzJxyIME/EASKO1ddw21P/5BgU3NU04ro9LCX
	zlmww+RuZlYkmD3a9va79A1CAh5riTuFTiHFl1JW62J99M9C14rEX6M7g9hVEM+6
X-Gm-Gg: ASbGnctprIfxKPXqSsWcEU+s2Wm0PaEG7ZJcq8xde2FNBAWia2rTYG/e1sDJmwyzAv2
	hOPWPivfIdt4Yz71s518NkWkzGw6P6EeJDO5O44tfuqI9gq1WWFZ7AUfBGOqBr8XQKx+HKXobui
	nm36LZJJGtpFuAJO6quxf+sATsWXb43TvbSUQ/RaBYDyO5kFhERe3XcnKveSp88eml0pAEXtqi+
	0gvC13wtFNLYTAu21KBU5CQ0ROqmr321YeXoGQnXLE/AvbCyGN8JsJxWY7w2Gb3NH2QwQ60Uqqi
	KFThEAvkNypFt8J9AGY0CTOwWTIxBZwSH0J8ctxcV8OuZGlzXrfp7+Gya9LNeWJht1SRFB/ZMGi
	wtIl96gk+BTGxYIy0zeVTd31y8V9owygi3JLr2IXCLMTHb5V8FwoNorOD6DDIJUTEQxaMoR06Uo
	TP6CUshPs7DiMhhpT5fcusxaRLrdC822NavGEXcQ==
X-Google-Smtp-Source: AGHT+IGbIyOMBVV+CGKO9O5oKPdw75JvkFk3rnlXR7m6Oe5ZJ7kPlmv1qeiZm4WVJTNH6+zQSNHamA==
X-Received: by 2002:a05:6122:d1d:b0:557:c0c8:5092 with SMTP id 71dfb90a1353d-557c0c85229mr4701933e0c.15.1761569637372;
        Mon, 27 Oct 2025 05:53:57 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac10f4sm2824322e0c.1.2025.10.27.05.53.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:53:56 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-932bf9df69dso1439927241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5jdQfeDyLGiiQJtgJO1l+FjqqkTZOaCqfB1XC4IE9Rp9r0ambeDSVY7QEAYLNMzbgUkZsDQ85mbq59kF9e64x@lists.infradead.org
X-Received: by 2002:a05:6102:26d4:b0:522:86ea:42c with SMTP id
 ada2fe7eead31-5d7dd5a64c5mr10674902137.11.1761569636629; Mon, 27 Oct 2025
 05:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251022070543.1169173-1-ryan_chen@aspeedtech.com>
 <20251022070543.1169173-5-ryan_chen@aspeedtech.com> <b5441728-06a7-44ea-8876-3a9fc3cf55be@app.fastmail.com>
 <TY2PPF5CB9A1BE626A2F0F6307461D8F64BF2F0A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <6a97fbb4-19c2-4ffa-9c73-26aea02c27e4@app.fastmail.com> <TY2PPF5CB9A1BE6CF8336D211641A18E2DEF2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <71df9bdf-53b2-45e2-a9e3-5b00a556f957@lunn.ch> <TY2PPF5CB9A1BE6F3E95C7FD61CF4F90ECAF2FEA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <fdbc471f-514e-4521-b7a1-dcf6127d64ff@lunn.ch> <TY2PPF5CB9A1BE6DD93D0F397C961D5CB5AF2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <01573262-69a8-44cf-ae02-2e9842c59dde@lunn.ch>
In-Reply-To: <01573262-69a8-44cf-ae02-2e9842c59dde@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 13:53:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAOPemhTjdJqminXhi+1+Dsc5rN1GLqAUcfF3ZyphRoQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnc0FKdJRTj1IhXsyeFKk3WmW431oeoaAfsizI36RwwOH6YiF14-6GD61A
Message-ID: <CAMuHMdXAOPemhTjdJqminXhi+1+Dsc5rN1GLqAUcfF3ZyphRoQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device tree
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>, 
	BMC-SW <BMC-SW@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Lee Jones <lee@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_055359_509220_934CCC70 
X-CRM114-Status: GOOD (  28.43  )
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

Hi Andrew,

On Mon, 27 Oct 2025 at 13:01, Andrew Lunn <andrew@lunn.ch> wrote:
> On Mon, Oct 27, 2025 at 02:42:01AM +0000, Ryan Chen wrote:
> > > Subject: Re: [PATCH v6 4/6] arm64: dts: aspeed: Add initial AST2700 SoC device
> > > tree
> > >
> > > > SoC0, referred to as the CPU die, contains a dual-core Cortex-A35
> > > > cluster and two Cortex-M4 cores, along with its own clock/reset
> > > > domains and high-speed peripheral set.
> > >
> > > > SoC1, referred to as the I/O die, contains the Boot MCU and its own
> > > > clock/reset domains and low-speed peripheral set, and is responsible
> > > > for system boot and control functions.
> > >
> > > So is the same .dtsi file shared by both systems?
> >
> > This .dtsi represents the Cortex-A35 view only and is not shared
> > with the Cortex-M4 or the Boot MCU side, since they are separate
> > 32-bit and 64-bit systems running independent firmware.
>
> DT describes the hardware. The .dtsi file could be shared, you just
> need different status = <>; lines in the dtb blob.
>
> > > How do you partition devices
> > > so each CPU cluster knows it has exclusive access to which peripherals?
> >
> > Before the system is fully brought up, Boot MCU configure hardware
> > controllers handle the resource partitioning to ensure exclusive access.
>
> Are you saying it modifies the .dtb blob and changes some status =
> "okay"; to "disabled";?

"reserved" is the appropriate status value for that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

