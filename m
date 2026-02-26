Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CAFD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB4+0Jjmsb7WCQkN35VAE3lNJIaVQsTkaWwYNjZ0X0I=; b=z50bxiKwwOIdBzDebapHEd7+Al
	hLNwIlZV0FX1Q+GSMCJL/UOPf41CShoG3pJVmMMKKL43etKlAV2Vr4eesPd0rYYvbEC14u7UP2JG9
	wwXE59b5q+zjz6waHbSEK5KG7YCc4Req0a+MWnTOuEBpO22l+sF8Yiv/mZV2e3o8ydLvNem/il8Ze
	6Ug2aoRO032bX8pKmVvCm7tZfAZ/aEKknP3DEuPmtUav8UeBirxAQuxqU52krdEct90RHpGgnBikh
	GSrO/HtB5Xz/EZokbAMuW1MJRY3lWG7TaFP/EzYbz6kGq8KnNLAIdl+cfjPd9hzugKLhYdLZHJa93
	OapikcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvioq-00000007Eiy-3O24;
	Thu, 26 Feb 2026 21:22:48 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvion-00000007Eic-46wZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:22:47 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-7987dc2465fso1082617b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:22:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772140964; cv=none;
        d=google.com; s=arc-20240605;
        b=jTwDZlF8ywnyFIwU1UKCjdDbvh4eP8AFmgAu8dQp0wqafxh2IgZ8bgyoLzMQPtaCv6
         cKFoVB8z94Z/MZ8/DEJINMCAyv+jsNnBQ5OHDHNzv99bbqW5mX6OYLpoDRwg86ox7DMR
         crLit1nCuVMACWtFBAxWjfOkMHd/764a6bWPi3hDbBpjllPMI9Yjjzx3W/dq5EgPAYQl
         seSm7mGR34rR6WopswRDtFL0TygOHW6Ibd0MVPx6PxO3HM6LuUHtXQWdpA5xgvq6P0Gx
         +Rj1OKcj9vI4IF9d/8iXsJ7EpuwQmgNOft32TcQwwlhsc2jlBeSLr7XO6MyJhzLnssFZ
         CB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JB4+0Jjmsb7WCQkN35VAE3lNJIaVQsTkaWwYNjZ0X0I=;
        fh=5MqactFzCeDOYeBWfjMECPNBCoMSq+LHvSRBfmOKovE=;
        b=FFN9jSGxjHyfLlZmMRwrwW7fk2E6QmcuPsURTw5AWpIquBI4CbnH9bc5P9jGArYqME
         vzaY3dJYhL6pPaa1JjX0LQnd5HemSqjZxMT3rBSyQNVfDuNbkN32l2qZIfpoxtpXFjXt
         Gc1ojxGudMfb/4qHjh5YP6AR8o66KdWd4yw+B9CjsorXIauBdO1lziB9HkvaMb/0j6/n
         Wq2Z7g7c6s/HIYadr4knaFUldrJmlEKr2JWFSU31Q1kpSlAPgKqa6ef8FbiKdaYddIHO
         dMQxTAK90UfYlLvjdcewKhk/Tp3IzHhEtwsykSeIW5uLbFgZxD6VHeVdqtTefdDKLY4p
         61VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772140964; x=1772745764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB4+0Jjmsb7WCQkN35VAE3lNJIaVQsTkaWwYNjZ0X0I=;
        b=WTR521vaaHmzyeMYQeqeAVggseEg9+mvR6vvg2E7T9pxsjtfqLiijUYF+Teen/zCHQ
         JOkwBhA+O4xGOZmoJEZ0uHqZRHS82RHYibn1/rLZr3ioO832XnDlU0452XGkYzQnnixf
         T/wY/DtG6mYWieOdIKOyg4x8UqX5gl8y0Kz3y9iEWq8n1VV8JWhddwbQECuCN3PZxgri
         sQD0ffjYoROghxLL4KIcae2la2t7pKiSeGD1TKcn5JLHqqKlSPem3xqjEsgUWfMOby0v
         KLT1gXipRi4mF0ED2yjyOtHpSXdwVsz1U0mkCfZU3yrvdawvj0BA7wGUGHFROYZiOLT6
         4tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772140964; x=1772745764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JB4+0Jjmsb7WCQkN35VAE3lNJIaVQsTkaWwYNjZ0X0I=;
        b=Eo6PLRSF6pB5eSovYTO27EpsvpDpXnRLBY67gz9XkoolCfSpTRuAhb1GJU/gdtX0H3
         4oYMXFA7fnCgNSd3Zos15uU1g3SBt+y4mDOZUsqwnFbwNwA+/RIoe63hDm1NTAVWGusf
         cXeesGTLIVvF9658RGj0BLW2ETorshn41fvACq4LSSXBego4ePCKAI9XaXyTG3HSJjLg
         oe1VuGiwHQONgJkbqqIt4hQx8upco9TlVYwLXtW+B8vwYtXoj2XLvkdhaJ8pO5Yp5VHI
         Rx5X9sIwo5/WgnOxWYSTLZUvtK610p4meVUtRX4zn9Xi9qhMvlLFF9OZRFTTkljUNmkl
         JafA==
X-Forwarded-Encrypted: i=1; AJvYcCUvglAjHWr5de19+VJWYEGyZkqKorrIOxHFqicRBEbtxoRUUwz40iMASuIlb1rAVlR/mlZajqweKTz1zLuZk+8S@lists.infradead.org
X-Gm-Message-State: AOJu0YziiFcxEBz3rol68vG8d47is04CqUOsY1ejuJ+YGKNDpDoSy0Yb
	C3HqRDTF27iV7xl1HFEseizajYqc64JwWWYw9Rl5ZFyXRDkD/NdwrdigHSN+dRJEAcnPltVn/60
	Z6FVJamivceSsBl1Ncehj817pEUWTFCw=
