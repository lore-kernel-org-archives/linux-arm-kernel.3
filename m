Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E374CCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=; b=PCGGTVW9E2OJwYMpWoBvEqMijE
	AlToa7B1hP3FE3Bg+uc81UM67QVxeoCaAKjAh6RLq3XCzipnZ/OLuN3a4uDWWJsTunCf1h1v/AabR
	D2eUILFSr+luVevAvtDLN+usefnepclDi/XT8mSfJhofeCF4coNhH2QG7t0E8MG8ebC/mfH3+zSRa
	i+iANpUnfJvOzCEQVbAWewbAmlZULiLdv44iOYAQY0NBAJFOOjpaaV1rnqU0fOi7cbxdb+oeNrXuF
	oBfsSpST/sgWtUpfVGISvMeDz+SNE9FBoiiOXyip0xDvlIf2roPakaAKjbm1Z40+kYSGuULPvnMIE
	5pbz9eMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CV-00000000YM3-0kEe;
	Thu, 18 Jun 2026 03:13:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CP-00000000YIn-42fV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 03:13:51 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8453a67659fso196869b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 20:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781752429; x=1782357229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=;
        b=coDzPmNJOApcnd3op5yd4D2FnhYNI80yKAuNe3CBVxjNG/i6eHtvWfnf/Hd79WKsrt
         ZapEcW0RbPsvzsQKxqghN3HfQmFS3qNlbj1OpNe9MZB9xCI96VCE1OhzfXwDDSiaFOnI
         YsWE3CEKiZoMQqvQkI2rMJ4uDYE7hMPPupvsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752429; x=1782357229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=;
        b=IYvNeYzvN2ykO88X2Vq3wJhbCFnKREOxy6jGtLGjs/u0MRU0G2uVCDP2QsZjjSYKaK
         Qsz5nmR7TQjarEVF1hXe/uxLJmFf4Q4NDN8jx83MKgKrjo4VGbZDbOhpEAzbqL1lBixY
         mlXa54216eIPcGP17efNLiAZVirdzdM/W+K33E1VuEgo3gMMC+VAVqQCyvRpfT3HRTJm
         TjdMirtWj8yuyscPCTXwh/a/TziTONkIHRl1BLt0JqJcfVLXFpr/dLlnhsyFCnhNRAcr
         WT9hqAbsZ63o6Ah/gbJPsWaj0/CWjOoKPSYMXxTrkwA6O7lgaqZlDx3Sv+gYds2g3sWa
         7dDA==
X-Forwarded-Encrypted: i=1; AFNElJ/105DVS/xNfNKFlmyQe18DYHZwero/fJrUbdLzR7l+hQuz2680dkslrBp/k7prUVm1smspMm7J90BKroYihkrl@lists.infradead.org
X-Gm-Message-State: AOJu0YzsWRy39IKDhJ7E5YvJLWmTqJvwkhkbWUcoC955Z8zBYpP16epp
	OYpGOWqHhqh6VQO8b5P6EnVklfjpwPRIbaM/9K4QEpiXoKwC7adeDCnlNfArgi6pog==
X-Gm-Gg: AfdE7cm3hHr982OjDLMxEJzM/mfP8D0qxl76YX6+OnfONu8ry2fkdXUJOMiJaR/0Hcw
	zCCiryUMQeHJwqt6Pt842UBaHUVKP94kfvFqwt3O3b/YzwYGX2ZgYSrtwFk/V2FucwBErvVmWr5
	sYP2R/bqWivevy/jGOIaMClrkdrfK9J7k0nDzhJnQ+tevZRTCHm0yDwoYYFZWON5KYicXkkUXBV
	aDsbYeXh9yiAub17QFZuh8bIjh0q9UpX7w0pGMatBTeF1j6lZEXIOOSaSCUoUDksJVFOTT6YqHO
	qwtBCD9Ql/kQRTD3SJxxzjS5/T+gZHcOOkbXRxxTDMJHo0kPwanMCvYkiXgj1I0FzH1ZHmqyNpk
	klcaqEQAy7hbcgyr+hXkUNo0k2bxUzPAYeCm1ML6QIavRzmxs3RBTapZN9n2EGqXkFZXl6KEvm3
	e+xQNGjTEnLqrz5EyE0A+MxSw0YU+wZvC7aZkydMmzRkyDP4Nvqkdhf119wTkkNt1g286q1y0+2
	y0=
X-Received: by 2002:a05:6a00:1896:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-8453b214f5emr1655665b3a.24.1781752429085;
        Wed, 17 Jun 2026 20:13:49 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b046911sm17548232b3a.53.2026.06.17.20.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:13:48 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
Date: Thu, 18 Jun 2026 12:13:21 +0900
Message-ID: <20260618031338.1011410-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
In-Reply-To: <20260618031338.1011410-1-senozhatsky@chromium.org>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201350_006469_77FE1A38 
X-CRM114-Status: GOOD (  11.47  )
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
2.54.0.1189.g8c84645362-goog


