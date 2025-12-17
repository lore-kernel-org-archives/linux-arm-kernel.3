Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C8D65C49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUgIqK1Xxrn9AmObRt4JA+pI2mdjg2peBLShKt0t0ZU=; b=1yTNdPM1uwrWBY7cB6MP/LCYfu
	fQCdP+7pgn2XPrOchoXyunAdOclYm1aGAgu6JcU1pqtRRpHM0FTeIrsSiLNr1WrYcu2blsOcCW21A
	p+QhK+07BJaQr8tLpFlwvZ5Iir7ZRvdMWKVhB+QL255D1LBNW/ufycJy4ECOSbsYWEvYvZ5H4Cewk
	fqIXh+bYc6PYSk1sLzHhIoYNVF+Me9YGxIG8By9OiVtJJbfUGITOEyvpZf2xFf/YLoC/4jVwF1W2O
	KEOn5n+nxr4QVFuc5qLiQ++XSt75MAjN812DFKAI0THA1aYTYU6Kb5VMpeAhHqeiW8iV6Mn6tezgA
	E/3TM8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsBQ-00000006u9X-2E9r;
	Wed, 17 Dec 2025 14:07:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVsBP-00000006u9H-1aP5;
	Wed, 17 Dec 2025 14:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62282601A5;
	Wed, 17 Dec 2025 14:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7828C4CEF5;
	Wed, 17 Dec 2025 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765980434;
	bh=BBej7b2TZcIfv26VO07aVWI/nJSmjhBy+pY5L+9zcb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COj/Z3nKklzgE1lymvXRLZGmg/6UR6V78uX8ycnn0SpbWOJFD//Tg/lKvkrv+zzpt
	 KJmm3fOvLHd4j4ZFg+6/uGG4WACNgTs/vdylLOhGT5TANFGTJK2lPvQN4/Z1QG26CY
	 Jj2buSSzuYkRB41d1MQmoOV6hGIL2FdNUHCgu0Uoo0WNYpPU2XS3yp5nwVsioshvWP
	 cGUceKKnL2caC3UC1OAflD7JMCoqIWXwNe8O5eaiMPqs7HJ2EMcAhYjt8I+IFQtxQs
	 3HlkLx7Kss0Kh/B/ENnxkaAwJxYiJzpVokdyTv6qtVRgPJfTodJSPLHuxzcH2dOQwj
	 Rwr2agbdZ/hXQ==
Date: Wed, 17 Dec 2025 08:07:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	openbmc@lists.ozlabs.org, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v7 2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <176598042865.925447.819427829703405501.robh@kernel.org>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <20251216-upstream_pcie_rc-v7-2-4aeb0f53c4ce@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-upstream_pcie_rc-v7-2-4aeb0f53c4ce@aspeedtech.com>
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


On Tue, 16 Dec 2025 09:50:01 +0800, Jacky Chou wrote:
> ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> port to connect to PCIe device. And also have Mem, I/O access, legacy
> interrupt and MSI.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/pci/aspeed,ast2600-pcie.yaml          | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


