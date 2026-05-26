Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB74CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=; b=p+cLW5Hj6S5OzVxQVluQhiJnO/
	zzzuhXAtUUFoCA/Wzii8A/JnfO/rTYIXX6WrF/dSCxNADI+Pm2i9fqjbQ5MoOU5wxpXRsORJedc+q
	l4hTbQKd8uTS5lmpwIwp4y4YNb6dqkyinmPvSba5Xfe2JiEI2PMqsmCr9MUPDGcbiZ004dgZjyX+m
	3dK/Kn3BO0wIW3IG3QYXPdLdxKcVuQ6HFlogiFjaWHwdpmiTJ27J/U4hiqXjzTAvOhQ1bwmBZjwiw
	cmBrTbpXnOokIrZnLijpdR5uRfckDkpKmR5j3NkvwGdnedkHKcX+q+x87Fae0tY+SS9nBix2oJJRl
	ILd/LM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfat-00000000hFs-2reM;
	Tue, 26 May 2026 00:24:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfar-00000000hFE-12KZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:24:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so9859088e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 17:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779755063; cv=none;
        d=google.com; s=arc-20240605;
        b=Oey7apAunko7EaCmRB6BQvVv5WsZxKmukE/0mfNPgWmHW20JzMSzLo+pfEELF+Wy9Z
         RZcuoaw1WyKzTLvUlIrw2XwdeolLMH8Qhe/Rhtkc+3voicCZ/CrhFOz6SPZrVNLCt4d9
         5KquVpJ30wraDKR7E9gWD/bsOKtOClJqNlWepItyWwSWLGbgK3v10Obv4HeAqfdhbR2e
         diMWVuFJm+JAYUVPjnsJQfLG9W/TbJTu6iTwTjp9F1EMr5Bo0kCuAhqP6R536mueNma8
         V2c2UJskwN0hoETbJyEs4jlDE3mEee8mH85ewR5RMqwIOZMVhxcTHKMJ09IGqc1SNXgg
         2hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        fh=4MSTu370vmz4WeHJ9jLEfb9WZLEZ9fuPeW++adMtpK8=;
        b=dhiHyCUR2IfdmyMAFfpn8ENmHj/BLlWkCQOPfudA1DPB0yeQqZBEGCbqJwfV0CBUlH
         3okXzhfR4uiu+11sdoqYAw3L1MoWvQtllVD+RP/fQnllGtewBquyWycjzrZCtY/aCtGk
         U1WPQhSRZnqC/0JS1IivXx/SsWdsX1JcFhm3xzMvuvRlpOOu2MjX30CeBb+eEB/prdJu
         TCqHNcwF9SuacXP2NgERHcI86fHnLwqGKVRgsRIAB7zO1Uqx2OD4TSRE/TWqm8O8q2ve
         Jl/f/ohUeDuuLlmRt4+/m08Y0C0ab85vmAbU9GAgQWCJGHXb7NsD8FvMO0Mk+kU6egal
         ngMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779755063; x=1780359863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        b=lqsfBSaZzt44+4HRZM6byHc1fK4P4BH5/XEOR4k+g7Ds4MS/+43Ay6qDtB/de7DX+v
         C1CriPd9X/7HOED06AdlCo2SjXoN9Zjto1E9FejEv456lLxlovyfSx2aofwpYnGlc1o3
         hiAZrZVgqq1JYOPvzqCitHbJl4nwX/xSqzbf2GjF0+gymZMjSOCdeH6g8OXkUCJWsR+B
         lOTHlJTEVzgJUZponBNfMKy403UO9YHOJfK3P1BR1AbjnFLw0TneIqx35MCD2wOF1C3C
         /lzjIaxLuMkdAyltFaxyS9zSP8Z1bofMrroiSIJHxrC0yeTtm/9Pu8buBoMK9WwuBYJh
         rQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779755063; x=1780359863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQSMw3Vvv8eJ1+UHIh3MK/+HpaNM97XO5hlqHFibpi8=;
        b=L5TS26gCRir+l9xYTa84YJxtFsgdQMkv+vTDETat2klsmM28Azf08QoX5682l/lYOx
         UMEG53vZHFYGwMxsMKfEM1Yq8gklleI4mxah385wth4VYVqPMYlJ+7ti+uWaPMItH4hf
         tG3DOAnZKuc5R+tC6Mr/uws0zu5+4cA7CXemU9I8SOFGZZk9iIQ+Sz4UXuF4GpABQHbC
         6nJoLazX0qQR1EkmiQPxM8TjAXLphczAF8h2gnFYwW6GfY9Vaemo3yMp+nzolX3x3Q2z
         0crUc/7VyCArXLbzguKppV4OUN/jWBzKJ2lEWR2Ji5Po4t17qH6xt+ZSiUtn+kLXmn1I
         Jf7w==
