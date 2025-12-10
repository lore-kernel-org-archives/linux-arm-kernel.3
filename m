Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D2D3C520
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 02:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVPsyHqROSnFExErxT9oq3DOybIszjm4nHBwKs5gkLA=; b=obZ2X7XH6Pp5B92enHxZ64dTXM
	aK5UHRZs6g8Mu2SF/Bv9yhT+rVRkkpEgRT9+eujclwWREM29zrRaE1tjhFrjWe+As6UchtlWv9Sbg
	pgjzJDr9Olaph1I0HLTTv27tKPUNTOM5wtbbVBZ+KTKgNvHQVlcjEVo1IATo9mVFCi6wWw2crRv2S
	PoRXqzzhDjC3Sxc7mfwlZo0DmiWih4rL2+8KstcWLfoYp/hQZ81u8KFjPlO0YcmnGZ7P7xUScvcCI
	AkeiYeIpsaOXl0M0QSkU7vt2PBOpSvl0ntt/xBmafY2RvjH0zdn2IbFm+2HDkad7voLbRSay3Ze5p
	rVBOdrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9qs-0000000F0Co-2Bmz;
	Wed, 10 Dec 2025 02:22:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT9qp-0000000F0Cf-2C9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 02:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EFA460135;
	Wed, 10 Dec 2025 02:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A46C4CEF5;
	Wed, 10 Dec 2025 02:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765333366;
	bh=BdZF2pNd4UIWn0TZnS2/oExdzTkeLzEDfnMcg2OQOR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gs06zghpqLzTxOlMoiGA6jMiwlvq+UADOE1DnQMhmYIAiH9dfmhXppHkd7jTOIOvM
	 o60UV+4uvP/ZZU9H1EnCRMXukPh7rtYrlp9VxoHq9ahIcHuDm4qbQs/JZAFnSS6Li4
	 A0rzwvJIrSnAqhpuA6mJHcxE1ffLvU4d2z9o/WtL4fuS8jIfrH0bIE/vqTrJJ4TMnM
	 mpVEtHuOHcV8SRZ/ZIvCF5UWiOhzSdGcLrvk/AVgCzT/pupFCYa9uQOnwPvf5amC2S
	 Tz3Biw7vN4skwOcLOr0daKLTs1n5L4cEcH1JvAtjIMzKQgBwluE1d8mj6zo5JIgPnK
	 ZKB1oPLrt9zEw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4E38E1ACB974; Wed, 10 Dec 2025 02:22:43 +0000 (GMT)
Date: Wed, 10 Dec 2025 11:22:43 +0900
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Message-ID: <aTjZc3mgu7CQOkDU@sirena.co.uk>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="er/1OtNA51My+cwA"
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
X-Cookie: It's clever, but is it art?
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


--er/1OtNA51My+cwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 09, 2025 at 07:31:17PM +1000, James Calligeros wrote:

> Imagine for example two codecs sharing a bus. When one codec is
> transmitting, the other must ensure that it is holding its side
> to 0, or data from the transmitting codec will be corrupted. We
> can trust the "idle" codec to simply do this itself, however
> this is undefined behaviour. Some devices may leave the line
> floating, others still may pull the line high. We need a way to
> control this behaviour.

I'm finding this explanation quite confusing - you appear to be
describing the situation where two devices simultaneously drive the same
signal which would be extremely unusual and I can't see how it would
work electrically.

> Thus, we define five possible bus-keeping modes that a device can
> be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
> (actively transmit a 0), PULLDOWN, and HIZ (floating).

What is "explicitly disabled" in ths context?  Why aren't pull up or
drive high options?

--er/1OtNA51My+cwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk42XIACgkQJNaLcl1U
h9Dvngf/Q8hLsUPgUG/WCbl9wKOoJ0KFzFLX0pXGLPoa5P1aal4uK1pP4erJN/7L
qegwM8H6BSQ3wD6l2JBGYmZJKH/UKEr3b+n7pFh4ek40r8h+Y/g9QOZknIHaTtrs
07areWAyrXXVr20+YcHlsKGmyV1xqBMNoMiA9r6cs8d3LRfNprkXzN9YQN2fcKcQ
AUJYg01zlsOkdjcoSeJFmnIhgv9klROT7xGj1gNmUKMp+lVUkRV3mHRr56g0enE8
Q5nWUQ4G2UqxNMBJmMVij7Oz3QHfuK8zwk/x3t+M/wXWkK5zSUo3a0ceJIH09u3/
0IX7nNttZTCXalNXZzVMtPnxRwCIbw==
=RadW
-----END PGP SIGNATURE-----

--er/1OtNA51My+cwA--

