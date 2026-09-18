Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA8BC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X57XoeYxAuPO1Rrv4CMmFF0duv/vOAGxDNYQKdW8eSM=; b=LKuGMcRJAx505/NAZNuL+cfbfQ
	gEJhZTfIsb3PpLS1OAVh5ZZ0E5diuVoc2V3I3/59OMarEbJx9Qoun7YTyNY0muJG3gbheCM3KZPDZ
	P0VrAIIqDYjyBgITqJs0Z8gKIAI26Aub3kg4afb+032gOzIk++IEBNn4R9nSDigOhbt/kWxCgr4s+
	JoneuxKAC6TJmSy4+1vpt0UjY7A6jjFST0Ld3rWXwO4y3nwaRN4Yq6ej2HTBy2X7sAmsuKQddmw/q
	gLlGc2x9MtLktuN86lr4//UDqc0b2RBA/OsuPJt+A6leGBihzIIVh8El0I7gXoECIpjbjeTnTQL9U
	jCMMI27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7N0t-0000000D6As-2Cyq;
	Fri, 18 Sep 2026 01:03:39 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7N0q-0000000D69L-2jUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 01:03:38 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D0074CFAD5;
	Fri, 18 Sep 2026 04:03:27 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D0074CFAD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789693409;
	bh=X57XoeYxAuPO1Rrv4CMmFF0duv/vOAGxDNYQKdW8eSM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=x84tZeJvg2/bP+YV0TWLLo2a+HMmQS0shAdbmLy7WjiyfmXp/JEbmzciziIYf0Uzx
	 qKiWFBpjBme2qQ2fKKuuPe/0LW7Uz6NCApknqbrqASBFCyjsO7BXZXVPYaF0AuV6Wk
	 tfOC8jN4EZcwVU7MLFuwXKhLykB0ybPmkzSL8iwviZbNofLXGEMIbDjoDKbXDFSR9K
	 0BVQcrAnIweawx+JtNy+t5XvXak/ZEK8A/jQMvWX5QFDZiyCh6eypGY74bgX3PYlEI
	 gCohEVwtpcTUlYtfIhAqGYzZ4QKAqj7Mg7wMPLOQa5qk7EAL+UjBkr6MRdBwD2y38g
	 +YdPz+laH/Mmw==
Message-ID: <9501485b133250d9041d90dbd2c6d6deb2aaf3e9.camel@rendec.net>
Subject: Re: [PATCH] irqchip/imx-intmux: fix runtime PM teardown on remove
From: Radu Rendec <radu@rendec.net>
To: Guangshuo Li <lgs201920130244@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>,  Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Joakim Zhang	
 <qiangqing.zhang@nxp.com>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Thu, 17 Sep 2026 21:03:25 -0400
In-Reply-To: <20260914134211.1734163-1-lgs201920130244@gmail.com>
References: <20260914134211.1734163-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_180337_002433_132909D7 
X-CRM114-Status: GOOD (  22.19  )
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

Reviewed-by: Radu Rendec <radu@rendec.net>

