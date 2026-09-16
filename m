Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4F4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rz4lcGVbF1yUlfwUYSE8Dhf9yMKHKYOJ0oKPXz0YBxA=; b=p8QPp2KOX0MzHvhBeuK+auM7iI
	Ly8MABTQJuisw07cnSunaGwp0Hauov/hDrSSqG7p1L9PopJyJy9jYyESe4dgf0oLBSvXJVgccYOGs
	ADLrzz9cHK7nam04yJKlNm4/vJ4zyp5F3bEpggowZbL8JIN1JbrKW7EBA502Fmn9qVVv/C61GiOdP
	S3HJiSj+bnZHGhrWNbv+IcK0913QalUy++eX/JgNQ+6mHdz8JUhfAiqQY2woS/iG/l1a7OAWexkvQ
	t/S5yEWPKyYSHt2lNohc5De0sxt56EeIBaiaIL3GUZtHA3VrH8OM8nG4xhqEVpUxEg2juuXk5MQpB
	mAdWSJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pwk-00000009IED-40Qn;
	Wed, 16 Sep 2026 13:45:10 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pwi-00000009IDg-11An
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:45:09 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 6B1CCCCDB9;
	Wed, 16 Sep 2026 16:45:03 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 6B1CCCCDB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789566305;
	bh=Rz4lcGVbF1yUlfwUYSE8Dhf9yMKHKYOJ0oKPXz0YBxA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BLQLurJYU6bQtoY9c8Hxq0VK8XTcKwNPQ9tskS7tPRl1NghzP/keeLoV5Uwyxl858
	 33AJXv/Ocly7tN1PpVOMkRtOrHMCUvjjXo6UvjkHyr1RNo2pQ2b+xiI3fDCgrG8Ohm
	 mcxDrKFuUvrkTKvL3UHaszy2sIdrk7sLHuQJK7k9YsHJ6xJRLq5RDfEaZzixRcfvUa
	 dOk1jL584saJZk+5ajlwQwF2ddCBDIH/qucPWdOjLbqOakqDg9RvFXHyou6bOnLrsi
	 lMOQ3gs/WaQUG7a7zM5nm4LTIDQrehzIdS6eFCqL25kyy7DC7vGeOLknKpPFlugRLh
	 7S+UPUZnrdV6w==
Message-ID: <73bdecf75ba186db00e559f5ff508790ca6e2362.camel@rendec.net>
Subject: Re: [PATCH] irqchip/imx-intmux: fix runtime PM teardown on remove
From: Radu Rendec <radu@rendec.net>
To: Guangshuo Li <lgs201920130244@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>,  Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Joakim Zhang	
 <qiangqing.zhang@nxp.com>, Marc Zyngier <maz@kernel.org>, Zhipeng Wang	
 <zhipeng.wang_1@nxp.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 16 Sep 2026 09:45:01 -0400
In-Reply-To: <20260914134211.1734163-1-lgs201920130244@gmail.com>
References: <20260914134211.1734163-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_064508_455488_1BA9989D 
X-CRM114-Status: GOOD (  26.38  )
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

On Mon, 2026-09-14 at 21:42 +0800, Guangshuo Li wrote:
> imx_intmux_probe() enables the IPG clock and then drops its runtime PM
> reference with pm_runtime_put(). With CONFIG_PM enabled, the runtime
> suspend callback disables the IPG clock. With CONFIG_PM disabled, the
> clock remains enabled after probe.
>=20
> imx_intmux_remove() accesses the CHANIER registers without first making
> sure that the device is runtime active. The device may therefore be
> runtime suspended with the IPG clock disabled when these registers are
> accessed. In addition, the remove path only calls pm_runtime_disable()
> and does not balance the clock enable when CONFIG_PM is disabled.
>=20
> Resume the device and acquire a runtime PM reference before accessing
> the registers. If resume fails, skip the register accesses but still
> tear down the chained handlers and IRQ domains. Disable runtime PM
> afterwards, drop the acquired reference without triggering another
> runtime suspend, and explicitly disable the IPG clock.
>=20
> This keeps the clock enabled while the hardware registers are accessed
> and balances the clk_prepare_enable() performed during probe for both
> CONFIG_PM configurations.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: bb403111e017 ("irqchip/imx-intmux: Implement intmux runtime power =
management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-intmux.c | 15 ++++++++++++---
> =C2=A01 file changed, 12 insertions(+), 3 deletions(-)
>=20

+ Zhipeng

The patch looks good to me but I'm wondering if it's not a better idea
to fix it in a similar manner to the imx-irqsteer driver. Please see
https://lore.kernel.org/all/20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp=
.com/

The two drivers are already similar, so I think it makes sense to keep
them aligned. It would also address some of the issues that sashiko
flagged (probably, I haven't looked very closely).

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index 47c2681d138a..de2a8f98f625 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -288,12 +288,16 @@ static int imx_intmux_probe(struct platform_device =
*pdev)
> =C2=A0static void imx_intmux_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct intmux_data *data =3D platform_get_drvdata(pdev);
> -	int i;
> +	int i, ret;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);
> =C2=A0
> =C2=A0	for (i =3D 0; i < data->channum; i++) {
> =C2=A0		/* disable all interrupt sources of this channel */
> -		writel_relaxed(0, data->regs + CHANIER(i));
> -
> +		if (ret >=3D 0)
> +			writel_relaxed(0, data->regs + CHANIER(i));
> =C2=A0		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
> =C2=A0						 NULL, NULL);
> =C2=A0
> @@ -301,6 +305,11 @@ static void imx_intmux_remove(struct platform_device=
 *pdev)
> =C2=A0	}
> =C2=A0
> =C2=A0	pm_runtime_disable(&pdev->dev);
> +	if (ret >=3D 0) {
> +		pm_runtime_put_noidle(&pdev->dev);
> +		clk_disable_unprepare(data->ipg_clk);
> +		pm_runtime_set_suspended(&pdev->dev);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0#ifdef CONFIG_PM

--=20
Regards,
Radu

