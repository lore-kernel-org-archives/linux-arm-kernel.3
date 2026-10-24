Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47384606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKti069q;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=lRTw2REA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sMwqTLtobjq9y4v04ViG193gMutnOIBCJMmSiPL0QaU=; b=qKti069qAUJ4rHGolyEqUWB+IL
	9FQzQj6+igk6gxVeEr4Pfay3Iqh5p032aXxnG3wy2fNtkw0mAfbavmoIbNQ8xGMmNNnvVvvZ7uBuq
	mEXcXmPkvTftb9v3JbwBr89YiePZECebDxI7odAIWsMTjokwohymdrQ7hGbvho5VB2GCWppv6IBD4
	RSnsC4z1X+hkxma96aVcLGQg72WZwJ7OQAAyWDb0Pglw/8GAYx5GJ2hz6d1Tmjgs0yKwPu+vFL7HE
	lSHVH4R906wMs+wbQ9B3Zz0WY5vN3lhrz0N4USc8jPcKD/YUMiaBNLw9BL3vxbJxPsHKVbnxHvrCo
	aEljYKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKglu-00000000RJo-3u6j;
	Sat, 24 Oct 2026 18:47:14 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKglr-00000000RJQ-38AA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 18:47:13 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id A6AAFD312D;
	Sat, 24 Oct 2026 21:47:08 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro A6AAFD312D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792867629;
	bh=sMwqTLtobjq9y4v04ViG193gMutnOIBCJMmSiPL0QaU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lRTw2REAsTGOTHe91Ot2A5V7siQRADaJQxab4/3iubUgCLH30bVdIaOAl8OHheibt
	 aOrVREhG/GvEnhM3MnxwkdxZlspnA/GepgcgXVBqr+w9x4QFT5U6L0UHg/1CFNEFhN
	 vRKX/VQUs1cavU41CO8XKvsIXpqkJs1d0izkkJwd7Jmq1W4bIGq+GJcu2o3OjS7n/g
	 0cPvuB11a96QWx2xINKcCDEmAQKV71DnwjSngCe6TmE+QrQK1U/NoxQdA4SAhSgKmx
	 EcmRVpN9PTLv6kooZ+2KGHKJxWiFTwB0Hv850wezgqS4/fwbsKpTiFXy3RBpdVmvB1
	 Uo51+56HppPKA==
Message-ID: <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
Subject: Re: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:47:06 -0400
In-Reply-To: <20260923083703.38974-5-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_114711_995029_5D4E2DBA 
X-CRM114-Status: GOOD (  16.31  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> Add log messages to help follow the driver flow when debugging: an
> info message on successful initialisation, and debug messages on the
> MSI interrupt allocation and free paths.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 8155f63cfd29..0e68f81014e7 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -104,6 +104,8 @@ static int alpine_msix_middle_domain_alloc(struct irq=
_domain *domain, unsigned i
> =C2=A0	struct alpine_msix_data *priv =3D domain->host_data;
> =C2=A0	int sgi, err, i;
> =C2=A0
> +	pr_debug("trying to allocate %d msi starting from %d\n", nr_irqs, virq)=
;
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
> +	pr_debug("allocated %d msi starting from %d\n", nr_irqs, virq);
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
> +	pr_debug("freed %d msi starting from %d\n", nr_irqs, virq);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct irq_domain_ops alpine_msix_middle_domain_ops =
=3D {
> @@ -235,6 +242,9 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	pr_info("initialized successfully, spi %d to %d\n",
> +		priv->spi_first, priv->spi_first + priv->num_spis - 1);
> +
> =C2=A0	retain_and_null_ptr(priv);
> =C2=A0	retain_and_null_ptr(msi_map);
> =C2=A0	return 0;

Not that this matters in reality (because all these numbers are "small")
but for the sake of correctness: all the variables you added messages
for are unsigned, so you should use %u on them.

Since you're cleaning up this driver, you may want to look at the other
prints. For example, the existing pr_debug() in alpine_msix_init() has
the same problem.

--=20
Regards,
Radu

