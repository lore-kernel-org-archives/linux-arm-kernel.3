Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROcyeVCYncbaGDV5GQ7+90dm5cD3FAezni/Ys9hsv1U=; b=lC2PWCvC5j/L7Uz/8WbSb1dIPH
	j6DDY8oO7uQkd3UqSTW2qRaRchp9mSv0llCseEaIzNdAnZxYRkQJpv3BmJtC5HkAm1uPBkFEp+Xn5
	IUHWUsB3aaLbk155XFRofTJXXHYXPmsTTrLCOSklETsLpAHx+sOQFA+UYfxe4noR4K9UsDT178q+z
	MI+5Sp7+DgbAAgplFLXRGK3AF/jwFA/nbJbLn+7EXxNMVjfakou+NVDBq1CAUGMbN3/p0M0muIB/O
	nzDolqrlz3+vkOYWpKaDutI5TJxGLfy89jql77OioKEqDP+tNTnTBipaTei0/VpHJK6UeiyCHVFCA
	gAUj2frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWdO-0000000E9ze-0mtE;
	Fri, 07 Mar 2025 12:16:58 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWar-0000000E9Qg-2pG3;
	Fri, 07 Mar 2025 12:14:22 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so2571268a12.1;
        Fri, 07 Mar 2025 04:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741349658; x=1741954458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROcyeVCYncbaGDV5GQ7+90dm5cD3FAezni/Ys9hsv1U=;
        b=bHtjSHigEvf0w/irHb0xWyV034uFx1C3FHhMkMpt0f5Yx2TeW6W8WmI+wPf5E92avv
         lYOx9I5MjIHn4fPGvUmKnfxHgwZC8ZGsxxQxdugaZmsF32gIe1BcyFnysa1BZX+rZpSu
         zjWSqtB0tDgy+ej8v8881X7TEZqk3r1fiEnODVP+42IF/4Rl4Egwt299vHwm6E2XOH1L
         b/c4csBtZIk5TvULN1FAe/uDYK8Js6MNWP0Gmx6pvM0dwOy2MbCF/GoSauOgAKOl/uP3
         aQU1dVyQjqwooXlJvprtZE93wGD2km8HVhkZQaCu6vGXNK2qkq5H7a1apm9gawhlcTq/
         dAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvtnv11TBMxSngFWvRGYAAkM5EufG2+iyieQJm3RjM/7dUocVvreGwZcRZSdde4WDF92ulVVEFKjUXKzZvT2+DYg==@lists.infradead.org, AJvYcCX5wtYJLu1ijXw7Cf6xB7ocUsTtRyQSeY1tnJWn623zNWptbrt+pAibBKlj9uBnnCNBDdKoif7R0kUlNaJFsR9c@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2KnpEEXQ8WHxPlQBT5l05/W2Q0kPZoQp6Uv70BK8B+MRfUcr0
	mg7aYVn127fs3I9vOyfaiLqxG3tsyhRMjLAsiJy3ss0CDBW7zDNbzeQ2lKYcjDo=
X-Gm-Gg: ASbGnctqyAm4GnAesGynCJmZbCblXGj+6rZ65UH+Q4r3rqnD0OjOx9ujcGopXvxGfYd
	PsQC94j87FT4uzWYUw98DDBoMgYT4kMTLZFmkfDVT0PNHN0ljzliz/jZkZzCnydoQVelJj1My3I
	3yms78B/ZukCsjnc7wWFEtQVZ4punc9xi8uI+FWZbKQdcVTesM/E+711u1CUBep2pQyeFvRFvIv
	bfzkdh4qFa1BBksfUIkT7sjfZ5cl2RIqVdYxWXkV4/npDc2EjzRKYqhaNCtO3kqIQ5ULEB7OWRA
	jADE8qutcsGBk00pxucHSO1PEmngMKrW2lKzVVY1G63sjceLC1M5gAs2FGJkVHbRCL4NX/UTmR2
	5EdvW/LA=
X-Google-Smtp-Source: AGHT+IFZPK1Nc7tv86+TOgwXXK1IAIHdARBuhu5iZjSpF1Ws3HgA3Q8ypafdnvonew96jFslpMjplA==
X-Received: by 2002:a17:907:944d:b0:ac2:8db:7057 with SMTP id a640c23a62f3a-ac25274a067mr275936566b.3.1741349657922;
        Fri, 07 Mar 2025 04:14:17 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d3c0esm262732866b.181.2025.03.07.04.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 04:14:17 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf42913e95so263770566b.2;
        Fri, 07 Mar 2025 04:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJLLlkZNB5HAzNl4iFIwA0wXmLCa2eAQETyheQA714+vCBmDAwAPoDvkfdUzj2WZe6OisAqGoLf4Qpp3ps4xgC@lists.infradead.org, AJvYcCWWTR9XMNNaF6BEKBcTuhCQU9EoAcWrJZUej9bVPNMFldykhH4ZSUNb2vaaFppjKKTAUcyV12/1cGrHkIpG4a4qDg==@lists.infradead.org
X-Received: by 2002:a17:907:3e8f:b0:ac1:f5a4:6db3 with SMTP id
 a640c23a62f3a-ac252b59b7fmr392509366b.33.1741349657119; Fri, 07 Mar 2025
 04:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com> <20250307-vsprintf-pcn-v1-1-df0b2ccf610f@bootlin.com>
In-Reply-To: <20250307-vsprintf-pcn-v1-1-df0b2ccf610f@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 13:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVzQfGUr-wyHW3z=KN65OFpXWgfqBru9e_z8MKtk3pmfA@mail.gmail.com>
X-Gm-Features: AQ5f1JrXAoSReqv06x2VIYWRPdg-xCyJZ1PBeew-FyYu-xLixRBhXK4dP3ysYK8
Message-ID: <CAMuHMdVzQfGUr-wyHW3z=KN65OFpXWgfqBru9e_z8MKtk3pmfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal: bcm2835: use %pC instead of %pCn
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041421_709710_086FA94E 
X-CRM114-Status: GOOD (  15.80  )
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

On Fri, 7 Mar 2025 at 12:19, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> The %pC and %pCn printk format specifiers produce the exact same string. In
> preparation for removing %pCn, use %pC.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

