Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CE5CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSSkPt0tyd7BePBQ11bLsPWDs6ALcf5DvYsfQdZG8n4=; b=ILJdlZEFA7NdWpIif0Qn421aPq
	7NHgm7uRHkO8HoKOwAJAh8nGTmnRrMRJh3tJteKj5wg16DUV3Fkrh88SFj4Sn3ZcUflOSKvbZ/Ivs
	Uzx41c7G6rXJcc/sDI616fIpbHNr4jkUO05lEGfFoEZY/iVJorYS2FUdEcVAzQUCzUkmoEAJd18dw
	gEL0Ec5A8amjCBlA6J/JSyk51/yIEg4SPzEz/2wSdbXFYwJWC7z0nGWeEGrIKncVzpXsSzY4GbZhD
	2TQZoZA+05Y5aPErOVOujfygPE5jZFpUZCM7GLinzfHCNuP3N8XR+o901XcQRr4DCnP35Du7lqyJM
	qF8Ts6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEGq-000000012Q1-42r7;
	Mon, 28 Sep 2026 16:32:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEGo-000000012Pl-3V0H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:32:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 845DC433DD;
	Mon, 28 Sep 2026 16:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606F91F000FF;
	Mon, 28 Sep 2026 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613122;
	bh=LSSkPt0tyd7BePBQ11bLsPWDs6ALcf5DvYsfQdZG8n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpNXrGFnb9HaIuC8KX+e1iSYACFonoGQ0XWZS0Jcu7fAbYY/0JFYUISitpzMeAumN
	 kzlUFfKyoXMMm0pixrV6hJcU7BE4QZk88lJ+QiX+FPnePwDm5fyD67vn5zX22lAGqS
	 Pj30lD989kxJg3QZwidBzL+PiG5Az2MOsktAxVPi1HH+yaMKJLUx67ebxL2/EbhTqd
	 JttFmrpIeh7P9efWcxk0tcq4ct1PhGu7NgzjeVhiTd3ARNba+ataEd+qF1oX6paRtF
	 nbbrjoVuFG01AlYzLZdhQoC1UmsZ3nBcZMlhpwF9hGP/bmi+ViviPcEInsV/nT2j8Q
	 3CL+lz7I9f2MQ==
Date: Mon, 28 Sep 2026 17:31:56 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] KVM: arm64: selftests: Check ID regs are
 immutable after a failed run
Message-ID: <83a389d3-6328-4762-a96f-46f9f7145b0e@sirena.org.uk>
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
 <20260901-kvm-arm64-idreg-final-v3-3-a0ffa06fa872@kernel.org>
 <arp7mig_PrD9Jbc7@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AAMnBzaO3gKbG6DA"
Content-Disposition: inline
In-Reply-To: <arp7mig_PrD9Jbc7@gremlin>
X-Cookie: All is fear in love and war.
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


--AAMnBzaO3gKbG6DA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 03:46:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 07:18:50PM +0100, Mark Brown wrote:
> > From: Fuad Tabba <fuad.tabba@linux.dev>

> > Assisted-by: Antigravity:gemini-3.1-pro

> NIT: we changed the rules for the Assisted-by tag, it only needs to be
> 'Assisted-by: LLM' now. Not a huge big deal but FYI :>)

> https://docs.kernel.org/process/coding-assistants.html

That's Fuad's tag not mine, I've just picked up his change verbatim.

--AAMnBzaO3gKbG6DA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6lnwACgkQJNaLcl1U
h9BSHgf/dsZOGOdrRnI26oAZQKyMEaKtzUE+S6oc46T6NARbYeekbnDVX+NeLJr3
hKjGjgbwagGXC7mYmPcOvunoatLjeFrgga/aOwpJqB5gucMNB8O5nQtyx6OWrKH4
Zoom+ewSdp5kuH+pVTu7IGFQQmFNbeHI3hD7SFxwInLViJaRP0NGOF/N+Rg1XhAL
jdvpj10jddzOQ3gBHqTktod5VGImbBz2VNxcSW0EAGQ3bhQS+vm/DNmkxDksnswS
m/Brc/kZfm1Q/UlxXODXX9fu00f98IoxU4YXCwTcmukOUc15gI+xK6JD4+XZ5UCZ
6NpGPSsLPeWNUOcBDeV6n3fWCYmiQQ==
=Y4zb
-----END PGP SIGNATURE-----

--AAMnBzaO3gKbG6DA--

