Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0509FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=titEX2y3+9/xscj56vYw1l9vJIIgnO8oj3qH72QFLTw=; b=Chp1Q30x3759QFyAUotqoA2n32
	Jk4zryG6hpzONrAfAgzUFd8BEeNITaobTqjIkWWQE3lYRY67bmqpBx6OyyNf+Ej42q1rnpK2llvdM
	qqZ0bwrFmfpJICFigJDedpzlL8nF1G6IWprgLLQYvbGC0a7KasQ95YPxRPdfKm0xcL3b7m2RRgIhl
	bHp2X/TKlzRpYzFDd5DjIv2j/g3TLjvT7fvrsZw9i4z/eAU7vfeQe/Shc4snRAvoBD3J/XnUnsMRp
	2W/vKOgBxT9vzI56Yx/Oe64l8E3K+3xoDmRtjhUPYlSxYaHZcvMDEyfCg3DW7+GAWfLlhyUXY5qCu
	fVVItlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP8x-00000003A5p-3Fdx;
	Mon, 14 Jul 2025 19:47:19 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP6V-000000039wo-3Ejg;
	Mon, 14 Jul 2025 19:44:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-710fd2d0372so41117247b3.0;
        Mon, 14 Jul 2025 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752522286; x=1753127086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=titEX2y3+9/xscj56vYw1l9vJIIgnO8oj3qH72QFLTw=;
        b=Ev27tB3Qo7k6mp79uU1DvMp6JJM9FacTdnHAqjsu7K0+v4Ow/zMc9dfbdephYaLHHf
         ezLSbeimXy4+X+DrimGOoxBlNcnzh+jrtGMYLNLyglxHEx+uH0/28dx2zj1oDai+dQ6F
         DOXWF5wyLcfrE9D2bAHRZ+Rld1hcVvGE03qoiityTgjUiZdFGR7I83Q3tqC6/i3i5XyR
         5+uIVHP6+NSGJiBNp5JD4vyCR10pJURvZ37gLukkHk2RETa1AzoTYz4/+5aBFrsG8TiD
         BN18N2m2wwvuWWqn5z0JWnBf176cEGq1mc+gJGEajjG2eX4j3p0kh17DJqJuCwDO0VLe
         zKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752522286; x=1753127086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=titEX2y3+9/xscj56vYw1l9vJIIgnO8oj3qH72QFLTw=;
        b=s9vCWVIKp4WQmb2Mr130y5kUmI2y21gUU2iSmBeru9DsPbaJKiMFtoZzHsRU0MEftY
         8KTAYwS/JO8mc+YPX1N0gA0ge6Mh7RcXeDTNZuwqD/8KOE3XSGeObps/qI76rIJFrumU
         Csir8m8rzVWPL2mYdhh1Yvq1vgmAlBELDIu+/o4smBYTw3cg1S4N13eezDWvpPGCDeF1
         mOZxi4beHtfP6qUClHHHAvbVExfOON0h6NRHXCXUZHlFc9DQu+CaZ0DiNuIaxYsEKFPd
         xxanps+wn6JlWvWhJ0nwiPHWI5Qx9+zJPGN3iooOOYEdX1Db62E/PbpV8h3pOyxnwOO3
         q3LA==
X-Forwarded-Encrypted: i=1; AJvYcCUKiieGQ/eHIAbpB0CwfVWRZGkrKuwhJxcTuJA5mDrD0HTYmZiillvnweYGkHJeij4mJM2XPBSznfQOEqM+RWg=@lists.infradead.org, AJvYcCWtwDwzMkTfXNFGraTee5HWFb2GG2/F1tHwvt+8ASSDnrJ9Agt/Z8MDsMc5jcOI9Eqe5EARhxSn60MR01ue3jae@lists.infradead.org
X-Gm-Message-State: AOJu0YzHeC60wbFZS+Rz/sG6HpROvXo2UCrjbeBwDc7y75VbR0b4PgRL
	GUK1TvJyJ4mRiaTKMGQk3k3734rWdbkGCTA9hPWzv7L7YSNMdKR3OqJ4Qus4g5uoHdvKqyw3n0Y
	+EksDN0OoEljfHh1102RAQezJVlgovjk=
X-Gm-Gg: ASbGncu1Nc0pAP5aX4HNsNyWHIuBgqDiOqSBafvWR62vdK6UP7NgPDcQNRaCuhHMtNP
	eK53oHv6EAEmAkFpsMheH50AwlcDyQXKKpsehuuNTspO2uNdF/MWCOdHCL4BQa0modWWf+d8t+4
	uXFjOBuiWD2YbBa+fRUtX4g6fgn/EpbXZA20G9untABOd6CU16NlRHJySRKxBhLCtKaTMRt26Ck
	GI9veIK8tA2QUUpuKWt
X-Google-Smtp-Source: AGHT+IHDaQy35GA+Qses/SKs7Ih1reu0z/6Xmv8VCPpNc9I9mI3lGzILxxovXV+PULcNjOZ/ySpa/++hRe2/LR3lxNI=
X-Received: by 2002:a05:690c:60c4:b0:70e:404f:6714 with SMTP id
 00721157ae682-71822cea95bmr12446627b3.19.1752522286247; Mon, 14 Jul 2025
 12:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250712210448.429318-1-rosenp@gmail.com> <20250712210448.429318-8-rosenp@gmail.com>
 <20250714-subtle-origami-gopher-c9099f@krzk-bin>
In-Reply-To: <20250714-subtle-origami-gopher-c9099f@krzk-bin>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 14 Jul 2025 12:44:35 -0700
X-Gm-Features: Ac12FXxoR7CKJ2q8b56sbgmGdKBzHJHT0GepGHfBUGsgSAe8RihtGnci6IAEay4
Message-ID: <CAKxU2N8au-uncWoP+vGH4cHhHMOtq+VRFGNDs6rRLuHn-i1G-Q@mail.gmail.com>
Subject: Re: [PATCHv4 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_124447_811957_BEF2BC84 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Jul 14, 2025 at 12:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Jul 12, 2025 at 02:04:48PM -0700, Rosen Penev wrote:
> > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > Ralink/Mediatek devices.
>
> Your subject was cut. Probably you wanted something like add "Realtek foo=
 adapter" etc.
Not sure I follow.
>
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../bindings/net/wireless/ralink,rt2880.yaml  | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/rali=
nk,rt2880.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt28=
80.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
> > new file mode 100644
> > index 000000000000..a92aedf6ba01
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/wireless/ralink,rt2880.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ralink RT2880 wireless device
> > +
> > +maintainers:
> > +  - Stanislaw Gruszka <stf_xl@wp.pl>
> > +
> > +description: |
> > +  This node provides properties for configuring RT2880 SOC wifi device=
s.
> > +  The node is expected to be specified as a root node of the device.
> > +
> > +allOf:
> > +  - $ref: ieee80211.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ralink,rt2880-wifi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> Why clocks are optional? SoC devices rarely work without a clock.
Before this patchset the code was doing

 25         rt2x00dev->clk =3D clk_get(&pdev->dev, NULL);
 24         if (IS_ERR(rt2x00dev->clk))
 23                 rt2x00dev->clk =3D NULL;

I changed it to use devm_clk_get_optional since that's what it looks
like here. It's not returning under failure so I assume that means
it's optional.

OTOH all downstream OpenWrt users of this code (as well as
mt7620a.dtsi here) do specify a clock. _optional might be a mistake.

Maybe Stanislaw knows more.
>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

