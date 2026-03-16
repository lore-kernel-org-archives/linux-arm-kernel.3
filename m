Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B401F4644A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=; b=wGLGmIJhssgxI4hD0gnwh5vNLL
	0VtWXEwwrW8sXAA2BayvNrqcVvLzqv1Dipl2oUbCKqTyVQIYXVsvBTb/TsZ1pxPj9ootvYeb9iXpl
	KCrg6HY8tvGbHsWpJZzCuBNJFNzmIHVv7Cny5dAwtlkbka0DudKpH+mUMcBOeuJzbtUFrVbd64K/x
	ACH67mA/lyWNdB6jFeWWre9uxanITyvNYoQk3V3YsjU30oqkDunL0AvtuNz2pK/i1p1YmUGiZLKjz
	ysbYb2ZTvcvSKSFXDWBT3kIETVdqtqpy5BL/FT5RDno4kUnNnvHsnoH9OcJaI20svaZz+EXudEmwT
	K8lZrHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25iy-00000003ms1-2jae;
	Mon, 16 Mar 2026 11:03:04 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25iv-00000003mr6-3D0f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 11:03:03 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3996617e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 04:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773658979; cv=none;
        d=google.com; s=arc-20240605;
        b=eSs2WjBU/ppZIeqeNOBseQR2QM30Bxk02ziIsXKJ3TLHQ5NFfl1W614soMPXMCIP9l
         CMeucdrkiGTa6UUMuYhvaFwy1easOjJdD6ZIuHDYxO3lJnpdhJUFlT3qKW+ApbnymHeI
         ikBNPQHJ9tpvgkpYG/Nqh6nkIPRNvM3YsdvhY/SmzWWnjkuFXORLcWMiu6YBdYCqGiEG
         ha+ZgOtldePbz6vR4x40Jp73gYcBHydDN7yu4CelR/YraSFZaV+zY685COG2o34OznIf
         tjuhE8+3I2J1V52ARjJXa2hcAuCG3dIUKJddGGNKE1VPBpr3kWbQXyYQk1XeASupQYms
         JtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        fh=cJAzlz3+9qThzrS0e5xXUjwoiJeunWzFPLgOErXuzu4=;
        b=LXHcru87dlKAYnLPem/4m8Y/iVmJsiuOyM7ydJUPBQPwqS+1YeEqzZ8t93UGiz/dI/
         ErjPdKDm3XvdBiZB0wJxS2L1GW+G113kOGqGiefcf/dHDyKeYvhYxbq61myM6YooMx67
         mpr+pK3Gj30mXlNqG6skq69EQZX2GMdnY6vQiY3tDfkaPYIDb9QJhPEI32dHeDVcaId7
         IVn1biug9HxavxJWVzgi6L3XVBQnTsxhGKvW8HAHy+jkmibFzSAX4fbxMkS+YVB9t2o6
         DNsDq3LmzD98YLFW4qPbEMxtS1HIKpyYMzD+V3xQXBYBiYVk3cHiVpxu8LguKJd9pepM
         9fOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773658979; x=1774263779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        b=zEEGwTH7GYjRTO86vClKVJL4GU40sY1uqMNLsVJN0utzvhJUEbD/+fPjRjRLAEUydv
         epX7dJPuYzG1P4CzSIew2VoJH/YQSpQDFRs3Zii/8s8Ip4cZ/j8yCLhqisCixvCtDTDE
         N95JRHFtbXd3pYIq8H/pApPU7L1AwS9PxIR186+InUFpxkBrcq9eI6ofXvowj6lP2ZrU
         DDWtIW4Ogu4rqf+9uV7E2WetDDCdyBIKDExOypsh761WXu1nL/skKVPQ6dwvPo0Da4gq
         1tfQvMxDTOyBNcgJRQ1Qq7BeXLHvmb90zcQxdl2ce69ycmevU8sPJX/uBEzV+Y4Kfq9t
         OLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658979; x=1774263779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHF5jh1E/8cDW6oFzgL0o++DHKJ5vfxqmY6kxOKCXrg=;
        b=myHkwcI06/Em0k9x2z66Cu5d9OydwCqou0nbzfUeYKmo8JWYwF9jOULWgs9tlCfKPw
         wyl5J24joazTJsxcPWqKWY0V6pY5WmAAzgtDKxKw68ngCYm5/c3dkZT3g6BWVFE3UihK
         DHYPQdOXhvKu3f/YlE+lqc7Yru/87KrBcwU8dpG3iQIp3fUzj6niCCxEKH4saLNyHtU3
         gS1a79sqTRqoVyAJ3R8Q9+H/6ueCIlhOrnWU/Y//cVJZ+zarr+SMFgmipvW1Hv9ZMBqz
         Eofj3eZS0Pb1dedVz23JJfkZnbdHPJpMa5ZBzW1GbjW6PLkODzkJsKyYjdw4UelRICaK
         6Rfg==
