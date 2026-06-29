Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=; b=3AE1tWiYOO8o8vWIWmPnnIPYYu
	JR5afcpMCEhd5p+wcPuFRwQaH6SoyqBE55Qbqgv18FwRmp9620keZL0vZCq4Kx6+PwoRL57kMnXoD
	1nxsnTHH2Cu7KSMPs8+pSIpqIYQguJBmbwawZ69qjBzOckS38IwRFWA3LCcggi54XsDsDQuwYROfg
	XKo417u1jQ0eeA3k8hj8cLz5SPqC/uK/p0JxyXqYUTD3YltmhA9xl1T5jmK0s0FdG8lkaUxh4bZ7D
	myGSYStCNwutBCxQe4fDh5+bUVpzAxMRKTLbfbfpTvTypzhevuG6cr5Y+yoVZikePBEr8CYdV7AQM
	27PZ+/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDLB-0000000Exkb-3V6C;
	Mon, 29 Jun 2026 14:52:05 +0000
Received: from mail-vk1-f194.google.com ([209.85.221.194])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDL9-0000000Exj0-1G5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:52:04 +0000
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-59d7db12342so1311817e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744722; x=1783349522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=LAY3RUFGnb1ImbcUUkyEMfHZuKFavTryx6dwPze0uG8FAwuxmBvLy5seV1iE53lUz8
         hA5tErYxiaw948eT0w3H9K+kzD0snOGGruPDHDyMGFotYlupHAHKtUCfISmovuk+2me2
         RROZjpfPTRZb5Vnp2Ejp19lfwg1Sp8oo6VLTyR+vtNVTF8zHYLbtjZXrcVhl359wfPaU
         Ki4PePN40pOOyB7wZsaWGfdIODvU9wXldZzygKzJlO2jRJVCpnqbho5WP79cGOw1U7oo
         5k3m1N2nKjI5MZXdxYyQlUaSg+cH+DOs6OfeWFR/xTtBQ4lBv/BvEMq8x4Wvm+8n4MRr
         /GuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBRTILcGapzZ8mbIb1Vab48wYDuxL+n/YioIF6VTu0agdNWRX88QwAhMwddNvhutcMPT/rTVDBf9fOZcidzxOy@lists.infradead.org
X-Gm-Message-State: AOJu0YzNAFT9IBoA1Z8pssOUerns97aLYIrZNRBP+YdvPBZLbzds+ri2
	WZNKSfXed9PSiYkJiEKCrahRsKigs1fGNix8EckHSL1ReYGR3mykgYxgRJ7fugiCR+8=
X-Gm-Gg: AfdE7clN8NmFAqBfRzCtXQGUdPOhhOvqovZw/GL0it3q3aEiVcKIs+4OvjEpOfVQXwE
	aProBzATtcEExPfDByfwXAm/N85WMXjzTWvtEorRs8cxni+619Cp08cncA75F+BobMZ4Y7XduTq
	xoLDy49p+iMkxjthAw2Dlyt+eCyBd9yPkg57A9ephkTrBizh9qutXl657cOPDhGq2lXzdsiW10F
	N5cPM9+PrdF/TdotBdE/pgGGlID85GNZXb/lt0aWHD56lLimg25+H2bCvf061nfB5RtcZl0Agm+
	oI5/OJGlIeCLeNXA6mK9J7ALsC9e/larVKPICieY37N5wyRT3Wwpqd38dKcr0CN+pso09I5GTR6
	pcQ6toll6twuBikT353yTF4n8gAfspCFnmxwaBUguCKOJaH6/Iix/w/pqjDMB6wxtTV9rM96ks/
	LDQhExvVn2eenC1N/EIyQJJUG2USs7660B1Tnj+7KGg7M/b6WDIg==
X-Received: by 2002:a05:6122:4fa2:b0:5bd:9ea9:3de5 with SMTP id 71dfb90a1353d-5bdbecfbfc3mr4855e0c.8.1782744721873;
        Mon, 29 Jun 2026 07:52:01 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm2168775e0c.1.2026.06.29.07.52.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:52:01 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-736eea06c3eso880641137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5EGU6PXHVtwnFTwo19Sd4qFK/Uzd0SXaVw9M1exqG/0QpxFXnE5awMyaEte+yw4w5T+d/Wn7nIMzSy2ZSCUQj@lists.infradead.org
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075203_349959_6EF4BE33 
X-CRM114-Status: GOOD (  29.82  )
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

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

