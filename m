Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FBDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUQJK8Ya9BR/9ttPEZaGzgZ9Fa9Nq8mqGT0mdKxFiLA=; b=oZo6E7wtc7gj+x8gmDQNLo4s6u
	cG5Kpa6Jko2FlpWw7n/7YP/X5AyjuwaTGiJbo1Wo4hjGovyvr9sJOJAxzzDH98Xm/SM1DjpTp37Wi
	DQ1vi4gx74PD+upyy67FnZ5vfWi+PhzZ+UL1s8wH8TgbN17rUOD+9XGg4wmNVmtzQvu2u0ffHiWcA
	zrAOmUMHkyusriYEuDKI2claAIHM/jMO/mxh0y4TCRCZGig2I3owDRNIzYjI7SkOJziDzkHTM5W0G
	+KUbH4N+t07TLHw7TocZzCSJkvBIsEnDhCT8V4zO/xqi8Bz2IeTQGp1YAOSm9iERQGaIG3wsvzIzt
	MZP4pXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1z7-00000008Wip-1LuE;
	Sat, 04 Jul 2026 15:08:49 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg1z5-00000008WiS-05tH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 15:08:48 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 8BBC6C24ED;
	Sat,  4 Jul 2026 18:08:43 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 8BBC6C24ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783177724;
	bh=yUQJK8Ya9BR/9ttPEZaGzgZ9Fa9Nq8mqGT0mdKxFiLA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EMh7typJLGNWJcArEcDwLqP4del8SWCSqw0yYSiaizWQjF/zVTExvNtTM7LAueUfe
	 qqyV/DMRG99wkdkLZa0r3+UXYb8AeEgyWY+RCXf/+WgTFfvg7i4wY0yBjecH0ir29s
	 WvJ1JSjfacRYrMNJkSmyc4cf7KhTD5h9XIXcppjhX2Lr0sNK8U0oQlVLxaLHSEnkOI
	 qskvu1Ii4hW5ABCH0tsBurCenCMpI8a4ddEAdozf38lmKD77Pd9jO27795nnp3015t
	 YhN1qFYasN7zcElfKVaINCc0qlHg12Mo85VWQMLm+QydBqoZZ0dmWxNH/YJxdB1djH
	 1w5f8v2e2Nmdg==
Message-ID: <79883533905997905b7bd84f3df0174af65f6c6d.camel@rendec.net>
Subject: Re: [PATCH v4 2/6] irqchip/gic-v3-its: Fix its node leak in
 gic_acpi_parse_madt_its()
From: Radu Rendec <radu@rendec.net>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org, tglx@kernel.org,
 	jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 04 Jul 2026 11:08:41 -0400
In-Reply-To: <20260702033050.1583-3-shikemeng@huaweicloud.com>
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
	 <20260702033050.1583-3-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_080847_238258_27CBB719 
X-CRM114-Status: GOOD (  12.69  )
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
> Fix its node leak when its_probe_one() failed in
> gic_acpi_parse_madt_its().
>=20
> Fixes: 9585a495ac936 ("irqchip/gic-v3-its: Split allocation from initiali=
sation of its_node")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3-its.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index d721b6101e0a..3e4edcb64065 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5747,9 +5747,13 @@ static int __init gic_acpi_parse_madt_its(union ac=
pi_subtable_headers *header,
> =C2=A0		its->flags |=3D ITS_FLAGS_FORCE_NON_SHAREABLE;
> =C2=A0
> =C2=A0	err =3D its_probe_one(its);
> -	if (!err)
> -		return 0;
> +	if (err)
> +		goto probe_err;
> +
> +	return 0;
> =C2=A0
> +probe_err:
> +	its_node_destroy(its);
> =C2=A0node_err:
> =C2=A0	iort_deregister_domain_token(its_entry->translation_id);
> =C2=A0dom_err:

Reviewed-by: Radu Rendec <radu@rendec.net>

