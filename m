Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401DFC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fTcsPCngfSQh8sTLVFQa2oAuBNRUheBXdO0Lg8ghPA=; b=P5YfIkgyEBzxyTMG+sFnPUCKqI
	Fc8jbKRWT7jIAW6YXQIdIewCcMbXuGT+rrG+aXoBL+KNO7IMoRfqVBR8X6pL5SVVbTP+MqCURdcLi
	uv0KCc+dhUhqdHBTEV9BhCXRaIDfW4VvHeix3GSR/TuA5EHmXtJWyuCi4JpAZTpI1PP5ospHBP2C5
	OfNCQzyhgDqR1vFdVWWaHkEgXN2OA3HbMdT2nkiuzPcWCWQtJh84M9DlWG8reMzE59lcvWPBAj2cj
	twPMbFv80ic8ShvU9hab9CBIlubgo3O/gMl/ZsIOMOP1+GRtSZEubvThyhNhawkgm4eiMpcNmKmbu
	6gxvMzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJXL-0000000GMlu-1GDA;
	Wed, 14 May 2025 21:21:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJUT-0000000GMVQ-36sT;
	Wed, 14 May 2025 21:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08804629E5;
	Wed, 14 May 2025 21:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9CBC4CEEF;
	Wed, 14 May 2025 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747257492;
	bh=ZIb9Fz+xqmgrAxD9mfna0sZwGimSQAAHyT/UwWtLC/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FysNDajbvFLErLLS+ewABWamu9qsKftwQ/avnuariznR2rGW7L75r8/aTCRP3Y9Ep
	 UmF//7v1v1Jaeggu5nWZjUaNDP605R5np/adPcjWhAYxvcGtkbPQg9JKyq5npQ1h0N
	 fuFGoVT+L774iCPRmmaXhJTHMvaNGRi07aoegw38eAvR71Gl5OVHEwMKnYwZu7VLRz
	 E1AQkBGQAme98CoiJtarJ4cZvUMW42VuIJb1npm0o/qegBKXprmaw+sL6pL8n8ylV0
	 9c7VJZ2zAXHO7m7jgKlnkzZPdhA7ZMfoqtiDO5erTnnoAp1zses1IeoSQLX1+0YZcP
	 l6/tMa1mvWmaw==
Date: Wed, 14 May 2025 16:18:10 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 03/14] dt-bindings: net: dsa: mediatek,mt7530: add
 internal mdio bus
Message-ID: <20250514211810.GA3051536-robh@kernel.org>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-4-linux@fw-web.de>
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

On Sun, May 11, 2025 at 04:19:19PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Mt7988 buildin switch has own mdio bus where ge-phys are connected.
> Add related property for this.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index bb22c36749fc..5f1363278f43 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -156,6 +156,9 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> +  "^mdio(-bus)?$":

Really need 2 names?

> +    $ref: /schemas/net/mdio.yaml#

       unevaluatedProperties: false

> +
>    "^(ethernet-)?ports$":
>      type: object
>      additionalProperties: true
> -- 
> 2.43.0
> 

