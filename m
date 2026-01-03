Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C6FA374F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYf6bvkaEWvrggi0yuuffaRuhv37HK8SVIBsgUUmv1A=; b=dzLRf9YDaKdfO/HAV+ZY6nXLie
	HSMcFXIfUj8G4spKyPspIRfznlHDjHuko2dJk6D16GxmiQ9aWoOk/rGbrIWhwN4XYbv6vuGoQa2Sc
	WiU49KcoutjwkEAA7VHrY1jsVBuWi5KfZYNfuwO7mO/uJ0FvCegdELj0QQf0tnDo2vsDYeS95L0SL
	cDftoc/MdHiQcJJYs27Fncj0ZkF51/Z9SDe8pLwgVxoX44SEVHZTuWwiMUUi5XyQLRIzIMN7vCM8u
	OmxE5QlnEZ0FKJRMqL/097oh+vLCwiN0wKaxSTd5xQLNKSqIZc5aqiHoYvu31ans13iAaay5clO0c
	LsZHHbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTu-00000009BGT-3hKG;
	Sat, 03 Jan 2026 10:03:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyTr-00000009BEs-2xEo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 10:03:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59584301f0cso3644233e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 02:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434609; x=1768039409; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYf6bvkaEWvrggi0yuuffaRuhv37HK8SVIBsgUUmv1A=;
        b=tCK3ZQXWsdOlBeNkj4eyEcILC61UndsSixBvD83El1yr2cCScijpOVJCg8avp3DYZz
         hrpGhjl8E4Q1GDyqKBPe/EKQBP0F6Gab1NY1nHTHkApPBVt1OSF9CzXjlJLFp1ErHARR
         nQinps7pzaXw3U3LSWBDOpM2I7+U+ILun0k1k/FPvkqYk7RWdhSQ2qFwPvh+Ql7BsDFW
         FTYG+Mx9ZTo+RbnpKAldLN4JC3C02x1y4Kqcq12rRZhy+tp11uVZ2G9OKVnT7Q7J0HO1
         7Ld8hOrQ4Wf544S7UoitwYNDaNXi0XYwOO8CZAEOR5lAAkYG1AMTPH3eAo6B+f5H274D
         rvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434609; x=1768039409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYf6bvkaEWvrggi0yuuffaRuhv37HK8SVIBsgUUmv1A=;
        b=NOA/dKrL7kWSUnyZUp3s0qxP9eVoHL+0apvZuwsr5ccbbVWF7kqIWj6J1dkkEzl+F4
         0aECACqJ1WXHjnCjXlux07/EJvSnw0S1kS20ypa1f8VC0GBC8JQ2nqHYX1ITfswOBdbk
         yzdLcmcQ7XqJOMRuMP+uw8T65YCsurw2EMQeFE/NzlOHAf56nl81T1tmXi0aiDVofZsu
         VScQnesRmKn6TDzdop9n2Yb0Zc0HEfq74zpAh0JQNWbEZeZVS4YuDWUwNhvF03LtrIUO
         xLf4eLdzxsz/L3EuTdwQb8oDwMvUFWVZyk2+PTzdZBS2xq6S62H+DjSlqS84JxRyQf3i
         +TGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMCIYV6IH7upzHZ8uKtifOcGLZfwhk7eyalocskWZCujp2s83nmMDj8nU4rQ7OROh/bsg0C+i4RUlqKvJUzLE9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1K0UDmHLgT1yUHvG9WuluOeP5+DL7vIJFkiwMMXjC05383CfK
	E6KGym93Gnk3bU7Kp+kQvOpkf8cQbcWP76nNFpcKbMv3E/SjDumsL4flrWUNJSuED+13T+wuL5t
	Gbk/F6rNeSceBG4d1lcWO+KEvUL3O/utYxprOGpB1Rw==
X-Gm-Gg: AY/fxX5stUz5M/vLyk2PKq2yNtzw6iTalGk6L2I6z71D0N6L/6/pIeprHvVCc2A1WB3
	Yhfp67pQUpJfR7xZ0uLzvl4+mnbJVaYINjph/3g+GDxTuRsvMlA6U4oPQBR6wsSA8QqbbZIyAHP
	qk1TfF9NnG3TUs331ERmzRr1YxMXO8zf0ojU/WS60qVyPujM9hnfTKSzCTo2rigI6nC+vr/mxRU
	yFYOAGgt4JC6safCYWbC1rpAAYHqNIM0I6v9oHOvQ0WKRqB8SVycc16nvB862xWrhZs9IGSffzw
	WTIurFA=