X-Gm-Message-State: AOJu0YwoxjL8LjQ2VZIoUMrgT1Ob+WXT+k7riECreE62pD8c8rY4COQe
	sVEMe7fCKwlIVT2ssr/ZVcCpP9+3QvnoBEXUqM1a060ow9yOFYZSUccsXFlz/j9ovLhw3gSveUL
	0itcPvQN8CoGoJrXxVeaG8xgBBu7v09c=
X-Gm-Gg: Acq92OEm86/+lAPU7n8yo/+cF7l4iPn0ySlsqApKMjSWT6HAlWZ95SXl3hde1souBQo
	ZGZbyi66uLkVJE73UKvbIe+CjVRQzlVFLU8GNjOgJDBoCg36un7Gjnr3kmi7qq7d0PakS0FQu6M
	vX7b1DzhjLeX3RaiWGdHs1dY/kWek2xPBZUH3e7mz7g8SYKfmOHuDzWK4LjMEne4MIC6eyvNXs4
	hK6KZHt62Do8wMJNh/3o9K32YF50rAEtSow7Bg8EEzZMAcxs9yk5pyD21HpkyxJO+jrFsGX4tS9
	NS2GwlQ9d5uK5v1FSiIrwGKGjZyHl0i3b0vhJtT2fF8DLUyFQ9u56zjWwb3iX0QR4iM+E5jl
X-Received: by 2002:a05:6512:1599:b0:5a7:4699:9fd8 with SMTP id
 2adb3069b0e04-5aa2ba85b09mr7355408e87.16.1779755062403; Mon, 25 May 2026
 17:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
In-Reply-To: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 May 2026 21:24:10 -0300
X-Gm-Features: AVHnY4JS4uosGBNNT0O2e2-uAlaBFEkB6tUSmGGzp3aw6DXRUG7IRPZ2XdoJxuA
Message-ID: <CAOMZO5AX8z-S6x7agjAs9qvyVL=Je9GBwtLc8Jhg=s=baerfgA@mail.gmail.com>
Subject: Re: sunxi: Watchdog reboot fails on Allwinner R40 after Linux boot
To: Guenter Roeck <linux@roeck-us.net>, wens@kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-watchdog@vger.kernel.org, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_172425_306687_0343F6C0 
X-CRM114-Status: GOOD (  14.52  )
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

On Sun, May 24, 2026 at 9:41=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> I am seeing a reboot failure on an Allwinner R40-based board
> (Boardcon EMA40i) running mainline Linux v6.18 or also 7.1.0-rc4-next-202=
60522.
> This board hasn't been upstreamed yet, but I plan to do so soon.
>
> The board reboots correctly from U-Boot 2026.04 using the sunxi watchdog,
> but Linux fails to reboot even when programming the watchdog
> registers with the exact same values used by U-Boot.

This is solved now. The problem was that the X32KIN R40 pin was not
getting a 32kHz
from the external PCF8563 CLKOUT pin.

