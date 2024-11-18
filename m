Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8FD10F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sz1jHbHlp8QHDI8p6axcNSLoVuizF3hYscPtQCpLJQk=; b=j8BR9oVfAizEgafl7V/igjApJL
	GxMohgP4ABdKDyClwyVBmvOLjAsY6MBnhyBtiF/04Qw0hgkjizReervakuhDiiOhRrEMVXDAcRjF0
	Rl9cphaLwIgPOqIjnQIlne0ZA8fbjucdiJEIvtVmnkdbrZgGpauljw7mPTkf+SKjkBvKC9TOwFXSx
	cP5Kdv9sWunU/AVA1tgaRcj7mepVJUUaPSghRJXj80fg8iIIG30aMJnv1VeBou++0n+HQ+WI/0x2e
	/FsqlPzDc/fFQaSuq3nSRHWXAbsGMO2XtzOBgtEiCH2BSTc0H4zgJ3C/SNDcaXFE4a7ctWqypGZgL
	kME87T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD48c-00000009zLP-13xP;
	Mon, 18 Nov 2024 15:58:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD47g-00000009zDh-0LQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sz1jHbHlp8QHDI8p6axcNSLoVuizF3hYscPtQCpLJQk=; b=biXQoHyBnaIUDYP3xC0QYwCpdL
	tBc+spdPnAfSbQvxnCkiL4+VaZQeQfDT+/2kMJaP6vsKf0wzOVR3Bh08pg8cvUfKVW1uHTYUZyP4p
	fJ+09bOWxGRUaLYeM5y6sNeofl4PchDZxCmBORt/9uJ5KdewChMjorjwQOrEXPPf3fLVeUm6lmIvg
	LEiMAa+AdDz+6fhQsFaEDQV2D37zPoeR+tDeP5u+FLW2ICRlN7wojvq8EYaflu2lnx4EmfGnbgQVH
	BJdH7Ec5wqBy6J/l8dFXMWVlqvCd8aE0L2o1EzysPs80B6MPR2uGMgACkoVMoqdTmfE4gqqFlyOxQ
	ILV4N1Vg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tD47O-00024l-0K;
	Mon, 18 Nov 2024 15:56:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tD47K-0005CP-2Y;
	Mon, 18 Nov 2024 15:56:46 +0000
Date: Mon, 18 Nov 2024 15:56:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	sean.anderson@linux.dev, radhey.shyam.pandey@amd.com,
	horms@kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118081822.19383-3-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_075708_116372_6BEEB8E9 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> Add AXI 2.5G MAC support, which is an incremental speed upgrade
> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> If max-speed property is missing, 1G is assumed to support backward
> compatibility.
> 
> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---

...

> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
> -		MAC_10FD | MAC_100FD | MAC_1000FD;
> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
> +
> +	/* Set MAC capabilities based on MAC type */
> +	if (lp->max_speed == SPEED_1000)
> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
> +	else
> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;

The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?

Normally, max speeds can be limited using phylink_limit_mac_speed()
which will clear any MAC capabilities for speeds faster than the
speed specified.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

