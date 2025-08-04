Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112C0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZddScDjOIs1bcwZar1ryVoYUm2q/hDGWLi3mEU/nG4=; b=c9qVPWictcuZ3wt0da2qHL9u8F
	Q0JqTYij6bu6MYcWh8Aida02dfHJAsp/xZxBZNe1VoszVk+SL+5Uf7/m06qSccUSnLflvt21mUBHJ
	M132ZzSPga1KDG4vkhYxEkudx2RuJFJZ6a+MLR+V9d9MmDh13S9LrUOGocFNlZHsrYQY+bQiNx7Ns
	dRBn4LzvicIpc3bgvd4CmEnLSIHZgOKtdk1eF5xdRxRQuOO2o3gf/enUS8HOaSpjvtSZxTHGQidi3
	dcU9Xuz+B/qX9XDmDgHI7XO/TwexiekBMDSEupUyKWPmxZht/Orlelb61lTznpvfNuLcT9/jK3SzN
	+IYRa24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uislX-0000000ADry-3aiv;
	Mon, 04 Aug 2025 10:50:03 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisO7-0000000ABRR-1Wfb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:25:52 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-539525ec047so2015791e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 03:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303150; x=1754907950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZddScDjOIs1bcwZar1ryVoYUm2q/hDGWLi3mEU/nG4=;
        b=JCZvrGIwv1MD/IsRsDYNtw0LzbP934w+HsZMYwRLeF1tQgAKxz5/ao8Thf3a9caaDI
         IR1kp1h72wXhnpqZNElkgtXR9fDy4spmPFLMpFC9bX2ItV42N6B9Vp0/SREhOfKy5QSc
         9pyIqhl1ywqnyE2evL3tVrK1Xbz/xW1a+NGHy3E7zMn2FRf++KOJPsd0i0W5Z/K5OrDo
         m6hciCS3rgCuvQuAS/7BDRUw4vB+65QMf0g3GLPKGzJJmcx6D/OikWKsq8RgWn9moiq5
         DPH0LgcFnzYFf3M7a9lYHHE2tN67rLV4NjOCi1dNrgaQvaBIG+DcA1kSG9aWB2ymdvnB
         sfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjv1Clxs35NGRDOFhJ+R+0eUGeAKT1G9yZ7XHW/wocvPN6Dyybw/nA0gvd1U7DDhh8nHRX4+m9BEDk74iTo0lC@lists.infradead.org
X-Gm-Message-State: AOJu0YwZvOfGENCNXOSlOtF0ohbUoI7olZO7qJFb0XQh4CeMDq+CD1O5
	ddgHmuap/HjqIlWGXjVsJ8FJ3NK4INQmJ3mftYbJTPGnHgEo1KmA1JpOs0RGmA5t
X-Gm-Gg: ASbGncu/ioSjJM8NU+Iptd7tr3lCdlEPhmBYxO0tZLyi9PXsxDYBLerWImjLvj1f/If
	1kMaqkj2eCKyhnFGV6BDYgliYtM58c7Fe0Oa5SbjiOae0unHhEG/CG7mDEKwq/+a/Nrj+yDRFzi
	AsuuEPjc+kfcg9Lh2PAdRLHGojV0lO0BAWxDA+MEVWxUTIDRvonUfxyEOji+qZ8Hlwfm18wgB4Z
	xNeeC5/SUg+nRwRrDSIBJvwS6/D0qRVga4IywO5CzXXR62cCw8+ENxi+wfezz20XCJXyYfxEjpQ
	CF/Y0jWS4zEMjneg+UBNVRoC9YIWUN/7zsCuzE/t4D2cylyD9Z8YFf3NDPG/cx0nWEThLzXGxUH
	D5HPYsc6JJAUa5S70BGL/VfIXYiFpsaklIMEM3Qdj3KiW6EzZF5+6bBSM0vqz
X-Google-Smtp-Source: AGHT+IH0/VwM8kR8hBQNp5a5zm13hTqr92FuO9N7BBWXmBW4xiBVYrVHnFVvjuHq3tULmfjyr2ONEA==
X-Received: by 2002:a05:6122:d11:b0:530:7e05:2029 with SMTP id 71dfb90a1353d-5395f476dcamr3261259e0c.6.1754303149651;
        Mon, 04 Aug 2025 03:25:49 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d4c6f3sm2651459e0c.33.2025.08.04.03.25.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 03:25:49 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4fbf846d16fso2940256137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 03:25:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfTuDz+Nl1IQJQIdM9MWtlVsx5pULl1iVj/aBtQ/3zcgexVr5Ng36HbnY78a2feTE1oBRn02IdEhpPzCdtLxT3@lists.infradead.org
X-Received: by 2002:a05:6102:6102:10b0:4fb:f495:43ec with SMTP id
 ada2fe7eead31-4fc1014a568mr4289741137.12.1754303149196; Mon, 04 Aug 2025
 03:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com> <20250704161410.3931884-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704161410.3931884-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 12:25:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrbOPrzwMMP0+HHqh01nwDfoUx8Mx0nZ=24ZU9XkFqgQ@mail.gmail.com>
X-Gm-Features: Ac12FXwFJTXzLRJiS_KcBRTI0cWrJpi5fbuV92Ri-bNxlf-GM9ClQh0GwvKc4cU
Message-ID: <CAMuHMdVrbOPrzwMMP0+HHqh01nwDfoUx8Mx0nZ=24ZU9XkFqgQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] clk: renesas: r9a08g045: Add clocks and resets
 support for PCIe
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	lizhi.hou@amd.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_032551_411700_6CFD2CB4 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri, 4 Jul 2025 at 18:14, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add clocks and resets for the PCIe IP available on the Renesas RZ/G3S SoC.
> The clkl1pm clock is required for PCIe link power management (PM) control
> and should be enabled based on the state of the CLKREQ# pin. Therefore,
> mark it as a no_pm clock to allow the PCIe driver to manage it during link
> PM transitions.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -289,6 +289,10 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
>                                         MSTOP(BUS_MCPU2, BIT(14))),
>         DEF_MOD("tsu_pclk",             R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0,
>                                         MSTOP(BUS_MCPU2, BIT(15))),
> +       DEF_MOD("pci_aclk",             R9A08G045_PCI_ACLK, R9A08G045_CLK_M0, 0x608, 0,
> +                                       MSTOP(BUS_PERI_COM, BIT(10))),
> +       DEF_MOD("pci_clk1pm",           R9A08G045_PCI_CLKL1PM, R9A08G045_CLK_ZT, 0x608, 1,

pci_clkl1pm

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

