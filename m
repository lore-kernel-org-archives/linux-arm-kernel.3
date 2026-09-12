Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251AFC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AaS2W86AtkX5bjhTKY8jGngBhIYNaOT+HF7QmT5cMk=; b=j8rh4OXYUUvKBgfyC5VgPOoG/T
	zj4/Tx6exrPysJ+d8+x37Ivs/XpcppkeKRFKrC2lBu/9hxAjpsQbwm9l2RIHnw1RMuU4ePQOyuqiv
	1m/Rdxf34/CQnAilAeCI90Iu/Ti7UQBC9zdFIrUaTIMs2w8q9x8K52ubRyYE8syFeKid3nMujy4GD
	ByN6Op/ds2Gi8RBnWGLVcZsCgh3u4d9MUYxBgGsnb8L0GLkkiM9eS2fcrWGGz4v8GkgYxdLdaqZLO
	zO2gRr3pf4kZPbJboPRN7yjm6mH4pKsn51isZLi0472/uZYtABZzcoV0GSHCq0QU6Nqbu9T4++l+d
	yIgEEO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SyN-000000015IM-3uzu;
	Sat, 12 Sep 2026 19:01:11 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SyJ-000000015Hd-0MNp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:01:10 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfcb5cb3so9532576d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239666; x=1789844466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AaS2W86AtkX5bjhTKY8jGngBhIYNaOT+HF7QmT5cMk=;
        b=klCSjIdDFzD803DH9w7a4mAYuJe3rCr4bACVWpcfBl3tiHl6k3k8mR2ITcDntbGy8E
         F6udQQe3p3JaRmRK3QTFBoTbupPCvhLtQRICWyzwifDiqa2afRRZs4ghR1i78zz60tEm
         2vBtkm9CLeavrLUMQKte9bEN8Ku9OX5hCcMPA86MesCuOpTUsHwQ4wf9orr0gCBnc3nd
         RLBFdpUhO1n7jpC6hnXnC3DR1LhIw4INfbmketMbnTp8VkSd0eNDAbwujgl22GdpXTST
         ASdO4dJWqZnnnftLVwDxaJPYzmdsgOgESBDxHXQfCjA7iquSsQ3g6q0D61V6uL5CR0j4
         Zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239666; x=1789844466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AaS2W86AtkX5bjhTKY8jGngBhIYNaOT+HF7QmT5cMk=;
        b=QPhXZqOOdU59sXUpnw6CZsec5qUVbPumCWK5Zw5ATPBH/xIifwJZ5IaXhQYORz9FUx
         CU4t6bKFAjPQhAX0w+nBQ6E9OuYCBElJDsNKOzbnD2EaY+IYSvCP/Sxczg6ODx8x0hD6
         HucbWEQ5yR6lga+OmheYhSksdxzADuSnI9Q/yR7yP2CnaKkQDzht4yObiUYJFMotzkfx
         NPIne34k3V+t63LcOijGsoePy32P7fWMM/+8LXti1Ry3Idb8wKUlU/8clEpj6slOsGbA
         egrrrLaX/JKbr94GQkxcLbXDkdq8o5pK/W6vRMUSM8fRc9jWXy+9ONfmpFv4GdxzKdKs
         M8sg==
X-Forwarded-Encrypted: i=1; AKwUvBww6lKTto0NqInQwpbO6M7m/FfphlocQAXgECcwG2+Atwbc+iMBp8xb2Lfxg5UqmlRf0utR1qpCR/rdPUvW86k6@lists.infradead.org
X-Gm-Message-State: AFuF++lMdSF7w4fKj4SkFH5cbj61INbWFpskFY6V4xBkOACRGEFIlWU1
	MoqtL+4OIF/JTuatOwLfEh7ojrWFw6cvIBPQjbTwDSpv7qSEBdFa574=
X-Gm-Gg: AYBFou057sK2diDxcRAmazzFc0lKLKMQOhuxJ/2BN2cgKNEw53LyNBzuhBEBOOctcWK
	k6pGI5MmoFb1x5yS3EhRTftQD/tUYtRLYOenJLvxzAYVpqYI/YliMDdSt9hHS3P2zfT3++/wrNy
	WPQBmjYVEg3x1aNPVkuHcjMu3W0MeDcg4yx4hmyahCa1DpK5KNfpLssmdubvbGIroRtlDdHr6PA
	gCeOvGbAx3eRatBt5PrVP+fnNLhhsXTrKnOzWNCRRymZfiIVsi/NtDgmWqaKsyI/aWxYdrU9oyr
	zQ7EFJHOQcqpUicIO/WEijL6VXeahlGBBlGsoo35NIU5uX8rf/k6aI0iL8kJ9zi35VlkxEJWMqq
	OyRR6JlWuq7oFZ7CYhFBang4SYIEtjrQ+OLwZT2Uzrc2A+Ba9SQi1gkQuXYj6sAoslNFFZ9Gz7H
	kn5VqHDAA5wqR7anLPLRQPrjwv2oLE8zTSy53eLMVJt7KYySbmr2xtS+9F0jdq0YgOou9RW+5oL
	K3V6ehg2I00heYWQM6epuMRrDy6qE88uHxAm5jhE68J8EVQ0TqfwO2vGG0pft96Kl+3sBPJVkDm
	mgGHz5vAy/o5P1FStRzhMFDehmFHKnQwmw==
X-Received: by 2002:a05:6214:3983:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9121d91c1famr77743116d6.15.1789239665588;
        Sat, 12 Sep 2026 12:01:05 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45f1fdsm52597396d6.16.2026.09.12.12.01.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:01:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Date: Sat, 12 Sep 2026 15:00:56 -0400
Message-ID: <20260912190056.42192-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
References: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_120109_404694_1038FA3B 
X-CRM114-Status: GOOD (  13.18  )
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

With rockchip,sfc-no-dma, probe skips allocating and mapping the transfer
buffer. However, controller registration failure and driver removal still
call dma_unmap_single() for that nonexistent mapping.

Guard the DMA mapping and buffer cleanup with use_dma. Keep the existing
cleanup for allocation and mapping failures on the DMA path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee795e82e101 ("spi: rockchip-sfc: Fix DMA-API usage")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Guard the cleanup calls directly instead of jumping between error labels,
  as suggested by Mark Brown.

 drivers/spi/spi-rockchip-sfc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60beca33358dc6af09017e88771d017..bc5537aee449e0c33c2d6ecf9d57205d432ec7b6 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -719,10 +719,12 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	return 0;
 err_register:
-	dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
-			 DMA_BIDIRECTIONAL);
+	if (sfc->use_dma)
+		dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
+				 DMA_BIDIRECTIONAL);
 err_dma_map:
-	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	if (sfc->use_dma)
+		free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
 err_dma:
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
@@ -743,9 +745,11 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 	struct spi_controller *host = sfc->host;
 
 	spi_unregister_controller(host);
-	dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
-			 DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	if (sfc->use_dma) {
+		dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
+				 DMA_BIDIRECTIONAL);
+		free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	}
 
 	clk_disable_unprepare(sfc->clk);
 	clk_disable_unprepare(sfc->hclk);
-- 
2.53.0

