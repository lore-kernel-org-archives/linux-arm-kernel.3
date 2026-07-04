Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8593CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMZjFgCnK4BG1UhsWumnII7xCxYwlRHtY7CwcOaC6gE=; b=Ea3ZEOZLnfLQcE2TTH3zNljKPs
	5WiXxHT6VooN4SLxmJkI5YDGjf9OtLMzp13iJVPquQjDM94AZdrfh1md93M9WGWe9zLiWJqomZbTl
	5balu+S5mLi1u/XLeQj3K+hfqhnoPo8JbLJdiGr+TRwvxxoh2jDnfBA/qdVycieX0uVIFCDIbsXwE
	VVHKDqy8bjlkYPQAanvpJtqApYMukielgMI7b8hmFg1xYcdTsdPoSmyswpLJG85Jj5sbPFTztiJR+
	heSnLKBoSCGo4LYgIUZECTpd1ke76ySERhN0bTl6ZEDNhzpg70ibFOf3ZpOP1Xk2956sg3bernHmZ
	w2EQPWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1iI-00000008W0B-3p5S;
	Sat, 04 Jul 2026 14:51:26 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1iF-00000008Vzg-1NJT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 14:51:25 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id AC6D4C24ED;
	Sat,  4 Jul 2026 17:51:11 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro AC6D4C24ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783176672;
	bh=HMZjFgCnK4BG1UhsWumnII7xCxYwlRHtY7CwcOaC6gE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pzEli5Bhrxl8Qe8nK6PlPlfEOwCA5ylVy0AqrC0P9t4wXF+rwSBKiQ36djn7E6QJq
	 lSHWh1rPFXrhz/YyS+7eXqANMyLTppT8l9qCSwfx6fdOEb3K+CLaFDSJ8RwNnLLkif
	 Wt1S8Vq+qEcu742uTKPxmB8ePl6Ajb7ikr59B+qFmc6XrVibsdaO2wsNDU9WQWx+ZZ
	 aeKsic2PjSVGl9Fm1gSqJbp5R4qU/h+Spckd6CdRMZ33iAUtFsKjr5qKfvD50bjqJ6
	 61Oz3jFe5U2WcJeAwBbScihBc0twRYxs6oxgyEY2E+GS4uHpx6Ydx00umN9qYCokcF
	 iUvaBImTcp/Jw==
Message-ID: <24de1fda7ed76615b2c24fe0352b5b1cb35038d6.camel@rendec.net>
Subject: Re: [PATCH v4 1/6] irqchip/gic-v3-its: Fix memleak in
 its_probe_one()
From: Radu Rendec <radu@rendec.net>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org, tglx@kernel.org,
 	jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 04 Jul 2026 10:51:09 -0400
In-Reply-To: <20260702033050.1583-2-shikemeng@huaweicloud.com>
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
	 <20260702033050.1583-2-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_075123_674771_8AAD192F 
X-CRM114-Status: GOOD (  11.50  )
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
> Fix collection leak when its_init_domain() failed in its_probe_one().
>=20
> Fixes: 4c21f3c26ecc2 ("irqchip: GICv3: ITS: DT probing and initialization=
")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3-its.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index 291d7668cc8d..d721b6101e0a 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5326,7 +5326,7 @@ static int __init its_probe_one(struct its_node *it=
s)
> =C2=A0
> =C2=A0	err =3D its_init_domain(its);
> =C2=A0	if (err)
> -		goto out_free_tables;
> +		goto out_free_col;
> =C2=A0
> =C2=A0	raw_spin_lock(&its_lock);
> =C2=A0	list_add(&its->entry, &its_nodes);
> @@ -5334,6 +5334,8 @@ static int __init its_probe_one(struct its_node *it=
s)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +out_free_col:
> +	kfree(its->collections);
> =C2=A0out_free_tables:
> =C2=A0	its_free_tables(its);
> =C2=A0out_free_cmd:

Reviewed-by: Radu Rendec <radu@rendec.net>

