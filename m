Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DCD1036C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FesFCToQspFq4tboaTqpc09nhNIi95vNt6BcM6NYbRs=; b=l/BX4l+RJCgVO9Ilcp41BYvSil
	Ysof6tZGTUSdcvLqTgYXoR/y6s1/Aw5tAIxTDGvRMP/O1T3w7d/092Xktx/PahYaz4pFAr1ig2HIw
	7X6W2IocpO5sQaP81wsRDAUDEjkIZnGTG3NtVcKnG5Yt8VGvGTMym+2h7900JWhqSxu8uU7qtG4bz
	0Ww06LZECzQBbhWxqLKgqoznxbVFHZBW4l0DG1F+uPMY5GmqkaurO5oCJoN+RKY0+NS0oA9ZxY1Xh
	tz3abSCfUuPlVkecBwdZW+cxKlDMMeslqvVMysJnkn8F6hT4tTZVgF7MOhCKt0YRJpWEZPrScVTGa
	hd77C55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2jt-0000000E5Nz-2kKI;
	Tue, 25 Nov 2025 23:46:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2jp-0000000E5NW-2nyy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FesFCToQspFq4tboaTqpc09nhNIi95vNt6BcM6NYbRs=; b=JM4HoprP8viQFMd9g0NmwQ7Z+m
	P6KgwuM1w2Xv6t0AvfTeIFpxQTgS0JCfDlUY/iEDwfBs47gjc4nIgo7+Z5C8OVZOniW9X6uf9vi+O
	Plb3ePl2i25w9iKdUkQD1ts9YtaCNRW+I+Lc3mqvvWXY4zeU3Z8Y8KkhZq/8OVgtDGF54X1Su2Z8P
	3pnWpArvQR0FsAaz6y5ib5oCd1m6DZlSBiz7TDUSo/oY3o9CCvCtk5JGuorLvkF3CsQuE57TM86Zr
	gdMe5sHAGAbp8ittT6Ba+z1ZPE3P0W8lMMIcM4DoILl7fBrgVMAIno3unY3eTN9bt/TEEOAumgnw4
	1wrLg4hg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40256)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vO2jf-000000003Ju-1d1K;
	Tue, 25 Nov 2025 23:46:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vO2jc-000000001BP-2gpy;
	Tue, 25 Nov 2025 23:46:12 +0000
Date: Tue, 25 Nov 2025 23:46:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac: Disable flushing frames on
 Rx Buffer Unavailable
Message-ID: <aSY_xIYWfv9YAv6Q@shell.armlinux.org.uk>
References: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_154625_727570_76590901 
X-CRM114-Status: GOOD (  16.63  )
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

On Wed, Nov 26, 2025 at 12:37:12AM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> In Store and Forward mode, flushing frames when the receive buffer is
> unavailable, can cause the MTL Rx FIFO to go out of sync. This results
> in buffering of a few frames in the FIFO without triggering Rx DMA
> from transferring the data to the system memory until another packet
> is received. Once the issue happens, for a ping request, the packet is
> forwarded to the system memory only after we receive another packet
> and hece we observe a latency equivalent to the ping interval.
> 
> 64 bytes from 192.168.2.100: seq=1 ttl=64 time=1000.344 ms
> 
> Also, we can observe constant gmacgrp_debug register value of
> 0x00000120, which indicates "Reading frame data".
> 
> The issue is not reproducible after disabling frame flushing when Rx
> buffer is unavailable. But in that case, the Rx DMA enters a suspend
> state due to buffer unavailability. To resume operation, software
> must write to the receive_poll_demand register after adding new
> descriptors, which reactivates the Rx DMA.


This seems like a sensible writeup, which all seems to make sense,
even though the databook I have seems vague on the effect of the
DFF bit.

> This issue is observed in the socfpga platforms which has dwmac1000 IP
> like Arria 10, Cyclone V and Agilex 7. Issue is reproducible after
> running iperf3 server at the DUT for UDP lower packet sizes.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Given the above, that Maxime has also tested it which shows a net
benefit, and I've looked through this, even though I can't positively
say it's correct due to the databook vagueness:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

