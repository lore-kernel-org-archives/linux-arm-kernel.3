Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D903F9D0FD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 01:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9gjWrpCbTtEVvg30V7StRQdyDT0ZMhIUqhmyfKt3EI=; b=wgLGrOayfRthuPmMtsjFws+AVM
	CRTea5/9uXRaZJzRZ67ruxACUDK2cbsEpk+bmH8TsLUlHU5prgGug4pkp6kFoz3CMX2biaJ3WDk3G
	kR02Ueb5G7drub+9qdT+vZ6n3C7lKDAmWOMxuedvPIo9xKLl0WGbMHgqGKT+WwTAaK7uoZu9ZXA66
	VHFEWUrIOYjwIllK6QXeFaLawIu6148FzRbdqTrN530/gIY1crQvu/2rUF8u8lcNS8cNQje7y+HK8
	SH/ZgC9O+NCB3fK0jyDkrteb4IiMdRYPyr9cxbHOkK0wz7An9nCzg7Ej/c3KGcW3d4xvs5hUFFfbU
	r/uhBWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCovC-00000000Q5z-03aI;
	Wed, 15 Apr 2026 01:20:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCov8-00000000Q4z-3p0o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 01:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I9gjWrpCbTtEVvg30V7StRQdyDT0ZMhIUqhmyfKt3EI=; b=iPpV8nFrKYUIIkc1YpLGD3Xeu2
	hPUHegJCV3EK6tA9b21oLvfkMtwAVWPF7+ZGS/p6oDd3uqXe0jH+gGtmaO2aJaFwBMx5ENlCY0p0N
	OfFPnOX/tlgkcU9FdtUQryr65LZiVeRz8z45uHH9Hp2cz197A9X/Dz0NGJvRKs3CpfZsUdv7NJPLf
	PenW88HFESBGqVHxH9ZY0eHMtmTRudd27RfqU9fV5TXGno9gK3vMAnhm5WGfNR5LnMOf396w56d33
	zm8lcFwAPW3B+UOvrHAsG6+4427rVYRq2lCUWRWYkxoiFOijoxsC7Jf/U3U23UzT5k7gMMLfWigzi
	c9nUk4PA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49420)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCouz-000000001Ym-2IHP;
	Wed, 15 Apr 2026 02:19:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCouw-000000001jJ-0Fav;
	Wed, 15 Apr 2026 02:19:46 +0100
Date: Wed, 15 Apr 2026 02:19:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux Network Development Mailing List <netdev@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org>
 <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_181958_959923_FE8F09FE 
X-CRM114-Status: UNSURE (   9.94  )
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

Okay, just a quick note to say that nvidia's 5.10.216-tegra kernel
survives iperf3 -c -R to the imx6.

Dumping the registers and comparing, and then forcing the RQS and TQS
values to 0x23 (+1 = 36, *256 = 9216 bytes) and 0x8f (+1 = 144,
*256 = 36864 ytes) respectively seems to solve the problem. Under
net-next, these both end up being 0xff (+1 = 256, *256 = 65536 bytes.)
Suspiciously, 36 * 4 = 144, and I also see that this kernel programs
all four of the MTL receive operation mode registers, but only the
first MTL transmit operation mode register. However, DMA channels 1-3
aren't initialised.

net-next derives them from:

        unsigned int tqs = fifosz / 256 - 1;

where fifosz is passed in to dwmac4_dma_tx_chan_op_mode() and

        unsigned int rqs = fifosz / 256 - 1;

where fifosz is passed in to dwmac4_dma_rx_chan_op_mode().

Now, according to the DMA capabilities:

        Number of Additional RX channel: 4
        Number of Additional TX channel: 4
        Number of Additional RX queues: 4
        Number of Additional TX queues: 4
        TX Fifo Size: 65536
        RX Fifo Size: 65536

However:

# ethtool -l eth0
Channel parameters for eth0:
Pre-set maximums:
RX:             4
TX:             4
Other:          0
Combined:       0
Current hardware settings:
RX:             1
TX:             1
Other:          0
Combined:       0

So, we end up allocating the entire 64K of the tx and rx FIFO to one
queue in net-next.

Looking back at 5.10, I don't see any code that would account for these
values being programmed for TQS and RQS, it looks like the calculations
are basically the same as we have today.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

