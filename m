Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA56CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2MzvP3M/Lvdf+YQEoRrr/63qV3jwcTxyyvjTUVpfjs=; b=HhBu84KulaHA508+t57JifCkLG
	pLdNl9Zu0PjHQc0fWuz8ivXKem4ftE4kNcv8gdPHUVtaAuK1RRquJ7c8iNaqL2zgKfG/JgwbRl4d7
	3WWzJMxJSRdYsgKPX7ny1iot5kD6V83mS1D30GEZ61Xn/wcF81RaC6SKvUkZye1/M9jSDQ3qR/06B
	J7/6OV0S61WiOf6H0Dmrmefub/9DQj4nJJlBqluRwrQkdpflvBnAMq3j02joVAIPz8plgnBeSNKXl
	1FCu1eR2rYNXuqlGxLhp97Q+EVYx+CMxgn3j5FYm1q7ONExKSCy7UwTXb3IKtPUWUKrLTj9H179Lp
	6H7dCVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX8N-0000000G8OE-2FwQ;
	Tue, 16 Jun 2026 16:59:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX8L-0000000G8Nm-1wMg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:59:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b3637b90so37430795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781629168; x=1782233968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2MzvP3M/Lvdf+YQEoRrr/63qV3jwcTxyyvjTUVpfjs=;
        b=rSUj9DFFahOsjLGoQJ9u2F4G8Mt326lUQXJ2lZG1kn+Xt1hTVLUzmm6a4qnA24rqZf
         +Atjc6y+lQeYWtpnzKs1FE6bYzTuQHGANd84Q6hLByJq891C+/qS5XpRe14BUYo+ACvP
         2Z0nbKQ+AR2+LV/oFInIFkvDG/DcOX5DJa+8OVtHTBKmxLdQfeLvL2fr05YCVLAo/w8P
         yWuIIz8x8hMJ5fiGtKeofs/4XRUCwST6Nfvc0Ae63423RZSMFMM5WBdBdF20aLayk68O
         kj3rMjT2EAeS7MNP8uTJvZt9veH2gEc4obd9fQA/6nfzm3ebGUo3oH8v1rldGnF3JwTw
         nrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629168; x=1782233968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2MzvP3M/Lvdf+YQEoRrr/63qV3jwcTxyyvjTUVpfjs=;
        b=kew6mx1KFZuiW637DhA6IoIeJosAPybicd35T1OBRhILf4/lVkn8TuLeQliyy8QnZb
         nAmcYMpaET2unwzIOf4H+WTdzncSIIQyZ6bnKNGVMN7FCoJcEukj+i3nOJ94PwJ/rWES
         Ob9m+GUZQC4lS3637VBihXrPphsS+eoOJpiApQp0uHhoJnVZOp3n8vg7INGEQFAxesBO
         7yyQIQqowGIPdr6aZm09d5J/jZ87KAwsetCtQN5WEmt9/xJteZBILp3sveDRYxV8onDu
         B48DdtH443QDbsXzRl4ROtYrebV2M68F/v/vamMg+t+RDs4BRN+K4W/0ymjS0pY2mosy
         7lUA==
X-Forwarded-Encrypted: i=1; AFNElJ+wSO3EcjdoWfGz6FD7LN1PQPbJas8B4W6kPrak9wKJV3ZFV79RVzMtdKEl1AAFXMJv841cdIRMZcszOfKc38aD@lists.infradead.org
X-Gm-Message-State: AOJu0YwCy4GxBD/ZUHP7qCB2fZIrEStlOeMYgZuQ/U4iLlMj8SrZ4YzC
	bNJXxhgDxsLhyaMOZW2lYDrpOlmYgXVktfLgzBN0zJ2K7csIR9M4kv8w
