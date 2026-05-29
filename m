Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB2CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WuaQKbiM+t9dvJovReE2gh8Jl4CO7/nRuyMCaYJ/ns=; b=mSpcEJlAM42ie1ZCQrjgvE0EeK
	yYv/I1KstVrz+PweiU77defmEzY91CWkk5PpadlD9PTSlBJNwdOPEywmTGu29utH0M/uYgu7RFije
	2ZegrUzCHJ9ywisU+LhOSrcU6YDewImcku8esiqRrumqU+9qG2TiZ7Io2H2hOlJfFaWPfVa3oyNFE
	A1sEeIRpTJow4V7zbqF9HHQivEktwV8PZ78DIF30T2d185fPwEtHJEQkK1zix3gpHSakmfIfnt/5n
	ZxyYm7xLjaZBwoO269r/bysbmP9++auHdlq/XXaksUhFKhF7m7lea0pEs1IT9eGOFC1yvZg06vE0S
	UZKBuixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw9b-00000007ME3-0ifM;
	Fri, 29 May 2026 12:17:31 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw9X-00000007MDd-40zP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:17:29 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6c25b040555so269718137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057046; x=1780661846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WuaQKbiM+t9dvJovReE2gh8Jl4CO7/nRuyMCaYJ/ns=;
        b=BrbyI0DKQvEtnTPkI+gOzHjV3mIOvyZJciv3pYkVbpnac1YU7VJfIQbKlMcJjoY+Mh
         K9TkveKsSphavFXDem/KfBrcrRnP5pPquwYPerqGt6ThqUf24XeTBr6iAhoceL0fOazN
         mgd2vs0STOInrsDWiCE8uJHtQTvJVtu2KylsCtGMD7PyMlZ42nzwCnf1wo2g7/shml3x
         zhwKN8fCn15pEoCdf6ZyEf+cOMPJ+UiTW7Sx6pRL7sJXD9EaMEe0qTI6pG+Hlh4l9i/D
         uF85Qjvo22POIuf0V7GC3Xi3YKoBz/kigknuWm9RwxFAOMQTQbkNqoOo7UDCLA39Cpqa
         WV/A==
X-Gm-Message-State: AOJu0YzbW6TAR2shyK3JZRGGJXFNXfqYC8qTHktD+PmnwYdUfWxWnAHy
	4bW0OlZNtfoiwmnyT2A4t3g6/T/q9rnP31dp5v+dhDrsg00/6ODm8yr2NWpLQ71iWe4=
X-Gm-Gg: Acq92OGM1ksIQFeQsPSn/pq2JVRXdQcthIR99hTr1WsS41TN+tlXvIAAqDPM2dzmQeL
	Zt4dnkAeaBSIaB4bFwH/mHS1zJXbglD+4bQJ0rAirhBCPOWSM1+68dbH9kqqqz/t0j+IL3fDiwH
	R6AhPUmIFEJYaAMiImQttw6YRWQapJwiRK2IAwPOE/ZxzrYbHcu5BO7/BiRyDieEHLhBPcnkZII
	BhpkpDi+mMzyUmSk3NSq7RA0v/V8cpwC94WVM6ACgbYpsyU5zG7jvs7D2kuQ+54XRvMBsF7xn2p
	ZVhvRwjzumcZpp9Z/ePsrx68TrR54pkW0AzXBXwC5/cKsfm8fcoMFhYH++KvTWzmkSTwrIf3nEU
	Kktvf0LKY5sjG+eQrTTV+LLuPxWR3Jxs1VgSP/8W+B0HUtQmux/nc9yVPFLF1abLbcWt00X5h9i
	LB+bIBUg/XHo3BX2LKWQefB2VfZtpDWJniT6kdUSrjLzKq4XZzxeWA8y8jmyGqcYrPiVnkgBY=
X-Received: by 2002:a05:6102:c08:b0:610:db51:6f3d with SMTP id ada2fe7eead31-6bf2f59a4d4mr1033282137.12.1780057046107;
        Fri, 29 May 2026 05:17:26 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfc81ab8a5sm837603137.9.2026.05.29.05.17.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:17:24 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6c28e1511adso179035137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:17:24 -0700 (PDT)
X-Received: by 2002:a05:6102:8008:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-6bf39267a54mr993523137.17.1780057044184; Fri, 29 May 2026
 05:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504143751.42753-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 14:17:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
X-Gm-Features: AVHnY4LEBfBHPUiYx8mfjuBDO91FAYk3AhOWo-uI3g_bofZbbSK4hI5wATwCuDs
Message-ID: <CAMuHMdV5ruURO+-8NwYhftojpLOSHE=eMGVktMC0TnD1h=JxZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Simplify AA1024XD12 display DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051728_024224_90C5F66B 
X-CRM114-Status: GOOD (  24.35  )
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

Hi Marek,

On Mon, 4 May 2026 at 16:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Simplify the AA1024XD12 display DTO, move all the differences into the
> panel-aa104xd12.dtsi , rename OF_GRAPH links to generic lvds_panel_out
> and lvds_panel_in names, and parametrize the LVDS output in use using
> RENESAS_LVDS_OUTPUT macro. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
> @@ -6,36 +6,5 @@
>   * Copyright 2021 Ideas on Board Oy
>   */
>
> -/dts-v1/;
> -/plugin/;
> -
> -&{/} {
> +#define RENESAS_LVDS_OUTPUT    lvds1

Both Draak and Ebisu actually have two sets of LVDS and backlight
connectors, so you could connect such a panel to lvds0, too.

> --- a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> @@ -5,26 +5,52 @@

> +&{/} {
> +       panel {
> +               compatible = "mitsubishi,aa104xd12", "panel-lvds";
> +               backlight = <&backlight>;
> +
> +               width-mm = <210>;
> +               height-mm = <158>;
> +               data-mapping = "jeida-18";
> +
> +               panel-timing {
> +                       /* 1024x768 @65Hz */
> +                       clock-frequency = <65000000>;
> +                       hactive = <1024>;
> +                       vactive = <768>;
> +                       hsync-len = <136>;
> +                       hfront-porch = <20>;
> +                       hback-porch = <160>;
> +                       vfront-porch = <3>;
> +                       vback-porch = <29>;
> +                       vsync-len = <6>;
> +               };
> +
> +               port {
> +                       lvds_panel_in: endpoint {
> +                               remote-endpoint = <&lvds_panel_out>;
> +                       };
> +               };
>         };
> +};

With two panels, the channel-independent "lvds_panel_in" and
"lvds_panel_out" labels may become an issue.  I think you can
fix that later using C preprocessor concatenation?

As we don't support the dual-display use case yet anyway:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

