Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12723CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6xpMT0Jc9ifhcsoo3+k+bCiHGLgspG/a+V5Xz3cEDc=; b=dDjcG+4coyE9jHIER5/SaxxU8e
	IJJob89IIUgvaqeKQ/ADT4crduZSskya/rWvTC+rDiMuR21cLL0UI/+gyjeAmdEuIAfMc//z3n7Lj
	FFQpQHZc0r1r60SoO34/RqrRn9u0CFIZTYrtJv3lpFrbdy+PbsO+mMD091fVJGZWQQ/Ow2doBiAV7
	eq1EvzxiEoaydn5KZ+guj5D8lPV7efBPh+/R6sQHX+Gdx8gQrOxee62vGjVW2oKxozhn14A4Qe9oY
	izfURtHXfafe0UgKtC4ydKLeQqdeYy99aXwS012XMoobadWbxHW3ksUgTwiGdCMS/v4KHBLwfA2tm
	VGP3tmTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usMsg-00000008075-035S;
	Sat, 30 Aug 2025 14:48:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usMpt-00000007zqb-3deB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 14:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f6xpMT0Jc9ifhcsoo3+k+bCiHGLgspG/a+V5Xz3cEDc=; b=RCGi5lHXfUtxZIQ6lj+yUZKVoU
	wDPpTNNEs14lbkbpuI8XBpOJd20CUQq+HgaqlZJo1Rw5Y5IKpYZ5I2dtUue/6PF6Hylpxg4/gneh3
	y7kaCmnNVKbzcjJIulEuOmlfTHyQxVpw0VntoMvUOX+FKZODLAlZEPL8q6BN8E4FWCyc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1usMpb-006aJV-KL; Sat, 30 Aug 2025 16:45:27 +0200
Date: Sat, 30 Aug 2025 16:45:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Conley Lee <conleylee@foxmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, wens@csie.org, mripard@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] net: ethernet: sun4i-emac: enable dma rx in sun4i
Message-ID: <195b5dcc-a81e-4f62-854f-5446daaf312f@lunn.ch>
References: <tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C4014DA405A96C2E1E7FEFCC050BA56D5B08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_074545_902484_ED740F76 
X-CRM114-Status: UNSURE (   9.60  )
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

On Sat, Aug 30, 2025 at 03:50:00PM +0800, Conley Lee wrote:
> The current sun4i-emac driver supports receiving data packets using DMA,
> but this feature is not enabled in the device tree (dts) configuration.
> This patch enables the DMA receive option in the dts file.

Nitpick: It is actually a dtsi file...

	 Andrew

