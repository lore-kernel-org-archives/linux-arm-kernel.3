Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFE3C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWqEH1CSCg7QK2TgnOjuWBRjk9NN97Spbw1h/vWLvo0=; b=1Vl4Ek1CO0DPIxmNtd9VrGFf2S
	Bu8C+IbXXJS/hjLLh1A+PXEagy2FDMODWXLF84dqt1ug3qmo6bZXTchwQZuLvPEd31nKrzlJ0DPMP
	qF+2ztAku88GyI2IDj7F63WSzFVy7JkXzY89prgut7hC+N9GjL6XRI8bQYmYIFk5lbN9bPDshQdKF
	owPUloqfcpkaLs2Ah5L90HBsUWiXilpjqxYbFbxuLocBNgtZv0CqnJ15qKDc4RGpnkVQ5e09TakJ1
	n74eWxVfgA0I5rXuD9dmNvXNiHFehsrJ6ObKiY4fTJGofsXLiUbugAeaS8Nt3TxR6CxtNgpY73/2E
	VoNsYwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndHV-00000007Pyf-3bRb;
	Thu, 27 Feb 2025 12:46:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncgQ-00000007IQZ-0pNo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D88745C551C;
	Thu, 27 Feb 2025 12:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B47C4CEDD;
	Thu, 27 Feb 2025 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658085;
	bh=BnTBqvS3GhK4/kPtQtEy6PC0lkfa2QHa90IKHJd3wz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uquTKJ94Qz5BkSDOuuJ5ClJ+zWxWF+wGOaxlrFXZvYZC2zBBZNaCY2MBl0W/XYvak
	 w+wktTZfJN/4BUJ9C/6owR+CRC0ChI41iVxTY88mvK6O3PGbZWIaTgDk9t7A5vJcHt
	 IBNbAMujFlrhzwPWKkquxT1EJqAmhKCw4TPJriIjnu42N0hnwFUcJCfQEA2Mwu4vmi
	 x667jiClQj7Yyu2v1Bre72VjijxgDPJWj45f1NQzIVuNOsB3xKDh+oSlSEiqx5y+5D
	 zvXWPCUQl6PN6XRDA0mmy9sOa0cY+AyJou+SIxSC00ylfvSFk4lu3AB7tuSeMaB1pr
	 2IACkagKPrMpQ==
From: Vinod Koul <vkoul@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 MD Danish Anwar <danishanwar@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: srk@ti.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250224-k3-udma-glue-single-fdq-v2-1-cbe7621f2507@kernel.org>
References: <20250224-k3-udma-glue-single-fdq-v2-1-cbe7621f2507@kernel.org>
Subject: Re: [PATCH v2] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument
 from k3_udma_glue_reset_rx_chn
Message-Id: <174065808054.367410.3286112232098432067.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:38:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040806_323879_5EB50FA7 
X-CRM114-Status: UNSURE (   8.28  )
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


On Mon, 24 Feb 2025 16:04:17 +0200, Roger Quadros wrote:
> The user of k3_udma_glue_reset_rx_chn() e.g. ti_am65_cpsw_nuss can
> run on multiple platforms having different DMA architectures.
> On some platforms there can be one FDQ for all flows in the RX channel
> while for others there is a separate FDQ for each flow in the RX channel.
> 
> So far we have been relying on the skip_fdq argument of
> k3_udma_glue_reset_rx_chn().
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument from k3_udma_glue_reset_rx_chn
      commit: 0da30874729baeb01889b0eca16cfda122687503

Best regards,
-- 
~Vinod



