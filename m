Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB2C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV+N2rbqXYmmMk/YyAnKxUxPZrcUg+1PniBKpcv0qKo=; b=QwgbDGeX6SoUn7HGYSstMBYzBA
	5o5P46lRbH4mbnOfk6xrKVZTeMZm9C78EbxAaEdqVYp/l7ZcPytutnKesJ5gyI/VYo8Cj+F9Uz2J1
	Iv6tjFMWQMqgZP2/RcsnR+HM9pTENG4/xQB+7vALFq2jjezdTSZ2CNhj2HckWr3u2ADoO2wck4iPd
	+uBQJiSFW9OyGG1DukM1YiGXTk40AlI7S63ZBx76u1sKXIgSTMKlBadlp+KNNRnH/66kPnwvLcLmf
	+fkxMLu7B4zk8belxcfi/79x1VNWVLVYaBpNJqOg06RWp5BhTswzPwHDE9WPfcaq2jAOyWFmc+j1N
	cwy1G6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXUY-00000005w33-1gk4;
	Tue, 04 Mar 2025 18:59:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV2i-00000005PYf-0aLF;
	Tue, 04 Mar 2025 16:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EV+N2rbqXYmmMk/YyAnKxUxPZrcUg+1PniBKpcv0qKo=; b=Gi+/XFf+EFtOdyUiRsMuNx+cSS
	9y0saL9m2XyZz54ItrS+vgCODmLfO1t6ovQP8Z5bRLN8VJ+L7gfuUFZFiDyKofZZLOQJSU4o7CvCo
	Om12OTXDdrujHtYVN75o+kaKNuzJcRTVbPdEn5wyKYBrPPOVdyQX8bJPrZxqXjDU0nqDni1MEruK+
	SW2U2mipZNRX7rKwwK0Dg56bjMyZB1rFwYOz2sbFqthmFF7aNFNBqG/F2okUlKCVi/XqJV5kI+xN1
	Vmwv7EDteOqxu2fSJaSNswn9juWNKiXUV1XuEsYHIzfod+b2MaWIKE0Vx6GP1HvIPDjp3kVlkzITJ
	3K1LTnHQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpV2e-000000005kW-1GCl;
	Tue, 04 Mar 2025 16:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1032EA45921;
	Tue,  4 Mar 2025 16:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A2AC4CEE5;
	Tue,  4 Mar 2025 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105366;
	bh=EV+N2rbqXYmmMk/YyAnKxUxPZrcUg+1PniBKpcv0qKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXSPILMiDbG1+OfL9Hg/8K3LiBibffVc9koiFnM2f4SjX85WZqd/35e3hGmJFVart
	 EZIXyoz0VDyoF/0hTkc0OrscHyyAXkZ9jow3TbRh25hxg7YJXDa19/gDb1Nqz+J39Y
	 wr033y/xY+yvcEKNMbjabpzp6KWPy1+I41dskudD8nPLC/OTlAuW+gKf3tFdZbZfpl
	 30wIoXqtQvy6jYHh8Z+1ytEScE0DHg1+05nRc64K8sHDeZh9BxZoty17lTAw0VwKhg
	 H4jjg4Q0AlTNPvhFbKe79qzLoe8wqXzZVZAkQcqXHXuKNjyDCogQ+/06uEqKQryvZB
	 MP8nJPK4HxjXA==
Date: Tue, 4 Mar 2025 16:22:39 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Andrew Perepech <andrew.perepech@mediatek.com>
Subject: Re: [PATCH v3 03/20] mfd: mt6397-core: Add mfd_cell for mt6359-accdet
Message-ID: <a8fbb536-a246-4650-8085-d576652b0301@sirena.org.uk>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
 <20250304-mt6359-accdet-dts-v3-3-5b0eafc29f5b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OLmxqaxv809+84Iy"
Content-Disposition: inline
In-Reply-To: <20250304-mt6359-accdet-dts-v3-3-5b0eafc29f5b@collabora.com>
X-Cookie: Do not disturb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_162248_694885_D5AAEADE 
X-CRM114-Status: GOOD (  10.29  )
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


--OLmxqaxv809+84Iy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 12:15:44PM -0300, N=EDcolas F. R. A. Prado wrote:
> From: Andrew Perepech <andrew.perepech@mediatek.com>
>=20
> Add an mfd_cell for mt6359-accdet and describe its IRQ resources to
> allow the mt6359-accdet driver to probe.

Lee, is this OK to merge via ASoC?

--OLmxqaxv809+84Iy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfHKM4ACgkQJNaLcl1U
h9AGawf+Krbqa+Vm4jfRJRkHk1Bz74IQ/DHedsnpuELy2Rv59vOzi/ONHxJ/Vsq8
03MvfgczYs8uzSrfII7fto16qxrsRaVGeTkSaanOAZHhFT32ytipNw7CIa03tchc
8NtyjnLXMDyBqeEuzKVUTmzp5DgA57934vPFsBXP+jix8i0IYKthA2mFxcIVk8AJ
npoP45KaBxueBRiIbQ88nbeEWMk2zpCYaqDQxeBCROSqF+j+VlV2V9/LFr9nmGla
fXrY4hD9vRT7RUs7od+v2zpfnn6M4dMqA1gEIoZq5b+NQ3BlVHug4uHInjm7QUqN
XR/caFRH1sjlz1NMYvElHtzG4TDjtQ==
=ZRYJ
-----END PGP SIGNATURE-----

--OLmxqaxv809+84Iy--

