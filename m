Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987D0E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNlPguOObx+yXshPeTIquRndnBus7h4jAK1vKKf010E=; b=zX09h7+N2g8tYbE86EmagvVUdN
	REqJS1wp4XzQB1LAtH0eMMr+Vwa2FfBLGcQUxp/3AgIyeiTKBKn1b2vvQwwuZW+mg+VmC2DpP06Xl
	JYFW+lknv2KUiQlBhvKyTuYQoBzZo15U70f4aOrMR+OY2zBkuhNPNBmYktM51VBA7NlcBINDNVAq7
	Dm2HWyOoAuxvuq5KmMThVXVoycD4VA8WkYMzjFOuUiB7/ev+0LWKKlhkl9m03qfCzY3ABGf5tOKny
	1oBEnICOe58xkoxgT6pAgdDkcUG08AMw+lAzZ6D6WG8sKM1nASobDijqGdupCZMwOtdqYIGpj8DW4
	J+2NWbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIps-000000084QM-3Xt2;
	Tue, 17 Feb 2026 11:01:44 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIpn-000000084PZ-0VhZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 11:01:43 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-797d6bde07fso2210187b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 03:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771326098; cv=none;
        d=google.com; s=arc-20240605;
        b=KrLD2UdfvEhn6ervq6pEtkVlcQWg3cKb+HRvsH7s2uX0i2pF5xWpLqhrchIgDe9eCr
         HGYxvXMHA1s7DSY5Vz8/4VcgK+RI5fDLOr9coQsRoCmfPArkt6s8JV8TQGu9hWa3uxRx
         YhU/Z+LTfHcvLS/B/zjWNT654c8VhH9dmtZWcWyLHvIXccxE135FqPtm5Nz6dMjdkiNw
         erilxISF2ZjCmc84RnoUD/qvYWf8GbiSYaVTPp8kR88dJkryPo4AqsJmn50BxDhjxC2t
         XyYQyaUzApRNOayvGHYuBzkh0ZjtqktzHw8adbGN/mxWKDbnuMlTBEhHhyRd8TJpkmFP
         ciJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNlPguOObx+yXshPeTIquRndnBus7h4jAK1vKKf010E=;
        fh=qFsf84z9OUqlHgrT16N7XrrGlkKNJJFh85ZuFjtBN/Y=;
        b=bCG3DlZ4gBRvBxk9kZxQRftpB1b9Z6a2n/m50mrTHmMVVjWlV9RfsCv1dzClQU4L7O
         Ogel6W2nowT4SEmJg+RAkwESnz6nLXcAwh/lA2mCkv5DSES+4bilWr0dMfyH1afu/heV
         OB/MLWIHmkRuv+SQ1kvx8z7Rb/BLUtLxQ2eNwLMl0BqaFq9XpKM9AxZu/sJFLPILN6Ns
         TAJzgzT4tvqvAdaVCcQ0GPzmjDW2eq09BiyF5O3e354Xb0W4FmUDlunco2sSHZia8BEq
         QfMHbGCUmGirpC+tIVx4UazqBXhR2kuWIbfJ66iSDTG+jz51Pzdft+gU1IbiihGP8HZA
         J68w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771326098; x=1771930898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNlPguOObx+yXshPeTIquRndnBus7h4jAK1vKKf010E=;
        b=KcEdDymYHtvptGZlw0VQQyyCFsJe/swl8/oUQIoxkkHj+xhOPjMwPamoxm5PpUQYX3
         aGCnUKs7b71+uS8v1Or9q3UC/bwSo0N2QaqCmfYOcoMYqD2h1Wk4PdrAqijZAl/O2AHh
         qFXPWx7SW2XMoBtvVbd2+RXsWTHnpimywSghFBH6J/1dy4Zho7Bfd6RJJAF8+NXka8by
         W/PIVcaVJQkxijaiSoq8S+Dh3OeP/7/VWTTFg5awnfJmu9JufTJ1dVbd0QArxCGV3SwE
         VEjT+9r+xgp1GEQEdzwk05TSnCeppfEacU/Npr1CWxL4Gte4j7T35n1gHonpgKuO8ZP2
         HH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326098; x=1771930898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNlPguOObx+yXshPeTIquRndnBus7h4jAK1vKKf010E=;
        b=OkrY4lBQR5uBJ2zF8GyAseRXmdzu26GikB5biDljjWUKj7YM5RoZwSiFGgqqgJV27B
         FONOsaTZZ/vJ5dPWi/CHH7tMuvGNVOU3jcHK/vL3HlD9SmD+VKE9A+v2zTZGMALkR5Qo
         6r9DunErkzPmj3A6lrlhuYw1+TUd3fdaKpAy3q4ZST4lJcV9FbAaHaGzOo750i+qYcbR
         3ZWo7jGSmsm4NjEPeWtaiXiQupP49/AzaKOvRVZEz/KDy9PXZrCJBOYIwMJp4wedSQOv
         pmNpJ5GZ6Et2cT4T40DMxPWGsEMUwit2EBmNf7L0m2w7c85rTfEftxWQS5dXXPhUG+/m
         EFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPCuaazDwzIriuwTm40JuhoTt0y3W0/xnHZFlkGe/N/ANc4pBQsyZ9xMesRm0Ak/hUvJODSgAroxwqTu17zH2v@lists.infradead.org
