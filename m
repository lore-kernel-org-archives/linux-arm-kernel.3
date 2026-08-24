Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CBFC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx+rPoWvI9AkDoOzj5LLsBB5vj6AWlJD0KdPs8BiNks=; b=JhEpII23E1zzLzDxC5jl1IIFtK
	5xupRRYhk9jnk6QuE8rGKujj4vNrVM3LGGz0DUPuKaySoHESMQc93+NhfGhgdIzAHYi0NgCaxBuMx
	vw6dXufu9mzJHc4eCLueCz5pDOE37zMV9B0YoNVkfZG3o6W+zWIf1LEgVOLMOcxDScYwsPzXjsPGZ
	XrLqodkES2ZzgWgaygf7KGLITapmC5f2L4cfdsgTZqXMOMtJuOxU8WoWHYzVg93Rj9w0AySqq/SfV
	IZTBUYp2emk+e8DFnciAySNitjgEeJAuQaXCZ8BTWlA+0ZKGN1Rj37d15MVImlwJDWMV4f/z8qH1k
	JoWFgx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySb0-0000000GUHa-1O8h;
	Mon, 24 Aug 2026 11:12:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySay-0000000GUEO-2Nio
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:12:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6CD1416EB;
	Mon, 24 Aug 2026 11:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9641E1F000E9;
	Mon, 24 Aug 2026 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569923;
	bh=mx+rPoWvI9AkDoOzj5LLsBB5vj6AWlJD0KdPs8BiNks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMLFr5yZzIs0z67GZnwj0OMggnSxwjtK/svgoRHvLnZJLflICjZ7c2H/0ZLr8XRBQ
	 5peiDCre1Ou8Z17lQI6z7iqe4HP79Am7rOUrqCSkivt2tlw6V656d0fFf3inVa0ilc
	 LREZ5spgc8ePqqERgIM4DGL+XM8vLXJBlXG7T9t2XLYv3UCSLqOzHVPmG7Aab4KDho
	 pGz1SEWBqKdmf0x9ghpwGzEbRm5UTisGHBnqw+0ZmEMpGEaT2tebudhm35NtO/NbMN
	 dcCnvz2BRnKAmLUzV4NpD/iZKt0SLlKiWMhpo5BFzjprSZTMUVGSp89AAcFK1kRU3W
	 NSVohXySukHMw==
Date: Mon, 24 Aug 2026 12:11:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <e0decd21-bd0e-4eab-aa94-b9e97e7b4d7d@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-6-9105afd828ac@kernel.org>
 <vdmz43ogvmwu4liilfqzdrgsf5v765bucl7mybhfdxj7yrywkd@5mssukdegdwg>
 <02b970b2-dbd9-490f-bfc0-be10708e0f9b@sirena.org.uk>
 <q3lxbu2palhkejnkvncs2iili6vvkcl7boftn4snf4fjy6fhvg@ehrwmqt6eh3m>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TdbCqlH/hxhqcRtu"
Content-Disposition: inline
In-Reply-To: <q3lxbu2palhkejnkvncs2iili6vvkcl7boftn4snf4fjy6fhvg@ehrwmqt6eh3m>
X-Cookie: Accuracy, n.:
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


--TdbCqlH/hxhqcRtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 23, 2026 at 02:18:15PM +0100, Wei-Lin Chang wrote:
> On Fri, Aug 21, 2026 at 11:19:30PM +0100, Mark Brown wrote:

> > As the comment mentions it's not quite that - ELFromSPSR() in the
> > pseudocode has rather more going on in it that I'd managed to convince
> > myself wasn't relevant in this specific context.  I didn't want to give
> > it a name that would cause someone to think it did the full thing and
> > trip them up using it in a different context where those things do
> > matter.  I do agree that this results in awkward naming.

> Right sorry, I missed the pseudocode part. ELFromSPSR pseudocode is
> doing more than what its name indicates...

> If we want to stick with the pseudocode then what do you think about
> el_from_spsr_nocheck/el_from_spsr_raw?

Yeah, those names could help though given your other comment about this
not looking the same as the code in exception.c I ended up changing it
to this:

        /* Check the EL only, ignore thread mode */
        pstate = vcpu->arch.ctxt.regs.pstate;
        cur_mode = (pstate & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;
        target_mode = (spsr & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;

instead.

--TdbCqlH/hxhqcRtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMJv0ACgkQJNaLcl1U
h9CjOQf/QMmd6D+ASrY8SyYNHelRK0EJIwW4oBSv0gXC6TA0EC73stA7cfWcDeY6
U23YT5yN83tHNVoYDjoFrCutJf47NIZNcOJtQbUdTekGUcr5t/upVCOo2nrS5SJg
syjCHDN8fK+T/qD6u3qWQSbJAe/K5lr67Olv4W9Oxg+qwAiMvb14NtuSQWu+RLwk
hJpyPCK+UCYOB4XM3rEYX+6O2zkJa1SfhUHPdR+yGguBA7I4kAeimhpttufCkTTr
UDY/P7qmfzE5jrgnh/NFDKWxClVFO6Rh+N/S+Qre6cY9PVPT8G1A3n9HGPxYPzdd
n2Jqdfo3C3vbaigTCWrY2B4EwG8l5w==
=YW/9
-----END PGP SIGNATURE-----

--TdbCqlH/hxhqcRtu--

