Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75AC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEi1ASfzu6RMVqoZyyuUKKGsqDK54V17Mow+ONkR8V8=; b=TMb6ighJ5yPH3b5tNxswKh3Z09
	+WIHt3SKJdpaJ4Ek3uATH7/SOexm976ELRYCSArDBTQZ6IDlzy5/cxJ2jzOQqjTmVgyyxT6Ke1NvC
	UXH5tjME4M+TkQHqHoF5RrR+G3KJ4LkuysbeXDLke5eX9A+i1hiPX6ow7ujrMi4+FkzPNyWEIQpZX
	BTqUlbsMOBj/LRJLkuT99TRX1M1I8RQqrWCT3qpKhsRgxNlxTDoWpvjbd+JNaF0u1PUZy5QCQIilm
	70ZSe6PCGTAKJMru6q1Jw+p/Bk5VTzBNYp8f7FhECwK/fH4oO/GR2lE58grdQcvFJfeFpFS/FhwW0
	n0qpyvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WHw-00000007QoO-14BQ;
	Wed, 09 Apr 2025 14:20:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VdV-00000007Jtk-37Mj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tEi1ASfzu6RMVqoZyyuUKKGsqDK54V17Mow+ONkR8V8=; b=KlrW0cDWk63FXPUqN1Inh1XUtn
	724Jd+qQU3BWA5uHSs5mtbekTRQ/IcoxBXDrlBszeQEbTYBX4ZAZIaHRuY3j387gBGX1goZ9KdcwK
	k8B0fLiI3XsToIWx4lhrXzzKvml9QXUVaqE6vrSVU854jQcLWOtbjCfIBWJeoRtKdAUs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2VdM-008Xw3-O7; Wed, 09 Apr 2025 15:38:28 +0200
Date: Wed, 9 Apr 2025 15:38:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
Message-ID: <0d11c42d-43f1-4141-9ed3-9232f301a436@lunn.ch>
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
 <E1u2QO9-001Rp8-Ii@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u2QO9-001Rp8-Ii@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_063837_778517_0B035906 
X-CRM114-Status: UNSURE (   5.89  )
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

On Wed, Apr 09, 2025 at 09:02:25AM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

