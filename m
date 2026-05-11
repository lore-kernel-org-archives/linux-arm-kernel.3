Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9FCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESd2l6DdRr8sWvE8ATvrdJSgftCDiZ0Ck37UUq3/zZU=; b=FrxRqH3n3hzFox7JeQ9M/ejFrS
	wjwqd3nk3LbUnhFiws2Ld1Dt54eagx8h9LtCaXzvwRM/sbicNu5CgyP+87EcD0M6Wx0mUUO9W9qSx
	ywVMrLjBiR1K49mqtCIJv9fXW48U3Ju2/Fym5nZhddHJ+SiQEgxnDQHkGPOBQNUMQEep3C+Wg7huG
	naLsilyofXGrStpI70t9No1P8gBvemfCSBFzwgG/NDv/u7lzhHhN4d4bvSW/F36xTzpDncoNWy8Dt
	x7qeciSwcC70Gg1A3n27ebKe14vPMKlAHm1xJmZdzD0ICNRm941c2Z5kNgSIQw/H4g2h3f1F1H+7d
	9TAFwJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKf8-0000000CYCM-11fL;
	Mon, 11 May 2026 07:02:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKf7-0000000CYC2-2dX5;
	Mon, 11 May 2026 07:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEDB76001A;
	Mon, 11 May 2026 07:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F36C2BCB0;
	Mon, 11 May 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482964;
	bh=Tdh/N1hAlE0eVbohv0554EUeYZWyi42yp17TIjpju5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHLDXMEPFhnZDfHYyDEV5HluzVN5NysVQFyveHi6v7Cwmy2warBhBJMzSqMWLQ4hY
	 0GugpNj51s6Ah+Bmc8EEmgqQbmAu4UYyMqRj/8bww+Cyac+DR2d6INKbeSvhSASHWM
	 CyQBcpQkbbXKLZsNWeGsADXKg3LSTYmnvc4iuPnvonT1VuCmTiPJeyu/HqHDxAgy1J
	 0GYltnvXZs+anrTpbMeCaGzGf5L/cjcPojB6vWaRSt0vbmYLVfndNx9Bx3C20G1TlB
	 2pbKXHZ/74Z0ZYrQh8zJQUmiYb5MAa1n16jri7Mi3w0RPE87UVQeEU0U7Co6JikQcF
	 MQW/FE2gv/KCg==
Date: Mon, 11 May 2026 16:02:42 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com, 
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260511070139.GA1096586@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511055923.37117-5-18255117159@163.com>
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

Hello,

> -	/*
> -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> -	 * after Link training completes before sending a Configuration Request.
> -	 */
> -	if (pci->max_link_speed > 2)
> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +	pci_host_common_link_train_delay(pci->max_link_speed);

This comment could move to the helper you added.

Thank you!

	Krzysztof

