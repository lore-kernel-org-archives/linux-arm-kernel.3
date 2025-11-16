Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39042CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=; b=GCLwtySHZcGSu7ry7IU0KGq016
	r1ms1TtDAz92LviM4yqUKrhrUNs8hOC2///SQ/l0zDShbcJ5iLtUzJ8l7wsRN7LUatp7v5qOQjT3P
	Ic058bOwjpBoMqe9PHmXmVbWcTLVbaQvPXDSyRLBhTXTVyWHK+qIEq9Lv7s/YGcPOxF6fsCJFPItG
	sZcm2xVISEv9ehNlJonVwMczoOH3zZP1I+eiMq84RSjQWhJyvi02zVvpokwukR34pVGUfqJgIVU06
	z5GvFpKkIMmIAWEkjcoBApbdLva0g+96HqGchUPAhpZXoU44AB+2EJwT6X5sGp0Q0brYmdjHhmKGM
	EvE4NTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbB0-0000000EaVQ-3KzH;
	Sun, 16 Nov 2025 11:44:14 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbAy-0000000EaV4-0xrk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 11:44:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b71397df721so476389966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763293450; x=1763898250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=BOnAnY13no7eWXADqBdhxR917GxIMmPjS9B/e9VT8xTG+aTnfYtOyFZd/8aadIlJII
         G6CfxnE5mrtWi58Z5acqrHbUQu8yRY+ExYwDaDy7kom0yaDYzLGrzW66ObHUj75Zd7m/
         +IhKsKp6aL6j2yCaMqKl1LfQpKBU222lZP6wwrg+YKiSaWZFUjaGa7plG4AMgUsRr1Tz
         qtjgkjYyKckAQrFEnRCFa2+zDO5xND7opc6rB9bO1eB3veCYrY3M9ysVTpr9ewnWPYrl
         jvQFSa5VCKy07gvsDpqSbV6a/rUvbWTT9xfnhI6vxJkEjMjKaY2INzObudTmsLY8oUi/
         diaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293450; x=1763898250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0FdCBKLZNmvA5H65lDRryOm2kL/lm5kmNUU93njJEQ=;
        b=fvX/EfdlbOOZgfPCzi6DcLl1+wKb7lDbIuL3zxtbKn4XJz/LWJ1B53+1wJyCFDBx+v
         uX+WqRTFA7oKLIhKSAkd7tUG8tQX0JsYERF+zQOTW9USu2ZGhInySVZw/UzmfzjPF2bZ
         2CD0ZUxOzZvsbBOLP3rFKlm4Y6kIQd7UI566wm2jfkxjz12O3rq0z7+HLK26Z5J7B9uM
         p7jSLbvatY5e0szsx2VHnKHOFmJgl1IgXtPR7CSelxI4yYh8iz2EVaEanx6gT31AXOUX
         vHAsS4DS39fNoh1O/qwyDgmCMVJ9eOfK65V4BJqkVFWlBUMM6NiDRzfctaIHVF8Y60kc
         DxSg==
X-Forwarded-Encrypted: i=1; AJvYcCX+630KztC7SPHI/nWPeD8gvd15HOMLEL+sfmOvBP4x6hj9+29iX+qkR+3sYtAqit58ec89d/J+ELuEzvxNTqUR@lists.infradead.org
X-Gm-Message-State: AOJu0YzPBJVIPGlxtqPBx9KbLUCEenhI8tr+5yCB0NCv0Au4EM5ZbINp
	BzLNc8L88CNiio0Mc/4uUp9+PxzZaJZxS+0uyhiDTgHeAAgt0jYk612E
X-Gm-Gg: ASbGncud843rxFHkEKFx1ykHeQIGlF1pPYg1X0scjpFOm2a20cfajfZfp2rKgc3+R6t
	M7jQSUtZ0gylNbEDx+8NGn3KRGZ0d/T2PekbNsuYs8rhyYdjTM7YgXw359n88AdQjZJ1HySg6eT
	vo+IgsRZIiuGKkzNYyf/dfMZVa8E+FagEkxa8zlMdN6IEzjHjg42z7+oYvx+c6iQjvvRm3p8Ids
	9MChFaPZHG57Musi9wn7eiWm7DotYUDkNJizVeetxYYOnn5EO/rrg616lA2CP6d19g2yG9bQCAO
	YAWGIckiAhWN5N0CSIiJ/tHHKazM3ujfLAiPN0ks8yMVWfWoNzmmtRq+GtMqs8B5md9GVdxH7V4
	ejUrJxxukGMRZ07y+g/kKZz6mcrxDkGEukom5GqqjP0b+RZY/wPBTdRnWNGVpagZGQdJe95k7wp
	7ob0pmwjQ1/eGjGwfKs7rlaxbeu/9ZHdQBKurpiQ7WGD1xJvBbW2yRL6GOIy/wZzAxGbqv
X-Google-Smtp-Source: AGHT+IF71fotOguLRbTRHhdoPXFXtZCCxjXGGJnugEk1v1pjxqWMpiA2cn4S56S/ok6Kp7QddGfEdA==
X-Received: by 2002:a17:907:fdcb:b0:b73:8757:68ad with SMTP id a640c23a62f3a-b7387577ab2mr403687966b.47.1763293450183;
        Sun, 16 Nov 2025 03:44:10 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm820527166b.15.2025.11.16.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:44:09 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 16 Nov 2025 12:44:08 +0100
Message-ID: <4691137.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
 <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_034412_314948_1ABF79CF 
X-CRM114-Status: GOOD (  22.02  )
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

Hi!

Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> > Allwinner Display Engine 3.3 contains planes, which are shared resources
> > between all mixers present in SoC. They can be assigned to specific
> > mixer by using registers which reside in display clocks MMIO.
> >=20
> > Add a binding for them.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/allwinner=
,sun50i-h616-de33-planes.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i=
=2Dh616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> > new file mode 100644
> > index 000000000000..801e5068a6b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-d=
e33-planes.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-=
planes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner H616 Display Engine 3.3 planes
> > +
> > +maintainers:
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Display Engine 3.3 planes are independent of mixers, contrary to
> > +  previous generations of Display Engine. Planes can be assigned to
> > +  mixers independently and even dynamically during runtime.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h616-de33-planes
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  allwinner,plane-mapping:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Phandle of Display Engine clock node
>=20
> You description is almost duplicating property name. You need to explain
> here how this device uses them.

So I guess I can copy commit description here? It is needed to
access registers from different core, so it can assign (map)
planes between mixers at runtime.

>=20
> Esxpecially that clocks do not go via custom properties.

This has nothing to do with clocks per se, it's just that registers
that driver needs to access for mapping planes between mixers
are in IP core which takes care mostly for clocks and resets.

Best regards,
Jernej

>=20
> Best regards,
> Krzysztof
>=20
>=20





