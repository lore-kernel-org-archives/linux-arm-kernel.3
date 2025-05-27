Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182AAC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3GFQ2em3qr/+lpcMUswENE9r+bXLAP8Uq3SyEwOvtc=; b=Xbycr7uDxQqCQXXhuY9kTGeP3W
	GNCbIrD1dpqp80rKBq7bS3MP+OwFUrEsJK7K23kZ8c00benejghksmmetdkfrdXVozwtJigZALNef
	HxOhmdKB5d7w8G7QuccBeJoY2lhx82DRv2P49HyNReAwQadAxhceavSLsrk7OcfrEq91S38+1GkjA
	GTItvXRKvLp+Pr+o3zzWn02+qOcNYsgMj0p3ExISSLFaI3VC6Ig9B56KzbFIaZ35y+LjGdzzW/x4X
	GnGR+tcemDaKULZLYZDsPkaQaVnyC2ewo6kqsDkZo5e2iCEpy5CbeAAUYzSPbWJsLQKh92Fvxl+xq
	t9w9nvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK02w-0000000BRHp-3boo;
	Tue, 27 May 2025 19:33:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzyM-0000000BQdo-2HcE;
	Tue, 27 May 2025 19:28:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29AB14A639;
	Tue, 27 May 2025 19:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EB3C4CEE9;
	Tue, 27 May 2025 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374106;
	bh=ZcppwkkBkGHzfL/HojYzLOl4RCeHBYYQUV63DqSRucM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C18Q4wxAIMAZ+UbWrE1lFvCpoZhpt/PBhWqEwgXbut9htZnxVTyZ4DBPOvmqZ6YNQ
	 lJJ55e7ZRfL/bKDdOK4pOlYBu4SyQktp7wfoCYBdTYeQfUz3ogXafmvGCaT3662unh
	 495cJTJLzsiFQ3oAnLez/2yCuqs2WN6gMWfJNLcE0mtBhFv8pd1GwL5/Dk6+dvoVs5
	 JsvzkbFFzmk3HyeCtRK4HGry4Y8HX1IfiJtazdMxhSsuLe2UU4X9eeB8PRs02okcwG
	 SmXCzdZ9yluDgM9b/BU73hkMHJuoSmWGN6Qo0FhwytFRi8d1kEsev0ZUQU75NQdUx5
	 AH6eL3zDyhaag==
Date: Tue, 27 May 2025 14:28:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	DENG Qingfang <dqfext@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <174837410385.1090056.12670391327460010323.robh@kernel.org>
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516180147.10416-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_122826_615642_C240BA9B 
X-CRM114-Status: GOOD (  10.79  )
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


On Fri, 16 May 2025 20:01:31 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and 2 reg items.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - change reg to list of items
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml          | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


