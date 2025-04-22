Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46A4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUIlaCKh2vaboCfBZZp5yqaQrFgYEe7PkSHw27Eojtk=; b=Q/v/FumIpFypeEomDIm5cQ7nks
	fBle/CELjZvS/So5GBxjDZSoT5U7lYhiYFgLlnMhQFNzlAzOgT4bklTAxNTKdXqMuWN6D713EoxJb
	1uFe7DZnhpHiUrEqsH7enqDYDzcTn4a4FpD2YGoYdQZQqqB5yFCFwphfidR/xAikX6AaQ6TdLPbQb
	/tSkInTs8qqapm3dC3dVhauP2TFY82r3VeGEtUrRPvN4octp0vGzUscUO+idTG4TumnN5IyWxOenN
	Qd8OqDP+d2EJvswJWTLzZhmG/OSach98sIL4E+uep0nnb3SIuDam8cKCzQkJyhj/NbKEvGScy08As
	D+ubaYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kb6-00000008VF2-0boZ;
	Tue, 22 Apr 2025 20:52:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7H7I-00000007zu8-0Dwa;
	Tue, 22 Apr 2025 17:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33CC8A42BBD;
	Tue, 22 Apr 2025 17:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFF8C4CEE9;
	Tue, 22 Apr 2025 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745341743;
	bh=cfux6OpSEf4zIM34Xufn2UQbviRHWmsNHDSxigTjgfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVGR+ToUEbLnB+Rua6EgtpsO3NkyuLn+KBKN8XJ9qpc9dxCRC7IwgCup001kf/Cmj
	 wGX4AP1ayXq7enDHtfQ99453NJbjrW0egSCxfojqMoAXHgsjrbHjNSo9hLuHjz/c/2
	 QOHb2IaZIs4SNebhYLjOexxFuqJrL1J9b5qWbbr6mgJ/bI0cH7P6VtpulaU+EVBDVW
	 KOQHmfVBDcMhFhEfnd+YBooUDlrO189B8dsB+OJBzco7lNodlMT1koh4Bl1lt3LZ1H
	 7dHgwaKUzim0ey6xP/DGFlZ2MhkG6v7yriZEHrpfHsLp+mRWMXRtV4LiNckFKOC6Xp
	 iFymvNOcuvJUA==
Date: Tue, 22 Apr 2025 18:08:58 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: convert cap_bit
 in mtk_eth_muxc struct to u64
Message-ID: <20250422170858.GL2843373@horms.kernel.org>
References: <d6d3f9421baa85cdb7ff56cd06a9fc97ba0a77f9.1744907886.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d3f9421baa85cdb7ff56cd06a9fc97ba0a77f9.1744907886.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_100904_151638_F35847F1 
X-CRM114-Status: GOOD (  21.49  )
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

On Thu, Apr 17, 2025 at 05:42:16PM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> The capabilities bitfield was converted to a 64-bit value, but a cap_bit
> in struct mtk_eth_muxc which is used to store a full bitfield (rather
> than the bit number, as the name would suggest) still holds only a
> 32-bit value.
> 
> Change the type of cap_bit to u64 in order to avoid truncating the
> bitfield which results in path selection to not work with capabilities
> above the 32-bit limit.
> 
> The values currently stored in the cap_bit field are
> MTK_ETH_MUX_GDM1_TO_GMAC1_ESW:
>  BIT_ULL(18) | BIT_ULL(5)
> 
> MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY:
>  BIT_ULL(19) | BIT_ULL(5) | BIT_ULL(6)
> 
> MTK_ETH_MUX_U3_GMAC2_TO_QPHY:
>  BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(6)
> 
> MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII:
>  BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(7)
> 
> MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII:
>  BIT_ULL(21) | BIT_ULL(5)
> 
> While all those values are currently still within 32-bit boundaries,
> the addition of new capabilities of MT7988 as well as future SoC's
> like MT7987 will exceed them. Also, the use of a 32-bit 'int' type to
> store the result of a BIT_ULL(...) is misleading.
> 
> Fixes: 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64")

As this is not a fix and not for net it should not have a Fixes tag.

If you wish to reference the commit you can do so using:

commit ("net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to
u64")

E.g.:

Introduced in commit ("net: ethernet: mtk_eth_soc: convert caps in
mtk_soc_data struct to u64").

Note this should be line wrapped. And should be in the "body" of the commit
message. That is, if it comes at the end of the commit message then there
should be at least one blank line between it and the Signed-off-by and
other tags

> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: improve commit message, target net-next instead of net tree

