Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CD606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mv+r3B92;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RZlGFo4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hDiTTg5aqjPLEBuvxWemMxO8n0pna/rsjNCyQxTZjbA=; b=mv+r3B92ijLUNqjMoSU2/ID30l
	k3ksRLSH3Iksn/V+BDwDdgxEH0SGD/XbKK+nEi5fcGjSKAMEHeiemXHIHxfCTYEGFgnvLLAOHD3w5
	5JepjjQrE9FjguScDi6NhRisv1gGv+TuT40UvrCJZt4/7Ha7O0JaqcUd4qLYoKx3P77q17kezZN21
	KOtmxA//yyExzNbhiJFo8ITCQALfUkjPmrjaVIMbpcg3NWsiqa7i+pUeUuFDNi4K8lu1XGYz9Ump/
	XG/9tx4FuZ79k4P6ep4P8Bn6OHOT3QnHpTjC/9JzAdf2+SribKauXaM84KDbhmVCPY29t0ShN9iZc
	K0g3vFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL64e-00000001SnE-1KwP;
	Sun, 25 Oct 2026 21:48:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL64c-00000001Sn6-3xYA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 21:48:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0964600CB;
	Sun, 25 Oct 2026 21:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A6A1F01825;
	Sun, 25 Oct 2026 21:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792964893;
	bh=hDiTTg5aqjPLEBuvxWemMxO8n0pna/rsjNCyQxTZjbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RZlGFo4GhsbFHSK9ofCYklD9mxJX6RDlW5nMeJqwBzaIhMeZVbyQhtm8Pht13aBUR
	 N5H2XX+HWnWprbfYsWvw/J5cApSoeX2zzOYbqxy85tpfvD059F9v0grCwJsIOKAuQG
	 kTzCQC7kDS9lO0NCB5/DVxrKb1zCkbbeEBVWgw7yeDF1GKd744CpAu/smx9T4lO4JK
	 zZECt8Y5BWSUUEg8iIHeg2IXFbbpKvbj1NKR5HLhoyKkgqMvHlw+5tAhVjDSg47L2i
	 SoEZuOciwHXr7s4WuKOlrUVnZZu3dqiEitjMl4fjy5wfjqifO/N8oQntht3VJIhPwc
	 ANFnmObSBJj3w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8C8FE1AC5994; Sun, 25 Oct 2026 21:48:10 +0000 (GMT)
Date: Sun, 25 Oct 2026 21:48:10 +0000
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
Subject: Re: [PATCH] KVM: arm64: selftests: Skip ignored AArch32 ID regs in
 the failed-run test
Message-ID: <at55GhnsD67k2Xkg@sirena.co.uk>
References: <20261024161118.1007472-1-sashal@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XZ3wpwJ3w0pXiMRa"
Content-Disposition: inline
In-Reply-To: <20261024161118.1007472-1-sashal@kernel.org>
X-Cookie: FEELINGS are cascading over me!!!
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--XZ3wpwJ3w0pXiMRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2026 at 12:11:18PM -0400, Sasha Levin wrote:

> An ignored write leaves the register unchanged, so the ID registers are
> still immutable and only the test's expectation is wrong. Skip the
> AArch32 ID registers that KVM_ARM_GET_REG_WRITABLE_MASKS reports as not
> writable for this VM, which is decided by the same
> kvm_supports_32bit_el0() check as the write path. The aarch64_only flag

Another approach if we're going to change the test would be to have the
test support WI registers like the kernel does and also accept a
successful write that does not change the value, as you say this is also
maintaining immutability.  Doing that would handle anything else that
gets made WI.

> This does not change the AArch32 ID register readback issue under nested
> virtualization that Itaru reported:
> https://lore.kernel.org/all/as8x38o9taXgKZym@sm-arm-grace07/

It's been reported by a bunch of people, including me with the test
fixup that Itaru was mentioning.  It does seem like if we're going to
fix this in the test we should fix all the instances rather than just
one, or we should just fix the kernel like Marc previously requested
(given that we've just stepped on the same landmine...).

> +		/*
> +		 * KVM ignores writes to the AArch32 ID registers when it can't
> +		 * expose AArch32 EL0, and reports them as not writable.
> +		 */
> +		if (sys_reg_CRm(reg_id) < 4 && !masks[encoding_to_range_idx(reg_id)])
> +			continue;
> +
> +		val = vcpu_get_reg(vcpu, reg);

This is checking for AArch32 AFAICT because we're currently seeing
issues due to the lack of AArch32 making the registers WI but one would
expect the same issue to recur for any other ID registers which we end
up doing the same thing for.  If we're going to do this shouldn't we
just check for writability?  Adding the check for AAarch32 as well seems
to have the same papering over the cracks concern that Marc raised.

If writes are being accepted to things reported as unwritable at all
that seems like a separate issue to the finalization, we should test for
that separately.

--XZ3wpwJ3w0pXiMRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat55GgAKCRAv73Ows9A4
iWvMAQCfmdP6zPYprHHX9YOoVU356Zhd4rFs5rfa4rIZuFFTJwEAm+X1RFxCBYQi
PZV+kXkd55f3HK82Y3dOjL/RBH2InwA=
=6dZ9
-----END PGP SIGNATURE-----

--XZ3wpwJ3w0pXiMRa--

