Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B01C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yw9p/e/gTObI0E0KW0aPmvh3/jojeNij8byOhPchOM=; b=k5M5wXbnINdVMBfIo8v26AA0AX
	aUNNwGhYby1h97dlTxxV8jko5kfKXb0dM1H/xT2MjW4fnNRF/zPMUGIKqduzT1z5ZXqL8w2PkUVR0
	rW6FOFN90EgJE5Nfy4nVrqoUexpBo+w/NmGnkw3FGNvS9m50SHANWjtZvEImuPJ3JECCs6vVO8Pgd
	ARyuh94ykN0v34ubWhe0rqcX65MsZeMUuUMGGBcs1EIjlIRzQ2NC2mN0a5uQidIH6Ljw+lyWri4Rg
	moxK2cjPhwXLukofpfU01WaTCbEqKKba03fGWzoNOe1OIbkizqQQhAZ+ct1UKzr+hvVOVfDqwalsA
	LKXwaPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX9M-0000000GzrO-0k6E;
	Mon, 24 Aug 2026 16:03:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyX9I-0000000Gzpb-2O4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:03:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 047214E4138D;
	Mon, 24 Aug 2026 16:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB11A5FFC1;
	Mon, 24 Aug 2026 16:03:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78E4511C7984B;
	Mon, 24 Aug 2026 18:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787587418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Yw9p/e/gTObI0E0KW0aPmvh3/jojeNij8byOhPchOM=;
	b=aMfQljN/arHfb158wkr6CLAxSet5iYUnnt2uZH3SAyBHHe34JaDMHVlouYUDP/wu9UFPHk
	hhToPHJMaibC6ufFX3eAdBc4N0QOCeo3982Ddg5EQrWbF8Nx4HyjmUWDJUKiY1f9LSiZj+
	Z4qfvh5Sk96mK6eM1+uMQa95BFrAKYezzqHsO7LBQqj5M79l+3mFih7KxEYPtwLavaHp3o
	a3aFmclYXZxSB51anNKIJr9sIm2ahqqrgQkVk/ps+tRSZRlM7kFhE7Yueqf5+hyAy8XQsf
	w4Ct0qOqMzO8kHzgAy56q4Qg0mRmKjqhR8680oSotZYxSN/ShI1rvqATHHzXLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 18:03:32 +0200
Message-Id: <DKXAUOKYDIWV.B30CB2QWDDXQ@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is
 fully initialized
Cc: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1787240118.git.geert+renesas@glider.be>
 <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
In-Reply-To: <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_090348_762284_F4EBB3F7 
X-CRM114-Status: GOOD (  16.04  )
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

Hello Geert,

On Fri Aug 21, 2026 at 12:07 PM CEST, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ether=
net/cadence/macb_main.c
> index 1476bce77f34d2a5..319e43098f57ed7b 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5376,7 +5376,7 @@ static int fu540_c000_clk_init(struct platform_devi=
ce *pdev, struct clk **pclk,
>  			       struct clk **hclk, struct clk **tx_clk,
>  			       struct clk **rx_clk, struct clk **tsu_clk)
>  {
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	int err =3D 0;
> =20
>  	err =3D macb_clk_init_dflt(pdev, pclk, hclk, tx_clk, rx_clk, tsu_clk);

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I cannot give you a Tested-by because this triggers only on
sifive,fu540-c000-gem compatible matching upstream devicetrees
sifive/hifive-{unleashed,unmatched}-a00.dts

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


