Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B36C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ORbq48ws88BzoCg+3C3lrqxEVQITGSfVV6sDqkLObc=; b=fGPfU9bkYvZVhsZCrrQzeJbEAV
	KndkN9xqHdpBVclbfi2TYvr4bYbtrwBHbZ5hNFDIw4utiDHZ1YL7kYVer11MiSmrtBJ/cKw5V7W0C
	YDjSu7JQeTf2qfrqwLbEHY6ggKjVFwz2js0Zfql3RULiJTtAo4ZRZ52z1UyOkMOlM2sYmIhCUQ9ef
	KPyJq6T9OTYjkbQkgQFu4GV0KCQQGt3j0lRyXO7/KsoHP6cdNdBYBI/c4DBhtxaHgRyKLi3s9U7dJ
	5BmAlQcsBq4AEEbdF6IoHsYDWH+IQ33QH+ZKKkd3saGsLQBUqwJQSzUTDvUR8YRDTAMn11u7jpr4H
	QKvyClfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY8dx-0000000Gv2E-0Ikd;
	Sat, 05 Jul 2025 19:33:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY8bd-0000000Gusm-0tO3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 19:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6ORbq48ws88BzoCg+3C3lrqxEVQITGSfVV6sDqkLObc=; b=HlF6kCHm7Z1146GdO7SLnj71+9
	/C+tGhuejjoazPhpxK8Ve0ym29eARPV84ad6YdaQtI40RgwcZklR/avhIMFzXMlXa3ON+jwdIq1sf
	nQBaxTHR3rUktGW/TbF+I88NmIQKyZvgSISYK4QeBFEDHtbyj+Kxri2K50SkpUKe4peSCdmgVJpLb
	Nh+PKQrDTWdz0G81MuxYnENLP5wDTaGegMl7BDsvWff/ph9OZav9mh0oo3tWDrcl1LeYZe3a13kLj
	uhfEnB7I0ObqceH8Vzo5gw0VexoLR8a6yuUZo7tZDiBlZXxDdKEhSFlYwVVm51Ekg3xy0Ju/82JvI
	EbIUvTrQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50760)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uY8bP-0003UC-2L;
	Sat, 05 Jul 2025 20:31:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uY8bL-0007Ki-1z;
	Sat, 05 Jul 2025 20:31:07 +0100
Date: Sat, 5 Jul 2025 20:31:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Message-ID: <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_123125_255603_F6E7F2BE 
X-CRM114-Status: GOOD (  10.96  )
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

On Sat, Jul 05, 2025 at 06:03:24PM +0100, Biju Das wrote:
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> 
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
> 
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
> root@smarc-rzg3e:~# ping 192.168.10.1
> PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> 64 bytes from 192.168.10.1: icmp_seq=1 ttl=64 time=2.05 ms
> 64 bytes from 192.168.10.1: icmp_seq=2 ttl=64 time=0.928 ms

You should also test with the interface configured before suspend/resume
and confirm that it continues working afterwards without being
reconfigured.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

