Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D690C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cp0ZNWLpzkvcswcTxdhYTtMHT305oGgquxHkYV264nM=; b=jrzOesa5g+hWT6Y4g1kMRp5JIP
	EnXZtd9NsvgBEzb5i54fBH4EJDx900U8BOCN0XPhA3mN+pqfo6dZm8wmbxLlcjoGG9zwGixY95iPK
	O5EQLHOXiw6ZYg40sZupk3wfgpN8k0hQNVm7BaTJSS4KyETIXlJ9/hLhcmRv8cqNrmRP6ZuyoKPKd
	/FU7PJ0OmC9W2HQBXutWlufnRbuQ5vfoTWeEzmDnYhaoV2dhndhhYQ5t7h5GC0kEhAZFA4cLXd9Gt
	Yc2S+oMuFnh8jGe8L8CVatcvQYcuLaphmnkke/kg+GglKL4GbqSVtBNqCWwULrwnVnQAk3NDjQf0z
	xsL58VMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDwP-0000000FZkr-0BA9;
	Wed, 14 May 2025 15:22:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDdQ-0000000FV6U-1sXd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 238C644629;
	Wed, 14 May 2025 15:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A0C4CEE3;
	Wed, 14 May 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234984;
	bh=CrrzdSf126QFxG/h/MtdGCfAFJXhj2DHZoC5yge2PDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TvS/h4sHImuv6xqPQx/O6uSx6gbVgv5RWoB//pZbkqL9B1aVAjvMXfHYAVWYfPC1w
	 G9yxNjBG76689lKx5My5wjAk51escvGIM9OOXdp1rGep9ef0mnO8ZvU9c3JeLvp97H
	 3zVjUCMXqtUf2tzUcSv4Q2kdWHqHsaM/2YxhYROxOUd7U6ZAfVRfO3Ngceyje8gu7L
	 xGrXpJ9Hgl/2B+97cfera5Kgm/YsMxZVN98Z7F+v7IfkJhPD2whRaB06Qt07GyuOGN
	 s42EFJzAJIkNMSLdtGm64vdMgPLpJuaEaNYjIZaKLiIuhIFx8wtNYkrLgKuDGdGcN3
	 AAeivgwN0ojtQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
Cc: linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, 
 Suraj Gupta <Suraj.Gupta2@amd.com>, Harini Katakam <harini.katakam@amd.com>
In-Reply-To: <20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de>
References: <20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de>
Subject: Re: [PATCH v2] dmaengine: xilinx_dma: Set dma_device directions
Message-Id: <174723498087.115803.3330259511910052558.b4-ty@kernel.org>
Date: Wed, 14 May 2025 16:03:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080304_506796_B10CF8BA 
X-CRM114-Status: UNSURE (   6.05  )
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


On Wed, 07 May 2025 20:21:01 +0200, Thomas Gessler wrote:
> Coalesce the direction bits from the enabled TX and/or RX channels into
> the directions bit mask of dma_device. Without this mask set,
> dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
> from being used with an IIO DMAEngine buffer.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Set dma_device directions
      commit: 7e01511443c30a55a5ae78d3debd46d4d872517e

Best regards,
-- 
~Vinod



