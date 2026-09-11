Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257D7C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BChxo31Ip5SB1VJHGoub4TIPtDJvGI/MxbOnDeYS06A=; b=yK1vsKkHSIBb+7yb6MI2s9rRtA
	ZFR0H9gknlUmUqnNBfGA2NVTIX/KnDWkuf+YAgW1Ve/Ujho0t1r6vpLeSZnnocbenfcfFIiIwfg6I
	+DwUl8LYhrLtm2nJHoj7ikjklNnuoiBquAfp625tqP3Ut+py4n3BiS5HKsQDbxsAb2hka9ZeD5Fa9
	F+mN1VLTm0XQrkFKF8FDRpHt0JLIeJA7aDjY4QKflIAKVqG4S2jDGLrzNAjSGKu9k9hKbkA7BlBY0
	MBquRwtGKJrSVuW7Ggd9KVwtXQDzq0H4ZI+g2Hcoac8SsFVneRB0BnIHg88lf4iRxrubOPKPM+ahk
	45tCuB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x551z-0000000HKvH-45tl;
	Fri, 11 Sep 2026 17:27:19 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x551w-0000000HKu6-3pcC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:27:18 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-783047c8464so768011137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789147635; x=1789752435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BChxo31Ip5SB1VJHGoub4TIPtDJvGI/MxbOnDeYS06A=;
        b=PqnCvRtrXKTFq5Ef2aFDY/L86pN6elNEqN1lpbY+Y7yvV0distSk7wngMxMAIdYYK4
         OQYVNiIjF1iemaDVrkcztWU5oOMD3nlEe1MVm7wPh7qRsW9DNJnssohzJ+Osepp6XM2Q
         UbPfjdr+UP6XyhylH46Uy2+QEhZC4dJQzN/8vz2ezModhxJZGgzrj18Jzh3pGk9y72tG
         fgGrXz2i8lsHMOujcIKAL5F5UCot3g1bNNm6QvQz+XnnjvXa8pFSCe9ziKrwkkFMriWF
         7kqioY3kao//xdSRpEskH2EDj+RXu+qF8jw4Y7E88f6uDGoRRuawODVxHyi/R65fwV1D
         dmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147635; x=1789752435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BChxo31Ip5SB1VJHGoub4TIPtDJvGI/MxbOnDeYS06A=;
        b=Gi/IAJGQ3GfuHvJm3sGEF6rW+HsEgnQhO/PPfiCvpy0E82FfJ2EgziBvzcbGiG4ioV
         N7x1T54sq1C0vjACQ1hKcoP90KODJgP+wbbwY19UXMbgaZ/sve7qXEfEJYwcf1c/FLgj
         g2Afv/TH8Jiy53X3gJu6IbhfycgftSETpMNSnBkRUan4YSGXRB8OniSElrAgx2lhPHsS
         MtzOD1fSDPVYub/kbbOllLk4nz+/5hh0lWmMimVapCaV64zkUjOmDiwVN3Hyn0gi+9pn
         5SOWib4tRRWbmTQO5DkZTz+d41mcI3ymkZoVVyV84MGvQutazma4Wl6VBOP9B4Ey7i59
         v80g==
X-Forwarded-Encrypted: i=1; AKwUvBzG7A7SCz2Ccdr/8Nbl/tSHGLVG34dgMJPXVS9hObIJ4coapCSYyK3rBpQ5NcsGYasgA3Z22JTAhxFoKfF+5vdj@lists.infradead.org
X-Gm-Message-State: AFuF++k1tu6gfIsSKrppek6n8K5dU8uHp33zNyOGHBxBj/czxd5Uhy3y
	CSxAID1PvqC8e+e6kogHJAU4C674A4bItG2XI76/GVwl6A28QwK5Fz4=
X-Gm-Gg: AYBFou0I0SNjVoxkwalnqfB78pVNO+5CVHJZPBcThiAYgE1dXvbkAm5Qq6Szc9HosoS
	DW03hI1nApRB8UDf8PrewmgjHLHNsSRjCH1cpkIakNm9kw0Nkr2etek7qVRlsVuEIZAGLGxgNvD
	+7GR28ufYAAUvE7twS6fYvCPXtN3+MjIGOX3ykNyqe9yodAXp9AsH/zKnbKOmp8A0PBhwBGKuiB
	Ds71opEug8gSEZHOxBb9R/l1JvcpGmiTbEiqlUe2fBB85IqIhT340tuyKZr0eeTUY3yr5W8ljYM
	u09KflvSZEa43DUu1fcUH3EtQbg/VH95nWPZY9Acg2Qp25U/pIjh0sjC0HqLsSPxyU6MkbNY2OS
	DzFa0x1wvYrfW+5UKdvJQV5+mdqULBODzC0N7CtAIdfieqq81raI/fU3KUs840RGl+RrRAhxuph
	xaiH7chnEQGWGqQmyfNh3W65C85qW3vrLqz/Vw6sRY8iMi94U02tFlbGZhuVXr08cxFc3k1mCmb
	iFGq4x3AWvhvlBKxtgb22+r3zVJblRPBLWIYI3PCog9atb5DUjWNZ/3yyi6QYkXPgnfFdM/zRx1
	nI0wRXuQvl8xImvOO32k3sw+N+hR7mndFw==
X-Received: by 2002:a67:cd84:0:b0:791:8f69:b7f3 with SMTP id ada2fe7eead31-792a4fc8bd1mr5864944137.5.1789147635238;
        Fri, 11 Sep 2026 10:27:15 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f478bf1sm25569566d6.25.2026.09.11.10.27.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 10:27:14 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Date: Fri, 11 Sep 2026 13:27:01 -0400
Message-ID: <20260911172701.58177-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_102716_963702_D32DF9E5 
X-CRM114-Status: GOOD (  12.92  )
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

Skip the DMA cleanup on registration failure when DMA is disabled, and
guard the buffer cleanup in remove with use_dma. Keep the existing
cleanup for allocation and mapping failures on the DMA path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee795e82e101 ("spi: rockchip-sfc: Fix DMA-API usage")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/spi/spi-rockchip-sfc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60beca33358dc6af09017e88771d017..21bd2e52d3989e3b371cf5c9ec8e4a22e22f17ed 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -719,6 +719,8 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	return 0;
 err_register:
+	if (!sfc->use_dma)
+		goto err_dma;
 	dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
 			 DMA_BIDIRECTIONAL);
 err_dma_map:
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

