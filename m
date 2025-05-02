Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E082CC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AIdttIwKWelJh6EzldrSBtzSa69621xA0s4qkMu1cs=; b=ruEpMzqIbKhyfhZQATg9Ml94YI
	KMbz0GkKrZaybY1jQ9GMprncAKmNQxV7JW2vawoTHBZtvpwSDbAtUvQzdsXzpjDeiltP4CTSM8jto
	W2C1ZaC0pKsFowRz15r4PN4Q2iUhSNPDygS/RRuGalmC0OOq8YtW2jBjpljcgID7o5pjgk/HQnJjC
	WFWqrmgZ1pLMWOS4fS2nnNLKa8wjnu89VjFAecBKfU4okOfr8ApsjC+KZXKibSN84hpfa3EgH78D4
	nTE3XlEnULzJW6eJG6zq8Odkp8A7oS5M8BXPTyMZ/ONjtGmSazO79hCd8LaOdnrUsL2oljAOcYPFh
	V8iSkkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6a-00000002eNm-2Hjb;
	Fri, 02 May 2025 17:23:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtp4-00000002bIW-2IaS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99BF344ED6;
	Fri,  2 May 2025 17:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24688C4CEE4;
	Fri,  2 May 2025 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746205509;
	bh=ek3lW6S6ZXPfwiXtViPbi2/fuP4PwGB3UcVaXyxgnck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g67pc0bPZYbRvCZLgYd62jYJ7v2/yoFtWcawBDZNlz1eJUQiE6HKBhu1UKw0qVoKU
	 E8ujvyItq3hjRADZN8atRqNR4pe/tf9TsplXl3F9kRk1hdoY0tcDuZ3JrPQYUp+yQs
	 DZ3fhlRtBrFiMok2K9xWw1FbRp5iF2f9Khp4dJjz2bMDdyXdE46MwBTlRkQ6aIWiGq
	 QIq059SsE2ypCxhlzXWARCCxGcEofL3vUzyaP6iXmC8RHSL3S3gAmiuGbwMCTQJuph
	 OCRLKv0mNKQTOYSO0mnwYPrX1tsDFun/3b3qYAispqSQDNvFF0W8TYSh/HssAEnhHG
	 C6MyJSP1qkh7Q==
Date: Fri, 2 May 2025 18:05:03 +0100
From: Simon Horman <horms@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next v10 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250502170503.GN3339421@horms.kernel.org>
References: <20250502074447.2153837-1-lukma@denx.de>
 <20250502074447.2153837-5-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502074447.2153837-5-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_100514_611098_8E16FD9C 
X-CRM114-Status: UNSURE (   9.89  )
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

On Fri, May 02, 2025 at 09:44:44AM +0200, Lukasz Majewski wrote:

> +static int mtip_sw_probe(struct platform_device *pdev)

...

> +	ret = devm_request_irq(&pdev->dev, fep->irq, mtip_interrupt, 0,
> +			       dev_name(&pdev->dev), fep);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, fep->irq,

It looks like the 2nd argument to dev_err_probe() should be ret rather than
fep->irq.

Flagged by Smatch.

> +				     "Could not alloc IRQ\n");

...

