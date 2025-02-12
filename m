Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B59C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEy6pEobXOu7/UzBRGh/yfFsLlUWWHtB4P1bKj6uuSo=; b=WgyhuYlv5FqCY/og8PFziFSrmY
	QwFVJ8gOf9FJPYK3xP8lR7lKS/KjuGfB4u7GrHTBrJw3H0RB3QQlIhh/+gFetxHj4vH7IPXyGNYhX
	GmXWo3bt8tzIx5lbMmar42Jjsu5hOXT4BxYFTzyKx/YHJjQarXakWDYl0jGZ8Vxwmv6hRNoE/IzG0
	1zeRrA3tgAaLJX/409d7fbGUqj8yAQ3p3a8RmhviPnj17JK1DyE2HC77TetkaqDXuepFs/T29icQp
	lCZXCTmuD1eY8UAGnQiIS4KQ2u0eX9iPg6BsI1CTTdRbRGUVm2hWkHszsh+2I5RxZ9KiGjzA0incW
	oMN6Rh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6ab-00000006Po9-3FJO;
	Wed, 12 Feb 2025 06:51:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6ZB-00000006PbH-2Yzr;
	Wed, 12 Feb 2025 06:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57BDEA40F6F;
	Wed, 12 Feb 2025 06:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCE9C4CEDF;
	Wed, 12 Feb 2025 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342988;
	bh=TQTxyc4gErD77Nn6rbZxay/35+TdsfVXIQZ5PlMQYi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koYdMOi2cpNanzXzA9//aq6WOPBLTOr4hW+GWxd16dUFJS2V60pi2NKXVClMzd1jU
	 w4NHASYymVmSATBGYNuRV+EiN/lF4M6b/ZtCtv5MjAgjhsDxDhXx4iuQ5fA8pgGAPC
	 DYaz2xiEsSGj2/JUAQ66vkFr5E116q0ktfO/EGj57RnPZggLfIAtEhajALbnFaoM2h
	 Sadtbz6WQMXHhVGAUwwp9ajCH9evjyEtVvU0IQiBO02cZAbqymTu8NL+coIPCAXIyG
	 o2SzXBbjG/T8zscDSWSDtwBM2Kh9FeJCsHxLhW0F6FIYl1oMaGjTtl0MpgkbBMAjZc
	 Jodb1FEjchpxw==
Date: Wed, 12 Feb 2025 07:49:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v3 11/16] dt-bindings: arm: airoha: Add the NPU
 node for EN7581 SoC
Message-ID: <20250212-polite-finicky-vulture-b5adc3@krzk-bin>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
 <20250209-airoha-en7581-flowtable-offload-v3-11-dba60e755563@kernel.org>
 <20250211-judicious-polite-capuchin-ff8cdf@krzk-bin>
 <Z6t7s0m1xzsnjAsV@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z6t7s0m1xzsnjAsV@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_224949_814833_414FA4E3 
X-CRM114-Status: GOOD (  21.40  )
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

On Tue, Feb 11, 2025 at 05:32:51PM +0100, Lorenzo Bianconi wrote:
> On Feb 11, Krzysztof Kozlowski wrote:
> > On Sun, Feb 09, 2025 at 01:09:04PM +0100, Lorenzo Bianconi wrote:
> > > This patch adds the NPU document binding for EN7581 SoC.
> > > The Airoha Network Processor Unit (NPU) provides a configuration interface
> > > to implement wired and wireless hardware flow offloading programming Packet
> > > Processor Engine (PPE) flow table.
> > > 
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  .../devicetree/bindings/arm/airoha,en7581-npu.yaml | 71 ++++++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a5bcfa299e7cd54f51e70f7ded113f1efcd3e8b7
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/airoha,en7581-npu.yaml
> > 
> > arm is for top-level nodes, this has to go to proper directory or as
> > last-resort to the soc.
> > 
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/arm/airoha,en7581-npu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha Network Processor Unit for EN7581 SoC
> > > +
> > > +maintainers:
> > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > +
> > > +description:
> > > +  The Airoha Network Processor Unit (NPU) provides a configuration interface
> > > +  to implement wired and wireless hardware flow offloading programming Packet
> > > +  Processor Engine (PPE) flow table.
> > 
> > Sounds like network device, so maybe net?
> 
> yes. Do you mean to move it in Documentation/devicetree/bindings/net/ ?


Yes... and no, because after second look at your driver it looks more
like a mailbox. So basically I don't know. I usually hope contributors
know better. :)

If this is onlt mailbox provider, then should be placed in mailbox. If
this is much more (including mailbox) but main function is network, then
could be in net. So it all depends...

Best regards,
Krzysztof


