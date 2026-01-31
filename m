Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEBED73EB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 02:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwTZvf90Q0/ZiQiDf033n6HLd/eCmwjI8aHKLe2j3RY=; b=pD0tiyRrOe/g7GNtxOEYs2WQxH
	/2s42IiM+n2ZkU784o3XDruFQtswfxsghGUpHVhu8yrPwYZOFpgSNqSk5WkPbaqD1IqWvE3i+zlOM
	uDxosZOVZg0mtD5zbbNyG0ufMMTSTfizg62hUMpq4fkCd0hVG8QFsXcjGaBRBrSfJUs0gaDM72u24
	12NNSi6+qwpLKCid3dqT2qU64Sl5eIo1FmV5lxnRntxrgjejklFfQcM8TlYtoD1Lkwsy/U7MC9gyM
	wiEe5Lsy6OrjEtXF7SuE7NMCP95mhSdW/tW/yL721JkfxjxRxmiquKXpYk6XP4uYcwKb10/6IOwul
	HKjZrFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm15B-00000002FO3-1keG;
	Sat, 31 Jan 2026 02:51:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm158-00000002FNc-2ipt;
	Sat, 31 Jan 2026 02:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=XwTZvf90Q0/ZiQiDf033n6HLd/eCmwjI8aHKLe2j3RY=; 
	b=cIwTeMe2DGawNVZAcxX0uzCavRFgi/KseVVkwhC+A/0rDViJdToutcIHhByMlTM/Q0AyukeNKl1
	JijFga/DzGXHxO3FJTB3ANo9eCPIpN02+DA0aJP+TGAKarU/fya9VC+KM8QZwosrOor5Q1rPC32ER
	Td0x3B0nBvJwF2T01UOjLkZxfWbYqcJmUJWaJjUjO5vE/CGGc8nhN/+FfSlQJ68FUj6MEU/hyr44V
	+qHAmTXdB9iEyo5or6PSNFf3aUh3Iy7aC60/JBd/RazXhvVHcEIwGT0BBS2J8zGZea2BGKzf+f5Cy
	lKITDUh7vXOjSvBnnkTIS6rYAJ+9JCYnjHDg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vm14p-003RvN-2X;
	Sat, 31 Jan 2026 10:51:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 31 Jan 2026 10:51:11 +0800
Date: Sat, 31 Jan 2026 10:51:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, davem@davemloft.net, robh@kernel.org,
	conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, matthias.bgg@gmail.com,
	atenart@kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 0/4] Fixes for EIP97/EIP197 binding and devicetrees
Message-ID: <aX1uH28_Zd1i-d_A@gondor.apana.org.au>
References: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_185130_692183_2BAE6A00 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, Jan 12, 2026 at 03:55:54PM +0100, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - Reorder commits
>  - Change to restrict interrupts/interrupt-names minItems to MediaTek only
> 
> This series adds SoC compatibles to the EIP97/EIP197 binding, and also
> fixes all of the devicetrees to actually declare those in their nodes.
> 
> The only platforms using this binding are Marvell and MediaTek.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
>   arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto
>   arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
> 
>  .../crypto/inside-secure,safexcel.yaml        | 22 +++++++++++++++++++
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |  3 ++-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |  3 ++-
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  2 +-
>  4 files changed, 27 insertions(+), 3 deletions(-)
> 
> -- 
> 2.52.0

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

