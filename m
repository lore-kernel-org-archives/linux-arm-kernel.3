Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F07CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6AnaVW0ZV2bZhNVW8y09FERUFZfx/4V3uxv731vMxA=; b=MsFPHhtVUtZyqn5w9PmpxbiJqY
	znha1NJkmqPcbeA+w1JwkrqsB2vhRiLMF0IFTlSmEdyelabJsXpVebpwaMuL9N5YAO6spvqGt2z8Z
	rcbryEU+1JIZkb+B8Z1GwnnyNlFP2ajLv/jz3QFUoOM7P9o7j4cD4O0myh5qZXTBc5KE5tuu4d665
	DNsv2OG+GdL9yO/VqXRPmK2t//YlA/q3r3SY+kw1/tCNrS78p1jBXWKjKhigYzMfhRXE/VUHnCD2A
	nNQ8aN3n/7EjWDVByBvUA/9utUAx8HldokuYA4Ag0hjG8hI4fSEpPxtidVAgkMHeCoqqHDfpIlnOH
	Ub2Q1ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzCP-00000003Fgd-2MeQ;
	Fri, 15 Aug 2025 18:30:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxOR-00000002z3H-3g5V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA5D3A57FFD;
	Fri, 15 Aug 2025 16:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A871CC4CEEB;
	Fri, 15 Aug 2025 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755275702;
	bh=c6AnaVW0ZV2bZhNVW8y09FERUFZfx/4V3uxv731vMxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZNTpYrC7uzJh4JhWIB25/N0THV592WApA7/xXznh7slnR59Co2/zY7/8b6kCpJNS
	 MlrEZvJHoCuVKG0dxOCkt/hunVvc0E0BJvdlurcuX7vx4Zgv3wlgVIL/UQdnTSLB7g
	 /qeO+9lFZW/8aaXVYzgAkU/sK68tppao0BRif1IB/zyKQDqezz1a5cFnYkMWQQxv84
	 zAMIq2DhtU8Duc4x60N0tAzsORG856wiaMSmQVs5rbnMTdNEfaupAHTG822+A9fuSm
	 X8ZRuSmnf6u9M0RsYu8uJK2FrvK2iq9r5dKhqWIhDDa0IduC5p58a5d36HzsQwofJ4
	 36JxKZTfKtGdA==
Date: Fri, 15 Aug 2025 17:34:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX94 compatible
Message-ID: <20250815-eclair-expansion-1a680769045f@spud>
References: <20250815-imx94-ddr-pmu-v1-0-edb22be0b997@nxp.com>
 <20250815-imx94-ddr-pmu-v1-1-edb22be0b997@nxp.com>
 <aJ9ftYVhcuUsKoa3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cGjM10/Wt+uqqu9p"
Content-Disposition: inline
In-Reply-To: <aJ9ftYVhcuUsKoa3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_093503_982383_CB4E01EB 
X-CRM114-Status: GOOD (  12.80  )
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


--cGjM10/Wt+uqqu9p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 12:26:29PM -0400, Frank Li wrote:
> On Fri, Aug 15, 2025 at 05:36:27PM +0800, Xu Yang wrote:
> > i.MX94 has a DDR Performance Monitor Unit which is compatible with i.MX=
93.
> > This will add a compatible for i.MX94.
>=20
> Add a compatible string fsl,imx94-ddr-pmu for i.MX94
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cGjM10/Wt+uqqu9p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ9hrQAKCRB4tDGHoIJi
0vTQAQDnyoEjdwJ/vnNuGgwM/Xitf2HIbielj3wLvSJIhkhZAQD6AzPZ25JuX0Pn
MFuj5SHSUlrVhHFslCuT1dCkiPp2vwU=
=ewOy
-----END PGP SIGNATURE-----

--cGjM10/Wt+uqqu9p--

