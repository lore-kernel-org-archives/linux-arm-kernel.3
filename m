Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1309CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4S/Ek+YldPvINEkGsS4GtyzWXh8+ZPhINVzWN0ZA2A=; b=mE/iIZlYawO7WHbi+0qkkJ3wm1
	XY6YZigDv5lsdRlZaUS+OifhtNraA1ruDvnDnU/RTFjQxVetVuRfG1kaQyQ/UCapCDWvMsUQTTfA4
	IWhMpiBiAWOLM/YhE0K2PajEvX97wtpo6kvf81Nz4BB/J2NrSPrJaCSb8EiDa8QGckRuojYYLzg8k
	8VvDqgpY5yc+Lpn3qtWlZp/IIGqbyng5FnwbzJEo5Hu30WzADbtVGZIV/xPKn0cKkzPKW3E6o3cBx
	lTUWdqwgjCr2a0RoY+WHehSMQbed1wF4E196xo7o6PfI+Xh/N2PMgjcGe9HSELOkdhQkVlqDja5T4
	I+2huT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtqL-0000000EVvb-2j0U;
	Mon, 20 Oct 2025 17:38:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtqJ-0000000EVur-2Rfa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z4S/Ek+YldPvINEkGsS4GtyzWXh8+ZPhINVzWN0ZA2A=; b=Zq2AjZutfP/T4QRX+TJtuASLag
	sMo3YrVZ6JvF7fDOA6gbRlbdb+haCogsHk2HrvTVtXZ632lsQZG/Vpmpul/JQ2hSy2BWbmVbzXWiB
	HFV4yqc2PKBUTwLhPHD1VmyJFQykbmoIflPD4hmEEYrPwmnwIhBZnTQunFIwVGzjLiR881HV6/g/N
	JCowM3R1Juh34H4R16uhq12Jb7IKETSTKfOvUSTWRS7td6+Zfh8G7TdNSFVfmM2U8jFyg5oDb/E+P
	PwE1bPJ03/HAxDvpxM1eAH2lfPn1RTFFg7M0jMbSW++tMzgOMc6pC02MttX9Zma8gKnHRbD6KN9Af
	UtpEE8UQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsya-000000003Rf-1283
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDBD244DA5;
	Mon, 20 Oct 2025 17:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5607C4CEF9;
	Mon, 20 Oct 2025 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981922;
	bh=z4S/Ek+YldPvINEkGsS4GtyzWXh8+ZPhINVzWN0ZA2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aq+ctViSTR7UDH16588OT6tm0rAFQZjMOnoBF6DI6S5TW19K6WeHzqvTchnqWOEpR
	 zJy2DV6vf4h6BBDBSPNWOX/0Er8aLRKjmHJP6Hc7TuceEQDk7C546Ma8Oe9gaURoeA
	 7deoLDVg1MBbu892khg/huonJO/KjI+sdhZwd2TY2BMpdzY/o1wJiiHRimXh0XAGxD
	 8EAkwtOyDwCeQa62dyq9uqtAqkxYG7qPJOTa/G8uVehVIFTj+tc6xVFU1wwoxQRl0G
	 qEGPId1Xgsvdrhwq9AidZVDdneI7kji0pE1x1d4vpakwg8gmJidmGtzK0Cwo1hVftU
	 JB6tRzy2n4mkg==
Date: Mon, 20 Oct 2025 18:38:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add
 compatible for A523
Message-ID: <20251020-thaw-zippy-16c5abdab66c@spud>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YTId/bDtK4GXQ9vH"
Content-Disposition: inline
In-Reply-To: <20251020171059.2786070-3-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_174316_654454_6055D3F0 
X-CRM114-Status: UNSURE (   7.58  )
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


--YTId/bDtK4GXQ9vH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YTId/bDtK4GXQ9vH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZznQAKCRB4tDGHoIJi
0iiGAQDbeTZHOT/vrRa0955LNmg6Krx3j8KugyLxUopBb3l9IgD+LdsEL5bwP8r3
dXQ8jYpAE48r/+VJ7lDuXtTyDe6asgE=
=/dNm
-----END PGP SIGNATURE-----

--YTId/bDtK4GXQ9vH--

