Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAE6C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=; b=1aRW8Xsn5mLEltGWOAbWzJjzn5
	O0/z0go6IGAqsoS1hpqVVpgB9E+4Cgb/M/kR65nMsEiqm3Cbuaco3/WuZKBY8RYsmx2HJqCnjyCqf
	mlTQQ7ERCzWcMmaKFrzJ31MA0yCFBlhg5tiydzMpOH52pe7+cNZC0Qbvo0qy2H+GaJ8opMtm67YQg
	8+wRbII7TgI2PfWLz0UV6KKJUUvUh8IboANtfyDR49dLw0YJa/ewlIThbxkLuRDAI42nXzguEhnZJ
	m9q5EnnO1wtKdw1aRgwZmEBZxDTDF0fWUO/gtW1500jD1oL8XMo9QXRwLi7Pb0qNSO7GFaPxvZkud
	mk+fG+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zvb-0000000GYzT-3KPE;
	Fri, 11 Sep 2026 12:00:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zvX-0000000GYy0-3kiE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:00:22 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so265650a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128018; cv=none;
        d=google.com; s=arc-20260327;
        b=ooVMSz8e20ag39PE3AFkGrbFpsO4KbakjtxXprHM4SxjyIGRHmTZKBBkIsQCo4Pu2T
         z3ZrFrt3tRNN9mbAE3MgUc1wyJ33Tu/ZubcyRYgVSqxNmW5JZslbqYs4XSRxI1up2Bv/
         7z7dfjhaMM83TgCSyJ6Oqv3b4cZhmLgH5PMA9mr6mR4hoYYNYAAFeJ8hEDYePGXmAO35
         fcuFSP8Y0jzGGWigCWHPRdmutuKnhueor1VIa2bC51IHbdPr4Zk5jKpTBmV+CJfUY7tS
         /6AVSeCEpYX/CU2R10TdBjzd6yrXnRQli4mzg/T9yYKATsQbQufC+9Fj2s1o5bZGwNE9
         r/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        fh=lYNxkglseUobOOf5eVXJ0ZVZlrZevIf91C8IYWn91EA=;
        b=CNeB6w/DhxmcIH9TS3BCf9Yl9QXrXoc8XgxS1gjth/xZ+NvOBHj5Izt5fk/WdcxaMj
         6Fg0TTZCRyC+zmdEeuQuHH8a3ZcavmkttildGwWvKllwUtjoXGU2ja4CzPH8vUfmqxcY
         iZBLLKkvdWfQrqG8WAIjdDPO9a56+6j97LrJCg0jXsjKlBpn7IrAckAtRfiwYxYLlvm7
         /K0xTn8bd/fWli+7R5/OREk3IRry6yhcg6XPVNnVGbMJj2+nfFGfGNjfLNQQ5en+T9jW
         Rt7PUqx6hLYUR9kcoVPy43dWKEWTO6r98S3oOih/vp3DkB53siG7U4loBTpeOR2v7xDA
         0nqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128018; x=1789732818; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=MuR+tx9jt7PPWGgCyhJ2r6PGfkx8p5zpt1Syn0ghE6Dqol4ecDNr565aHM+FK3QGeK
         i5/XzoEt96WmPzOwAhLa4foTN7YxFxeJCPY6T6zdgGqmktvoGEuAglN+ZzF9o0oofjt5
         ey9fEsM1kh7j8qbtRFAo/SaFw+BhKmznkOG1/sOFF1IihtfX7E1mNnCClhJ836ukPpI+
         TFhekgjdJ0YIkaIJC0Q1K2cxw4W0+NDmi/hK+hja70a4+9fqpMbVmWILHCniVzhXe+Cm
         RlKAW8P89wMn1PCTAFSeNUbHoamy7RNux94UAAHjIfkL/F+A2JA2H3lHDFpaWfRNhD46
         KGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128018; x=1789732818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jU9kvyfbvdodjOEWNhAyWrD9R6/DXaJ1BcW1aCO08yw=;
        b=g9qj5l8fZutw++bS/OX3NEfUR+DlMz9GZqSWWfAhTVug/p7hfxdE/WV1arQrlZtm+U
         WIHSUp52C68ySz8YMAaPo2XsCe/5igzW4cK4yHm1CIW/W/prYDBCku0opeEVDCpFkZDS
         yl1SmeD7eSMapRUQCYeuvl5vJPYaDY9TM6toILDSywITttQU1Ec/exUI9HX0Hu6k34zq
         00R4DGp87pdVcjsC6KYOVtPKN7/4u0BIHOKPZfYptLenz6aTi6+/Ytsda/Y6djsezOEz
         uepjVTj3iTY8HPOzf7KHdt+d9aeLaqaawhA0kOeESF9CfE0mmSsxXm2J5/WKhxV9zCeR
         /gLA==
