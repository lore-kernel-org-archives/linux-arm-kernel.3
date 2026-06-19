Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AC6CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=; b=od6/kP/Ca/nKJC
	QL0M34SsKZz3+NaS+QpvZ6HYayV0HxJarZpk3N8gdT/GKXJRRv1wWEt2wx+ofOIwhcT0SL+6eP2ZI
	LrIKsNPAjrXm7tt15u2tjg39hvgZY7FbqB/lQAZq2qbladG3mcxsGIDmkOeoduZe/ugKtnVL1vEID
	vflAOfSxO/uHqZLJvoJ4Yz+r78VmlXzyfe7FH6HUqKyuh/O9TtBhQujeeR7vWK0FwhkWOihy/jVzj
	5lCz2BPhcl4GAA3TioWE3ltcus77SzJ8IbAjOIqIver9eh+xluG2F7TIwLdYgMx1z52cRZA2/OQlD
	v9eJQzC2+3wEcVZKtFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFQ-00000001z3G-24QZ;
	Fri, 19 Jun 2026 04:54:32 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRFN-00000001z2G-32cy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:54:31 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-9185503e6a5so213018385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844868; x=1782449668; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=AGORDlW0lV6aUvu+QwJP/eYBILoZW6mQ5EURVPVeWdmVNfwo+1jbLNy27+vbm5aQ8g
         z++FK6u07rKfRXiEGPgZRfVFuzugZqQGVYUjB5zinyHbtYOwYQMZ6eBw6iKC6jfqygtk
         bdlwC2bK58GcT9Af/I8ZM71CpVOiYkjucVfz8dgRUtbqyjF+aTHtve8kuuNyWWvgkp6U
         jAbIAxjDji70MLThqzK+MmWAQy7H1TD0lJ6Tw/kj7SjqIXMRe35KsokKFvEZiDRi+fbK
         372umgUFrod1gEKUsn27azofEhlEgqrqAGDoqitDIfzRuJPBLGuZfJSFtd49pbgf8xyX
         gTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844868; x=1782449668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=SzTvuxtJj+/cYME+shf5oMOFMtse5RVMNnesTKSB3Z98RHMtJ32oDaTeoH1zPyJBQb
         PhS6n61QochWPt/SCLIJo8ToMnUwSW6cr0+Jzrp+AHCFBDjt7FulPwsb2wMzZPbDbGG4
         XCpXkr1yNofRxEfMqOxMNBFlSPWzCyUBdnKq5hYjfy7BywNnYeBSEGs2Itnls30cm+KN
         7s+9nMybDLqNPMYvqdTj+vSVUFcaXhmzIqCVbju/NJzTIuNxqYFi8HQnQodxi0ZueFTi
         x0USCTV0Bp4245rDmLE3RJXKTap4w1xBlx+/pgZHu+S+Up6aycQ9bkRRBGx1rU7nFiUQ
         bkBA==
X-Forwarded-Encrypted: i=1; AFNElJ/Le1CSCwq3NN9l8OP8uqCrkRWexihhziNIgiQXzHsGavNm+mcUvoxtcWd7CAMDFaQQnGLGJnXcHEP6FIyQhLIm@lists.infradead.org
X-Gm-Message-State: AOJu0YxSUUzeIgwYLFOq6ax8Z1FMjFOrJ004zd9SjOkqmg84sHDpPAqH
	gW3+bsHUFkB4uTxWDOr4ZRPvLlJRfM8BXz0n1UF4tYn8RJXZE+EYW7zw
X-Gm-Gg: AfdE7clqni0Kczz+wYWEsRM7Q34CrZ68dYD7MTzQ25xcpw80r/6uzkk841M0v6BHYDa
	c9mzq7c03QB4nt44Mqd/QulYq0WvAfP9eOxeFDb0e1sBYIp+fAtuj/v9WaJIG7/u/tZ3X/v+sQb
	ZU4fqMB/82YirCcwefSPAj0WSc3/55oe9FBxS5QOBJ0Qv88XC//ule5k0R24M0KbzoxnpTEIYdC
	D2PE7A2P+KUTTcKxDiq848PG6xIZLV1llJb2lesLOlwwH6A6FM4Arg6oIfMKA18nGEiajet6UiE
	y7ObPNB/IvPYC9yyzb1IRM0Ez6WBdHgJqCUncE0T0829yQGsYLYuJl3F8ivrm5lFkwqCi3Gr/l1
	JMEzA7wEw7/L1sAe6JtVQWajasSvsOtO4Zm/1c6qxgxwPNAqADEPeg2VLke3cgRl8p0GucNODff
	FE4izC0io6fzJI6g==
X-Received: by 2002:a05:620a:2589:b0:91f:27bd:ded3 with SMTP id af79cd13be357-9208c8133femr270065985a.21.1781844867940;
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733
 DMA controller
Date: Fri, 19 Jun 2026 04:53:29 +0000
Message-Id: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IokmxVxEXMZm2U2haMiqCe
 HejXb7F/xsIZSaBe7VBpoWFv6lA1xWEl09PQo7FYJRxyukOZU5OMfpb02D8eAymtVa3nXY2Qql
 +mR68Xsd++Fvm8U1hOjew7wfgrTu3cwAAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_215429_781538_A989E332 
X-CRM114-Status: GOOD (  13.29  )
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
- Implements the A733-specific configuration and register mappings.
- Updates the device tree bindings documentation.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller
      dt-bindings: dma: sun50i-a64-dma: Update device tree bindings documentation for A733

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 223 +++++++++++++++++++--
 2 files changed, 203 insertions(+), 22 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>


