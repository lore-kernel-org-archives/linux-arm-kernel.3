Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8461C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLPrBME3JJr4LVfH3gzcShU2Chrxq/q7aoyH5uoRdUw=; b=yBwePc8ezfPAHGONpeoPdQtA5t
	JoclPzK1KluYFpkjPOtwGm5K4uWR1WdxHbYEgT7aVaqZWnFyiKntDvMZTcuInV8eycDFmpgN2ilsN
	Bml4uWR17B728uQVW6S9sPvkw0oVnpOXoSl1Lk0vGwv4ITzymAyvYsV5TTAvTJ+c9dD0PgcGU5Q3T
	zeJJmci8NSlRSwxrS5DQRCzrKfPqNnh6fmd0cHEYpvT3U2ZnbFx4s48GPDMiLuWeGTH8cR7vgW64S
	ihPdVyPhDiEUi+RSxBmMaPELZT6YF3jj+56QPwedke2oY15i5bvGUEEIiXOEtJmULM7Xn/94dMB1T
	cASviRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3IT-00000008ZbB-0ltW;
	Sat, 04 Jul 2026 16:32:53 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg3IQ-00000008ZaZ-13s8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 16:32:51 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 6D520C24ED;
	Sat,  4 Jul 2026 19:32:46 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 6D520C24ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783182767;
	bh=tLPrBME3JJr4LVfH3gzcShU2Chrxq/q7aoyH5uoRdUw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R1A9bHV2ydnVTr2QQhjVCbI3JKDUkzKrAl++4m5fvIyHOZLzldkwFoAC4Drf7YvE2
	 i7lz6VZVzzbtWIVCykaTdEsToA9WzU/eTnpcNTYjeS4KZ+GkPRI0HIxtD1wQ7Pv3Gc
	 QYzYEpeOtmCBBbSCaTQz6+2abnm2r7XsOBc1j2V8onwNrxXo1k79Vv23/I1MRnmOyh
	 DG0upo5kIuyBKbYfmRaD55Nv64wkoV3zDPPdZJYphM4aaJ+TgnvgAKstrlttcYzpiL
	 AYIiuHEpwgou4JiIreyi2SG2Tzk2IzmmjiSFgYZtU0LFfq69NRtydgsgl2uMdAtlWM
	 QF1q9lvnBKDGg==
Message-ID: <1d141ab4b472533ba728c65201ea7cb74047acba.camel@rendec.net>
Subject: Re: [PATCH v4 6/6] irqchip/gic-v3-its: Remove redundant check in
 its_vpe_db_proxy_unmap_locked()
From: Radu Rendec <radu@rendec.net>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org, tglx@kernel.org,
 	jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 04 Jul 2026 12:32:44 -0400
In-Reply-To: <20260702033050.1583-7-shikemeng@huaweicloud.com>
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
	 <20260702033050.1583-7-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_093250_467572_526D1EC9 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, 2026-07-02 at 11:30 +0800, Kemeng Shi wrote:
> The high level functions already ensure that gic_rdists->has_rvpeid
> is false before calling its_vpe_db_proxy_unmap_locked(), so we can
> remove the redundant check in its_vpe_db_proxy_unmap_locked()

That's true for what the code is *today*. By removing the check, you're
setting up a trap in case a new call to its_vpe_db_proxy_unmap_locked()
is added in the future with the assumption that it will do "the right
thing". The way I see these functions, they are not really "high level"
and "low level". For example, its_vpe_db_proxy_map_locked() is called
both by its_vpe_db_proxy_move() (which is another db_proxy function)
and by its_vpe_send_cmd() directly.

FWIW, the code you're removing is just this:
   0xffff8000806cf934 <+44>:	adrp	x0, 0xffff80008177e000 <static_ltree+784>
   0xffff8000806cf938 <+48>:	add	x4, x0, #0x348
   0xffff8000806cf93c <+52>:	ldr	x0, [x0, #840]
   0xffff8000806cf940 <+56>:	ldrb	w0, [x0, #45]
   0xffff8000806cf944 <+60>:	tbnz	w0, #0, 0xffff8000806cf9dc <its_vpe_db_pr=
oxy_unmap_locked+212>

I would argue that the gain in terms of both code size and speed is
negligible (and these functions are subject to inlining anyway).

> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3-its.c | 4 ----
> =C2=A01 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index 120f6f29e978..b0069fbe1e69 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3801,10 +3801,6 @@ static const struct irq_domain_ops its_domain_ops =
=3D {
> =C2=A0 */
> =C2=A0static void its_vpe_db_proxy_unmap_locked(struct its_vpe *vpe)
> =C2=A0{
> -	/* GICv4.1 doesn't use a proxy, so nothing to do here */
> -	if (gic_rdists->has_rvpeid)
> -		return;
> -
> =C2=A0	/* Already unmapped? */
> =C2=A0	if (vpe->vpe_proxy_event =3D=3D -1)
> =C2=A0		return;

