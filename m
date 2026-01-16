Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4322D47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 11:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tunLRA8cGG7n1tWyYGBPKMFj1K25wk5tyo1xF/Iy8M0=; b=iy+rRTL3XymrF9+a7SNXFK0eYg
	12q1J7zVeDoGjKl6BTYpVX3lBhHh9ACtQmnMblE9o4mZpsM8HpDdq4X38bRuCB6sXC5MkAr5AkvCX
	WFAKLuYJF3OjycIi/LyroZE0uZtxhfKPw6S7ljFmDhbLLWQeHBg5yzYAeU2pG37XVveMeQrgskVp1
	EU21YZ3dlrlqEGU2dJi2boW1Khn3mPIcw/6XgDThOyqJH9A+naUPF8qQEPH5GYVQs/w5N7LpYUIzx
	8wpjThc3syH8G4HTtod8fp0VqdJAgBg5Ftg+wMy2OA0ztOb3/dUUtCgSB5iU4Sp1XqFgMahui/Y3A
	FqN2JZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgi8y-0000000E3hO-2WV1;
	Fri, 16 Jan 2026 11:37:32 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgi8w-0000000E3ge-2LFj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 11:37:31 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12336f33098so1586047c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 03:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563450; x=1769168250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tunLRA8cGG7n1tWyYGBPKMFj1K25wk5tyo1xF/Iy8M0=;
        b=OX5a86duLZndRXSRZd5pvBL9jWCNTTP8zKeGWJhsIl5xa7Am2ivSGJOFaBhM68k3AK
         4PBCtcs3IhWdtJPLEiQMw2eR5D5H7YiI55+Pkr9auooxkCApX8noRNX0XWi+4Gm5ejRo
         TTPZmEk7wg3cKIbyCax5WkTjcdToUS+jLvxqlPndrhH6QmdRvRtSm4pRhe+AGsFLDxek
         ir14qAJU8V7hcOUakBb9IVITjZGa4ECn1epekZp0ENFcvaj6s8s1kKki9+Y0DS1UDzMV
         TsP3pfxcsfj47LCMAljWVeBMawgqnfYRJ50Zm+/GgjoC8NQa1NcaXbH97tSuWjy5Ec1b
         p/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563450; x=1769168250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tunLRA8cGG7n1tWyYGBPKMFj1K25wk5tyo1xF/Iy8M0=;
        b=eJg3uVu39NoaVau35wvIW/UnmJzsQziFPwhx82rfwTuTdyq7JlpJC4sBhqx2jA9y3c
         eVRspyzdBLvEvBsglMOzmXOoxRG6YNKbM+ZNy2mfXt39piKsp2zrcEm98SOOJ11vyMw6
         ER1ghsbc3I4YvNMTi4eK7dle8GS+jaOMecHV30dVQTkh3dVYxgVdqdLmhT1lY1iZnY5h
         HmawyiNc0eXNcgFJjTac7fY9XzuhIsy6w7Wu3lrf2SMi5MCtS5ZBmWDJ43xhn9NYf0p2
         A0/7vNLTnlZLLoxPIT/rPPKUu+aTHmXVG/vm+JsxTPY16cHIPwhULaKRl5ir65pgln1L
         dUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+/ioJcPlNxZR0RkP3rkTTWClGLWd3llt5gIP6x2bGpBs2Y5OFiL5pPCcJc4DYdDD5pV2TVwg/ZGai/+zZQyFK@lists.infradead.org
X-Gm-Message-State: AOJu0YwYdxbOjEJyYqP4rzKsxGulqlaIGOLoI3oS+Xh5T6ew5F691YET
	42S1hfv+5x6HOy3ILxA6KgICACXoxOAn9W+SF7TYDUnyI/AA3X/2Y2rvjxUH5Ie2R9zkpSNl34c
	8C6TFi2EtfyrWQq0wAcqEDWJq9lb0/6s=
X-Gm-Gg: AY/fxX7EWHKANXwD+OekvywYCqrv+qJ0b3wII+9GZfO9bctv0U/Ll8UQy/lt7CtsGF7
	BSRJUa6Sj0XYm2nReYN2azyXuCzV0VNNOmoVXddiBefKxwPrb3SuNPW7xtA+N/b7Uy6iNGb8ndZ
	e5cnriDQBhkLatJ2uHoBXekATiOh6fL7gXkXGahhFb5Q7tsJ588ejyL107KgZtXV0vE7lcxbdIc
	/CkqaTAYl7NSRh5K0C2HYSpoAoYd24pupC6TE/4qA7ZqZK57mEhShPwL3efC7o1QSyMssPpAgaf
	i901jtIaRuSSKyA87L/VxggyduThlificM6SRxoLY3ZOFi4MLHl7GM/2G4GFTUXEkbIa9nClt9X
	ALRDiTmPXFA==
X-Received: by 2002:a05:7022:1289:b0:11a:51a8:eca with SMTP id
 a92af1059eb24-1244b32e446mr1719538c88.18.1768563449581; Fri, 16 Jan 2026
 03:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
In-Reply-To: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 13:40:11 +0200
X-Gm-Features: AZwV_QgCFWkT1XPJWiN6BK-of6XJ3t5eGCfI_kP4aEIqHxCE_WCNGhfFIuQiRno
Message-ID: <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_033730_595716_3ECD67E9 
X-CRM114-Status: GOOD (  12.82  )
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

On Thu, Jan 15, 2026 at 8:25=E2=80=AFPM Francesco Valla <francesco@valla.it=
> wrote:
>
> According to the HW schematic, the CAN transceiver does not have an
> enable pin but a silent one. Fix the GPIO property name and polarity.
>
> Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support=
")

Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
So I wonder if it isn't
better to use standby-gpios instead of silent-gpios?

I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.

But on the other hand we have

static const struct can_transceiver_data tja1051_drvdata =3D {
=C2=BB       .flags =3D CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVER_EN=
_PRESENT,
};

So TJA1051 is not advertised as having a stdby flag.

