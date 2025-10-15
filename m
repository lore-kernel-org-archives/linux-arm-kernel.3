Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA89CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJBerh8Yj/4z2zrYhmh0chjw+l0sx+DRz1ztXndJfss=; b=vhDyg8l9jsgaGp5I302DBqyX6z
	+gAm/9PBUnMHZZBFcB+71ozJuT0WUOfFIrUeZ9+NAfBei4mMkIAAZmlsrJnBwAHLoJ8wUbqI7z0C5
	44xswagNC7OuyL+uKZLle0Li+ANcDfHw8r5FmANdd2LLcDDVPR9CjErbTVo0urhOoNZLPfcZzsAtg
	Hyl0Ohbw79QlAJ4B/t4xN19ugGAlXTyE5ehSqawoQ62wM8+jSAtoqfpJB2U6+EgZLIiVRv9vWnC0z
	AtgTRZQ+U6oS98Ty9oS3Ba4oBcYOfOBZE7PzYGoe2niKC2p4yOa6ppdelYgmcOl09xlLBs812NJQ0
	650Ga2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996F-00000002wnL-3EuM;
	Wed, 15 Oct 2025 21:31:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996E-00000002wn1-1acW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WJBerh8Yj/4z2zrYhmh0chjw+l0sx+DRz1ztXndJfss=; b=Yqp9E12OfFmeAb9f51OoXPOYa/
	NFH7FQBLFtuDNAYD2/1Gk1xtdjN3QZISvHbJk7HPeP29ItbSw08X5Jdh9IKlVWWlT5JEev0xmNm6M
	j3yIByeu3AOUC58gdpTnKPe29wqlqZozFW/4VEaFZS0vkp+uoGKQHPSPsL/GwKXnG9OF1nVowxtS6
	d9iC6lcV8PdsXNQsHFp400BVdFpDAbHD3l3FOcCDZ++aAQvRKBi/gEol4WHwY4PxknObEfpXMJTti
	xOOUGqHlgCrJWhbRV1iARpexlKyaYkZ3OftjUTOrxBeGcL9TE7YdoXu7UThNdIerxBELmBQeIO9gj
	8c5RbtZw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996B-00000006Hg9-07Vh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WJBerh8Yj/4z2zrYhmh0chjw+l0sx+DRz1ztXndJfss=; b=kmvD/htcIJrGnf6Y10JoV2hAxa
	zpLD6vqRZQ5OTUgpVbr+EJI1EAS2FWDMEr6Xw7mHVH6qAJBuXDg19h/2SMaujY1aLfVBJBsBFDSiu
	I+oiO2Pii7sentVQCnIOAjkn+k/JYeaO+bAjkp0nQJRpPIwy/T9Cm7AT/O3A/bjlQI/Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v995t-00B4xr-Te; Wed, 15 Oct 2025 23:31:37 +0200
Date: Wed, 15 Oct 2025 23:31:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 14/14] net: stmmac: convert to phylink PCS
 support
Message-ID: <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_223155_509983_6CDBCF81 
X-CRM114-Status: UNSURE (   6.06  )
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

> - create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
>   dummy .pcs_get_state() method which always reports link-down

I've not followed the PCS code too closely. Why always report link
down? Why is a dummy method needed?

	Andrew

