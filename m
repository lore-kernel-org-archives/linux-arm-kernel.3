Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52559C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=246+YFY0hcM1gZTyJYBwDA5GnPdAK2YN+khCzJ9w3xk=; b=hFok6opaoqlqapxbF2xhcXPXEZ
	7E4/WAUTC52yj65N61PFN0TTpIvlgG53fSqPH2+BVTO4RCYg9UpfulUlgIab5aXndavaTnUidmcM1
	PiIEC240iBTqsCP26ldguoTletLo/+eJF8xKxYdqgbCfmfBURq7wxgJuaNe0LJ9TMzuDoGhRO4tD5
	YlXnaixcC/fMy2Gv7uI3tLo8TyWrexfDV0R1D+B63VccJ9LurrqSPmZoj3LdaE38SeIme4O77Cow1
	P7CgXHVwzR3BJWE/sAftk7s0NVBoe/EoeBFos39s7MZa+l7Wh7ZXnaDDKPUMTH4HTRu0hjwTdhG8F
	Km0aKD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IsK-00000007edT-1TxX;
	Wed, 23 Sep 2026 09:02:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IsI-00000007ed0-1ipo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:02:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E43B442D9F;
	Wed, 23 Sep 2026 09:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A19F1F000FF;
	Wed, 23 Sep 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154165;
	bh=246+YFY0hcM1gZTyJYBwDA5GnPdAK2YN+khCzJ9w3xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fx1fzDL6n++zlKFba/TD6ua1TazikVupjqJ+tpB2waBe7XVD+F+lnJbkIVvRrElwe
	 S+6he4ANapJNJ/Ze0HxDGEOX0yxjravBL7HOehd2Ex37FDQdCd00tCSRZ87cd4+Mnr
	 sHiwZNMR2k6fi2LEZxorZKO3qiD5Q6FU9xnQ/d/dkX7dfB2m/5/WRYl8d3qN8F4c1M
	 aFBYXnwpbUfP2IQ5PCKADXrW+0GRtrH6rNknOYwlabC4oWP5WDznRFal9akAaOCPkV
	 USdsJUQTxiFkVJ0ZgmYOCOI6FbZlYB3tL2HLq/xebrNN/GcEVjrkC5rqm9ifYSaGu2
	 epfs3ppNEngXQ==
Date: Wed, 23 Sep 2026 10:02:10 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 09/14] net: lan966x: add shutdown callback to
 stop the FDMA on reboot
Message-ID: <20260923090210.GR13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-9-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-9-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:34:01PM +0200, Daniel Machon wrote:
> As a PCIe endpoint, lan966x is not reset by a host reboot: its FDMA
> channels and interrupt sources stay armed, and the OIC ORs every
> source into the shared PCIe INTx, asserted before the driver has
> re-probed. A still-active channel also keeps write access to host
> memory the next kernel will reuse.
> 
> Add a shutdown callback that:
> - frees the ana, xtr and FDMA irqs, masking and unmapping them at
>   the OIC (disable_irq() would leave both set - the OIC has no
>   irq_disable())
> - masks the analyzer source, armed unconditionally by lan966x_init()
>   and re-armed by the MAC table's age timer
> - stops and detaches the netdevs, draining in-flight xmit and
>   clearing netif_device_present() so ndo_open/ndo_change_mtu cannot
>   re-enter the FDMA against a disabled NAPI
> - disables both FDMA channels and masks their interrupts
> - unmaps the outbound ATU windows, leaving none armed
> 
> NAPI is skipped when fdma_ndev is unset (a probed switch with no
> usable port never adds one), and XDP attach cannot re-enter either,
> since lan966x_xdp_setup() returns early on PCIe before touching the
> FDMA.
> 
> Only the PCIe instantiation needs this - the SoC one resets with the
> chip - so the callback returns early on a platform device; the check
> is at runtime since .shutdown belongs to the driver, and a
> PCIe-enabled kernel binds both.
> 
> FDMA_INTR_ENA persists across a warm reboot, so also restore the
> full enable in lan966x_fdma_rx_start(), run after both rings are
> allocated, re-arming both backends from one site.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


