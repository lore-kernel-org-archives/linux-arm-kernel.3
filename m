Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC512D4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=; b=fo8Pl8LkQLcvzYK43X/tOZCtA4
	f+zn4I6x24aXEE1wLcOhLOazRdS/gvqAddFYYrQ2lXrLriuKsbNEYbves5pjY8RLRxypqp1EHABeg
	X33EXxB4jmm/3Tj83PzFZHooDy1FaTxfvA4YvDhMZ3/ZpRt/slpQ6ck/3hGEzU+utXUuVa+RiNNP2
	VhCIxHoQhJyJNKv0Fi91G9BqOa/LjdIiYpQ3EGyNkmDhrH99rQkqVgfJy8ir4dwF/W48GWkF3Nx8B
	VVJYEsEVcvj7fn3U0VoJgwY2JFgv7V/Ll0ahJzxMF4h2One13QhMeiC1+LWw2FA4MjMbze9gpwveT
	QP59i+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjdH-0000000E9vZ-23ny;
	Fri, 16 Jan 2026 13:12:55 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjdE-0000000E9ux-2c6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:12:53 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-121bf277922so2621576c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 05:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768569172; cv=none;
        d=google.com; s=arc-20240605;
        b=OVEvehybTKXC7huwzoNdpCtmmMglr0+OhUsftPQABpBIGpaLkTZec8/I5QlT8WC8zl
         N1IYxg488/g4yoR8o/+X5Sp0++kA/b2/NhqILD9EPQhLVvF0VnopbGwOV358pMR4uwde
         Qoof5G3tw6fnLukKa1e5bCqmnnJLbD/4DDv22xR+Kr2d1zsj6dWyIaO4U3UunmSwnNay
         T4UrtaPxN9C7bYaZ9A95W7FsUAlItS0qnQ6kP1RQyRapYRIQafgvY7xkR25Bqe1unljP
         zXqXPfLtClCHD7H4C+LUpItUVAzdmuPbmHagkseCRo0U/kDUYkVTyJ3e5wAC9Z3cvmii
         rjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        fh=yPL71qHVXM8nLxn0Q/qaBerxSy37TgFAX1b/kSSAciw=;
        b=gc3WE0PaW2SLbJ7g7ur8j6nlBNUkZ00p9FwTqPMClMTYR6qjekTdU/7geC1e9kJWi3
         mc6UKNvGPANUS/P03SNsqF9N3bGiWXylDO5DhHtNZUG0JkkyFPo6ySOVPjqMSh4syJ7d
         INl4jelIjnbPslyz4uRNBvh4l9QnanHpdNBuMvf/Cv6sNGOc5ScVvS2xbL2UOg+cX7vS
         p8ov+wqPUx5h31P2vm/x+sWLugqPxk+1bHzhf6wufaDiWXnXm3nvwfNUC3yCp9tiwLxR
         kHutPaOpPN0YGmmKVfBdCBsQtlehyjRhhLPZGAQo+0gsHQuns7vXIvAl7omrt99O9vrJ
         iV+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768569172; x=1769173972; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        b=UXUnd/CWukEF8+yylWdW72Dbe8H4daSz1rzg9OzJVvmMYScUGwx62kjI3x6Qsl5HdO
         gB/Ds0k0ee+Rg4srIIpOZX7KTx49i/BMH8OjrVTVp43/dQSFx3DBM6VGIaLPNyc8nPIs
         mlF9EvREgtEcWlHK2PCmTlrvvIZw03Njl4FBC/tyDfU1BjvayzHf2I50O3brCxvr035k
         7eLAyPCtDkZrj+Uekm7jp/rnLR1pIOs+ZMlFb8UtQom9taaeXuZ4M0wX+qVVlNldAbyi
         VRauH9zF0sFRchVQakzC7x8YhqYaXc6sb4VArfxrvkoi1UwZEugBvS07kBij/C0aVhmW
         zwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569172; x=1769173972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        b=c5YJKAUL3Bv2Y26v3ZVoPHyMyWHWzTSMhFXAhdmjJQgaleIYFAh10fNzX6o1mvnAor
         b/qhxV8c4MXnjC+N6+VSrA8o+Jq1ZJR5O8xTY4ID0SsvJxtgkoZ3pJjFp0pRg2xYG4AZ
         N3doh5gWqGTtw+8ADAVwjjU1VFqFZgTgOx3tfWC6ENzTgQKhYhEiChKBtEQS+puhwMGl
         qJLhWf6a3vd3l0SoQT8REvim5ZAWQG00KNQ0ahuNMWc1egGUhg/uF0ITeENMZOLe1rLW
         Bt7AkSg/uta9JDq4O3OkG7wafZ/mVbZxkeGDBS06VNe7+5VsFsKDewicK068zDtsmckF
         jLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq+Y56jG7URsAiZI/pXR6jZzB9Hf9S14672dpwUepdaZnab3BSxpbW7SgS1/+dy6B/MkGMLXGuLlhH5kU6ahxM@lists.infradead.org
