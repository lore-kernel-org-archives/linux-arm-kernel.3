Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A2A10775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh96NpHK/Gnjs5OHX/qQC171dH+qdnnnJqOoacHs10U=; b=Mn37E1/4Ztvk/Rc02FNCfIjLYc
	DCB0Vzb8SKu3jmI4Ucal0qfrCuDTo3TGGrbmH+a7YpUQHL+Yt2apds/mKNapJryekhHZ/UVEhtBZe
	sJSxD0NYo84baKFXhm9mCNwqlAwatL8oGDZqs4wVrr2joscNsQeURMAnPqEHr1ny27nFnHF+FMh0h
	BtSu3NWpfyZnTK0dmiQrCJ2AWwVF/NXyZoZVD9A3sX9MR4MuwA3jOdQlXezPzhPGsOvSSqttDBpV6
	5lX6vGBjpRdSZFhyWHPyj0GmctAjks9MQKFzDrGlBRMhLR+EdIfomrHDqB6ImT8XkVYPeVdWa47VO
	+Y+Mcl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUi-000000099ca-0bzl;
	Wed, 18 Mar 2026 18:19:48 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUf-000000099b5-1y1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:19:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38aef9cc451so1797861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773857983; cv=none;
        d=google.com; s=arc-20240605;
        b=EZizhYkZ4i5UXuII/P+p7ETD0BmXWTxSv+DelE/H54dqYxih56bg9Hc0asXIrETuHe
         YowpcoaNQHbAsrhN4g8zB/OwsZF7Eh410W+HzLNWEYCSQ3tDjttZ0vlgdphAhyv5j2KQ
         pV7yLLphnzKkLTd000hmWIbvRMwF6rFpcHzojevUPq54hzODsqr+r6OY485yNz4tTzAE
         LXsvqKud1n8TP5H7QhdMFBqnYo9Od5su1Y3HV5uZSuj9xj/xVVcpb91iLqGQm4zgXi8G
         kFdXeT8IlnCgmeHsKcoRkSyKte4BQcRjoswY/IUBc7EVt5DkbYqO9yRism10WNArAiFv
         1EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sh96NpHK/Gnjs5OHX/qQC171dH+qdnnnJqOoacHs10U=;
        fh=k99boDh8zFiE3c4QGEjDkpYvNOD9Zuy/naLnSaZRh6g=;
        b=ifsCE4/LuNJJwtA2DtaysV4p8O3Rkl3ed9lW9qn0EhQjDx37i9TLQY3wakjw/T2DKq
         nY1b697xnT+kuuZ8g7V1/Fr/ul7i1/JDsjgYNYoO/QvtLKc6iWMxzggzt9lby5IygiRc
         +0hSN1WxDpldrbU1PNs5D7p2IatTvWIioILkL0Ez4oIQvkqJQH0mhlpNDpyGGT8Tf1vU
         g6A7KV00rraIQYZicNqrCcAhoQNen0CnUZz7i4BAQTbY66SdpqYARCwGCHlUKEIgtlay
         4RMG0h8v23RxFwunP97SFQrJal4kX8VmWUbnC1SEvboCl9IANL37DUVtZurI4dASwwlg
         mcuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773857983; x=1774462783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh96NpHK/Gnjs5OHX/qQC171dH+qdnnnJqOoacHs10U=;
        b=TuKkjdXhYjA5JLkOizwVGTR/vQNRDGzMlBqSUfnSHmB5DWh7YAawmP3n29tG5K3o7t
         IW4smXsMGrQn2imKvk7oa/1wF/jKwscReeP1cvHIigvkO1rvpPuxvTl6X1m14OgwzVg2
         6zFcEXB9YOXmZeJUrVlEUXNXi2b3YEy9Pi1OW+YKn/zgj5M90T1MFfawHMYAuNGLtp7p
         qH8ClzVl+0ww8SWusZbWOXYHn6ZHAJJVWTFUQ81nePjHXcmGM57z55xbM4Qe6XuXhul2
         OtygvSNC2xtUWWxLb8VyPZV78M/33wBVOu3ZLgdIaFyzpOKL77xgRhkYfyC2OIb+AJYQ
         b4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773857983; x=1774462783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sh96NpHK/Gnjs5OHX/qQC171dH+qdnnnJqOoacHs10U=;
        b=pxMXNpj+6fw/8+drS4Rn0rMLI3qsQeR2GymF3DS+XNrgbGXvEqQFUGDWYH79/JpBGS
         kDHbZQT2stai2F4U2ydYyT30ZhkTY8E3rSCkYTX8oCBePKmB28I/JqM28UIPCFWhLUdS
         b5191VRODn5sdTYpxc2kS/fBbWVcRr2WcDL0GTiz3EWSHU6yDij4Fvns6U3kV0CJQCaK
         I4n+M0kWdVSYX/qmHE6Zf1TAercZB2AfTLn4Y/Ctbgn3bvadPA9Cwso/TZfLSNGMuXrq
         a0qqsikoDGEUfjttVCEsHTi5xyEBlnx0larSJICpH18f4kDnQTwTb4M7gW/CwdM1OsSF
         pzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh41KNAPsjpQXBWvpQU49trsELh7JbtvLilh+2aYHkWfFw0YGgxDAuoOA/lg50funx3v94JRovYUYPNB72tFtK@lists.infradead.org
