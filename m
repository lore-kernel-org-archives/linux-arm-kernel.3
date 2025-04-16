Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5A0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ba507aXTM3D8ftU0jPTQuQNiOze5+4Icq9H3hf/0NV0=; b=bZJYmHx/iRv5tYlQnVuXj3zfvD
	jghnn7O8OWAUT4J+A4HWqKFpIQfG8QBrnHRLQQoSDiqrh55Z8RIlQvaZgATxqpXM8ws5FFSeE69X5
	BvBZB9g4jZEMI1QWoPRitlwYsz1xz0dHmrr++el8oGZK/7+vbJbJjS3BXYByfdXoblVQqkHBVDXhf
	PCZ57XYf4SdlWZiLf+sSfWFScf3WkSF4Kkz8rDHItifrNOv8W32HBolXO1q3ZBjPylt9P1LVeS/l6
	zJ99dXeqpBiT6YuJkNxiQEoffhR64QIoHR4wQkkNCX7SwL/3PsSsngAVi32G2svM4OEeHeBihIoae
	55xT38Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51wr-00000009WhQ-2Jj8;
	Wed, 16 Apr 2025 12:33:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51r0-00000009VWc-1sDC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ba507aXTM3D8ftU0jPTQuQNiOze5+4Icq9H3hf/0NV0=; b=mgSMLOlhTuiR9KcCbEN9rF9OYH
	BGzS262MmzMm1ApgIhhwL29QbNdj43lxNz8m/wTVa96nRhW3UbTFJrSksghnjx/MCeTp4sgF5+Plq
	pPU4NhtryO9bp/yWA2zy2kFKccsqCIORBrviAR6eOb/aHAsfo6bzKFhk88JDz9dh3E9c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u51qq-009cJ9-RQ; Wed, 16 Apr 2025 14:26:48 +0200
Date: Wed, 16 Apr 2025 14:26:48 +0200
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
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: use PHY clock-stop
 capability
Message-ID: <1dc50e53-73de-4fed-a088-1b4cc728f70f@lunn.ch>
References: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_052658_483379_D87341AB 
X-CRM114-Status: UNSURE (   7.20  )
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

On Wed, Apr 16, 2025 at 11:09:33AM +0100, Russell King (Oracle) wrote:
> Use the PHY clock-stop capability when programming the MAC LPI mode,
> which allows the transmit clock to the PHY to be gated. Tested on the
> Jetson Xavier NX platform.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

