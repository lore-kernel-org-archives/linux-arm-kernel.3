Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21CDD2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Xe2YMY/zeHryWSgHjSfc7VFNCBvPhz1fqa3NzPINkw=; b=OZruPZylI5RAc9HPUuJD2bA45i
	k3YVgvZERLsa36JRx/ZgsEzGH7tmTdrRplV6Hi/Tjx8tblJIpMfeIcBEcjCRebjo7EHtxeBV+yCbO
	+F8ZYiQXc1RkbL2bgjLqwFDl0oWcE9AIRbeNxNr3zd1vt15VvJ4sBN7w5R1TYFshitpVhZv1YTcdy
	LhoQOynqMn9Of7ONxRH3a8KCopkdDckS40OXPLqjb4nXc2xYIjT63BGoJWh6cElfpcEgR1/p6YcLR
	C6myTSCFHxtiW3nCs4OqqmGRmBGca0tHqZXKG4lG6VbsjqTT3Kwq3DdrCvMPjg/WQwpYYW6PxyGP4
	UrzyM2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lp3-0000000EUjp-46YZ;
	Tue, 29 Oct 2024 12:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l9L-0000000ENS2-3h4s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Xe2YMY/zeHryWSgHjSfc7VFNCBvPhz1fqa3NzPINkw=; b=mcu4apTzEhkgGeYcuAGmARvZxx
	95GY5tXKVdO3LfvSzYQrHOygnhQ5wZqiYRYRcypk5GApaxeab0akfk3f/04OXL8d0eYFELUYHRf+D
	MTwvZiLg/5xJfED+Z+CjoSOWJmBuXoudhLf3sCGKxUdwwnJvtZb0u7SATYOu1bDDLRZNlSfD5Qk3r
	Ctg0UAxP0G8bcC2YtadkCjOvzum/YqdlAFBDij2CKfOtYYJ3ryAUW0QDehgRqgHeD//Ay1ywX2iN0
	eTr59OYgQBbOvDvHf7jTBZCYpdBiwIIY+hSaSsiNd92P+RKpU2N4VMAMwZ9Ak/i+Dn2tvNrDZoEvO
	IZAx/eJQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l9H-00000009tMb-3m08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Xe2YMY/zeHryWSgHjSfc7VFNCBvPhz1fqa3NzPINkw=; b=eupuaHDTGXbkjAmqRn/u2rxV49
	NlSmOQXMOXf6MmrYKe34J0Cm7DiaXlbmfn7TN3t3KWbvZzSRayEvPqtcCcmAuIqCl05rAuu0/fZ/B
	TH5MnCXBH7PGMfmGef6vFkyDkQq/zrTJtZicWWlCoJJichb/pk8fOrfOm/OotW8j2SdE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5l8y-00BZQl-Ql; Tue, 29 Oct 2024 13:16:16 +0100
Date: Tue, 29 Oct 2024 13:16:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 15/16] MAINTAINERS: Add Jan Petrous as the NXP S32G/R
 DWMAC driver maintainer
Message-ID: <00abc202-ffb0-4aea-810a-419c313d96de@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-15-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-15-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121636_196158_1401276C 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:57PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

