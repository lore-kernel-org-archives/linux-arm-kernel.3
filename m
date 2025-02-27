Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7237CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2N8OHLgj4P9XJtd6/4SwaIpkmO2sCL/Gv53HEvD6is=; b=UITp2gj8Vn3OcDJ2nYWnbuF+9H
	8mKMoWAVDLQEvsjM8D0lH2e7mOb3HIjB3Dhg2dhDG4BZ56J39nPf4JbODq/a/p+E/zCOu05UanvyI
	VMwTN+wFlxBE8NFhSPdGXggkhQZupL4a7C8NISpiJoUWzbZnmlWL94DeY8pB6ORmnk/quM2q5TR0t
	wsh3eAgTnXMbPMQmWhhlk4I2yugOvR9D/xIfF0NPAOhcJfFR+h79a3JEvCIn6a96f7urJ+9qvMKk+
	H8chMA2QwuALC954SHivJP7/Kp6E8FetrOMEnGS4nw9TZ+MMn3nskf5eCs88b/OK6z1eLUgsGIQw6
	NvUW2qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjS-00000008YG5-3PnB;
	Thu, 27 Feb 2025 19:39:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngwO-000000086Vh-1vov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:40:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=C2N8OHLgj4P9XJtd6/4SwaIpkmO2sCL/Gv53HEvD6is=; b=PbygpNzGqrz38DKGk6RjWo2YUv
	KUC/Nczi5YHbe6jcI9FROcL7Ur0Hx4JOmQ9PNFkwf1a5MwK6SAUvaYmk2btAVNqvwT3HxJGLUv2p2
	doMO7W5y0a8SZnQd2DyMZXKgDVu/EtO6ncNCGtKQsm2Xhz+0iiG2p8a/MDjdk6qnFhOY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tngwJ-000egZ-TX; Thu, 27 Feb 2025 17:40:47 +0100
Date: Thu, 27 Feb 2025 17:40:47 +0100
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
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 2/5] net: phylink: add
 phylink_prepare_resume()
Message-ID: <63d53c33-f440-45bf-9fc8-15f5162e5cf5@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1N-0056L5-2X@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tnf1N-0056L5-2X@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_084052_494048_4D372295 
X-CRM114-Status: UNSURE (   6.72  )
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

On Thu, Feb 27, 2025 at 02:37:53PM +0000, Russell King (Oracle) wrote:
> Add a resume preparation function, which will ensure that the receive
> clock from the PHY is appropriately configured while resuming.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

