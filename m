Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7092C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLROoyAHVOFkXVT7KlVb+bmp9j+P3DhuSKFlQ1xg7eo=; b=HC49v3C/Cja76RWv9nY4abS9PJ
	c8t21NZVYk3irI1p/+oX7WW06aw/wFQeZLlPdXHRkUD/79UA5q9dSQ7vZ4s4KX3cwMpSy0qnTjLMh
	f7bM7e1GC++6VtQoajP9MnXC7y5QGcJX4Z89RpiNOCRLy3rWQKxd15FFip0C6dHihnIM0O+yNiCD2
	f/B80JHo37voUHw0VTUB3gt241/vhGUcWjmvEjCiE8CadOtiGBVaqDumWDt+3xK12g+mfZxCc3vWV
	0ALNXPNm66BnAt33G7/ZDXNvlR2cvmP82ZlC3UDaUrQyrRnqniSVzO2Cf521mKOjtgbO2m8Z1QuN2
	oum9fCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4ad-00000006pTs-3HQH;
	Thu, 06 Feb 2025 16:18:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Gz-00000006mRY-0Od0;
	Thu, 06 Feb 2025 15:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kLROoyAHVOFkXVT7KlVb+bmp9j+P3DhuSKFlQ1xg7eo=; b=pVxexP9IgjUDKZkcKopBWmjyEr
	AMVcoOjnwx6N9cIH9VrVnxiIMmsk+FYngpAw4U3nYDl61fLOp/W7mSOlFSHELhPo01306ZCoX8aHz
	YC+gAldfo0O3LHKwMeHwWOV7wufnjJUrjRmjDDOVbmp2ypqFuFHL7r3WG/f0ChI6J+ZrUAMkx13qJ
	4r8t9ma5gYw3v0M94KqszSJrk5o04MgdejQ2SDP7rPpy9TNTnalbIAzkrXTOGREUUxdKyy+hCFI/I
	9tGBmMBCatGr2X2RBSjfJvFER/Oml2VA6OWvjtCntyNBf27EtAoONVPBUipzWk2pd61PlNbPUwu9h
	pdXo0B0Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49126)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tg4Gm-0002gd-29;
	Thu, 06 Feb 2025 15:58:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tg4Gf-0003XZ-0p;
	Thu, 06 Feb 2025 15:58:17 +0000
Date: Thu, 6 Feb 2025 15:58:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink
 managed EEE
Message-ID: <Z6TcGRaYV08IoFtC@shell.armlinux.org.uk>
References: <Z6N_ge7H5oTYt6n8@shell.armlinux.org.uk>
 <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
 <10de11cf-a443-472e-aaec-df9e2ed54090@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10de11cf-a443-472e-aaec-df9e2ed54090@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075837_131042_AE6E254B 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, Feb 05, 2025 at 03:42:30PM +0000, Chester A. Unal wrote:
> Hello Russell.
> 
> On 05/02/2025 15:11, Russell King (Oracle) wrote:
> > Fixme: doesn't bit 25 and 26 also need to be set in the PMCR for
> > PMCR_FORCE_EEE100 and PMCR_FORCE_EEE1G to take effect?
> 
> Yes, but only for MT7531 and the switch component of the MT7988 SoC. For
> MT7530 and the switch component of the AN7581 SoC, bit 15
> (MT7530_FORCE_MODE) must be set. The MT753X DSA subdriver sets these bits
> accordingly at the setup function that pertains to the specific switch
> model.

I'll remove the comment in the commit message. I also note from
patchwork that I need to remove lpi_timer_limit_us... so v2 will be
posted in the next day or so.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

