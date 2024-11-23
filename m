Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A296CE6ADE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XxavxDiWiT7AckD3mn5fryO04YPMRz4gBTQZUA1Z4g=; b=3gepDHTlKPh8J7h8lXiTgHfssr
	WhOkcF7AzT7DdzBWcuTeeN2VCKJikcEjs/+GUsXfxpq7N/KDLyx5gZtL9Hc0ODM4abyfpYhQ3Rp02
	aH2Tkfu4+Ny0JEovf2rW+ZGRHUiY2zYAk5q7+gO2Ek4RCMCrUlSqyj0Qr8cY6ivcJgC9jVS8PZxmf
	l8kW+48daPRK7RazB+7AjRDpNXSieccm16i3GjRoTILiuA0ZN3j2q96tCkesVK0TZpGOBY+AOAdZ7
	3MNPfvTWzJUuh48k0XSfAFtWqGVBGEGJfaHXS+D3jIgxaQkshbLnp2AqatPqA87Etm/CVFsiMvaRR
	QU/pS30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEk36-00000003rSB-3lTc;
	Sat, 23 Nov 2024 06:55:20 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEk28-00000003rLD-2Ehq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 06:54:22 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F6B11A137C;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8194C1A0273;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D251202AF;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Date: Sat, 23 Nov 2024 07:54:16 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 07/16] net: dwmac-intel-plat: Use helper rgmii_clock
Message-ID: <Z0F8GL2NnYmUuE/S@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-7-7dcc90fcffef@oss.nxp.com>
 <ZzzAe8s2UgPYHnkv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzAe8s2UgPYHnkv@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_225420_705799_C5002CCB 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 04:44:43PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:13PM +0100, Jan Petrous via B4 Relay wrote:
> > @@ -31,27 +31,15 @@ struct intel_dwmac_data {
> >  static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> >  {
> >  	struct intel_dwmac *dwmac = priv;
> > -	unsigned long rate;
> > +	long rate;
> >  	int ret;
> 
> So the following becomes:
> 
> >  
> >  	rate = clk_get_rate(dwmac->tx_clk);
> >  
> > +	rate = rgmii_clock(speed);
> > +	if (rate < 0) {
> >  		dev_err(dwmac->dev, "Invalid speed\n");
> > +		return;
> >  	}
> 
> Now that I've removed the deleted lines, we can see that the
> clk_get_rate() call there is now redundant. Please remove in
> this change.

Funny I didn't notice that, thanks. I will remove it in v6.

Interesting the redundant clk_get_rate() is there from v5.10.0.
I hope that there was no reason for the clock call, like any platform
discrepancy requiring reading the clock before setting.

BTW, I also removed Reviewed-by: Andrew as the patch was changed.

BR.
/Jan

