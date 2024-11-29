Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647F5D6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/VnXj0xSm64G+xnhmGLSxnRi7eiVgvL2X5pSK2r9No=; b=HOn9s9IcRsMkrz2tTDdR6GKOc2
	WO3uwjsB6PiD95Soc0M7nXFHA6WGrUQN61+mJBNRyJdb5u6vfsm5IAEDjtz/3AohSnqUB2RUmYHsG
	8VJMm3lF5E3miTJgIAN3dx1IjRBO7FxaCBRT2zUGRUDm6GOi5wHSvcgeYNERqtyd84n++hC+qipcc
	40FDZXCoa74T6YkbQ5uGMaFj5R466No4XpMzpZSzfkH5F1TarMUBKEOT1cOmvhO1m6rb9Ta6jDVse
	MQ6UnAb2QkmlTuA5081OhV6u4WRS1Qi9Fu++fIizs4E6aluxDOfULb+aSgXSoG/eKXaz59iK054Uv
	bVEchncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxaD-0000000HMVj-2uZS;
	Fri, 29 Nov 2024 09:46:41 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxZF-0000000HMLf-17qy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:45:42 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5ee8eaa1694so706475eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732873540; x=1733478340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/VnXj0xSm64G+xnhmGLSxnRi7eiVgvL2X5pSK2r9No=;
        b=zGxWLg0KT9Kscm64NReQg+P8t0M5kErDOxi7VMgWcNqNMQOFJHuxyEydWatLYdo3cJ
         szefIY+hIyWHRW+MsmiBjiYFTjmXE4kraxrLgDEhvFICZqHprE87EChzEgGVfQotfTwg
         iwayEGrZVB/HRjoiVPcUtvQEZUjMeUasahz+ZF4MhkNAQU3uB50Lk0hKn1r2q0HWzLI2
         pLLhFuh9pJ+X1OZnr/AKLfEqTe8af2mB62Bxsstrx/PL1KesI/Wx+lzOWhPYMKCK/Zcn
         2ZQK4rb4kg/w1bUFOho9zpBqDkk5YtbR9Ke0OEISpJa3lcpvPzLRc6Dv0iW86SNkPxi8
         xoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873540; x=1733478340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/VnXj0xSm64G+xnhmGLSxnRi7eiVgvL2X5pSK2r9No=;
        b=F3gXzoAsbAOkwWJII6suN+vR1p0BuTPyqHc7PBe3rao4jq+tNkEs2rHUmkTKWUgsT6
         4Ej+o2IQ/VagSiw1Z5zOaXcYy1X7INHI80ZJR+YTikx+njc1oy7ZBf7sjV4UiFhOy1VW
         0cK93jLcOuzU9YP9u8X7eogEMCQeXA1Uji76zKUKHvIGQt0sTH+xwxyBLcqRdOOHSQDF
         QErUzTs7Jj8qHypk771/kApCJbn6ybz+Ej1tDKGfxjez99bte2LqhbB2D/yxQN/QKLcZ
         A9z+bx61327n2QH80SLvuJwFzeVOhCHkwZEDEbvpW5GcQfY3Fp58yQHeO1mHFJIRWOlN
         hR0g==
X-Forwarded-Encrypted: i=1; AJvYcCUs8TnKvLHlQRiLZ2/m/g4LPNGQ6SmvYsoFafMvQdoiLDrsaoaYKfBgOdX78alhCLDjrFwyjNVw1NhyrIfKZUZF@lists.infradead.org
X-Gm-Message-State: AOJu0YwPRfaBUraKKxMJImeb7MxvIIAsJ7kj8TO6JhWRzxgK1Jmkx/js
	BhrJnPikO4nOyh84LsRXAdrZ0NP8y2R5aZ1zMO/3onFpcqn0nRXC5Qt99deAdnrRGk8RryByBw6
	vUBYlIW/Ty0sgDXfjlW2rzfrSyOluZtU9Knx0Mhs8T+95VrGHnKE=
X-Gm-Gg: ASbGncvC3/WJwSBbDcR4UiwyndnBLJPAssIfbDGRtjnmxtj05yYOl6ZdQeQ3WqFCy9o
	PzLtn9yB5Hhzw6Aa1AQlzXuLXyhloqIWv