X-Google-Smtp-Source: AGHT+IGNyZ6pT/xuZoiBS1OalP/VwiTV2zPp40cAw0CI5np24s1GG3PVuf+rgxF02Pij4HSXYC6sqLVM0BYsiEuGK2M=
X-Received: by 2002:a05:6512:3f09:b0:594:4e9f:98ec with SMTP id
 2adb3069b0e04-59a17d253ffmr17191725e87.20.1767434609415; Sat, 03 Jan 2026
 02:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20251230-pmdomain-v1-1-3a009d1ff72e@ti.com>
In-Reply-To: <20251230-pmdomain-v1-1-3a009d1ff72e@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 3 Jan 2026 11:02:52 +0100
X-Gm-Features: AQt7F2rBg1MhVL6_AIF2mPeFOu0N7IPe2SjP0xQ7-SqCBNvV7cnprqAVZvFVSCk
Message-ID: <CAPDyKFqP+k9HPSLG4SSmz5iaNiY4yLf3-7q9p0ChJt1dj4aSiQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: ti_sci: handle wakeup constraint for
 out-of-band wakeup
To: Kendall Willis <k-willis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, d-gole@ti.com, vishalm@ti.com, sebin.francis@ti.com, 
	msp@baylibre.com, khilman@baylibre.com, a-kaur@ti.com, s-kochidanadu@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_020332_067735_15FBB68E 
X-CRM114-Status: GOOD (  26.22  )
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

On Tue, 30 Dec 2025 at 22:37, Kendall Willis <k-willis@ti.com> wrote:
>
> For devices capable of out-of-band system wakeups via I/O daisy chaining,
> prevent sending wakeup constraints to the PM co-processor. This allows
> the system to enter deeper low power modes, as the device is not marked
> as requiring power.
>
> Replaces the logic from commit b06bc4727991 ("pmdomain: ti_sci: handle
> wake IRQs for IO daisy chain wakeups") since checking out-of-band wakeup
> will cover the same functionality.
>
> Detect out-of-band wakeup in the suspend path, and if it exists, skip
> sending the constraint.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Implementation
> --------------
> This patch is intended to be implemented along with the following
> series. This patch has no dependencies on any of the other series:
>
> 1. "pmdomain: ti_sci: handle wakeup constraint for out-of-band wakeup"
>    (this patch): Skips setting constraints for wakeup sources that have
>    out-of-band wakeup capability.
>    https://github.com/kwillis01/linux/commits/v6.19/uart-daisy-chain/pmdomain
>
> 2. "serial: 8250: omap: set out-of-band wakeup if wakeup pinctrl exists":
>    Implements out-of-band wakeup from the UARTs for TI K3 SoCs
>    https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/uart-wakeup
>
> 3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": Implements the
>    functionality to wakeup the system from the Main UART
>    https://github.com/kwillis01/linux/tree/b4/uart-daisy-chain-dts

FWIW:
I had a quick look at 2) and 3), both seem fine to me.


>
> Testing
> -------
> Tested on a AM62P SK EVM board with all series and dependencies
> implemented. Suspend/resume verified with the Main UART wakeup source
> by entering a keypress on the console.
>
> This github branch has all the necessary patches to test the series
> using v6.19-rc1:
> https://github.com/kwillis01/linux/tree/v6.19/uart-daisy-chain/all
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index e5d1934f78d9ee0a02eb05aa1301cd5a59e134d6..18d33bc35dee1b3bf6107af1e414db377d515199 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -91,8 +91,9 @@ static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
>                  * If device can wakeup using IO daisy chain wakeups,
>                  * we do not want to set a constraint.
>                  */
> -               if (dev->power.wakeirq) {
> -                       dev_dbg(dev, "%s: has wake IRQ, not setting constraints\n", __func__);
> +               if (device_out_band_wakeup(dev)) {
> +                       dev_dbg(dev, "%s: has out of band wakeup, not setting constraints\n", \
> +                                       __func__);
>                         return;
>                 }
>
>
> ---
> base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
> change-id: 20251230-pmdomain-e71bed9b40f8
>
> Best regards,
> --
> Kendall Willis <k-willis@ti.com>
>

