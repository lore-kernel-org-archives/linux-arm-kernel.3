Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCEBD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=; b=xqB7qxjTr8tMBaN4CPWBdCtz5o
	9mZ/0mOcqmZepDbr+0ON5KIUR6Yvu/RI929uihmEZlQopuJtTEhOFKV8ngyvTneyi9cnnR5iThDEG
	hcv8xfl8InuKAfSmfS9UC7cZUgya253XBjC/5zlhDzqB06SAH0ARpKOCePGCLLDBzvu3/2J/F9Tql
	sA1BoMVegxOjrs3AdVj0OYWOAKdlvEVyiLS1kCmKaT0IzZukG5GR1MoeQRxq8EZUinn6/2/bworYY
	lUxhUk0SuRiYO1Yh3953pMO5WADpfoz70D6Yr+anxkzFahFZ7r13+JJLFyk73rgC7ivQbKKHaFv4Y
	wpu8apCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6se-00000003XAZ-1i4w;
	Mon, 15 Dec 2025 11:36:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6sZ-00000003X7y-0Clb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:36:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b79af62d36bso643567366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765798596; x=1766403396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=rmxyBmMHezwy4MDDG1pNmcc0emTxWbS25LrXxqunauI9Tr6r8Z+D59pc3nJ1+PeLaj
         HwQ+fj4Vd7oS6PolgiKVGBpKEBAjBBCl4K7DX7IUyACgH9E81Lfc1bUArWkmWjoTz7bU
         4Pwpam67BMVSiHM4GWGkgCZzFgXNtuPwHZ42debaGHMXfEt+oH4J6gMbvhFX8ppn/XQD
         MX+fqC0usjqgp/PDQSKlTTd7y8YrVE5OypjwwrCV0/DeiVOjnTRYTbLwzWSDaXF27VBE
         wN6Qmr+27k/k8Gl5U1+1ATdPbRDt0oQ9jxevmu1gdhiTiASvQBIjYhcjo0HHOewrPV3g
         KjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798596; x=1766403396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Our2tTrLeS9+cKoDnOgCot+9A7UItxQonDfN3Zuzcsc=;
        b=k4evvFBMqMZXbbablTVIs97n35611onT+vUfWhJdm13ySXaiE8P9YRRmyp1/IQIy6c
         wsT1ffiskUfnsUTJb1y5QURTBy6MgO3qhYZOzh1KU5JCV/NxHNZH83qZcU33Ht1XW1Tm
         Ons+6YSJLlH5HQpCdA7u+x59ws4naY8blooWO6/nc7TvIWtzmL6Ptq/r/qbbzflcNqIE
         WCDpeWyTsCuoxpchOhW/Mi6tc1VhStWGWAczUecYz71e2cSoXF7h9gpXwxJeTKO9zVE7
         bGQCdEVL5mwoWC9P+RyVMzv0u29FZSFHa0zkNs3+c1y+CXQlf/YCWnwSOE3JtfLcCFZx
         axXg==
X-Forwarded-Encrypted: i=1; AJvYcCU+VEXwnO/PSyNfTq/B84YLW7304+Phv/62gpWlWrUeFt83thFLykTqBmohwTbLNFYN0LVT9UPm51yVMN90IizO@lists.infradead.org
X-Gm-Message-State: AOJu0YxkOeIxUXM3e+FjLtLJcvwKeT3zk9BSQ1qObKKARrnvRc/r/udg
	W1D6eYVZyMkUvhPeRRJ/T24y9hNPZGuJ/E/kbO2TWBRu0l6Ui6sv9UzSDmeyTzRYtIe4DHR9frq
	3xouabYfdorRrHONJI67c0d4TADABZEwVzaDSxLAwtw==
X-Gm-Gg: AY/fxX4iFm6lO0iPq/VubllaRin/Xl/LpW8XLULdmWHexEM7Nwxh6aPh1byDLEzFQdQ
	LAtiUT6ALKl7HfXq25A54zZxTgkEs+K88RLvlieTJgWXnysKW+ZUhg1YmwCMlmoRbdXUOUSzI9L
	yK9gj8i3HnEfW44krR23xAAnC0PXi39jcPbmLjY17xhDdQFcgqTl3BO0CzsIN3eaw5vnJxPXlyr
	5/R3XcX1OCKiuyer6IFsyN850CtzvUP6nxJmZtdpPq2sTyBgNCAQYJfJdzMEJlaunYqlI4j
X-Google-Smtp-Source: AGHT+IFe8rw0qhWAiH0mQoOljUOiqcSqb5gRs5qS5m8hogOLlJs+w47H8LQqQzDIOFZ44fMZWWGRbbSWXqIYIq4YXXE=
X-Received: by 2002:a17:907:9628:b0:b73:8798:3be6 with SMTP id
 a640c23a62f3a-b7d23665c4fmr1116568866b.24.1765798596197; Mon, 15 Dec 2025
 03:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr> <20251203-splendor-cubbyhole-eda2d6982b46@spud>
In-Reply-To: <20251203-splendor-cubbyhole-eda2d6982b46@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 15 Dec 2025 12:36:25 +0100
X-Gm-Features: AQt7F2oZT8D46ks79tXEN44Gcwk4DCt-08YRdCse_jKqK0ZpniHWAPSwJLfDHCc
Message-ID: <CA+HBbNGdd-u=4PtXZtirqRkFBhKwraa5gV-32QChDDjfVARPRg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_033639_100050_80CD0E84 
X-CRM114-Status: GOOD (  12.96  )
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

On Wed, Dec 3, 2025 at 8:21=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Dec 03, 2025 at 01:21:32PM +0100, Robert Marko wrote:
> > Add support for Microchip LAN969x switch SoC, including the EV23X71A
> > EVB board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  arch/arm64/boot/dts/microchip/Makefile        |   2 +
> >  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>
> >  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>
> The majority of devices in this file are missing soc-specific
> compatibles.

Hi,
I missed this before.

The majority of the devices are simply reused from the AT91 series, so
I thought it was not required to
update all of the bindings to add the LAN9691 compatible.

If that is required, I will do so in v2.

Regards,
Robert
--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

