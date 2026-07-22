Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7587AC44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=; b=abklP+zjGto6mV0VhUgVplZJNk
	WThUMkm12tZViQ1XZQ++fataxIjtyfKbY1GqyjxnRK0NoGWxja8c5kSwermYAIm/NcpJpXm23achZ
	GDBP2NCE/SDkEBN/Upqaa4TmJmkUVrlQ1NrEFcqudwvNpUcI+G7/xemMx1ROTM7+MCXhQls2f/aJt
	z82bpt/l/G+i3lfP0wU99HBw+H1xVxqL4pmJEj7B2KZnOmQJUKN0MntglGifZe6EITP4Xum4pmJPO
	uGhW/qa1nmqJZ7lDx5OMygbPVQv2f7gx2/Si9yC7t4iHyfiBXbtcN+WN7oLP8nQ65BhTpmINCeXyC
	079vpzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNkF-0000000ApJ2-0Kdp;
	Wed, 22 Jul 2026 03:35:43 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNk7-0000000ApFW-3LYX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:40 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81062fdeaf5so51592527b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 20:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691334; cv=none;
        d=google.com; s=arc-20260327;
        b=MrmqKtE/HNL6EJyqZVpitxM1AWtgeLsOlRQucrNOtDKJx5YcB8IlWLkTIFxIn4CtEo
         8VbNVRWaWFAPfWjLzxU90GXsX3ea4QN1OSBGYcTkxccZc2FdAd3o6FKgCxKbozW5h1tZ
         Ge8q9msBOYvNfcC3Fp1blD7+imtVXlA3s6Ofl/FDiAcdq69IxKvOHaBXK0swWlEQ/qLy
         BSjRHSxMWDhKkuFg8/erxONdf9UegX9OfG7CiadZt3IAP2huAZu/P5hA1KZYa7BZ31QG
         Jnxy2qr2yKLWcU5mJca7rN/Dho3XQlIwPTYyTqa7BCX+rpyAhJRYROmvQhOPfygT0WxQ
         eK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        fh=aXtKxBcS02+0VC6Af4JkjWe1Mrdfg+0qpr58/3MawoM=;
        b=AeZKgupOpw4U8ZlnjJEQXsvM3ZRMXZcofU1JYQfDRCytd/y0sz31Ck2Qt88PwUNyYX
         GMRlLJ3s1fNajhIdn3etSkx7l9Z0wIw+QKGumyLxgtkyVVTzmqgtAyGsXdBNSoXBCnNd
         HtsIvfze1awf+UCSXsrtLhhyJrx+6m8SzjO9boXHXhI9t2IZolQ32j149BhVRRcJ9ihV
         LTCiOC4FiqPnobxdmSHCpzrJYVWh3UVxvVRK1gtipNNYGEpK8ttThgSHlArdCnuQ+VWs
         /8qt1cTymthNH3NsJVNiqsn14dWc/8Ccnbqhs01832OryxqGxqJ3S4z6i4a0ThWFZmhS
         91kA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691334; x=1785296134; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=ofBCccbqYeR5eTFvBPWV5epGOEkkDwCZSZOWTC7ZCGGnoWZ40lEq01eT4Ew2OG8qtX
         mmTJdffo54yXmIUOoxjczKrbG1E/0QP+sH7ytb+pBg9JjWYHfEZN/RaBs2vyk/VBLmCw
         agDmMIef5sHLRgdGcO7W3/1TGmDEtAq1s7TJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691334; x=1785296134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwHOybM5kh7M76hGR48ziCvoLZNoVKPyP3zXf5iOrYY=;
        b=d6yUBaXACTKnEMO+IdOpH2uZpUxuGMfyYmazpnWH6qL4srTGJ5gNhv3MZqgXM2yWmo
         aKT++0xnp2yspvg3er3v9HQRow5V3UlnSw8y+x0uvSxeR/mE5jXbpi5uNoSg0/y8CtaX
         uIcAQcZJUUU8gcHqqkOrK704ehpO5E0A3jNI7lnVJqCIr2D1GKSfPEXstqJcQiosh3mY
         c/Yt0634nW9yWOL9g3lkW9iTT9UEbfXpLQv+1D2cazmfYv7x30EeWJMD2e+RKsWqKoU9
         cB3odVsbuWDYmiebkjgwAiiCuzMwSJu4tlseQ75c8gWb4yr3cwL7Zgn4kHM8ggqB2AHl
         XDyQ==
X-Forwarded-Encrypted: i=1; AHgh+RopfuNJaSGfG5IHSWO9ZzHbG44vFQIDdcg7Sx1N+f5jGIoR4mKc44Y+MDfzoBdbUe3SFOkBCOuPPrJQd4Jlu/YM@lists.infradead.org
X-Gm-Message-State: AOJu0YzFtLjNtnNnO/o0s6+8fY1FyyNrLtMWUq90OKhQeuHz8wHp6bZc
	/MxI6ZC31Qikt/uJgfubYrScbx9WQZnt70V7JMAJjST2+j1KDm/jUiDG/03GS+1atzNgF1OuM6B
	c/D4nJxe7sjgglVn2tNdxrlPg4S3qvqQHn2CWTwU3
X-Gm-Gg: AR+sD12TUjhWVfs15ktlQKl90hTYHSF5KMmBGPZaZPI6zU6sxblpH3PbPz9ZbHN8oLU
	aWKUPCGqMCl/4z3rZD8Cgu6qiLAdxKBCRm6bk0n/dS4tdzzlrnB1yhAtQbY8TzhY3V9cdq9yPa4
	+fl16zgnSgLIUVYM0iXLrtKJ1b8gYHCQMV/W9vD25SAZACyzmY5gO3qiv9MeV58c5jwI5/D2Ky3
	1e2IlZM5XE6KrUk7ib5xe79T9O8grm6ZtrvC+yZj2bAIqGztfJRxUak/6QUiDIamEQaQQlAwbWy
	Ou5PbHfoDfnoO+c=
X-Received: by 2002:a05:690c:c4c5:b0:81e:f308:cfa3 with SMTP id
 00721157ae682-81f33bfed62mr7716127b3.14.1784691334267; Tue, 21 Jul 2026
 20:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:35:22 +0800
X-Gm-Features: AUfX_mwF5azxEMhr_2WNLIrQ4cJxk5YI9R_dQgFYT_P0qpGKSy3wJnLrxRQxP90
Message-ID: <CAGXv+5G-mVf3b7ygb8h4sTtYkACjc9B-VenTqOvbBQO9Pasgug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, laura.nao@collabora.com, 
	fshao@chromium.org, jiapeng.chong@linux.alibaba.com, frank-w@public-files.de, 
	bchihi@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203535_862519_D53822EE 
X-CRM114-Status: GOOD (  18.20  )
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

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
> running some sort of firmware that checks thermals in order to
> scale frequency, or to take action for critical SoC thermal
> protection - and this is seen on most MT8196 boards.

Yes the number of MCUs on this SoC is a bit crazy, and the OS
has almost no control over them. :D

> Make resets optional, as doing a HW reset on such boards will
> result in either an immediate thermal protect shutdown or in
> a rather important and usually permanent system slowdown.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.=
yaml
> index 975235130670..29f431fcdcd5 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yam=
l
> @@ -94,12 +94,23 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
>
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - mediatek,mt8196-lvts-ap
> +                - mediatek,mt8196-lvts-mcu
> +    then:
> +      required:
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> -  - resets
>    - nvmem-cells
>    - nvmem-cell-names
>
> --
> 2.55.0
>

