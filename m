Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EB1108E1FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=; b=ZVAsPaYEPK9cKF/tXBISaM2xdr
	DlCZdGwwy8zcYsZ5F3Vw8TdelaxM4luRKgzfMej+sqI3S6K0a1+ZfUn/M2Tw1/rCb5dpmb2hcwmwC
	aEOYeMGA4xPUBoyRlpq3O137COWzZy+YuEsMOqNa/qkcXA9FcMHA6neTse7mSr92xh56X2Qe3CrYw
	1dTzOJZrBCrQVeqj1BO5KUgUxuE0HyyJovqiHMf5YasHxluEvD/J8OlmWsmdZaMqwWSQzLnczEyXa
	OTC6G7DeHpsef5/2UdYmIse3k0GMTVxBAAYs79Y40fSn6od9mXtJ6a+RgirER+8heXm7CMbL9NZeN
	Y4NX25xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CJX-0000000Aar4-0zir;
	Thu, 19 Mar 2026 12:17:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CJS-0000000AaqW-0i46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:17:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so726843f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 05:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773922635; cv=none;
        d=google.com; s=arc-20240605;
        b=ZN5qpDUb5qlxwTvkLOzyjTz8KrwqJ/2DHzC1CTIV2Cijz7n5dGQqV//Dv43Lu5o8el
         yw9wybGA9KVtqXcOzySAaUbLAZ29vqxV9BA7QhuSvzKQipqfuzQJi3km+gOduxjvBaic
         TwpxFVc1FqWNFETMViGu2/YR2HmAW+AmgAYYyl0lh7cJXLa8NZeG0c9h4cyH+x6VID8b
         cd5Fw2hreSo6976zoCXJfBtp/w56CRpFhodKT7J4Rl/jqF8NqZPgI/Qkaa9EU9vf2NWW
         tOWtd2k4aYY6DMPfKgzl25GSWdBYkU6uI8QBMFAt0JAZ5HEqs33iJ2R2OGH+Ny9HKSiP
         GKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        fh=P5XIGhzs5eVABX1C0AbHrBaIqgBh4gPGwQE6s+6WWsY=;
        b=FXDCfYGIJgV6VjBKSSrFUcjZKomRH5Opf/w3l5Z5UaO/P06xiKhPhBpOEXkWewHsrX
         yZpUeM+Ye8IeaBe5HV+KJKsKGLWKX3IqwGPCi7fOPxF55k/pmQx5/mjAmbICnkOSQpve
         AtKMViVOwJ/FtZHp0eaGQGYSdB2GykUGI8Y+xm4VAe6FsNn/ZbKRYH4WTNI4Flw3R879
         9fqf4SFJfII1tCYLJilBzYSnBhMwygnLS4gWH/hdz8snBsnpDuHa5XfasG52+UYigMJB
         1tS1YK41j2fW9lh0apoJpjXYn5YiGqemhhf4e3kQefFYCPUZcDFSHSdywXr4iGgep6x7
         goGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922635; x=1774527435; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        b=GBMl8Nc6EIwA4f8JPmsK5msU0V5Cyv9J1Fj3rt27Rdz/eWMAHSa93NZw3ZY3/1jkHW
         8zK6iW5xQfAkZygkCuDlyFfcBABzWFVBzSpw1RnBJsEEXkMZ5oKFbFGYFdzMnX5EWifn
         9txEE7MQ9413X7uIKcims59cveOtfl9+tbN59q5m97fBUZ2OXojJWZnbcs1Czq5d1Dv/
         HtwaYX2z16VRgG3aJnmk3DqgzS+vpKTxbIWQD2oG/u6rTR8BiGzKy7JQblki6MoSXIkx
         XCqvmoADfRcQQhnXIyvPlVVtKIsts4PMlVpJvFseYHQf6MOi8Of+e2wZq7xclESD3PVq
         fbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922635; x=1774527435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21ilbjuNC0oBqcKWgZWCjkwsXOw1Gq5+6ZwV8kiRzTM=;
        b=YDKj4XZnd0Gl9rKegYvuwdLk1Fcx9WG6qMaZS7xF77Nx4oVzDBcJzr2+JauhW0duCK
         LMKWf3ft8Q5FLTEbrGYKbvQPNNTONYIL7j43DC9re9zLHoQch52G0A1aCDAq2bg7x9J3
         NisVwtLojpbad/dqw2RoHCnzlRHBsgKOI18WlBYtUiXfpBn+TrLtcFImDxtab3cK39KY
         b3FTLKpeGddjCl2rIe9KQeN2sDl5Fz/rZLK++u1bHGWyrTAhq0vCaImCE1hdiBNwsfKK
         TaUMoBEbIZEU4SZDgCBOEEcwXGo8GxPK+c9zzO2V0KdFxZmWDGs131MOEGFK0XE+1QeQ
         upNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQW2oVIJbCnNT/awMO6r8asvLOfKuQchgu+8MyV6ZlQG2VmoNJlUfjpgBw2SVm8aO8oa7gBaGJrYkTads+r2w0@lists.infradead.org
