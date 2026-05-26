Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D55CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1H6PxWdK7ElO8sXwbyLzjpAZlZnOUADTxmFnZZJISI=; b=PuQSk2Uko3w1g2H0BusCRhOj+R
	8McxwmLtihTq5OtJ+kau48tZ+44t8V4UUvyGyfBOYmO4JH8Ge4/fjIYPPCM6sSbg/mSZ1gOtjZm2g
	uNQAQa25AGAnooLuT6HBRw+ZfEAyjUZVq50Qnzea//ALxZn53k+l+cZk4JwRER0Gm7E/dKAT9Jjp3
	O1pTvyRuHpIae0isvc6RHUpy/N6E20uin1LHWLMp3WBgrb3G/JBCTDKEDabt0J9lK16H47W++P++s
	3WBtOoNopj8OeCj5/PTuaIlRgqmjQ0MJgt+oGFA5OFKlq5G7h68pcIY2S62TQ8QzfcNPD45ScsTzv
	v8EQ5FQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrnJ-000000023V0-2fLi;
	Tue, 26 May 2026 13:26:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrnI-000000023Ui-2RXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:26:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BA0F60227;
	Tue, 26 May 2026 13:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793F71F000E9;
	Tue, 26 May 2026 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779801963;
	bh=F1H6PxWdK7ElO8sXwbyLzjpAZlZnOUADTxmFnZZJISI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TITtatTjeuXKHP3vxhkMEUcUKI7aQF+KQAkDyIgK0iTk1YtqaWlWAc/NduBPKYfWd
	 BYW65ooqwULFumubeML0s9CcVKhQhpv2s8C7oUbhV8rJyac8kfYLoPiODnjdRE+lHp
	 PKTeqF/mQc5XZ/bIJd/1eNRUWf6eqa9qn7kmpoCxlqOOg5QLSgqziQLKkPsHiFNyBZ
	 +oHX5/MU89S30gtshdh+SRGe292Rl4cGaKO+xtSkF9ucMVDKcYaJW3Gy3pwh/oTJ8m
	 c/FdR9OPiamccYfUrulbWfvS1VaYCglE8LB09DUrqfmsi4f8/Ie/o3sAE3TMiB4zoD
	 rP31HXqWZpJmA==
Date: Tue, 26 May 2026 14:25:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 02/30] arm64/fpsimd: Update FA64 and ZT0 enables when
 loading SME state
Message-ID: <d8074c6b-9bc9-496e-8a74-94ac18ce9a55@sirena.org.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-2-43f7683a0fb7@kernel.org>
 <ahWWqU51Zffmhlo5@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H7xcdA+9c3FyZG2q"
Content-Disposition: inline
In-Reply-To: <ahWWqU51Zffmhlo5@J2N7QTR9R3>
X-Cookie: You are fairminded, just and loving.
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


--H7xcdA+9c3FyZG2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 01:48:41PM +0100, Mark Rutland wrote:
> On Fri, Mar 06, 2026 at 05:00:54PM +0000, Mark Brown wrote:

> > We provide a helper which does the configuration as part of a
> > read/modify/write operation along with the configuration of the task VL,
> > then update the floating point state load and SME access trap to use it.

> > +		if (fa64)					\
> > +			__new |= SMCR_ELx_FA64;			\
> > +		if (zt0)					\
> > +			__new |= SMCR_ELx_EZT0;			\

> I'd strongly prefer that we make it the caller's responsiblity to track
> all the bits within SMCR, rather than requiring each caller to pass a
> bag of booleans.

I was explicitly going for the opposite of that in order to make it
harder for someone implementing a future extension to miss a place where
an update is required, having the callers independently constructing the
register values feels like it's asking for trouble.

> 	unsigned long __task_smcr(const struct task_struct *tsk)
> 	{
> 		unsigned long vq = sve_vq_from_vl(task_get_sme_vl(tsk));
> 		unsigned long smcr = vq - 1;

I agree that's a better pattern for the main kernel - we could also do
something similar with a task_set_smcr() which wraps the explicitly
specifed version.  That would I think avoid most of the issue you're
seeing?

--H7xcdA+9c3FyZG2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVn2QACgkQJNaLcl1U
h9B0uAf9FsOQ191IjRxjDWRTIzKuXKL2RhEm/vJESCmoiliG05She/LfLMIqhDji
Q/cC/kYbmSE3xPCIIztZVByWhLSAIjMP1qWJ8W3yjzVVb22SlVdR5LgX7Ul7v2hz
VT9uQ1cHmCbdotaBfkRiVvlege2YZwhAYTA5zCvqN+4yL2CWGjB4260gU2yh+jXJ
pwK0TpvHk5jC3X3JLLtW9B9YzzcmWKbkwe1wQCsRvG9K8HHdXJzLHn30t5o7NSsY
nr3laBeKco7QBfqsrXfyQhpPahS34qLzpYrf41C3ZjLxt2nBIr/lGGN1Fs4owBdt
Kh2RXpL5IcSeFr8jyQ2A4InBCsw8kw==
=vL5s
-----END PGP SIGNATURE-----

--H7xcdA+9c3FyZG2q--

