Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6595FC636A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnmkLIgWSk18hKSD8wtaKdnDH56mNXzkJ0gXdtf3O2E=; b=yjFcJFrTtJ+ukIoTH4EJldEmXW
	aLAVykgFSLxqNkvdWkjQwSYyTmsfpsKceYZEsY7Z5IWDE5qY/gk+n0nDNnELZA+4ngKec/EXzSFq4
	dblMAvlOm48SJ2FDTuwXB+takseMGjH/oXf/TIsUoARHSoV0qR7GpNZd0hupzhyfOoEvJKbrTBFT8
	PSc5jYnd5NQXFSidj7HBeBlF0ryLFcpB0/RtOkOMqR7ws3VSGRGORstKMIiEJvD3/BczlCDKiJFFJ
	LXFIBTOfyUX+CYHBY9Yz9lbIECQeZG1K3ycK8YBVvkpbYYLoaQgRivrx8YrHkNGgprDOomRnO+Oxx
	4Fh7N6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuDHr-0000000Gq8e-2Bgx;
	Sun, 22 Feb 2026 17:30:31 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuDHo-0000000Gq8J-2oN3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 17:30:29 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64ae58222aaso511531d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 09:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771781427; cv=none;
        d=google.com; s=arc-20240605;
        b=jASXpprR8GlARDrzKXYyvNmFZPKs8a+H/9bcYZqW9u877WcYI6kzwOagF0WL375NKP
         x6eEa3XD2mOcBmj1ZP20AgWMl04cXZUjGU/GV8cuIyY2/uOk7AZmWexqdUPtUsR1vTY7
         JeECdk/bDIbMYe92rvIgzdD3JDDsYmyjIKJ9AlmNQKC07dzK4Dq+mdDLpOtKUiXLXjkH
         IfkoPwRegstNdxObz9NEg+LMK8r9HEYz75pCIcu5OrgRomQxeLSFnBv/agEc7oYU/JtF
         WnfSgfFtTKvZ0s/KUvN/2SRcKDA1tgULSO5V3B4Zj7Gvp2PpyFke/qXIz5bpkFhT1fOR
         mIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BnmkLIgWSk18hKSD8wtaKdnDH56mNXzkJ0gXdtf3O2E=;
        fh=FbChYX0hNMleg62praMt7Fins7IsvqX3cnq19bixXmk=;
        b=iUzq/gsywafdHTo6h4YGl64Fch41i3RSeK/0nrBAHqq82MfZyjM5WKx5BU+a708VZJ
         Bm+v6DQWj5EMNT0/s70RO4OWIp6HXtnAvdx4S08DjQY7LEW6DLed2SFoRa/GJLWw53K+
         /5WgD1rRKQOF94xfM9zPzqH/44B0nTBBHaom9wD592yuqqr8AuZRGNYMLzNGbtb18NGp
         bwkgbp+ihHl19vRjPTFs/eNqq2qh9ElCpsPZZF+SSlhN+WImPs3kKU5SNWx29ovj1HhD
         qfPB22mPROkZH2mG16E2GxxbETrcRQXsbWh5nm+Vo7ZLyQOlQeHjjGSvSFwJG0jHTJqn
         kXwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771781427; x=1772386227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnmkLIgWSk18hKSD8wtaKdnDH56mNXzkJ0gXdtf3O2E=;
        b=JZjsAbsRMkBZrg9YEk0UCvM9hJvJAlh0k2aOASluLBiqyRo1IYmkM3TDWw6s7svfx8
         2nh+UVOGlF64WoKg4NJ91t+AZxagOvORSPXnegGgf5dznvhQrBlFvfMrwd3hMGVd3erJ
         2lSL/lrh/diakp18+8AsRJpPgGUZngeSpDmyFKZBXQ07whg8HcYNVsFLZBMxgs+OK9PA
         Bt/9SgNIW0j40blVpTvmOE1MsWwhfCkhijVoD+2BBR9/FU3eDXrymqoktKOSHpk3LqRT
         grY+PcM1MQO4yZzqFFMigpeM9sdrSe4Y+VqnVIeLIlRQNBiMC3KtNip8bQQq44FeexPZ
         rV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771781427; x=1772386227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnmkLIgWSk18hKSD8wtaKdnDH56mNXzkJ0gXdtf3O2E=;
        b=rwNl9eynlvukQ7SG/aeCWLp+44qgHvqhahwhmLa9U+/bJ7xigrBjwVDyD6mtzTVG7m
         BLFtgRrWnf9z18LJbC6//ZN6q9nVL6YHyWOphkb0j54dGXC1QBI2gLeAFYBmg4QdtsfQ
         mKpZxrzMC2Kpv5dMTWMiuASQHLOQ6hV434ysF84NBuzRHgBCdvy2+k0Yaul6kd+9URqX
         gSNM+8f/Udg0bMBdBgYh3XT593zSvoEcubbmwo1LYogfsiOamnJ0Q51+Z6g8alp7wZKl
         yeXD9lBXcqcuL4cFuDxYbPf9y9CZMNheHleUliG+1buSHqAiQ+aVABXN6q5XDMv3UBF5
         n6yA==
