Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF460A262C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rkF2bt0/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oj6JZE/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XrszyOJWwJTV90LIZM95zHwP5tXDmJojQtjJsIJz+qU=; b=rkF2bt0/Dwd32jTVw9j7mufSxk
	4Fpk/Kj8oCwVBE62VqtDd/3cQOR25KIcwUxUhYCuUQf+9p4QqzfuztXBq0XKCSCI80gcWaDfYzIIh
	MSJI44PoEWQ3nrjbu+9RJIVgJzlPVEWEyZOD28xVeVPXTJ306oYId1R85Sfpj3fF/FkzUAFUXkvyU
	l0p3AQo9jR6JZXp50UCMWaJjE5rHr/+47GEPtekyOkhnMTJeqIGXXUQI0Wt6D1MfRzv+l6tQmmfP2
	X32gloIS3wBkny+w3cw6bFThN2GaevToRhILZKk2EAxq5Hncp/tDsUPIjxmhPhs/5+p7u+xBx7xQ2
	aDznaH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJRx-00000002SmH-1itN;
	Mon, 26 Oct 2026 12:05:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJRw-00000002Sm9-2F7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00D1A600CB;
	Mon, 26 Oct 2026 12:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6741F01825;
	Mon, 26 Oct 2026 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016311;
	bh=XrszyOJWwJTV90LIZM95zHwP5tXDmJojQtjJsIJz+qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oj6JZE/kG+hhqZxoQ+yODE7mTOSfVM9r0neDNfQu+XgJYnH9BMCJLbAczYPub7N+L
	 smVfNhxDG3ihVKIfBKNdKfYMtETvU9dG6NVfyExtT9Y4M8mDJrLb8CkdXz51LPA2GR
	 L4ibCVaR977YPgdL9njvzFJO6gLBo9LVJUjOhbpcOgCy062lZv5b0nKTnvlwS5zGI2
	 dFe/RbFRsinmNpkiYdkIi8BYqNUu93ZeaFCMNDrvU8xOzoGtToulgIdCczYKBX5qwa
	 +hnLr9BA9QYs/0c+oLEu88TJgQk2n0Xg7juHz4wT83M1laZqakSTxkWxbVahW+8fRB
	 +r6GQhzwBMiVQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3CA051AC5994; Mon, 26 Oct 2026 12:05:08 +0000 (GMT)
Date: Mon, 26 Oct 2026 12:05:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: selftests: Skip unwritable ID fields in
 the failed-run test
Message-ID: <at9B9N-90QwLPv5i@sirena.co.uk>
References: <20261026012128.2270251-1-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lOlYcF5yfFB7kmfM"
Content-Disposition: inline
In-Reply-To: <20261026012128.2270251-1-sashal@kernel.org>
X-Cookie: Victory or defeat!
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


--lOlYcF5yfFB7kmfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 25, 2026 at 09:21:28PM -0400, Sasha Levin wrote:

> Only a field that userspace can change can be frozen, and KVM reports
> these registers as not writable in KVM_ARM_GET_REG_WRITABLE_MASKS. Skip
> the fields that the writable mask does not cover. test_vm_ftr_id_regs()
> already requires the mask to cover every other field in test_regs, so
> this only drops the fields KVM never lets userspace change. Whether KVM
> accepts writes to fields it reports as not writable is a separate
> question from finalization.

It would be nice to apply the same thing to the NV instances as well but
in any case:

Reviewed-by: Mark Brown <broonie@kernel.org>

I didn't redo the testing that Fuad already did since it'd just be the
same thing.

--lOlYcF5yfFB7kmfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat9B9AAKCRAv73Ows9A4
iUn/AP977I6nqPZmrTudLmqcb4MROLcy9GYgz1jVFIocLXDrrwEAnUi0j81aTjSo
ef9JvnGQ0OBh4UI9WY6xdmk4v/IezgY=
=G2In
-----END PGP SIGNATURE-----

--lOlYcF5yfFB7kmfM--

