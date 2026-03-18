Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E624B10775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRxDxT2gnBNASiQ3ruLdElFAagcbSYIjGNtCyJjVGWg=; b=kintO9VJTnnzetgNpRe2JuKh6C
	63gy8uH8hJ5TvQNIO91AVIXIe0FhAfZsbwa8YEh39598VgTJMTHYYgmAZezU5jCs2LnUFa/2yCEJi
	Cf0GAxbuwaFqCBjZ9j93dbH0euea3OxCrgrrh+i6By9q0/8fWqkU0JUUpZUl/WsNfxJ28O1G7IiKd
	bFpOGNohKmhl3JvLgTnZ9iH+x4r4VSUI4SMuc0BP55+o2YQHkK3YmFfj509DYOLUyg5fQHz7d8Xiy
	IWhmtIqbu9/jN5OxuGnSnvDMgkATgIgto0EsjPyeQEOjFPMOoPX3ywbLAU4LVy/XP2/KtJJzqeNvv
	t8WZM4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUn-000000099fI-3eIo;
	Wed, 18 Mar 2026 18:19:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vUj-000000099cb-2E9V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:19:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so141034e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 11:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773857987; cv=none;
        d=google.com; s=arc-20240605;
        b=cy1b7XXnFOkFmF6qwqbl3kBznCad7BDbUNx1PhzevV8xzkelv+Nbh+zvrrBeI8fytB
         LtSt8ffQvk/EOhfqewTZjlFRkAyo1ba4T7kT7Iy3SxfwRRG/kRH6etJQshiYEdUP85AL
         hVp6iue+67jpBLE5VSoVgZKT12askK27PMc6iJzRU4QvdLgYIGDloA3RZoWmqfOnw9IW
         YpVF9dill3QhQVZ2fy8k4l7KDP0nlslmE4v2twnbNg0xJLjrbKAN6L/xBEnbvO6QNlKL
         Gsjd2nsUrM6RtjiwBhoL47IC+H7G8JFZRQWUtktU6BAHXeHlzA/s1qegOSFC9KcequG5
         LmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NRxDxT2gnBNASiQ3ruLdElFAagcbSYIjGNtCyJjVGWg=;
        fh=PiFLHijtSNYA2zHzZYf6Rp+32b89Az+FvoYvNaowxVc=;
        b=l1ZHUpQjuN7qqlkKuMbjP87Xu+gdWpLJ1jgIxtBD0Dwkruqg49AMrg7/D1nC+/T7KQ
         ylpcbF025BpoAT9fnHjnCCjSc6OkTqYMTmogw7j7zWq26zwq8O4mTNXon+0Mxzbx6t5d
         4QmcBiF/tsMFWyzDUx5Lj026wvRhJ5jAP1zFTlw+XxVuTfN1PbpFBF0JeqtdSYLEC8aG
         43pblWqdJilWQR1+mxPXeNe47IwINCo8azZ/JvF4w3jvzhpttfMcSv+7VsZUDqJ8lI97
         /WWb5nBtD0K8THFhsvnLXFAPMFBrKaM4nRDzecS49r7UvIt04fJTNu00VW3fiTdDQawI
         Si5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773857987; x=1774462787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRxDxT2gnBNASiQ3ruLdElFAagcbSYIjGNtCyJjVGWg=;
        b=AzRApSDyZZ2siapSKjrEpxXXyTblvu7iwGgecTyyB0re6ysVWQ5Gzjex8cGcsDhpNO
         DQOmsdLzf5dmT05A1u5vHgOeZgzNIBEDvmU0vDklmVN7iDLqbttx9HPHLNNpfg3qXUDm
         3AaCHvRR97/rJINf6Gt6FSene2dB/M3Zs/zC22uhAkGcj7b6K2dDtVe1mUCJIQuQOjlv
         bc1XhYWdBBLvq/tcKCbL/2BBwu418MuI5YvgkuHXqM2cfs6VfRHANBD9AVH9zRjjwkjX
         /367fc2Lw90cQ4+4cqRGXQEiigjmMym+pZA7oNYGmhP74eWs64dfxSb9lWLVqUuKgpvk
         fcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773857987; x=1774462787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRxDxT2gnBNASiQ3ruLdElFAagcbSYIjGNtCyJjVGWg=;
        b=Vp6/SX1gmkiSu7W5THeRRhvk5VBr0P1twXweEUSpFlJMo+AiI48tdik221qco8OyqM
         pyptyfu27wYLWYDGaxXcvqzJNq8SIfjC1nNwQmgtcOV5f2vAZkfaGm1MHqjBEDdQj+mG
         XUlKlYpijx3zl/eav1MVz5TDH9YphJddio0KGu2Xk6LqY/JrfYYIbZDf2R9glzVUum/L
         ZvGvu1i0r6l589henmgcI0o4wfH8Mzxxio2iu253vN89BHcOe/3RMVde2dIwX7+SUDLv
         jcrWlnuwwXUBbDl9VfovYb7Dyhx7vkIqfbqkZRhXADF8AmddIgCV+aA+pHESuY3me529
         izZw==
