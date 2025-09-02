Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130F0CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxgs3Bk08QrxKooWu8Hqpj6+OcO1bosAzA5skUM7MQM=; b=mVypHZbc5NOvysVOSiDruXlNF4
	feS3yXum8i20FMPytd5HJFVPGUDUnAcwyhuOqwlRZ/f0YVF+cM/FFco+VRd7BASSF4ykef+Amv6sK
	ybyycPCwC0BohEfh7UO14KdHSfGIfApbOhkv25GJeCim3rcYaAdI6QmeNDWamy4+Eh3bDfj3wWs6c
	aEBoa63p7M4nBQhKJ4yvhar/Q+ne1rpSafgCMbNf0vIU/AKFWUYnol0/zaCXgIdQXNOBtfubYObZc
	WSNeec5oJJ2I6jCZ69hAw7XYc3gdmkhhylae1sA6FlZM/mYhgIk5s+O05ZWR4JmRG67103AsIAAdH
	QR+4PvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9g-0000000HHpI-39G0;
	Tue, 02 Sep 2025 12:30:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNeE-0000000GTrg-0UN5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A6BE60207;
	Tue,  2 Sep 2025 09:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C30C4CEF5;
	Tue,  2 Sep 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806593;
	bh=dIWtODJzj2z3afarX1J115TDTUy4z/tY9fh6ITu9yak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YYVsMbmJBDhypGCtghxtK0hJhb/2u35ExwxIh+zRss2RrKBGs4OdBMOYkASinP00W
	 msmDIzknYFGwq/SiQ+0lFnesE0aAzwEE2hQMmI5lsQi2pNnIOm7kdaDMAvt9pXI1L1
	 Ax24QYIy4qpScDlqiE3o9q2mQvIsF/Z0Vn76CP4c2hBqIVXamwyEkVvkopPPXS2AYa
	 Dy2veRrBOICFlKytvRUT9fT4Nz6O7IAuvficoiAoHlmD+F6IBjYCavWzl2nIWSulD4
	 ju93+tNVT20oEdJg48eBJE3vx2EqOAML1txMOqBNtX1ShN2+XCeD0fyQYrf4pq3hDR
	 oAzIwRycFxmxg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Michal Simek <michal.simek@amd.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Marek Vasut <marex@denx.de>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
In-Reply-To: <DCCKQLKOZC06.2H6LJ8RJQJNV2@folker-schwesinger.de>
References: <DCCKQLKOZC06.2H6LJ8RJQJNV2@folker-schwesinger.de>
Subject: Re: [PATCH v4] dmaengine: xilinx_dma: Support descriptor setup
 from dma_vecs
Message-Id: <175680658917.246694.14605510999685994638.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 15:19:49 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 26 Aug 2025 20:21:10 +0200, Folker Schwesinger wrote:
> The DMAEngine provides an interface for obtaining DMA transaction
> descriptors from an array of scatter gather buffers represented by
> struct dma_vec. This interface is used in the DMABUF API of the IIO
> framework [1][2].
> To enable DMABUF support through the IIO framework for the Xilinx DMA,
> implement callback .device_prep_peripheral_dma_vec() of struct
> dma_device in the driver.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Support descriptor setup from dma_vecs
      commit: 38433a6fdfb75d12a90ffff262705e1ecfe88556

Best regards,
-- 
~Vinod



