Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2648DCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=; b=3OKUffBaJKpcsxWjD78P3zDpK1
	Ec1B23GigFpG3XJsVoliL3C5izvieFD/rQCIJVkXSVd2kl/KerB4yJ1zp7toGNXZuZ1z0ftDJg/u0
	mc4ilI4Q8nZ2QtS67ldy2dStn4DbWwBlG5A06xILP0fpeDdaQX9Xz42LTI7FmPXxkb7E7xOa52rGg
	2uXyM58t51Va/hIt8URS6vIEnPNJpxBm8IcQ6aE82C3HiztfuCXuG1MXoDnroMQdd6yPwedghEQsm
	0WmUfJBNBD/teQIcZdhK3H4z0OTR/ixT//U3KcH52iXJSutjwDLxg/FeXEtZP9BkAB36o0t4V3JKo
	aOZAXlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2C-0000000GjZX-3GKB;
	Wed, 17 Jun 2026 06:46:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk28-0000000GjWz-478S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:45:58 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso2664035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678756; x=1782283556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=b2s05HOinOFEUELEsbMGUm/7mocwB2N64LyJI1fpEsKfdWaQQ3b5O1Y50qH91E4tws
         Kbsk3q7W8m6SJVeeRShq7dUYTdwEiPBLKZnzSLkrYNgzlIa0h4iAVAc6qYikxOM25irp
         fWr59Qgom6u5wJJwUceLkCWel9ZpO73BHUBTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678756; x=1782283556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yx01qzHYL7zapV7JT7OmgAtxcHhwEqISMkYtU1aw3M4=;
        b=FuLJHUM+kFuk3IHy4eaUA7jp/OzHMm2WY3LUNErVjq0PTOY8inMuoAJ7ZCuz/tV3zL
         B2PD+Hkl1ebclYHqB2cwo6VLpASKy4VH8KNIekH6A8p1RvF6MLCWg5/KTcPDCkO/AlYv
         r/tfirNyAr8fJjoLRcXAPLlqTXB+QFrPpO5BX224U6as7i9ywScUYvStI+oUmIHJM8V2
         9KWw1JGNdR1gEqxZPJdKUT0jjsfTceHO88Of4H5uKgt07q8KgLzZRWNDi3GPzoyHLXkj
         HxqTnZyUCdb5F1b1w3CBFjc02U6whQ+Pm9kjtfbtQJ2jUnmK+IrlupykfvDtt9chJ4S0
         oi9g==
X-Forwarded-Encrypted: i=1; AFNElJ/ceW6/Tv2QZfRLg2gkIaL1U3He1uFoA2RnCYyEUf3LuBoNEA8Eh9ooYtLjCOc6sO+ASbrSdDTY4j1MSlryGRYq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmituo6V78tyScHIg06ve1nIVV9chLqgt8UWmwnGog2+1rhUKB
	wmH+P2crCMLuFAaK2mDAG4dEXpKg7eoIP/JyVpQlrNBL1Wk0I3/CCNn4/V2MxzFbUw==
X-Gm-Gg: AfdE7clnZc9k+lazNgYzY7BuAbC7qSmzRc2vW0HhtCYwDZjETSeQ9rjTJ+3qXNuTJK9
	OJwCVCvQLOphTN0fjfCxb9ZP8Ka/Taeuw63uIOq1HppfbRNzPvr0gnbDH43Tb87bXz6DI7XMrV9
	oCQNaoO2PK9FfFuOf7jCAcGoS1l5KVujC8iN7Xd9RwjE9HsvyfEnsjRJjuADWpnFJyABMzVbHGX
	9Nre2oSmAQUt20cyn9IMlOi9ynjSR6BH2V2fo6LTocmWXuQA8cfi9YgAzPbAFyhiZF+gZ89mDHj
	VpRojxoLSNs5NTBPbLYzPgJmLz8dlWIyoNw+c5hwVuvZj1TXClvyWaC5hpo2oteJKdXiNlCIvpA
	DV53l6kyOZJw80v8XxQJxmN/wBk1WCXQdKvYaWLaL+T6FocQ7BEVN/fMPWKPWrPRLuVH2rlLuA2
	OrShb+RUN4Eg+wkqpfCcHQVi2vp02WfrJM0UAE9XPfxWi0A9C1t66Cwx36sgI+GWhI5Ix8ePTzB
	TA=
X-Received: by 2002:a17:903:32d1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c6bc0c8905mr27041175ad.12.1781678756057;
        Tue, 16 Jun 2026 23:45:56 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:55 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
Date: Wed, 17 Jun 2026 15:45:31 +0900
Message-ID: <20260617064543.574704-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260617064543.574704-1-senozhatsky@chromium.org>
References: <20260617064543.574704-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234557_014626_E0DAC5D7 
X-CRM114-Status: GOOD (  11.55  )
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

btmtksdio_txrx_work() loop termination condition checks for
int_status being non-zero, however, this evaluates to true
even when sdio_readl() encounters BUS I/O error (in which
case int_status is 0xffffffff).  Break out of the loop if
sdio_readl() errors out.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..d8c8d2857527 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -574,7 +574,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
-		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, NULL);
+		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, &err);
+		if (err < 0 || int_status == 0xffffffff)
+			break;
 
 		/* Ack an interrupt as soon as possible before any operation on
 		 * hardware.
-- 
2.54.0.1136.gdb2ca164c4-goog


