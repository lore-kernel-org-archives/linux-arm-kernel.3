Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=; b=CA3i3vjbJ0yVipag8CgI9R4rCX
	bTIq4J8vrPCZOREu6UbC1aFgXKvW2+hznGKo4DSmzVVDbEhH82q04Phgv2lwbphZUs4EYFhjLsj22
	J//wFR+x6tcYHy04z6zHS26vQh19q9eG+/JSJA7IZ+O/vXgKZBq2LSFKSSErpvoEDqV/5FZLkrSdv
	aLPNLWMpUT9vQoOOp0u0PjkiORspVSP5yvJhmscx8fFvfDCN+rsKHmUDCn6dmrzAG12otNawlFYMU
	kiOUdvQ/tUB+Q9DsVvMd2YfeAmeqjdxpfTl/FZeeJQ6jDoIw7F3AJ7TYi3bZCuoV6TKvWipgj8FYZ
	2qd/3i0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLG23-00000005vHZ-2g2w;
	Fri, 08 May 2026 07:53:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLG21-00000005vH8-3DOr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 07:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=; b=SDoRnB/qEwdAp5v8op4rRvkR5P
	80v3p18OazQCWSzTjGLhNHJCTvVzKQNgd97TdUVwEkKa2wHZ/U4+7FD27O/Q0qsBU2hFA353isR7d
	210fZAXccFDLbzkLs/wISYVLs3tKm/ScF5B8Df/bd27qvDWxTJsMzcxIfb8pkJTP/onCreJDI1lMm
	hcFBOlcgGiWqr3nCnEH9qgrMwgHGMwiJxiv48dwXfSMQuKbUiyGgXv4zodBzT1o6mslyQaICnyAee
	8RXznQdv2epMIe/gROxSv/XgsL4EgEMvxstk/iMm7O3+mxI8ZjoJfmGNJXHzKImRVtkbHOBvfNgzg
	5VZQ0NSw==;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLG1x-00000005eC5-3vcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:53:56 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so1246228b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 00:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226831; x=1778831631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=;
        b=nV5//obOELcqfxDlYK1V8yl5T4rRHa0vAHO+cRTPlsUzOcrfi9Z7t4lScVdlmQSdUj
         l3teMdBPLa81w0CgX3AztrxcKpqrLrfZ7JZOUQFiASlFAsRiD5m61jc4pUsIrL4GN+lr
         HD45ZGUFJj/Si+rW7Ympvesjkhc6AGKAAa/gR5kNvGGn+MxDKKmhgymH0rBbzTyOHbBk
         +lf8F7mCiAn3idfZdzdAqnxh1mL7EgbtVrtYdBcRU6RSsDtn1PGhN6QO3/053AaFVWEW
         k4hSveizaeBbSjXhsk9ZOWpQmXf5WuOIHmabsnkZS/sZNmfjTg9Inki3bglttLBuQbw0
         l6pA==
X-Forwarded-Encrypted: i=1; AFNElJ/x5XsMzV1p2QED4C81BGG45BUio/vsAsqOx/LRO/80ZOCEiXrDcRY0BL3J0dmhUj0YHKOyEOGPaI0gIqrp2qwb@lists.infradead.org
X-Gm-Message-State: AOJu0YxzJUxaBYURR9wKA/JelF1CI9ECpiJ9S39gKeHG7iwWLNpy5kXO
	fUIJ14sFsXt+M2n9TkraEhj9ExJK2hmQdd5YVSHfFXBfgsYQKM5qQrX+c/JJLcjqD6w=
X-Gm-Gg: AeBDiettng8geP6yzQ8nlkTKNKkXLV5+WnBFwQx3aOVXHN6huqWGGO79Wbr1glMIJkv
	u0eV9jxWz0eKoCa/iF44UuKdXH+Glmw+o9BKeCPgrQDuBkwYLh1GG7D5P1jKMPfPbwSUd0v0oba
	ejfCBLuVKTx97Xi5UCNefTJOnOucEMYg3Rk1M0OX1PovOZiCeA4YyzXNhL18GUHisyvxrCde6dw
	5yu2QMiygpMiuY+xx+862B2d/mshXaCQDMl0yjYsQGPM/IDdLIi/JkKou2md5bhBClDEtb2dyEH
	OspTpBJz/6pRSOqYdaguvKlSUW6EHAaofenZX4wjaIbOBGkazLAdGGPqZpj2quX/UmrNDdtUmIu
	91/2yKCDNweJgd8UJQ5m8zuHaX6+ZiHYQczW75JiPc1kIB9eN347HLLqJfm84OQrAwBQ2u4PCXU
	xlBEr3TKi9YrUjyi0P/moktk/oZhzdNzSCCOp7yB+SvFWeXo6RneD/kD6QQaE5tpBi
X-Received: by 2002:a05:6a00:240d:b0:82c:20ba:1570 with SMTP id d2e1a72fcca58-83a5dd5c931mr11570663b3a.29.1778226831142;
        Fri, 08 May 2026 00:53:51 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f049sm13144269b3a.7.2026.05.08.00.53.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:53:50 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba856db1c0so11967565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 00:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BRoSALJ/p8571ek0Zo+g9w6HKG7M6d6DNifqiUOX31NP+MsnFDIW9k/cc5zWSFVtp7bg/wEmpAeRigTFafavA@lists.infradead.org
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id
 ada2fe7eead31-63128c11e98mr2184841137.7.1778226445710; Fri, 08 May 2026
 00:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
In-Reply-To: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 09:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
X-Gm-Features: AVHnY4Jrjqq6M3ZL6uO54VIlKGFRT3YU3BSC7jZzhSUGnVnDGxRcagGSeBzeNKo
Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_085354_479386_C762BF70 
X-CRM114-Status: GOOD (  25.49  )
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

Hi Marek,

On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet, or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
> Just one more question -- the power-domain-cells second cell and
> reset-cells are always going to be identical values, correct ? If so, it

Yes they are.

> would be nice to keep the description: aligned, and maybe even indicate
> in the description that those two values have to be the same.

I thought that was obvious (but apparently it is not)? The descriptions
are identical, except for the latter not explaining again what a module
number is composed of...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

