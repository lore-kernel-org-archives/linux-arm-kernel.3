Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646AEC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5YPmFtZG2zCjcC2+M+V37X7Um8tsyR4j5Qh/i/e6B0=; b=0tDVtGTenhu/bzi8ZrXvFPVjAA
	v3hrA92ZvIQx8VRnFQ24TMbk6r61HBtBhI3YShy4v85m5he2CAmTTp+pI7SXK++dWS0nIHZ2FjNEP
	u9X5HruwdxQn23Iyo/hcYkqT+55tmzBL7hnrxrYM0KDRiU4qrHlQNAbecRvU9f+HC0NaGYTh32RN3
	YnYpgekpZx3gT1BLybEqESdR5TCx9mXzu6/+OAF8GDUXcoXApK/72P7dTApsbf8MClVNYuMvR6y4V
	fuu/UVNZD1v+MhkOd091FPi37m2snuUvMqZmw8r1ymcjEU5gRooeJrty39/c0vQY5UaYin1JUvSdi
	MQB8Y0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuF5r-0000000GwFH-1sqJ;
	Wed, 12 Aug 2026 19:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuF5q-0000000GwFA-3QKE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:58:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51A3C434DD;
	Wed, 12 Aug 2026 19:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A961F000E9;
	Wed, 12 Aug 2026 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786564709;
	bh=o5YPmFtZG2zCjcC2+M+V37X7Um8tsyR4j5Qh/i/e6B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0G6wWDJgixYjcOQrMbQk1Fo/DFF///H43Kl8QWgfl7n+/i5tL3jyK0DktmBNGysU
	 3EMifcz1MRRuluG5BqMrZWRfNvQlfrjfRI4/qf4b9ytD0mTUtUKERiTO18UNKMu5Ib
	 WrbjJESeb3ze4StqJTuycpgAO7C/tpdl+2gPGJOlHbH/bx5YKOiWxRFrSdk92pqvN+
	 6J1HxC1oULa+HFZeVXt4z+z0rsKCJD1TQvtiP5SLe9yPWo6HhSm1CQgaaWYryb8wz6
	 sFdtij7FEupcU8lL4ZSsJ6H/eJ+Yl2lDBcVKTN51CQK6odN1LHmyJ5kSUrrqtH8bTQ
	 mvlcUaqU8c6qw==
Date: Wed, 12 Aug 2026 14:58:28 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linusw@kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next,PATCH v2 1/5] dt-bindings: net: add phy-supply
 property for stm32
Message-ID: <20260812195828.GA724768-robh@kernel.org>
References: <20260812091122.566439-1-christophe.roullier@foss.st.com>
 <20260812091122.566439-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812091122.566439-2-christophe.roullier@foss.st.com>
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

On Wed, Aug 12, 2026 at 11:11:18AM +0200, Christophe Roullier wrote:
> Phandle to a regulator that provides power to the PHY. This
> regulator will be managed during the PHY power on/off sequence.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> index 987254900d0da..0c7eb1ccadd47 100644
> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -99,6 +99,9 @@ properties:
>        encompases the glue register, the offset of the control register and
>        the mask to set bitfield in control register
>  
> +  phy-supply:
> +    description: PHY regulator

Which phy? There can be multiple for ethernet. In any case, doesn't 
really matter because either is wrong. The supply(ies) for a device go 
in that device's DT node. This node is not a PHY.

Rob

