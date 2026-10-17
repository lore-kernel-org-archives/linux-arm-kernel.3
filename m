Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22ADCCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0pT3v1bP5u5egIRZK8Pll14PDueEtMuF5Fy1J42OkM=; b=HUMY2R+T25aKaPrDKYNOnymPKF
	JxDZvShV94JE6WNUQZecJIBesi2XMJGwkiWJsVKoMLzAscDWzDqQcvoYLoTcmW6ZwimOVpIcxTG8q
	uvYWLvkHJYJHtUS5z1CsA9ny6fWOLQuBmanJWnSWD+0LplAgP6QqzShNpKe5dGtkzXCOkkqiBHRi2
	FdgVDNHUSeTTzagGLWpEfhTr1tZ7UzprOg92YJ8P5VJFziQv2fvWozODqKo3VMI5p7eZbEFgSL4IQ
	+FlIYm8evs0RyoV4QuHO6bhFn6LERRStHDH8M8XpP1zDo5cjUGeGFryVCCS5mqBnf8zqJO/SE9Wp9
	UetWz03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8US-000000051YV-23FD;
	Sat, 17 Oct 2026 17:46:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8UR-000000051Y8-2vbz;
	Sat, 17 Oct 2026 17:46:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12F5E42B0F;
	Sat, 17 Oct 2026 17:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF90C1F000C6;
	Sat, 17 Oct 2026 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259199;
	bh=W0pT3v1bP5u5egIRZK8Pll14PDueEtMuF5Fy1J42OkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1ccYreFRLXizIIFK9f+52h0P5q33zrnJPciwiNz7DB98X9XEcFb3C+pypdLey462
	 xL0UALMtlGysgv45uecuQEtImEA54aqWjcmLbLm2U5VlG8vOgYVYcSXI4MyY00N5gQ
	 Fu7RMxYhROAuvoI4RQ44m4X72KKHOp6cl48GEtqklQy0XZX5zPqkLf57tAHLl9+g7B
	 bzWVHvsrcWVGPPU6KoFCk9mWX/dA3SyiNJw1H82u4Hz6Nwk8i+0pf9VRjFPpZMAyX2
	 x7Hckhd7G1Rl9Yiy03KfH/p+ab6lEudh5HfE70jBE1JJOroTX4G4cc+as2IbJZ4u3V
	 HH6eMqZ9sLziA==
Date: Sat, 17 Oct 2026 19:46:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao Huang <biao.huang@mediatek.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@kernel.org>, kernel@collabora.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 1/9] dt-bindings: net: mediatek-dwmac: fix
 unit in rx/tx delay property description
Message-ID: <20261017-imperious-prompt-wyvern-6cb00c@quoll>
References: <20261016-dwmac-mediatek-mt8189-v3-0-25daf2bbcf35@collabora.com>
 <20261016-dwmac-mediatek-mt8189-v3-1-25daf2bbcf35@collabora.com>
 <08b7abcf-a738-4ad8-956d-a6205046151e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08b7abcf-a738-4ad8-956d-a6205046151e@lunn.ch>
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

On Fri, Oct 16, 2026 at 05:33:42PM +0200, Andrew Lunn wrote:
> On Fri, Oct 16, 2026 at 12:31:05PM +0200, Louis-Alexis Eyraud wrote:
> > The "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" descriptions say
> > their values are in nanoseconds but their names with the "ps" suffix
> > suggest it is picoseconds.
> > They are in fact used in both driver and devicetree as picosecond.
> > So, modify the two properties unit description to fix their unit.
> > 
> > Fixes: 150b6adda6b1 ("net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema")
> > Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 
> Maybe this patch should be for net, not net-next. Documentation fixes
> often are. Lets see what the Device Tree Maintainers say.

It has no real impact, because the schema is what matters, not open
text.

Anyway, regardless:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


