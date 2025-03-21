Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AFBC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0LKCPTWLqOz0v0nFE+m771YyCcWhP2oMeKQU76uMec=; b=AzH1485gNwWuaYvCxtABC9+o/T
	39UDzgoFzhBBzF3I3giA6mUDhD6qP89mU8U3NovUa+SdR3mvGPNjmhtIdt32SkRb7h/3HXOqP8DuN
	x86J+2+6Jxe8Nj8ywRsFjAowdH3UOT+TxepMcxdVWCX/7XH6femR4vkqZ9lvlNF6pr7huQ/441Qwe
	hvBShAa5exeJPmQuJPdCf3yfW8a3B8AoBRzoQAxPqNEyCO3rnvMgmzeUB8MXlRphdoIMwYEf1sLmR
	jTSvVroU2ghjRzLDlZCIOeYMyJBHZMaQakglhZIW2+x1xPf3AuKqBI2OMIwm8X6v1jUiSNXKK5QJG
	xoHbA6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZrn-0000000EZ8K-0PXY;
	Fri, 21 Mar 2025 10:44:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZnw-0000000EYap-2ixh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 10:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w0LKCPTWLqOz0v0nFE+m771YyCcWhP2oMeKQU76uMec=; b=GGV8D1vtw9RNsDDh0sGL/X/tYv
	usnovAyelwqv0yDopXgbrW6cYz0L5Bs2S/E+Jvo0w1H4nbClisHkcSex6ceeD2aFDLNUM89EsFqwQ
	SshPS4xhujhu9WQoDE4SPoLqgs439O+PNOqOi52YnQPZdANuRf0qw/qYJMCBFJl7PqhOVA8r8h6Fo
	U2dF4m6s2JfRh4TID8XKCVac42mgFPDV5+Lhfn9BHz81vR+Cavkl29IrFUlVaC8MV5muLolcvTdiU
	j7bMAEnNwvpO/teQRE1uVsJcENho2xqr1OFywzPafJ2+6938uJNVoqeSkquEb4KH/rXI7cy/9FFvz
	J4VVLEeQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53034)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tvZnm-0000S9-0C;
	Fri, 21 Mar 2025 10:40:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tvZni-0007aA-1A;
	Fri, 21 Mar 2025 10:40:30 +0000
Date: Fri, 21 Mar 2025 10:40:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Simon Horman <horms@kernel.org>, alexis.lothore@bootlin.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Call xpcs_config_eee_mult_fact()
 only when xpcs is present
Message-ID: <Z91CHjqVc0-BmTPX@shell.armlinux.org.uk>
References: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_034044_685564_7564E6F2 
X-CRM114-Status: GOOD (  11.94  )
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

On Fri, Mar 21, 2025 at 11:35:01AM +0100, Maxime Chevallier wrote:
> Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.
> 
> Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
> crash at init :
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write
> 
>  [...]
> 
>  Call trace:
>   xpcs_config_eee_mult_fact from stmmac_pcs_setup+0x40/0x10c
>   stmmac_pcs_setup from stmmac_dvr_probe+0xc0c/0x1244
>   stmmac_dvr_probe from socfpga_dwmac_probe+0x130/0x1bc
>   socfpga_dwmac_probe from platform_probe+0x5c/0xb0
> 
> Fixes: 060fb27060e8 ("net: stmmac: call xpcs_config_eee_mult_fact()")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Yes, I had noticed that but haven't had time to patch it, so thanks for
submitting the patch. However, I think the code structure could be
better in this function. Let's get the bug fixed, so:

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