X-Google-Smtp-Source: AGHT+IHnxS6dF7DDI6r75yOFHU8KPB1OwTru3sBOUtig1dAA1cBoVlmH0MuchExTRQ+k+9Oap9bXnNBRkMu1gCqUvYY=
X-Received: by 2002:a05:6820:2183:b0:5ee:ebcb:e6e9 with SMTP id
 006d021491bc7-5f20a168f5cmr5503129eaf.5.1732873540094; Fri, 29 Nov 2024
 01:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-7-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-7-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:45:29 +0000
Message-ID: <CADrjBPpZgmE-rwRmbB3BFAL+s0G0rwBiPJ-ZMEVF8BNQ=tviVg@mail.gmail.com>
Subject: Re: [PATCH 7/9] phy: exynos5-usbdrd: gs101: configure SS lanes based
 on orientation
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_014541_316714_6EEDF3B7 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> USB SS lanes need to be configured based the connector orientation -

small nit: "based the" -> "based on the"

> at most two lanes will be in use for USB (and the remaining two for
> alternate modes like DP).
>
> For the USB link to come up in SS, the lane configuration registers
> have to be programmed accordingly.
>
> While we still need a way to be notified of the actual connector
> orientation and then reprogram the registers accordingly (at the moment
> the configuration happens just once during phy_init() and never again),
> we can prepare the code doing the configuration to take the orientation
> into account.
>
> Do so.
>
> Note: the mutex is needed to synchronize this with the upcoming
> connector orientation callback.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 72 ++++++++++++++++++++++----=
------
>  1 file changed, 51 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index c1ce6fdeef31..1a34e9b4618a 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -23,6 +23,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> +#include <linux/usb/typec_mux.h>
>
>  /* Exynos USB PHY registers */
>  #define EXYNOS5_FSEL_9MHZ6             0x0
> @@ -209,6 +210,10 @@
>
>  #define EXYNOS9_PMA_USBDP_CMN_REG00B8          0x02e0
>  #define CMN_REG00B8_LANE_MUX_SEL_DP            GENMASK(3, 0)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE3      BIT(3)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE2      BIT(2)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE1      BIT(1)
> +#define CMN_REG00B8_LANE_MUX_SEL_DP_LANE0      BIT(0)
>
>  #define EXYNOS9_PMA_USBDP_CMN_REG01C0          0x0700
>  #define CMN_REG01C0_ANA_LCPLL_LOCK_DONE                BIT(7)
> @@ -383,11 +388,13 @@ struct exynos5_usbdrd_phy_drvdata {
>   * @clks: clocks for register access
>   * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as requ=
ired)
>   * @drv_data: pointer to SoC level driver data structure
> + * @phy_mutex: mutex protecting phy_init/exit & TCPC callbacks
>   * @phys: array for 'EXYNOS5_DRDPHYS_NUM' number of PHY
>   *         instances each with its 'phy' and 'phy_cfg'.
>   * @extrefclk: frequency select settings when using 'separate
>   *            reference clocks' for SS and HS operations
>   * @regulators: regulators for phy
> + * @orientation: TypeC connector orientation - normal or flipped
>   */
>  struct exynos5_usbdrd_phy {
>         struct device *dev;
> @@ -397,6 +404,7 @@ struct exynos5_usbdrd_phy {
>         struct clk_bulk_data *clks;
>         struct clk_bulk_data *core_clks;
>         const struct exynos5_usbdrd_phy_drvdata *drv_data;
> +       struct mutex phy_mutex;
>         struct phy_usb_instance {
>                 struct phy *phy;
>                 u32 index;
> @@ -406,6 +414,8 @@ struct exynos5_usbdrd_phy {
>         } phys[EXYNOS5_DRDPHYS_NUM];
>         u32 extrefclk;
>         struct regulator_bulk_data *regulators;
> +
> +       enum typec_orientation orientation;

typec_orientation is defined in #include <linux/usb/typec.h> so it
should be added to the includes

Apart from that

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Validated that a super-speed USB link is established between Pixel 6
phone and my laptop with this patch applied and that adb works.

regards,

Peter

