Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA680CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytwby/H7yoIvYQZDBtWwfjMD2jsEPkmCBllqFFuFNkI=; b=k+vqWnFeXIfP5QEA6ruznr8ILD
	UKwYhL681kQNZ9qTkMAD2ahL+4JEYYs9eMWeE2AahxEUHtB2mqLdABFj5FPCt9DI9wTvJWN2rDrpn
	Y/HCTcVm23p/wXoGeRtrDddu3Lb1mNyaC4norOC2cfXCoF4xe2Vf3QvWXrnRTqAu3JhSsqh5iAij5
	XOj8ziII0XMnNm5LAdquWDDa07ZnGPV/gdwlPJu6ZmRXvhG2CiVrUeb3HywcuMBY08fFTOCrmyGt1
	aB6W5miUwH85Zf5zXX47wa5Fr2zP1qMBaVqdWWJk3lJOmyPZJrqI/Se/iHlVJDiJL4GfY7V1U8WeW
	1IOCVFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99AG-00000002xCY-1rPw;
	Wed, 15 Oct 2025 21:36:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99AE-00000002xCQ-2oEV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ytwby/H7yoIvYQZDBtWwfjMD2jsEPkmCBllqFFuFNkI=; b=UdBeWd5gViQ/5hrQJdI5n2rD/K
	wDltBz+3K5Ixin7tofLODbYJyWTuHdwLcFaFTtFdwO3+BTRzUADaddI+ILBr0ZPj9XgiPAqic0iZP
	prmbWbn1561r6jLV3xMhMHJ1x74xz4VSImRI0YJGJ0Gt1bZgcAVTZbhGisZXNv/MI9kQrz9UyRZK7
	0HeHK7yZppGDUDilV/jusd2PpcXjx9XNUuiaYKy1uh/6rLUdZa/GP5GR7OCg4fBmcvxbSZwoduHtA
	a8VAeUa0XRj7bgF5ds8jRfUF2g9h2E4Xo2qUhDqDo4EKDxtb4LoJe574Q9lxwjGEOAgNfPdDgyMa/
	sCP65nNg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v99A1-00000006HvB-31SN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ytwby/H7yoIvYQZDBtWwfjMD2jsEPkmCBllqFFuFNkI=; b=qbYDsdtASCUBkkMsXn6ckqDBMX
	MCK9ZuU/D+lTMmivWeS7fSVduOXEc4ZvI9/7cGwDUmorSZKiS0Pb8sf2AWKL0y8sO4y4Yk3hY4SRH
	3CtdXNdz0CF09Du81lMMa43FuOuJsviy2uPhBJnCwW420vP6TxN52m085rfnC+acJ5hA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v999o-00B50S-Ab; Wed, 15 Oct 2025 23:35:40 +0200
Date: Wed, 15 Oct 2025 23:35:40 +0200
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
Subject: Re: [PATCH net-next 03/14] net: stmmac: remove SGMII/RGMII/SMII
 interrupt handling
Message-ID: <51db1103-afd7-430d-9038-7094032347fc@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_223557_415186_0399C526 
X-CRM114-Status: GOOD (  10.18  )
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

On Wed, Oct 15, 2025 at 03:20:12PM +0100, Russell King (Oracle) wrote:
> Now that the only use for the interrupt is to clear it and increment a
> statistic counter (which is not that relevant anymore) remove all this
> code and ensure that the interrupt remains disabled to avoid a stuck
> interrupt.

Will this interrupt come back later, as part of the PCS? Or will the
PCS be polled?

This leaves this counter unused, as you said. It does not look trivial
to remove it, it is part of the statistics ABI. But if the interrupt
comes back in a later patch, this counter could also be brought back
to life?

   Andrew

