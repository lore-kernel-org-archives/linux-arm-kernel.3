Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816A8C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9kUupfLeM2bb97UEnJtJkHdlxhJbbR6dWtAC4xPAdw=; b=z/8QNa0Ix6ojmURuYRP0otm45z
	URmFki2NDFAuM3tj7o9VGdDABOFtJgUbSoiH4HEf/0VK0t7DJXE96zteFsO3YqqGh+CmHUl2A0k2O
	odI70bO6vrUriK/bd7WdkSgxArLI8PwuG7RVROPnv52rzwmjhfGbulDiYrI5dByob/PxrjjyoPvxj
	/S8evZcK7oyGzLMeEXqUWlbMMmp3GomeLz/94qw7ROg9d1j4rjoctT4wYuDLrgzgutKAEpvvX6Nx6
	hxlJNtPEDOcGsZWFqNNy/xRy5kijPtxCQnhvcRTskSre1KVy644R+VtKdIR57jHkB7KUyB/cnn9na
	weTuStTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vPT-00000002EXm-2RWL;
	Mon, 07 Apr 2025 22:57:43 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sEb-00000001q4T-3rlh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:34:19 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1977261e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 12:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054457; x=1744659257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9kUupfLeM2bb97UEnJtJkHdlxhJbbR6dWtAC4xPAdw=;
        b=JeB41DHCq+g2Nrbaw1vungzIws8J2lLj7wMhMRLQ1/jn8Lfo49UnacVasmvsS5YlQA
         y685HCNY+FMvtD0VE0R1IDrnN/EaxSzVpMF90SZ5VhbNjl8X5YBgfuLmNxjbZWnsM38r
         DaLa41E7oHi+Tp4wIYyxwxKMkmhka8WSDmKK99E0BpJpWhE83Z99Lg0o/qOtb32IP/aq
         5hXwlnQjIruoSNFfAd5whtsbbrkEF2mAmaI4CNtVIBnxJZrAJjRFNAl9z4khReHRc5jW
         g5U62GezoC9nFx8CJWknT0A0zei8lsymlrSLLuy0q49xKecUtAG49d8M/UprssvMi/9a
         q8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054457; x=1744659257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9kUupfLeM2bb97UEnJtJkHdlxhJbbR6dWtAC4xPAdw=;
        b=huA4FvVlq6RZxbbBNs/FEkZp73Tbfu/Xww4V4J6StMlpT1OJ6L1guP3ghpPEB7SDVX
         dqHGe6xUmPWt1Jc9MvdviiRZ04t+Sz/vT34ssDtDd71ekQ/0DWNi89ZIiBrzBw6C0vRA
         ZvQ08xcwVgvT/Srkrlze4AVefBv+GD9LskOmk4GheQnHJXBBP0d6BOJdbErZuviErBqN
         vcgockm565U19z30A4UC9V6xkGT4HvOqq5An4WoV3hqcAJ9mVa81a20XwfeZgUxrtCBa
         1I0sQEQ47xP1HfRu0UREgmV9J97SbcWRMJnQaSSdI5xJRAyWpnW6Lp+lAqn35jD4TGvd
         phYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YyyS6r+levfLe6p+16bDrMUuCxl5s9i1sl1m/Ce7MwCHI6BNIRYk3euMXMZPDQ34oex6b+9J5sLcAkVp8aHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGpOeH7C5qC2GTzfRC8O7/g4LAuxhBEPpuHpkdPGv7Ev3/009
	jbZN9N8fQvdF5h1CarbeRbc1ehqvqS4ssTkfnaqTM0aHLq8pF02VjhlDuauOs+1KkuQ5OfWPZhX
	ddENoFnH4cvfYIvIxjrP9mEX+6MA=
X-Gm-Gg: ASbGncuAHHAsZipIv8N+KPnSS+jH2y12qzEOm8ePjbvlvmJmbOCfKbKDB7Zc/OTtwF9
	om2MIqWXYrRFqijYrDo4zjFNqN/I6zlBTgAFxIwmZBuXZV4K8zsHXh5REfkL4sw4GL7XHo/rTuj
	EOJ2u7CnCsaV0TNhViKrXMnqxW/sR2yY3igy6wQoC9Y487FXKcbhwR0vcix+A=
X-Google-Smtp-Source: AGHT+IEUwdqKil1pOvRnLZ3FdzjENanpIPQHgPq8R+xUeQrCDsCevqcy7D/AW0+zBxjvwQs2SZQhqHplRtvsFcJ07KA=
X-Received: by 2002:a05:6122:2502:b0:526:483:95fd with SMTP id
 71dfb90a1353d-527645b6798mr10677466e0c.10.1744054456970; Mon, 07 Apr 2025
 12:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk> <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 20:33:50 +0100
X-Gm-Features: ATxdqUHy--tranG0MT0BFF5juBVy575ZL4jQsNWdM38rbJ8aGrL8W5d1ehNrSPQ
Message-ID: <CA+V-a8t=V-EB4r_vBBSJfmAx1_tBRsvV-m3wM841fAw75-ueZA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwc-qos: use stmmac_pltfr_find_clk()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_123417_959353_BCAA74F0 
X-CRM114-Status: GOOD (  17.39  )
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

On Mon, Apr 7, 2025 at 7:39=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index cd431f84f34f..f5c68e3b4354 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -34,16 +34,6 @@ struct tegra_eqos {
>         struct gpio_desc *reset;
>  };
>
> -static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_da=
t,
> -                                   const char *name)
> -{
> -       for (int i =3D 0; i < plat_dat->num_clks; i++)
> -               if (strcmp(plat_dat->clks[i].id, name) =3D=3D 0)
> -                       return plat_dat->clks[i].clk;
> -
> -       return NULL;
> -}
> -
>  static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
>                                    struct plat_stmmacenet_data *plat_dat)
>  {
> @@ -132,7 +122,7 @@ static int dwc_qos_probe(struct platform_device *pdev=
,
>                          struct plat_stmmacenet_data *plat_dat,
>                          struct stmmac_resources *stmmac_res)
>  {
> -       plat_dat->pclk =3D dwc_eth_find_clk(plat_dat, "phy_ref_clk");
> +       plat_dat->pclk =3D stmmac_pltfr_find_clk(plat_dat, "phy_ref_clk")=
;
>
>         return 0;
>  }
> @@ -242,7 +232,7 @@ static int tegra_eqos_probe(struct platform_device *p=
dev,
>         if (!is_of_node(dev->fwnode))
>                 goto bypass_clk_reset_gpio;
>
> -       plat_dat->clk_tx_i =3D dwc_eth_find_clk(plat_dat, "tx");
> +       plat_dat->clk_tx_i =3D stmmac_pltfr_find_clk(plat_dat, "tx");
>
>         eqos->reset =3D devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT=
_HIGH);
>         if (IS_ERR(eqos->reset)) {
> --
> 2.30.2
>

