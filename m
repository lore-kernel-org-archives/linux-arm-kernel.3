Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA67C71150
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu56gJEPT/dll+DCcpilh6mQBpfDDaajcO/nm/N6eRw=; b=TbhGrTWn0smmix4CopN1+w7NV8
	VjRj9OQlGmE21Jj5HG0vUbe4TrCFmyCwq3S4TQy62NrGtqJE+wu8O70+6uU/uWXingIJcqM3kcoAT
	fSA/JZsNoDdZU6mrfogldNDjP5Z1IEIvDMbIRiEesLIoCPpdorHcoaPWS439EfeUphgD6QflVywAH
	AWa257iwbOIMZpVyRzXrQQMsVaVKB/SZEcJil/Zly0nCKzADmqNnQAVc9bq2lI/GG9fRNxf5REvje
	7fE7vZvSlEQFkUovYpnl/9SjdKBPrrnZXCpXVFcVlDVmOVBVpfhOc7In5m6z/rZuDNLfUr6Lxqd47
	xmzaUDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQTry-00000001X0O-1JBU;
	Sat, 14 Jun 2025 16:36:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQTpm-00000001Wv0-2IGn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 16:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A532861126;
	Sat, 14 Jun 2025 16:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60D9C4CEEB;
	Sat, 14 Jun 2025 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749918861;
	bh=6DHh6qMvxKyEHqO6TUPLFEX3fT9/Ww7Zix2JLZu2+zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiudJ1/UIPb/qZf3XFHvsUzlYqe22b0WpmGze8OxroK/l0VvhVx2PWU3fYxNm+Pyg
	 aVq4y2MqJVfaU5Re7+JiVycEEpumJgxU0x6j75lJIfsXMaegqv6EwFBt+U8wbP2p8w
	 AZ+0jWQxeyORVD4piEMi9rJvimJnV5pKlVhV0mZtx6nTkKE0g4ZSGffdyRZhPV0quV
	 sbaXpXEXhW+EhJtNAZkg5bVVoXdla2UahdHv87wJRQXrFSi6zE5d+5fFPzB4CEoTz9
	 A+f2fQmaW/7XieIf71Kb8mgEuwRbtgRcKUxS145xGnfA1G/kWHUXz3fyjk5kPm/Nph
	 F4HbQVqYVXj3Q==
Date: Sat, 14 Jun 2025 17:34:16 +0100
From: Simon Horman <horms@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Read firmware-names
 from device tree
Message-ID: <20250614163416.GT414686@horms.kernel.org>
References: <20250613064547.44394-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613064547.44394-1-danishanwar@ti.com>
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

On Fri, Jun 13, 2025 at 12:15:47PM +0530, MD Danish Anwar wrote:
> Refactor the way firmware names are handled for the ICSSG PRUETH driver.
> Instead of using hardcoded firmware name arrays for different modes (EMAC,
> SWITCH, HSR), the driver now reads the firmware names from the device tree
> property "firmware-name". Only the EMAC firmware names are specified in the
> device tree property. The firmware names for all other supported modes are
> generated dynamically based on the EMAC firmware names by replacing
> substrings (e.g., "eth" with "sw" or "hsr") as appropriate.
> 
> Example: Below are the firmwares used currently for PRU0 core
> 
> EMAC: ti-pruss/am65x-sr2-pru0-prueth-fw.elf
> SW  : ti-pruss/am65x-sr2-pru0-prusw-fw.elf
> HSR : ti-pruss/am65x-sr2-pru0-pruhsr-fw.elf
> 
> All three firmware names are same except for the operating mode.
> 
> In general for PRU0 core, firmware name is,
> 
>         ti-pruss/am65x-sr2-pru0-pru<mode>-fw.elf
> 
> Since the EMAC firmware names are defined in DT, driver will read those
> directly and for other modes swap the mode name. i.e. eth -> sw or
> eth -> hsr.
> 
> This preserves backwards compatibility as ICSSG driver is supported only
> by AM65x and AM64x. Both of these have "firmware-name" property
> populated in their device tree.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
> v1 - v2: Changed commit message to include an example as suggested by 
>          Jakub Kicinski <kuba@kernel.org>
> 
> v1: https://lore.kernel.org/all/20250610052501.3444441-1-danishanwar@ti.com/

I agree with Jakub's comment in his review of v1 that the backwards
compatibility aspects seem fine. And, overall, the patch looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>


