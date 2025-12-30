Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F2EE4990
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARCO3nGIu6xPRUPipV0IXFiGA08guJiq8+M45xgO7xg=; b=zSLCLgLh7RnV1c/jxOvIiwFcvQ
	lZgBtW3i4386nm9vFMGQcln1PZ8C+uimvPBGv/UCW5y+5NjUtaAhiq00hzEf1o55cbFX+z+jwh5VV
	Rvqw44C38Pfop/83wTLTj4EMQ3B6brqtlGFeyVKVwSKBGkKwfChHw1sqBIwd9HU0miexmpvghDbSE
	SvoM1T1qppgolByeL3V0VfQnb1tSARVomwqxmgwu7EL5mGZI0ohboMS43gZHpMWY21bsQG+elXIN3
	jEVs9X/WaydNRNg2O2gagqVU6i6T7mxrOpIkTeSjJ8Oze2bhm2h8Qi8qlp3/uPxt6Z2px/achIVkp
	V+JnEnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae79-00000005ABm-2foW;
	Tue, 30 Dec 2025 18:06:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae78-00000005ABb-3fav
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 823B260017;
	Tue, 30 Dec 2025 18:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D38C4CEFB;
	Tue, 30 Dec 2025 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117993;
	bh=+mZ2BSG8Mo/7t6pCnAocYIY+9a/YSRxQPsfDZwP6lI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnAphv0B8FtOm3V3/J/xA4md6HvcO0RI7LhtjTixEFWoixXCzDO0IAujqQVLnllOv
	 0jGx9RP58yCr81eA/hxp+CWpMUCxj/5XWjj2Agm37F3dM12xuM4s/7vJwqhl3CQ+Jp
	 KFqk1dqNiAQtDEUdAzvsb6zm/W0i8Tp8xi7pb1O6dUEn/hUhyKmLm4jTcX1KrJkoSi
	 RiqOUTv5h7UervvaA1pcwasBEwBWD1bICWOom/h4D4SM5ezakBx9beiiK979Kzyc41
	 6uulURq3HYMtSiPsHPaX4lREJ0IdVGgpFmpq5ROLATAnKBs4IHllkMkLHZFLbtQPJH
	 qLplRteSg0EbA==
Date: Tue, 30 Dec 2025 12:06:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: daniel.machon@microchip.com, radu_nicolae.pirea@upb.ro,
	linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
	jirislaby@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, andi.shyti@kernel.org,
	olivia@selenic.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	dmaengine@vger.kernel.org, andrew+netdev@lunn.ch,
	krzk+dt@kernel.org, nicolas.ferre@microchip.com, linusw@kernel.org,
	lars.povlsen@microchip.com, pabeni@redhat.com,
	richard.genoud@bootlin.com, davem@davemloft.net,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev, linux-gpio@vger.kernel.org,
	Steen.Hegelund@microchip.com, broonie@kernel.org,
	luka.perkov@sartura.hr, edumazet@google.com,
	herbert@gondor.apana.org.au, lee@kernel.org, kuba@kernel.org,
	vkoul@kernel.org, UNGLinuxDriver@microchip.com,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
Message-ID: <176711799188.884536.16157476210751555846.robh@kernel.org>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-10-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>
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


On Mon, 29 Dec 2025 19:37:50 +0100, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> * Merged with microchip,sama7d65-dma since that also falls back to
> microchip,sama7g5-dma
> 
>  Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


