Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB1C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 01:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdPVyMeaiZRcAvUnLtrLn4eKjhsWSi1DSHgzYkr8RpU=; b=LeXrGv7NfsfLn0gnTsb1c/tXIz
	6r2kn6ReR7j/pSAnGF47ND4+SFx9Cu8rmwrG1c7GQ24KmrvsmggH/lpZ7jzulJKIUu1/HO6m9lI8o
	ZRgERyBi+RpNxBFdesvyhZdYCck7qxe++HbiDvocMwhypLpIDLdMbUMHxBQ/Qn/nZTCH2rdZwbjVp
	U6Y+xahQefY0pnKr7QKlNXYyL4x4t5W4jCFy3oDDJSgVObu+BhrjEIJaBmi8U9+qIVbBZbT3EUxqP
	ZkGnOx2k8ltH8AZDYFepW3iviM7edwRKK+CDiQmecBtNRzI2L9/3gwbC23gmVAXsO1t2mGIh/aZQp
	LMlWGTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxIy-00000003zTq-1gUs;
	Tue, 08 Jul 2025 01:39:32 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxGO-00000003zDW-0WIv;
	Tue, 08 Jul 2025 01:36:57 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70f94fe1e40so51296117b3.1;
        Mon, 07 Jul 2025 18:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938611; x=1752543411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdPVyMeaiZRcAvUnLtrLn4eKjhsWSi1DSHgzYkr8RpU=;
        b=O98Qe65Sfg2KbC6MZoK0UD7QNI6psbRjtHPhiOQ0DHlNZqucugIKnrT3Ga09VOF5UB
         k/b8xeKjVxlyiAyKlJCCJ698PWxeGsFCVk8hNM/b+Zo8GJvkxOBFXs7q3wD4AklLmiok
         3OoMKeSGQ1MUbHPmm8iVPSQ7KByScQnsqb042J2Tn8z16UfwxP7vx6pe35PUjgtBFBuO
         b9KPeDeGfmXqJMPCLW0c4DBlBUqzdSw158MqA0RCBJw+uPDWEV6IrKUUpA+md8fq7Veh
         76gqt0bjF8N++WcpNT0Cc3I/vajzK9C2Da3Nl1IGLkZVwVEBkr9sFXwJbU4xBVcfIuxW
         qm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938611; x=1752543411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdPVyMeaiZRcAvUnLtrLn4eKjhsWSi1DSHgzYkr8RpU=;
        b=NqZUp8vA/kNY1/35oTSIL4HDoDieaSdgE70CyhMoA+aqmjTiAjLtlAjd+RpgF0h53a
         artQ9pfyPPViLTYyBPP8f3Ig+ntOoQKdgX4kOW8YLSxkl/3XcmCYUlKBA+q9S13UBrl7
         vIAMj8CF8k23nmvc9uOzl8cWPgwSutQTKxhA99VsORbagwVNkcVrJXO7N37PqcxVjj6O
         /hTTQVVI9Ulj040/Fvh9YiYrHH5/TCfkhsomVjFm60/0iGXQs3UUuEO9NDKiFVUmmllj
         9DmrTIgicIfON9XDrfkaBNwsy3PzI9ZvKqzD+G4tqhLYNdX7zY14lKdS/9Xn+c/uikmR
         n4mw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ73JRNqjiwiQl6uoOKDMrOZHTa37djtv/btQ1jvEBRmPXQbfq7N42uCPQjo9okbSTdhZfNxsWWC2MG7aHz20=@lists.infradead.org, AJvYcCVqgRCkvCz29t2651HyxvtYZv1hT4EqE57AY7OuQsLbvuEkRkuWd9ALL+0FucTxvLk/vQ3i6V2L9V26CRT8XIQE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8H9+JWQaqmU5tac4g6bXSLdwbaJA0FBdmEOonwWziWoQ2mZjl
	6AMz+682SD9wIa5QZiqEPekraWto3KBZLSpUd36ulo13DVrBZmP8CdfDPj+NdOWyBsB65nLt/iA
	qpEqu7KAqXV7k+YKCE/J3UsbwQY5Xa4w=
X-Gm-Gg: ASbGncv7edxCqbA8diZguSFG7fYseg93csPh/aa9HzY0QxAMK+bV+rtSnkiIFERf0kU
	mGt46yzOVDMhhGr5dBTUH20qxT2B74X+QWzgwmGIvmSghPix6Klu4C86yWhAZkS6uBeSvGoYb7D
	B25nmX4SCQUkqoLL9ilIgU69jo+WRM3bX5L2rlI0EposBDDu6EGocAWUdo
X-Google-Smtp-Source: AGHT+IFO1Gnx5DoyCjQ11hDnHQ411dqNvWC7iyWPTVkw3YPYOqNHtqbngJRaccnYpOD1O+rv6jI0VYqZFUnmW4/GDEk=
X-Received: by 2002:a05:690c:6281:b0:70e:4d8:5cab with SMTP id
 00721157ae682-717a06d14f8mr12559327b3.2.1751938610962; Mon, 07 Jul 2025
 18:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250706214111.45687-1-rosenp@gmail.com> <20250706214111.45687-7-rosenp@gmail.com>
 <aGxyD3mtzdNZPPnx@makrotopia.org>
In-Reply-To: <aGxyD3mtzdNZPPnx@makrotopia.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 7 Jul 2025 18:36:40 -0700
X-Gm-Features: Ac12FXx7wdzhMSpG9qsFW5oZq8dvKPM90aqNfnrzqCYvgI2qkd94oIBt5lbPXeQ
Message-ID: <CAKxU2N8cLYm5if7TJ_YMnQ0V9n3E6GSk_F-tYkqOpNfeDA5a-w@mail.gmail.com>
Subject: Re: [PATCH 6/6] MIPS: dts: ralink: mt7628a: add wifi binding
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	yangshiji66@qq.com, ansuelsmth@gmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_183653_929919_F7C2F0DC 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, Jul 7, 2025 at 6:19=E2=80=AFPM Daniel Golle <daniel@makrotopia.org>=
 wrote:
>
> On Sun, Jul 06, 2025 at 02:41:11PM -0700, Rosen Penev wrote:
> > MT7620A devices all contain a wifi device as part of the SOC. Add it
> > here to get it working.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  arch/mips/boot/dts/ralink/mt7620a.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
>
> The commit title
>
> MIPS: dts: ralink: mt7628a: add wifi binding
That is embarrassing. I'm blaming my new Linux setup.
>
> seems wrong as the commit (correctly) touches mt7620a.dtsi and not
> mt7628a.dtsi (which would be wrong as the WiFi part of MT7628A is
> already supported by the mt76 driver and part of the device tree).
> Also the word 'binding' seems wrong in this context, you are adding
> a node to the device tree, not to the device tree bindings.
>
> I'd hence suggest to change the commit title to
>
> MIPS: dts: ralink: mt7620a: add wifi
Will do

