Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA6C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O+Y33ifQJ8/eGSJF9NUK/wyESJTtkXuplimgmPx5EAw=; b=0zL0jJkyYvBor//UFYWFjZxxPf
	hn3KOJ7Ba5RJ2OF+1iPuGtlH4lHz+mCqbfmGgY3G2JmCeWXsnSKufZfLmsVOl9LHM0HJA7K3EEzvO
	TBlhe+xPCKIHIIXQ13sRsY2idMDqU1goFZ9afl7JLHlc9g0x6OV/8zeAPPVkunoxHM4yRI+Y1zsEL
	+uzdlwe5VryVT0LrlUTh2ow+4qF0Rmqy3o51jQBvtaNSrpH1IbYhVYrkXNDBduB8S6LYPTcBZXlmM
	JjmfCTdanOrCXXwdAAE/M77i0QJuqnnXgyGMFA/OpYdlrAH0tx4YWdd4g4DZoM9SWinWcfNT5tgDz
	xUEVmV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4iti-0000000F6R2-21nu;
	Thu, 10 Sep 2026 17:49:18 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4itf-0000000F6QR-1b4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 17:49:16 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-499db1740f2so82295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789062553; x=1789667353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+Y33ifQJ8/eGSJF9NUK/wyESJTtkXuplimgmPx5EAw=;
        b=mYqdmR3khgnSHSZAfacUZ7ir7PClOjfFn4i7+7cisobx6iAWwp3J16hnN7aOOqDw5p
         VMPv9Izz/JE+z4hqPqg50koBMiKweyJgex3fye26qfP3tNLeWPJhSnO2OF97jIck7D/k
         3yY+qsBYSQ8TT+gQBu2JsVhM8FY4hyY0o701GjaemWwAyN0ATRxI29BUkGyb+uWYy7Uc
         zC0QherSW1m3sYIbeeLnggUad8VHL0A/2P2UFspG0wJeBm4Htx5FfHebVyZsRs1VkxM6
         C55w7odWRrIHckoM6a2PzTBml/qEUsPoM6JU3nL4ts36OhYgTazt/1ywZLJ05qlaYqkg
         v4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062553; x=1789667353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+Y33ifQJ8/eGSJF9NUK/wyESJTtkXuplimgmPx5EAw=;
        b=HJxLI3LAJWBMJMuZKmTMYpG1FqNZV7WLN9V08n4LZQOYpaYKiHvyeTJmWLqjFFDg7d
         52Ljy6E51XlIuODm2lLD6OrVJ0lTsZsaIj8mFprp3z101SK3YF0uQO78osu01fij15J5
         c0yFq7f8Nsq7D15a4TLcvyy9gIBR2VcqZUKgvZMqa9j/3cCSCHWPCzrD3nDRF2lC0oU2
         O3sXYkx9OzoRGtIncifJvVFcH3eTOB+UJTdp5wyvO688zTw7M+4VZk2bo4LJYb00k+3d
         uxu6bKkADTF5vAtJbk9hnKuM8Wz2D2HcHBpEyyZnTVKg4satB0T5fzLnEdsaLj6/9WwQ
         ZU1g==
X-Forwarded-Encrypted: i=1; AKwUvByP/GX2g9nrHv4ITSoEii2poH5wbG7mLJqq/ooesu+NKmTwCgu54w1CPxZpv1aVN0yG802VV90vwT67WNY68JCf@lists.infradead.org
X-Gm-Message-State: AFuF++lcagoCzlP3C58BjaHHafyuX4njBU2L1qfPNrA+l8ricmdHEw0U
	dQYZPpnjRO4l6OGkG8/sW7adY5oVAckbUbfECztRudVA1/4UU5AsHzDy
X-Gm-Gg: AYBFou33n6AmaQO7x/MCcfNCZP8mbpqpjd003TwgUX+f1tVd8+kUSEPd2ttGcrNb1gz
	9l/jz1yFFqS8zIFvsx8SjHKRyO2q24DWyisZDsU1cPe8rn9Zz2tsEGpN46uVzWxre7qVA8w1wSY
	+uG8SAKVKhW7Xo4sg/Oe/GsfIhtxelBwBMkKF6teuAPqAkQXRlxbEnfuF9eLjfT5QBhnwzxPfY5
	0jPvYAYHad5UZJ0EbitVa+4rZGsF9wvaJcUZgZhpD8gBG0ENwqg2N1Js+aXSe1s7eqHZevpGmt0
	YXLxMG7u9RQUucahTSfxPcDTn0JVsGBgFmkOQL4ZuZS2Ih5qnkydn3P5N9E9wBO7MvO3WaNPTbI
	zUC/XthTKmpnLbv7WnUbOr4n041jHLBLWPsLqFZrToeVQr1wk242cNAJQk7Nm11HMdGSGXZWag+
	APUWiL8oquSd0wod0gsL/ColJLMjSt1b28icJ5JucANEBhcOo9P1jEAwVgbE7PjXRTKBbMRxXpD
	ePm/zS/cxDeXjS9DN8=
