Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRlpI2716yzksWPXXIQtxpp7YNKLHi0X+uq5w96Ah1Y=; b=VaAEmJ0Ci4CRhkefV6vz4rIZB4
	P/8KYkxFV6CPglBOfRviDXkP3SiIb//Et0eGdT24lfLVNrC0yWx1smRo+Q/Gt3JRerbM86QjEbBaP
	ltD3Xft+5uWqOUjbx3s+m10AM0mw5uZmqV02CkE23CFhBSPaUz6vEXdmitr8AElLyFv1Z36spcwg8
	uPKDKOXnameql/uzGyMMV5euNxOqWxGAgp0N/7+RC7h0kqixbrlYinIeELFYB6F/kUQNg78CFGG5N
	svAuQOhxyulNoP3blgnYjigK+hvYuUVTwNQ8HGLFuv3yRDqHLScWqZ/TEIVFyIyIG7XvGFCJjb0mO
	3hlsFzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8zd-0000000Dyan-3Vtj;
	Fri, 25 Sep 2026 16:41:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8zc-0000000Dya2-1ap8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:41:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13B054062B;
	Fri, 25 Sep 2026 16:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D0A1F00893;
	Fri, 25 Sep 2026 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354508;
	bh=YRlpI2716yzksWPXXIQtxpp7YNKLHi0X+uq5w96Ah1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V294LImQLX/sK5v4jTqHiyy0GICCw/Btx7xgTDrQEOSgNb3nb2kPEvP6oLE9ZidYp
	 B4zgVFImxYfCoaGzp/mdTU64hzs64B9s2O5rPmAWfubR53F2Fy1vktizl1Jr4PHK3t
	 b7zzDOSB2AMab6k1T8frKdeCltp5kW79W2Mdu6+RpSkpJ0Q1T/w/4vc4OW4PvgrKZc
	 LtHkUPCoH0zTeVKD6fIRzlKpvaxLILOpbosECr6fxM2v1QX+4UpNFAWFIkk9Vy/vot
	 6YFm8FFOhLEi2MaAcPbsYdIcECtHczEWYnrXLRre7VbuHoFTt4n/NOyQNlquRe3Rxu
	 5JaygrPPyuPNw==
Date: Fri, 25 Sep 2026 17:41:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX
 define
Message-ID: <20260925-zebra-overshoot-8092235f70c2@spud>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-2-f3697553391f@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="glG0NR2q7tebZ3BS"
Content-Disposition: inline
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-2-f3697553391f@bootlin.com>
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

--glG0NR2q7tebZ3BS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--glG0NR2q7tebZ3BS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakRgAKCRB4tDGHoIJi
0lVoAQDLzgm7mNihUnys36ssenR6Ful6fCx/okkkTDAZAY/iNAEA5otLZwGvz+++
7ERwZrI/Dxar8hFGdEbuGm4v+vZ+4QQ=
=OMog
-----END PGP SIGNATURE-----

--glG0NR2q7tebZ3BS--

