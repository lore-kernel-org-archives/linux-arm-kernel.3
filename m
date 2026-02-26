Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AE1FC593E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYxjpaoAB1QmW1SPiDNKNuGS5HJC4I/Rs36dvBoE19I=; b=LdJEnmmDPLmwXVFfMbv+IOcHBe
	9z/R0w2AnVkwF0N4MiTdszyJH9CZ/jDM5FrMQm5uNgWKFQMaNarplJYMxejORD7Q6WKiYnwszIm0x
	j4TXCZS0EyVFJ5YLwEL+rUVywstzdF3aWjrDkNVCJFCyiz/yTAhnBMZv9nnTgZhLoiaInFNLdIZMx
	hLBNkpn7fFJMtyknoPNqisNr2GwM1wvrDs/WCwHA7Zi+aC5OEycclh9sT2nmDic4N2ohkIXI1x8HU
	x6DyPUWe2XdE0e/Ntjb2SWzBy5B9jJccWSOXNGVlBXAo2BhNczZ/0i6+ou5YuLLJIC0USyot2SZl4
	hpWkzFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva95-000000065eU-0HPB;
	Thu, 26 Feb 2026 12:07:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva93-000000065dw-2Rl3;
	Thu, 26 Feb 2026 12:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8FE643B47;
	Thu, 26 Feb 2026 12:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78142C116C6;
	Thu, 26 Feb 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107624;
	bh=NvaYmWmPw9TAYgQzAiJzQLK+RAHS9O3xu7w8WLHGVRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2BzMFvBcZePIpUeBoVmsEcTdQuoGLhg3eMYxEqqbbH/BAV8ScM+j0up4zRBRiK4H
	 ANmYS9NlwhW4nrY8Ogce7WuOeU1m1rVpYFscAO9XBsnz1QJbcOwNDCzWdQT1E2mk7V
	 bVhUqw17Y1tLWhT7gC2FMzmrKiV6u5/s5rHgGQHqy87IcmFEABcXwtlgmQKAAozO4U
	 Z/crJJ+qUSQuJhIdQjIHj3pv6yb7qXzBEvoUcg6gHUAWw/9Je1/7EEV47T/uxaboP0
	 3D4fTA6zziA2UZKNrwqrsIQ6K3TtxELO+knokt0Pv9rDkCsR16muPRk+8pPYW6UZf/
	 +y3moALOiaeSg==
Date: Thu, 26 Feb 2026 13:06:58 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Grimmauld <grimmauld@grimmauld.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <aaA3YuIOK_Q0MPi-@ryzen>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226101032.1042-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_040705_748974_4EC8F276 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 26, 2026 at 03:40:23PM +0530, Anand Moon wrote:
> Rockchip DWC PCIe driver currently performs synchronous link training for
> combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> the link to be fully established, adding several milliseconds to the boot
> sequence. To optimize boot time, this change enables asynchronous probing,
> allowing link establishment to proceed in the background while the kernel
> continues probing other devices.
> 
> Cc: Grimmauld <grimmauld@grimmauld.de>
> Cc: Niklas Cassel <cassel@kernel.org>
> Tested-by: Grimmauld <grimmauld@grimmauld.de>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Reviewed-by: Niklas Cassel <cassel@kernel.org>