X-Received: by 2002:a05:600c:8b71:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49e619d6a4emr1272515e9.2.1789062552366;
        Thu, 10 Sep 2026 10:49:12 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm94881105e9.15.2026.09.10.10.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:49:11 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	michal.simek@amd.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] spi: spi-zynqmp-gqspi: stop the controller on shutdown
Date: Thu, 10 Sep 2026 20:48:32 +0300
Message-Id: <20260910174832.873352-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_104915_448801_94B7CAEE 
X-CRM114-Status: GOOD (  27.52  )
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

The driver has no ->shutdown, and platform_drv_shutdown() has no
fallback of its own.  Unlike pci_device_shutdown(), which clears bus
mastering when kexec_in_progress, nothing on the platform bus disarms a
device that can still write to memory.  The normal kexec path never
calls ->suspend either, so the quiesce in zynqmp_qspi_suspend() is not
reached.

A controller that is still executing a DMA read may therefore keep
writing to memory across a kexec.  QSPIDMA_DST_ADDR still points at
memory owned by the kernel that called kexec, DST_SIZE is non-zero and
the flash is still clocked, so data can keep landing in RAM while the
new kernel is being relocated, and after it has started executing.

That destination is a physical address which means nothing to the new
kernel, so the writes can corrupt whatever now occupies it: kernel text
or data, page tables, or the initrd.  Nothing reports an error and the
resulting behaviour is undefined.

This can be observed by reading GQSPI_EN (offset 0x114) and
QSPIDMA_DST_ADDR/SIZE/STS/CTRL (offsets 0x800 to 0x80c) early in the new
kernel, before the driver probes: without this patch GQSPI_EN reads 1
and QSPIDMA_DST_ADDR still points into the previous kernel's memory.

Add a ->shutdown that stops the controller the way zynqmp_qspi_suspend()
already does.  spi_controller_suspend() stops the queue, waits for a
message that is already executing and makes any later transfer fail with
-ESHUTDOWN, so nothing can be cut short by the register write that
follows.  It may sleep, which is fine here: device_shutdown() runs in
process context.  Unlike ->suspend this cannot abort on error, because a
controller left mastering the bus is worse than a truncated transfer, so
a failure to drain is only logged.

GQSPI_EN_OFST is then cleared, as zynqmp_qspi_remove() and
zynqmp_qspi_suspend() already do.  Skip that write only when
pm_runtime_get_if_in_use() returns 0, i.e. runtime suspended: the clocks
are gated, so the registers are unreachable and the controller cannot be
mastering the bus.  A negative return is not the same thing - it is what
the CONFIG_PM=n stub always returns, and there probe() has enabled pclk
and refclk for good, so the controller is running and must be stopped.

Fixes: dfe11a11d523 ("spi: Add support for Zynq Ultrascale+ MPSoC GQSPI controller")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Changes in v2:
- Quiesce through spi_controller_suspend() before touching the hardware,
  so nothing can start a new transfer and a message that is already
  executing is waited for (Mark Brown).

Note for stable: before commit 1c26372e5aa9 ("spi: spi-zynqmp-gqspi:
Update driver to use spi-mem framework") this driver stored the
spi_master in the platform drvdata rather than the zynqmp_qspi, so a
backport to those trees needs spi_master_get_devdata() in place of the
platform_get_drvdata() used here.

 drivers/spi/spi-zynqmp-gqspi.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 4d55090..15e9d3e 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1373,11 +1373,45 @@ static void zynqmp_qspi_remove(struct platform_device *pdev)
 	clk_disable_unprepare(xqspi->pclk);
 }
 
+static void zynqmp_qspi_shutdown(struct platform_device *pdev)
+{
+	struct zynqmp_qspi *xqspi = platform_get_drvdata(pdev);
+	int ret;
+
+	/*
+	 * Stop the queue and reject any later transfer first, so the write
+	 * below cannot cut into a message that is still being executed.
+	 * Unlike ->suspend this cannot abort on error: a controller left
+	 * mastering the bus is worse than a truncated transfer.
+	 */
+	ret = spi_controller_suspend(xqspi->ctlr);
+	if (ret)
+		dev_warn(&pdev->dev, "could not stop the queue: %d\n", ret);
+
+	/*
+	 * Only a runtime suspended controller can be left alone: its clocks
+	 * are gated, so it cannot be mastering the bus, and its registers
+	 * must not be accessed either.  Any other answer means it may be
+	 * running and has to be stopped.  In particular, on a kernel built
+	 * without runtime PM this returns -EINVAL, and there the clocks
+	 * enabled in probe() are never gated at all.
+	 */
+	ret = pm_runtime_get_if_in_use(&pdev->dev);
+	if (!ret)
+		return;
+
+	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
+
+	if (ret > 0)
+		pm_runtime_put_noidle(&pdev->dev);
+}
+
 MODULE_DEVICE_TABLE(of, zynqmp_qspi_of_match);
 
 static struct platform_driver zynqmp_qspi_driver = {
 	.probe = zynqmp_qspi_probe,
 	.remove = zynqmp_qspi_remove,
+	.shutdown = zynqmp_qspi_shutdown,
 	.driver = {
 		.name = "zynqmp-qspi",
 		.of_match_table = zynqmp_qspi_of_match,
-- 
2.34.1


