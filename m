Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8844D5B175
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJw35uUzyVBgA63iVS/XX/lFS3bTgFiBMBl7kUqLfn0=; b=u18LL0R/A83iMtwN9QdVyT3+bC
	MpsuRlNsp5TSvMXn40ScitqQgF3vSKC33rcovKLkCyErS+T4GFYn22snMXXrRr4x8L2tLUr50dY7z
	cfz74O1BBQMAqU3NWjOBmaHxnMwMOyTfuZi0KWgeUxIfHHT9YnvxVXNgLag8brJUxMf02/FtRMDhD
	SuKfWIgV6qZxipQykXA+U3ydOXcU/u+lCwVBZiW5hm2yttaO6IwfaHSXhWfdJCLKXC0WFgtf+astP
	tndE0wqpvSYtCbCbwqiWh9NODp7aq0qS9znxoLPjup2x2EAsKV0ng/VSsAxabr7cSjrsQbDgh5kGZ
	VA22faqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9SZ-00000003mzr-2bfA;
	Mon, 15 Dec 2025 14:21:59 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9SX-00000003mxN-0ykH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:21:58 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C6191A0190;
	Mon, 15 Dec 2025 15:21:49 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7EB131A0173;
	Mon, 15 Dec 2025 15:21:49 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 36DC0202DC;
	Mon, 15 Dec 2025 15:21:49 +0100 (CET)
Date: Mon, 15 Dec 2025 15:21:49 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 4/4] stmmac: s32: enable multi irqs mode
Message-ID: <aUAZfcMbHD+BHNSi@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
 <20251214-dwmac_multi_irq-v1-4-36562ab0e9f7@oss.nxp.com>
 <d1eba807-c45d-434f-b272-ed0841c728bf@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1eba807-c45d-434f-b272-ed0841c728bf@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_062157_452840_A2E1BBC5 
X-CRM114-Status: GOOD (  14.08  )
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

On Sun, Dec 14, 2025 at 11:37:51PM +0100, Andrew Lunn wrote:
> On Sun, Dec 14, 2025 at 11:15:40PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Signalize support for multi irq mode.
> > 
> > >From now, if yoused old DT node, without channel IRQs set,
> > the driver fails to init with the following error:
> > 
> > [4.925420] s32-dwmac 4033c000.ethernet eth0: stmmac_request_irq_multi_msi: alloc rx-0  MSI -6 (error: -22)
> 
> Sorry, but that is not acceptable. You cannot break old DT blobs.
> 
> Please reverse the logic. If you find all the needed properties in DT
> enable STMMAC_FLAG_MULTI_MSI_EN. If none of the properties are there,
> continue using one interrupt, and if only some of the needed
> properties are there but some are missing, then you can error out with
> EINVAL, because the DT blob is invalid.
> 

Yeh, that was the main reason of marking it as RFC, I was not sure
if I can break old DT blobs or not.

Thanks for answer. I will change the procedure to stay
backward compatible.

/Jan

