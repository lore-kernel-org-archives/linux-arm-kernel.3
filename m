Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69976D65552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzmuQQKxyTgx9LMpYPrh3p1tSF7mzJ4FGaCyi5J1O2E=; b=vFxOD6IDbF3NkpWnYWDUdWcFDB
	ZxtMVG69u0BGtHIedNltKyXDcY9WuWvboiLGLLES68ZQmcLMrBJdxAV3zFFFShMJ1u3SopazX1nm7
	KupV+NlEJd2rvhfbh8QXB07Xeln5Sb6SdBV9mwUJk2G42tXG3InNDeuXaYEaBA8/URO+5eH4QGbC4
	Uo3vmMNRq5QrMcLldBSri5l9DaCMJ25JRJYJhlTntkH5d5mcrP6QpV1F/qaqZEiQxvwgJqxfPm3xn
	TRZyvwaHonsqSQ8CT1nsXE/8ZlihNlyfa+QDmEERUOkmbQTjkf1KchkK1NuT4nmaqJ76vO7c2kb6Z
	P0cfO0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1lV-0000000BamK-3NdI;
	Tue, 26 Nov 2024 20:02:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1kV-0000000Babo-3zSI;
	Tue, 26 Nov 2024 20:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zzmuQQKxyTgx9LMpYPrh3p1tSF7mzJ4FGaCyi5J1O2E=; b=b+wSD1yUVZO2M7+N3jComz28RJ
	wsGEgCkqXXhnRKMzL1bOegHzG46lNuLnZCUZNer+7Wujp4VPqyY5B7sHoo4xt+YYT9U4fXsIJw5mJ
	yyFHF0axxcJS3Uqa1ltcjBJHdJaSuhmPW2TguBK9ibq0qd3Ws+NIGgkMerS2GQ46dWnA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG1kA-00EYYP-Tu; Tue, 26 Nov 2024 21:01:06 +0100
Date: Tue, 26 Nov 2024 21:01:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 01/16] net: phylink: pass phylink and pcs
 into phylink_pcs_neg_mode()
Message-ID: <630a8c53-55c0-49c9-a53f-ce6478641a11@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrnw-005xPe-KN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrnw-005xPe-KN@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_120127_984224_A6121CD4 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Nov 26, 2024 at 09:24:20AM +0000, Russell King (Oracle) wrote:
> Move the call to phylink_pcs_neg_mode() in phylink_major_config() after
> we have selected the appropriate PCS to allow the PCS to be passed in.
> 
> Add struct phylink and struct phylink_pcs pointers to
> phylink_pcs_neg_mode() and pass in the appropriate structures. Set
> pl->pcs_neg_mode before returning, and remove the return value.
> 
> This will allow the capabilities of the PCS and any PHY to be used when
> deciding which pcs_neg_mode should be used.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

