Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4yI0xKDh/Dea2okbvkBvUlDWnDM+bOQUmQtln3xRsI=; b=pdvxfOV/qIsmZjYokoMEHzEdlC
	/dPb9L6FzK6g63p7rz+Uso1VvpOa2geDQ8hA2N6XRhYoLslSPBDVEEQhFe8aYaU6W8965duNcrDS1
	bpFfSVKHHC1Pr3/ePE90mkxMSqS4DkQZuVCg2OdmDZEw4aVQVyA7Nqk15Yc9CCseiW/8MBUjbNDFV
	HKrD3y3/e1dcnCR6wv595VX9GqshbmYPPwKzL1feDBVWA9L51qPhQP7gE4g4wpjexoptTlsMZwZNQ
	3tsxS4wgDtqW2LkGgW4VRe7Z54C+xTU0JHEnPDmSJVMUJJ3P1FSRZ8pCl2DNKumeKkHaHihuxBOX+
	17ADpnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHo8-00000009p2u-2s8a;
	Tue, 19 Aug 2025 08:35:04 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHBH-00000009jhN-3IIi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:54:56 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53b17378b74so1848012e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590094; x=1756194894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4yI0xKDh/Dea2okbvkBvUlDWnDM+bOQUmQtln3xRsI=;
        b=BVQ4pdoXIUt++CLe3BTUS0s/GwaiLTb6maWqOSSay35ZQHCdbVFqSoSbJFTcPwG4zK
         VAnXWWgFjF4vdir9fq/jggJsqS/xWF998SCvzWPLKcpj+AHQlJx9mfYSfFWvGNEtHDBg
         +vjqNsXvSOO5i4KTe+yA+XVgOsH60+fPMtGgCEb164qSEsByGLfvPXcGKo8uj4lIAkDB
         3smTyZV/N/iy7rKjts08W5TWpFmWQGVn8p7Wu0zxxVp/9/8uSCNACT6hi+82YE93HtDh
         tJR0b+vk4OPilKUBSyVzA6w6uuNMCV7AsbWFdEXA6ErCEAU6D3VtYp5DNBErOA3dkxdf
         sCzg==
X-Forwarded-Encrypted: i=1; AJvYcCUcAF9qv56PLWJBh0b28txZXf8nf1a+RidEMUtSCZ7mI7pjwhhffmuZ3iNCZgC4+w2670iZnBQ6LC6UWncOIV8M@lists.infradead.org
X-Gm-Message-State: AOJu0YyzgZDXmecXDaXRybkRsVNyHWQJzcxXn45caSBo63wL1rYkCmsM
	ogXO+2MSI5Xh57lBlPWJEeMw+QlyQVEI7Klv7DEb8nTSH94fcRBjIHDlR+lISPD2
X-Gm-Gg: ASbGncvLmMPzApowQO0p3yfdJ6sEtJmB8ZdvkQ00wRXCRqtTfupIb+E4IKCg1NIkZ5y
	WPc2JWyS9Jjk/9TavVBJpHeIUI6/S4QoC7EGMKcjRZkPOK60j2RDTf2+Qa61ZSujnHJxwvh09hP
	4E1YvMXG10MA2iyf13NmeThajTZfEsJpU0w88AliHenh8VUKSldMPA30kMj079Py97HHwosK3yE
	ccyebLioEh4h88zzLWBuFelDPJ70IIQLkmDCohwx9H90tYdc/SVsLLKIkuWTwX7wblN51vEmhnl
	shYIt4W8FCc7QMpNpD6cNgxCoJYVFlh28428ufPf8oVh2qgKmZjQq0J9OCTtJT9RMMnZ3RDU6VQ
	BNQl1UWplL1r6vzp8IblxDlDXMToIyqc70IhSOpJDpJcTRpCKs0RebhLH0Rln
X-Google-Smtp-Source: AGHT+IG44BYkLgTxd5W0RO4RF+GAvpbq66QkDR67u+Be9ZSz1z+V30/bRY4Evk2r03EUGxTlb0bg5Q==
X-Received: by 2002:a05:6122:1d0e:b0:537:adaa:9046 with SMTP id 71dfb90a1353d-53b5d2e68b6mr458892e0c.10.1755590094138;
        Tue, 19 Aug 2025 00:54:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2ba75b1esm2686171e0c.0.2025.08.19.00.54.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:54:53 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-50f8b94c6adso1207172137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYpaKFsZh0jjW+Fkh7fVQPvZDhULMYs5yoyN3/DbSzny5pD4c6nrVY3/yEv+uzZ0dRzpr3fNV7wx/MfrmXIsrv@lists.infradead.org
X-Received: by 2002:a05:6102:8014:b0:4eb:f8aa:9c36 with SMTP id
 ada2fe7eead31-51921c12678mr511890137.4.1755590092715; Tue, 19 Aug 2025
 00:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com> <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250818162859.9661-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 09:54:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcTXy3fSjviMEFFx_4EuVmVHSCZng5rntS=GGi6Yw+kA@mail.gmail.com>
X-Gm-Features: Ac12FXzL6P-kwtOHmhi_mrIjxX55aKCrGaAQmVprtvtxZM21ON6QFS3Pzxbvqus
Message-ID: <CAMuHMdUcTXy3fSjviMEFFx_4EuVmVHSCZng5rntS=GGi6Yw+kA@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] soc: renesas: rz-sysc: Add syscon/regmap support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_005455_822042_F3E6B02D 
X-CRM114-Status: GOOD (  25.12  )
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

Hi John,

On Mon, 18 Aug 2025 at 18:29, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E system controller has various registers that control or report
> some properties specific to individual IPs. The regmap is registered as a
> syscon device to allow these IP drivers to access the registers through the
> regmap API.
>
> As other RZ SoCs might have custom read/write callbacks or max-offsets,
> register a custom regmap configuration.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> [claudiu.beznea:
>  - do not check the match->data validity in rz_sysc_probe() as it is
>    always valid
>  - dinamically allocate regmap_cfg]
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for the update!

> v7: As this is a duplicate of [2], address comment received there, that is,
>     use kzalloc() + kfree() for regmap_cfg.

You use __free() instead of kfree()...

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -6,8 +6,10 @@
>   */
>

... so you need to include <linux/cleanup.h>

>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/sys_soc.h>
>
>  #include "rz-sysc.h"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

