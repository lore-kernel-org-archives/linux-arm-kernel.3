Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B5CE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0fTBAhDNi30ZiveNSC2Lpo/JAJCaVSZ9YnuZFTHPKM=; b=PalwFNBsHN5WZnUBpGH8SCix7N
	ayhpaVVtHy4BEJ66uwtiVyDy3Ygbavx3Tbmg/ifiqE0AU/UrfY8zeyJjTWQ3B2ZWyq8okkSLyMNau
	kpV8Z2hKETlwYQGVzUQmh4S3dwiqWkxrNUBXxZvF/GKVE92fY3uY1UkQ0m15oCcCjJXqA0gE0d2Rd
	XRhAjTJLB36wCjnZlS/BwhZVCPcXmY4oRzHvUfJpf8/7dba4xrGvkWZVmaNHYfQCaK87vqHfeqGhN
	Cea/brW46GAabRDqdsQe3qEnVRz94UNr9o40Cl/IVvqGLlBA/8tWnNXyhWMHKWO8jtlpWqIFGm4WA
	3YNWnfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslCf-0000000AACj-1PJe;
	Wed, 18 Feb 2026 17:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslCd-0000000AAC9-0Kk1;
	Wed, 18 Feb 2026 17:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4494940604;
	Wed, 18 Feb 2026 17:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFC2C116D0;
	Wed, 18 Feb 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771435146;
	bh=S0fTBAhDNi30ZiveNSC2Lpo/JAJCaVSZ9YnuZFTHPKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7dSoJuCxUkPsEncIh897UzPAaTgj1+/9sw+f0UWptWSgk2VGG7CKRoBIvbcWGyWR
	 RgZXi4zzsS/ytujZ5iR3gnuqAs1ekYEwh64va5fkV5WsRDI7kuZ+IP5UaPGZ8xET1j
	 rAGEpkWa7u6BV2BorFFU+tZwo8gnXAlPqDyTCIBS/h8nuCtcoBu6ClKsyp4+ltD5NS
	 O576T1IM+yb+llkuJxPj7m6l9wcavmru99wUA915+y7mgtkuwzKFf05jY7k5M787br
	 JsqJHARQmpyOzf1wOZ0jVgkkVdb/5232cl7yP13Fhmv9+PnSE0j54YXmru0a7+uA+Z
	 ReXM9Y9SjjxqQ==
Date: Wed, 18 Feb 2026 17:19:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <e8e910a4-9aef-4bc3-be74-b4f5bea34b74@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
 <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
 <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ClagwaMKz6Owmro"
Content-Disposition: inline
In-Reply-To: <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
X-Cookie: Avoid contact with eyes.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_091907_142143_ABC4CD97 
X-CRM114-Status: GOOD (  12.79  )
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


--/ClagwaMKz6Owmro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 12:17:04PM -0500, Detlev Casanova wrote:
> On 2/18/26 12:10, Mark Brown wrote:

> > I did have the revert queued, but a fix would be even better if the
> > patch could be sent?

> A fix will follow a bit later today, then.

Fantastic!

--/ClagwaMKz6Owmro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmV9IMACgkQJNaLcl1U
h9A7gwf/RtuvltR1mZBShBgbGCsz9B2aFV+qgtr2HIqmXkCpAZpdxP+2Ap7NYtiL
JXLLlTWhfLTpXTLqgtd72JAygDIk7qosUlpO7Jhq5Lw9gb7LKjoVRXah6kKVbkXk
ichk8Co/qpwWOzmZDCAMufb4QoAeqh12oJgYq/80/f4rHdEVAlWpuW6cNSHtQ1am
MViCp5PxhfSdRJl9hFGCppL0XcWSSS1cmp9EwR0PxI9OCDb6G5lr9K21Ew7MtCxr
cFFjGW0zNFrnE+fNyduMukolN83waE+jXM14g10IMcPhcOOV7wcJm/cLvnmbU7eZ
twjYnbmQ3+M9RVvkt465azbx83WnWw==
=XIQV
-----END PGP SIGNATURE-----

--/ClagwaMKz6Owmro--

