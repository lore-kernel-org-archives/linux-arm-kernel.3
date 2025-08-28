Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AB5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdCODJpZnG9ezgAF79ZxKjl4bdC25RGBdHDjGzPtV/Q=; b=bjuArctHuU2hhD8bA4KzBizgtV
	ZHpjx4QI8qSPVQIYgyWEW57GG6Yyv9vXEf9ziRq5q7HxUlM67RQFq4tdtv3eByEPdfEEYxjTfJdWd
	PusA9ozWiJAl9c/c+iDERoYzN2cvNNNvof3xY00XQdK6NnusOsuFQGJD6S6WgD3RJKCc7C3rNwB/e
	frMXMWaxJuTnfT2SBa317r/G6u4v8AN9mIQS0yHuM4iFgv8j1nXuxc60zXLld40ayqlLnTzevIERO
	mO3r/sp+7XwWgRBL7bXJ+I6u5lLqY5JpppKH2Im/RBN/VIinq3R7T//x4oFxSGyYSXH3o6c+1LQOW
	qM0jVG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urigw-000000035Qg-0XkQ;
	Thu, 28 Aug 2025 19:53:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureYO-000000026aU-047U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1648560097;
	Thu, 28 Aug 2025 15:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F2DC4CEEB;
	Thu, 28 Aug 2025 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756394922;
	bh=HGZLe7DTRuz1r+tooyR6QTpWMuRK0oD7wwj0haGcwpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Im4kBZaReNs/7kHrN/Q+bICp4U2subu1TwCnRvs9G4O5FY5R7eUhYQ6Gd9X3D/gUH
	 lcVaJHWHnnqu+9v/qg9o5lVFhQ/yOtMvOV/RTPR4+VkKISFVy9tVqY0amO7+TvA/6P
	 lyXUrHBRwluXgDAQpurq0Zj50IJOm1olVjq7Eu0uOlRYwuwBvjyP2HwxKWHDt/uR7U
	 LW2JGxPV4XcW0Fi1fPyAOM4bdiDsoLBTXhhoS4ngc/DyTGMQWCocP4tZttd/O1/VoR
	 wxeJ1mLrIDk3sV3uT4G+L8WjxCvifHamyUZx6uWSkLMhgilWunlSJIu4lKc9RBs0zk
	 30QzehCzjaA5Q==
Date: Thu, 28 Aug 2025 16:28:38 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: mdio: clean up c22/c45 accessor
 split
Message-ID: <20250828152838.GU10519@horms.kernel.org>
References: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
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

On Wed, Aug 27, 2025 at 02:27:47PM +0100, Russell King (Oracle) wrote:
> The C45 accessors were setting the GR (register number) field twice,
> once with the 16-bit register address truncated to five bits, and
> then overwritten with the C45 devad. This is harmless since the field
> was being cleared prior to being updated with the C45 devad, except
> for the extra work.
> 
> Remove the redundant code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Untested, as I don't have my Jetson Xavier NX platform with me (and
> probably won't do for a few weeks.)
> 
> While this patch has been prepared on top of "net: stmmac: mdio: use
> netdev_priv() directly" it shouldn't conflict if that patch is not
> applied before this one.

Reviewed-by: Simon Horman <horms@kernel.org>


