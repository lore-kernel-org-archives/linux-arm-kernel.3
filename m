Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF63EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyV4X++/VGEzxaguebcqSjDqRWFXr+hAR8/E84bBbo4=; b=iCm6J6NqCAtZgfjJ+4pyj3lqDA
	bENXlhxuZXSuahzSTTSNq1No5uZdT4eJWbBHQYg2K1lvK3jmFBO3KaXf1rhgAYZOiEZmxL06kwdS3
	6ZVQlUA7lPRrel3qp7xcZaCSZBKKmdtdX1wZ1NdqBV1nwQQzHexqEv64m2LuPqlx/uuFMWO9hUyki
	7J57dXoeQ9VrU9uvlik3z6fFunWB7OAldmPX5DVYi9iK9BGpBaBZmcmY2FJIUAP08CPfuvBszeQke
	X//vjgs6/EQ366ATVoghqTx5nMCqGW4q/Q7Ewjg8kV6Epm4fmPL8Thuf1KL4ybcv8Z7eTNooeqzVq
	nEfFUlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAKA-0000000EMYs-25Mp;
	Fri, 11 Jul 2025 09:45:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9GX-0000000EAzP-2s00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D841EA54D0E;
	Fri, 11 Jul 2025 08:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DA7C4CEED;
	Fri, 11 Jul 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223076;
	bh=eyV4X++/VGEzxaguebcqSjDqRWFXr+hAR8/E84bBbo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ip9QS0q1Oh7taDoQfGWcgwPMmN/hoN6SmTPcIcH9mZ1EjLwPjZC+5SxmrHICfI/Y+
	 Hkyqi9EQoNA0FOfl6OBmW8rgypMiyHSGB8wRoVCbljOJ6eoUOZU7n1sT90PP9KrqZB
	 akE6Oef7QNgRjYuqgumt3epv/VBaVmxVx3369AZqOM2t/5tmv/JsO3Z8EdkmIeD4tI
	 gwnmD1cc94RLaa6jS667Zh7lkwj44Hy0Xkk7dGc/rekbhlz+FKVgOw7W3GKrFbSMSr
	 4dATtbLHVxzxiS9Apilik6ayWhjZSVG62W50oTDV6NtWc95q2NycUTwM7nPoiLazlu
	 85FwllO+rm4Fw==
Date: Fri, 11 Jul 2025 09:37:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Message-ID: <aHDNYFdAefD0iiyM@finisterre.sirena.org.uk>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YnpWRE/TMlIzvZ9t"
Content-Disposition: inline
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013757_787870_44A84A83 
X-CRM114-Status: GOOD (  12.58  )
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


--YnpWRE/TMlIzvZ9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2025 at 11:51:06AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--YnpWRE/TMlIzvZ9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhwzV8ACgkQJNaLcl1U
h9A6mQf+Mw4rOQ3YyKPyHMvM67lMhdwxJj81LDMaZnJrgOzRgYNwVehAF6z/3sjh
qE9RvCkeO6G1c5ngoFta8gB3Ba2chjtNsYln9QP8sxMhhzsQ/7hiiykf6NxALakJ
DR9tsOcL1vl2WKaCZ1HitICcSuWY6cLbTUpH0q85mv6rH1AJ0WdN8HHIw++p6m32
NMwkqwyG8z677hO9RdI1QwT4itEoh83UzLWoORxBTto7L/WnyP4uFrT2XefgEjE2
tBWfG9WPoG8Howvt2/8o+nnLbVwOnxeXkPE4TfC01MyK82f9voFg2EHSpuKiR9Gf
Gu40mCfxcvb/iKz7V9zpon/05BytBQ==
=OeRb
-----END PGP SIGNATURE-----

--YnpWRE/TMlIzvZ9t--

