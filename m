Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E5CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgaCyEM7L/8mt3oUm8lfVeAvLdE1lAEXA9Vr4r1Qdh4=; b=SfIbt8Xn32zc87XvKrx5t/k6pY
	vqZEeMCV2MTAd3PG5zB0u+uvKILqei6QcDg9W/PNbQ4l8wa4bD+EpfK1+uxYHrl1w7A446pb8lOEn
	NhpELCk60tSmu+x1dHs9vjIyJR3WvVZh1xWQwvdpfQ1UKaM6t0sitwraDLbYHD58+FvBN/GMAD3/y
	ACQ97W6zti76MjpaC8GeH9ggnUtwoO3YMhg5n5Dqd0Rz82sVoTulIt9Hyp4lUo9pVrzBkgRAkzQTb
	ahfPc9JvYkljfpyHlRd8Rd2YwmFwLb6orsNYdPSwGpL7ecuBvjw/GSs1PC6RaLoB+H0XpjCCap38D
	ytBIKhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0J7-00000007Gj1-1YPs;
	Thu, 23 Oct 2025 18:45:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0J4-00000007Ghf-0emT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OgaCyEM7L/8mt3oUm8lfVeAvLdE1lAEXA9Vr4r1Qdh4=; b=l0QietyS4aPXhRXiAtpuxntQKC
	+XmNwjnh+r73qlDSI9EUWHZt9PAjzN8SQdrz7qcKVl04utM8tEpGonhF1e44G6CYcy4MOxkwlBASa
	g8EN7Hl7+NVUTYGLA9QtFg+geW6vOljuZc1vyhUWb2bddevMOAKcEg8DQ7rktCYMjH8U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0Ix-00BuWG-O0; Thu, 23 Oct 2025 20:44:55 +0200
Date: Thu, 23 Oct 2025 20:44:55 +0200
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 1/8] net: stmmac: move version handling into own
 function
Message-ID: <01330327-7a9d-48c8-a99f-a5ac064e0ced@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrl6-0000000BMPl-18ag@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrl6-0000000BMPl-18ag@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_114502_919244_5E21388D 
X-CRM114-Status: UNSURE (   6.21  )
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

On Thu, Oct 23, 2025 at 10:37:24AM +0100, Russell King (Oracle) wrote:
> Move the version handling out of stmmac_hwif_init() and into its own
> function, returning the version information through a structure.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

