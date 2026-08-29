Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E312C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxrhR97T7Qu7CxRJdAD0MZKCPUClAmAqj06Q+J5Xu1Y=; b=vWbOuneczVZuu4noiP8PX/kIcB
	nsVZ7iFmnZUd46iDa3d4sEZEJa3es8Q+Td3QQIj3ocQABHM9+gilP1AOaTKWBnUqCESbxndy2WQKN
	jh3RG09wcK9xrm7xssui9RZfh7dL0w8QBoqmGMvpWMkMN4n5V8Hc9hCI+l3vCkupxBMvDjdHwhZ6L
	vDcHdLTCmIjQ3hMng2fpmEQrC8Kkzhg7N9Ndn+4vF72iwiHu4kT03r3xmm/+Cdynok4zjfXYceK+1
	FiLJVo6qXwfu1/vwg4DuVuuWxcA2NoCaUoQXVFzfrYNEyBAlXhYi0shaBChjHG/KZlR/XcqZo7oHZ
	xffLWC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Q4c-00000007Jk8-34hA;
	Sat, 29 Aug 2026 20:54:46 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Q4a-00000007Jji-3sNP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 20:54:46 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id DBC7DC33D3;
	Sat, 29 Aug 2026 23:54:40 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro DBC7DC33D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788036882;
	bh=TxrhR97T7Qu7CxRJdAD0MZKCPUClAmAqj06Q+J5Xu1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kdldWcE8dlEfgLe/HjoUUtiCY30jL3gdhWlgdtcaDJKCjr9EP6UiQxJleWQZA/5hI
	 SCt3UmCYCrs79bvnXq4KRW69LXvlK16vaFVn1i09B0t20+fBRK07T8gnDRM+KeGxKA
	 DzFLm2NghgwQwz0PIdGTzwhBmulurcKCX2FjhBCY2GMO4x2S7HtOUBhvCrNcpnkcCz
	 Y5kDYKmBa8S/DGonlf9wCKyvG4Zi6KV26UAUtpDPYLWRtxkZoil64k5BbfAnV97GBg
	 pZTSyQAaJ2Kcf+fBp2baPEzPyzOxgkKL6kcMpjdyOdQwhdjD+xHCKq4nSDJtmZ5WCw
	 ngpxwirHS8wyg==
Message-ID: <b62d3077f3a3c8a12ac47b8a1e163499e2333b5b.camel@rendec.net>
Subject: Re: [PATCH v5 1/9] irqchip/imx-irqsteer: Call chained_irq_exit() on
 the handler error path
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Sat, 29 Aug 2026 16:54:39 -0400
In-Reply-To: <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
	 <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_135445_162631_C015A6EA 
X-CRM114-Status: GOOD (  14.60  )
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
> A chained handler must pair every chained_irq_enter() with a
> chained_irq_exit() before returning, so that the parent interrupt's flow
> control is completed (EOI for fasteoi parents, unmask for level-triggered
> parents). Skipping it leaves the parent interrupt unacknowledged, blockin=
g
> further interrupts multiplexed through that line.
>=20
> When imx_irqsteer_get_hwirq_base() fails, the handler returned early
> without calling chained_irq_exit(). Route the error path through the
> existing chained_irq_exit() so the parent interrupt is always completed
> before returning.
>=20
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts s=
upport")
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be3..1b8d0c8eedb9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc =
*desc)
> =C2=A0	if (hwirq < 0) {
> =C2=A0		pr_warn("%s: unable to get hwirq base for irq %d\n",
> =C2=A0			__func__, irq);
> -		return;
> +		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 2; i++, hwirq +=3D 32) {
> @@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc =
*desc)
> =C2=A0			generic_handle_domain_irq(data->domain, pos + hwirq);
> =C2=A0	}
> =C2=A0
> +out:
> =C2=A0	chained_irq_exit(irq_desc_get_chip(desc), desc);
> =C2=A0}
> =C2=A0
>=20
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184

Reviewed-by: Radu Rendec <radu@rendec.net>

