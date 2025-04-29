Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7AEC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAsgzzElHtUApNEoBgprTPUFakQkDKBE5GMF7B1Uav8=; b=muAlZ+iFWQucfKTmRsNrcpB8vr
	j1y0yJPC0OdXPkeaTH2A5CWH9IKJ8aXrzb1ntclSUrtZACK/k3o+pBhAHyfnlvxYR0Y6N6K+SYual
	gaJcHcaWwzUc/c1MqYwa+r8349xlSSQCQL+ME8K7y4/BuedMAHniXwwz8wSiauw7CT+bHYOIl+d9B
	v0g+lJPAeWyd9Aphq0NW3aPTDMYDjurZusRjYiD/l7NfmZLBlo+zLk721rcglA5H1/HzdLnOQSz85
	E7jQYf1J6jb8qpHy5txeym1k4QSShZHNwmAXCWPjkPS45At8iUG+df+eGfk9sxcST1CB3MS+McBZr
	/R9sJ0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nBy-0000000AAjs-1cOv;
	Tue, 29 Apr 2025 15:48:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mnI-0000000A6n5-1e8p;
	Tue, 29 Apr 2025 15:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oAsgzzElHtUApNEoBgprTPUFakQkDKBE5GMF7B1Uav8=; b=n0LNZHSzsoTp3/5XuhPHNmSl7T
	2oJmNZpbrms9myGV4Kgf2UCAM0E/hVx3v/QXdZi7neeURYhAS/gmxO2s9Gw+EbJIqrIMFWRGOULTE
	LWCeQu/sYP3v10VswWe8IiOeuzanncaFFfZ+joTNvtjPaNGgnNMfseT5npUA3lG+5QKWkCAW+aicH
	cwp/YTF5WiTzfb+pNDv76xeBIOXYyp9sSmdiVt8P2N4EkzbMIAE0xSXyquOstUpBRWZ76yVbV17hH
	Z0FBa5M0yONTY/qoarZlB7i5sfwId7gMg2/Pf0apoHdygUgKPbvb24oyaJqouutkN6AXkPeh/UJLY
	iK/rxEpA==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mnE-0000000DRKS-3L0W;
	Tue, 29 Apr 2025 15:22:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u9mhG-000000005QV-3RYH;
	Tue, 29 Apr 2025 15:22:30 +0000
Date: Tue, 29 Apr 2025 16:22:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: add support for
 MT7988 internal 2.5G PHY
Message-ID: <aBDusgnaJUmZrp_v@makrotopia.org>
References: <ab77dc679ed7d9669e82d8efeab41df23b524b1f.1745617638.git.daniel@makrotopia.org>
 <aAwV4AOKYs3TljM0@makrotopia.org>
 <687380A7-A580-41EB-8278-73B9942E4280@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <687380A7-A580-41EB-8278-73B9942E4280@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_162244_958012_C9DC6E99 
X-CRM114-Status: GOOD (  23.28  )
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

On Tue, Apr 29, 2025 at 04:12:19PM +0200, Frank Wunderlich wrote:
> Am 26. April 2025 01:08:16 MESZ schrieb Daniel Golle <daniel@makrotopia.org>:
> >On Fri, Apr 25, 2025 at 10:51:18PM +0100, Daniel Golle wrote:
> >> The MediaTek MT7988 SoC comes with an single built-in Ethernet PHY
> >> supporting 2500Base-T/1000Base-T/100Base-TX/10Base-T link partners in
> >> addition to the built-in MT7531-like 1GE switch. The built-in PHY only
> >> supports full duplex.
> >> 
> >> Add muxes allowing to select GMAC2->2.5G PHY path and add basic support
> >> for XGMAC as the built-in 2.5G PHY is internally connected via XGMII.
> >> The XGMAC features will also be used by 5GBase-R, 10GBase-R and USXGMII
> >> SerDes modes which are going to be added once support for standalone PCS
> >> drivers is in place.
> >> 
> >> In order to make use of the built-in 2.5G PHY the appropriate PHY driver
> >> as well as (proprietary) PHY firmware has to be present as well.
> >> 
> >> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >> ---
> >> [...]
> >> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> >> index 88ef2e9c50fc..e3a8b24dd3d3 100644
> >> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> >> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> >> [...]
> >> @@ -587,6 +603,10 @@
> >>  #define GEPHY_MAC_SEL          BIT(1)
> >>  
> >>  /* Top misc registers */
> >> +#define TOP_MISC_NETSYS_PCS_MUX	0x84
> >
> >This offset still assumes topmisc syscon to start at 0x11d10000.
> >If the pending series[1] adding that syscon at 0x11d10084 gets merged
> >first, this offset will have to be changed to
> >#define TOP_MISC_NETSYS_PCS_MUX	0x0
> >
> >[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20250422132438.15735-8-linux@fw-web.de/
> 
> Imho this should be changed as well
> 
> #define USB_PHY_SWITCH_REG	0x218
> 
> To
> 
> 0x194
> 
> It is used in mtk_eth_path.c set_mux_u3_gmac2_to_qphy

This depends on how we define topmisc for MT7981, as the MTK_U3_COPHY_V2
capability flag is set only for the MT7981 SoC (and hence I would not touch
it in a commit regarding the MT7988 SoC).

In MediaTek's SDK, it is defined as
    topmisc: topmisc@11d10000 {
            compatible = "mediatek,mt7981-topmisc", "syscon";
            reg = <0 0x11d10000 0 0x10000>;
            #clock-cells = <1>;
    };

