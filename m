Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31FFED2E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXVv1pSu6Y+GX0lPzi5sV7SplRZt2IAMFYyv2ZEjZ/w=; b=xNGZROu1mfu6Xc2EnI7TL+BzRL
	zw6KRTc1b8tNejdNGmcgu8UtzE/89olLVSEISB5nnRNQ9/dhsDqs6vk1yOKJfQ0bGBGjJ+CtJ1RX7
	jrW8KzHkdjssKPZXjzjOH8yIQ7Hy2B8pfWTg7QtBrV7/5ibnBZgWHPx/39PRKdeIQEX96qhS6jWaG
	T5FDBxCXH1XSNnGmzUj2vVcFpKaS72uDOVN//mlKWfTjFgudT+N8VCyh9y8gWpWLAUgAzCIGQIVac
	CM2v+Bolu53dPa8kqyuBNE1XZJ7tWUkTIjeTcqYFlch6iht3IvHUlEfk7OexY3OzW6lAzqsT4y+Gn
	n5F2BxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aoH-0000000DYk0-0X2f;
	Thu, 12 Mar 2026 07:50:21 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0aoD-0000000DYjX-3Yby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 07:50:19 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 021B71A0542;
	Thu, 12 Mar 2026 08:50:16 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DE62A1A06DE;
	Thu, 12 Mar 2026 08:50:15 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id AF65E20263;
	Thu, 12 Mar 2026 08:50:15 +0100 (CET)
Date: Thu, 12 Mar 2026 08:50:15 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v8 1/5] net: stmmac: Use helper macro for loop over
 queue-based arrays
Message-ID: <abJwN5bulKxQpI+K@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260309-dwmac_multi_irq-v8-0-f0cc5bc811a7@oss.nxp.com>
 <20260309-dwmac_multi_irq-v8-1-f0cc5bc811a7@oss.nxp.com>
 <20260311203707.1d5ba94c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311203707.1d5ba94c@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_005018_021104_25D37E4A 
X-CRM114-Status: UNSURE (   9.05  )
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

On Wed, Mar 11, 2026 at 08:37:07PM -0700, Jakub Kicinski wrote:
> On Mon, 09 Mar 2026 18:55:20 +0100 Jan Petrous via B4 Relay wrote:
> > The stmmac driver contains similar pattern for processing queue-based
> > arrays, ie. interrupt lines, etc. Factor out the for loop and provide
> > a macro STMMAC_FOREACH_MTL_QUEUE(var, limit).
> 
> This is macro is neither shorter nor more readable.
> I really don't see any benefit here..

TBH me neither. Or, I see only "descriptive" benefit, what, of course,
is nothing must-to-have.

I will prepare v11 without this.

Thanks.
/Jan

