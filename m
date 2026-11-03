Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJP/RWaD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ib3z5+Md
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aYL/i0YuscUEzD0VCErR+Tz3KdHDJR7ZwPlCYlD62po=; b=uJP/RWaDMrSwH73HtRqzlYpqbt
	vMLfgW7LUA85N0yEY0GqDzUPuGMCfBSX1Yp8CGMVfiBcMkNeG6XUvN1/rRyRhhz+hZdidUs7KKHmT
	48g9rEMgtQZdgKXmS0Gq8osLBVwAOcXlLu4t7E4CKJT+tHuE3Oo00HPJSfNFd5yn1G2voQKoi2pM2
	O45PVeFQX4vdKjkcMTE9sTMJyI48MnSGQZLPv211qu9YW/Vqw/gw8IhE2XC1AIrkIzMVynqndKQMj
	v/b0WN7s1o4mcVZKub3YjoZSjAMFP+JE20LjGP1JK24f5FCgeGM11DZWMDBKZBfB+t2QMMXYyjGE4
	FMxRk1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNe-000000028rg-07na;
	Tue, 03 Nov 2026 11:08:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNd-000000028rP-362K;
	Tue, 03 Nov 2026 11:08:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BEBE421F1;
	Tue,  3 Nov 2026 11:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF051F000C1;
	Tue,  3 Nov 2026 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704121;
	bh=aYL/i0YuscUEzD0VCErR+Tz3KdHDJR7ZwPlCYlD62po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ib3z5+MdhkonNdwMiArvyjWg6RnzTYHc2pP/M44kZZ+O5Vr8BoPLiJPCfQFqyxVHW
	 N1YYjgkSE9RJ5mkBYWF/Wkv2WqEyM8LwFzDLHiZyZXRwW9+lo5WtALZ12TX+bsotmk
	 VYq5I9K/9tJovZW+Gaef777aWtvI04kR29BgdVYEOhbbEhxZcAYKpr7klaqi+IlgbX
	 oVMX/g0apanLPeSaSllUbJBAuluobnHJgzD8bgoakxClpdDEdjGc+8oUhyweJURGZj
	 59hulPiSobqluqW2m8XOZyAG+/hl6V9VWBDKI/B95hDZyuLjpSuLjprzGFeSH5r4V5
	 lT7XCpm47J4/A==
Date: Tue, 3 Nov 2026 12:08:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, daniel@makrotopia.org, 
	linux@armlinux.org.uk, arinc.unal@arinc9.com, Landen.Chao@mediatek.com, 
	dqfext@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [PATCH v4 6/7] dt-bindings: net: dsa: mediatek,mt7530: add
 EcoNet EN751221 switches
Message-ID: <20261103-soft-lyrical-squid-c5a108@quoll>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-7-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029184202.1859843-7-cjd@cjdns.fr>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 06:42:01PM +0000, Caleb James DeLisle wrote:
> The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
> in the SoC register space. It is similar to the econet,en7528-switch
> except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
> port 5 has no PHY, but is in some implementations connected to a
> downstream MT7530 multi-chip module via a TRGMII link.
> 
> The downstream MT7530 is similar to the MT7621 multi-chip module and
> has all gigabit ports.
> 
> Add the econet,en751221-switch compatible with the same constraints as
> the other built-in switches and also add the econet,en751221-gswitch
> multi-chip-module switch whose port 6 is configured as a DSA link port.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 43 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index f98b9113ad12..011c94ef9554 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -29,6 +29,12 @@ description: |
>    and the switch registers are directly mapped into SoC's memory map rather than
>    using MDIO. The DSA driver currently doesn't support MT7620 variants.
>  
> +  EcoNet EN751221 SoCs have a memory mapped MT7530 with 3x 10/100 PHYs and 1x
> +  gigabit PHY. Some EN751221 chips such as EN7513G and EN7526G have a multi-chip
> +  module implementation of the MT7530 as well as the on-die switch. In these
> +  packages, the multi-chip module is connected to port 5 of the on-die switch
> +  via a TRGMII link and allows for 5 gigabit ports.
> +
>    There is only the standalone version of MT7531.
>  
>    Port 5 on MT7530 supports various configurations:
> @@ -109,6 +115,14 @@ properties:
>            Built-in switch of the EcoNet EN7528 SoC
>          const: econet,en7528-switch
>  
> +      - description:
> +          Built-in switch of EcoNet EN751221 SoC

You can drop, pointless description, repeats the compatible.

> +        const: econet,en751221-switch
> +
> +      - description:
> +          Multi-chip module gigabit MT7530 in EN751221 SoC

Keep it in one line with description. No need to inflate it even more.

> +        const: econet,en751221-gswitch

That's almost the same compatible, which makes me wonder if you describe
the same device twice. Same device, same compatible.

Best regards,
Krzysztof


