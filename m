Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7067FC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvv3aZc6ysvtM6PaScZm0AZ9BZs2r0w8R3h6Sq84JNU=; b=yfQGWTS9Tv+J2ySwgIpnk6+fXO
	CV1mW6IOoP72Sqp5D0CseXMbi8l0DlvmLqwizI0bDZEO9w3j/8/rMHQ4IK8RJ6uUTUAM4D8K9yfBo
	2JPnlV0FyB+4/8YqA4hM6Yx+1xtvTqJjbc+H6PotQH+tw43YpYWsDXYk+Sz7cOJcYZLsBsYzOgB4O
	yhWVTwMw9EfiON5wSoaQx61wGfs1TYL3TxNA2pL0CXZymFERxccEgqV4g+f0tpJuzlPYN6dTtrCt6
	G83aj5FuuR66Q6tBRz2byL7Ik/qX5ggGbCSN9QkkEIi7li3jg9//yrTeVIwxS3swBCmo+v569IH0p
	HdfLm+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAozo-00000001pUh-0DO7;
	Fri, 02 May 2025 11:56:00 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoxF-00000001pBZ-2XBp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 11:53:22 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86feb848764so479049241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 04:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186798; x=1746791598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dvv3aZc6ysvtM6PaScZm0AZ9BZs2r0w8R3h6Sq84JNU=;
        b=Bn8VlIiUsWdITitIn76PpAWdnl9lAW5CV0QnpeG3H/rHNfR/XupAB+8MZjXEbWlIGZ
         jjcy0RaEdx6b0cSZALb1WkRRXquxo9ePKrP0N7QXD60+wNjU8BebBWCIG45Y3shQIvFP
         0pUTlTsEikO/kOQaDGFnlMVHUV8xGVjMe930mgy3n9qKDIrI42vQeIn9v4mFmQAWyTMQ
         znPFdGetFrEGmW19bc5YMTwcjOnWbY7LQCd/ph8q6MGwfBk43xVQFznmS3zsJWq50G2I
         aZhrTEdLOKD2fDwS2qwhQYpTY+6zKFhbsZ0zHN+pckOQ2zewPhaposF/BNUKgas/onVg
         Y0wg==
X-Forwarded-Encrypted: i=1; AJvYcCXJnTJFGXrI2dBDFoEADjYqujusdpgfQp7s1E6MwW3Re7444Bqec/sz1H42maBCXm3rndkgGEBVQGTgdA2aueLH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+IUsKCD8DrtNBw6iljacYoHeB8g4txJYOTU0D9tYMSH65ar5P
	2NqxxCVtGo3ciNfkiOZoS3OAyj3Zwt9dXYJ7mm8TEZp966RAZl2wsTxyHuiP
X-Gm-Gg: ASbGncuqkYtALWnxIZR5Vlnodvj7YbZIhMpy4/S+jDYdonIgPLXv/+VA5w8EGOjm3XI
	3Xe76/Y3fivQHQcFUGZM79QkHHtcfehmNQLwnN9AeyCwJbvJ1wr4GRRoElng295OcMZp2WRibpG
	5BmdIeggI+xWKB90ov/HL12DX+wS3pD/89+3BZnpoEUC3p3x1ugrSgjPxrNgCec61hBrPrxyCTs
	QqwKij/AifL3X4oDqfgbrPNQp3PqmH21EzYTSYUbHmCZRftjhE4wPoVztMTFh5NrUg5HRHWu7Ah
	rBbEsLD4PkujutAwCRjpMyl1Nk1bb18dmfSWWw3Q4KgOb3sz53oUhjxq1sbiomVSA6S+5cZyi+z
	4B6Y=
X-Google-Smtp-Source: AGHT+IGYoiwjmQaL+fCxXcwtxqzwYOgNbgewf4uLI+ibpzAGny3Ap8kbLSLxVLQozfTTaNFCRkNGRA==
X-Received: by 2002:a67:e98b:0:b0:4da:fd05:ab48 with SMTP id ada2fe7eead31-4dafd05ac68mr692239137.4.1746186798449;
        Fri, 02 May 2025 04:53:18 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf23177f0sm411664137.8.2025.05.02.04.53.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:53:17 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c4e1f16833so544319137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 04:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhq+N2jZ68sl1UzNb5QcfeWo+RpFvoWzL3wuiD1Cdu5mUhBWERK4SK4vYVhpCULxm/nC/pZcTiO+EHn6hjSvDu@lists.infradead.org
X-Received: by 2002:a05:6102:5045:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4dafb50dd11mr1438920137.9.1746186797387; Fri, 02 May 2025
 04:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
X-Gm-Features: ATxdqUHd8V0pQvGYSlvvIMPnGrAT00VG3I_OsFOHO0G8lVIaFANIhY-BWLZCXg0
Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_045321_641224_98AB311A 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>
> Also include RZ/V2N in the list of compatibles for which the `resets`
> property is required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -26,6 +26,7 @@ properties:
>            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
> +          - renesas,r9a09g056-ostm # RZ/V2N
>            - renesas,r9a09g057-ostm # RZ/V2H(P)
>        - const: renesas,ostm        # Generic
>
> @@ -59,6 +60,7 @@ if:
>            - renesas,r9a07g043-ostm
>            - renesas,r9a07g044-ostm
>            - renesas,r9a07g054-ostm
> +          - renesas,r9a09g056-ostm
>            - renesas,r9a09g057-ostm

Looks like we have reached critical mass to invert the logic?

    not:
      contains:
        - renesas,r7s72100-ostm
        - renesas,r7s9210-ostm

?

>  then:
>    required:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

