Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B75FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1k9EcQ6FxBoy0l3c2OuSS9sgdShv8hsm/6tH6dR92Y=; b=RHQJbKvJcHf1J8Hvq4dIAYqO7V
	mt+alwadQCWFNDGsdY+YzZ4Z4a7Dwm629ngijJREVLpIr5Tx6Igi7k6tAfdqw8DiGSZRbVmCBej2I
	qHDqlXKWpReciltwoQiGo+Vk7TBUdCpGT1+ZczwsDbsGE58VND+PwV1ML9jPHliMVTbn2iIL59YJ2
	ur+sOInlMGCxpJIUP/BIIA1hnQWTa8WJwSrSzEFp1EKIMETe60lZiVF0QKt2E3leycpb3kwn5Zzw8
	+9+aYVBYpFp5mxL54pPU+hThmjkEDU+xBpomuCXPxUP5n5ZeTNk4HwlYlvZppE2h5KhGV6OsoZ5vS
	q3S4i4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD9h-0000000FuVO-0dHh;
	Tue, 05 May 2026 10:37:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD9c-0000000FuTx-3qYA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA9ED441B9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC333C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977447;
	bh=O1k9EcQ6FxBoy0l3c2OuSS9sgdShv8hsm/6tH6dR92Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ThXqo6e1rU/ERqtjJ0/iY65yI8g5OKLcudnQZ3mErUhAINOrMK1kRvatSEjw/aymI
	 tyz8uJRT1H94QGgZgJpAmZBEKhwt+k5rgNB1+fkpLK6nLklda575BySe/kvkxgxrPi
	 4W4L5829nXgbOk8BtTeUl/Z1/JKX8WvgnQyTT/G/C2RqdSFvkvX15ABfdQAGXz0o+b
	 D/ZCmpEQgi4ZUdCkmV11FwMv4ggLphaQeEJBgZf95MrOsV40mnU3Z3cVRoeVPy2qze
	 cR69WrZjNFzSklu/jNHQ4VFhLVhhXLbkcI7VGXwzxbLWJ0Wa6iULmA64C8/m9NpmJ3
	 T6+DsTjTPuThg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a860667fabso3986469e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+VoB+depx4fkmOaxP/SGhi6z/Dd8eqxeSIplSqIDUYC21oEMzFOnIGxFqfzX+PJODJw4HRk4VbPG+bSFXSNf7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0G8i5mcMBeYwhHzwhLHjjIoytdMuPgIrKEBvMvOcnM3kfrUYp
	iL3lWofYij0ab8DCtfValU5YfTLFlXpt8B3CpaaQwzzVbUF0tZR6xFAKNdgj8xlviZ2f7LBPWjC
	GC1nwfZ93NAex8+nmfEHSvKIi3xSIyY8=
X-Received: by 2002:a05:6512:3095:b0:5a8:8222:7fbb with SMTP id
 2adb3069b0e04-5a882228046mr652967e87.34.1777977446254; Tue, 05 May 2026
 03:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260430081242.3686993-1-arnd@kernel.org> <20260430081242.3686993-3-arnd@kernel.org>
In-Reply-To: <20260430081242.3686993-3-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:37:12 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tgW74cF_e+4Ak7cV_pUCYo3koqmZ6vNR9SQiUsb2zUA@mail.gmail.com>
X-Gm-Features: AVHnY4Kta7CTuYHDE7Wgt7oimq4LNXS-PqBiYhrkb4K1P_cfZhJR-Ui5oKw0IfI
Message-ID: <CAD++jL=tgW74cF_e+4Ak7cV_pUCYo3koqmZ6vNR9SQiUsb2zUA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3 net-next] p54spi: convert to devicetree
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-omap@vger.kernel.org, Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_033728_972167_96646487 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, Apr 30, 2026 at 10:13=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Prism54 SPI driver hardcodes GPIO numbers and expects users to
> pass them as module parameters, apparently a relic from its life as a
> staging driver. This works because there is only one user, the Nokia
> N8x0 tablet.
>
> Convert this to the gpio descriptor interface and DT based probing
> to improve this and simplify the code at the same time.
>
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

