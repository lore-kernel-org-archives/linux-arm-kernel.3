Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209CCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=; b=eefqsxNAFziNthWk2NOuunFZCk
	gNkN1zczD7a5UPN5e3DfsuuAIBatDXjT4dCao2HTKhjLr1n/c9qF+Erk0nprxMxp8rrCdQadzNmns
	iBIr/EhftLyzoWTdj6VeGQ33dJ/ZZxNfqYb8isKCkjckTZ6bMdr38y6c8kHFaWGU+SAiRZEx2cfY0
	Hq1oOSSlkOe9xja+Ql8DPmlXenX4QN9O4w/gZbgCl1gTJqLhC0/7j/xM/FL1NcphEdmU5uSFsowyo
	uEQjbd0I21jJL+qVfYYE+iWYZ5SC40cNC2eiMzr1srysXYOvCnsYkDy3Ywypwg1F5y+JbqG7s2m9b
	b2eHswDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbad-0000000Ec5Z-2kj7;
	Sun, 16 Nov 2025 12:10:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbaZ-0000000Ec53-2h2I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:10:42 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so5686818a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763295038; x=1763899838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=A945jVN9YXqxlPfXk2w2VZeJ58nhuqW1D7chql/FpCLDvHrXib4B9iGnCnZa1lwKAj
         ARJWoZTAC4D53Aa2vcIFVVMJu8XqZMDK9m31Z0g239nQlRps8XBj9eq8ndMCGgVjE8QW
         E2kK/pixIOijarelmbS8ml5/sN/8BN6ANAOXSBlriQvvayTTFoAuLLemjALHsS7h/t7C
         VczI/n7a96DLJxXiJ/1O06Jt7iwLGZDeEfWuaai0bgJ16+zyt+dNCrTl+Mi+AIKdP0CK
         zakQo0irqiaXZPQOMbZTidURXU/ujmxUXblEoQvWpuU0S+L9+c9eT8VbpD6rJ9kliD7O
         YEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763295038; x=1763899838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnsF6JeZIC4Q2fWv2jeLUTcHN7i4Xl69LvES25j5B6Y=;
        b=SQOMSNFce7UwjzT78kJD7tfg71o1UD09NRMiiDYsoNj0ZFMzvTC1C3UWiTXb+XrSMe
         ObiIHCrzEq0nrSiK2myTFM+I1jiTDabzrvbPEekSpfwY75qhmklwHKfbCapnk0499M6I
         i+gJtWdQJvOTh5NiybYCYUYB/vxDe7kAXkc6jLJxCPa7yw1aAJ4oPd1dOa49oX2MM2sz
         QKTwOliqBo2QDImL0Q25d3LbMdq3iRvr6FSUZQuFxgdrTg9/YqMeIRGa4St9D6EIVdRu
         +sJbS93iyXlN3AgM/6wBFhvb0lquDkMRp1bob2tGIVFM+VsFa/mXb7AIjrf2i+uMPuXZ
         +P4A==
X-Forwarded-Encrypted: i=1; AJvYcCXNPxX8FboryIjcM6Qf+XZ4QVN6GTy5eYN1T7gIaAf5e14adUcU5gvJjg+JO+gOClzzzv9hD3Ygkjl/ZZuJNfZc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3B6JsHyIfVwOSLbqSySAIfw44vnxr9mqxxXniAHM9a39IgxMo
	pbfeCCzdUN+7RB0TNoA329z/ObNn9meuyJILA2mtsTYIqpjBW1xF8yZ/
