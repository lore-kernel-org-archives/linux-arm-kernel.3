Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49347C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LSfaQsJnWTgUDlHUu9ZzXQ3/4tSCBUVOkdmaV5v2+4=; b=zyzZyl32dkQlPxl9DsILYrW/QK
	htvcv5/1m3SgDc/i1FxWxLUsHMR3xYWaSyAg+EWMq5hgSoJhUiUFNXbuvqM2jvGjVM7pQtfL1VmK0
	K9jFO9QAU2HFWZEm2g7nJoe5nJw4toIeGz0j8KNFtWhSS2l/Dgwd+hdzrPjMuCSaANrr4smwNdqDI
	LAaQ2ET2lJelqTq1EDkkPtwfA8prkJXfS+9jbnnQ+aHgQoqUD8VTMpwAafSvUnjv+G7cF5xhCNsHP
	sosQnoNoLov/PgxoAXvzM0Q71uJXH9tQiTDba/NNcKMHFEdOsBk1vxTaTzx0TIZBlRLy4VKTGmMfw
	mG1Ii00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wranS-00000003uUL-28N5;
	Wed, 05 Aug 2026 12:32:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wranQ-00000003uU2-3wFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53CEE42A0C;
	Wed,  5 Aug 2026 12:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7563A1F000E9;
	Wed,  5 Aug 2026 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933152;
	bh=5LSfaQsJnWTgUDlHUu9ZzXQ3/4tSCBUVOkdmaV5v2+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kgarzZbcePG1xY1ektXE5fX/hI8viRoMoas3xXwM3dzop8NJE/Ox2uoR4T7k8JHmK
	 m4CUq5FDrCQbUh1Ae8x5roBl4qQX2apjTVHzkDh7FmAwCG1vMo3WRkPakqVOJmQUux
	 bE9TTgXH5dUMPg/+hlfsGYiwFyKm9ZSftz2LUs57TKqiwQozfuCl0DJB3sxe8rsjrF
	 phb7RyXHPE9zUuVm8LC2imncAm9Fp/BWU+gMTFWPte+9o9qzThQ8GEtlZIordwnqTo
	 pLokldhx5f/+pkjUP5N54JMUkKc7+BjQfMpPvkQW9TH0OBn5cpLQtKkPdlozP24H+G
	 9m9y98fuINt7Q==
Date: Wed, 5 Aug 2026 13:32:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <6d63905e-8c6e-4c88-b60b-d34ab1401783@sirena.org.uk>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
 <20260803-arm64-gcs-v18-3-fd8c40f5ad88@kernel.org>
 <enhoyivbkdaacgyazubgfzftt34xjemtrybvgpuqvr4czjtbhm@7qvrce5lmdyw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G0bWhbbolYLdYDz9"
Content-Disposition: inline
In-Reply-To: <enhoyivbkdaacgyazubgfzftt34xjemtrybvgpuqvr4czjtbhm@7qvrce5lmdyw>
X-Cookie: Stop ahead.
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


--G0bWhbbolYLdYDz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 05:48:04PM +0800, Yao Yuan wrote:
> On Mon, Aug 03, 2026 at 11:56:48PM +0800, Mark Brown wrote:

> >
> >  		if (ctxt_has_s1poe(&vcpu->arch.ctxt))
> >  			write_sysreg_el1(__vcpu_sys_reg(vcpu, POR_EL2), SYS_POR);
> > +
> > +		if (ctxt_has_gcs(&vcpu->arch.ctxt)) {
> > +			write_sysreg_el1(__vcpu_sys_reg(vcpu, GCSCR_EL2), SYS_GCSCR);
> > +			write_sysreg_el1(__vcpu_sys_reg(vcpu, GCSPR_EL2), SYS_GCSPR);
> > +		}

> Looks the s1pie checking for GCS vEL2 context switch is
> necessary yet IIUC, KVM does vEL2 context switch for nested
> L1's EL2, it should follow same rule as non-nested L1's EL1
> context switch.

Right, it's not really needed in either case but hopefully helps code
generation a bit.  Thanks for spotting that.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--G0bWhbbolYLdYDz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzLVoACgkQJNaLcl1U
h9AShQf9GTcWUv5esdda/vVYebPT3BbxWQXttB8maWVlWNrtRAZ3CcuUZK1lNv3Q
M/gte5u9UOApkJA4FxQKLJKXrvlkl9eWlXAmhwPtMgd2JwfMt716GCJTqYO6AUe8
U1Zt5uL70KfvRw52jOA7fIwKLHh6qP072nyrPg0KKTMh16zBuSsr39cNDqu6/e2U
N/Uo4Zrb3Qqcl+tlYkZuPdCReFrJmJUuM0tOq7wOPpQjB7ySzou1akvTvBWNPlJm
Hyn4x0+bcF+fOAe+xkq+avmuS5AOix3cuAxcxeAOr0ZQWf+rR+1V6OOWqHx87gSS
NEhHYl2r6NQ/B5yMZuzvDYScdhY5zw==
=Ce0W
-----END PGP SIGNATURE-----

--G0bWhbbolYLdYDz9--

