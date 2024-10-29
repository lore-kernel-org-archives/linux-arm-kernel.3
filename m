Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4183D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jVzrS/dv8I737x17bUvfsxtTXmLoqjV6On8HBWDM70=; b=ZEVg9uh53rODeQLnDEepsa77Ib
	QxkV/91qd0tIvsb3b8U+4ZAvgBj+KIg4N0J7lSyUaR/QAuuSIkAMAzHqp8sD6pSal+jOzDR9yz+BT
	jrr9EuB+XTrFMSsCJEWx9kwbLoMWGRRMpD7iqKvGfRr261J9LUKdIy746dcz7CIoFXK79dzZv6F/W
	CIsHTv3eFKye/cs/dYGGVFcboJGydWOPitDy7bW0lpTuDz2cAsbl6kY3hOtwIv+hd1KdVx1L/S04R
	E0uqBNQNTWl7p7JAoJclAkwcnPSF3MrVKxaHg2UlWfQuC7lWKTT6mRI1ENYDHQEPFy0TkgntmHBxM
	ur1drOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lvX-0000000EWIx-0Drv;
	Tue, 29 Oct 2024 13:06:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lBg-0000000ENrC-1btb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6jVzrS/dv8I737x17bUvfsxtTXmLoqjV6On8HBWDM70=; b=hgnZALp1rshuOUnKj9DMO1vbGc
	X7BAH5/T9P0tgk5BXqbHmpQ0KDFVgI94gf74+iYr4PcgfrXdRz4AtwH8kUce84V0KbqwA7Lrx4gHc
	lynpQoYesEIit/bM+G8CldhXzpd8zoDn4VvmmlCccLeP/a+mQnG8fRBaThxNaBqagxb8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5lBL-00BZUT-Hm; Tue, 29 Oct 2024 13:18:43 +0100
Date: Tue, 29 Oct 2024 13:18:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 16/16] net: stmmac: dwmac-s32: Read PTP clock rate
 when ready
Message-ID: <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_051904_458207_4DAA0CD5 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Andrei Botila <andrei.botila@nxp.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:58PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The PTP clock is read by stmmac_platform during DT parse.
> On S32G/R the clock is not ready and returns 0. Postpone
> reading of the clock on PTP init.

This needs more explanation as to why this is a feature, not a bug,
for the PTP clock.

	Andrew

