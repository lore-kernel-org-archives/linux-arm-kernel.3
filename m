Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD7D767CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zml1RKu4Q/PZeCUlbWwAa0TNlAZAaUFJhiOXtPhBaIM=; b=10oRD5WDCkQmHtuoeWo+8uUNhu
	Fg+XX1nhbpFpyAjQcoj/aBwDwniCOndJ+vmJCN73zUiQqTrRgQ6HrO11VKbFBOYG0l/AilXzB8ruY
	LAVhLShyTXDw6P4j/FwieG6ULtswF+/aHUAd0o/JLbYZAtVCb9XA0rCrKgHzsory95kuQvStst3cU
	7sykDiYvPQ7lIA9SrQ5B7fVC8AoJG9qXahWIL8ALMncr2nqUn9KkZ9uMNHHJgSLKQtmHfamFjGpmX
	v1Q+9HfACNipIl9Jf2ndxMKxHU4ZrAUwZuHnBql7i6xwy0psV8C/nmlOL47NEJkbMO+3TUTal6mIG
	F+w7LX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXpY-0000000A5e4-3qrU;
	Fri, 19 Dec 2025 10:35:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXpY-0000000A5dT-1ILZ;
	Fri, 19 Dec 2025 10:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71F8660008;
	Fri, 19 Dec 2025 10:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBB9C4CEF1;
	Fri, 19 Dec 2025 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766140527;
	bh=42xsPFIBt7s6uJmGcvjTi6dEM713cKqiD0X2WgnoWSo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iQe/v+sRIsVtiWEaDXcR0GAO8tWvy6YrF1JcUtjLroBXKbQsoQPU/WCnvDBoHZDdW
	 QBBDHo4ycl7vrOsym9hKeSK1/b5kWZYMDXzZJGlyn0+NA+0TJYpe3nrKikMtuH1LEf
	 Sf8nresz9hWF8dv0+wdtI5SmSMyZJZck8It3Q7OSm1SUcY7Vp3xJvIreNEWiLc1fuE
	 moU3Rz2gqS70gfaZF1Ry3pi3qHv3irZNH07CLqixX7AKla+PZS0qjeLwGxCpcE8rJG
	 D5JBTpAw937t3JorQBFiSwTfqNLsxLjItDldlV4mXGMgUi/sG2dPQBp9Hngma8es15
	 P29peXidh5bVw==
Message-ID: <69a9daf3-0439-4b6c-bc12-1b0ea7f01fba@kernel.org>
Date: Fri, 19 Dec 2025 19:35:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dmaengine: dw-edma: Use new
 .device_prep_config_sg() callback
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Koichiro Den <den@valinux.co.jp>,
 Niklas Cassel <cassel@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20251218-dma_prep_config-v2-0-c07079836128@nxp.com>
 <20251218-dma_prep_config-v2-3-c07079836128@nxp.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20251218-dma_prep_config-v2-3-c07079836128@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/19/25 00:56, Frank Li wrote:
> Use the new .device_prep_config_sg() callback to combine configuration and
> descriptor preparation.
> 
> No functional changes.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

