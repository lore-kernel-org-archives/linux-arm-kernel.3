Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92624CAC580
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX2PcYPQSVjDwFmbWsV0OIUgomv3GNPXnvUZvIgd9ZY=; b=31JH7g9OV4DWzaxiclHSp7xM07
	RWtPDe/ZI19okDEfshbqRiurDJO1In3Pz5c/pSRkIKo32LwcbX68Y7XtLwvd2wrrjrKYtJ2EMsp9X
	xJX8dYmDpJNRQ5TonBf/eMul5WR29fMs9zNeggmo1QFdeb40d6CduDGm7lZGpMI7/VBhW42v9FMZb
	CN54IvNskYhQmWSviClGgbJMpjiBRyDPj8UyxgOwQrfbTibbnzeXpG+9SpUXt0EYvtgvME/KhMvKm
	hxb6XmYO+KQ+shAmsfpJV0S9dwW/jZ0pU7vG2aOCAhwCL3wiaOSLls3wpu8bv7IT/0+7cRcc/ODFE
	fzpOyF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturp-00000007dXu-2TtM;
	Wed, 03 Sep 2025 21:18:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqZz-000000075la-2rcq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ABE060248;
	Wed,  3 Sep 2025 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F85BC4CEE7;
	Wed,  3 Sep 2025 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756917806;
	bh=AkA4dzUeMeAnqy5b40dZ57UDlURr08Yuge2wOJ7h2Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bq91ZOLsPXtnywSL0n01fUFf3HGbluHxTTlrKq4YOWy+oSiYHQUb8lH9kDHubCn3r
	 y5gNxmYsAiIK3CH9q0yk0xu01AsEU/Z2pZd5Q/1aFa8aeKR+nrpXtcabeqzr+D502y
	 rByVLKZblyDw7pQOQ7L38CDLNJ++FfwiPvddveK6RIHLPtmnm3Y1Wug2f+9WiW/ryS
	 jhCmrok2BLBGvhmpUTx4plIHYBrLYWVV8nbwyruYul4jDYoHnYAd/QMJLYv5/anwR1
	 EctRN/T6egnHSW3kKkCMoImAJ772lynQ1mtEHt+K++Jlv0y7ubSfJw2lX3ZS5RUdY1
	 OFkdPx/DBKZzA==
Date: Wed, 3 Sep 2025 11:43:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain
 interrupts
Message-ID: <175691780521.2465839.12589280217452124752.robh@kernel.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
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


On Tue, 02 Sep 2025 17:40:53 +0200, Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


