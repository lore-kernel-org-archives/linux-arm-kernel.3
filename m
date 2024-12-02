Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4566D78336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=; b=oOrCbdQCD2ToShgms9QP1Z/YHf
	nG/F9z4qoYyMysbXk+z5v33pTP9In9s8bhubHps1ElIvDDomrDecmm2Pp8TuDOy049ZdstJ4qJhOI
	9aTcXKO9RJSlF3thym9+cbO/QtzFo5VK7XFTGf1wEiTV/d3Scfavb0PQpxZjazh8+0ICsxHS5753F
	ZoDu5eXOtLpWLtkDakwWuvq9SLbYYX5b31asHERmquvnrj6nFZrxGgRZIOPpSPTn1NFftZEaKre4F
	r8iObD/is7vl3Yr/yjB34qNRlXvmI5pmZ7KgUbgV/OtkkCuX0zNGXzmL3mnRSEadIKQSuxi/B5CKo
	Osc4mKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9FD-00000006qC4-2U8z;
	Mon, 02 Dec 2024 16:25:55 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8y5-00000006mdO-1QOX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:08:15 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e396cc8c9a1so3397597276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733155692; x=1733760492; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=;
        b=g0VDTw1mv7b+4lVVuuYmaj3eXhZVwcDtAs4FEzECP/2Hxn8dopypq9hAtV4EIC4JYw
         G4/P4Deol763v+/zCoNw8Xx1ktbh0A5OaRRFfJyLmUNHpOCrLBr7xQ60qDo/sTuXtxVq
         /eyle6UQQ5nY/l33hRM6+EEuQBeEDFvIriVsaV3H+GpWcx4Kx5wQzESNEgfQfRTsERce
         wC38fuAra9bwIPSaN7iEZcdvWmQV930rYbWEMYxMDvOLT/VMFdkZGZTzVo94FRJwn4zI
         MOQEyo5dn3V1rRjZ0S948n9JXbYC11a95S2E/5Rwbv6BC7ZcUHU6iCc7GoJUn67X/JLg
         KW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155692; x=1733760492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaH2quEaKj8yOu++9MIx8fQjkXZLihRJEM2GwaPWvJ8=;
        b=JB7Iz43nCz7gfrBM9+Rw2xWFkuChctWcYp3HIoFWNc3N8Bk0h8OeE6J4zQBa7pQH5W
         w3tBQVCirEurM8+lUqTpBMqMMpPGk8bP1rHDO05c1TQ+s0cinhhbwztaT9uriECIjvxP
         aPiiIFMGeQcgdFDzK4yE0/Z2C6amlg/vH0xX+QvpM804we9y6WEaf/IrXMjPVoHhm9QL
         ARAX5bNO2ctIePqXQBy3N2x96SrNOqlei9xdRGF01AQ2FKVBtOEzUsG0RZzW4uWApEGa
         G7Ext+zhcfXfTPbAgjdkuS1lZ9d+bY2/pNRl39ohAoibRzxAK5WzJNSrlPyDy0qx3xAC
         dstg==
X-Forwarded-Encrypted: i=1; AJvYcCWOh1diAvW7Nd9pd6hQ7pn7nRle7LM3UAIjsHmagoACXyeYoEM4V2f0gFyrt21Iogr0hXSe0TrpFndtlB8NV6cp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/PMreM29DV/mU0sa8cUNSwVuKYZevc6GkXI4laqfOXMYwWJFV
	fpf9b5gMkzqqkI01HGgrCDw2yx0Q9XGOlp4V5QxcbOVBm4KeukD6wqN6AHThn1DJojTiZFCu6+a
	0l4fC3jV33w1H/M4jhs84sDQifIurWCyeK1liuQ==
X-Gm-Gg: ASbGncvzqKJ3p2Lc4MfjKNEvjpgJHsRFACMqAo47O3OLWium9xsgh3Q/RkvE1zUC5gT
	Gg+3t+6DYc+LWMoHijS27Z6GdSphrYvdN
X-Google-Smtp-Source: AGHT+IG7HwzdQGc2Kvrg8khctxbecpx+AXVlBCSBHTZ8x/NzPHJXof0Ee7iQcAC8+6QwlvR9QUpxPUtKrKBUqfZBBpA=
X-Received: by 2002:a25:7bc5:0:b0:e38:864a:1522 with SMTP id
 3f1490d57ef6-e3971958a74mr15808882276.9.1733155689500; Mon, 02 Dec 2024
 08:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20241001113052.3124869-1-fshao@chromium.org> <20241001113052.3124869-2-fshao@chromium.org>
In-Reply-To: <20241001113052.3124869-2-fshao@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 17:07:33 +0100
Message-ID: <CAPDyKFocgdjSdek-sNHy_w1ZQkscgs8Z0TYwXPKC9phUbH-scg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: power: mediatek: Add another nested
 power-domain layer
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabien Parent <fparent@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	MandyJH Liu <mandyjh.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080813_376945_98D4F99B 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, 1 Oct 2024 at 13:31, Fei Shao <fshao@chromium.org> wrote:
>
> The MT8188 SoC has a more in-depth power-domain tree, and the
> CHECK_DTBS=y check could fail because the current MediaTek power
> dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
> sub-domains.
>
> Add one more nested power-domain layer to pass the check.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Fei Shao <fshao@chromium.org>

Applied for fixes (to silence the warning in v6.13-rc[n], thanks!

Kind regards
Uffe


> ---
>
> (no changes since v1)
>
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 8985e2df8a56..a7df4041b745 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -54,6 +54,10 @@ patternProperties:
>              patternProperties:
>                "^power-domain@[0-9a-f]+$":
>                  $ref: "#/$defs/power-domain-node"
> +                patternProperties:
> +                  "^power-domain@[0-9a-f]+$":
> +                    $ref: "#/$defs/power-domain-node"
> +                    unevaluatedProperties: false
>                  unevaluatedProperties: false
>              unevaluatedProperties: false
>          unevaluatedProperties: false
> --
> 2.46.1.824.gd892dcdcdd-goog
>