X-Gm-Message-State: AOJu0YynYPVmHK8BDFb9mHdFpxPj58vDv1lHqXpptnGA8kR9rH4Q9MsT
	Zr6Ibgsi+NLhFXwqqY1M2fx8w6jw+aNNR7+ZAZdqm5HGn02ox9QIq2uYEhd2nYyvMAAo7P6279I
	yLkAZBdn3K6KQLk2fhCgEqMj1//MM4Z2yeVA9L+/fbw==
X-Gm-Gg: ATEYQzw/irIY7/r7ZRlRe9rNDbi7EsKlrqsroqH5sKlzebgrOINCGjhGRXK4QPf8MOM
	Oy9DjVQPOacoWIDScmaaFlc01sJP0Ez3kxkXEa2mEOnMEwW7t5ya02/oFTQjr0XL3KvJUZI+sNn
	Qi3gwkHJBtY6CaE8T2Kq/Fzg21jxG+7SqQ5Td3nBEI2yxP1MDlNjuETPoqUBF7V1GYx78RMR3SE
	N8IIAdWMZjH3Ycg3jWNW0JZUbPIYOuwwExo0MqBuHjk+Qk4RLhrkdIv0efSONVcLAanN9WDeXGu
	ieF4L05f
X-Received: by 2002:a05:651c:b23:b0:383:31cb:e3ae with SMTP id
 38308e7fff4ca-38bd57b7f5cmr17915201fa.9.1773857982777; Wed, 18 Mar 2026
 11:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com> <20260317-bcm2835-power-timeout-v1-1-19db323c51f9@igalia.com>
In-Reply-To: <20260317-bcm2835-power-timeout-v1-1-19db323c51f9@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 19:19:06 +0100
X-Gm-Features: AaiRm510MvoJuvyX_yjMZMwW_dgWQm9TQabqsR1tmMTEGls5Ev4rqc21mGQKDYQ
Message-ID: <CAPDyKFrBazYFcWxMOrmMThuatqrAq0kFG8nnYi8xQ2OJg3LeXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: bcm: bcm2835-power: Increase ASB control timeout
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Rob Herring <robh@kernel.org>, kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_111945_614009_9C774C0D 
X-CRM114-Status: GOOD (  22.77  )
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

On Tue, 17 Mar 2026 at 23:42, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
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
> power domain transition. Also, replace the open-coded ktime_get_ns()/
> cpu_relax() polling loop with readl_poll_timeout_atomic().
>
> Cc: stable@vger.kernel.org
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains=
 under a new binding.")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Applied for fixes and by re-adding Stefans's reviewed-by tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index 0450202bbee2513c9116a36abaa839b460550935..eee87a3005325848547ce1f5f=
d729b168a641460 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/mfd/bcm2835-pm.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -153,7 +154,6 @@ struct bcm2835_power {
>  static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, boo=
l enable)
>  {
>         void __iomem *base =3D power->asb;
> -       u64 start;
>         u32 val;
>
>         switch (reg) {
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
> @@ -176,11 +174,9 @@ static int bcm2835_asb_control(struct bcm2835_power =
*power, u32 reg, bool enable
>         }
>         writel(PM_PASSWORD | val, base + reg);
>
> -       while (!!(readl(base + reg) & ASB_ACK) =3D=3D enable) {
> -               cpu_relax();
> -               if (ktime_get_ns() - start >=3D 1000)
> -                       return -ETIMEDOUT;
> -       }
> +       if (readl_poll_timeout_atomic(base + reg, val,
> +                                     !!(val & ASB_ACK) !=3D enable, 0, 5=
))
> +               return -ETIMEDOUT;
>
>         return 0;
>  }
>
> --
> 2.53.0
>
>

