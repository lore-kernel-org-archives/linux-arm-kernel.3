Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0587CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jssj8tcz0aY4xx9zjyBXJVY+CGYy95sOugmtidwxoNQ=; b=vR531oG4ynCKEmdsFfYqTWY0/S
	31ZSXTz8qMCg9/ESNgNf+rOktDk1AGhEnZpoBNgUFS1udAwRMPICkl36SuzVAL0Bp8ycxPgB/nJic
	tr7Pic4dZtsMHDd48xrNQF99M7257y8PIkU7J+K20bkBUgg9CNfUgM6DRQEVFUrW1aoSKgoISf66k
	kDqnRXyH4b4UTJipzdridE7qc/IuZeJiHlQcaP47mUdroIoceFaJcu7wgbgvp/cFsoudLU1kk0YJI
	ioPqij65n+6zxMD/slCRU5V3rC9NT/ZEfaZ+SNje/8o+xsaSXtFHy9TBeN1mQjzryZgxfEVumAMe+
	sbE30uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd11-0000000Di9c-32U7;
	Wed, 05 Nov 2025 12:53:31 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd0y-0000000Di8m-19pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:53:29 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-63e2cc1ac4aso6327026d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762347207; x=1762952007; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jssj8tcz0aY4xx9zjyBXJVY+CGYy95sOugmtidwxoNQ=;
        b=huJlpPxaZN0KBg13mu9BEZJEVj0a4z6OZsHoB/j3dbTku80bBQ8C/mzp91jP5Z0fE1
         4OmhHBN8vZglRUC4jtAxno0Ut7GwDwespgmnawCp01bMahv3mi2JkuLQCN7/X45ptuEb
         /N9kQFQbWWzMlXt/KZsp4Jn3z4dHvi/0FReWCY7iC1Uh7KsVqvCZEVay+l1WdXK/Sbeo
         Y0mmiJTh7XEjEtOss5iZPrM9zSCNdsk4SpjaCWS3YHwpNHhr+7HrXEeEPQUQiSorKPRB
         eW4aLIk4wRawEY2mqIN/PM+lrttidkHS/okf7z5bB9MnSJXulC62Xmu1cCgNFjDNQtfa
         d4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347207; x=1762952007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jssj8tcz0aY4xx9zjyBXJVY+CGYy95sOugmtidwxoNQ=;
        b=X2oX/npdjxJoDchr/i2m25Gt0vLXkjghnzyzV0QzQVfWM8rHVs2lyepUucso6vpBxs
         J+1GXAaFtGwj6GNOqw+Mmc7bbcDi1RALtf4G0XBbTTR7YtFz7zSH522CBsnI0MZQ3coc
         KcU+CqIoK3Zh7sKwRBb4Zxf0q5idX+/BOCQzvjxJcyJu4WMjlS2KD1CMXI6Rf/X/UPWX
         sJ+ti/iajS2MBTmJIfLalPnFEm6VAAZfr5UGEVBreYQLPuYgSqc47LnsZvRCUSg05IBK
         owItuznOr1YU5aDL5W1n50NRTHSRFjHBR0EdqKMeE2J+6FkIklspV9gItysQda/pVQ2K
         tVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB+UjOVAacdnr+rWU6YZ699/p9JCrRo9wMhINOgsX+n4JxbkQZZdRIdIBJCoSiE3Bk+MUHU2u3Z/7pRFBMGx5h@lists.infradead.org
X-Gm-Message-State: AOJu0YxlDEPbQAnmV+YKoW/VMUiVdM/npxJ3yH/0xr640LgFLNjL+91l
	FVWWjj8q4KtwwL+J5rE2fPK/1aO3KdA3y5x7R2KbwsjdhRERs6vmKBBIpQGFKzEiZlNnH1qkJ3p
	OqJbtAuZoe4nfgmkFLa8eXqkq8dbqgf7TWSYW6k5ogA==
X-Gm-Gg: ASbGncslUbNl6CqfCrNAYdnxREelD5VEyOTVIO1qQ/GhRrGDarKC8LQfuh5ug4Lao8d
	aFgQouP0wbxSHTqNONw6qDH/ufTWrPcm0DGEX056IlEiy8crurQSOJuAqHxAi5RWxwMVbofYctr
	BoIsinhCZin/sHOExZpI51slxVOw2/6hu7fqyB2x2/wdAFBonR8yBh4pX+n+u4zMktUJ2hbR/wN
	siJxrQ/fLgpASc3UD+adkkA77Y2oJfW1g3pStFh68l3i5mYN0YbafQXG4sGCg==
X-Google-Smtp-Source: AGHT+IEfE0sgdiFVkZmKF1dZxXig2jTxj45vJSC6LxMQVNg2FzDnEW5ajmYQgYPmXHM9+L5zmqyzIeI1NXQMsR92k1k=
X-Received: by 2002:a05:690e:15d4:b0:63f:bca7:fff6 with SMTP id
 956f58d0204a3-63fd3571aadmr1876951d50.36.1762347206857; Wed, 05 Nov 2025
 04:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20251031183309.1163384-1-svarbanov@suse.de>
In-Reply-To: <20251031183309.1163384-1-svarbanov@suse.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Nov 2025 13:52:50 +0100
X-Gm-Features: AWmQ_blullTpT8Nfe-qMS1ztFmCY1ERew4O3PuDztRrqUvx0BImetke1Cxs_hWE
Message-ID: <CAPDyKFqHizQKSDCuPopNBWtt1mNCNuWegv9c=PcXEEVaUaP3cw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add watchdog support for bcm2712
To: Stanimir Varbanov <svarbanov@suse.de>, Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>, 
	Willow Cunningham <willow.e.cunningham@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Saenz Julienne <nsaenz@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_045328_338693_59BFF506 
X-CRM114-Status: GOOD (  13.84  )
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

On Fri, 31 Oct 2025 at 19:33, Stanimir Varbanov <svarbanov@suse.de> wrote:
>
> Hello,
>
> Changes since v2:
>  * 2/4 - Use maxItems instead of wrong minItems in else clause (Conor).
>
> Comments are welcome!
>
> regards,
> ~Stan
>
> Stanimir Varbanov (4):
>   pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
>   dt-bindings: soc: bcm: Add bcm2712 compatible
>   mfd: bcm2835-pm: Add support for BCM2712
>   arm64: dts: broadcom: bcm2712: Add watchdog DT node
>
>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 38 ++++++++++++++++---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  9 +++++
>  drivers/mfd/bcm2835-pm.c                      |  1 +
>  drivers/pmdomain/bcm/bcm2835-power.c          | 17 +++++++--
>  4 files changed, 55 insertions(+), 10 deletions(-)
>
> --
> 2.47.0
>

Patch 1->3 applied for next, thanks!

Note the dt patch (patch2) is also available on the immutable dt branch.

Kind regards
Uffe

