Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2651C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=; b=qzARrmkLFTEfJVH8xQScW4mHOZ
	wGosGA9DgJ+G0CKsqFSj/MgrXQSKgnD/WchwYl+I2AHJFJ6wPtnK90pS7gk4LAu3bUe6isZq5nwIJ
	t+0NaTL/iR0aikJ3dchyNRMW/pVPXSyaPPEOY33N2qBxj6ECabjaH/4C4F5nHPUgRiA30bFCwFDfc
	wDyesaI0fI45tgtG2LhahnRb+uInDyBo7LSKF/tl30eySKgpCWclxhJ+mN9OzSRN7sEGL5SfD6ECd
	RjUnzCSLaotptHiDWVxLFDI2GPdgVWcSksWqC+7CIJTLEDrPogCLwvhpU+8nSWz/jQdBWWkoE0zyJ
	zbtOO5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7r-00000003rmB-10gI;
	Mon, 27 Jul 2026 20:40:39 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS7k-00000003rhI-3Gc8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:34 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84864086bfeso3048548b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184832; x=1785789632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=SnSezlxGU8Mm7u7mm0wO8+6T4Bg0VQh3BL+aFxXoqKWbUpk7Nl1xC3ZhX7RJCmvo3V
         FyBJr7zg3apcP0rNx7/kRU+3s6Y0QmX2nVUdaC3kdhdlKXwhx2Et1NB4GMUKsU/fgfjN
         xFqXJQ//sjUElgNFr4wExijzHfDt4GBqV0Ybrb1JMAb+d00FPPhX//Tg88tzl8Jg/vH7
         rHBeVlNKxPwrhA/oEWVR3cub2izMUrLyow4MhpDC2mwd2u2aTZkkFfXdXjW5FSGXOJfI
         XbFCCjOExHWGW7Uftas/ayRlIT/lc1KxTD3OT1KFDiBhlwLmB5sjOqthq4r6BqSG2pcW
         ppEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184832; x=1785789632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=S/LQA5JCd+0+B3SWAximQKbTWz/M7i3wECElOOyjKVIcoCT2HuSjUBW4ffLL7kJy0V
         3MdCC03NCfU/97iBSTOVegfHP/iqpSjZoEolLtcoksm24BbafDMR18NDPn6QfzV5N7O5
         cGQHgCvRutzqO36eJ4/AwsH7pnXBk1bTGS9UAaEv5TJmQcYXPDsidP6W+cXGnF+rwlaK
         ijW8ftY1S8iWy7pu+JACn74HufeJIVX5c881OMgHz/PcRft1CqTz6ur8AZFNUihzT15W
         AiUvjlDp9rapVtm2JKEvEbKosDdIL9GevAYXMdwxdWGg6Vbakii9pktbBQwDVUrZ32vb
         Tpcw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4ObDJ76AKa5CdgeaHZJA+7yhsnktWJanBxi2VjAXmWgeiJdLId75+0NnDn2mOaMMt+t5yy8l/36XoVK7w/D4R@lists.infradead.org
X-Gm-Message-State: AOJu0YxtlGckKksQj2LF24ddPJIAA+f575EeN39ZwveQSNuYUgEU6Wf0
	i5fOL8V/0eW7Gi/xzRzXGmLK9tAehcEMvWIj0othCaKX9CXp13kkT4un
X-Gm-Gg: AR+sD10gXgVAWbvDhNMhReYS/GLicNJpa+kcOZyUcSevA5n+XagjaT1aCHHoBHmwobl
	uRVIzTBffznb5XYLCFoTOe4Q07VEk77/bF9g4WbPNLMC0eMra+LAa/LlDlCvQsJ3VLftvDNvrHS
	x6lBmHkJSLqzTw/McqFomX0M1UGU5B2Ap7p/Z1yeeuQ2rhDFSlEONazNeikhH0wnVTDEI5n6ZDc
	XcJoZ+8CQAJmPh7f2t2ZWHdUwhO6lIqK9pQUs3zj2ZT1PtcykCI0NmdkYPznc9rqSogUMeO/STN
	cNbt9AEC1ySdc+UgapuVZxrAe3zhTd8emsn5vsZf5eo6nu3XyFU2E8fMybHV1097xSCueLmRq+g
	+mHcoPtZpBBbWth8FDCkS8v6Hd3ENz+Kltjzc38iKbV5pLmh7AN6Bc5gkDIZ0y47gre83tlRzps
	i42ZID
X-Received: by 2002:a05:6a00:4ac8:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e8d0f92e2mr772302b3a.64.1785184831978;
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 46/64] dmaengine: imx-sdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:08 -0700
Message-ID: <10f4e15741836cf24f08cdaf935da3260dea0250.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134032_868363_9DDBE3D1 
X-CRM114-Status: GOOD (  13.85  )
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

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..46f66e5f9f30 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2399,11 +2399,11 @@ static void sdma_remove(struct platform_device *pdev)
 	int i;
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	/* Kill the tasklet */
+	/* Kill the channel BH */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];
 
-		tasklet_kill(&sdmac->vc.task);
+		dma_chan_kill_bh(&sdmac->vc.chan);
 		sdma_free_chan_resources(&sdmac->vc.chan);
 	}
 
-- 
2.43.0


