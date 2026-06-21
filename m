Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA42FCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 21:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=; b=LmOvQvIOylSacE
	eVe9ERY9h6QHPLWj52MGrqQcxQXqjv5n3JHtMJMJW/MN1SlQ1KTyop/tTfFnSo+o+hZOAWMtkM2eH
	y1ETpjYSJnsrhTBHWExr7KWr0e9kDVogtJltxw12F5tvWm/kjwTZVvEvihe/AYyN9365nKTcols/W
	liWkUIba/OoiYHE7L1L1W2xSATVn7ECz5uuegPbCAhKnrt+/VCHrlU4s7i2s8bR6GNC9awmwIHYKk
	4MXS+Eo+rLVqZuSV/Cnu8oKb/JmNrcaTliPuvGrWD0kxv44uLlJsBV8cFt0ivMBh7ZSE0we2dvVz1
	hD/BkpSZr94v5hWv5tvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv4-00000004AsF-2cmH;
	Sun, 21 Jun 2026 21:41:34 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbPv1-00000004Aqi-02tI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 21:41:33 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8dd74f90e3eso42202646d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078089; x=1782682889; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=nFblKQ85hPdMUtpN8CXDbSBdHPHuXR/cXexbdXFzBjJufgTGCcNh5R0PwTVAi4IYPT
         IBGIrvZMIv0UCPpR3bj9wfP4K/q6AOHcvqP9x2ZhrzC6crs4iMLdcyLmjo11HDkDk829
         XdKCPzWxsIKTLLYNDB00e75g4WKWMv5H95CanvrQgQsjrKO0zl7dG9vfrWeV5ZQYc3BW
         UBBLKMjZo83JjpNPkubHV9bfCUyGwAx9vxB4XStR/RkbvwsWz9POmoK7OrF+gsjbsojj
         vx+2dD07fGY7kXUD6PRBngQuMjO++QqINSoB4oS4rHKFc4+Wz+mb0IMipOhP5j5gficM
         1Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078089; x=1782682889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=NtWldnKxmfXwVWKGZ0RpxeP8gxogBIfRjDsaAF49JdaUvhqMqaAD5tKHg3+Gm66int
         PbIwSufujiOZe7i/3ktKCkO4S5mGS4qM/lcWjw1D9zNs0FmtsUYcRCFAR4hh3ZH2N9RB
         g/IXj/wQpsZZoP802xr9YutpfoVXQuy8Vk5l2qO1IyKvCGzgoxvB0LfmCnqnuEQxSso7
         nsPgL/VlFtmd7DQPjXLc6FjlFn1xFpleFCS/a+bY41QGDMNX4X8j6EGUN5WUBgUgZLcp
         WpMB8f5GWmTphYPzdKV8sAYifYOVIx1SRpgwxpUP2CujqQhaMtFY6kKW7G8XlJQ/7oMG
         X5CA==
X-Forwarded-Encrypted: i=1; AHgh+RpQfMfS9EpbV/foK5BOzjOx2bl061l/8kxIj+4cgKkc9y7IDoXDnjbgnkdJ0TRNlefTl+q5mepPSgEwd51CmG15@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1HZLeCDjSmLxmwGoyi3klbImrEvJGpK1eBSYrGuHMReXlK2cr
	dI6ujKhtz19Nbf7ugUMQNQ3sXKNdsEnMsThLMs3+gUSxsTaarBiTrVQJeMuG3lTjYok=
X-Gm-Gg: AfdE7cmAlpzNd7X75X/1ZVYdPXFs2GfN5xhdPGyZ1mUkNFa5KD48eMl/0GmpmU0cGAe
	DACeWoJ0LI+LTifpMvP/1pDikb2QCsiQLVel/jGGps4kFVHSu3diN1exKy7GyXa6YTmaBrnfFSy
	5BWfs/n792e2V9k1MClouttiMZ9bW6a7pn837y4Dt2cJ7AS8Wo6J54YwMyWdw89oQcnfW9v/CGq
	GC+U5679xdTBs8iDs0EUdmszp2fZjiIWaseaZ2FJUP2IDxk/rDRp9xnHbR+6nRdIdVGO1BCRZTx
	SDJCL/dKXIbk7kb0itkTsFZmaZgWzZ1xpuasLJgwwX5q4Vn8zA2QDft18GO1z3gClr5Z58MB3Aq
	8r+d1H8WmlMZCJPPhoLr7bthiY5KfT4Rn6Gcndw6aZbUyr8gRFAFLOiV0th94M4LWfR9AzaS33O
	TH1kKm1I003lsHwA==
X-Received: by 2002:a05:6214:5182:b0:8ce:e29b:6a91 with SMTP id 6a1803df08f44-8df927c4decmr137731436d6.42.1782078089211;
        Sun, 21 Jun 2026 14:41:29 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Sun, 21 Jun 2026 21:40:53 +0000
Message-Id: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMutMAAsau+h+NCwTUaeojoKaN8
 d8rdt3lSc49d4PoA/kIt2yD4FeKNA4HiEsGtjND65HcwSCY0EzzEuMyaEZoijxH1xu0QirFZcm
 1cnCspuAbep/FR/XjuNRPb+eUSUZHcR7D57xcefL+11eODJ2RtZZlYwth7m1v6HW1Yw/Vvu9fr
 Adhw8AAAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_144131_063101_264B9C32 
X-CRM114-Status: GOOD (  14.48  )
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

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
1. It supports higher address (up to 32G).
2. It uses a different interrupt register layout and mapping.
3. It has a different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series first refactors the
`sun6i_dma_config` structure. By moving interrupt handling, register
dumping, and address configuration into function pointers within the
configuration structure. This allows the driver to support the A733
and future hardware revisions. It also aligns with the DMA drivers in
Radxa BSP Package[1].

The series is organized as follows:
- Refactors the configuration structure to include function pointers for
  interrupt and register operations.
- Moves address setting logic into the configuration structure to handle
  varying address widths.
- Adds support for variable channels per interrupt register.
- Updates the device tree bindings documentation.
- Implements the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dma: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>