X-Gm-Message-State: AOJu0YyV40EdeYZhr/fu3L3qyFP1cOGtL3Oxuxu1W/Idtx8TZIlvqLeQ
	6z3WSSEq53NsphUs01lTANg4979fMjHnqUYe05R6GT22tQjuROQnkHbA7PFoQDTtg5Rd5Rvq1Rd
	Fi03LJ4tqsf75yelwLhri6heSGwFrZvc=
X-Gm-Gg: AZuq6aIr5ZVD/Sh6Nb/g+xD8N8GgRW7H85j450IHl4wgYe+8ALSCKF41m3t/tuXP4vd
	QoCyb86F4N1a3/iGRTyGoUnpI3Fu0hIqOemnApzaFTK7Km50MnndWi8a9WkvVDrguGE1u2mhCys
	iFfw5WYlAStqYT9SHZR4Srmu6h0FPQyb752RU79h+MKDu9N9xJphcGZ2aQJOy1AyVTMiNU5X/eC
	luaJs07xCbAKAECjMNfGcyj3ZeotbyRWYU64VQvouX/Vl59KXlg+kOArqCWNeAoitwJCvi0HzSq
	ih5Nr2gtbBfxblQ=
X-Received: by 2002:a05:690e:4004:b0:649:bf2a:71d with SMTP id
 956f58d0204a3-64c14d8c91dmr10695377d50.4.1771326096397; Tue, 17 Feb 2026
 03:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20260215205152.518472-3-thorsten.blum@linux.dev>
In-Reply-To: <20260215205152.518472-3-thorsten.blum@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Tue, 17 Feb 2026 12:01:00 +0100
X-Gm-Features: AZwV_QhRbxpAvpo2UBR8-Y_jstIAD1Nkb3C6Xx--Z_yv-x7ERa_X4u_C0YYTw2Q
Message-ID: <CAFXKEHbzStf-8egh4QVdxz6MmAn_fBh1A4G-sb4gg+pxU9Qdkg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260217_030139_197207_AEF92150 
X-CRM114-Status: GOOD (  24.17  )
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

Hi, the change works (doesn't break behavior at least) verified on
hardware, LGTM.

I remember that time we had a small discussion on what is the right
approach with the return
handling, and at least me was unsure about it. If this puts it
straight I'll take it for me as take
away. Thank you Thorsten, and sorry for the fuzz.

Reviewed-by: Lothar Rubusch <l.rubusch@gmail.com>

Best,
L

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
> @@ -106,7 +107,7 @@ static int atmel_sha204a_otp_read(struct i2c_client *=
client, u16 addr, u8 *otp)
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

