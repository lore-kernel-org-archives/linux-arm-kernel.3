Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECE5CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzau+2IiMd5fmjjZsXIksbdqUfY4ALqFsU+r0yQdOvs=; b=NnXj81Bj7Fv4iNL0Mz78bJdapE
	txtOMdQgKObmDoLATWb/EoYL/aNBG78gpit0ESBY6wNMnmbNIKSgTXSYlZ/Z3VWR2SBLCNijgy36M
	jbm0Q0kt/aYK9OiE4e4x2lA6O8TbhXSIOK48Hv1BUEIblYPurnGc2Hx9w0jPScZpcZz4reNM9PKVa
	3Jw6YXymsOn3WGYL4rYGXhPNzSYcrhJNGfb/IzsM7TnH5jher7ZY9I1AxMNtog+4WSj+w1exlvBxq
	Mt43XsO9CJh1Lb4kK9mAEKN2rqinT4yKrwrKPddctcXVf5uSd4pex5Zl1kbW+oKRzdENzoxhdVNf0
	KvyCTsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98bt-00000002tc7-13zu;
	Wed, 15 Oct 2025 21:00:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98bs-00000002tbz-0z5c
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qzau+2IiMd5fmjjZsXIksbdqUfY4ALqFsU+r0yQdOvs=; b=aVs6c0lGrStz4NPeyxozytuXcN
	w8vJyUqT+iZ51LvG8XtVdwMijW9B6lFxRgIoEK2z1xeC96s+dcqNDLJlJVaBpEPjHUVh+UVorx0zf
	IfbmQGb28k7VtrDNvedcxYLAPuOIOAVwpsG4+kj5YPhtwPOsWOYSUp/lcg7nDotx64ZTRXQWxkb2W
	ChZ5x0XQroL1WaNcsZKHmWbM2U8wICdRByaxPaNtInGJ/7kGDq7dpW4hJDyDqaE0+xWzNrdZmxnju
	PjFEEckJxBqyiaGGwgj6OLQYGh4Q+N+mSFghnWVv8Z0Wg3AoKhkufOZTXDnrGik6Ftij2GXOgx8GH
	4RANnt2Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98bi-00000006G67-1OvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qzau+2IiMd5fmjjZsXIksbdqUfY4ALqFsU+r0yQdOvs=; b=bWeEwmMzbtp8+O05AdPNYgUu/p
	IHmi13D2KzF4+B2uUu7P5mN5YC0vx9H9yt1W3M/jt5+nyXLLufX1sIpO1lHgAwuVQYtjGGCXU+283
	Teq6AgAqfQtLuX4SjkpxzdGWvUhiN0AIeYSMOf9IUphj3KXEAsvZEZdIns31ljTxiYLQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98bR-00B4m9-2I; Wed, 15 Oct 2025 23:00:09 +0200
Date: Wed, 15 Oct 2025 23:00:09 +0200
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
Subject: Re: [PATCH net-next 11/14] net: stmmac: do not require snps,ps-speed
 for SGMII
Message-ID: <5c5b0dd4-0c08-48f0-bbb8-21afcdfc102e@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92N3-0000000AmHQ-4Bm2@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220033_061932_ACE222AA 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Oct 15, 2025 at 03:20:53PM +0100, Russell King (Oracle) wrote:
> SGMII mode does not require port-speed to be specified; this only
> switches SGMII to use the MAC configuration register speed settings
> and the actual value is irrelevant when the link comes up.
> 
> As it seems the intention was to support "reverse SGMII" with this
> setting, but the code didn't actually configure that due to a typo,
> the warning and bad DT binding documentation has led people to
> specify snps,ps-speed in their DT files inappropriately.
> 
> If mac_port_sel_speed is zero, then don't complain that the speed
> is invalid, as this means we're using "normal" SGMII.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

