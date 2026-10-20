Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C672606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pvbMsKvN;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XQIhNTnN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=; b=pvbMsKvNjRyuN1CMTNHCAFaGMp
	iZICbIKqJUkVBI52XzwWsEt1bJwweoYg5PXBHm5LJHy5WJyXQ5Wn9XkHFNGPEArbXP/tyXqMhBdb+
	LALyXWfKDtumxwC2HmJoHqDHjsWpbYZhVR39xcWyyg3igfJSEq9VsVC1AIt+RO/jlo0WxEywOBADb
	IsOo1WWE3mZwhjyI71m54x508To5+Cr4ANj1z+hoOKGamVqPkOFj0Uva0AK0Yi1T4WIdd05+XcKOV
	zvU7mFaecP4+NVOKHJ6rmAHvGXghIp6hw3V2ie3q+cWV+OtIxlDD3MHmlS5HMJUv7TNWRVelRNeYL
	6xUXWu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAVS-00000009sm8-0HvP;
	Tue, 20 Oct 2026 14:07:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAVP-00000009slM-28Mh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:07:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a07b5f2795so125749b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505274; x=1793110074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=;
        b=XQIhNTnNRBDcXvIqlhB3R3etE8e/NqHmWEF2zOq6ZK1nVHn1dElxyCKNHZBjtJ3tk7
         P60RrMyIc1/bD2hP1hWALmenSG2Arx5T0vaR6rZavdmkosIoFZ27P4XuuqCeERwxozZZ
         EZZ0AC96yhx3fdX1qm+w/w/hfamve7bYhiYJDLjay7PqmmrlXCbXyqN18+Aht2bJ/1PY
         A/cHCUkgb487dCwTufKYJIEu2pV662j5Fr9segT4z81clkf7u9a/Yfn2erl3p+O1rlrt
         Jv7JtnjXESbOk84mD8LeaMTvl6MI/M78REclzlYfdtA+Kx0JLfaO5V6sXTec7YQXdN2j
         P+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505274; x=1793110074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHU3kr6H4ebRnMajlQ45rUZRzGT3LcsJKitPjmSl92U=;
        b=q+6kL64LO/CLDBkY10rIA1pnEQRGXpn5Ohdjom6eWKw9jOrW6DdTGXNvY9t/+e/5V5
         prhfrJQ8SldpE6J5Nq+vSVypmh8QcBF1DisAIXQsQawqdIyabkao4GZn2xkwvY+0AGBn
         pnOIcJ4zjInkhCaUyN6dcE9/EwI1f5cxeYmaz6kxMpKXgyRUm3G3TzhZ2pSeDnShV3B3
         KDZFIXv3kJBL1hyjxP8oLv+tc/KBqpuSMXj9PPgKPhDAlyUqcVKszW134/aAWlx73T+b
         lq89ijrTT/BzDdNimAsbI/Fk88dWVB2CT0q6tMxy3NthdB5rlrj6bE9bVDXIaRT22R7q
         8MbA==
X-Forwarded-Encrypted: i=1; AKwUvByUXb29stqF6NZfnEW7GxZsh/0dTwjfQxami3mMfRhNUiH4OCOyOqaY0IO4xvbxeczm1XUUghbkBkpJnogKOXZ5@lists.infradead.org
X-Gm-Message-State: AFq9FYLPjd3NlacPNB3ssIQPNIFr2e9jia7tKTSPLTz8S4zPE1X8WlO3
	0+3IX7VZF8Yhh3l4fnSBMWk3BSjB2pMTWWkcwtpC+vmxoKe1J40y69gh
X-Gm-Gg: AYBFou2pZftMyC02oURu5/RhVoolmYTDV8bK81qG4AwR+AsdC8o8XZulHqGuywDfqsa
	OFXs2etRG/kKpcn8uxhqF0eFmFzS6gsIhGMAtXAASDJ9/S0fK8ZhMzvaEAxxeDEUSRwt3Yo2t2H
	2JgMgoglge+e7Y0sh1iwHOdycZDuPeoKkVLAMuH8BO7yfXHk87Kz2ozW/X9FRuVAEQVHAI9Ic4m
	H0ZAjYpJ+SULZotKJHyaFGrQP87945YUr+SFueAvCd2mQ7rQrFCPBfEBGMMvJ2iwm4dYXXbLSpf
	f18TmXhSn2+jU8J2vLWfB6QtGpMlmb5J+qsvIDZIINg1WRbmdEWkrhZMGv+U9e0jR90M6n/Vud2
	rti+cZKo255G1yQtXMgkNDt6SIK8gtJoCPqkKTNec37T2tTGZV7QR+PDEZvITYj55R4T3u5ad/L
	XWdj5XPv0Y5LSSTOJk7SgNfwOXAIPUPpCPS5kkYKlK0R8U3gYx5mrWCwkHQDkRkuTWVPfxkJiTm
	q3Kw15rD8/ianrkfA==
X-Received: by 2002:a17:902:e84f:b0:2e9:4175:306b with SMTP id d9443c01a7336-2e9a6832e3cmr148561805ad.1.1792505273849;
        Tue, 20 Oct 2026 07:07:53 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:4372:4888:28d9:3e09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145b7805sm13430075ad.8.2026.10.20.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:07:53 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guanxin Li <bruceli20040604@gmail.com>
Subject: [PATCH] mmc: atmel-mci: fix PDC bounce buffer use-after-free
Date: Tue, 20 Oct 2026 22:07:43 +0800
Message-ID: <20261020140743.2765011-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_070755_568138_CC214E10 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

atmci_remove() currently frees the coherent PDC buffer immediately
after pm_runtime_get_sync(), before the controller and its interrupt
handler have been quiesced.

A pending RXBUFF or TXBUFE interrupt can enter atmci_interrupt() after
the buffer has been freed. For a completed receive transfer,
atmci_pdc_complete() accesses host->buffer while copying received data
to the request scatterlist. When data remains, the interrupt handler
can instead call atmci_pdc_set_both_buf(), which may program
host->buf_phys_addr back into the PDC and make the PDC access a freed
coherent allocation.

The buffer must also remain valid while atmci_cleanup_slot() calls
mmc_remove_host(), since an in-flight request may complete during host
removal and take the same interrupt paths.

Move dma_free_coherent() after the controller is disabled, the timer
and IRQ handler are synchronized, and bh_work is canceled. Keep the
remaining teardown order unchanged so that in-flight requests can
finish before the buffer is released.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/mmc/host/atmel-mci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 8f4df250a77a..7f1a5864da96 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -2592,9 +2592,6 @@ static void atmci_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(dev);
 
-	if (host->buffer)
-		dma_free_coherent(dev, host->buf_size, host->buffer, host->buf_phys_addr);
-
 	for (i = 0; i < ATMCI_MAX_NR_SLOTS; i++) {
 		if (host->slot[i])
 			atmci_cleanup_slot(host->slot[i], i);
@@ -2612,6 +2609,9 @@ static void atmci_remove(struct platform_device *pdev)
 
 	cancel_work_sync(&host->bh_work);
 
+	if (host->buffer)
+		dma_free_coherent(dev, host->buf_size, host->buffer, host->buf_phys_addr);
+
 	clk_disable_unprepare(host->mck);
 
 	pm_runtime_disable(dev);
-- 
2.43.0


