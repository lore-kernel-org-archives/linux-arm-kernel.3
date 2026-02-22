Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E8C636B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBykXcry3hRl95wYDSUTJ/cR3J3An6RSzJqIbZMk+XY=; b=jql8HTYRyfMWUZpngVccQ0R3QU
	kw/7Z6h7hZd0LYj2NTX5ptCPws3bUC1iVJqT+mTvJ24hQ6ygsXaj4Ch39gVHe22DYBhDDBKB4xxrd
	Rrta8m+VkHkH/rhvN2bS9kYJNBy7l217FT/YMtGfpKqxGpDPaVu4MztzOwB6SYMyAUktGB9JBfMFA
	qL4wHKVtsfQr65FBbDEtbzDj8Sg/+nYQxU7YRzggS5NwstKusHFNCJ3GubZ/StmocNsgsZVoeOsKM
	U3esroz1oDCbuyW12nZpUaSO9W5aHPgNFQ/CkpmemH2HAgviETUgagjWr4GwfrbbQPMS0SvmnHlGB
	g4TeDdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuCs8-0000000GpPa-3HhX;
	Sun, 22 Feb 2026 17:03:56 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuCs5-0000000GpPC-2ZWj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 17:03:55 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-649d589ab0fso490716d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 09:03:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771779832; cv=none;
        d=google.com; s=arc-20240605;
        b=kkJgY4ZbkOAY6p27AHJf1lNK+tOQEbi6BuyrldyQnt/N68qRkNs3k/VKkqIcW0aR9B
         p0JnZJTe24MxUIOkNYDUUDHTy6a57CsOLhaJ2aDVAbg4WXdkw9TP0Y1j5pNEvLoJdHhy
         R8YfXQ7gRlzK+8mpAxOM2Jmb6Ar51WG1zftj7Am4jsIj0E9ulAVosLHpIUtzIpe9NJPD
         1l37Fcz5RO7Au/bvCKwz+IFFAvIu7/+z5oogH9ubC5Ohkec0ySqQDX3talhgoP0tndiQ
         uxw2f39RHt4544XftBaSjrzDvOawAEQcXk0WK7qLWx1tjYLzkTevOW0fsRR7dTpFSOd3
         fc2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBykXcry3hRl95wYDSUTJ/cR3J3An6RSzJqIbZMk+XY=;
        fh=eCi4Ub9/zSev7mr3RMxdJmnwdeBuZguMcKKDIX8LT+E=;
        b=bEvYxx/kAoO8UMoAm5YTacltf7qgeE7atFmnIlv0xbbSiDlRqsBuBr9gQ3CvRxtd+J
         /Pq0sI8kQe6Nf80V8h2IKb3YW3bWP0gYkwbfIb9xm2ia/xyz0oT+yA6Tpq/bMkob42RC
         YFrH0UKx99YCy3hFsjNKpuaAj0d4jsj7tRppz6zG4h9HlSoTn+0rCpcHbQu0521M5tfx
         Ge0NT7fds+uWEtD2oX3adgY4lVa0mwbYbPyzUMjnV5B3FiqYt5ckNPL7nEk/Iq3g+uBQ
         Z3lH0fE4oOhkXyXUjQUfausuVRRA03KYZrn+A8zzyB0w2BG+ML4yK/EI9VRyNzZhn7or
         QZNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771779832; x=1772384632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBykXcry3hRl95wYDSUTJ/cR3J3An6RSzJqIbZMk+XY=;
        b=AXMPxsl9QjtO7ql/zVeitzibthxSwYN01tj1jfMGeX4OSXFlCB/nrrfJWhB/dfjCmJ
         lQzCtRrPhvHqCOp/z1rpP9YA4uASoW1OaOPwfqZQU57GEReoGAj56dS8tP6HjmMJ+/iI
         HxEdtlDXfzcBjZoNVoKEDLnf4ahoeqIlFavhqharO8Ubx49caGmuddkLBuAGxnT3zL5V
         4UtPjnl81cP+7UlOWgB/zmWnT51xitOxj6EiTDO0DT/lwBAvLcja2fA8IKREnynrocAR
         mr4NXcCzmhHlFgTaoVXzegYPiXoPruA5lveQpChIEoOAjSOuqUWWlgUL2tXpJs4d8De+
         /HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771779832; x=1772384632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBykXcry3hRl95wYDSUTJ/cR3J3An6RSzJqIbZMk+XY=;
        b=kbOG+l8TgrOMx1BVLnodRIinyyhLi8QZlrSn+t0w0NNFqIBPGuKB2h4KdLC0e71j0Y
         UFYfbOUUfQrBetymk+GPToZORPsR/5IjukEtsW/uux7M4/JIWICIMoUOvD4lkyoaZF5q
         qG00pkB1M9072yBEtaBQzBoeMnxdh1JWxjfG7FI8VcncYYuaAiw1RaYugW77DKou4/e1
         lXxpaV9CpVckh1O6Cu4oH4TXAVTxMOsZIcca25fC7QAMlImMN/qnjET0q+y+NJb0PwX0
         Efi512+rW+ymXz9XUKrXhGoum0N4MKJIH92cMpwW9phtW26axav4wkl/QbSb7ESuS41G
         PrSg==