X-Gm-Message-State: AOJu0YyHqYkafxwtcTxgXDPSCF64KSOZg1/XGZv89L/xzEXcW86KTK4N
	tpvv62xMtc+XhacSXndEqmy4qeNhT0nr7VdcLybskTlEbPmO38ReNj+a5zVg6NSK4cHF5pObVVP
	fyzG121cyuaECGH30TpZEgZKpU+IURas=
X-Gm-Gg: AY/fxX5Nf9Hw0NaH182/304VteMG70iDDysw6heKJtY8lE9p0v6rgQV5mfgx8tPVE5A
	XO2deqEF4YhEjK4RTzHi1ZzoPsBPOq5yyB+fRxTSpHNAx5CxemrKccRnvGupRNNIC1z33aEpDRM
	+oxFzv7DXPbOl6xdTReKPfejavWk0bxsUxWuWKhV7eKpd8lUARtsVuoeBuelkTQMYQ2lGzrRZQ4
	jkOKEXEQ+0VfsS8A8IUG0/AOgQZPWVNLdKY5iGKhgRiGYUzKIz2PHfTi9xpta1Lykoe/XgdnxGc
	QzXZgf+Cg6EDA6fvqJs7R6NXTkQ/aSqb5UBVgb2qQwstm00WXKciM12rzKvJg3aT31KhYJ5K65b
	3cq7STvQ8Sw==
X-Received: by 2002:a05:7022:618d:b0:11b:9386:826a with SMTP id
 a92af1059eb24-1244b37be53mr2062623c88.47.1768569171566; Fri, 16 Jan 2026
 05:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
 <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com> <aWo3PZni1Pb9T6FI@bywater>
In-Reply-To: <aWo3PZni1Pb9T6FI@bywater>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 15:15:32 +0200
X-Gm-Features: AZwV_Qhavkf8CkCe2llxYLM2ksgSNEeosl9zOuFKwiRZDMiSYX1oM1egYm13IpQ
Message-ID: <CAEnQRZC4QVV-AmMAdQHujTtJu2Lk8MQ=J3NRAFLQ1tZAPE6tOA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260116_051252_660137_346C35CC 
X-CRM114-Status: GOOD (  24.11  )
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

On Fri, Jan 16, 2026 at 3:04=E2=80=AFPM Francesco Valla <francesco@valla.it=
> wrote:
>
> Hi Daniel,
>
> On Fri, Jan 16, 2026 at 01:40:11PM +0200, Daniel Baluta wrote:
> > On Thu, Jan 15, 2026 at 8:25=E2=80=AFPM Francesco Valla <francesco@vall=
a.it> wrote:
> > >
> > > According to the HW schematic, the CAN transceiver does not have an
> > > enable pin but a silent one. Fix the GPIO property name and polarity.
> > >
> > > Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic sup=
port")
> >
> > Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
> > So I wonder if it isn't
> > better to use standby-gpios instead of silent-gpios?
> >
> > I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.
> >
> > But on the other hand we have
> >
> > static const struct can_transceiver_data tja1051_drvdata =3D {
> > =C2=BB       .flags =3D CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVE=
R_EN_PRESENT,
> > };
> >
> > So TJA1051 is not advertised as having a stdby flag.
>
> Regardless of the name of the net, the functionality of a standby vs a
> silent pin is very different. In this case, since the TJA1051 is
> including a silent pin (pin S in he datasheet [0]), I think it's better
> to declare it that way.
>
> In case someone adds the support for a phy-oriented listen-only mode
> (which is something I am thinking), this wouldn't break the integartion.

Makes sense.

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

