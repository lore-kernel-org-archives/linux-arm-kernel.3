Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A4EC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjKBR3MpL444SDh1d20QHzHS4p8TebdwJWQeVAcffMU=; b=kj7HX4FOc0rz9BI8+l3ukQjQQ3
	9VUD72kqg7JC8V4ayEoish/R8CNBVECfk3Slhc0KkBuSK0O3T7OpFOepkpYfvrQNdZK8n4ffha46b
	kLv7C8qK9V/4GOWE+KXTbDkM+BcrD4CyJqWqdu9S/dz0hUI3cFRH6M3NEP3NDfC9lXqSdL120ntn8
	jzlp9QCFOruukpWx/5uJrdzb8cUdU2n7ApLVAi8et6IKWe1ebql/sJk6CulboWnC+rAGeynT5Kd2P
	p44kcI3l/oYf8YjOqIJ7o/jNXJr/XlN8/DI6sT3gwss6QiH5xAbQQOlPkKGraCL4YwW2kJM0MKOoV
	KsRYsSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LQu-0000000CNOy-1XtN;
	Wed, 09 Sep 2026 16:46:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LQt-0000000CNO7-19oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:45:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DF93601F1;
	Wed,  9 Sep 2026 16:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EC31F000FF;
	Wed,  9 Sep 2026 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972358;
	bh=gjKBR3MpL444SDh1d20QHzHS4p8TebdwJWQeVAcffMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqbKRDFx/vlGF2DLhdIeQ9LyJ1hbaJn6LbHAM4ygVNgKiqSpbEU9S8pG7sZA83IrV
	 bMs3jyHDvVcnttPJ9y+39FGNXmXxYvp6RX38IilzfMHfJVw9uPzmoBIoaQ0bNzrAjf
	 9bbjC5Wi/SHyd9UiqA1o+1361YLZ5k+CRU/XTkMwjjRmEFEGsofhDf88dnU45zLmlB
	 YAINiwI8oChr9ocnNJS/G2D5+VVQZ156IjKfe3phM4NkYzuuFNO2Lr8idVUTm8jm/0
	 4RoZLcA9tWyyq7PQUgx42ZppTIujEJplK/BTuAGWZMqyQn3V4SHqELQCwet+jZPdmS
	 M7voXfrS4cFxQ==
Date: Wed, 9 Sep 2026 17:45:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 09/14] KVM: arm64: Allow GCS to be enabled for guests
Message-ID: <a48e936b-29c9-410e-a0c7-84cd5143d3d5@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-9-f31750bdfadb@kernel.org>
 <aqGKnQZOe6leuXgG@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LzIUzHWTMa+rfMZ"
Content-Disposition: inline
In-Reply-To: <aqGKnQZOe6leuXgG@LeoBrasDK>
X-Cookie: Postage will be paid by addressee.
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


--+LzIUzHWTMa+rfMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 05:34:37PM +0100, Leonardo Bras wrote:
> On Tue, Sep 01, 2026 at 10:47:07PM +0100, Mark Brown wrote:

> > @@ -2193,10 +2193,12 @@ static u64 sanitise_id_aa64pfr1_el1(const struc=
t kvm_vcpu *vcpu, u64 val)

> >  	val &=3D ~ID_AA64PFR1_EL1_THE;
> >  	val &=3D ~ID_AA64PFR1_EL1_MTEX;
> >  	val &=3D ~ID_AA64PFR1_EL1_PFAR;

> And here it says to only mask the feature bit if it's not available.

> IIUC this sanitize function is called when resetting a vcpu, is that righ=
t?

Yes.

> > @@ -3444,7 +3446,6 @@ static const struct sys_reg_desc sys_reg_descs[] =
=3D {
> >  				     ~(ID_AA64PFR1_EL1_PFAR |
> >  				       ID_AA64PFR1_EL1_MTEX |
> >  				       ID_AA64PFR1_EL1_THE |
> > -				       ID_AA64PFR1_EL1_GCS |
> >  				       ID_AA64PFR1_EL1_MTE_frac |
> >  				       ID_AA64PFR1_EL1_NMI |
> >  				       ID_AA64PFR1_EL1_RNDR_trap |

> This one looks like to be a mask that's used to compare with=20
> arm64_ftr_regs[] on arm64_check_features(). That seems to be called on=20
> set_id_aa64pfr1_el1() which is used when we get an ioclt to set a system=
=20
> register.

> So, basically, does it use this mask to check if the set value is valid?

Yes, this excludes values that are never supported.

> Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!

--+LzIUzHWTMa+rfMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhjT8ACgkQJNaLcl1U
h9CUpwf/SYsgfeE57KbWPUv3ttaeYr8Wo7JqNTBEkLzMO4W3ZOuskAV8owdXthu3
F/044n75naZrTZ8F5SKfIDp4hJKY7KUMurSvOat9ilrZyki8RiTWMUHW9Wt6f43f
Ar7UZAUR6S/MsmNIIV2+j0SpW1WKr/iTabrqzsu1CCxi1zfWLZ8ume3WKrnxlGrJ
lsaPw66beA5spQnrQLAA7gRYJIj1aTeBfyEYI2Ziel/dlGuDIxthZ+1NjFeQK+Yw
o8cZRsDm4aGQoB9/ftauDgQiEbL3e5tGtgi5XnTT9xNx/QwTb6qr0LEs8EEKpqIX
TohH87q+3BMIZaMWJLYFeu1TFLFg5g==
=UHs5
-----END PGP SIGNATURE-----

--+LzIUzHWTMa+rfMZ--

