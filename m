Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7FCC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Kp4Zi09nuv/kuORUiQJl1dYvW4RXdPB6gTsNvTY3CI=; b=B/xOFk5/MUEq+YGfpTyIcahSzG
	7u5eQq6JdgvQCqc75t5fRNCyJhvyt/KP7XJPO9fWq1geMi0jbAZNp+k3PFhJJoUql7DF0LtCFHsGZ
	NilV/l9F5uvAi4fzVMlTcF5EmoSF7WZqblIirjoszkTrfXwWUPPBCcx/O0YTXBT0g4taDjWU/ysT4
	qxemqkXUrrtS2W6rSUqyLgig+ZPOo6lSQSpyrsGiVIENBozP3KGOfa6MFLGF/vJR2WwYROtWAHRLc
	ec0E8u9pljUvLioUdfmBZv08PNiTkohepycjgORvYV26lsbJKheTS69XQiajJPkG/ESd4B+Nbx+2z
	992kDsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thw7v-0000000540u-3gj2;
	Tue, 11 Feb 2025 19:40:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuql-00000004p5R-2qEi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 18:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Kp4Zi09nuv/kuORUiQJl1dYvW4RXdPB6gTsNvTY3CI=; b=l9JFgqQMAay4fHOA5w9xWBgN4q
	a5Pdwdh2lVhxalf9SMTWXwxjZi1CKgj/mMbMm6EJYg1PxFf3HQY0kSqNjCj59VvIWSU3GK9/szr5B
	FPNRdVPEBcPOPXGgoe5CMvHb5lzUeSp5K/K34aUBWkn2qTs6Ow6ctW4zESBsqJk7Gi4JteXh9P002
	ubAQa8vHkKGDbGyggVpx2+Ittqq6Cwufac/xnJw/hQKzfqn+UXI94l1kpfyLXEw0sOoSNn+eCiDHD
	B0/XNeHLPHzFY/K9t1sOH7cJyxxjCy4NC6ScGvzDiWePCjv/MGj7JBQk6juOwww61E8KGACC4Gl6Z
	lu8vY7dQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuqi-00000000flJ-3Iiq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 486EDA40BE6;
	Tue, 11 Feb 2025 18:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A9DC4CEDD;
	Tue, 11 Feb 2025 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297945;
	bh=2Kp4Zi09nuv/kuORUiQJl1dYvW4RXdPB6gTsNvTY3CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAz0HdbEmfMot5nLBQmD75IFwZRqJATTQq+XEA3Py2vGD1Y9HmEUKepf/qOXfc9iU
	 eJxbJceHVdPWesVXvMENGYpvvcUIC8aNi9fl4twGE7BzlXiF1B5lGnNV62HlbBvnIU
	 O3tSBq3S4UwGgX2LrAm0FeSKAlD2+d0iCvdIhmgi85LaCLrBcvqPfaaqR7SsPU0fM+
	 oD4XYMbVHToR4eFWAJNoepJ6nxla44PrtwOQGlbsCcYxCoSnsJ1zmHvbjWBEBpp+K7
	 gCk/LRB1eUx/bRPAUmG0ONlMb/Om7TIg5tR3Hna7wj+fV4xtKh3xS/DAK7F/vuAixx
	 LK2/f+gwqvqeg==
Date: Tue, 11 Feb 2025 18:19:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: stm32: document stm32mp235f-dk board
Message-ID: <20250211-surviving-bunch-f4de29898d71@spud>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-5-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ueo0e+SD1hPCV0MU"
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-5-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_181909_041102_2172B4DE 
X-CRM114-Status: UNSURE (   8.26  )
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


--Ueo0e+SD1hPCV0MU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 04:20:59PM +0100, Amelie Delaunay wrote:
> Add new entry for stm32mp235-dk board.
>=20
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Ueo0e+SD1hPCV0MU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uUlAAKCRB4tDGHoIJi
0nTOAQDJ4oscU2Sfp60SfXJoCMC3ARGWSbzSfjc1JO2iL40lJwEA3gV6SLlmwCn8
9am4zS12tt9N3U9+3EGMeTGdy9mptg4=
=MiP+
-----END PGP SIGNATURE-----

--Ueo0e+SD1hPCV0MU--