X-Gm-Gg: ATEYQzzZNzfAW2BAWgi7F2qmNGGbOQUoK4oTwseUgTjVpVTFk9BRYDakl2NHDxj6VRt
	0CknKWoIo4EpVHzWXHSV2pP+zuzcVRRrlOFOzlhV47nmscpc8S03/LMbTHMX4CexB3zSNgTGcir
	a+izrxw/e1fja08He9RTU1rfaU0RTJixhqy0kxztuHU3eKEUSpu8mwzbru5U8iM4ydmtBHIAay8
	s1/NYHmLJonN4MOMgfYnSyL7yjCcVUEgxpG8W5WyRxgfl3rdxKsveVtKFXHF85c0rco/a9Z6NNQ
	TdnF
X-Received: by 2002:a05:690e:1596:10b0:64c:a2fc:807b with SMTP id
 956f58d0204a3-64cc23341c0mr449268d50.6.1772140964164; Thu, 26 Feb 2026
 13:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20260224225547.683713-2-thorsten.blum@linux.dev>
In-Reply-To: <20260224225547.683713-2-thorsten.blum@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Thu, 26 Feb 2026 22:22:07 +0100
X-Gm-Features: AaiRm52It-aXFcuLq__go6bqOZfdSs9Bh4efwCHuAs4dMiL1mpRRlFj6QRKv3qw
Message-ID: <CAFXKEHYTZHT1sX0rNhbZoG40eEkn2B1Utrx+9Jn4a580sGj7Ew@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OTP address check and
 uninitialized data access
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	stable@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132246_086198_905552B2 
X-CRM114-Status: GOOD (  26.14  )
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

Hi Thorsten, thx for squashing. I hope this goes ok with the maintainers.

On Tue, Feb 24, 2026 at 11:57=E2=80=AFPM Thorsten Blum <thorsten.blum@linux=
.dev> wrote:
>
> Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid addresses
> instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
> addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
> accordingly.
>
> In atmel_sha204a_otp_read(), propagate the actual error code from
> atmel_i2c_init_read_otp_cmd() instead of -1, and return early if
> atmel_i2c_send_receive() fails to avoid checking potentially
> uninitialized data in 'cmd.data'.
>
> Also, return -EIO instead of -EINVAL when the device is not ready.
>
> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
> Cc: stable@vger.kernel.org
> Reviewed-by: Lothar Rubusch <l.rubusch@gmail.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
>
> This patch combines [1] and [2], as suggested by Lothar in [2].
>
> Lothar's Reviewed-by: for [1] has been preserved.
>
> In [2], Lothar questioned whether returning -EIO is appropriate; the
> exact error code can be adjusted if needed. The errno is currently not
> propagated to userspace, but [3] changes this.
>
This was just more curiosity, nothing to mention.

> [1] https://lore.kernel.org/lkml/20260215205152.518472-3-thorsten.blum@li=
nux.dev/
> [2] https://lore.kernel.org/lkml/20260220133135.1122081-2-thorsten.blum@l=
inux.dev/
> [3] https://lore.kernel.org/lkml/20260216074552.656814-1-thorsten.blum@li=
nux.dev/
> ---
>  drivers/crypto/atmel-i2c.c     |  4 ++--
>  drivers/crypto/atmel-sha204a.c | 11 ++++++++---
>  2 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
> index da3cd986b1eb..59d11fa5caeb 100644
> --- a/drivers/crypto/atmel-i2c.c
> +++ b/drivers/crypto/atmel-i2c.c
> @@ -72,8 +72,8 @@ EXPORT_SYMBOL(atmel_i2c_init_read_config_cmd);
>
>  int atmel_i2c_init_read_otp_cmd(struct atmel_i2c_cmd *cmd, u16 addr)
>  {
> -       if (addr < 0 || addr > OTP_ZONE_SIZE)
> -               return -1;
> +       if (addr >=3D OTP_ZONE_SIZE / 4)
> +               return -EINVAL;
>
>         cmd->word_addr =3D COMMAND;
>         cmd->opcode =3D OPCODE_READ;
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index 8adc7fe71c04..b0480d3bec70 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -94,19 +94,24 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, =
void *data, size_t max,
>  static int atmel_sha204a_otp_read(struct i2c_client *client, u16 addr, u=
8 *otp)
>  {
>         struct atmel_i2c_cmd cmd;
> -       int ret =3D -1;
> +       int ret;
>
> -       if (atmel_i2c_init_read_otp_cmd(&cmd, addr) < 0) {
> +       ret =3D atmel_i2c_init_read_otp_cmd(&cmd, addr);
> +       if (ret < 0) {
>                 dev_err(&client->dev, "failed, invalid otp address %04X\n=
",
>                         addr);
>                 return ret;
>         }
>
>         ret =3D atmel_i2c_send_receive(client, &cmd);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "failed to read otp at %04X\n", add=
r);
> +               return ret;
> +       }
>
>         if (cmd.data[0] =3D=3D 0xff) {
>                 dev_err(&client->dev, "failed, device not ready\n");
> -               return -EINVAL;
> +               return -EIO;
>         }
>
>         memcpy(otp, cmd.data+1, 4);
> --
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
>

I compiled this patch, loaded and unloaded it, sysfs entry also still
working. LGTM.
Reviewed-by: Lothar Rubusch <l.rubusch@gmail.com>

Best,
L

