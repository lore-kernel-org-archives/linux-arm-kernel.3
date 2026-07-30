Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E520FC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8MQ+sboj6Emxgip/vMO33V3JD1l2EBPOqtHqVRFw3I=; b=NmExoUk6uWLdhYOg9LFpVpGchN
	oHBce/ky7D2jkPeMrOwcGr7onLuzoMDMI8Q3xaB8Iv7XhtzE0YoP6IphsC6FmunuKkHQ0GsrsCVDO
	jfgH9g1K5cN8lpNbY5Ix+Ol8m2fGPfbaN+xkx+oJ1LAEk6CcAPeUMc0nTaYfMG8z6IgF080qm3x6A
	1ixyleHd30rHB9rWtX09eEFLaJiYszuhh87Fj7ul64EnKL2lFUfDmkrut8Bm/ph0UF1LFh/eaKvul
	hkiRJqVApYKX2q0sgXpf+CKSZKGQiIu6+E0vfzEj7dHrvtIWhILFDfHUFM5+eeDpkv/9GoIWoFd1o
	1sNxrQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOE-0000000AxPA-00y1;
	Thu, 30 Jul 2026 16:13:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTOB-0000000AxO2-46kt;
	Thu, 30 Jul 2026 16:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=U8MQ+sboj6Emxgip/vMO33V3JD1l2EBPOqtHqVRFw3I=; b=QJHbkG9inB4HeB0zhPf1Ecu+Jd
	PDG/oyKlbHHjqGSmdYTafJnH93wJVo47oZ4UcPWG1nshVtZbn1+iGB/krH9MxR5Vt8ty4rvEjUneS
	o4x4KUf9tAEAvjtZVhgHcnRDYAyZTyOPenqKYB8uxIPn16mpoIYXIJxcjhoHt1W5Q3jo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wpTNh-00F29y-48; Thu, 30 Jul 2026 18:13:13 +0200
Date: Thu, 30 Jul 2026 18:13:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 1/4] net: pcs: mtk-lynxi: check regmap reads in
 mtk_pcs_lynxi_get_state()
Message-ID: <e2ae2cba-e62e-447c-b5f4-25411cac11ff@lunn.ch>
References: <cover.1785427248.git.daniel@makrotopia.org>
 <c41c256a5b4695bec24abc6baa4f990fca88f834.1785427248.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c41c256a5b4695bec24abc6baa4f990fca88f834.1785427248.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_091344_015366_35EFFA15 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, Jul 30, 2026 at 05:03:11PM +0100, Daniel Golle wrote:
> mtk_pcs_lynxi_get_state() ignores regmap_read()'s return value; a
> failed read leaves bm and adv holding uninitialized stack values
> which are then decoded into the reported link state. The regmaps
> backing the MT7531 SGMII PCS instances sit on an MDIO bus where
> reads can fail. Check both reads and leave the state untouched on
> error.
> 
> Fixes: 4765a9722e09 ("net: pcs: add driver for MediaTek SGMII PCS")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

