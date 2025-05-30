Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D35CC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2WzxSo6sYbiM6b0F2XSBjn+T4nA2ds5QVgGNEvrhj8=; b=F1mffX284MXtzNCtEFVBzjBOAD
	twysbT1qnQB7CrBSKixoopPxpxLnzbnEHBwiZ9WU27XGSzM5zEpZOKhdIkS4cPHloxptlvTVI8ioc
	MwhdES41cuCkKfvsv+i9X3VSS4nqocIMAeE4q+p8muJOzfjVr5DFH8nZgQVy4X9trr6e8bVU/zW60
	/KA/FASPw9pJ1mSA9SgnShPXLlptg0YWRs5Jf9jniHTnxIWcS5ObgkXcD4Xq/xDJQhTro2poHuvEa
	t+omNOjQNm4FocZkUW6RnYwnhe1okUYrWgBawDrR/8+a09/xm+pkmferYM9ZtK/osSkWEAtKCT1VW
	31YoFf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuwb-0000000HaEQ-21ZT;
	Fri, 30 May 2025 08:18:25 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuWQ-0000000HW0k-2twq;
	Fri, 30 May 2025 07:51:24 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e58a9bb8fcso597089137.2;
        Fri, 30 May 2025 00:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591479; x=1749196279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2WzxSo6sYbiM6b0F2XSBjn+T4nA2ds5QVgGNEvrhj8=;
        b=cScA9Qn0ZMIYsb7U5v6v/KcZksIxhgt/ve6U2VcQsII63+h7REFYTzJsOaYT8SzIw2
         g78lemUA/WIYPEHUEJeHS+RIieURBKyk0fR0ADy1Akj0o/eLEPWCHO00nsEAqcnCvzgK
         dr3uRsYbTGH6cXGh00XnYkAO0UxE8lp+7VFN2xbzbYBUYJy3d+R0N7KXOh0fzWxV6Y6u
         FXW9r5AigyMPBUL3e7mvKEyo1hD7/hN9mKisiqaOuaca+X2+54q7Ej10J4qqhvXYr8u9
         4zwxGzwbRQvxE5wO6qB/jTJI/aWqaSpLdrv6QlmFTS6MOEq5euu16zS0YRVM9KTuZesa
         w8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUgFd+I05x2U/QnthNlV2ezKdCKUJFOMU4LuaOHdxjmgx3rWkRSeVk4V7KLqPNCvnqLSiBuidFbgJHHsi+b@lists.infradead.org, AJvYcCW5shm4ByMYGJObVx6SXi+2bpOSld8JLUankPsVZra2ZAPQeK05fWcQSrWgTQxjUSD5rUZHrRj52nf0AWOBicKv8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIKldY7f3gmHbT3AdwoXw4fxTXfrC/HLCxIkReSybTiOCdPgve
	181jw1C8dJJOxPic5niu1oGpQxLMuHsqvj4LZY0DiY6heclwLn64wFqHyCWDztZB
X-Gm-Gg: ASbGnctRYOfUX5Gaz3FN04jsFicCcKGUYyInqOLFtrNwsVn70DB9ykOC4EDm09fitFd
	vnY860cZjWZ55uuEE/IK+r/NzYh7Xj+CHOYjV4kClepjXtgtWDrvgcSAxXvxr6EplV0YJCU4UYb
	EehEtJjpKCHS5DPGKVjGOGXpMeP9vs/BnhxAOe03buV/SHILJDve76bJkpVax1+Wxinaz3/LUSJ
	C98ceiIqeCyt3LpGimQq3h69C1i1/DpYqLpFtUGQYNLfQ9Gx5GLJJxIHvLtdWlNYzdo32v2Wf56
	10dlJaXx6p0gDiocC/3b1wY0epNcGsJSCD4a4YbIQsGDJknERxRFjD1IM5BjkWTdEmBDM6tN5zv
	w8yN9+C3+UsBXRqfnGQ==
X-Google-Smtp-Source: AGHT+IE3kVp3TkE91A6iqaHGnAGlJhbp71DlWER6jWqvcu71Ho+O4I3v2gGDmO7fDcCIiXaJwxD1Fw==
X-Received: by 2002:a05:6102:dd2:b0:4e2:a5b9:df1d with SMTP id ada2fe7eead31-4e6e40f5b8cmr2427879137.8.1748591479275;
        Fri, 30 May 2025 00:51:19 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a27da43sm2356303241.5.2025.05.30.00.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52f036ef186so500333e0c.1;
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxmq81yxrLofpYQy5tN/6q7BkDx7d3KyKegst4LIg5jg6ez2h55a5iwQWnCFB93jYX2vzrlccvfzbzWt35PZuUZg==@lists.infradead.org, AJvYcCVYaMzhrwX3TlFu6YApdGcD016UrOPsDUSCZRDNCgLvynZTndzJ8DhruEcT7nSJOCi/yomusWw1KHSdgXnM@lists.infradead.org
X-Received: by 2002:a05:6122:2188:b0:52f:724a:c748 with SMTP id
 71dfb90a1353d-53080f5955bmr1748247e0c.1.1748591478153; Fri, 30 May 2025
 00:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250529112423.484232-1-j-choudhary@ti.com>
In-Reply-To: <20250529112423.484232-1-j-choudhary@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
X-Gm-Features: AX0GCFu5SrfJ6XEYDFBe1Hbl2dYZBDrGAQ09XF6wFfWGxGH0eSYgcybRaCFnqRc
Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add no-hpd property for all ti-sn65dsi86
 bridge consumers
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	cros-qcom-dts-watchers@chromium.org, andersson@kernel.org, 
	konradybcio@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, dianders@chromium.org, 
	linux-kernel@vger.kernel.org, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_005122_733796_7D9E9983 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Jayesh,

Thanks for your patch!

On Thu, 29 May 2025 at 13:24, Jayesh Choudhary <j-choudhary@ti.com> wrote:
> In the SN65DSI86 DSI-2-eDP bridge, HPD is not supported as of now.
> But DisplayPort connector_type usecases does need hpd to be enabled.
> In order not to break any platform from those driver changes, add
> "no-hpd" property to all the existing sn65dsi86 nodes (that don't
> have it already) as hpd is not being used there anyways.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

DT bindings day:

  no-hpd:
    type: boolean
    description:
      Set if the HPD line on the bridge isn't hooked up to anything or is
      otherwise unusable.

On all Renesas platforms listed below, the DP bridge's HPD pin is wired
to the HPD pin on the mini-DP connector.  What am I missing?

> Upcoming driver changes that will break platforms if we do not have this
> property in all the existing sn65dsi86 nodes that assumes hpd is disabled:
> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

Breaking backwards-compatibility with existing DTBs is definitely a no-go.
I'll reply there, too...

>  .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts     | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts             | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts                 | 1 +
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi             | 1 +
>  arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts            | 1 +
>  arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts        | 1 +
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi           | 1 +
>  7 files changed, 7 insertions(+)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

