Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE99D41C38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoVwZM5PK/KUvFOBHI86j/rHYVrm+oOdI9cHG70GtxE=; b=wurosJZKoED3AOOOJYH3/vnwZU
	UrTYitXPYAZud+VSO4rFSmhjl26V6ys5vSoLeubiYCriDRWOfXHGLCR1DNnF8AlTF3LoRx7oFMMLH
	2+fEC93QYItyDqcQKgxLPu1HgIN1EOOVZ6IdKENVcZgGe6U3av7xSYByvdcncFKM5/Kjr5nQl60Ul
	jZcyJD2tJiPxCiyiZJgZMVXk5UprcN9a+arC53hxlFp+M8r5xwTx1vgaHMiQpaQKUvLpLcunig5l6
	DyXghENfr0nxGx1Tt0Uhuqi2DN8E+2LWL9fBSaWSsTpNyDPC0Ewg/2XbuyZ/B2fZi+yie9CJLjK7+
	K+3ClaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBPC-00000006ZpN-0nSH;
	Wed, 13 Nov 2024 11:19:26 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBNO-00000006ZZF-32nQ;
	Wed, 13 Nov 2024 11:17:36 +0000
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso4517443a12.0;
        Wed, 13 Nov 2024 03:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731496653; x=1732101453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoVwZM5PK/KUvFOBHI86j/rHYVrm+oOdI9cHG70GtxE=;
        b=IG9xzqaWHBQwGa5Un+oZ3GxOA4pEd8daQ7nATgFkof/n35O3fb8DPNF4DnTkNUKX6E
         Yjwp+N2i5cozMlaQnmTnz9vPhddPVgg1RjiXoMuJIJ24j0hi8uDQgpfufSFtgTq2PAvE
         ZATdQ2WBedZxtEhWllR7wesJFpQCUf+9Ka8UVNnIOMf70gosRoyy7R8BmZnzi6OgBDWH
         P7fa3FhgrHt435SiyLJcRRzcI5gdejFKOBwuDzGtxvI6HwmEyE1kNZoCQUYaEiwHq6CQ
         ENC7OnDCHZBTNs4LTD6d++LUevCRw4j27GlJUn7wVuR+QriMjFobTEdVS9UMTR3UG7f1
         dwhA==
X-Forwarded-Encrypted: i=1; AJvYcCU02I7iE29z5tB1I20fdAIyRMnXikoJgzGJ7J7Lg9IYhLjR8ccWcGUTcifMiDrDUDs8vrM1v+kjpyidDAUETWrt@lists.infradead.org, AJvYcCW8FUOM0dtGaDNDciN35CUs0PqiFGbz9k7uyYSxomzr6owULw6lT6VjYJnrll55Bi33cc3HM8brEd6vQdLsWvA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKnrxrNO3/QgbHQhkYIIuue951GJwrglNyMfh2iujPfCN0F+9j
	yYGaZpmPVvfNDPp356HzglRYAOrdpW+2TeXTxwZ3eN9rwkSjNp4ns/cagtVs
X-Google-Smtp-Source: AGHT+IGxch5r+AmptspRc9tOqjYnt7QUEgnomn9SiPf7rZlpBETYpMYjlLGBYPOPuRm3fD4YHUpEdA==
X-Received: by 2002:a17:90b:35c9:b0:2e2:8fb4:502d with SMTP id 98e67ed59e1d1-2e9e4adeffcmr8417078a91.16.1731496653343;
        Wed, 13 Nov 2024 03:17:33 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3f4fe47sm1218214a91.52.2024.11.13.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 03:17:33 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71ec997ad06so5640433b3a.3;
        Wed, 13 Nov 2024 03:17:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUN65E4wtVgGKmi2MfVRocrGyyEv9j7oZff0rO7MAB5kcQETty68cWPJQ8XOeS9pO+9VkhnGXjPBw5Slw5udMfz@lists.infradead.org, AJvYcCXY7whX3vDyaT4xe1BUVLR7hQ7nA1WMYKICYmtkk45I1MLEdYthiKvV03ySi+Nwha5lWSbF217w/FJ+LOovBts=@lists.infradead.org
X-Received: by 2002:a05:6a20:a125:b0:1db:d83e:df34 with SMTP id
 adf61e73a8af0-1dc5f8cc25cmr7381994637.8.1731496652970; Wed, 13 Nov 2024
 03:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se> <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
 <9330ebb370780c001fd2aaee49aec9e8@manjaro.org> <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
 <0eb19e4daf2cdf3d4a04935876c3d3b0@manjaro.org> <CA+Gksr+E-tZe4sKVNa8zpATwdTW_DiOQxOf_Jujf5SURzhSPSg@mail.gmail.com>
 <dc628e6e50239aac65a4424738000612@manjaro.org>
