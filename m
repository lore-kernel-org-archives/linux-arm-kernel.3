Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56EEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 22:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=; b=s5+a0Pso4dr7cy6O+FlQChGwBh
	/P2P5MBINJxhEPCyUcYn/eVqxDMNFyqowRkWLuefh+3cEqeGk2ZLmZll/aC6MNzTdbXYLr6hcHKJJ
	CMx7A8fQEFyJN8ddxeGQNqS52LCmUc292jRLa2NqsoeXwD9K6vjJ8pHngEmOk+V8C/uwctuYQRUTX
	r2hrUtNn4ObiOkpGJCIhVU+dgAAdp7X9szWvt0vAqvIuPL1dYMTaJgWVgUcYiSgDpmYA+00VOn49Y
	Ed96I6jW4lAgNLAT6MnWVm6ytKN2OC5G7fFH94uHNZK2eCuM4euGNjzEogVEeE+KyhJab979Cg1d1
	9WuH+7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD5J-0000000FP9d-3nRI;
	Fri, 14 Mar 2025 22:00:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD3e-0000000FOqa-0dl4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=; b=hJR3qs9Fo8kfFOa4l9CFYEB68s
	9BaSvbcXZTDbYQ7USikrQvzSc1JE2QaDGAwr2A8+J8pVB/BYTXhrDGjJW9ebLIrPfONZi/BMmMDkb
	EHkVSSvcdvpFmt2OZF1KnpGuVuGF+2ScLgsb2tS6yjIcSiysgktWv4IY8oMJVxFtJMHjAnQW2eFMr
	leOjO2FY++8jEJQOUYbhVoJiFvR1LXSjvxJ1PTzOGyjk6NtD+c/fJWwOIqj9RFWuIFbbePm+bSJAO
	RA557+gGFuztSYpCGSctMmEO+Z3iblBBaq7fWC5IVGUhMBEUO49Rr+C3KbfE5ozlkaayil5hhbG+6
	d2CRfd6w==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD3U-00000002z07-0sSX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 21:59:08 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so21991041fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 14:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741989533; x=1742594333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=GM1BCOJ8i4mrnjJocQKpohPIa8hgFmNXAiqbkPkJHbZqzFRaaagC6Mk08b9fZ0vGaS
         aZh13IoWover+kX71sYYPnat2iaSGdUBqADKRm+sVWy71+gjAtRo5cjx3wa71f2Dxa75
         Dq+lSKtCv30yrvViZj+hUjjqEdtdROpk5mJng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989533; x=1742594333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=iOkvhXxVvycuMc6gqIamqfTYYoM3wm49fzwSuBaDan/JiBPu9T3iUWg4g+7DsgQtdX
         hPSsg0nIJGTxmz0HESQXEZr8Gdc3DV2ZxcBQ5IgSp3m2/E63mMn8H+KP1t5w5Lu0jO3O
         OqaLIfPMCnXbYEtN6DR3I31KIbC1PKqp6eji5Cu0YLF3BOGTdhn1S/tRoPghP5EvQcm7
         +5zG8rFwyq92mrx++fslFhSCnCHaNEvRhqCIp+2d9BcP1+ob8kI9vYArKe8ABOUnhE5r
         0+7CB3mNSLHokx51W95KWbKjJpJc6CDqdqNFuHI1/4ZiWqEb7/bI+sRdwE2sk0NICQEY
         IiIA==
X-Forwarded-Encrypted: i=1; AJvYcCXwiOl+dMvFAK81TtgX4Wsa7qYoFfE+DBT2FjBJj0WKl71JI9QveJ1E+zbE9XpE8SfadRGNVvSTHzdQGv6a7yBi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4oTCNDSI4ssNiAZwudWfn89rnmm8b7XeziphzuJUWZl+Hru0R
	veoQEmj/7H3ofWpQuEoAUl3E3ZuT8YsN6gqc+ofHCie7Lwf6e1f0s8ig9NWCiVqr+oOEOUDNW+o
	85qa2
