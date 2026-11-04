Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1efg/U2;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=EnCWrJEu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=677oYktkfZNgmcjc+8sUJ4wlu2SRiEBON5qQ96zG5xM=; b=e1efg/U280Er4GMD0kXm543sgp
	RI13aPq7MJGBC9Oo926vJ3k34vT9c5JOuwYnmVX9XMXK040O3KXVdKqMM5g/3u+fLHv4N5isRxjTk
	3/uh4WxtXDUcltgDY7nPeojs4s16lhwfXGGOkXxhLedDVFy0EByMeAeUg+Rh+/i1g+WnZ5TFQNZ17
	5Np5CpVXR98RHE3jZeqs4faNa+uG8EDqquLyFUNzUvzkDQq6ehGjtFwPhyOAXciVjDKjLZ7FXGHWh
	9rPGD1fDZG24hp4m9pk5gJXVYBphRpEOegr9dV7GqgU6i6+qKBeISl0pWvvjCv8q5pEuMQ9z5aiu+
	X1ALqi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZix-00000005Fod-2con;
	Wed, 04 Nov 2026 12:04:15 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZiv-00000005Fo3-30An
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:04:14 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id C60CFD3370;
	Wed,  4 Nov 2026 14:04:10 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro C60CFD3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793851;
	bh=677oYktkfZNgmcjc+8sUJ4wlu2SRiEBON5qQ96zG5xM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EnCWrJEuV7yY2RKH3qNTtrR9scnXQii8x3o+DtZDmejZ6O2GeJAGgGt3KtoHS/eAb
	 ZRyt1bvBjc1uvWj2C7XODlo9xz5y8ygI8mum106/3PaySTmo65t/mqD2QHu8Z03ygU
	 +BB00X608rUn4q/+JOWOoFpl7bjPSEMJ3B821ZdtLoAQCdrtjjNTk9Yr7pNoR7FW/Y
	 wGVHbGfZdSt4buvzU1IgkqOaQANl26d2vqJFRuaYW/pOut2ecsgr66Z7upyzXU+/I3
	 uhGttXmmSli9d1JI2yvarFSAubm9oPayvqIWQrW+IFhs1NcyR6r0bwc9vRCubza0t8
	 qzOHDTLcaUMJw==
Message-ID: <d73d1e9a851e3adf270924c3b18db0f85defdbdf.camel@rendec.net>
Subject: Re: [PATCH 4/4] irqchip/alpine-msi: Add debug logging for MSI
 allocation
From: Radu Rendec <radu@rendec.net>
To: "Farber, Eliav" <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  Antoine Tenart <atenart@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 04 Nov 2026 07:04:09 -0500
In-Reply-To: <BY3PR18MB47221A1FD4F6674E206DDEF1C6632@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260923083703.38974-1-farbere@amazon.com>
		 <20260923083703.38974-5-farbere@amazon.com>
	 <d413238a3c5533572013d1fb27142345aabdd101.camel@rendec.net>
	 <BY3PR18MB47221A1FD4F6674E206DDEF1C6632@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_040413_930304_6E290566 
X-CRM114-Status: GOOD (  19.01  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 2026-10-24 at 19:33 +0000, Farber, Eliav wrote:
> On Sat, 2026-10-24 at 14:47 -0400, Radu Rendec wrote:
> > On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> > > Add log messages to help follow the driver flow when debugging: an
> > > info message on successful initialisation, and debug messages on the
> > > MSI interrupt allocation and free paths.
>=20
> [...]
>=20
> > > +=C2=A0=C2=A0=C2=A0 pr_info("initialized successfully, spi %d to %d\n=
",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
riv->spi_first, priv->spi_first + priv->num_spis - 1);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0 retain_and_null_ptr(priv);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 retain_and_null_ptr(msi_map);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >=20
> > Not that this matters in reality (because all these numbers are "small"=
)
> > but for the sake of correctness: all the variables you added messages
> > for are unsigned, so you should use %u on them.
>=20
> Thanks for the review. Fixed in v2: all the new messages use %u.

You're welcome. Thanks for fixing it and sorry for the late reply!

> > Since you're cleaning up this driver, you may want to look at the other
> > prints. For example, the existing pr_debug() in alpine_msix_init() has
> > the same problem.
>=20
> Fixed in a separate patch in v2, which also corrects the wording of that
> message. The other prints in the driver are pr_err() calls without any
> arguments, so nothing else needed changing.

Sounds good, thanks!

--=20
Radu