In-Reply-To: <dc628e6e50239aac65a4424738000612@manjaro.org>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Wed, 13 Nov 2024 12:17:20 +0100
X-Gmail-Original-Message-ID: <CA+GksrJCJRW43ex8u3hD-aQ7YdDrTtaNRXGjer6ROFh2N8P3XQ@mail.gmail.com>
Message-ID: <CA+GksrJCJRW43ex8u3hD-aQ7YdDrTtaNRXGjer6ROFh2N8P3XQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: Dragan Simic <dsimic@manjaro.org>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031734_787114_04ABFAF3 
X-CRM114-Status: GOOD (  34.65  )
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

Hi Dragan,

On Wed, Nov 13, 2024 at 11:38=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> =
wrote:
>
> Hello Tamas,
>
> On 2024-11-13 11:24, Tam=C3=A1s Sz=C5=B1cs wrote:
> > On Wed, Nov 13, 2024 at 12:25=E2=80=AFAM Dragan Simic <dsimic@manjaro.o=
rg>
> > wrote:
> >> On 2024-11-12 22:04, Tam=C3=A1s Sz=C5=B1cs wrote:
> >> > On Tue, Nov 12, 2024 at 4:07=E2=80=AFPM Dragan Simic <dsimic@manjaro=
.org>
> >> > wrote:
> >> >> Please correct me if I'm wrong, but isn't this UART supposed to be
> >> >> used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
> >> >> form of a non-standard M.2 module that Radxa sells?
> >> >
> >> > UART8 is supposed to be used for any radio module connected to the M=
2E
> >> > connector.
> >> > It will typically be responsible for Bluetooth or BLE but it could b=
e
> >> > 802.15.4 or whatever. In any case, all wanting to use it will need t=
he
> >> > uart8 node enabled.
> >>
> >> I see, but I'm still guessing what's the actual use of enabling the
> >> UART8 when it will remain pretty much useless without the additional
> >> DT configuration, such as in the WiFi+Bluetooth DT overlay that Jonas
> >> sent a bit earlier?
> >
> > The actual use is device enablement.
>
> Hmm, I'll need to think more about how it fits together.
>
> >> I think that the UART8 should be enabled together with something that
> >> actually makes use of it, which in this case unfortunately cannot be
> >> automatically detected and configured, so it belongs to a DT overlay.
> >> I'll get back to this in my next response.
> >
> > I agree, bluetooth blocks dedicated to specific modules should belong
> > to DT overlays.
> >
> >> >> With that in mind, I see very little sense in just enabling the UAR=
T,
> >> >> without defining the entire Bluetooth interface, which AFAIK produc=
es
> >> >
> >> > Defining a bluetooth node would hardwire idiosyncrasies of a given
> >> > radio module's Bluetooth core. Sure you could add a sleep clock, all
> >> > kind of sideband signals for wakeups, reset, power down, etc. But he=
y,
> >> > some will use them, some won't. I think it's undesirable and
> >> > unnecessary. You can hciattach from here and most will work just lik=
e
> >> > that. Tighter integration or anything special, module specific on to=
p
> >> > should be handled individially, on a case-by-case basis. This is a d=
ev
> >> > board after all. I say trick of all trades.
> >> >
> >> >> nasty looking error messages in the kernel log when there's actuall=
y
> >> >> nothing connected to the UART.
> >> >
> >> > My dmesg is clean as a whistle
> >> > root@rock-3b:~# dmesg | grep -E 'fe6c0000|ttyS0'
> >> > [    0.344818] fe6c0000.serial: ttyS0 at MMIO 0xfe6c0000 (irq =3D 26=
,
> >> > base_baud =3D 1500000) is a 16550A
> >> > What kind of nasty errors do you recall?
> >>
> >> Those would be the kernel error messages produced with the Bluetooth
> >> DT configuration in place, but with no SDIO module installed.
> >
> > These are the kernel messages related to UART8 with the uart8 DT node
> > enabled and an SDIO module installed.
>
> Out of curiosity, what M.2 module are you testing it with?

https://www.u-blox.com/en/short-range-radio-modules#Host-based
and some more you don't see here.

Kind regards,
Tamas

