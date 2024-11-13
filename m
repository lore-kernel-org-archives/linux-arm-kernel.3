Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C6D41C2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km5VKNF+KUEDoH6tmM2tqgAPxy8fVSjcu9J5PorMtVg=; b=Q/vM4mAtltCntVPO4AdIW4x7ON
	Tgc/HcS9+lpvzCQROoIGtVjniBYPOcIkyLH7HX+DADT6X6Bjtlm4aSrCaKXkIdfCQGDPLv1NgZf7O
	W4vVgc4mqBGeAKMGfwXDqTb9G9J30lZ0n/NiGpHT3KFzJ/UuH1Y+Geq3NJavSzzYI8Zi0OiMkekjR
	Kpk8Zfe+Xg5NVH18vgLrox4pj+B44xDUvqyAY1f91Vr4rXFU5ubp3YAA85SLHSiwkmx5QYrPXlZK7
	JoHMKgaG4iWt5yJzAf4G4kS39X5cPtNuceh6XGCsBPqKB/xV+ndmtA3LpnxZ0pmCxDvcOapo5kc6b
	weWDjXkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAdF-00000006Rm4-0ZBn;
	Wed, 13 Nov 2024 10:29:53 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAPn-00000006PHx-0qPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:16:00 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ea07d119b7so54212727b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 02:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492957; x=1732097757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km5VKNF+KUEDoH6tmM2tqgAPxy8fVSjcu9J5PorMtVg=;
        b=khQMAYHyf8/RJAFoSQ5Zku8Vcib0fGEvAIg4wqSQC8dyfhgWyNTn8dviuIzb/pOf9R
         tvRkB0MzrJz7Tuohf/3NkHY4Qoe/nF0Zkls2muXtGkPSC4cu6fFmO8v/DnyxHLYQqXkH
         IIi+PlLRHx5r9u616B2j1Idr7wHjeBmzlmLuxMzoTLmHlTgkbyYGrUcmuW0WHiLslZyV
         zEkHMKMY6rhOrOjWCTkg/QF0kt7B7VSZt31Q9fkDASrUKp6xY8urY0xPAFBct2yKWOxA
         3YoQU4pz09DeBSk4PINwJSWnkol2Rl9xm86zYVGPaIe25Cp0ufgmkebjNU7TydwcZEvX
         INcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVNcHdIA90j2/y8h1ZpgHxSP/pdMjOgEPdfcJXxxnUQzML9K2eCm3HX+LwvTsmszyYdwyqw6u141sjLSxLPfsF@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxRp1Ys9SWk0rFKVCmKDFjcqc3r5mJAkf34X6lAMgEvC5mjuh
	Ra25kyyw9vPYod0jw2lbOBHMgF0zMWxYb8yACNhACS32Dw0qCABN63f/52lN
X-Google-Smtp-Source: AGHT+IGYC86BBTRBEmcRQ3EmMv6M8BOGoOLL/YExhSJHJYxIL1ukzA0kphKDTFyars127c5nnh/EMA==
X-Received: by 2002:a05:690c:6011:b0:6db:db51:c02d with SMTP id 00721157ae682-6eca468f55amr66483347b3.25.1731492957343;
        Wed, 13 Nov 2024 02:15:57 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eaceb65742sm30377247b3.75.2024.11.13.02.15.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 02:15:55 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ba45d67fso62999497b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 02:15:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtpuyjWQ8rJG1mPfNHq0fqs8ORihSyUWr25gLGiHQQmYBxukS04gEMhL8xj2FNLCiAlicjFYnZJOhpc9ulA73M@lists.infradead.org
X-Received: by 2002:a05:690c:445:b0:6e3:8760:29ba with SMTP id
 00721157ae682-6eca4c04f0bmr65699147b3.36.1731492955605; Wed, 13 Nov 2024
 02:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20241112-am64-overlay-bool-v1-0-b9d1faff444e@solid-run.com>
 <CAL_JsqJAQswTo2eWxLw62wqb-2i=_9W84_v_tW+TSW4kgNK3_A@mail.gmail.com> <288deac4-5387-4492-9e9c-cabf77b9c0ba@solid-run.com>
In-Reply-To: <288deac4-5387-4492-9e9c-cabf77b9c0ba@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Nov 2024 11:15:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUJ-nQkD-tm07uWX_TTy5Fy5JLsvedcoJ50Hi7=WnEpg@mail.gmail.com>
Message-ID: <CAMuHMdWUJ-nQkD-tm07uWX_TTy5Fy5JLsvedcoJ50Hi7=WnEpg@mail.gmail.com>
Subject: Re: [PATCH 0/2] of: add support for value "false" to of_property_read_bool
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jon Nettleton <jon@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_021559_264174_C8657D9D 
X-CRM114-Status: GOOD (  36.21  )
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

Hi Josua,

On Wed, Nov 13, 2024 at 10:41=E2=80=AFAM Josua Mayer <josua@solid-run.com> =
wrote:
> Am 12.11.24 um 14:46 schrieb Rob Herring:
> > On Tue, Nov 12, 2024 at 12:41=E2=80=AFAM Josua Mayer <josua@solid-run.c=
om> wrote:
> >> Boolean type properties are usually considered true if present and fal=
se
> >> when they do not exist. This works well for many in-tree board dts and
> >> existing drivers.
> >>
> >> When users need to overrride boolean values from included dts,
> >> /delete-property/ is recommend. This however does not work in overlays
> >> (addons).
> > As soon as someone needs to delete a non-boolean property, we're back
> > to the same problem.
>
> Properties can be reassigned any value, e.g. a driver default if needed.
> It should never be necessary to delete a property,
> since a suitable value may be specified instead.
>
> Booleans have two valid values, true and false,
> but somehow we cannot assign false, we can just delete the property.
>
> > If you want to fix it, you need to fix it for any
> > property.
> /delete-property/ is a language keyword used during compilation.
> When inspecting a .dtbo no trace of /delete-property/ is left.

That is the current behavior. But dtc could be modified to emit new
special __deleted_properties__ and __deleted_nodes__ nodes, just like
it already creates special __symbols__, __fixups__, and __local_fixups__
nodes.

> Hence we can't "fix" deleting properties through overlays.
> We can only "fix" (re-)assigning false to a boolean property.

So nothing prevents adding a way for a .dtbo to contain a list of
properties and/or nodes to delete...

> >> Geert pointed out [1] that there are several invitations for using
> >> strings "true" and "false" on boolean properties: [1], [2], [3].
>
> > There's always bad examples...
> >
> >> Add support for a string value "false" to be considered false on boole=
an
> >> properties by changing of_property_read_bool implementation.
>
> > Any existing s/w will treat 'foo =3D "false"' as true. It's an ABI.
>
> I was reading through the device-tree specification, it makes absolutely
> no mention of a boolean type.
>
> I believe of_property_read_bool should be capable of deriving false
> from a present property.
>
> What is up to now called bool in the kernel / device-tree,
> is actually of_property_present, or conversationally of_node_has_flag.

Indeed, so of_property_read_bool() is a misnomer, as it does
not read the actual value from the property, unlike all other
of_property_read_*() methods.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

