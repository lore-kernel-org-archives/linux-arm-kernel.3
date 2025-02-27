Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12E8C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOHjKwhrgGVFnvbmQFWoxwl8isZjOUzul7pxVTceITE=; b=Gr9FvDGX0Tn7a7IToWEtFYtxlN
	dzGHK+4fq34z18z8LbWxZt4ehNfYXZeHNBjkcTAh+yZduFpX4uAWHPB0p3CJoIlyuLRmlAJKl0pzy
	YpYlVDOgvpc7TL7P2HixJgBNU0KhxWpb3/gh+sNvpnJw5m5PXgAOyiPTz5d06b9As0EEOtWCm/M/u
	pnyFWWgc0T41rqi3Om1mj4+XILZrqZHZhls7fp6OY7bmq5NO2ht4Cx3UFQvqMGxo0rf4U/gfxTTqz
	YFvPsXiTGeD+NVA3fpt+7u6LNroNXP6v2CuoWTRNJzFDgzIcJlB+KyEZvD8JrpnrOWnKtAF89J7pI
	7QdAWFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndD0-00000007OzF-1gcW;
	Thu, 27 Feb 2025 12:41:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncg6-00000007IL1-28Or
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20B4D5C5519;
	Thu, 27 Feb 2025 12:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAC0C4CEDD;
	Thu, 27 Feb 2025 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658065;
	bh=Z5FJf61UKKmiyaePDrpiLZwI2N56lkqzxTfEsGsA8a0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bMzGoxaAMDZN1eKwLcIqhB0FTdMi9KnsDBsIJN/zVKie/B6cgd215Qtl3Nuvklnsd
	 45mTybsMIjvIg0JZPITMtd4YOmuV/jzLNtWF3LJBkuCZmnM+tyw3gTFmpZ5/QeXqU7
	 /UECpmczMOsN8SRFA+elhRgkjoGhXf05yFuWhSN5qjlMbgKUFA0AH4jqaS4yG2d3xP
	 ep9E7WSmPpQJYuwNpMm539mAeClKKEpsCPRXdCRRU+T3/vHLcpo4XR11zTG3+fUZC2
	 KfxnI5DaHauB3j81KDSjj4ozB7nrkAaG8HUwLu+jrQx654aFVhA5YkruaHP12B0Hk5
	 vjE0FBLDYOJjg==
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
In-Reply-To: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
References: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
Subject: Re: [PATCH] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument
 from k3_udma_glue_reset_rx_chn
Message-Id: <174065806076.367410.10114461097310533807.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:37:40 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040746_592053_79EFAA77 
X-CRM114-Status: UNSURE (   7.86  )
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


On Thu, 16 Jan 2025 17:00:46 +0200, Roger Quadros wrote:
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



