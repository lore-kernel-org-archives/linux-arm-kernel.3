Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F5CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 05:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKYhMjcdquQctXovoCvyjlBSW58IakiaspYG2NbsggE=; b=XHURS22qubz9EK9fbFhFxSbKmL
	BtINCLX+FfGhEHQ23niJA/SjQ1jpItDRztRUKjRqXoFIVsupLSokPKqPhUZoUgNC59gyKqWE4Iljc
	j7cedH9ZhKbsTqbHEOtDGu0uwKjw1X8uB2XcoINNq/G2/L4m0cu5T2FBzXMKtsmX5rQJDHf2flcdC
	v1EmTlGfOnv+AOyXnBwLbyDSlXtlku/xXcxAA6cLyghw/lV1su1nHFayxz8XK8ctfLUuBWISYDZm8
	RDN+Ep0V1WMDA/y9pPIjVYQUCqGNbBpeW2mdW2GQGlwzL2bAUAotS/F118mfiY+YQaSFu0rtg+x+X
	QOsLhJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrVV-0000000EXqb-07oC;
	Wed, 14 Oct 2026 05:26:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGrVT-0000000EXqS-22xJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 05:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5511417AA;
	Wed, 14 Oct 2026 05:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFF91F000FF;
	Wed, 14 Oct 2026 05:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791955586;
	bh=RKYhMjcdquQctXovoCvyjlBSW58IakiaspYG2NbsggE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TJuBiAEZRVGFKBEI+g+qdhcounkDdDDtV7vjYsd22pxHCLXIuDNV46SZ/ganIUoxM
	 I/ovGv+xxuWHfFX+aDErwdbmu1qOnp/QSgRbs7m2ympbASIM6/RSQFwaz+61JQB1ie
	 7E34R0iYHa+YTpdKWjZlKaaqjMr7RHuthMm7lqyBCG8vGI2F9RzHw7mxvNdi9qE0cB
	 0s8AZA3y12XnDxXpOpvhFKOlW1yoQAEFi4WwDWoJO3rFS0wSEOZ8iwkWpV58LZwZMM
	 0BoMgi6Xdg2OfMB0JIJ75kbOY3yK7yVSTZwkSM0+gXBCiZboEYh0AXeg5aWozI4Eq6
	 Gh/AoCNCncuzw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260619112535.1127850-1-alexander.stein@ew.tq-group.com>
References: <20260619112535.1127850-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] PCI: imx6: Use dev_err_probe
Message-Id: <179195558138.34437.14421683189304797818.b4-ty@b4>
Date: Wed, 14 Oct 2026 10:56:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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


On Fri, 19 Jun 2026 13:25:33 +0200, Alexander Stein wrote:
> pci_pwrctrl_power_on_devices() might return -EPROBE_DEFER resulting in
> an error message. Use dev_err_probe to silence this non-error message.

Applied, thanks!

[1/1] PCI: imx6: Use dev_err_probe
      commit: 2aed243fe21ec77c5682aa8ee6a5912d94b3a4ff

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



