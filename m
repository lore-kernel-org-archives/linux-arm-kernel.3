Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE1AEA8118
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tz7iq3UboZR3sEbe7RWTqcnicPJW8XCc5PPd9f9F5s=; b=yOsze3paRrktA3Pul+CfXaRV+Q
	JKGeIR4coWVxGJKFNFlacjiUgH6L7V1Xe0K87T0WxuKS2SEd4pr5dg+nvOv6otWL1RBuBOjHYCngt
	GX+00nz/JNCRd9qL/9QyIPiI3ru2MghIg0/XxvwgL8QMX+3V5P0hZOWNTcFRHUIkQ6nNOGFsD69vZ
	lRwFSc7Z7Lk6R2wCphXitlLw0W9vCnoSsaoC6AOyUM4UniYg9toZdCe8YzBQEewMmdMx+kihKb+tc
	91by2vA+xZEZ2zQETpQ1LXwME06ejd/xvibns7nOQOCw1zptLD1FitJpkdBJTmZS2RDvjwMg7j1jA
	7q0fZYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo0J-0000000H0DJ-0sam;
	Tue, 10 Feb 2026 13:42:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo0H-0000000H0CR-1NpM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 13:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A66D644565
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88175C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730928;
	bh=KvCWqb2hqYTj26lrrDonWv4/5HcZhD/EcQOLJLovuUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=myUYicc/p3YYVczXMTgj6o6RxiHJ52msY1URNyD2WD8dKWIH+8EzynRC2t7e2pr5x
	 PeannzEm9qLGMN9F8WpoxokzBDYaV7JYTqXWPIcDWj42wEUCsh5f3gFly6h0BZ5rIx
	 7H8YlRHQbwVh84EH4nL9i1b18mPZruFQSFxlr0oVOpLqiXy3oUlrgzYbyZR3URHtvE
	 bvlBG2EfS6PLcQfdhuf1z2c9P6cVRoJS5XdH6opU8WNtH6u9lZD257uUVfJ4uCb+yx
	 6MsLCjmizr37jWfMrnrArF/xw9P1KS1bR42QKRWu6O/HqvFAJ+eYcb0XrwXPZQhRJT
	 oGwEpwq+8im5w==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so1252510a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 05:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyxdKlErzr6Lgan/S3s3SySM0YZFy2puQBSUwPnTC9DrtjOX2HpKX+ARPvY3d6IFPLn8oPrpl2/xDkLc/gbXJX@lists.infradead.org
X-Gm-Message-State: AOJu0YzFlnqohCDPPhtHYG9vZ9sHnXduHixDY3FnEkKXMuZCTMVL9pgj
	KE58HQSVlFmFqeVNMcWYD1sNVAlLjAP4YYSDUE9fc+vxZizJ8mm08mVM/Quq+ysZyQWs8O+LUFn
	HkNbjpvldeew74SvwvawY/lMkjaJKlg==
X-Received: by 2002:a50:c8c6:0:b0:65a:2903:3164 with SMTP id
 4fb4d7f45d1cf-65a2903460fmr254675a12.30.1770730926783; Tue, 10 Feb 2026
 05:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com> <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Feb 2026 07:41:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
X-Gm-Features: AZwV_QhEv7cl8ZxKnJCe5nmdFpEiI7-_VBEnnhT0PzMh2ys-GVQbQoUyTL66giA
Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org, 
	matthias.bgg@gmail.com, julien.massot@collabora.com, eugen.hristev@linaro.org, 
	jiaxin.yu@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_054209_405976_2796323D 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Jan 15, 2026 at 6:56=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for the mediatek,mt8192-audsys compatible, which uses
> a different audio controller (mt8192-afe-pcm) compared to mt8183
> and mt2701.
>
> This resolves a dtbs_check warning on all MT8192 devicetrees.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,auds=
ys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.ya=
ml
> index f3a761cbd0fd..09a6c16e7e82 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -48,19 +48,39 @@ required:
>    - compatible
>    - '#clock-cells'
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: mediatek,mt8183-audiosys
> -then:
> -  properties:
> -    audio-controller:
> -      $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
> -else:
> -  properties:
> -    audio-controller:
> -      $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +allOf:
> + - if:

Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
[warning] wrong indentation: expected 2 but found 1 (indentation)


> +     properties:
> +       compatible:
> +         contains:
> +           enum:
> +             - mediatek,mt2701-audsys
> +             - mediatek,mt7622-audsys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +
> + - if:
> +     properties:
> +       compatible:
> +         contains:
> +           const: mediatek,mt8183-audiosys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
> +
> + - if:
> +     properties:
> +       compatible:
> +         contains:
> +           const: mediatek,mt8192-audsys
> +   then:
> +     properties:
> +       audio-controller:
> +         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
> +
>

Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
[warning] too many blank lines (2 > 1) (empty-lines)

Please fix as these are warnings in linux-next now.


>  additionalProperties: false
>
> --
> 2.52.0
>