X-Forwarded-Encrypted: i=1; AJvYcCXUilPai4nNN3tfzBd2DAcQQiIXJ6TfP1uAB3wiEI92lPLARSYmL5Q5I21/k1yc5dgU+aM3LjszVj7LwyZBckU7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvx7io5u6S+ETqkMXSthn/x1237gFo+PN9OelEub/awnNKCVBh
	L/idv8A8yqShrry/EIYDIuxdgqhQfOM7mNKAeRT5uhlQTs/qaDv7CYAfJP5dBBsuv9wp3U6gNbY
	0ctbwSQ2fFoRtuPAq0gkZCV7IOc8C8wxqNLx93AvHYQ==
X-Gm-Gg: ATEYQzznViwDf+ZBD2rvX8+ozjUAaRSikC/eNdo8e6ITAQiLInP43+xKHVPHKAqZUI8
	Fvw8/Yh3Mlx3drtOSTEOUM2thCi5jSAML1aQiOB3tx36lQSV88X6DMb9K9iBF4dXTB4JFUniEKp
	lkmKoTn/VsK4gjYUlWIYbjYw+MDgcOJ0Ph2qPTlKnGl+56lashkxM9d5x4jLejEQ9RbRsPR1ojV
	Pt9nbaEOcXX+L2dV+HTzk/tf148UqCQlsdDNjfXyOplkf20dMHfMM/6eu/XnbsdiL9JBuMLKo25
	kiZtoKX0
X-Received: by 2002:a05:6512:3d08:b0:5a1:476f:bbcd with SMTP id
 2adb3069b0e04-5a162b1febemr3904293e87.44.1773658978742; Mon, 16 Mar 2026
 04:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com> <20260312-v3d-power-management-v7-2-9f006a1d4c55@igalia.com>
In-Reply-To: <20260312-v3d-power-management-v7-2-9f006a1d4c55@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 12:02:20 +0100
X-Gm-Features: AaiRm53iPYU3kIDyxQsV0KhFz9ohyZ2kXqcNJl_f0uC65KcEG9ey-Zyr9y0Dr8Q
Message-ID: <CAPDyKFqqdGG34+a7hY8feNHsnJsHvq0M45Y5-hDJp=bedHcZpg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pmdomain: bcm: bcm2835-power: Increase ASB control timeout
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, 
	stable@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_040301_846795_4E15E040 
X-CRM114-Status: GOOD (  21.05  )
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

On Thu, 12 Mar 2026 at 22:35, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> The bcm2835_asb_control() function uses a tight polling loop to wait
> for the ASB bridge to acknowledge a request. During intensive workloads,
> this handshake intermittently fails for V3D's master ASB on BCM2711,
> resulting in "Failed to disable ASB master for v3d" errors during
> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
> a broken state, leading to bus faults or system hangs on later accesses.
>
> As the timeout is insufficient in some scenarios, increase the polling
> timeout from 1us to 5us, which is still negligible in the context of a
> power domain transition. Also, move the start timestamp to after the
> MMIO write, as the write latency is counted against the timeout,
> reducing the effective wait time for the hardware to respond.
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> ---
> To: Ulf Hansson <ulf.hansson@linaro.org>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> Cc: linux-pm@vger.kernel.org
> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index 0450202bbee2513c9116a36abaa839b460550935..1815eb4ee69b9b672b5e31440=
2f1cc9897c57dcb 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *=
power, u32 reg, bool enable
>                 break;
>         }
>
> -       start =3D ktime_get_ns();
> -
>         /* Enable the module's async AXI bridges. */
>         if (enable) {
>                 val =3D readl(base + reg) & ~ASB_REQ_STOP;
> @@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power =
*power, u32 reg, bool enable
>         }
>         writel(PM_PASSWORD | val, base + reg);
>
> +       start =3D ktime_get_ns();
>         while (!!(readl(base + reg) & ASB_ACK) =3D=3D enable) {
>                 cpu_relax();
> -               if (ktime_get_ns() - start >=3D 1000)
> +               if (ktime_get_ns() - start >=3D 5000)
>                         return -ETIMEDOUT;
>         }

Please consider replacing the above polling-loop with
readl_poll_timeout() or use another one that fits better from the
similar helpers.

Kind regards
Uffe

