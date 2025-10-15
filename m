Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAEDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJmRJlu9H8wURlz4KPU2uyoao6Y2zyTwzoAnkPT6lmM=; b=qWG4JhkRLuF5EOwI/Lx2WEQKoR
	9OG7GXMNYHMQd35S+RD+O+MOW6+6o0pwCPnXAK4WCR7aBe3BEUlA3pqjfHmNiQCXPNhKFEUnpGPEL
	2gH7mCFv+WGvoLt+BkpPsJ0EAP/GmTfUZ2LJfQeETveVjlK1W+OPOAf/FSL3p2rZKZV+QLbol97W5
	zegV1ZSbmjjX4M+UUsCPYN0I5uT1WrXzLKl9B3+56QuF9+KxQot7R5bfXfC/4G212f7HPKssqjD4t
	vKSfaOb3eoLMvVhR2VlywGiyaQV6pxzz5QB2evBGOAvp6hDYI4wX+/bE6819FHPaRjQTJlmrn84ly
	kRpgkmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xd3-000000016l2-0v0l;
	Wed, 15 Oct 2025 09:17:05 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xd1-000000016k7-1WTB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:17:04 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-364bd7cce53so4453391fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519822; x=1761124622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJmRJlu9H8wURlz4KPU2uyoao6Y2zyTwzoAnkPT6lmM=;
        b=baHL7uLwLsZYZkmRxYOS8NNV7Jk0G+p7UkPoj2PTDbHZvhRDFKPz5XnrqZYAldxsN6
         7jeHLxKDXSoDUP3R6m/emq5OsAB2i7xOtoYmFBjpyGv22DlpwbEklHXXNO8yAY9L6mxS
         aYH3zbF81SDOqN5ypuknVtLI9wiJMijQYX17ENmlYjVByXCYuFOq1jqP4vkgL37UzVRk
         32bfbNmqbn0jD6JAZyCtyc4v61x84bh2Wglt2kPe22ehlMZSfXuxAHUdO/mH1xTdQBE1
         iIN5gJdN8eGZ31KZXG+e4dDDnjua+9xR39EtPivp8gwR/K2pQS9BkDyioiDFf+ZRyPRH
         I5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUhl5vcgsjCOu5hIqbLCm0kQ2MSoPkOuUs+EURGqTUcpnHJrS4jyJ1lBYh3wG2n+20NGYkBk8cQU25Itn11lMZ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcrj12xCUZyJFNaFJYkrfjYarU4G7bKIyCPBgc5vP6vVblt//+
	/Qbifue+c+xZKxkBr2YHZ6z4idLf6N0y/0pL33NE52FaJnjJrz1+v0X1u9Pc9/hN
X-Gm-Gg: ASbGncuaCnmSSwQe8WfFeI4qS2G27txJpjoWWK04FNXV0rE9bWIfC+Un9jDRJzDuCIZ
	1HGLpd90xf5veP5P2SfLaLadDpnaWmXK+Lx9Yx5uWHvRiqupSfAd9/xfmqVNSaL9IDopKYBqqad
	c+MGBeQoQptRXdr7wuPZ+V3dBRns+9JBZTxv++9/DJ8uPcipUT5yqM4WO1m/0E5yvMpZF0qdOg+
	ecoyCSEyjdRK/Vbd0ycGzm3QEeam3slu5Is5lwZee0aaMk3lii7tChAnpcYAXkFufJVi8k//JQW
	WO8GR0TdhErvgkdU9g+tSa91NtX1EIFLwP5YABjynpfMZ1XUhi+ALSKzI24ooNrAHhyR0tu8bUP
	La2SEDvHZKLTLKg09maXmkOwnqMqZ0NfXOCgH1ZSOB7p/bxGlGF0YKoViO0BJYNp8zrv/Jjtpt6
	EA5s7RVJnjNCAV8A==