X-Gm-Message-State: AOJu0YwqmBtfQbUTgW4j29s7YC+m18QOVkG+4wROa3ZfdIOB+z8+SY0i
	ClCTFnPGlV06v4ri192WMjjeOAFJW9NA97V77wVmlF9prlGrA/cie/SfCEtE2U1Eku2pUbFALTi
	bWHcFLWJDirnq6RuYO+YLmhITdecO2f4=
X-Gm-Gg: ATEYQzx/Y3GrZMfMmWU1UEf/WY4ezCIqEahTT5LG9j64ox4veXcKnw/SzZ/l8nl4QB7
	iIgYyF8XROhqW+QnZnGSqStE1dz05LhEO2k78LcQaciBjpPDFcV6YSbzU/M7AbnHZe+qDC1uTYi
	l+i/I4ud3ip6krzgEQpHUdNBsEVPav88HY4W4vzZNtj8FfPxvAlghTj7sro2QUo6GH2AhN49Dhd
	St05pDpOsThNpfwG5lsOx7DmGDtzx7x0LGQkUwJMS9GNk0OIAXy54n07J9xOQMsVZXRbHcskF/m
	ymM1+QlHAGchcW7c7Tq4Ag2iPmOo6MmegTRoS0nNKgcvUcvW4Z2kW08FJwpBpaJ+YlHs6XjVpUC
	P+hs2GQWZvkV6kuYTuV04wEbtoQ==
X-Received: by 2002:a05:600c:810c:b0:477:b642:9dc1 with SMTP id
 5b1f17b1804b1-486f4475342mr116479195e9.20.1773922635175; Thu, 19 Mar 2026
 05:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
In-Reply-To: <4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Mar 2026 12:16:47 +0000
X-Gm-Features: AaiRm51lDKJiyDMRjLR6PdRV65bY-qlwMnmYthicRSEOPW0Z71EeuFLE0ovF12g
Message-ID: <CA+V-a8vtA4-779BNJERDoKP6ZE7Xdmap3bS3d8Z_OHGjAfk8-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_051718_276794_FDF0CDC4 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Mar 18, 2026 at 2:16=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Restore alphabetical sort order of the pin control subnodes by
> exchanging the gmac1-pins and gmac2-pins nodes.
> While at it, fix the index in an incorrect "GMAC2" comment.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v7.1.
>
>  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 58 +++++++++---------
>  .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 60 +++++++++----------
>  2 files changed, 59 insertions(+), 59 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> index 52e5f6c3ab67d177..4c0e52850ca97250 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -253,6 +253,35 @@ can0_pins: can0-pins {
>                          <RZT2H_PORT_PINMUX(24, 4, 0x19)>; /* CANTX0 */
>         };
>
> +       /*
> +        * GMAC1 Pin Configuration:
> +        *
> +        * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
> +        * P35_0-P35_2 for Ethernet port 3
> +        */
> +       gmac1_pins: gmac1-pins {
> +               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> +                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> +                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> +       };
> +
>         /*
>          * GMAC2 Pin Configuration:
>          *
> @@ -283,35 +312,6 @@ gmac2_pins: gmac2-pins {
>                          <RZT2H_PORT_PINMUX(31, 1, 0x0)>; /* IRQ13 */
>         };
>
> -       /*
> -        * GMAC1 Pin Configuration:
> -        *
> -        * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
> -        * P35_0-P35_2 for Ethernet port 3
> -        */
> -       gmac1_pins: gmac1-pins {
> -               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
> -                        <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
> -                        <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
> -                        <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> -                        <RZT2H_PORT_PINMUX(27, 2, 0x0)>; /* IRQ3 */
> -       };
> -
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> index 3c636c92f3d6f445..ef6cc7497c2c4c8c 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -336,6 +336,36 @@ can1_pins: can1-pins {
>                          <RZT2H_PORT_PINMUX(12, 1, 0x19)>; /* CANTX1 */
>         };
>
> +       /*
> +        * GMAC1 Pin Configuration:
> +        *
> +        * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
> +        * for Ethernet port 3
> +        * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
> +        */
> +       gmac1_pins: gmac1-pins {
> +               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> +                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> +                        <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
> +       };
> +
>         /*
>          * GMAC2 Pin Configuration:
>          *
> @@ -368,36 +398,6 @@ gmac2_pins: gmac2-pins {
>
>         };
>
> -       /*
> -        * GMAC2 Pin Configuration:
> -        *
> -        * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
> -        * for Ethernet port 3
> -        * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
> -        */
> -       gmac1_pins: gmac1-pins {
> -               pinmux =3D <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK=
 */
> -                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
> -                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
> -                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
> -                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> -                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK *=
/
> -                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
> -                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
> -                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
> -                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
> -                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> -                        <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
> -                        <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
> -                        <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
> -                        <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
> -                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC *=
/
> -                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO =
*/
> -                        <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK =
*/
> -                        <RZT2H_PORT_PINMUX(17, 3, 0x0)>; /* IRQ15 */
> -       };
> -
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> --
> 2.43.0
>
>

