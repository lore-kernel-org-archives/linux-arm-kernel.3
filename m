Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF9DCA6001
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjjeW5yegDf0KDKbY7d9B07KRu5nvSc+73Tk90wGuNM=; b=bLfxE7NWlM64rel9yzx450vYWT
	JilFyVVEP/cBV02HPwm9xW6YgYR9c9Aoz0uLXrwWG92imBoR6BgKscVVZJy2GTyK0dHAS1IQNPhEn
	16uUkTD/35VatLXilY2JKA4mh+vTgWW5+kHqDUr4DI+2KtR6+L8ScUQzGhEQ2BxF4d9UMm6r+5XFk
	uf+9Tqi33ZnSeuknrAe1Zvc0iPwwN+bSiRRxA0RZ+chxOWEor3qc6JauuvbmN+yrFX6IJWn5XuSRK
	+IuAx8Z0f1bLrUDEYhczNt70/EYnQkzzbalQP044LKuP8BkZA2ZQM0bC+0WqsLaAF/3Vq6vEvcENR
	zvnt1Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoc-0000000G9k2-3mRS;
	Mon, 05 Oct 2026 10:21:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfob-0000000G9ip-0uOk;
	Mon, 05 Oct 2026 10:21:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CD7043E5C;
	Mon,  5 Oct 2026 10:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AEB1F00899;
	Mon,  5 Oct 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195659;
	bh=wjjeW5yegDf0KDKbY7d9B07KRu5nvSc+73Tk90wGuNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eMISnwWYbwAjJzdqTp1EndL/6YzWzvZJSug5EJGr2jtZNIZCGvgQUtOo/AsJAiCYr
	 +E1hnYT4xvJiCYwADhkmpjBg6fl+Ja7L26Nq440OorctF3IyVDx4uQpKqf8bQXiEX8
	 zUoCno7H9tIc0pwRXCIX1Nzzqd6u2NnwYfMMOw75ynXo84/V7vrrjui9gQmfz6ZbHT
	 BzibSNnRobFRMCWdHNiODMLdDg+pYWFhco2mWIfJWroxsstHwYsPgNEG3VobYxdy+B
	 CeWOQJudndNmaZjWZC//p4aa08U/ZkdhTQYUX90ZddAQSIbmCpFUPDAGGpfXUEzmdb
	 1ZSePukef936Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
References: <20260916-upstream_usb3phy-v4-0-812e76037d01@aspeedtech.com>
Subject: Re: [PATCH v4 0/3] Add AST2700 USB3.2 PHY driver
Message-Id: <179119565537.316652.120525327400272705.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 16 Sep 2026 08:38:00 +0800, Ryan Chen wrote:
> Add AST2700 USB3.2 PHY support.
>  - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
>    High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
> 
> 

Applied, thanks!

[1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.2 PHY
      commit: e22b112f2fa565fd7d2715ac9d1bc3ba1a3c2427
[2/3] phy: aspeed: Add AST2700 USB3.2 PHY driver
      commit: ad72aff5b4b5396a2a443a8f838fcfb8067dc603
[3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
      commit: ea01f446f0682a5e7bd7a275889a890b7e0c6e02

Best regards,
-- 
~Vinod