X-Google-Smtp-Source: AGHT+IEh0vuepuH7/yiMsIVaJJss2RrNJx4jfVUenjKlPMyZqtyER4DWa15vNVyYUZ5A9pOpg8m0MA==
X-Received: by 2002:a05:6870:c189:b0:315:a259:ca5a with SMTP id 586e51a60fabf-3c0f0b2c436mr14214322fac.0.1760519821741;
        Wed, 15 Oct 2025 02:17:01 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c8cc4d3f55sm5062078fac.3.2025.10.15.02.17.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 02:17:01 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7b6d6a1e4e4so4109736a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 02:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVb0U/hi55l/XejiPJUlaM55YbieFFC0lvrHGRHmzflhbWGJHh0e8OJOvSRbs3ov85LIW35gohQBSrGDNGBAEwW@lists.infradead.org
X-Received: by 2002:a05:6102:54a7:b0:5d6:df4:4a9c with SMTP id
 ada2fe7eead31-5d60df44b27mr3945077137.38.1760519422390; Wed, 15 Oct 2025
 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com> <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
In-Reply-To: <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
X-Gm-Features: AS18NWC0NtvnYK5U9YXJyT8uG9UQFbJEFgUG9T-bnGHWW0_GW4mwUzABObId4Tc
Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Matt Coster <Matt.Coster@imgtec.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021703_402248_18E7C311 
X-CRM114-Status: GOOD (  38.84  )
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

On Wed, 15 Oct 2025 at 00:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/14/25 1:52 PM, Matt Coster wrote:
> >> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> index c87d7bece0ecd..c9680a2560114 100644
> >> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> @@ -13,6 +13,12 @@ maintainers:
> >>   properties:
> >>     compatible:
> >>       oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - renesas,r8a77960-gpu
> >> +              - renesas,r8a77961-gpu
> >
> > I think this can just be renesas,r8a7796-gpu; most of the devices in th=
e
> > dts for these SoCs appear to use the same pattern and the GPU is the
> > same in both.
>
> Not really, the 77960 and 77961 are different SoCs, that is why they
> each have different specific compatible. Of course, most drivers match
> on fallback compatible, since the IPs are mostly identical, see this:
>
> $ git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77961.dtsi
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:      compatible =3D
> "renesas,r8a77961";
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,r8a77961-wdt",
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,gpio-r8a77961",
> ...
>
> $  git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77960.dtsi
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:      compatible =3D
> "renesas,r8a7796";
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,r8a7796-wdt",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
>
> I can turn the first entry into renesas,r8a7796-gpu to be consistent
> with the legacy 7796 name for 77960.
>
> Geert ?

Please use "renesas,r8a7796-gpu" for R-Car M3-W, and
"renesas,r8a77961-gpu" for R-Car M3-W+.

> >> +          - const: img,img-gx6250
> >> +          - const: img,img-rogue
> >>         - items:
> >>             - enum:
> >>                 - ti,am62-gpu
> >
> > You also need to add img,img-gx6250 to the appropriate conditional
> > blocks below here for the number of power domains (in this case, 2) and
> > clocks (that's more complicated).
> >
> > These older GPUs always require three clocks (core, mem and sys), but
> > it's not immediately clear from the Renesas TRM how these are hooked up=
.
> > I can see three "clocks" connected (fig 23.2 in my copy, clock details
> > from fig 8.1b):
>
> Which revision of the RM is that ? There should be some Rev.M.NP at the
> bottom of each page.

Rev.2.40.

> >   - Clock ZG=CF=86: Appears to be a core clock for the GPU (3DGE). That=
 would
> >     make it our "core" clock.
>
> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
> core clock.

Agreed.

>
> >   - Clock S2D1=CF=86: Appears to be a core clock used on the AXI bus, m=
aking
> >     it our "sys" clock.
>
> This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock
> ? I think this might be the clock which drives the AXI bus, used by the
> GPU to access data in DRAM ?

Agreed.

> >   - MSTP ST112: Appears to be a whole module on/off control of some
> >     description, and definitely doesn't align with the missing "mem"
> >     clock.
>
> Maybe this is the "sys" clock, since it toggles the register interface
> clock on/off ?

Probably.

Note that both ZG=CF=86 and S2D1=CF=86 are always-on.
MSTP ST112 is the only gateable clock, and it is controlled through
the PM Domain and Runtime PM.

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

