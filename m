Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A019C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK6xzN+3Plvn93axdH7vBx6308v5Zc20K2PTI8OU66Q=; b=d8jd5BqqJJxvizsKvcjjPwW/r8
	+OjwaBiF7/749TtgCIHvdEMxQyTGrsfA4ujrDe5RK3jhH5RNLjXDzZzARe/Q69Bk5sy7LNv0vVskx
	svEyzDfOzcNWivW50fmJ32FZDW9G0lcVhD811fU4++FQDYqZum6IXbvAujmwKBDyQiY4EnTWYhqd+
	sTBRqWtkrskgiUCF1EJGKevvJq6RkgdqepHeWIOtGNz61p5bGvLAiUibq7y7vsxbK3AtlyT3NDb+x
	phU799j4EumZmpHbTNYDCcbWxaJZIDr3SS36viNaK/rXJROX2klojlZCDY/g5jyWTubk4/zvqLNC2
	oqnjlf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0kcp-000000080AB-13tv;
	Sun, 30 Aug 2026 18:51:27 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0kcm-0000000809r-2men
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 18:51:25 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 937DBCC95B;
	Sun, 30 Aug 2026 21:51:19 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 937DBCC95B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788115881;
	bh=wK6xzN+3Plvn93axdH7vBx6308v5Zc20K2PTI8OU66Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=uK9SMcwrGDUkhJUD/TPj5nJ/VK8tvOknO5yJVGOIM/4K0bB+mAi1UXUfLmjSlvOPH
	 k/LSbojHp3fxUrWjQ3e3okwfk1W3Q0xb520jf/YKhHDeX6Md3wtMNqxJfU+sRuRLSk
	 h4y/IRogxYms1ufelPBVxo34FOznKGEi121Q+sPiOBM/OezNpJKHIHnWN+8OxvEMal
	 xICMJ4xg7zkC9xkyRnUqR5H/6MxNYNcrvML5ao6BoHgVOXfvMUrUrxybGhSNRN9LdC
	 GX6ubkWy6q4lHpgsEwClU9eUNQ4jvilfAwl3HOwWouLvIwIXWQU8gD1xNesRZY4NYq
	 fn+HayBHsMJhQ==
Message-ID: <1079e16a322e9801d44712700ea7bf622af634c8.camel@rendec.net>
Subject: Re: [PATCH v5 5/9] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sun, 30 Aug 2026 14:51:18 -0400
In-Reply-To: <20260821101039.4037925-6-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-6-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_115124_881219_A9AD6CE4 
X-CRM114-Status: GOOD (  19.97  )
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

On Fri, 2026-08-21 at 19:10 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> probe() sets up the chained handlers without first masking the input
> interrupts. For a built-in driver this happened to be harmless because
> CHANMASK resets to all-masked, but once the driver can be unloaded and
> reloaded a child interrupt left unmasked at unload time survives in
> hardware. On the next probe() the parent interrupts are re-mapped and
> unmasked before the new domain is ready, so a still-asserted line
> immediately storms the parent with no handler to service it.
>=20
> Mask all interrupts in probe() before wiring up the chained handlers.
> CHANMASK uses inverted polarity (a set bit enables the interrupt), so
> masking means writing zero. This mirrors the sibling NXP chained mux
> irq-imx-intmux.c, which masks all sources at probe() time.
>=20
> Masking is only done in probe(), not in remove(): the next probe()
> quiesces the hardware before it re-maps and unmasks the parent
> interrupts, which is the only window in which a stale line could storm.
> Masking in remove() would also mean touching CHANMASK while the device
> may already be runtime-suspended with the clock gated.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 071ab1ac1fe9..b63bf957ab88 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
> =C2=A0	if (irqsteer_has_chanctrl(data->devtype_data))
> =C2=A0		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =C2=A0
> +	/*
> +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> +	 * has inverted polarity (a set bit enables the interrupt), so writing
> +	 * zero masks the source.
> +	 */
> +	for (i =3D 0; i < data->reg_num; i++)
> +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> +
> =C2=A0	struct irq_domain_info info =3D {
> =C2=A0		.fwnode		=3D dev_fwnode(&pdev->dev),
> =C2=A0		.size		=3D data->reg_num * 32,

Reviewed-by: Radu Rendec <radu@rendec.net>

