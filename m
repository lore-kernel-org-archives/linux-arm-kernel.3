Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F2FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=; b=bAcpjpTbpkRHmjUfm1r8W56Yhc
	16Jlp5wqzxjhCxYKOs3LegCRpDHzENXesRz6Bw44LICEmAWh5SPbn46CgebAm+8THrgeasghZbUa8
	l59BCsprozoFsIFlHmd1e9zS0OhJFK9KYDTjRhou1kRdrNsonUCraGfiEb9EzauzBXiPQII1J7gS6
	SWVZRIJ3zdvtcm06NNoA8KRLs2c5n7KuOtOTiotzVotW6fVT0dZZciWQB+2c06Fa28Dr1FHC2BWNR
	yBa8wISVwOHgg9b982Vg3iCKV1j68RsrSYOrx+X/oLfHcbBN82+b6UhgyYpxX3T3ZY/9xh74PgTS1
	RHHQ1+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGu-0000000Gylu-2ASY;
	Wed, 08 Jul 2026 11:16:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGr-0000000GyiA-0eZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-476d8e647e9so395514f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509411; x=1784114211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=SQ4Q2T1nSTEW2UoqXwYD0IH0pj/S6LL8wbsHDi3SRAwO/NjpKhOknvwtvDdRJ5CxQX
         SYIgvw+0SkYSll6JdipudUtHWxHbcgEP6/O+M+taLbwosMmY8MMCLiiTghJ3OMY0NvtR
         w7ldkjO33wKQ0/1OWW4G0/s/R4aTUzaf3sEAnlVcfFQfWIkGYRl5EtHqgXOZ5Ef4XRQX
         e9aISiW6m4Oc1zNe+xWmnfvegkx7pHLqRDlXGWgpu40kJKcwl/Ej151NVRpokaXFG2aJ
         ei7ZyplGoa386C6Qr2dQyipFuLJkwt+HSJJGEkhVRbhD/KLZLd5gTs1zIgfv0XpMQqvH
         vqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509411; x=1784114211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=CMM5sXuC4Uvh9976QC4a+R8JKGQSZmB01l2TL5/3b/owIEvwHCu+LRcTQYpta//eHo
         yy9AtVvIGCMZEqe/22mCfYbHH1NyZzwx7bDNSc/bTlh1qyK2mlAbVLSK0BPFFx+K1nn4
         yxEaaDZ6+eb7/3PHFq6l6sUNSbq5cccIEWS3ecxEJbzbQgOHqXZ8C3J69VV6SC7WdhAq
         tr8GceU73UWQCwz/u1ZJ5YaCh94FlmVQcBa1ZItUbj+BX6xXI/7puLy5aYi9JwVtd7/L
         bssKjEy2ECz8xN+QEhHwMKsOwDMx4wetIzrDHskwp9tGhmIBgEJMHOyF2VZel2VLRiZH
         dyfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7UxsQRAz8H30BUw9VMyb4/DawrnX3XuwcSd9DtoA0I/bMJuTcfqopUo1hPfMkQE1N/hWnsHiAef3+3wwYlBE4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh5cVtPJuzI35J5optg4vZhV5UPZ8QAa1aRO1X2ThjTFvMcLk2
	NziHbZQN8++5U6UKT1rE3Q37qZvWGFxxcbsAq6Qehp95y7NSAF5ygpK5DJSsMR13vME=
X-Gm-Gg: AfdE7clP+GmB+Cq9NS2wGdBO3LOS/hIyQLfvAe82P1u0+JelNusj7RL1c9Zonh8J0pj
	aGvF55KjvwS1dtjnCHPeHMe5G83XdA2iJ0AbbLbuJv3jqUcRkDMuKrdlg2JTNpXcFpnfRhHmOPf
	HSbhsE8d7lx2ZmpwLrWLhKJ6zlMMDhnebyw7443O/Qzm7jT7N24RHPkVhOuQZggMUjrav7OMi7N
	bLVrAiUbIwCTADKDBbNn2hhioK7VfnQUUjHr3GockBjTeFOj0xILW5Qz86C1/ktMkLeDrwS6RSZ
	VRn3OkblfrT9CopxvwaXsh8TwULBDb7keFRxH0LT/0bcuQjrjtMphcaF1hWZokQZ9PoDzELW4Rz
	YGa8pk5PFUHr2tkHVCoK959wf6SsEIRZpAU6LadDUdjTqWSSsTt0Ss5onOtG/6/gRBlwEKPgVvE
	vfMU8mTnVEQFgnjchZeCSF9AbJrV2hRlvgxsUMvFW9vzhhcOw6wDs7CdCqSiEldmj2bqsWYKe0k
	y+D
X-Received: by 2002:a05:6000:4a11:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47df074e23fmr2309041f8f.1.1783509410912;
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm40326700f8f.29.2026.07.08.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Wed,  8 Jul 2026 13:15:16 +0200
Message-ID: <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFUyx0qnP2zKCNNfgNq59gFkbTpytA6eHk24 hmc6ZVxsBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xVAAKCRCPgPtYfRL+ TgqzB/9Bpu/S/yCAfq1ceJH388wa3hj9KYRwwsjLsRZ2wITDPFEIeAGSqN9eX6tfaS/ZeC1rBru RN0YVsdLzykyYbvWGsTFBRNnRWUKRWYeON725oyq3tPzWBgxPb/4M6ab/HM1HCsakAKN2Po/BL1 EMFbC0kr3R5f3F1QSj3tmoN8DesptbklIOW+WuwoGWR/mvnrmOPF1Lun+nBv8x6G3bsEJKflEeh 4h22Y9y8Gh7z5MG/cHlH1eIc2KfK0lwOm9Oyt0iNoQMjKt0AM/hMgHQiRNm0xlMgQGXmNg94cfD VQT2NL17J5x2Q1u4m/nI9EULzqea6htUHzmA0miZsGYP/p00
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041653_220975_AABC4758 
X-CRM114-Status: GOOD (  15.48  )
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

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb


