Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21504CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=; b=qQHlYUj8QJFzjL
	A1GEAWiioW0UshTHJ39uL/TkbxkVuGnUXB9no5sjGLvMgffmRQuP0R9c/wyPUHMKD9mhaF2VEamOO
	nzl7d+CEWtAwQ3ZxlOvx9ZP61NHe4p3i8nYzL0uxM0JANRamvBKdQVAausGuJEpFja22uV9VyK1Zm
	D6zIjwnQ55Kui3Sh+c6I6zLnysZWKS86xA3eQ2q3B0Vy43pwXTWMzG78iKbWnzxEgsnBAa3d6QR1+
	JEd7E5jNb92PXmjGmq9QsdE62KW4Ela7QN7brBNID4aKmjfdLdLJQjSa3WE72XtGMTuRGNOj/J8V4
	KCqsxcTmhUVSTnAYJZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcX-00000004H3I-0Met;
	Mon, 22 Jun 2026 01:38:41 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbTcT-00000004H2c-3qRl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:38:39 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5176fc0cc72so41368791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092316; x=1782697116; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=SetdrCkbum/9zlXligiI6tcq966nV9IOi0UQYRMC2XO9K6Ql1S7P3F1jdMnWtiS085
         vJn81DPtF+1QAW+USWfSmEvgwurlLXMb8qkZPmVvR/IRN2/kS8/NVeGWx1Fyv8kxVFzT
         YS2RzSK0Lex/mwjF2j6b5gLCdH4+HU6j//tKumQ4LcS86LML9zk0obmgnPkN3HIPw3Yp
         lsmjJFQC16fwzUqBNFGUodQUklSTdAhfU/X+q4VxOHVs1T7kHks9UxKjDx/4l2P/WHm8
         CqLukPZCntjhR+YAEBaBFGyOG7z3qWwop54vOyxLGR7Z7vTzNOm+i66BOfG/WIdKqE8+
         THww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092316; x=1782697116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=ckG509D4Xz+R4l8p5OjYjSvxOehAmvPCpDKR2pMlzQub80IF57cSYWJNhHmUxinb+x
         AhJHqU2/8bfq48eWP9swJiiXKcSPzKbEF/eGwtOJZy48yPK+uTa6FEwA4y1SvdI2ZL4l
         5qbhDugZUFGAHwtW86SK8ef4VBcbuO4MVNNXOYP2SlggxZpLawAUYwJ1QTOXAXXT1W/p
         EmS4rdoXATe3+wX/HMZS5WnTIFbzrXkOHTBjN4iX0B25jw7xKgLoAPO9P5INccT8sugK
         2fkTWh3O/0zWKJug1FfZashoWDvNH0cpknt2twQzi8spOwHOxl6VcleLT7q6zIl/Fo7L
         d2MA==
X-Forwarded-Encrypted: i=1; AFNElJ9GpMpeujtvYj1Ijm0lQBqCzX12k+Ej+n8IHglNohLgxUNdODYR4LIZ4Bj2LSez5YJVEWk9+OVsmBKBImiINpRq@lists.infradead.org
X-Gm-Message-State: AOJu0YzpZ47kK8z50cTkEu/1dkEyR4wRWlK8zluonFMQW87c1RFIPiJJ
	hMAKQUyonMSuyBk58DWB9vv16XcbEKBkXQmCrqN87rpn6KvneovSMPfbp9N6kH0G4jM=
X-Gm-Gg: AfdE7clhccwSnRiOV6pgGdEPaLqU+KOfKPicKOhOt9WW1Sn6Q7tYhalDyrvUShiNZOx
	u32vzLqeDV6jmmyJclUVuBfQOEkuhO0JtLMR4cv/aqdiAvplcXSgRbOZgERigJ8w6G3xrVOsImd
	0gpbJxNJCa1FDxBMSDawlVEUIF2BkJljIlAyxAloJZo2LKYN2qaKvBBmVJxhGBPdtfy12Z6CIXn
	XSdWIryThKvEdc2vEf77yWULlUfj0lMD4mkKe5qn4lETj65nv9+9nwz2WhDmLXrIuFmRajHRL8c
	5p2SOUtXyP7IVOafZIXs4KbGWbryJuQFgJcLfGrbuqnVVpHifuzTxRMRnA0MKPEOH2qtPwASL+g
	SWxhYXGKlcUw3TyG6ZqAi7NezuDSqMee+SmNqi6zjR/2HgdgvWWmeN8vEjYQLfCZnFb4lArv0ux
	YGFBSdKFwhFiXPMg==
X-Received: by 2002:a05:622a:a04e:b0:519:f2bb:1036 with SMTP id d75a77b69052e-519f2bb1203mr115543741cf.36.1782092316301;
        Sun, 21 Jun 2026 18:38:36 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:35 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Mon, 22 Jun 2026 01:36:22 +0000
Message-Id: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBgFr0K6tqb9+oO48h7GRWkL1AiYFhoN4
 e62uCExLid5M29BwXpnAzoXC/I2uuDGIQE7FEh3amgtdiYxAgKSSFrhMA+SOKxKxrDpFdbAhaC
 8olIYlKynt417bcXr7cthru9WTzmTF50L0+jf22Wkefe/Hikm2CheS141ugR1aXvlHkc99ijXI
 +x8oL8+JJ9x0gARp4pqvffXdf0AaAIbAQABAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_183837_993559_22DFF412 
X-CRM114-Status: GOOD (  12.84  )
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
Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com
---
Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>