X-Gm-Gg: ASbGncuaFT6jj3KGBEYx/HhZ7jaAK8dluGMdHCPuvPhQrUtm6VtAxcm+S8Ovm++cT6I
	SJ49f8vEK7rJdgtmzB4nKjUzp+Xrxp8lixOcsZ/heoHUSUCtYrSAt/5OlNcFv48WE11dXBvTek4
	+c8Vwpgjdn3wfi/vAKXVJ+JCdMbxU6Lvy/ETo1+v+Vt1pHsxkxKjMH1RaWsUqVg/xgrA+1cWkJh
	MhR0B9TY0RsKEsFt/Pb+I80mwJH2bWHfEKBCoF/P23na1gtstP1Id3+BECckRDF6m8DbR1CpYwd
	B7bOBwwn7yPMB19ZqY29oC+xLEcVexM0d+s14gq/JpqQ5D2vYj0x1RPloX8RAoJ6otXOa28EbTN
	qnBdYDLKzESE+qOO5qBzgFhP7UZPql9qVyKlWyXoO/u2q6vaSFztVdPex8t83L86ErwFr3v+1FU
	uVY/ZDm2A9HyveXXvJM/SUZDXmG9LRUKbRjieL0ejTSR004NG2f5CDjkMKgQ==
X-Google-Smtp-Source: AGHT+IG5Pb4oZTy+N/ijhNzo5h6b+rv9IQmhgKS6Icb7AJg8wd0rdoZ0YkfWkZADk7dGg/KIAneikA==
X-Received: by 2002:a05:6402:5112:b0:641:9aac:e4bd with SMTP id 4fb4d7f45d1cf-64350e9ed21mr8531044a12.26.1763295037690;
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1fadsm8008375a12.31.2025.11.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:10:37 -0800 (PST)
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
Date: Sun, 16 Nov 2025 13:10:35 +0100
Message-ID: <3659815.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <4691137.LvFx2qVVIh@jernej-laptop>
 <f8979d59-0f71-438f-92ec-bf1077279dce@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_041041_077210_3B878E7A 
X-CRM114-Status: GOOD (  20.74  )
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

Dne nedelja, 16. november 2025 ob 12:49:45 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:44, Jernej =C5=A0krabec wrote:
> > Hi!
> >=20
> > Dne nedelja, 16. november 2025 ob 12:29:27 Srednjeevropski standardni =
=C4=8Das je Krzysztof Kozlowski napisal(a):
> >> On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> >>> Allwinner Display Engine 3.3 contains planes, which are shared resour=
ces
> >>> between all mixers present in SoC. They can be assigned to specific
> >>> mixer by using registers which reside in display clocks MMIO.
> >>>
> >>> Add a binding for them.
> >>>
> >>> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> ---
> >>>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++=
++
> >>>  1 file changed, 44 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/display/allwinn=
er,sun50i-h616-de33-planes.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun5=
0i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwin=
ner,sun50i-h616-de33-planes.yaml
> >>> new file mode 100644
> >>> index 000000000000..801e5068a6b5
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616=
=2Dde33-planes.yaml
> >>> @@ -0,0 +1,44 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de3=
3-planes.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Allwinner H616 Display Engine 3.3 planes
> >>> +
> >>> +maintainers:
> >>> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> >>> +
> >>> +description: |
> >>
> >> Do not need '|' unless you need to preserve formatting.
> >>
> >>> +  Display Engine 3.3 planes are independent of mixers, contrary to
> >>> +  previous generations of Display Engine. Planes can be assigned to
> >>> +  mixers independently and even dynamically during runtime.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - allwinner,sun50i-h616-de33-planes
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  allwinner,plane-mapping:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: Phandle of Display Engine clock node
> >>
> >> You description is almost duplicating property name. You need to expla=
in
> >> here how this device uses them.
> >=20
> > So I guess I can copy commit description here? It is needed to
> > access registers from different core, so it can assign (map)
> > planes between mixers at runtime.
>=20
>=20
> "to assign (map) planes between mixers." is enough.
>=20
> But it looks unfortunately like a spaghetti.
>=20
> Your mixer binding references via phandle this planes. These planes
> reference via phandle some other region to configure planes between mixer=
s.
>=20
> Isn't this the job of this device?

It is a bit confusing, yes. There is no clean split in register space
for some functionality. Register space for this node on H616 SoC
represents 6 planes (each plane consist of framebuffer management, CSC
unit, scaler, etc.) but not actual registers which tell to which mixer
they are currently assigned.

Best regards,
Jernej



