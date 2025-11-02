Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD756CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuc0gSOD9fQpTDaquk7ZB10Y9kON7r8sBAmsb13i3YA=; b=cursi0fEsQkJ/59o+1HITWNv1j
	/SlhOjzC5/zlePqFPCXzo8dZMV3fKd1TXzT9c0zrr1g1pXPXH3JeI6vBD+fengmKLOTQZ2AchtEKs
	isKrodg/7313hFKy8tzqOYoB2tco19kOYFuWlBlmCIDZIFeGxkvTADyVNeK6Z1uKdosUCg2+kexrj
	MVOfSVkRt5iEIXDs+pasGTSfvvt/lpI9ZT137nmX+XysBJRs6Vk3Qawg03f9c29W+tBJT/QLE8zV1
	ewsXWLmN3qBj2Q22s4TcugWKf7idY0Fc2dobQy9BTcG/QCt3cqQxhtNAs6mXIwa6f1aOUOhH2kQ4q
	8KxHRRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFb26-00000008eqr-0Bbs;
	Sun, 02 Nov 2025 16:34:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFb24-00000008eqd-2KvG;
	Sun, 02 Nov 2025 16:34:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88BC46022D;
	Sun,  2 Nov 2025 16:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB61C4CEF7;
	Sun,  2 Nov 2025 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762101259;
	bh=BMHbVQks4miUEqiNB8Bj8JUPKeAlJSJSR1yVrl8aLco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7eRD6TVlAfyAK/SnxypxQv2CmKl306jhXgTbNo+yEzxGzgBywD4o3XO+Kra3kmUC
	 BHeM9hHDBMsxnas3zHbLQV+jXGd43myStuXXahsqlnh1MurcU2NGwQZgqfQ1ROV/GQ
	 R1Pn9WDjXqwgLImO8l2p2csPYY5IvVZokYSEJGvJl6QDnPEPH2lDomh0rfaaZUlZeM
	 GXKm1g0JlMbAHcafI/yarK+QpXQbMIsDi8O/iVF9ZvJcEBhNzY649s591I/T7XpW7k
	 vJMX2iVXWlqbfZvVvbDLnKCpTK3ZsX6HPpK8vBbVLb8hhzsxrvKHJS6Gj0qvKfdMhp
	 vvcH1GW9R8jLA==
Date: Sun, 2 Nov 2025 17:34:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
	Bryan Hinton <bryan@bryanhinton.com>
Subject: Re: [PATCH v2 08/15] dt-bindings: net: mediatek,net: Correct
 bindings for MT7981
Message-ID: <20251102-honest-jade-hedgehog-b85f0d@kuoka>
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
 <20251101-openwrt-one-network-v2-8-2a162b9eea91@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101-openwrt-one-network-v2-8-2a162b9eea91@collabora.com>
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

On Sat, Nov 01, 2025 at 02:32:53PM +0100, Sjoerd Simons wrote:
> Different SoCs have different numbers of Wireless Ethernet
> Dispatch (WED) units:
> - MT7981: Has 1 WED unit
> - MT7986: Has 2 WED units
> - MT7988: Has 2 WED units
> 
> Update the binding to reflect these hardware differences. The MT7981
> also uses infracfg for PHY switching, so allow that property.
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
> V1 -> V2: Only overwrite constraints that are different from the default

I don't get it.

mediatek,mt7622-eth now can have 1 or 2 items, but previously it had
strict 2. This needs explanation in commit msg.

Best regards,
Krzysztof


