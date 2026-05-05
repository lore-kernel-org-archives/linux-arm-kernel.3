Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25407CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJB83vl3T9PGErvvTDc5wH9JWe4E3bqf8aMmSgeiFKo=; b=j1WkdIACUuNcRK
	5QZK4vWXIfDoAzEm+Zp8jpdm5BRYG854qTTG1cQ2e2TRlxdmADQD9qhd8/IkvlQj0XEJCYdt9qZ+H
	UIJRCjtt69fTW4pLg6H2sDbVDyOR8TzwlNVv5qygkV6RWiala8vuOJl9UzMsptkKuuX4KLgSSgK/I
	RFRl6OV+w6imMFCUaRbU73wFTfrIkQ+Mr/emKZSTe/WE06ZKDOmtk4gbrM4Liv/h80HGQzXNXduS3
	eE7YH5R3f+r/UjhwafYlACq0pweRQyyK+nbbhevws8alFHAqrnGCF+P/f7RBJQZCAixD45OOx6JlP
	CsGuJULBnCg00WrKxGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGiG-0000000GV7r-0Cxk;
	Tue, 05 May 2026 14:25:28 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGiD-0000000GV72-3SMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:25:27 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3937014be0cso33075881fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991122; x=1778595922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJB83vl3T9PGErvvTDc5wH9JWe4E3bqf8aMmSgeiFKo=;
        b=K0x1nop6ujR440XpzKPblAEO0/aeF5LdokUeufCYAy7WfWiA4R2brp2kL5qApPNkI/
         j2pJlZezhk3tDknyxD4u6t+os591gS4ZBi5gCxVsOHRAq39/XYmbZXzJN891gkfl87rY
         nvF4h9cUTJT1Bn0Ql7/3wV/Saqq/4fPrwWaa/v63dEoDHhmX9yAB4fgyoYznc5tiOozf
         4zkTZuVdMXPwENZwM9pkmBs3UyEjp85ROebVfFXohSux99dydJVN++h1B6jS9RwVVp3r
         tPA7dfC+Jg/ezCbGB5CqrakPYyYD8PF1clB27ZHDKnQiFnt3I2HmvKPxpjfK4hxo2uyG
         EvPA==
X-Gm-Message-State: AOJu0Yy2DkMNjR2h8nOVglKMKUQjs5QmgLeqbuRjc/Qg54UEg1bULnRc
	LL73NNN/7c/YyM5yieG8ybUqFPZykQYPcNvyPyM0p8D1xv0FEWW9dX7HjQiRShW8
X-Gm-Gg: AeBDievsi/ms28XgqnGi9jPQSnmvEdpMWjnM+Q5u6FJSIAky6wcyXAr4S5flIIf1fd7
	/tmwyDrZuOIuj8C1LmQ+qDtMj6mG7Q6TCASU7k4b49o5yxKnp3YinnOiac1wFX+6zKd2SZvDLI8
	3DtrmgI1XUM4EsikCqL1b/alsi6WEbXY3g3YYPID9KYUVlICl4tK0ibWM3jaG65nrZW6R1clkFJ
	lHisXQ9YYl8fSBDs7p6HP2W7lW+Vg/Zm2keUOACt0BVAs83xduOeTQrN3qaPy5U9OSN66+aLL9c
	UwhSs/1LGxDjoH8P8NK0+5Y+Mh4PQiH29IaTmzxfhyMi0bHn9fIO/NufhLPQVPLWdzlaRIbFw1o
	AyXUaUVeq+RQR9m9q6X/+TNNrBlKg360nxgHp06ij38Y4oldKqhTw6EPel6+1G/PqUlAZLJAoIm
	Zpv/SyyeKVFjHOpAlqFDnmJ7XLMyrSiMYBRufaoleCm4DNrfZGoaTxSSzSZ0mFHvPdqw==
X-Received: by 2002:a2e:9648:0:b0:393:903c:2259 with SMTP id 38308e7fff4ca-393903c246bmr30936221fa.10.1777991121992;
        Tue, 05 May 2026 07:25:21 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300c88sm40661991fa.25.2026.05.05.07.25.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:25:21 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3937014be0cso33075361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:25:21 -0700 (PDT)
X-Received: by 2002:a05:651c:3259:b0:38e:1ebe:960c with SMTP id
 38308e7fff4ca-39378522d66mr50880261fa.26.1777991121043; Tue, 05 May 2026
 07:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <BESPR10MB922376BDC75D346412FC33E4D2302@BESPR10MB9223.EURPRD10.PROD.OUTLOOK.COM>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 5 May 2026 22:25:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64g_NKa94XX6Yw0a0L2_KozPOztWKVGTTaJa0TNOhfpnw@mail.gmail.com>
X-Gm-Features: AVHnY4KoLg5lkX21q-Zxo6-eS2QT5rZsBxGQaAbQih-ztZveGoNZSFlXSF4D-kI
Message-ID: <CAGb2v64g_NKa94XX6Yw0a0L2_KozPOztWKVGTTaJa0TNOhfpnw@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: allwinner: enable overlay support for
 sun8i-h2-plus pi boards
To: Nisarg Rajput <rajputnisarg17@outlook.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_072525_880938_B9651A6D 
X-CRM114-Status: GOOD (  19.32  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, May 3, 2026 at 11:58=E2=80=AFPM Nisarg Rajput
<rajputnisarg17@outlook.com> wrote:
>
> From a0c7eaa6032748bb79953282a984064a922c916f Mon Sep 17 00:00:00 2001
> From: ixnisarg <rajputnisarg17@outlook.com>
> Date: Sun, 3 May 2026 15:42:38 +0000
> Subject: [PATCH] arm: dts: allwinner: enable overlay support for sun8i-h2=
-plus
>  pi boards
>
> Add DTC_FLAGS -@ for all H2+ pi-class devices to enable device-tree
> overlay support. This follows the same approach used for H3 pi boards
> in commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214 ("arm: dts: Enable
> device-tree overlay support for sun8i-h3 pi devices").
>
> The -@ flag populates the __symbols__ node in the DTB which is required
> for applying device-tree overlays from the bootloader or firmware.
>
> Boards affected:
> - sun8i-h2-plus-bananapi-m2-zero
> - sun8i-h2-plus-libretech-all-h3-cc
> - sun8i-h2-plus-orangepi-r1
> - sun8i-h2-plus-orangepi-zero
>
> Signed-off-by: ixnisarg <rajputnisarg17@outlook.com>

Please use a proper name for the author and Signed-off-by.

> ---
>  arch/arm/boot/dts/allwinner/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 296be33ec934..2e0cc454df74 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -198,6 +198,12 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc :=3D -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 :=3D -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus :=3D -@
> +
> +# Enables support for device-tree overlays for H2+ pi boards
> +DTC_FLAGS_sun8i-h2-plus-bananapi-m2-zero :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-libretech-all-h3-cc :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-orangepi-r1 :=3D -@
> +DTC_FLAGS_sun8i-h2-plus-orangepi-zero :=3D -@
>  dtb-$(CONFIG_MACH_SUN8I) +=3D \
>         sun8i-a23-evb.dtb \
>         sun8i-a23-gt90h-v4.dtb \
> --
> 2.43.0
>
>
>
> Thanks,
> Nisarg...

