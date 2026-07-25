Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D5DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij4llYX0IY1/Z2saSrJWqE8S/DUJX8rjYqL/9Jp3mvg=; b=z0xnfYc76LZ+vadctzhMfMJD97
	FHVG9ffy+L3vyF/V6c/U1EjwtBSLyLQsLhyyxSyV2FEzk2O58nueyFypYue4O3a+yqLAhtRBaiCAx
	3wnbkaRW5ajV8lrWlotlgAKHK5odVg1opT7ttydhObCSonjO9i9eOELg9OnXjiGeQ79VkvP5ewSqp
	w4FlBxYk6qzWYc39GtcLiiMONNDvmdIclg82QiKxGQDHFgy+f9YdN9PsyiB8up/NHwxFWnXW3k2e6
	3rGWKjQWW/P2VO3+ZpzVfio/ka4jO/iGy0kZ+d6VZ6PKA6W3ZwCCJNHeGeMV4OCXOuSaoEphApv1s
	kv2g1Mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneQr-00000000UT7-1czl;
	Sat, 25 Jul 2026 15:36:57 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneQo-00000000USe-0Kiv;
	Sat, 25 Jul 2026 15:36:55 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 115E5C289F;
	Sat, 25 Jul 2026 18:36:45 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 115E5C289F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784993807;
	bh=ij4llYX0IY1/Z2saSrJWqE8S/DUJX8rjYqL/9Jp3mvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LQS3GQzsZQSkrjDmR3TcA+zLlZ/AuyxldNA6e7SmFZT3kU8wgZB5SAiu9B2uzD14r
	 JS23kgRJtOxN/69zHEEeI9Tfnl8FteYTwKaeX1mZvpZTolyI34CoHFf12SKCHh3U3t
	 t8NJsSA75Q0wzEiteM4011NVXj1/Br4k4JZKZQivlbo2ukTqGyvvVR2BdHm02V9Rvn
	 Mi5suL/jCa8nXfXM2ZEAZFWoyVrVWaEfD+cABLkjdyDmlTq+0xpwh0JThmQHtpmEug
	 vUbYVo6py9ZujBkyjXq8zy6KUYI+S6/HkbP6WEzarQb//ZJ4UVcL4IhxuC9lAFPELm
	 OQ6liC8cOicjg==
Message-ID: <d5d3706f14b8d1c6dfc0854b2ab7d5499c48ceca.camel@rendec.net>
Subject: Re: [PATCH] irqchip/mst-intc: reject ranges beyond saved state
 capacity
From: Radu Rendec <radu@rendec.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Mark-PK Tsai
	 <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>, Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Sat, 25 Jul 2026 11:36:44 -0400
In-Reply-To: <20260722041443.10020-1-pengpeng@iscas.ac.cn>
References: <20260722041443.10020-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_083654_434437_3736CDD6 
X-CRM114-Status: GOOD (  11.31  )
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

On Wed, 2026-07-22 at 12:14 +0800, Pengpeng Hou wrote:
> The inclusive Device Tree IRQ range determines nr_irqs. Suspend and
> resume then use nr_irqs to walk the fixed saved_status array, which has
> MST_INTC_MAX_IRQS entries. A descending range underflows the unsigned
> subtraction, while a range wider than 64 entries exceeds that array.
>=20
> Reject both forms before deriving nr_irqs.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/irqchip/irq-mst-intc.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-int=
c.c
> index b5335f6fd6d6..1475335d668d 100644
> --- a/drivers/irqchip/irq-mst-intc.c
> +++ b/drivers/irqchip/irq-mst-intc.c
> @@ -263,6 +263,10 @@ static int __init mst_intc_of_init(struct device_nod=
e *dn,
> =C2=A0	=C2=A0=C2=A0=C2=A0 of_property_read_u32_index(dn, "mstar,irqs-map-=
range", 1, &irq_end))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (irq_end < irq_start ||
> +	=C2=A0=C2=A0=C2=A0 irq_end - irq_start >=3D MST_INTC_MAX_IRQS)
> +		return -EINVAL;
> +
> =C2=A0	cd =3D kzalloc_obj(*cd);
> =C2=A0	if (!cd)
> =C2=A0		return -ENOMEM;

Reviewed-by: Radu Rendec <radu@rendec.net>

