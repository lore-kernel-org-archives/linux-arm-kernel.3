Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED8D109C04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrASyDXrPTRzOdXMt+rY87vftM8wegQWKG3EcVZsavw=; b=2jJNI6B0EHRj+gV/R4+lO4zvmu
	UkQS4Ic790l8Eyj3Mv5G1AOogA6Z8EHJ6GTxtuo8Ek74R4uxL1WYoyOgEGOAv2qSxlxSbvcD0CoNf
	BhepA1dGGmYY0b6ct+xiS9IrFPRtfxpdF2dK+SJk/3xFlzE1CHD7pKUeCs1nzrWlN85uLTk6Gx3v8
	Ldh+PwA6YRRVpMgbQzaKgEpenfOj5cnEZcdocxshrG1aVQNWh4NhTdvogD1zg31EumD/Y6MW3WX+i
	H3+S3J7jLXPvaQTHWEtta8S9y8kOGhUiQ3OtecUqSJ/kwQR5poFvqU0zdwDMbM3EaQkCaoHymsY4g
	NEGIFRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sd5-000000042l1-0eAI;
	Wed, 25 Mar 2026 18:06:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Sd2-000000042kP-1UUe;
	Wed, 25 Mar 2026 18:06:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01347434F9;
	Wed, 25 Mar 2026 18:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1384AC19423;
	Wed, 25 Mar 2026 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462011;
	bh=NrASyDXrPTRzOdXMt+rY87vftM8wegQWKG3EcVZsavw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUU+WkdGqhPPGBJsyxlRKgS0WHccD27F+kY9qWgUG84BLHPPtNPWCGQoCOk3YFWXX
	 V9vPXLoZ0Roax9hgRmUZ2qlbxZpoZ8vsYPe3HMkLaEB1bpKgkZIXu9syWEB/whji4C
	 fRMlKI+MnZWtlCX4H3el/NZLyHHtdF+pcdyUt2xN1n19Rocynt9flKl74H66r+EmNb
	 NrwXGDDKNgKtyrm7TID9cyxtEKTSz2xr2CmsJzm3DXwz8wOnV9Tj3LavZz5XtD/UOu
	 mIbUJ99sSOq4eLYnbdmpJw67p39qmaLom0FUhjoED+uvH6G/Tlc2VCXMH9FnV4OJN9
	 CepO2tOLvWKIg==
Date: Wed, 25 Mar 2026 18:06:45 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260325-goofiness-smoky-05a9da4ab7c7@spud>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
 <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S07loI5ARDnCLB+6"
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v3-2-e38e428868cc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110652_404767_26DAC29D 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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


--S07loI5ARDnCLB+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--S07loI5ARDnCLB+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacQkNQAKCRB4tDGHoIJi
0trSAP9NhcSN5IwjQxra/MoajEVkzUk285uvd3tnxxt6xebTeQD40Ti+GjJ8RBsz
y/CiyatNQxTRh/VP0eEHfoLlCuj6BA==
=yM+a
-----END PGP SIGNATURE-----

--S07loI5ARDnCLB+6--

