Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA99C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nVfiSll248rUsfwTdZE7ebVgcWytnodaotzGSUKaQ4=; b=aK/4F3PGONx6MPKcthiC8O2GF1
	JAZdXqe4p5KRq9RHuGi/lKwYpftD7N34OFqf5Gjlq3svbbVWed2yVI/bWDkBtsY3P+o12BLm+r9jY
	RezUtHlsZzCCA/higc5kozmmv/5Q10YyMrljGAynw/yAUu7+QKaQ3MokjxoqXLcWddils5dv//DAk
	ZAZk+Q6QGZyHtC5ihuJNJrKmd7IFWCw0CAqUCphn5a52+nmhT83D6BUHFUkAXwZiQz+JXQ9wsESaz
	3EyDkvyd+tekjdxYnEsRjU7d5OB3IWnZVMUvab9pcZx6OYsYTpovhvutdh/SXT4lb+kwv03Y0lLwK
	PB+95qvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC5o-0000000BBrg-1gNe;
	Thu, 06 Mar 2025 14:20:56 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC4B-0000000BBSW-1Crm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 14:19:16 +0000
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf538f7be0so137045266b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 06:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270750; x=1741875550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nVfiSll248rUsfwTdZE7ebVgcWytnodaotzGSUKaQ4=;
        b=tUSrNqSiQarPnMN/jH8l6thzo7nWklr9talCGwhUR8/VARCEJwjazVGEaQ/ejzpn42
         2uxvg41W7rDAlg4lBfnsiCCypAxfGpm2942nw8pcY26GXf4FtTbsQOMNjpk/7XElmy0i
         9wRKXjD6Xhme3w4YMfnnpjRpz/M10WjuwdjslAM05RJhhjBzvKyy2tcqJhkvJqB5TqnL
         Dcvj4UT8RiWIGdx05qqy/pBeKHRy0Ztv7HrDOJ6EphcMstSNxjBMA6o2hrhBWO3dujxL
         QG/jd6fqwxzGTbRKYuljgdCpGRcUjAnaYcw/1Nn4zgg706rqqrOtksWcXx5oYDnzWfvj
         d6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwdGtYWSZajBoqm8euRKeTiYqktwzTZYaOAYF2RTR6AnN5czh/H6sUSLaDCnsrAAM0ZMq+aPgCxGySmPY4WFYp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj8BXavg+VQ79peANlkOPyF1WwmOahxqnWZiQBJJQcffF/UOCN
	vgIB72NXSFFL0efQuOT7U395xOIiGFpWUmPKKygRavBY4TBQx/9UQ6P/+39oYd8=
X-Gm-Gg: ASbGncshjlqkLXFuR3zCkTBkTsrRmHlbay4qY5klaoLk8VkRh2d7fgco7xN+wMB+jnw
	Io71KiHHLqWPn4VOVmDhjtWwQmwRNnnx1wa7mKxm0gtdqNag+3GuOnRy58/vZ2/CVFlNO2r8c4h
	SWDFzvQALWlgU5cnmpl+//doKtb0Z6qsBichkFFm8v7B2GFWJ7Cjkq5RnS24of4bHe0oaCqEjcv
	HhdDoivbuED/VuDwiUTlZjiOb5f+ES2SyTHIV4LICYcTlDAsOPqgM0be2c4Ai5WOYDGQFCy42rM
	Ar4aT+jl3xa7BzRxElch6kVWHRWuITWA+fMNFfufXDdZXX+0jvzw6IUA3QCRXy0DpE1FqnpYZtw
	YeDtR+gI=
X-Google-Smtp-Source: AGHT+IEjlJ9azKzuKGAjvSMcGoMI2iANlWSlO9YFDe8ijHb4DqvVrpl3xvI9pRfS+rdDhCaL0/Pxpw==
X-Received: by 2002:a17:907:7f86:b0:ac1:f5a4:6da5 with SMTP id a640c23a62f3a-ac20da895cfmr803654566b.37.1741270749967;
        Thu, 06 Mar 2025 06:19:09 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d47c8sm100454466b.182.2025.03.06.06.19.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:19:06 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf518748cbso131675266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 06:19:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAJ4vvEy+DpTkdT/MZYkAUDZa+iZcr0dL5LSl3fIP1LMZctBxCc2oWzkbonHCrF0j7hH/0pNm/2k4mcPNhEE7S@lists.infradead.org
X-Received: by 2002:a17:907:c27:b0:abc:c34:4130 with SMTP id
 a640c23a62f3a-ac20d8bf8c7mr709557766b.18.1741270746647; Thu, 06 Mar 2025
 06:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com> <20250227122453.30480-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250227122453.30480-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:18:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoXSerYfb2L_tLmC2-5w9mhoZHc20LSYQgCHxB+bJOtw@mail.gmail.com>
X-Gm-Features: AQ5f1JpSCkfow0oWUCpHHLfYKAm9cW04YyVX-MUYgns8UbS1cnyHUBvgSNPUv8M
Message-ID: <CAMuHMdUoXSerYfb2L_tLmC2-5w9mhoZHc20LSYQgCHxB+bJOtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clk: renesas: r9a09g047: Add clock and reset
 signals for the TSU IP
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_061915_325684_D721994B 
X-CRM114-Status: GOOD (  15.99  )
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

On Thu, 27 Feb 2025 at 13:25, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add required clocks and resets signals for the TSU IP available on the
> Renesas RZ/G3E SoC
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

