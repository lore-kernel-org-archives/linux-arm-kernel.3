Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81975D5CCB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgfoTzR+2hIhhje2BGTwOg4t17NZbptniFGPOQ3kcZU=; b=CaDI/8/DIqlyZVpreGgnbdTKkQ
	WED5FzHKlhYMb/yaFyPuXmuJ6M21RTbY4kftFQKPusaX8h74KKIH7zrQwZyM2AT4gmcwvylocOeae
	8YFY4I9GPKBSqEZyHXNtc/saAfxGZN2VCjc2F3pZ0BxFcoaPaVCQXp5s3yNOKlU8GaHhtXsT3aoBv
	cmG5DUNB1Ms1jUwOmPrb5YYJc72LU57VfUsD+spXhRMnB0hwvRJNakd86/iqoWDgsZoWh2xjWNB1P
	Bh62/i740EAtWBDu8TO5W6U1JNa8J/osWM87TEsCXX+7RWQjuxrV2gVtnOOsiEy5fva93TuTfxjoH
	EHKO4eGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6B6n-00000000zEV-3GwX;
	Wed, 30 Oct 2024 15:59:45 +0000
Received: from mail-yb1-f177.google.com ([209.85.219.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ar4-00000000vFN-2r0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:43:31 +0000
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e29327636f3so7207024276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303007; x=1730907807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgfoTzR+2hIhhje2BGTwOg4t17NZbptniFGPOQ3kcZU=;
        b=IDSHi7hwsMDCVz1oudc0rpbbzUJSVYhAdkqgygpGwAWJ9Ir3EzggvSBi25EnH6+Bfh
         pKENSbS3SQyde+Wi3TUSZUwR/YoC2oXao8az7YDVq7OiPHg2ZUgL9TWed7kFvYiYjswh
         JzzCMQYkSX5TovkiJjon3YiXPWkIgnPNhHJQgKGah5aXdpLKodDqrrw4ENViJyPXAFiQ
         MxhJZ761/n10nqz0oxGDkStlrgMlfjN2ZRyN6SIYgvMmE3H9tPbemTuXosCJ+cKxoI9F
         0+DSUT4EphUm+YGNP17Rr2yeTurkvp8Ci+F40K/HxkLW2U22lXWE/x6D0PsAxA22scDb
         Skvg==
X-Forwarded-Encrypted: i=1; AJvYcCVTbQUb2xpp42TSTq7z0IZFqYVHwoDcsNiKwhfikcCqKe4tQaZFvotqrWZe6JjZLUW73AyJKBcvyCKcyhnRC8t1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8/IISuAMTeT4ETK+E5sXdBKD556pI+BHxPjyDSMcNo4phvQWa
	ikYZikF5XZFdsjvlxLTG6NdlomOg2zt32R4JNxKrBz/+I/rzdO0iKh7XSy3d
X-Google-Smtp-Source: AGHT+IHH3sXoPSh61uU82zobUcBm/N+OP1MHNww3NpeJGf1s9tt4XwPZjvDzjQ5J/tIXobB01B5Avg==
X-Received: by 2002:a05:690c:6488:b0:6e3:2608:d5af with SMTP id 00721157ae682-6e9d897edb9mr165867427b3.26.1730303007340;
        Wed, 30 Oct 2024 08:43:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bafa9asm24523157b3.27.2024.10.30.08.43.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:43:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3b7b3e9acso64480577b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuKjdrPx541XqYoXHLZtga+V1EefnZLOT3Vb3dIR8NKgxNCw4iPywa5YFxP6ecp0UMFcNVXjIJ/W/ZKLbRrjPC@lists.infradead.org
X-Received: by 2002:a05:690c:3388:b0:683:37a8:cd77 with SMTP id
 00721157ae682-6e9d8ab98c6mr169194477b3.29.1730303005903; Wed, 30 Oct 2024
 08:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com> <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241030110120.332802-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:43:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTtCX5CO4y_Z2vcxY39oaHFuzH15md4xsjkz9RR+bByA@mail.gmail.com>
Message-ID: <CAMuHMdUTtCX5CO4y_Z2vcxY39oaHFuzH15md4xsjkz9RR+bByA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084330_739579_4FF7BF0F 
X-CRM114-Status: GOOD (  21.89  )
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

On Wed, Oct 30, 2024 at 12:01=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> The RTC IP available on Renesas RZ/V2H is almost identical with the
> one found on Renesas RZ/G3S (it misses the time capture functionality
> which is not yet implemented on proposed driver). For this, added also a
> generic compatible that will be used at the moment as fallback for both
> RZ/G3S and RZ/V2H.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - added back the #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
>   in example section to fix the build error
> - kept the Rb tag from Rob; Rob, please let me know if you consider it
>   otherwise

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