X-Forwarded-Encrypted: i=1; AJvYcCWvFmUv9sfAa6ODgWuDOa6ynUf5gIEh5uINyEetQUJiBlgNjc0EhBiXh0HHVa9y75x+sqGlR080yD5mZpU3AW0O@lists.infradead.org
X-Gm-Message-State: AOJu0YxoXkh/7snxsJ44WEoSItog+Cvgsds8Kkjxi0nwcXhKxetXRcUl
	iYc9MrgV4oFJl3xOb6XHzGv6DzufZlfwnx2t8vLglpoefi4bcpyVivaWZowZZ41bB+S4gswUWvO
	7MF68F+m6CuWy8CSJ3CJjltBLvKhhf3Y=
X-Gm-Gg: AZuq6aKkPr9/vCH9cseJFYu6Rjfn15X2banaZWueHfnwN4nuH5XWn/RAf+9l5RJwNaR
	F+C/cMCh+DNcFINa+k1ZTFafQkrayRvgGh9F2L2QkhR4vtC7RAQZdgUPUZg6CajyBRf/4+9u5ac
	n1t34LWeKrY99iYpAxRKPN5KFmqepvLzCZV4DDklo1Jn/7VoJZ0bxgikJ5VEt996WSBAN0JMkrl
	jP8lASxrOGZSxQiot25jX3plh/M19DG9aXghfewKfPs8GAM13dHsQOUpK4PZ5X4/Wqkh7IlWKr7
	g9Jh
X-Received: by 2002:a53:d009:0:b0:649:c3be:a387 with SMTP id
 956f58d0204a3-64c78d3e730mr3895155d50.4.1771779831946; Sun, 22 Feb 2026
 09:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20260215205152.518472-3-thorsten.blum@linux.dev>
In-Reply-To: <20260215205152.518472-3-thorsten.blum@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sun, 22 Feb 2026 18:03:16 +0100
X-Gm-Features: AaiRm501A03rgVMp3fr1R-CFD3HgkD42BVCx_r2SycJdlIw_EXWDQ4yLRJnqDhk
Message-ID: <CAFXKEHZ9TTZMdzKr8_5UesUdajGoQNm_u_paakggtGONbzjPcQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix error codes in OTP reads
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	stable@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_090353_665770_3E655B3A 
X-CRM114-Status: GOOD (  23.95  )
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

Hi, find some comments below inlined.

On Sun, Feb 15, 2026 at 9:52=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid addresses
> instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
> addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
> accordingly.
>
> In atmel_sha204a_otp_read(), propagate the actual error code from
> atmel_i2c_init_read_otp_cmd() instead of -1. Also, return -EIO instead
> of -EINVAL when the device is not ready.
>
> Cc: stable@vger.kernel.org
> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> ---
>  drivers/crypto/atmel-i2c.c     | 4 ++--
>  drivers/crypto/atmel-sha204a.c | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
> index 9688d116d07e..ba9d3f593601 100644
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
> index 0fcf4a39de27..6b4e2764523e 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -94,9 +94,10 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, v=
oid *data, size_t max,
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
Since I2C bus errors are caught here.

> @@ -106,7 +107,7 @@ static int atmel_sha204a_otp_read(struct i2c_client *=
client, u16 addr, u8 *otp)
>
>         if (cmd.data[0] =3D=3D 0xff) {
>                 dev_err(&client->dev, "failed, device not ready\n");
> -               return -EINVAL;
> +               return -EIO;
The cmd.data holding 0xff here is not a bus error. AFAIR it can have
to do with the locking state, pre-initialization,
typically the atmel watchdog kicked in / timeout, etc - so the
response is invalid, although hardware connection (I2C) is
supposed to work. Currently the caller of this function does not
distinguish anyway.

But why is EIO preferable here, over EINVAL?


>         }
>
>         memcpy(otp, cmd.data+1, 4);
> --
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
>

