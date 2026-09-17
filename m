Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMbyouNW/EVz0LVN7bS1sUKezudmEDE0W2YcHDpgEIY=; b=QHIOisSi0zOYnHh4ZWhMbgr14F
	MER2X9xBrs7tpX3jZFf7tydGhkQJNQW7Cw3xzqYGJo/kRI4RhudTBQQwlaR2YQwCdFsSFjobWRPIj
	Mm28nFxjr9/fTNcUxf8rNtJEdsH2GSU6hUearhgiMGOSL9uSp9Rntxk0GnS2tTbWzlNzDGXYceEh6
	mgjRgJFNfUA+iQh3KzQEBRZ6S7YTbOJckTVxNogRPoVuVIJx88pfU/sfENvRsq7MYCUHuDC3LyluR
	Y81ovGeQMqQC3awaH35yXoKLYy+jTuw2WiBc3rovHKOZwk8pNOzjdbTIS6fKXLal+EUFBz/OBxbsw
	ijOkrXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IIm-0000000CODZ-1E7l;
	Thu, 17 Sep 2026 20:01:48 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IIg-0000000COAv-05im
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:01:43 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so590846d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675301; x=1790280101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMbyouNW/EVz0LVN7bS1sUKezudmEDE0W2YcHDpgEIY=;
        b=h+9T3tPQdaywpPP5iVhr0K5Z334IepMr/J1u8VboC91gEGa+9aEfZAqz087OScxhGO
         aI2vAS5lZ5XEjCP5JcfcEg5MH4+twOIZ/x96olWr8X3keoI3NxVLNe80QdS/2LJdsMxH
         lLBtn/st4jGkXYqfOktW5XWFmle+rjFnqEKo1552d8D8VEX0LuBRHd5J5tcpfp7Ru35E
         JjKGzE0YHPo3rE7XUKGO13/f9bgQ45zNA+Y6IcVlA6PPFgyuKHkfI1MFbkf7G1PO2Rmm
         XLRpJzPK83HBvVwhvmJlGJ3y7umYK5GEYwxwHrMIFV7pMkjkgD+kZ/blzudf8DKHFarm
         YRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675301; x=1790280101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMbyouNW/EVz0LVN7bS1sUKezudmEDE0W2YcHDpgEIY=;
        b=UphjrffEh6juOeoRkW7vAavB66EWtgQukYK5klaFojG+6YQ9AVwJ+LGzTrlxd/bsiI
         DBa4RhKgGXti9npv2gvkPpCN1U2TwIznU4CQYsR2mzhc/yS8JNx5RaIJDZ9DnciLkTWi
         GzlLOpNh09RxywWPSaxYAf3c6o3ivkhRG9R3nX/S1Sqeut4MGwbe7Xq4ZriR+5XJEV5S
         bCOZALAAMd9bMyrA0v+/hXaU6lBVPCCIdFLQ6EdHBqeJlVaLcTpudJ2Ki8B82yQ6KLWB
         MStsH0HrH0CZpti4LkPCnbXm21a7CxW6aRNuEJ9XZPNlspVi28DfBwIhVSomw+BrhPVK
         y4mQ==
X-Forwarded-Encrypted: i=1; AKwUvBysVNEXsaQxFzzN7l0pROaWYKGBCrgONtEjUnhWedS/KqSCA5wZbbLVKC3C/c01AbKSCUIxCd80MMnnR2611oQL@lists.infradead.org
X-Gm-Message-State: AFuF++k2cWTxzck1EN2FjX0y+zjicntQe1I40gGdQhPKF+HDcnT4cNFG
	Ov3j08zkdI+5LhKVsIXe2Zp0YOeVkR1is815W4Qc+zenkgd4v9ySjY8/MNFFF0gc8Q==
X-Gm-Gg: AYBFou32VQgBTkyLWMHEOla8pLVnzQaW2vVZQT6gC/i50EIo92zQWXVMJE7xWktXqxl
	gQLq0xfj+sygBL0meZ8rEe2h+/incGPHt3K+vUXprRh2A5cf0BvROAO+/KYgO3Dv26Cex9N+gAB
	cYGti1o9G5zW+mqvKtl1pf8rrm96UkB35el7uFX1+nxpNtzt+Ar04gr+/uTMOJhgAfh7tLsUfXR
	IHI3d3PudaKmd62KSvhH2yn9zUU9+9Zys5W82IEa3crpEo52nyUlEegsy/GurkXiHd44nRThDj/
	8Nz1feq6u3ncCd4zc9umpoICVBdTG2e+ms0cObQnVOBDUicHBn/y+wKiejKdd2Y1L6Hqj365qMt
	dPjBxtUF4IZOJnsKxQRy+Fc78nrGYRtp/StNvAUhRKpSLYDfPDzfWvNL/C/u3Z2lxkVR+sPLqfO
	6MLQZYPaEKBK2gPgwmXx6sBR/O0gkz3dkC0FpJ3z1/HWMiOqVVCYYOi6mhGY41pIndaLIpuVQeD
	hlt7rCeDgZRVmIPbpdf1FYUkbqhUHuxxGtx12krdc9DtJCNAjfh70+9qwxLkmFHqE6QZtFo0npm
	M9b1PdNO4DpPR/ohbroBCT5BTA18Bfm7cos+
X-Received: by 2002:ad4:5eca:0:b0:910:39e7:dbb9 with SMTP id 6a1803df08f44-91254bd01aamr5451946d6.33.1789675300564;
        Thu, 17 Sep 2026 13:01:40 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c7a362sm5504776d6.18.2026.09.17.13.01.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 13:01:39 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] soc: fsl: dpio: Release the I/O object on IRQ registration failure
Date: Thu, 17 Sep 2026 16:01:38 -0400
Message-ID: <20260917200138.75755-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_130142_081131_050F0736 
X-CRM114-Status: UNSURE (   9.02  )
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

IRQ registration happens after dpaa2_io_create(), but its failure path
only releases the IRQ resources and the MC portal. The I/O object stays
allocated and published in the service list and per-CPU lookup table,
while devres unmaps its portal registers after probe fails.

Call dpaa2_io_down() on IRQ registration failure to remove the object
from those lookup structures and free it. Reorder the error labels so
that a failed dpaa2_io_create() still skips this cleanup.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: fe8fe7723a3a ("soc: fsl: dpio: register dpio irq handlers after dpio create")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -244,9 +244,10 @@
 
 	return 0;
 
+err_register_dpio_irq:
+	dpaa2_io_down(priv->io);
 err_dpaa2_io_create:
 	unregister_dpio_irq_handlers(dpio_dev);
-err_register_dpio_irq:
 	fsl_mc_free_irqs(dpio_dev);
 err_allocate_irqs:
 	dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
-- 
2.47.1

