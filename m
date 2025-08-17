Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdE0R993uxA9LK/Gcm928RWFPyC6VX59/G/wYy8am1w=; b=CZ1G5nHvAw+nsJFidlVKl3fFJz
	jOsvQ0ZyMKKj8p9JOXSFwJms+cOut5bgSgLwYhdaZig5wkv29jotENF1uiRZ5KlI3foyYQJmNSQXk
	uvj8N0VgGx7K1efF2CI8MmoSUGEqfqGkkWLVHAj7RCSuaozoEszsKd5/a4hSvqvlKmELCTe4PbX3T
	2b7b78HwcL5Hbu10XhwURexZznScs2OOSd+cpuwh9cIF0q6wbkO00kixk21gLqoI0WLFirmeSeQdZ
	0UI32i1B9Z8M9x/4STXIP05wt7yQkdR2LLUoIt7G453oneSabVHFDxCjLvLNiqy2LdOgfuuiDQNJJ
	gJR3jOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfu3-00000005pBH-41qQ;
	Sun, 17 Aug 2025 16:06:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfrT-00000005p4A-21kz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 16:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zdE0R993uxA9LK/Gcm928RWFPyC6VX59/G/wYy8am1w=; b=XslvMXKX9PoOKnQ672hCHnJ0QD
	PXkmPDbUxNUDI5P4yT/3/8jpgr0KFsAb5Oyx2ihjRrCvKaWlomgGK3XLi0bMQpbFZzLQjPF7+urzx
	pJLMHL3IywQN1RwW4c9lXg/z+oiPo6YbvSOjCPU1XcQ9VnphR8LRyBwLWfGQhklD6eho=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1unfrK-004ybH-2n; Sun, 17 Aug 2025 18:03:50 +0200
Date: Sun, 17 Aug 2025 18:03:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/7] net: stmmac: use core wake IRQ support
Message-ID: <00b45ff8-b5fa-4453-a389-a7252aa1da6d@lunn.ch>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
 <E1umsfK-008vKj-Pw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1umsfK-008vKj-Pw@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_090359_521402_C3B02B8E 
X-CRM114-Status: GOOD (  10.86  )
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

On Fri, Aug 15, 2025 at 12:32:10PM +0100, Russell King (Oracle) wrote:
> The PM core provides management of wake IRQs along side setting the
> device wake enable state. In order to use this, we need to register
> the interrupt used to wakeup the system using devm_pm_set_wake_irq()
> or dev_pm_set_wake_irq(). The core will then enable or disable IRQ
> wake state on this interrupt as appropriate, depending on the
> device_set_wakeup_enable() state. device_set_wakeup_enable() does not
> care about having balanced enable/disable calls.
> 
> Make use of this functionality, rather than explicitly managing the
> IRQ enable state in the set_wol() ethtool op. This removes the IRQ
> wake state management from stmmac.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

