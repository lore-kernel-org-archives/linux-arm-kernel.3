Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D0D2B920
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RudDwhFwWStN6JbZYkm1Iiqw7nGOFEA0JlenCztLns=; b=c1Y5ytjE9Xnqre3K7t61KjkJe/
	UtYHVqjPdGNwQsnVGA3tFfJh4/IDaEhOID8+VRRZ5+nSX7vayyc8/coP5lx3SaZ7aBEdGSJf89bwo
	4CzoSNqWHGrkl7q02UWp4+ip0BxHy+hLjoxsVJrcb19FcGUs5/eV2kegblxWhERkNDm99jwfEt0cV
	n4tallzM/De64Gc49VajpSkWOeSKwG6XJJ2ZSIgaJYKDKd4reDdj5hw1HMcpdMrs7Lj1PFGrjxs8l
	b6srqpkunjmyd+lBWI7ZYJmX/6MfUD4RdVdXa1V6MyDn9snqr8KpJZX6eaka5xP4VKw/kyhHZuetO
	FLQCalmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JE3-0000000H3wS-1fTs;
	Tue, 05 Nov 2024 13:04:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JCM-0000000H3pB-0PgS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16987A429F8
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Nov 2024 13:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3EFC4CEDA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Nov 2024 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730811736;
	bh=LJBE4I0IMy7jf525lG/+ykCGvei5KrQcg6hhR4qOr3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TpG0MeX11BO462clx65JUfLsvq7mhYbF/8TSUt0yOb/+sflQ3T/k8A9Tp9FG63RuD
	 0636srl1MjyFyrhJc81qno/7J1qL+Mw5zrOHiBi72fuBiRN1KQ2iM+bo0HolczBHba
	 c7Uk7UP6R729XBO1at5dQ7HRh6W40mffJRYDbnJLBHQpGPQoVPKVKqf3qQ0AJguVXF
	 c+1bCIH1yj8fuZIYA/kHZ4fJ37aL3wZbWpVUbqicrQzs+vKZA8Z40vnynqYcP89Gbr
	 E6FhESgpjnUQE1vUIyasS2+0nzjEvzjuarJGYp2ekKOTE1Qe1hBKH20jbM4y/8iJHi
	 jAXlB6S3LBiqQ==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29218d34f8so4026577276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 05:02:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUp2bo/2jQkKAWixhayFSfW+eXFh2etj9UakcPmi97sZ+WVzIbw7qDvxmi2nQc6x1ukGQG/dCVVDMQZWdf0DXnl@lists.infradead.org
X-Gm-Message-State: AOJu0YzzSgun8bHbUci/Lt+UpZ4LGaYIqg62OPEK0iRAhVU7Zup8K3QO
	h7/RT1tjhAyeJIc9TAIVGr183pq99k0MBsCP4QHGC9SIM3FdsKW3zxC/uiplfpUT0gOspZpSJZW
	lEVWY9qbFV8O/fnumsRYabrbnMQ==
X-Google-Smtp-Source: AGHT+IFFLLbvPgCz9E48Dc4uvqtjg8zV3O4+z1GmI3+QqVk1B5G6UocOVyAeLNkYeXQF7e9enyX5at0Z8dFOlsu37pM=
X-Received: by 2002:a05:690c:9b04:b0:664:74cd:5548 with SMTP id
 00721157ae682-6ea642e5c1bmr128709737b3.1.1730811735520; Tue, 05 Nov 2024
 05:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20241007212434.895521-1-Frank.Li@nxp.com> <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
 <20241105083255.GA24194@www.linux-watchdog.org>
In-Reply-To: <20241105083255.GA24194@www.linux-watchdog.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 07:02:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
Message-ID: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Frank Li <Frank.li@nxp.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_050218_283208_0D09E064 
X-CRM114-Status: GOOD (  14.47  )
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

On Tue, Nov 5, 2024 at 3:00=E2=80=AFAM Wim Van Sebroeck <wim@linux-watchdog=
.org> wrote:
>
> Hi Frank,
>
> > On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> > >
> > > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. =
Only
> > > allow big-endian property for ls1012a and ls1043a.
> > >
> > > Fix dtbs_check errors.
> > > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> > >     Unevaluated properties are not allowed ('big-endian' was unexpect=
ed)
> > >
> > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >
> > Wim Van Sebroeck:
> >
> >       Any update this patch? Kyzy already acked.
> >
>
> Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>
>
> Via which tree will this go upsteam?

Your tree.

DT bindings go in via $subsystem tree. I only take DT bindings if they
don't get picked up by the subsystem maintainer.

Rob