X-Gm-Gg: ASbGncu1fGUievHK+pzwrXgfaZnTZ87nMBoHJTgE2q8vgxDXbmFuli5SUeq7MWq5XwK
	/HleXAMW6rjOr8A/TtKkeD42aBt6Bynex51ypje9Y078j2YLngBmKEBzxGck8c/y4zW2nK9oEXU
	hy+jTm660VPwlBFNOxw1K83JoqKNKOnxAxC3FtujwR1HQ27WpS+EK9Gy5AZMi+OYSCpK3AK3sXM
	GHIJlxtHaOoqvOGW7uAD3+Fd2ykN1iUj31Fkqv+fQtAfy462l2tilYRdpBQO+TTLXN2wdFnprgf
	bHOgvCrslLioDtg89uzKjh88LNvD/2GhudVSjlLpoQKBJt3yVV++drBTIVuVOp2iIgxeG8jUgg/
	8k/iHQxu/
X-Google-Smtp-Source: AGHT+IEssGwegljChg6fX0FLTvZdjB25cLY66UWS6EHr9p6jY01mD39uUtLYfP5FiHSqygee2zl84w==
X-Received: by 2002:a05:651c:1541:b0:30b:efa5:69a2 with SMTP id 38308e7fff4ca-30c4a876bd6mr14928971fa.19.1741989533319;
        Fri, 14 Mar 2025 14:58:53 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c21ecsm7101051fa.87.2025.03.14.14.58.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 14:58:49 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2750813e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 14:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoXMRFvB0mZHdniFWs0VdaAmTmHEsv3r8eXDRL6Enb2B2PbumjTRt7B5Xr8hIkNKyn8gCWK7AbPwbjO/iC8fqN@lists.infradead.org
X-Received: by 2002:a05:6512:3d02:b0:545:c7d:1784 with SMTP id
 2adb3069b0e04-549c3988b84mr1398468e87.43.1741989528244; Fri, 14 Mar 2025
 14:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250312104344.3084425-1-wenst@chromium.org> <20250312104344.3084425-2-wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 14:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqp4S31G39Rg1NsczcQY3Hb3QPTaquvIuzNNpiFQjs9eAjzZVdMi2mJRe0
Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_215901_241942_A8AE3522 
X-CRM114-Status: GOOD (  21.58  )
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


On Wed, Mar 12, 2025 at 3:43=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration. Enumeration and subsequent operation follows the I2C HID
> standard. The eKTH6A12NAY requires longer times for both parts.

Somehow the last sentence above confused me. Can it just be dropped?
All you care about is that the new trackpad matches the timings for
"eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
"longer" timings.


> Add a compatible string for it with the ekth6a12nay one as a fallback.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b=
/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index cb3e1801b0d3..81c391952ccc 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Elan eKTH6915 touchscreen controller
> +title: Elan I2C-HID touchscreen controllers
>
>  maintainers:
>    - Douglas Anderson <dianders@chromium.org>
>
>  description:
> -  Supports the Elan eKTH6915 touchscreen controller.
> -  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> +  These touchscreen controller use the i2c-hid protocol with a reset GPI=
O.
>
>  allOf:
>    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> @@ -23,12 +23,18 @@ properties:
>            - enum:
>                - elan,ekth5015m
>            - const: elan,ekth6915
> +      - items:
> +          - enum:
> +              - elan,ekth8d18
> +          - const: elan,ekth6a12nay

The "enum" above is weird, but it matches what we did for
"elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
maintainers. I guess the assumption is that we might add additional
touchscreens to the list...


>    reg:
> -    const: 0x10
> +    enum:
> +      - 0x10
> +      - 0x16

Again happy to leave it to the bindings maintainers, but _maybe_ just
drop the "reg" parts here and below. It doesn't really have to be part
of the bindings.

