Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B32DC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hbLnIWJycW550lJgcztROooyzxfaoCBFJTCFjxtrh3I=; b=TdTJlT6XFlyoQbkssvREAMxxwG
	VnlpU0QiTT/TiOM/1WIBksGyskkqkclulRUuanrkg2V/7lx8Ggg68xyQxg2/1taYxS1MBePMmNOn+
	2LdTCKpWxO2Sz29hfitXqAZRdsIEos4pAbziUynIgBof6nIqX2G2CfOb0gAYgc568EXxInks8NEXy
	izz7Sf4OkGQMOtJ0Q8ByvhG1aWpqLTXVOhO1yNKPQaCyKl9PP+22FtuXqMbRFxgdN7uDGyWYZ2hWT
	mmYttzCE6Zpqwmt60tvKItuTkHcGkiq2vPi9XtUBOuQi2HKoVcvyFr1W+3uPU2vLupQe/vwoFfyDx
	W+TYcvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d2h-0000000EDrv-3owj;
	Thu, 10 Sep 2026 11:34:11 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4d2f-0000000EDqr-2Tc0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:34:10 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd82be878so4157485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040047; x=1789644847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbLnIWJycW550lJgcztROooyzxfaoCBFJTCFjxtrh3I=;
        b=LNV+7wVTHBKuRnl2Wj+dMIN/EQ4eHLsRrC4yCJ17b1zeZ3bvOGteTsBNwuuSpyNc2f
         QduJrq53FLgGzpMcd3elIUBDvlsUXj50v4QY3A1R4Grh25hlZiTQ8Yh4Bz0s77DPdXa5
         0xRxe8xk7MaMYKt+repnjJtrPPnbjRHTPQAkhgOrJGDuUudd/S0176diuUEdNo8kaT6o
         PXsFsXcSH9AAenModc7yv7VlE76E7LwDImi6Znl1reLqVvCxO2lBxNNZp+T+B+Sdd05y
         xL3Riv2/3i18jk69h+CbIq1NQWpX+HUlk+h8+Z6JjK5LN9lIIetEG9/ymwf8OKNBLWes
         ICiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040047; x=1789644847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbLnIWJycW550lJgcztROooyzxfaoCBFJTCFjxtrh3I=;
        b=GN2jbeQ/GDg9emp027LAlBdvwt42VRc3ZNehfQFZHFKwa+iMd9OYYvbsSSvW8KMAB9
         s2DABJp30UzuAkTD62Yzu3+T2J/BmrirWCAQNyRiBV75zrh0pJDln3UjAVUzMDUa35K3
         i1F5Jl/lRCTj1RT2HxTa/i+l6D46pSgKjcGWLZxf1pNEaBSP5ujBtp2zS1pbbPqngus5
         2/GauyvtvfKWrpwRZuIEL/HiWP85bDlT6vMiPWHw/RaAITmoL0mB3ivHmRRfjdy5+JSp
         c9WHBtNtA5qzUNqHHrLXdmnIjdpBoDm4Y9ksKgOTyRkxWVAL9zaj+xgRGqcDLJUlsdP+
         U3Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxx8SeUfveIF6oynKZYjLsSA9IepC8+X0T4UQr7RmU+gRheZEuPYiffTOnhKHLdDFfwNPQabQKJN41/t/S3KWPl@lists.infradead.org
X-Gm-Message-State: AFuF++l+TIkjqQiqtHCx1cPGy/kRysmdTEpEcSTIqJuFYHjhZcfvhnyr
	ywxMEbC0xEQbbTfE9BM4ikBXcJ9qieybI+qMF9OUZM5x1vUy0kG/tn5Q
X-Gm-Gg: AYBFou1fPkWO2jRHQ2Xbstk6rDzIXb6DmQJwJqTgKTambOiwhRyg3uhoq8ZP0HeCIPi
	B+WqsdTXtYX0gjCUQv0GiSl7jUL+7AyOoYHVuuG5Q+zPHRoH8TaSc3n6IXjTu2omTvMrMuBSjFP
	B5wHWBT/uFiSl44+10AV2xQ9t2Hu/uNP+Rj+f+tT893y66PDypFvH069lbftJUGShQ8hS/DGzgY
	SOu1fY0vtpuVw596HKg0fgXKphXCilSZKvOTEiVSmUketEp7s0kluee1qltBEW5g2aXZ/noGMK7
	ENrJaC8th0uLIG74LQCroqSVfg2oIOGdXmfbyXNky2kwW90NK97FNnCkrxVkN+VmhdFfLeFa9VQ
	HmQ1qXa3f+5rTUdzxIzitLRO47/kmcP4f07w6lwKqC87HyNOs7z+2+1ndaJrHefXKObf2EhP4gh
	WzsqHjriKRKwtOx4c8rU6N/QSwKegHEe2r7NQvB70EOaYxjWWpjcV56I+YbQg3X0WwtMwm8o+uT
	5eZfNOR8c0YblmuUk8=
X-Received: by 2002:a05:6000:2c0e:b0:484:3328:1ad1 with SMTP id ffacd0b85a97d-48590805fabmr30378346f8f.6.1789040047066;
        Thu, 10 Sep 2026 04:34:07 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm49155813f8f.22.2026.09.10.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:34:06 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	michal.simek@amd.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: spi-zynqmp-gqspi: stop the controller on shutdown
Date: Thu, 10 Sep 2026 14:33:25 +0300
Message-Id: <20260910113325.717882-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_043409_645276_8C79612F 
X-CRM114-Status: GOOD (  23.66  )
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

Write 0 to GQSPI_EN_OFST, as zynqmp_qspi_remove() and
zynqmp_qspi_suspend() already do.  Skip it only when
pm_runtime_get_if_in_use() returns 0, i.e. runtime suspended: the clocks
are gated, so the registers are unreachable and the controller cannot be
mastering the bus.  A negative return is not the same thing - it is what
the CONFIG_PM=n stub always returns, and there probe() has enabled pclk
and refclk for good, so the controller is running and must be stopped.

Fixes: dfe11a11d523 ("spi: Add support for Zynq Ultrascale+ MPSoC GQSPI controller")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Note for stable: before commit 1c26372e5aa9 ("spi: spi-zynqmp-gqspi:
Update driver to use spi-mem framework") this driver stored the
spi_master in the platform drvdata rather than the zynqmp_qspi, so a
backport to those trees needs spi_master_get_devdata() in place of the
platform_get_drvdata() used here.

 drivers/spi/spi-zynqmp-gqspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 4d55090..24f680b 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1373,11 +1373,35 @@ static void zynqmp_qspi_remove(struct platform_device *pdev)
 	clk_disable_unprepare(xqspi->pclk);
 }
 
+static void zynqmp_qspi_shutdown(struct platform_device *pdev)
+{
+	struct zynqmp_qspi *xqspi = platform_get_drvdata(pdev);
+	int ret;
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


