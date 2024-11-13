Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF0D597C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mHStR/VLKKz3Mn0zc0mAE1DUmttzZaGs19RiSFxzuk=; b=ohxl1ZodpJpU0VZNBhqzKHnfaB
	uzUxqxbCyakT0M8KowmQWMVN9asPIvMwJy4q+dHFG3krnaAM0IAmx0pnetMk2kxeX3kldiHqVky6A
	LfB7vvyIUnBrWeHHL2n1HeIhKCVcwAX04kBof7OzvM/eAlASvcRukNIBkatm6JLSESUyWSQzPzhPd
	TvhNAi8pjBcJrJlshHYh0d6LXBlnlc/v2c+cdMvKjJDipCQATtA72ENX5XT/kQLRnzeoYVWrEh5LT
	zA0cVpA4BybM0iq/7fWDWKGoCfwQTR4nec9IcroAV3B2rb01qzqAmcN4dvcRUNJf4SKwc3qFy7DAk
	3xCske2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB27u-00000005Vq6-05aU;
	Wed, 13 Nov 2024 01:24:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB266-00000005VaN-2lCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 01:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E6FDA41DBD;
	Wed, 13 Nov 2024 01:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7378C4CED4;
	Wed, 13 Nov 2024 01:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731460985;
	bh=KzYtezsHHZd5EyINMqqHGG51cXOLpemJwiEUUpvOkA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OEkPE6u2U1WuKnADIOhylmi3CfE92O+1fH0PMk2OcC97uHIF+rD8uPt98OdIcOFX9
	 mBHnkR5vQiCHCFBZWV4FS+jfrBZtscCc5p17M9osJzRLrVx8uMnlviKNu52llsksUI
	 nfbdlsdAAR5V8jJOI4kK4pxjs+qrOaioOp+7aR58hBHoabKdA1qGfXOgO0zMLHqxFR
	 aJSkCG41lRt2Of0Iavy3zRQiuErE3Q23RHcNwXXI7fWGrChlM1ZuKGJBFhtbxsuJQv
	 zfQVeL5tRPZVRYJ03Vn34rjURJ6jgx/w9/GNCbhOYjCi2u9NZ3I6577l4olYOkP7L9
	 mM9NSMb5hQveQ==
Date: Tue, 12 Nov 2024 17:23:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Pantelis Antoniou
 <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Byungho An <bh74.an@samsung.com>, Kevin Brace
 <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Michal Simek <michal.simek@amd.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Zhao Qiang
 <qiang.zhao@nxp.com>, linux-can@vger.kernel.org (open list:CAN NETWORK
 DRIVERS), linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi
 SoC support), linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi
 SoC support), linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC
 FS_ENET DRIVER)
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
Message-ID: <20241112172302.582285d3@kernel.org>
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
References: <20241112211442.7205-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_172306_796961_96228FDA 
X-CRM114-Status: UNSURE (   6.90  )
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

On Tue, 12 Nov 2024 13:14:42 -0800 Rosen Penev wrote:
>  drivers/net/ethernet/moxa/moxart_ether.c      |  6 ++---
>  .../ethernet/samsung/sxgbe/sxgbe_platform.c   | 24 +++++++------------

coccicheck says:

drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:130:6-26: WARNING: Unsigned expression compared with zero: priv -> rxq [ i ] -> irq_no < 0
drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c:124:6-26: WARNING: Unsigned expression compared with zero: priv -> txq [ i ] -> irq_no < 0
drivers/net/ethernet/moxa/moxart_ether.c:468:5-8: WARNING: Unsigned expression compared with zero: irq < 0

Is this really worth the review effort? :|

Please do not send any more conversions unless the old API is clearly
deprecated. 
-- 
pw-bot: cr

