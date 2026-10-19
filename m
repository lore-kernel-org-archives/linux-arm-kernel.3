Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8331CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rjxEHDZhnxdkStUSnVdQe9iZZzJrl+XY6zteXqLUhxo=; b=j2uxOeawSe/M5BRM+E711Wlkib
	ipg2/6nLObDGfWYk7Fnx8NaqUgFtCabbTZCxzP49PpyyiEKiVleRZjRSyKo6rzAadI/k1Vmo2DBfl
	fDdaRkuMjrclJn6pT/kOPjhZHHjlPv6/i9CwtJ5VEbGyf6mV0Rqa8tLRsSDBRQdRJMXwpoLDBXZej
	mPvFNTRCaesvDaO1QZj7h+1kEfo9PUg7H6j14Vd+z/2LRdmSzeN9gE/ySOYYsmQELBbVaF9G02KJH
	Ua24hhMmDt7NCWhLactmioehkr+8rnulpjwsx46qNa445JW1Eq4ry7lwIOHThfWw44qYchndwrWem
	QlYPvcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoQc-00000007kPt-3l3G;
	Mon, 19 Oct 2026 14:33:30 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoQZ-00000007kPH-3ee1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:33:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cd15c885bdaso83952a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792420407; x=1793025207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjxEHDZhnxdkStUSnVdQe9iZZzJrl+XY6zteXqLUhxo=;
        b=P+38lyI/O2HnE3HLvwSFjtsdMqCrJVzkZCZ37G85gzzCHDZe1Sc9PZdEDqhFLSA3bb
         mlFWsZyn1bg8r/lkAQzTlsVDSC6KEc6ZticdKqFbnJv4lSs4jG9pMAXC+j8FyvhXIE34
         A2BEp6h3CSLLSjtUug7KXGsNIWDxyCd5td4nX+lswOeguB0iYTkB4M6evxBW6z1JH5/v
         AUDlSNTMcwAaFcCcbRHnJHh4FcT15nRMwEwpj45f/X2t3toxzqRkZAcxFIa8GRx5EnHN
         ZAjbWmELgbi7dl11kfDjUiLeApspSxVdZS6fpkKcwMdeYkhD/0SgefjdHQmUBzTnpdsd
         IkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420407; x=1793025207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rjxEHDZhnxdkStUSnVdQe9iZZzJrl+XY6zteXqLUhxo=;
        b=XGQEnZu1egCvsvGSFaWV0p6TJFNjhs/OUMacS5rucPvMlYUk8GMc7qNyCv45xcK4ai
         7Cr40UvnXMcGCLqhat8z/hsgv3uY3GVo08YAfFlXbTnavNyVtFdn/gwfTpIIjUm9odxd
         kHFEViA7JVDMiHP9Wa0zFbbnFa+UQJ6ncvSQKDZtfHfZ0bKKsIKM3SKoV08mx/WJ7Vew
         duQJl/I3LBDUneEWIU80C7xF8/85Rp8Yj/YSdp1/G9lX4c02thSXHcl0DlZbOlOGvXmv
         +v6Vau3gF2rxGHohbbQv+EX9ERoU49RKESfqAyQ1yLCm36dSeFpPdUay3J0Qq9V549ok
         7QUA==
X-Forwarded-Encrypted: i=1; AKwUvBwL5AkFT7JE2o0Ng7zabUGxyr2l35BEzlZaj8oBCiDqhO0AScG/+O1g2AWVlDZN4MyngbJzv/YbbvJ2R8rkAPIg@lists.infradead.org
X-Gm-Message-State: AFq9FYILD+lpNylGilScnaffBGeIaGiS9CXnChC7vv9s8ovMmOkrUGjm
	LNeq0goehh6Dci+hMHBLhHesBDo4QkFITXSzDekzwqILtN49nKUDakCx
X-Gm-Gg: AYBFou1qXkGvX/erFXtOWes9nhywE+s95ssa2T3OJg4OXxKZ5pW54ngWf35uLkeqmS2
	An87eGaC3MTnlGRq7Q6CZUeKAJlQvQqjITVkpynyedbLLDC9Zj85VHlHnXGEnMFh/AxVZypUcOP
	PuH3JDT53XvsWIurdp8rweYXCGt1787BIcuV+X/eHEZBWiB1pB4cFctxmtX/wvoGN9rMsCwjlKZ
	LwAXo3zQ5VZE2dARDZvpSDfUVKhHVIUyz7FiTsjo+oe9NiLH0rtJoGkjJIijGqMLFfmAUTL3n8z
	WXd7kZ6Zlx/iNOppB+pfjaoNoHJ0nGVlWrVBiH0Q/twBgpLUwp+5uylNVIlDY8bZTCY4bewdG8d
	Fkka2lJ/5M21ZlOWqmduBoqi3LHUoQnO0T76ZmVlyrxsqL3cttcEmIEeDmqeLIgnLoQW43JNXBm
	P2qZM9ozQ5EyUa9qb/Vu3qJ7ihzjvOwuEr3qxUjoWbpM1AoRp3BdCMxQsE9vVuhX4J3h2Z5N9r7
	hfbnGI=
X-Received: by 2002:a05:6a00:4807:b0:89d:88bc:d9f5 with SMTP id d2e1a72fcca58-8a04ba25e3amr6477601b3a.3.1792420406628;
        Mon, 19 Oct 2026 07:33:26 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:db98:829a:1281:5d10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a06a6407e0sm1249239b3a.5.2026.10.19.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:33:26 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Guanxin Li <bruceli20040604@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: wmt-sdmmc: release DMA descriptors after stopping the host
Date: Mon, 19 Oct 2026 22:33:17 +0800
Message-ID: <20261019143317.2222236-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_073327_914277_BC13DD9B 
X-CRM114-Status: GOOD (  13.14  )
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

wmt_mci_remove() currently frees the DMA descriptor buffer before
calling mmc_remove_host() and freeing the controller IRQs. The
controller may still be using the descriptors, and an interrupt
handler may still access them during this window.

Stop the MMC host and free both IRQs before releasing the DMA
buffer to prevent DMA or interrupt accesses to the freed memory
during device removal.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
Changes in v2:
- Wrapped commit message lines to comply with the 72-column limit.
- Moved the DMA buffer comment next to dma_free_coherent().

 drivers/mmc/host/wmt-sdmmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 489daee4f4fc..55675aa8d08a 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -895,15 +895,15 @@ static void wmt_mci_remove(struct platform_device *pdev)
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS0);
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
 
-	/* release the dma buffers */
-	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
-			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
-
 	mmc_remove_host(mmc);
 
 	free_irq(priv->irq_regular, priv);
 	free_irq(priv->irq_dma, priv);
 
+	/* release the dma buffers */
+	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
+			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
+
 	iounmap(priv->sdmmc_base);
 
 	clk_disable_unprepare(priv->clk_sdmmc);
-- 
2.43.0


