Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D5CD74ED3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na04EJHnGuwBWJSiBwz4H9SjxnMaXn6qdMG7GO1T4ho=; b=JPF3q3zFRfxbgDOkBEQkw8LaOm
	8hYSYygw9qFPRC1bg9Zvu5/38hjUJpDoYmvaCI9undXh/jCvUXUVqjVWlYsgmGwtTkUbz0CRtKs2M
	hHYSBPMJktxElLbss8HZzJQ7pOem9DGGfkQayzyPIca/pc2EQSFMiB02pTDiv8uooQ0u84oRtMsGd
	Wd6YS1dMvu52MlFVrXP8KZuwHUzXSgtzbvCYJ8pGbzhkrciMeodf32jvl8SfUrslo+S+3a+AlX1WA
	OXznGPz9geFKQMYqP1msf2FbTG9++Hup+E81fjrUv2XbR4KgBMojEOrrIo3tkNTtwCxKc+vumXHGB
	3DbaYZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHM3-00000008ylB-46oz;
	Fri, 23 Jan 2026 13:37:41 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHM1-00000008ykK-1p0G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:37:38 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f5774571eso552512241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175456; x=1769780256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na04EJHnGuwBWJSiBwz4H9SjxnMaXn6qdMG7GO1T4ho=;
        b=kax/LM7jKv2OX811Hh7E2WfR7NgghNQneX/hh208l3dxXE+y/1R4OXD/Ymuj66ppVY
         vjDrc/28engin06779cSWPV5WinA2VB7QX3yvPprHUoUujjbZAto+tsXVZ/lMb53baqo
         l2mQuBU0yiodR7HJLVWSTLlWeMEVQc17uCjsgDa46s2t9TfBIHoTGYfN4EGt0Kpipkcf
         JNFfd1ajPsVTjZmMy+LRNi71y5qbUmSJOXGs4mZYrQ3Qs4Rg3l+3IRMKyUVPbz/1r6vo
         oxxGjTC+2zuN/31TVQGo5UhCTug7AL1dit4yT6w3cq0krhbA251TTJ4Mioj6zhtjNVdW
         Ttrg==
X-Gm-Message-State: AOJu0YxsSam8AWN+QC1cGU4Lq3FF4QAi3FtNF8ssAq163FEEmxDgp4q+
	F0ZOxeYPJ16YWLWJKndDy1DNPm9mP4sBIR9pWMuw8ms1p0b2uf9IHNltImoaIA5z
X-Gm-Gg: AZuq6aKG6FPyEd7DEh98UO5TQQoGDHxHhPpo1KTVfeJb4TLt3IDbQua/rYEStRKa/D4
	uoacKhG+F8vdD5cwP6lfcYa0KVzUeeHJVN4RIWRgTkTaxxGxWPV70sStY1GyMpyu8aq83LgASEd
	i71lSJTJ0vJDZ3nj5GJAgUOILjh+lXG4Hn/klvKpfX8S5Sq2nmePlcQi+a99xlAcrFuVDBN5Mx8
	oA21N91M2clyfT1Jh/ToT2nYC0BY2wM93ZdmTR4hGYgYctucQhluiPktM4Q7DM8/LGdifomThn1
	mgGaakCRlWCCAB5rY12rv2t+k1KOsQblCyhEpp4Zurj7O1jMBvtExOIPwZemQZ211me64k7T202
	evwa+eDFZ/NDRCMdl1XP2mySeryyS3g+0THGXQu15WdAEyMYqwwSrdeOAac26TuvJ4tG0l4TO6O
	xqnxFCMZ/pklvzQQYmOH2wkCqOe79yUQJC9EYf0oPqcFLFoLl5
X-Received: by 2002:a05:6102:a50:b0:5f5:3719:19d8 with SMTP id ada2fe7eead31-5f54bcb605amr844361137.31.1769175455901;
        Fri, 23 Jan 2026 05:37:35 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2aa79asm508135241.2.2026.01.23.05.37.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:37:34 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94801cf4bb8so639449241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:37:32 -0800 (PST)
X-Received: by 2002:a05:6102:3753:b0:5ee:a6f8:f94a with SMTP id
 ada2fe7eead31-5f54b9a5530mr796917137.9.1769175452517; Fri, 23 Jan 2026
 05:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:37:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
X-Gm-Features: AZwV_Qg4phN--rvftcV-K3FmN-Id0724_eD0xvFoKX3QxXmm0sEuNGOexfRaO-I
Message-ID: <CAMuHMdV7UPWCqj4A6097KKT+Es2Zz_mPeJoyJd5qDMudrNx_5A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: ulcb: ulcb-kf: Describe
 PCIe/USB3.0 clock generator
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_053737_472616_465D7494 
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

Hi Marek,

Thanks for your patch!

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe the 9FGV0841 PCIe and USB3.0 clock generator present on ULCB
> board. The clock generator supplies 100 MHz differential clock for both
> PCIe ports, the USB 3.0 PHY and SATA.
>
> SATA is not yet described in the ULCB DT, therefore the connection to
> this clock generator is not described here either.
>
> The H3 ULCB schematic does describe connection from output DIF7 to
> USB3S1_CLK_*, but these signals do not exist on the SoC, therefore
> this connection is also not described.

That is the case because the first ULCB came with R-Car H3 ES1.0,
which did have two USB3 channels. R-Car H3 ES2.0, M3-W, M3-W+,
and M3-N have only a single USB3 channel.

> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -352,19 +352,30 @@ &ohci0 {
>
>  &pcie_bus_clk {
>         clock-frequency = <100000000>;

I will drop the clock-frequency while applying, as there is no point
in changing it in a disabled node.

> +       status = "disabled";
>  };
>

> @@ -475,6 +486,16 @@ &usb2_phy0 {
>         status = "okay";
>  };
>
> +&usb3_phy0 {
> +       clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
> +       status = "okay";
> +};
> +
> +&usb3s0_clk {
> +       clock-frequency = <100000000>;

Likewise.

> +       status = "disabled";
> +};
> +
>  &xhci0 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

