Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E3EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 19:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2owo1tpHzwbDp5wmgCJnqmc7fIeVQNphYE0r7zLuNQ=; b=c8AKB9uGPvBhWLMldVERjPiwVk
	rLaFoZMTcj9WnCuvnJAdTxQjjKVSHb2hCirfgIyjfxEYxIkH3ry79t6hs0+S24IA2tZk/FIQYNulZ
	Ef+hRJythR7lY1iBStk23+5XQPYLdVCIr03Kkw3lXLIK4cKZ6cA7cZ87aZ/NjHlnWs9ckeOBiSrDT
	0p9caTJQk0sGIENTQkmDbvVNVvwZWkfOQrVxr3pgvOajfghNGKdtypDeQ691UmAyMClYxuBPdUVFG
	n8p8dJmF/fj+MhLHc7jkBo83bK3tVp51R1JIgsIETChy/jXMvoRNpA3SedKL+SiveCnXb384Z04hC
	Qg6vxW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeNL-00000002bU9-0mcR;
	Fri, 06 Dec 2024 19:52:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeLu-00000002bIQ-07RU;
	Fri, 06 Dec 2024 19:51:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE32B12FC;
	Fri,  6 Dec 2024 11:51:26 -0800 (PST)
Received: from [192.168.0.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF733F58B;
	Fri,  6 Dec 2024 11:50:57 -0800 (PST)
Message-ID: <1f2b3af4-2b7a-4ac8-ab95-c80120ebf44c@arm.com>
Date: Fri, 6 Dec 2024 19:50:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, heiko@sntech.de,
 luis.dearquer@inertim.com
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH] spi: rockchip: Fix PM runtime count on no-op cs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_115102_115405_9B0E1E83 
X-CRM114-Status: GOOD (  12.28  )
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

The early bail out that caused an out-of-bounds write was removed with
commit 5c018e378f91 ("spi: spi-rockchip: Fix out of bounds array
access")
Unfortunately that caused the PM runtime count to be unbalanced and
underflowed on the first call. To fix that reintroduce a no-op check
by reading the register directly.

Cc: stable@vger.kernel.org
Fixes: 5c018e378f91 ("spi: spi-rockchip: Fix out of bounds array access")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
Not particularly happy with it, it's just the most straightforward
fix for the issue at hand. I couldn't quite convince myself that
no-op rockchip_spi_set_cs() are 100% ruled out just from spi.c after
the first call either, but maybe someone more familiar with the code
can. I have only seen the issue for the first call / during boot FWIW.
Any more elegant fix suggestions welcome! The other host controller
drivers don't need the read before CS change, so this shouldn't really
either.

 drivers/spi/spi-rockchip.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 864e58167417..1bc012fce7cb 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -241,6 +241,20 @@ static void rockchip_spi_set_cs(struct spi_device *spi, bool enable)
 	struct spi_controller *ctlr = spi->controller;
 	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
 	bool cs_asserted = spi->mode & SPI_CS_HIGH ? enable : !enable;
+	bool cs_actual;
+
+	/*
+	 * SPI subsystem tries to avoid no-op calls that would break the PM
+	 * refcount below. It can't however for the first time it is used.
+	 * To detect this case we read it here and bail out early for no-ops.
+	 */
+	if (spi_get_csgpiod(spi, 0))
+		cs_actual = !!(readl_relaxed(rs->regs + ROCKCHIP_SPI_SER) & 1);
+	else
+		cs_actual = !!(readl_relaxed(rs->regs + ROCKCHIP_SPI_SER) &
+			       BIT(spi_get_chipselect(spi, 0)));
+	if (unlikely(cs_actual == cs_asserted))
+		return;
 
 	if (cs_asserted) {
 		/* Keep things powered as long as CS is asserted */
-- 
2.34.1

