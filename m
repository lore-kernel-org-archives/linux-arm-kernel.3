Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA15C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxO/wb5SjqYKhirNQ57pk715Lm2Z0cnx8YRmXgpwJPM=; b=Id6hIpO5sfgMEhuUN3+PkhAHhL
	/DsUkbgMHevFuafsbSfnS1fMKTDzV8zLXnHix8N45kCLtkMT1DpLJQqhfnCa6BC8mPLgegKigm1MH
	JuESPO6PAwNYfkBHnBcGwOK9MyTZixyDKO3Y9gc38oqmUlxepT9bHZ5WCANHmzF38RiDLS1oOv40S
	yE09icdhgtoyy9lIge+NQEsfutgVM1+xyR5jhOE4R+xOXYAaHocWslOcHTpL7CO+ArjdrfFaFN1lH
	CwuWZ/RM3tZBksO4ikCdq/81GLfmEwpLQ6ZcBaP0T9EUirwGVgNmqcRIdPLYdtRqmVb4q+J3wm3Hn
	RV3oDhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM6l-00000002n7m-1heE;
	Fri, 08 Aug 2025 12:22:03 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLXI-00000002i9d-2evt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:45:25 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-88bc56adaa4so443669241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653523; x=1755258323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxO/wb5SjqYKhirNQ57pk715Lm2Z0cnx8YRmXgpwJPM=;
        b=m3tbUnhSo0uVzzaAMw5/H+g4iELtb5VDjzoFY/M6yK1wp/IjManV/0iYuEI3Pv9ccr
         D2jGyo8KWv+dfpow8mCrGvAZfXq0Yful4WVtThYDZKtcmchKI0nvo7FlvY9E6MLbllyc
         PtX1PFb8uwOmNjxNmjXvMPyUR4q5dnukljq7F5W4wWf+lNLEqZcHD7lwcfLlhS55J1Fn
         jZGaZjmJtzfijJz7YWlnlSD/vRwYpZ6VzGBetLzV+sUI3JaVaQde1+hHH98Wlzq2iB3g
         Np24ZiYejudH27WJZCYKfZ+rO67OUxBTY+GyPVU+tih9gN1KKsBkhtDTGQLj4OaTB0yl
         r3YA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ejMIgUkweebuERC8YzmIu3vPzdx0axj/us/mbHDKXthyUZYYNCRFVuDWzIW6ygKjLvLh3ygeViYvJohsXXX6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs2efX6H4KR7vaRV6hp58OaetyHFYTKcxHRvlSqsmRNrHKGANH
	KS1nPc+xd1+q08DrXtoGqzZV/k0lyll6CLX/umM3KDiPV2Qwsu8XTUOWTdq4iyH5
X-Gm-Gg: ASbGncsuNKhHgXUks9hjPZ1hPxRtOUi6z1yuWAHUtQeOm24ypXIzilajd55eeh5VGON
	3wT9aAopEDGVH9enQlaDrGxYje+IaJCXdHbW5P+ndUJ8SbUMSHKEYp+DvvYBzshQ1bpt/pjh/n+
	O/EPFCP8Kz0hQ/IPP+VybWQBRvby02t3sCtROPTW1Eni3cGCLw+hA4uzoxrzFGRcVzSdwU43C08
	f8jdjglu2j7uWvXo5IA6rrGekdPztJsSXgq8WadVcf6TxgwT4jMRNuOYzSqIDXR4yz9Lqd8Hu2P
	6tlz2sWskPd2ov6L4037+vJp8lYpkooqIfaJoP7CAN4ZcoxEgGtwD/jmDlUN/fy4QC03BA3zuMg
	TZ6/5lLSqTsi0ZtijKWoRgFhRGgmYtk7p0veAVi1CSUjxVocSThMTAq+OdAh3
X-Google-Smtp-Source: AGHT+IFmlV5mC6TyVV1lgFwXtWvWbPyPZLzooKTGeOWUseZWo96KwH4G7lHpSL09kM0lArfDYyzjQg==
X-Received: by 2002:a05:6102:b12:b0:4e7:f3d3:a283 with SMTP id ada2fe7eead31-5060f6aa3ddmr849314137.25.1754653523289;
        Fri, 08 Aug 2025 04:45:23 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e026e8c19sm735923241.7.2025.08.08.04.45.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 04:45:22 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-504dd871d70so647453137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:45:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU74SPBtUGrjFRGBRzLH+KVS2w6mZkjsfHkPSUhRgXgIRJiqjiHVpCJaObSAtKrO1132coIYBOrxgmj68GIheWP@lists.infradead.org
X-Received: by 2002:a05:6102:5ccc:b0:4cb:5d6c:9946 with SMTP id
 ada2fe7eead31-5060d2a74damr861831137.10.1754653521602; Fri, 08 Aug 2025
 04:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113464920ECAC2C3CB89DE2D5864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7c8c7a25-c373-452a-9fe8-8b2d92ddd885@tuxon.dev> <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467C09DF7D3D0D7833A6598649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 13:45:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmOaMo-2JfMmi7fOJxpVhL86U4PsWewrjk1z6hX6agaw@mail.gmail.com>
X-Gm-Features: Ac12FXz7HpF5HU5dBXnxnL240s782w9rEqQwz4F0XZ8wdldivob67uVHXOAVnQM
Message-ID: <CAMuHMdXmOaMo-2JfMmi7fOJxpVhL86U4PsWewrjk1z6hX6agaw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "lizhi.hou@amd.com" <lizhi.hou@amd.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_044524_671607_D25A319C 
X-CRM114-Status: GOOD (  30.37  )
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

On Wed, 9 Jul 2025 at 07:05, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > On 07.07.2025 11:18, Biju Das wrote:
> > >> From: Claudiu <claudiu.beznea@tuxon.dev>
> > >> Sent: 04 July 2025 17:14
> > >> Subject: [PATCH v3 7/9] arm64: dts: renesas: rzg3s-smarc-som: Update
> > >> dma-ranges for PCIe
> > >>
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> The first 128MB of memory is reserved on this board for secure area.
> > >> Update the PCIe dma-ranges property to reflect this.
> > >
> > > I see R-Car PCIe dma-ranges[1] and [2] maps all possible DDR area supported by the SoC?
> > > Do we need to make board specific as well there?
> >
> > I'm not familiar with R-Car, but if there are ranges reserved for other purposes, I think we should
> > reflect it in board specific device trees.
>
> Already Linux has this DDR info[1]. Linux provides DMA memory only from this region.
>
> In your testing, have you faced any issue like system allocated DMA region other than [1]
> and you don't want to use it, then the changes are ok??

Exactly.  PCI memory must be located in the intersection of
dma-ranges in r9a08g045s33.dtsi and the various memory nodes in
rzg3s-smarc-som.dtsi.  The latter already excludes the secure area.

> Not sure, PCIe can work on internal memory such as SRAM?

If that is the case, it should be reflected in r9a08g045s33.dtsi.

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi?h=next-20250708#n31

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

