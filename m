Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51A606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vusUUTh4;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=yPENIEA2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z3EWC7gQw8HWCPxJlpwFZKXN5PnSmmmFfA1GTBOpYGY=; b=vusUUTh4EEE7U05l0+qJh2B4k6
	0KsrTEV0g3uz5UNdNUZs4tht2L2P/a/wwuBE3eGFF953yjBbW4e4Kh14eLtV0KQyvWZRnf6s3JG0L
	oq3kl6tcjtxAq171QMYfnaU0DHHYZF+Fh62/YUNgkqd7v7yOfGxE0+6vH1O5tGKv6+hKMzDCQibIy
	z61nNv8VjGvdZ+nwPl/JZOUNRI3OvZGAvqsHucxS7dttdGnqt2oGCbDY4xnQnZEoxKwrov+i2ON1a
	d+mTBsJImSlQFE0dWfcRn7qX5TQ/PgRyxqBtTFbOhSprmeXyL1QvXP9aw8Ye9LXYjWwHk5DqgGXGx
	HfwL0PWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZgP-00000005FLV-1TY2;
	Wed, 04 Nov 2026 12:01:37 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZgN-00000005FJy-2NKD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:01:36 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C8705D3370;
	Wed,  4 Nov 2026 14:01:32 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C8705D3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793693;
	bh=Z3EWC7gQw8HWCPxJlpwFZKXN5PnSmmmFfA1GTBOpYGY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=yPENIEA2T3Bab64C2zlyNxThJ5y6KL3mUZLKAFSFqu++hxvMH8MFmdfVNBsHj84aw
	 bEE7V+gflji8wHNGdleg0gTRgsgJqRzv3lNk58dfiHH6jAVSH0OvLl8+OEA83/NAJu
	 CkunPL6Dg76QVTriyJcJEN7FaYfRFnDVvyuRI376hdQSaUftchZYBl80dQyJJQYvYI
	 UuHd8MSSNZfAJDabOcY8Uhb+5PQ1Nvh1WoJaNE9yKc+Xglz8KfbbTu37DwA8i4+wD/
	 0SGEYw415cIkfVg6eBhFAqUp91jUYpbsvuSenjKD46cfkmTr9KbUOGV9+jAQsCBTQP
	 I0Swil28EiAJA==
Message-ID: <216108ba417dd8e201a0345b2278eec2dfc6abf5.camel@rendec.net>
Subject: Re: [PATCH v2 5/5] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 07:01:31 -0500
In-Reply-To: <20261024193620.39999-6-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
	 <20261024193620.39999-6-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_040135_783647_81BAB66D 
X-CRM114-Status: GOOD (  16.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 2026-10-24 at 19:36 +0000, Eliav Farber wrote:
> Add log messages to help follow the driver flow when debugging: an
> info message on successful initialisation, and debug messages on the
> MSI interrupt allocation and free paths.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2:
> - Use %u for unsigned values (Radu).
> - Write MSI/SPI in upper case, to match patch 4.
>=20
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index fb84b6046193..c13646c763d3 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0	struct alpine_msix_data *priv =3D domain->host_data;
> =C2=A0	int sgi, err, i;
> =C2=A0
> +	pr_debug("trying to allocate %u MSIs starting from %u\n", nr_irqs, virq=
);
> +
> =C2=A0	sgi =3D alpine_msix_allocate_sgi(priv, nr_irqs);
> =C2=A0	if (sgi < 0)
> =C2=A0		return sgi;
> @@ -116,6 +118,9 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0		irq_domain_set_hwirq_and_chip(domain, virq + i, sgi + i,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &middle_irq_chip, priv);
> =C2=A0	}
> +
> +	pr_debug("allocated %u MSIs starting from %u\n", nr_irqs, virq);
> +
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_sgi:
> @@ -132,6 +137,8 @@ static void alpine_msix_middle_domain_free(struct irq=
_domain *domain, unsigned i
> =C2=A0
> =C2=A0	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> =C2=A0	alpine_msix_free_sgi(priv, d->hwirq, nr_irqs);
> +
> +	pr_debug("freed %u MSIs starting from %u\n", nr_irqs, virq);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct irq_domain_ops alpine_msix_middle_domain_ops =
=3D {
> @@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	pr_info("initialized successfully, SPI %u to %u\n",
> +		priv->spi_first, priv->spi_first + priv->num_spis - 1);
> +
> =C2=A0	retain_and_null_ptr(priv);
> =C2=A0	retain_and_null_ptr(msi_map);
> =C2=A0	return 0;

Reviewed-by: Radu Rendec <radu@rendec.net>