X-Forwarded-Encrypted: i=1; AJvYcCW7mulIR+jrOuYRLko2AJZjxKtsJBPgMjJ04tYBacIkgO6f3whwyR49WY9A9Yw66mBwr21DLl5gL+Wxu8HunXXv@lists.infradead.org
X-Gm-Message-State: AOJu0YxDnEGhRlbCcWbPmFrqyhNQLBoj3lNduSASjkJRqJJ/jdiiup9O
	VHFMJP+rpYS5HBsfBxOCESGsfk++Tfc7SKZRrvryeIpHLNBLXfN+qTQ5tddohp5xbnBsnPFOD1I
	mluh7k1caiFghxA0ehohUgdSwz+vVtrOdTXjkVheT3g==
X-Gm-Gg: ATEYQzycMhlGR1brsF+9NeBbJnuqVBwQTM88jB/2D/jf7TOyEUwiuv3qubiILUkcChI
	jeUnS9wFrt53v9ktCdF8DdUI6spfSBJVk3FZPVkoO7MvfC43fmusCY4yToZPrNSLoUBO4MR8uFy
	mIoEZY12unzSQnVA70qYvhfJ1/v1iAO08UbweduGgbCtQHsSaHBMm3/0d8fDRMtUi2DLTS/UGeC
	a5wr0+5z/NxcG3iR6Va/+wOrVIRCslBO3TvlheIj7gLYoA9ILOZcRNqRTwMq2LzjmVkqXfXm0H1
	ClydduJo
X-Received: by 2002:a05:6512:2554:b0:59e:171d:a68d with SMTP id
 2adb3069b0e04-5a2796a8fc7mr1439815e87.27.1773857987280; Wed, 18 Mar 2026
 11:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com> <20260317-bcm2835-power-timeout-v1-2-19db323c51f9@igalia.com>
In-Reply-To: <20260317-bcm2835-power-timeout-v1-2-19db323c51f9@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 19:19:10 +0100
X-Gm-Features: AaiRm52B3afGivAWtwZPnIEqWUc7ueqawx3ytlYolTm7X3odgd-DJ0WgKKEck8U
Message-ID: <CAPDyKFoFp-YSqSm2YXJywNk6=nhhdOtijS9ONdaw7PCe+Oj_iA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: bcm: bcm2835-power: Replace open-coded
 polling with readl_poll_timeout_atomic()
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Rob Herring <robh@kernel.org>, kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_111949_603938_BE3FD97B 
X-CRM114-Status: GOOD (  18.62  )
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
> Replace hand-rolled ktime_get_ns()/cpu_relax() polling loops with
> readl_poll_timeout_atomic() for the power-on (POWOK), and memory
> repair (MRDONE) waits.
>
> No functional change intended.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index eee87a3005325848547ce1f5fd729b168a641460..b76d74e3849be0aff226cfbe3=
11970c9557eccfa 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -215,10 +215,10 @@ static int bcm2835_power_power_on(struct bcm2835_po=
wer_domain *pd, u32 pm_reg)
>  {
>         struct bcm2835_power *power =3D pd->power;
>         struct device *dev =3D power->dev;
> -       u64 start;
>         int ret;
>         int inrush;
>         bool powok;
> +       u32 val;
>
>         /* We don't run this on BCM2711 */
>         if (power->rpivid_asb)
> @@ -239,12 +239,8 @@ static int bcm2835_power_power_on(struct bcm2835_pow=
er_domain *pd, u32 pm_reg)
>                          (inrush << PM_INRUSH_SHIFT) |
>                          PM_POWUP);
>
> -               start =3D ktime_get_ns();
> -               while (!(powok =3D !!(PM_READ(pm_reg) & PM_POWOK))) {
> -                       cpu_relax();
> -                       if (ktime_get_ns() - start >=3D 3000)
> -                               break;
> -               }
> +               powok =3D !readl_poll_timeout_atomic(power->base + pm_reg=
,
> +                                                  val, val & PM_POWOK, 0=
, 3);
>         }
>         if (!powok) {
>                 dev_err(dev, "Timeout waiting for %s power OK\n",
> @@ -258,15 +254,12 @@ static int bcm2835_power_power_on(struct bcm2835_po=
wer_domain *pd, u32 pm_reg)
>
>         /* Repair memory */
>         PM_WRITE(pm_reg, PM_READ(pm_reg) | PM_MEMREP);
> -       start =3D ktime_get_ns();
> -       while (!(PM_READ(pm_reg) & PM_MRDONE)) {
> -               cpu_relax();
> -               if (ktime_get_ns() - start >=3D 1000) {
> -                       dev_err(dev, "Timeout waiting for %s memory repai=
r\n",
> -                               pd->base.name);
> -                       ret =3D -ETIMEDOUT;
> -                       goto err_disable_ispow;
> -               }
> +       if (readl_poll_timeout_atomic(power->base + pm_reg, val,
> +                                     val & PM_MRDONE, 0, 1)) {
> +               dev_err(dev, "Timeout waiting for %s memory repair\n",
> +                       pd->base.name);
> +               ret =3D -ETIMEDOUT;
> +               goto err_disable_ispow;
>         }
>
>         /* Disable functional isolation */
>
> --
> 2.53.0
>

