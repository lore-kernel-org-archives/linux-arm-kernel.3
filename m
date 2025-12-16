Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CECFD637DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 23:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=; b=zCkHMC9pGHksU+dnIFTkZBpM8u
	or/dZU/UDkePj0UIb5S5N2YUXIpSpHIjSN++AMaz52FOSXJX42vY+k0PRUbbeXNn//ImUhpzlL25u
	Y1VWYKV2kc/bGl2XHGYqHduwvWdd6F8oQJUmhTwUaQlATVltQcEgW5s/tGyzd+iJRDxECHfMtc2J6
	jdwxvdYrjzKS8/ENdKpASjedoq9+wCBTpA5zfXFmTj1/WC1D4HOMn6ZhK1v77Ldwf/Jk8iS+P0QPa
	Ep7xFBTUra+DciNTKueKCvkyxWMmEYvieCnoWTAYrZbM6nDCzqJ7mlgVQugi9/cfq09+xO7us7fAa
	rxZtK7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVei1-00000005xKi-3QWv;
	Tue, 16 Dec 2025 23:44:03 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVehy-00000005xJy-409V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 23:44:00 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso15168a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 15:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765928637; x=1766533437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=aj+mufqQEvaiJ8+31b4kMCGAukHpJi2tPnVQyu7JvEdFEOS7a7M2DLyYcO+ys9qzMt
         Zwf2JLxaiWXj3rT/24zS3GvlFSCOv+AOckgD9Axo5M/XKCHX3Rokfxuwt7gLSjxHOPvt
         d+0CZIdQxgXpQqBaHmKp+s0eqdvHpSK+h4KCk4qbxJhNKUCE3LllBn9N4qwMQWrt7+oW
         wSvnRQtgn7FJGeDZ49HVqsGgGIUQXEv5reYnXDVod7y+L22hZX+OP2kc1H+azYH1eNPs
         amfcbkoWylni8y0Pp76VIIvSU8crP1XxuSgNGdWIX5aIwxcMqqmIGFoKm9MfyPhDxAcr
         Sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765928637; x=1766533437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=aNBcugsPlQoXa+sDgcgn8yVsRD6PRmClQCJNkPxapqDGUfO6cEn6jsFrdFyMRgUzJ2
         UnJtV03Mootg8+Q0iskk/sl9wzEnmkTHVJkrCWWg00PQq2JE8rHwxoULlgykC98TDVde
         TL5G3s3u7MshYavtKFxA9dQr9SQ8GFxFwctNxD1sUPvypSTARuOt7tGaYJ28wuE7uDHK
         aD5cabxlbU/mW14KucxLrxwPdsYExt1GQYkTHqV/9KPcPR/rjj4bvoPp/k2VRaBOqbiq
         Bv3cARqChoC08KED5KW/3VCWJnnblQe34sPqgagQ2+od3nAcXaQg13dJo1LMrVKPjDup
         IxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+X13leRzaHcSTfuzxHFadJNbYexlyMjLVB9v6k1HJVj3gbXAl6mlnmEhYfW+5G6X6uulu5uV4Xpm5ZJ5wUnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45WSDQAJ1lUPg1bT9Hw4YLCtnRkwbmht5XshhLCIzHdmeOfmM
	CosAvRq+YsSAbfRtVwKnV2NnkbHSoYr472NSXrN9lmduMv97FAyhrF2IQAYPXdk0GBKgCCDn8BO
	EC6+jvasVUh9VsaUkSkc8XHlf3GaQQRg=
X-Gm-Gg: AY/fxX5WFwj1EBCK5wLgmmvGgiZyX3rGgINnOeXnc2WIBXpRDUljsfEgXyBvJunThYl
	pcuEFiVBHLlSxnlp1EFvF9QRoxd3WtCVTxc17HeaC6s+vm2/85GZBsQW8X900cUdFw0+XIZi7M0
	bgZsU+7y/QUWoTAeB82FKEYd1xJoT8cmKMQp4X6CDKFTE9k2G5ti7pebmE5OLa9m6uZYChVtdpb
	8mgGQxMgUhN4rV52tnhceMF0Fa76LUYEdcthMJZ6XNA0XLw/8nrjj71mDdD/fnrnS1uRdO+/HXj
	ROxzsT5hSsfoXstG3OoFtt97tWs=
X-Google-Smtp-Source: AGHT+IFc4SCik6/1a5fdyPdRb57GPQbLhG29WfQBheDtYpWyCEZoAD+X3T4jtRgWy08tQ0KGPuBzfaLM7RFqA70zbTo=
X-Received: by 2002:a17:903:f8d:b0:294:f6e5:b91a with SMTP id
 d9443c01a7336-29eeea26dadmr221641465ad.13.1765928637355; Tue, 16 Dec 2025
 15:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com> <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 00:43:46 +0100
X-Gm-Features: AQt7F2q9zUscAc9aUQp2kvq265usXhzgFIJqV1vpvmNAc7x3-P140_1z3fSbVp4
Message-ID: <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video decoder
To: zhentao.guo@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_154359_000071_C019B10D 
X-CRM114-Status: GOOD (  22.90  )
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

Hi,

On Mon, Nov 24, 2025 at 4:32=E2=80=AFAM Zhentao Guo via B4 Relay
<devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>
> From: Zhentao Guo <zhentao.guo@amlogic.com>
>
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
>
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-de=
c.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
> new file mode 100644
> index 000000000000..401a5a32902e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vcodec-dec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
Neil has commented on the driver patch (in v1) to use the existing
canvas driver.
The same applies to the binding: you can replace the whole "dmc"
registers with an "amlogic,canvas" property (see
Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml for
an example).

[...]
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
I did a quick:
$ git grep RESET_DOS
{include/dt-bindings/reset/amlogic,arch/arm64/boot/dts/amlogic/}*.h
-> that lists DOS reset lines for most (all?) SoCs that were supported
by the old vdec driver as well as DOS reset lines for the S4 SoC (for
which you're adding support here).
If some of those reset lines are wired in hardware to the DOS region
then you should include them in the binding.
For reference in case you are not already familiar with it: [0] "[...]
make bindings complete even if a driver doesn=E2=80=99t support some featur=
es.
For example, if a device has an interrupt, then include the
=E2=80=98interrupts=E2=80=99 property even if the driver is only polled mod=
e".
(the same also applies to any additional clocks or power-domains that
are wired as inputs into the hardware which you have not listed yet as
they are not needed for the initially supported codecs)


Best regards,
Martin


[0] https://docs.kernel.org/devicetree/bindings/writing-bindings.html

