Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D3ED7879A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H11NAOdOJNBsDXjvEYVyNW0dhh1waxP26uqrlwjdh7w=; b=NYYxc82dWi/lqZ75cSJ6cf7t9T
	sAf4XPnjrPc0KuOTlETKM3UbzlaGNLVuDm0A5wCTNE9eM6oq9oKxx5uvFdGfULuNOW4OnD3DZqNz+
	TPK9r9OGtNpIY5WxGJd/QY2s4qFIcgT0pbfrv+Oj+46fTbXiOQQtS67dfadniywU/6Ny9IgPhm+nQ
	k4ta0rZMKoFgG1GM1Rk5YY4jTP10WfglzbtDNFR6BOV/pTQP6CV5smMrd/hq19OGVnkwY4/OI1aZ1
	nzGPzR9pnNFEH4Hg7aFS9WyKYVb9L2ERpmiD0Z+/R8PuOvFvpRV1gOYkWpHUvLEgLsstIWzKr53vv
	P9neYiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEAkk-00000000WjY-2NVs;
	Thu, 21 Nov 2024 17:14:02 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEAjl-00000000WW6-3bLc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 17:13:04 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4748B1A063E;
	Thu, 21 Nov 2024 18:12:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4441B1A063A;
	Thu, 21 Nov 2024 18:12:58 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BFFC2026C;
	Thu, 21 Nov 2024 18:12:57 +0100 (CET)
Date: Thu, 21 Nov 2024 18:12:58 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
Message-ID: <Zz9qGvb9v9+SXSev@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
 <d6794550-07f2-46df-aa4f-c728b06d50bd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6794550-07f2-46df-aa4f-c728b06d50bd@redhat.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_091302_038015_76F1FFFE 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2024 at 08:45:20AM +0100, Paolo Abeni wrote:
> On 11/19/24 16:00, Jan Petrous (OSS) wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The stmmac driver supports many vendors SoCs using Synopsys-licensed
> > Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> > codebase, which has a potential PTP clock initialization issue.
> > The PTP clock rate reading might require ungating what is not provided.
> > 
> > Fix the PTP clock initialization by enabling it immediately.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> Side, process-related note: it would be great if you could trim the
> patch series below 16 (currently off-by-one):
> 
> https://elixir.bootlin.com/linux/v6.11.8/source/Documentation/process/maintainer-netdev.rst#L14
> 
> This patch looks like an independent fix, possibly worth the 'net' tree.
> If so, please submit this patch separately, including a suitable fixes
> tag and including the 'net' keyword in the patch subj prefix.
> 

Yeh, I also was a bit worried about patchwork fail check on patch series
size. Thanks for your hint, I will remove this PTP clock rate patch from
the series and resend it to the 'net' tree with fixes tag.

BR.
/Jan

