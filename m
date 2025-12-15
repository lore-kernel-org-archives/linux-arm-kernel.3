Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70759D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw+VWiqd/R4wFDIFdR2X28ZvT94yjzl0km0pBRnN7OY=; b=mJpeZ/H1QscSmWQHxJ9nzkYWuw
	rwcDq2rhEIYxCuevdY4PEDoWQ9S8FhPrEy3czBBbfqRbLhwbKtW0phBLepNUBi8q8zNqhyUxqDwNO
	edz62flPr0pE5cuevfkJd3fZShHmqEnmGRUnDHpZNSmshlSZWVuqh1i62VYQMWBhmVG3Os9NRk2FW
	z6r/QVgVvahLyxbOslmEGGRF8sw235qdq3Zhsa4KaOK97Wsuq8DWmNSCe2J1vHFLqRj7CB8itBtxV
	nvjW9kK6RBLYbBnZXsmJ6LWN6+alsedFtXWS5vBswoFUeZF23s2gjP/sDXQfvKEG4uSWjo7NECE7d
	YZANr/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8fc-00000003gzu-0BcY;
	Mon, 15 Dec 2025 13:31:24 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8fU-00000003gz5-0kad
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:31:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b728a43e410so552306366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765805473; x=1766410273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw+VWiqd/R4wFDIFdR2X28ZvT94yjzl0km0pBRnN7OY=;
        b=niFXesqHvK0huOydCa8MTFYDqHCqycSBbEdTDSqAeqiNH7uFxBNozcW0b28jPUHkwF
         KEZ9nwqdS8CVTnFXCZb+p79qAEXQQPAN8t0lrIH33jQ3rPYISdNlM/xA/XsxDkxE6+gB
         /reJhn9Rbi6xuPiZP1mnLt4Vf1qFsbbmIZ7Md9Si0tmOfQnz236UyxvIV34gynlZYHwe
         SLLd/68kCpylKGX8o6cdkWEoO04SYGxG2pCtDWGqMl/mofvbhv6UDOHJ5TNZ41Vf6toU
         ZpuiBA7Qwy5nf2Hnuss3dWZWvEtHG2ShH/P8EcUDiWU5KsGgbelxj4Vwh4Vu2OeEbcgQ
         pcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765805473; x=1766410273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw+VWiqd/R4wFDIFdR2X28ZvT94yjzl0km0pBRnN7OY=;
        b=YPkhgJxc9kADHcH9JU4ueG8x9lVrFZFkWI2oG6w8DlkJDCUagS2rx0zHHSYvglZEGM
         UBXE5niH26PKno4nxWYhoYzv3Vc/d0IvURC+UIjT+ABBhLKLi5akGfCVMo/qeR03md43
         Dtk4jJ7XGQX6IWP0vJYJW1qOTcqLD705JWw9JRw5X76ToQwOLr7wKv42o1mtnfTLmBrI
         PO2/mF5hDvwGcFSGp0PEB7XSvVNGIber/48wEF7hNzbCFogsvCAie0L19TJHfMNbsM7I
         C9y15OhIvQUKZG6Wa2dZxknRMJMGW/4cT5uz8fTLJG62Iewmc3nNh9/map3pVI6zdJco
         CJPw==
X-Forwarded-Encrypted: i=1; AJvYcCXITcFKfB2iQT0lU/zPlepZlHYH4yoil6UqabO2GGQ18UV4nWzOqIDhJYlNbJmUWTYyvRlpp4vAj0EHwNZQPAPz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq8GsPKjs22rEA3MIDoGAMjQ3/FQBo6EgOsASAhlsEeDtBvrob
	9zTFDLMXmN94wFOQ+KGYpTbJofPwYstRhc5aBEqR/r3Jy5gnasn7+FRQaNDeggomYKWTroM6Kdj
	/B6pQBT9q+Ax5B1vCIetyuOBgFWpgZnYKSJ/sSwnxYA==
X-Gm-Gg: AY/fxX4rNxVHStRWxEH5alNQaQWDIXIEGRJEB6P2Tgigdf4Lw4VCIEK7l/NZdvHuuKg
	ejRJ+zlzGQQYOlxSU4KNYYyb0kNC0VpLBiPKyh8av3mcM/7uI+vHaqdlmcnFf5zPmmgZauicdu0
	q76p8MXiu924ArY7YcStxDi42SXJ8y+mr4d9vKFDEvGsVsN+bSk4tOyxNqvRVBBMvQpTOIgEuhs
	LaB7vB4HDz3lSHIZwbtiHV1bM/AbapWEOQJ9HitpxWE8gBBgoR6HuLtkJ+L9KBAK34RuncK
X-Google-Smtp-Source: AGHT+IH0jOC7I2V4n9q5hO9cE+4qZGL5l0QgmCHa+z37icAIbpE4GF3fcjaXDt2pkrHPiEtG7N6pGTFx3A7hEnLj0+M=
X-Received: by 2002:a17:907:9496:b0:b7a:1bde:a01b with SMTP id
 a640c23a62f3a-b7d23d13da0mr931934966b.63.1765805473126; Mon, 15 Dec 2025
 05:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr> <20251203-splendor-cubbyhole-eda2d6982b46@spud>
 <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com> <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
In-Reply-To: <173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 15 Dec 2025 14:31:00 +0100
X-Gm-Features: AQt7F2riRZ6DJPf2Vnc_Dn8R65r6BvztUnfjR9AMbbKZbxLcNxf74LNl1xmAB1k
Message-ID: <CA+HBbNFzETiySdw-VuzMJx6vdhPU_3d_aU2v9eJ4-_OBaTn2mA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, claudiu.beznea@tuxon.dev, 
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_053118_283785_7C61D3F9 
X-CRM114-Status: GOOD (  19.89  )
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

On Mon, Dec 15, 2025 at 1:32=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> Robert,
>
> On 15/12/2025 at 12:36, Robert Marko wrote:
> > On Wed, Dec 3, 2025 at 8:21=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >>
> >> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> >>> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> >>> EVB board.
> >>>
> >>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >>> ---
> >>>   arch/arm64/boot/dts/microchip/Makefile        |   2 +
> >>>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 +++++++++++++++=
+++
> >>
> >>>   arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
> >>
> >> The majority of devices in this file are missing soc-specific
> >> compatibles.
> >
> > Hi,
> > I missed this before.
> >
> > The majority of the devices are simply reused from the AT91 series, so
> > I thought it was not required to
> > update all of the bindings to add the LAN9691 compatible.
> >
> > If that is required, I will do so in v2.
> Well, history told us it was better (in addition to be required by DT
> best practices). Indeed, even if the same IP block is used, sometimes
> integration subtleties pay game with us and a dedicated compatible
> string saves us.

Ok, I will then update the required bindings and include them in the
series in v2.

Regards,
Robert
>
> Regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

