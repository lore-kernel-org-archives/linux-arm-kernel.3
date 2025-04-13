Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5F0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXdTX5kNhB8Djet/lPdjXM/642r9m5weD6j19yKVYFA=; b=sw1Jmu89pJFRHj6cbCfoJ/AhWC
	oJvuyrx1QfonxZIqKBAtAUOy8yGB5dzVKyjf6RFZkfi/6ta1WuvwbQ106yDMAbG+9mryYjBSowck7
	h+fE2PmHTRQwcL9IA9ByZ/Jf7LrWPIMAUPVHyWPS6y2CL2dZA92wGWPIuoWBaCaUyHDLmUDee3jfk
	KXhuFw2yrWyadAFXmrvyZ0MCo9+lfSW3qI8nliYpYh/RzSTA5TNS1HReaTLSNRT7SvYqL3ZedGmAW
	WJHnRbPpliHhszrcTDZmLurbBUY5MnTDBmZyCQkB+DmDeW+eonw6F8uBVYj/3jqKjGpuepxFIlTCZ
	lZVmPnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44iw-00000000AAz-1z5m;
	Sun, 13 Apr 2025 21:18:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44aa-0000000093T-37vT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IXdTX5kNhB8Djet/lPdjXM/642r9m5weD6j19yKVYFA=; b=FRSxE84ew4LfwgbmZReX+x79zc
	rz3klM8nhxyD49snBpcJ853XwqQKmr5P37dt0cZ/vV4jYkdOQki1lpZ40kUndBgU9EqVdioAi5lx3
	3b87SH9EH/vOZF4Pfb3oHExIl1dQnVKj2BucLqiW0avubRdQCGdoOvp45Yv5Ec3Fq0m4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44aW-0096N2-0t; Sun, 13 Apr 2025 23:10:00 +0200
Date: Sun, 13 Apr 2025 23:10:00 +0200
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
Subject: Re: [PATCH net-next 3/4] net: stmmac: anarion: use
 stmmac_pltfr_probe()
Message-ID: <0828d7ed-3ba5-4678-9f1e-9bbab07cfdee@lunn.ch>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfP-000Elx-JE@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bfP-000Elx-JE@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_141004_788394_B40CE224 
X-CRM114-Status: UNSURE (   7.19  )
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

On Sat, Apr 12, 2025 at 03:17:07PM +0100, Russell King (Oracle) wrote:
> Rather than open-coding the call to anarion_gmac_init() and then
> stmmac_dvr_probe(), omitting the cleanup of calling
> anarion_gmac_exit(), use stmmac_pltfr_probe() which will handle this
> for us.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

