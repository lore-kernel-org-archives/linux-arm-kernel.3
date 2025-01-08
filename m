Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D268E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUDw2uMXlvZKFnYf/nGhrEOQlOnEKNrdrSrZUwzH9YU=; b=cLzCtXt0APoYFJDjWUZqhXIIls
	uPrMutZa40wJiCksnwx3AZrJgN8wcSQGtHGKrwxqPXGWwS2+Hdc9FirDffpXyk2UU/3zUTuC2Rt41
	tZ2ruPlJwy3+tBCrMAC1sax6KIrfryS6QuFvQEBxqa/BAUIvuqwQ6X9lf60uLvWp1ngcyBSo26GhA
	pxW+pKMmk1Tef6+7UZm/y0zeWbOAP/Pr3UeFQ+Jkj4RRwqgy/cdzQcxxqSILAKic7Hd8P4W4A3r+U
	5n3kcm7l7GNxPLi0yYD6Fb7mcPdVdEoguNsBks0nTCPRxU+j5KTAo3nXYm80GSX0t3aWNji1MrvhA
	eG/Z1fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcdR-00000009lUW-2ZIl;
	Wed, 08 Jan 2025 20:26:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVccC-00000009l0p-2sTk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PUDw2uMXlvZKFnYf/nGhrEOQlOnEKNrdrSrZUwzH9YU=; b=bgULs6bQzGZW9Uddr1Ln/594zs
	Vt9+DfsqfV4bSp5A8CpFEk5PVqbyagYxOG7eiUkt6KlN4zYgexHHHRGZ67E1YtT19gt9Qcu16kQPM
	+vbDAsasIt/5/6e4pO8EbTtvDNh0nfECU6D/UZqrKAdZqaDqlrwjAJMMzYPHE0FWqHVfGbFHqctMy
	I6jniHa56A1hvkHEb0KzrCJPhzOqbxZTqn4LmoUuajDAL4SwFSjf3sJkYuu823oHxUr/t9cnYpmZ3
	zb/pTPwV/3iL4UnidBODEqp9wCcq7lH6Ul3+G1adhBnAplyCbvsedd7k5ITwUu45l93vhG+TS6+M1
	oSzGG/8Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50228)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVcc3-0001BL-1g;
	Wed, 08 Jan 2025 20:25:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVcbz-0006a3-24;
	Wed, 08 Jan 2025 20:25:07 +0000
Date: Wed, 8 Jan 2025 20:25:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v4 07/18] net: stmmac: clean up
 stmmac_disable_eee_mode()
Message-ID: <Z37fI8dMLOS7-ky7@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
 <E1tVZDw-0002KL-Gg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tVZDw-0002KL-Gg@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_122520_731908_7F7330A7 
X-CRM114-Status: GOOD (  19.73  )
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

On Wed, Jan 08, 2025 at 04:48:04PM +0000, Russell King (Oracle) wrote:
> stmmac_disable_eee_mode() is now only called from stmmac_xmit() when
> both priv->tx_path_in_lpi_mode and priv->eee_sw_timer_en are true.
> Therefore:
> 
> 	if (!priv->eee_sw_timer_en)
> 
> in stmmac_disable_eee_mode() will never be true, so this is dead code.
> Remove it, and rename the function to indicate that it now only deals
> with software based EEE mode.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index de06aa1ff3f6..9a043d19ebac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -427,18 +427,13 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
>  }
>  
>  /**
> - * stmmac_disable_eee_mode - disable and exit from LPI mode
> + * stmmac_disable_sw_eee_mode - disable and exit from LPI mode
>   * @priv: driver private structure
>   * Description: this function is to exit and disable EEE in case of
>   * LPI state is true. This is called by the xmit.
>   */
> -static void stmmac_disable_eee_mode(struct stmmac_priv *priv)
> +static void stmmac_disable_sw_eee_mode(struct stmmac_priv *priv)

Looking at this again, I'm still not happy with the function name, but
not enough to send another version. I'll change it to
stmmac_stop_sw_lpi() in the next batch of stmmac EEE cleanups (there
is more to come!)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

