Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D40CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgUBUMAXSrDiu5o1PcM1WV7OFPo/LLnKaP5zQX3z7uw=; b=0NRuZ0maFKzbQV7hbfwQ8ow+9r
	iVt30VzhW5ODzeA13AR6/lgEoFZy++dTz2uqFbZ7mBiX6fIP53zSCxhdEJ3dgn4uJinkSlUa2gYDx
	pWL9DI6LCBPTTztjhSOncneQf4N6JhnOv2lrM5aDdyoVp8gld2rw3pICKnzkoU7tGm2QvVyVZv5eH
	/VoCVL+yQIEWS3uGNGeBks3QAm0Q04YJzk5yPx+4qd7uxi9lvbvmStvYwZIWjLQsxDObd3ZgR6FpH
	N1h3C1Ke1sUi8DTGtTkogWQ9HWBIhEDflPEtyS2sV80mi9YxSMAUyvnBqsm/fJsTLkWoEz9j83IJW
	YaDW+xjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Co5-00000004zKj-2Ew7;
	Tue, 08 Apr 2025 17:32:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CUf-00000004vs3-1Ep2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WgUBUMAXSrDiu5o1PcM1WV7OFPo/LLnKaP5zQX3z7uw=; b=Thl8a6CF3918v/aF9zFB5adZio
	Upx9kX6X2TGqbZOlrrEmkO6BbcUr7dWBRiNlWgiawdpfa923pKwRYHCSWWHEOXSnvQzq3WbQ6qSfD
	GbagT2QFnh+i6cS1cElBnPsHV+rxjX4co/eLCmZmiITUij6kOEb8tMF4A6KfDNjjCX3NHGe2wk9wV
	SuGf+tir2ovNEk+zEAdnPMc5joE/htmKH+7pzMEy/idMRyMuxfim2+bczBiG+JbFlpVC563IsYWT/
	yWyJuUgJa1xG0GJTiiW7BvtMLMJPLJZOIf/rHLH05LG3NwfsWYakW1RriNeVVjPEAXUOLgBNJbQOL
	jLkBJ4cg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36344)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u2CUH-0007o5-37;
	Tue, 08 Apr 2025 18:11:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u2CUB-0001bM-2D;
	Tue, 08 Apr 2025 18:11:43 +0100
Date: Tue, 8 Apr 2025 18:11:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: Re: [net-next PATCH 2/2] net: phy: mediatek: add Airoha PHY ID to
 SoC driver
Message-ID: <Z_VYz6InC1p4vwku@shell.armlinux.org.uk>
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
 <20250408155321.613868-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408155321.613868-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_101213_606646_385331EB 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, Apr 08, 2025 at 05:53:14PM +0200, Christian Marangi wrote:
>  config MEDIATEK_GE_SOC_PHY
>  	tristate "MediaTek SoC Ethernet PHYs"
> -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> -	depends on NVMEM_MTK_EFUSE || COMPILE_TEST
> +	depends on (ARM64 && (ARCH_MEDIATEK || ARCH_AIROHA)) || COMPILE_TEST
> +	depends on (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || ARCH_AIROHA || COMPILE_TEST

So...
COMPILE_TEST	ARM64	ARCH_AIROHA	ARCH_MEDIATEK	NVMEM_MTK_EFUSE	result
N		N	x		x		x		N
N		Y	N		N		x		N
N		Y	N		Y		N		N
N		Y	N		Y		Y		Y
N		Y	Y		x		x		Y
Y		x	x		x		x		Y

Hence this simplifies to:

	depends on ARM64 || COMPILE_TEST
	depends on ARCH_AIROHA || (ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || \
		   COMPILE_TEST

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

