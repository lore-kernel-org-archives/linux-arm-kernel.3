Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2AD5D695
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ttKD2JDCoDptxDdNvZxe09sisTs9kAndANsW/SPTeA=; b=UvaaTaTEz8QjaLz+tq0OtOl1PX
	hgrsxBmZCY9MizRP7cjzziNZFhVuiAScz0D+D7kwduxVD+4SasZDE4g6kctriK7nG0p3lxdjGfkR6
	Y9Rmg/P1Hw6C4ujbiB67iub9Lb9WBo+Vj0Jf7pKKKkM+JPF2otsdX42j2gwxFxn7SZ2cOuU4NuAuS
	3hfecoaV2oVlWzmuFQBLV43kPV7iz54hg0s4ZtntyE6GuJ5LyJ4m+S+3WpPY0P2vC7B3TavDBQcf0
	fbS250CkEuPyd2G5xufLW2ATytooDW+2vOwfWT+7JKvnWA8dHMZ5i9pWWCuJmkRojUpOngtXYDTLH
	h5U4RYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9BE0-00000008a2V-0ib4;
	Thu, 07 Nov 2024 22:43:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9BAU-00000008ZIk-0w7R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 22:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/ttKD2JDCoDptxDdNvZxe09sisTs9kAndANsW/SPTeA=; b=PVc2/FJbnnIVZfzKiosEU+z98F
	gktCgfnYSPaIom6AWSVBBcCmjffJWd3ApVDOfBVRL2IY686q0nApdagicSKh1qXmYtJYCKe3DHB8V
	pvdsNO5lTO5Jihdx7iKSaSvDC9wShIzWb999eAbq4UwpvV5r6997wO8OwlxeSzIcSgIc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t9BAC-00CWEw-Ll; Thu, 07 Nov 2024 23:39:40 +0100
Date: Thu, 7 Nov 2024 23:39:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/7] net: sparx5: use is_port_rgmii() throughout
Message-ID: <4748d3a9-55e8-48f9-b281-60ec619bf304@lunn.ch>
References: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
 <20241106-sparx5-lan969x-switch-driver-4-v1-3-f7f7316436bd@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-sparx5-lan969x-switch-driver-4-v1-3-f7f7316436bd@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143958_285559_E78B43AA 
X-CRM114-Status: UNSURE (   9.30  )
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

> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> @@ -1087,6 +1087,9 @@ int sparx5_port_init(struct sparx5 *sparx5,
>  		 ANA_CL_FILTER_CTRL_FILTER_SMAC_MC_DIS,
>  		 sparx5, ANA_CL_FILTER_CTRL(port->portno));
>  
> +	if (ops->is_port_rgmii(port->portno))
> +		return 0;
> +
>  	/* Configure MAC vlan awareness */
>  	err = sparx5_port_max_tags_set(sparx5, port);
>  	if (err)

That looks odd. What has RGMII to do with MAC VLAN awareness?
Maybe it just needs a comment?

	Andrew