X-Forwarded-Encrypted: i=1; AKwUvByJMuLv6cQmsbKZD+Q5Tb+xUJ4a7UPjCEg+0l6bb9HzfB6jg6uNi5Cs9TehPFHQQCMfzfwnxdmZi6Toj+IYCn6Y@lists.infradead.org
X-Gm-Message-State: AFuF++kzoqSuZMadCZlxizN3hcuKBBUYlhZ0DlAY5+K+ZzluhPCq08Bn
	UoOzZSHrm/1KIfsU633MuWVuGJown0p7Wqe3BylY562fwm/daw99G7Y05CRDf7TH0EK7SBvhwIu
	8Fk332VkGzfyg09j8XzMUjOul/f2hI9o=
X-Gm-Gg: AYBFou0JIGRM26ud/OC1q3is6bR2aNDkDbT9RmXHhswvUcS+Szpw/obfhcykyx6hSjy
	LMYHvc1nCCLTmS0HVf6FoN04/crKLJ0apCXAKT5l0lq/8OZ1YiCapN2pjDvXcMafkFAmu+BjhaX
	28CsMz3lii17uiT5sCL/bkbYKqrPAtxR9bGnNVikfQ9AuhawbpZel1DBpTkxcipHNVj1wwR+hXs
	gtsPcsVdLsf0FepSVjT8ASfWzFX5KfseOSRO9spdcKEUUmYkg4Yb2PjASlpMu5iaJmJbRzKEE08
	G+GkcgZtrndo1xUOVSUUfL0E6Jji2UEZcuMjoxRNBSHpHlJn5PzL211yfADhViUIR1Ypsoq2MaD
	0aCFz4ANQvCxatVqlsjNqyW284p9dJz10fMFytK8Ei41mdPrQmHbKU0L79yzUxjKFMtA=
X-Received: by 2002:a17:90b:5108:b0:38f:657:6823 with SMTP id
 98e67ed59e1d1-39d97f392d3mr3889515a91.8.1789128018117; Fri, 11 Sep 2026
 05:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-6-74c650dfdea6@baylibre.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Sep 2026 09:00:01 -0300
X-Gm-Features: AcwNN1UryKTs1Lw-KY6R7BmulMcgHb-91PJOnn7PiBP850ZNAVItrIcXBzp-x6o
Message-ID: <CAK+owog22cPgYj9muDUJXcTx+k9eBmPz1jfi8D9cx3H-xo1mKQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>, 
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Beleswar Padhi <b-padhi@ti.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Sebin Francis <sebin.francis@ti.com>, 
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_050019_946288_5B9B1242 
X-CRM114-Status: GOOD (  17.20  )
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

On Thu, Sep 3, 2026 at 9:40=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:
>
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN =3D 0x9CAA5000 LENGTH =3D 0x1B63=
000
>
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
>
>     0x9e608000 - 0x9c900000 =3D 0x1d08000
>
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/ex=
amples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti=
-arm-clang/linker.cmd
> Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-A=
M62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index 8a8dec80cb30..3d1a2c5bc464 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c8=
00000 {
>
>                 wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> +                       reg =3D <0x00 0x9c900000 0x00 0x01d08000>;
>                         no-map;
>                 };
>
>
> --
> 2.55.0
>

Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>

Thanks!

