Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3423D5D69A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cN7+fcpq3L63jt/AUpS+68YG4k7E+yUvX7PUc285Ew=; b=jwYnd/lXyIap97q6qUIsX392hG
	52L9/VlKSpIPe1KmRBEqweG+/juhDKTMjHromUMp2JcSWWz9Y1+JWZ/MNJFBGMP56NZog6c9/cs7V
	xmvP+pCJm4bJaKrfjPUP7lB9FdTOQE/It4sBfZcURhn+kWFalay9u+/kyGjwsX2xAAUO0+uvp0d3o
	S8/X+n7CUgf8m5P8n41ZQUsolnGViVjOg/G77Q5L3N0xrkNtbsU5qiZo88ZfMIVlawL0c3Aqkx6bV
	6zDDJo6Srglapriw9d1Yc52TxvHUgjuFrVoBaKCsFTx9a987CnOmdgl74OLNV9KkP3GY0Pg+So6WE
	DDPVIJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NgV-0000000ARDJ-2wje;
	Fri, 08 Nov 2024 12:01:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N0X-0000000AK7Z-3Qaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2cN7+fcpq3L63jt/AUpS+68YG4k7E+yUvX7PUc285Ew=; b=LxUG45Y3Ffi4l5fcCIrMKlrw3M
	K9rdAx2D4MGTnQ5lkz3+bbl7gvCfHNo0TB362aYnbroGPD59UBkAML01r9y3iQm9YHmrxI4/wsG/U
	S9r1FmljlDiTFw0E7YNDmNtJB7dQgDDCMDFMpLwoDgZ6e+ZgrFnGwumZRgiUm3cmzWcnyB/c2rCfz
	/OMcWwjb8xdbv8BwjrCYLj3hsJBFm6cSJ7Lfj6XUhi/DCjGJmYTpjFmFNPEwYU0Js44CV4K7AGsPY
	hbPcY0DLsMZVGSHgfdUmNrzz7WIeBH5mUKqkO2pQ41rlzrXvYvzDlaVsUiRrxGJOsHIAQEJLYDpvj
	CAJMnrYQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43430)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1t9N0L-000501-1E;
	Fri, 08 Nov 2024 11:18:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1t9N0J-0002Ed-2L;
	Fri, 08 Nov 2024 11:18:15 +0000
Date: Fri, 8 Nov 2024 11:18:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	jacob.e.keller@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/7] net: sparx5: do some preparation work
Message-ID: <Zy3zd12CoUp6dC2q@shell.armlinux.org.uk>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
 <20241106-sparx5-lan969x-switch-driver-4-v1-1-f7f7316436bd@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-sparx5-lan969x-switch-driver-4-v1-1-f7f7316436bd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_031829_874608_FBE9B109 
X-CRM114-Status: UNSURE (   9.61  )
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

On Wed, Nov 06, 2024 at 08:16:39PM +0100, Daniel Machon wrote:
> @@ -134,6 +134,9 @@ enum sparx5_feature {
>  
>  #define SPARX5_MAX_PTP_ID	512
>  
> +#define SPX5_ETYPE_TAG_C     0x8100

Maybe at some point consider using ETH_P_8021Q which is defined in
uapi/linux/if_ether.h ?

> +#define SPX5_ETYPE_TAG_S     0x88a8

Maybe also consider adding ETH_P_8021AD to uapi/linux/if_ether.h ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

