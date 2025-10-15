Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3C3CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh/fSAov4tjMnF+iirLbWWSTmXztldsNY7yq9G5LkSo=; b=XYS4+2dQIcZsuK4lFGPJhO8Qtp
	b1MtotVkBxRpLuivkvZj/4TGYj1p1w3h5wVAbvVDNDhYcs88+tBKVjTOyTi7oN493/0pkub4X+LNj
	kWTEOUXs9TaqT31rG5RQBr8fPGNjQBWLxGtMnFCgP/5HNpM9RuX7LSwrgVchysnS/gd4ELI8HvJmk
	D3H5s8s+3sctgdoPrrfnXA11XB6TeGhdvNSf+u02G3iqZMPF/Tit2lod1aB6qXlvGHkeezMqUlqE9
	qOFlNkNYSNHiGhv5NDKksXqurQAjUAODFkZN68l6wGLbPaAQqVoE2vrePiIQPtbYpxPbSC5/YIvH0
	RS1F9v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98XP-00000002swz-0VzQ;
	Wed, 15 Oct 2025 20:55:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98XN-00000002swp-02eu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xh/fSAov4tjMnF+iirLbWWSTmXztldsNY7yq9G5LkSo=; b=TNd+eHTbreqATeJtWit5pC3dDB
	ygh0oWBznnxT0IMJZda4ibygI0gXDhdUvctDBADxBV5NAfkXHGmc3fzMvtgqiYeYSz4VmFUyVm0eM
	uZ2D1HPjuoIBH7WbZxJlUn4zBYb4csJMhX/cr+PW7e6YgclNh1ECLskQoclfgT3sFL7D5OaBFT8Wp
	SmkCsahYBnz+C/KdqDZq63m3yDukmsYcfNWJhknZ3VsrSWyKu3JVsKzuMOxjlBv3aXlcgbY575lGw
	KEbLilgDkLgzFjPcDVCBTn85X+2oJwG7T8z5TwPLEl5LFpUYh9saQ5/JEM5/JWl0rkhDD638vy6Kz
	kvwNY63w==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Wt-00000006Fto-08LP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xh/fSAov4tjMnF+iirLbWWSTmXztldsNY7yq9G5LkSo=; b=ZM1Lq07IfCxLuOSQu1IpF1/1Kb
	FjfHsi8Dp/Yt/s8pSn3hy9AZgLvheVYhN5QsutZmXTZB7a64+VipVduR5XgP9MdBEbHH43QVZHQXr
	+y6TtDjuz4WcPMR9Is1UVvVlcR0TDy2vr/A/0lfA3pEWEtOoiWRuK58eMfF5juuEEJyQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98We-00B4hO-5C; Wed, 15 Oct 2025 22:55:12 +0200
Date: Wed, 15 Oct 2025 22:55:12 +0200
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
Subject: Re: [PATCH net-next 08/14] net: stmmac: move reverse-"pcs" mode
 setup to stmmac_check_pcs_mode()
Message-ID: <6e214af7-a734-44d4-bbcb-6d7a49ed219d@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92Mo-0000000AmH8-2aPl@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92Mo-0000000AmH8-2aPl@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_215531_112276_DD0282CD 
X-CRM114-Status: GOOD (  11.26  )
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

On Wed, Oct 15, 2025 at 03:20:38PM +0100, Russell King (Oracle) wrote:
> The broken reverse-mode, selected by snps,ps-speed, is configured when
> the platform provides a valid port speed and a PCS is being used.
> 
> Both these remain constant after the driver has probed, so the software
> state doesn't need to be re-initialised each time stmmac_hw_setup() is
> called (which is called at open and resume time.)
> 
> Move the software setup of reverse-mode to stmmac_check_pcs_mode()
> which is called from the driver probe function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

