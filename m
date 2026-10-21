Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B24860A2622
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z9v43a93;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERf+CpF8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ2Ovji3bjdRLPPGY30syDXCVJ0aHLykeRBouybwHX4=; b=Z9v43a935CXbCCm8Tx71AlymVx
	IgB3BB2IKnsLNqayMf12WWsBJy5xzWxrnLSHkHafESYhxehNYrVQdTSlyQAq4dmE347O2gCjlorp9
	+H3fyWiiWofD7YOFOTx8Fz7RNtQn3jqXVn4p6qZ3RxaEvxD2i1Jk1vXYSa7Y3MuhnAJHhmSVQgd/f
	nN/FcupWFZ1DFAPDpIFqVEqVXxonNsmpZ5YDAISOIiNVUoD9IUf5Vu2vDd0i2liyP8f/k3OLt+g3P
	9O5wC7zSZXz/d7qu4c9YkYzlFVztrc6Bdx7gl+UJEREDYaKG9DRH6TMH3hEZxM0JbLxQoz4x2rQFs
	SdGYwxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWam-0000000Bw3y-3PPc;
	Wed, 21 Oct 2026 13:42:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWam-0000000Bw3s-1uRE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23EDA43D80;
	Wed, 21 Oct 2026 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17281F000CB;
	Wed, 21 Oct 2026 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590176;
	bh=xJ2Ovji3bjdRLPPGY30syDXCVJ0aHLykeRBouybwHX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERf+CpF8vlUO4sHeciogTzn1mupLzKhUYSHIvzu7mR+nIloGfSGZMxX9r/5uIZQ9l
	 2QVoH9Skg8YTGoBmDYW4Q2RVKJ9LJwFoXah0j+BTAAlnpSfaYYB/MAXPaIoFcA+gvL
	 nXtpQrtWbe+iFq8sW43CssvmH6cMVGgfIRTD8RroLBm0/g4sly8g476zytxWsmh9+i
	 UJzm31CTFnt8UmP545yxUBdOEJ/zTn8dkX0/JMInJd6T1/HHrCKzoYT16H3GEvlcHB
	 geSGNIJqCKYZqmqF0m1I+3bzLRt3rPe4ttrNdDw4nzumwRmjOS25zcb0Nrn5Nacrvr
	 rSW4KGhBTvuCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4D5A31AC5995; Wed, 21 Oct 2026 14:02:54 +0100 (BST)
Date: Wed, 21 Oct 2026 14:02:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
Message-ID: <ati3_lymW0zaBsSU@sirena.co.uk>
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sjt8+o4zUIdHkuuK"
Content-Disposition: inline
In-Reply-To: <20261020064306.1542865-1-fuad.tabba@linux.dev>
X-Cookie: You buttered your bread, now lie in it.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--sjt8+o4zUIdHkuuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2026 at 07:43:06AM +0100, Fuad Tabba wrote:

> On first run, clear S1PIE and S1POE from the VM's ID registers when the
> features they imply are missing, before anything derives state from
> them. The guest and userspace then see neither feature, and the guest's
> accesses to their registers UNDEF.

Updating the ID registers should ensure we don't have any confusion in
the later KVM code due to the standard use of ID register based checks.
I didn't spot any further registers where we have nested checks that
would need similar updates.

> +static bool idreg_deps(struct kvm *kvm, const struct reg_feat_map_desc *r)
> +{
> +	struct resx resx = {};
> +	u64 val;
> +
> +	for (int i = 0; i < r->bit_feat_map_sz; i++) {
> +		if ((r->bit_feat_map[i].flags & CALL_FUNC) &&
> +		    !r->bit_feat_map[i].match(kvm))
> +			resx.res0 |= reg_feat_map_bits(&r->bit_feat_map[i]);
> +	}

It would be nice to have it be more obvious to the VMM and/or it's users
that it messed up, as things stand features it thought it had set will
just silently vanish from the guest - they'd need to know that this is
something that might happen and check after finalization or similar.
That's probably more a documentation/education thing than anything for
the patch.

We might want to support limits other than 0 at some point, but we can
deal with that if it becomes an actual issue and it's likely we would
just decide that the VMM shouldn't be configuring invalid things in the
first place so we don't care about being helpful.

Lorenzo raised all the more detailed code things I had, but either way:

Reviewed-by: Mark Brown <broonie@kernel.org>

--sjt8+o4zUIdHkuuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCati3/gAKCRAv73Ows9A4
ifL7AP9jC8Mppexxj5Jl+d6ocXhZ+hqVKb1yWxSLeKWRDJRgpAD/QLofN6NXuN+M
miPfgi6EV2eYKd2tJqsht9+/C/EuKw8=
=PXJD
-----END PGP SIGNATURE-----

--sjt8+o4zUIdHkuuK--

