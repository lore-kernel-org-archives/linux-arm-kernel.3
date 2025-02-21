Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4391C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5/TJQCPhOXtoCrPiCi87e6OcHCUr8SBAEgJYV6f4qI=; b=mhW/Fs2recBwgWGDpHSg3yb7OO
	N5ACkJ53279O4rvydjmYwh8vafjakZcshhKxox5tjtISAklUFQyQGLNGGnvIzkcxrRSuAJbde7KE1
	hKFNzc8rdJsGbvB5nb0Z0it7U251Hr53AbVbM/IVa8rHUGv1ZZSLQOM+uUB5bGvwnaWxPIFE/a2rD
	P/PANbKtpUMCHwzNFrz6r0soJN/czABNgU/koPJtAZk5XRNu+AHuBY/DAUF2Kmr3H4dYuaPDu7dXA
	vvSo8CSuh9wGOeP6QvTnGACSOPzRPBiCiD7bU1PYuwTjNi6xf4TcnHNegcsRcrlrNK1DBJDnPGVjN
	PMepR83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYtT-00000006fv5-0wmB;
	Fri, 21 Feb 2025 19:41:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYpy-00000006fLH-16CK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:37:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so5025205a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740166645; x=1740771445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5/TJQCPhOXtoCrPiCi87e6OcHCUr8SBAEgJYV6f4qI=;
        b=Nd7GNwAhhpPRkUuutUvSDSU/W3kjT5gBntEWQzB3Qn52GeLSwOl+zOPlV1N90bSyMf
         mFvIBjXNvx6qu+xtKypfv4DU19wVLN9xJqg/2ehaVAgMoNRO5Yjy3+Ft5StmcPpTr4vt
         37+/ajkxnYN34p1nvbNq1FHmz9boNqF3uwX7rYM3b6LGN2ODUh8ZMpO94kjuZVEW2Mn6
         h90rCM/U3ERBedV9pscY5+2J9r/MhDDhkdWDoRnVklFUCAiuwFewPwdhemiIXvsDMCTb
         jGlTy4gnf3KEzqyoNbJGC33JbSeGjGTBpG8pObK6HtBlJf9FsYhj9BPUgYToCb3Ds/bF
         qVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740166645; x=1740771445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5/TJQCPhOXtoCrPiCi87e6OcHCUr8SBAEgJYV6f4qI=;
        b=M1n80Sde6MVqGqWSCDRf4K0I2E+q/92OpLgNZKxwk6eXWDm5Yb8IzHabd6VkuRajUU
         uDKqlL3io72qoglyAiaEFWFE2I5Cr4NQAh/rJvFP71S4i3IpjHJByvshbsh3uWa6sy5x
         guHkROA2z4jBKfXPAYJXbLflpV8wKbI7jiNErUZzc1irIlOzR2wzh9/4Djn19z1XYQ8t
         Y/ZQT3C8llBopsdJtBpP8c8qJuyTyBQqBcRA6xzDSejfOWpWcFT71x3yKSre7ZWNQDGl
         /NAqXtSUqV2BGR8g7xmkUK4gaXS0Gy11CEPBjpSRYQYbFs0K651Hy0JE+GTAHVU7tU99
         t38Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhUWKFhgS4fhK2Kl899DS4/uFhlSXj/IV1GrU/tLY3RZg4lTLwIqO3kJZDUQGGgnGpPoE22hWTqTSu1zos6YQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9eB6EaK+urcXOZjjDOp5BgUWY1FvEHePUGFMH+v+OPAv4F+3r
	QhzNjpOZnBgzoLqbGe56fyi+LDhzlzIHmv0rxbzYw7Zd/Km+v0+5HKCC2FLMq9nliR8+GEe6Tqn
	JTAyBLO8GPasuKMiVlaz2Tem3nuc=
X-Gm-Gg: ASbGncsmJtK842PWsTiQZ03WfY3SoPxrfu3uBApK1K1dsrrykSwRdYKqmAzDInnGpZF
	8AwNVzd9QSoaFBEJaWwT9q/PcusrVYNp2eXHe25ujsHK84LWDKX6XgJ8JYsCxAiCEv6oX0eCHW7
	mGioDXqjI=
X-Google-Smtp-Source: AGHT+IGO5kmKNshQe2c5M4D/K0SzQbhuXNJ0QO3tdj2iHLQJhE4x02XTjnINnRUvMgd1/kya6uNiVNBOQ3RUUR6+yt8=
X-Received: by 2002:a17:90b:4d0d:b0:2ee:aef4:2c5d with SMTP id
 98e67ed59e1d1-2fce8724453mr5847905a91.26.1740166644954; Fri, 21 Feb 2025
 11:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com> <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Feb 2025 13:37:13 -0600
X-Gm-Features: AWEUYZlpZEzoF4sSIcwIUtnabf9TrVj8-PJAh3_pn5QwRKlyCWUIXfCyiFWMcs0
Message-ID: <CAHCN7xL=QZHs5sD7Ja7pBOcXM8cWVQYe270EizDFN--CH_5+zQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT
 freq. to 800MHz
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, 
	Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_113726_299881_E23956B7 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, Feb 21, 2025 at 1:11=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
> SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
> applications running on the DSP expect the core to run at this frequency
> anyways. This change also affects the AUDIOMIX NoC.

Unless I am missing something, the i.MX 8M Plus Applications Processor
Datasheet (rev 2.1)  has a table of frequencies, and
AUDIO_AXI_CLK_ROOT is shown to be 600MHz nominal and 800MHz for
overdrive.  I agree that it's likely not running at 600MHz now, but
800MHz may be out of spec for people who are using the nominal voltage
instead of the overdrive, since overdrive requires higher voltages
than the nominal.

adam
>
> Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 86c3055789ba..54147bce3b83 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
>                                                 assigned-clock-parents =
=3D <&clk IMX8MP_SYS_PLL1_800M>,
>                                                                          =
<&clk IMX8MP_SYS_PLL1_800M>;
>                                                 assigned-clock-rates =3D =
<400000000>,
> -                                                                      <6=
00000000>;
> +                                                                      <8=
00000000>;
>                                         };
>
>                                         pgc_gpu2d: power-domain@6 {
> --
> 2.34.1
>
>