X-Gm-Gg: Acq92OHHDiY447YR4SHNq1EuI0adftMYBuV0IGWdsQJ7dWJMqwngrNFDSLUXM9DWO+a
	6eVsB3Dp5WoUXm8COMC3rVnzVfz4YV7/OAOGCAtdpCtM+l9HI2f29Ayw0ESxYUSW2hGQai5zRTZ
	sOJT93aNitjkTlQCz+jRkXEaTVPwA/EaQ3pwQ95FZ+fPZDVDspTlbMQqB4Z7O7ttGxkmhppuP3s
	0WmoDHMmMyLXFsQ89QIbjUSfGJfTwsBtNnNMncV7+Td5gKyhMe7coFWGO+Wodr8hHO3bqeCTv+6
	8Aab1oVWTMvjjvcXcoKooA3Jj6eOZwEJhaT8QjVgH/BAJQgyfmdc3jVoBP5yv3WVQc0eR4iCBOP
	iwBJ64omGH8Zx5zGhoWqYhvl0+dWAUzBgBxnya2IzHqcc2E7xz1LnSwK+dCJGBjvG6nawRoO+RD
	letwzSSgYKux2PqXK5+GhZJ79zKRqNgd4EFPS6S9ONZPpbi3TP0KiLzFTyQV5jyWKEiKNaSfOYD
	NUxnp3YPCuyaFKVSRp5NRK0pVqJUPBb2nKL
X-Received: by 2002:a05:600c:3b02:b0:490:6237:521d with SMTP id 5b1f17b1804b1-492333a8e2cmr6254255e9.13.1781629167571;
        Tue, 16 Jun 2026 09:59:27 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-99-120-gprs.simobil.net. [46.122.99.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa890d8sm103698875e9.10.2026.06.16.09.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:59:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH v2] dmaengine: sun6i-dma: Fix memory leak in
 sun6i_dma_terminate_all
Date: Tue, 16 Jun 2026 18:59:24 +0200
Message-ID: <9Stif-p9RWiht_4RVVcSpg@gmail.com>
In-Reply-To: <20260616060449.42225-1-zenghongling@kylinos.cn>
References: <20260616060449.42225-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095929_515728_F2C948A9 
X-CRM114-Status: GOOD (  20.67  )
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

Dne torek, 16. junij 2026 ob 08:04:49 Srednjeevropski poletni =C4=8Das je H=
ongling Zeng napisal(a):
> When terminating a non-cyclic DMA transfer, the active descriptor
> is not properly reclaimed. The descriptor is removed from the
> desc_issued list in sun6i_dma_start_desc(), but in
> sun6i_dma_terminate_all(), only cyclic transfer descriptors are
> added to the desc_completed list before cleanup.
>=20
> For non-cyclic transfers, pchan->desc is set to NULL without first
> adding the descriptor back to a list that vchan_get_all_descriptors()
> can collect. This causes the descriptor and its associated LLI chain
> to be permanently leaked.
>=20
> Fix by ensuring both cyclic and non-cyclic active descriptors are
> added to the desc_completed list before setting pchan->desc to NULL.
>=20
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ---
>  Change in v2;
>  -Add pchan->desc !=3D pchan->done check to prevent race condition
>   where completed descriptors could be double-added to desc_completed
>   list, causing list corruption
> ---
>  drivers/dma/sun6i-dma.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7a79f346250a..12d038ef5f2e 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -946,16 +946,14 @@ static int sun6i_dma_terminate_all(struct dma_chan =
*chan)
> =20
>  	spin_lock_irqsave(&vchan->vc.lock, flags);
> =20
> -	if (vchan->cyclic) {
> -		vchan->cyclic =3D false;
> -		if (pchan && pchan->desc) {
> -			struct virt_dma_desc *vd =3D &pchan->desc->vd;
> -			struct virt_dma_chan *vc =3D &vchan->vc;
> +	if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> +		struct virt_dma_desc *vd =3D &pchan->desc->vd;
> +		struct virt_dma_chan *vc =3D &vchan->vc;
> =20
> -			list_add_tail(&vd->node, &vc->desc_completed);
> -		}
> +		list_add_tail(&vd->node, &vc->desc_completed);
>  	}
> =20
> +	vchan->cyclic =3D false;
>  	vchan_get_all_descriptors(&vchan->vc, &head);
> =20
>  	if (pchan) {
>=20





