Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8545CD6D234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=; b=WCOAd81Kk2PMtwvcMIpkSTDrAl
	rVvqXSS2cuU5cxWFdJaulP0/WxBOZM9XqIGw9tTX/hFDm/tZq166CszHQVFwmxp+rw3q9fbARE7PT
	+WMfkLil7ShqGSD+BfJS2q1o7Z+e+nXgm3naFBaPHsG5XxvMPUotvalhhG1Bo+Xiyl8ZyEph/V/YK
	/NKZ78sDwaAZ/kH3KuQ1iHTM7DDsL2dC+VMMoOxrSlK7qgMiF2acrb3vI7/V5ASUjPTtj/y1rLCcR
	EGxE2x8xRnlCz8jSkHJeUNGS0gtEbr9D4JDkhu/i7JnX9pd7cMVoLGh/4ykPFhKjKXbtm5YL7CYew
	6ACRWBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFtb-00000008gyh-3uwB;
	Thu, 18 Dec 2025 15:26:27 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFtZ-00000008gyK-2Leg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:26:26 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55fe7eb1ad1so501005e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071583; x=1766676383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=;
        b=MMyH4OdLb4niFhL1hRsm4W66apBzuoJf2ag0sQ1zWVh1j8d1V9X4sxcPSXrynS3Z33
         tnyhER/jFoDzguaniQO7vBluJUEeW9AGMf2JWAJ5ZUXCfyGWDjCl5xB6+qQTTV7KY/DP
         MVYRX/ddZWf8UvgnvOE7m2+0quKfSRkvqROFJyyMeOBxFL3VrPtpRzvkPOdhzqo3lIrH
         FhhWcueeekx+JLissbdAT7AIj+xoja+RR7K3MNrLh2gu/6ba0czRDdsCqfOEWmGZKh6G
         d0YPEigbHu+wWyId09lq+PeAqtc6tjlPrgI9UDmiGQHSdVF739qXQAvHo8y3Mdt+xFZy
         +sCA==
X-Forwarded-Encrypted: i=1; AJvYcCX/FEGmi1SBzLn9G//fWVwFta5HlVw22CkqFbklS5nRQKXv7NGYpmD/DyPgL+np83kUOhlU0mBXmemOHtdgVPew@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJHqV0DyOLhRUnIyCpyEqEP/SDf++E53y8HRtwVgIJMg6tlrs
	yrwgcZFBtKFBJaMRddr1PnsQorn1/ACLf+SBe8fmQZTEONEC+I7TAt+dvqwI7T0z
X-Gm-Gg: AY/fxX5wP1fQ8HkgBwixZQgzegeSRsROb5HWgEcy5aVCKCVzyhf8H+6f5dTMuFfIIm7
	R9ewCC659NG1l+BIsQN15uZeX3twbV2bYtr6EZeQfjONKSVaOi6m14KRDQtRSadVSYHjYK4QgKT
	u4urobwv1NZ5leKhOORklrWeTW91SxvCjzt8Zt30SvlS+Dc/IZDu4QUQqInCgA9cwqBZPkltKsK
	fpXXUydhgHNeiOs8tQSZfyeHdstFd5TcauELDiKcSIGDLdno8LALtXD1LcQv7BV8TjiqcQhH3Eo
	pE2WaKAYAbFwE41C3HSGaUnY+Ooumht191QuRBXmsTyrwb2IXnWDd6Mtwoodq2t443sCO9trw1f
	oNItIS7fUVzHLaQooFFNYeFCqVoCQMuAyYoXCU0Rr1gQdBhMnp6lRbaqLmaY/wK0T96JcDVaLXs
	H2nbHDzQNtzTGUNM2RUn2AL3XJszohUREotD7bJa1UI9J5pros
X-Google-Smtp-Source: AGHT+IEVqKLxm7j19dq1SlKmcFOoZidBjuv/8ORcWrr3m+7gY7O+GLkUk4qkn+4HzVznU55RAT1XAw==
X-Received: by 2002:a05:6122:4591:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-55fed6269e6mr7352492e0c.10.1766071583236;
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615107d88esm1078485e0c.20.2025.12.18.07.26.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5e53441429fso496298137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh69UmHGdLSEjTBjcazfGieXuh8tORq5Dmka8gCDtEyUU1533mDkEnfHs9pf39gjd36LRcQAh8/4YKobhkbPsX@lists.infradead.org
X-Received: by 2002:a05:6102:644a:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e827475423mr7568578137.7.1766071582885; Thu, 18 Dec 2025
 07:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:26:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
X-Gm-Features: AQt7F2orA3yT0lOZg8JX_FxOJmakbvS5h-4BSNrnlwxZlZ9eRsbqovvybB3Xhko
Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072625_598792_A2172CDA 
X-CRM114-Status: GOOD (  16.45  )
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

Hi Alexander,

On Thu, 18 Dec 2025 at 16:21, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Add "clock-output-names" which is a standard property for clock
> providers.

Why? Isn't that property sort of deprecated?

Will be replying to the cover letter next...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