X-Forwarded-Encrypted: i=1; AJvYcCVshQ3NiYiQH+n/Fkc7VNy/wg3q+DBoIPJBRpYdMqM33TKzWswOMqZvw8v9QyJmbxYHK0uNQFlSXUQr1xc6zWtd@lists.infradead.org
X-Gm-Message-State: AOJu0YycvquKXL1eCdgnVG3wziBQAt3LRk8lL2pkFzvqSF033hb+w2IU
	dLiJ8ls15g8dhfBknd6Af95/fR/Rd2RnERjpxNJKiIy6HAfAWsVSAoNS3EXEXQRu0aH2061mfpY
	xCMoFRZkN9Lkht8ZY9YlTrsfXQsLbjIo=
X-Gm-Gg: AZuq6aJuzYURUnxoOkz+4VKeaDNQU9whGwyLPQzvWxcVolsuxs/dqkTReYAk1FErD+r
	jT6oE/fV+pG5uun8DztD073CIBjEp1PzC4KvX4+UNsFk/dRLhL+wNi9T6TQcVwGAf8zNSoGiQDC
	b2iPoSDpGl9v0Uc+LpVizsjxJznnENKj86WVlB7HRjvhp9izhFnYBuhM7ilRvCGEORUHy1+lxVm
	mmjDLZeUtWWmuXHbKGFXos2W8/xDZX5MAxvLH4Vs2E0WDyr+yb3IYqkWhUUi1NohoofwYY9qtV4
	0j8h
X-Received: by 2002:a05:690c:93:b0:797:ab72:628f with SMTP id
 00721157ae682-79828fa2ab5mr44574817b3.4.1771781427236; Sun, 22 Feb 2026
 09:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20260220133135.1122081-2-thorsten.blum@linux.dev>
In-Reply-To: <20260220133135.1122081-2-thorsten.blum@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sun, 22 Feb 2026 18:29:51 +0100
X-Gm-Features: AaiRm50kypTpMDY3ZXdNnlUeMETOr3yH_tAg04sHJcHrEEiY_Yo7xkfaj11LYrM
Message-ID: <CAFXKEHY40ybHVbWLWPjOR_wuv5sV9YYXyum6nTT7LHG+irBpUw@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix uninitialized data access on
 OTP read error
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	stable@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_093028_718354_D8E09071 
X-CRM114-Status: GOOD (  17.50  )
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

Hi Thorsten! So this one was tested on your hardware?

Wouldn't it make more sense to squash this with the patch before: 'Fix
error codes in OTP reads' (which IMHO actually fixes mainly the bounds
check)? This on it's own I'd consider rather a refac than "Fixes".

On Fri, Feb 20, 2026 at 2:32=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Return early if atmel_i2c_send_receive() fails to avoid checking
> potentially uninitialized data in 'cmd.data'.
>
> Cc: stable@vger.kernel.org
> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index 0fcf4a39de27..f4a04b297257 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -103,6 +103,10 @@ static int atmel_sha204a_otp_read(struct i2c_client =
*client, u16 addr, u8 *otp)
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
> --
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
>

