Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E358C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHbQgw0rVP+95Tv0kAeoRDdjuGbtzcnAd7wDYd7T4VY=; b=0VhoayxubFtvu1dQdJZUJ4teJV
	2bYDu8LtcZ11EPdeMwMQZgejLAy3HSRSQcN8vk4gUKOSJ36AfAk9UEjMxvOZR+JMwXutV5c1A4Rr6
	88Dzt8bmikZAMOXAUiJFGRJM12Q6+CwlhIpnigVWWxhP0taCTCAwPcuF0KHmlbnKhGlOp0qBlkC9g
	FRcPszNOSV8sA/fQhUDm+bl3gB9V25LDnMkMOYyi0o8mmbzpmjmybm9pm3F/jHH/DNhDroGipcg7c
	Gew2mFcx60hvLFP7OITKt3VO8vUOoho10XsVE4DaPfTl7GWOSsBDShNl46vdi0ynwalfm7bZ+ayTd
	frQiErig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0iQj-00000007vIW-3dlD;
	Sun, 30 Aug 2026 16:30:49 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0iQh-00000007vI6-1KXe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 16:30:48 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 572C4CC505;
	Sun, 30 Aug 2026 19:30:28 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 572C4CC505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788107430;
	bh=DHbQgw0rVP+95Tv0kAeoRDdjuGbtzcnAd7wDYd7T4VY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VbnYzlYA/is4ElrnBAiVpynIrmgkXqFz8NREmw6TFB236tIPAP0Rj6EZPNRW9A6bo
	 qYRSCl+FKSPWv1qdPuuKd7jcsmkSjieEnzBAOa+OrSaXKcdsRfw+oIbb749n6La0qr
	 PmtmiCvjf9YJWIgYO9ghTa/xzswW0LaDlQJh6mt/5AGSSljNsvUDiP5TPaAvmdt+AB
	 QyyJnf1rkX4m+IsG3bumpZ7jc+02U0WzU/N3tIInaP4QgNI6VLXC6TAaZBcO66h7po
	 XiZ41hUAHi9ZCgTq4zlrc/aEtAUunfBKqmnth2RtN0llWsP+0/tarLiLK6RTCydtaP
	 q0j3u2ru77ubQ==
Message-ID: <0b44f9fe48a6e81a5dbbb61ead46b77b117433b4.camel@rendec.net>
Subject: Re: [PATCH v5 4/9] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sun, 30 Aug 2026 12:30:26 -0400
In-Reply-To: <20260821101039.4037925-5-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_093047_528788_7A74FE96 
X-CRM114-Status: GOOD (  12.50  )
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
> probe() maps the parent output interrupts with irq_of_parse_and_map(),
> but remove() only unchains the handlers and never disposes of those
> mappings, leaking them on unbind. The child mappings handed out by the
> domain are freed by their consumers and, together with the domain, are
> now torn down by devres, so remove() only has to dispose of the parent
> mappings it created itself.
>=20
> Dispose of the parent mappings alongside the chained-handler teardown.
>=20
> Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 571324de8bd1..071ab1ac1fe9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -287,6 +287,7 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0
> =C2=A0		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
> =C2=A0						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
> =C2=A0	}
> =C2=A0
> =C2=A0	clk_disable_unprepare(irqsteer_data->ipg_clk);

Reviewed-by: Radu Rendec <radu@rendec.net>

