Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC5CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNpKODSv8cbaDOfghRaj6Q3Wssu5+yBBdBSPkeZOgVA=; b=hZP38iHetPeDxMxgbhF6qWBApz
	HpCcjFNThqDPt5iaP1D2T6KNxUdrBbjv9G4/Sso0OVQTKCVnjCo4Sxt+4seZZ2SaYwDxWW/9EWeu0
	3gQ8qw4SQS2P/G+5nOBRaBy8ky4l3AJ6llee7Hdce6fp3n/XkJki2UWi6Tj0MDB657nWOAqfJNhhH
	GSFq/jdpm5qtsXCCVUP2Wy3eEeeG1/2b1Jzxpvl6mjeZoMmam9VYqQjL9W1ynMNqDODZqMQ4rNizd
	m/pJIBv2k2W8x9tbICKGs+oJ9O2KHzBFr1a2jK62gB/t5ftEeIpnjmORbby1tGCw7ied8ZIZVs78B
	gm+ED8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDplc-0000000HAIQ-35HH;
	Mon, 05 Oct 2026 20:58:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDplb-0000000HAIB-3qb2;
	Mon, 05 Oct 2026 20:58:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D3D42A2B;
	Mon,  5 Oct 2026 20:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8951F000FF;
	Mon,  5 Oct 2026 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791233915;
	bh=NNpKODSv8cbaDOfghRaj6Q3Wssu5+yBBdBSPkeZOgVA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JWJmXdjvkJLsj4FzNwydM9W+G7D089NS9WmoDLl4jIQZ2o6K2BRfhjIs62fp3ry9g
	 UtJg52BTRl368jxhDo0m/9gkQQ4iIZP8fpWEePEufdmCKmcpIdGF4wn2rjggtVXfFk
	 0ozyafbkSWKH5tmB4AgtCFh1EU7fy1f91mAXCU2GQq9blUH2RPRPtirhEz8kQLf5fF
	 8xLnRUpvu7sURoXENvhZPrh8NY5fDYOZ3xKhC3On/+MUMNZFZwXTpXFUDBVDctIQja
	 TIr5pzqBDgyJQxZuBtTgX1zAo9cPwgU3jlYdtQcENO29cvv2zLcuduYu0epu3gp5qQ
	 2RpBMcjCD2UlA==
Date: Mon, 5 Oct 2026 13:58:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Shawn Lin <shawn.lin@rock-chips.com>, David
 Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v10 00/11] net: pcs: add basic support for
 RK3568 XPCS
Message-ID: <20261005135833.37376f20@kernel.org>
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 23 Sep 2026 04:03:24 +0800 Coia Prant wrote:
> This series adds proper SGMII support for the Rockchip RK3568 SoC
> using the integrated Synopsys DesignWare XPCS, along with necessary
> fixes and refactoring in the stmmac core and XPCS driver.

Someone marked this as changes requested. Not sure who and why.
I was waiting for an ack from DT maintainers.
If it wasn't you, either, maybe repost to re-queue this for review?

