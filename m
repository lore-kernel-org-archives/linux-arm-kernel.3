Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87165C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=; b=2y7TDGB+aYO9xO2e4quGPEeH9Z
	hJ+GKlpSwvHF7O/yXRdye50FD06zoRo5s2Oxyg6TGDMMQnOOWIa/24oylsPYjgbp/KFngaIAVUPRX
	Ne+Fsb3c0bE7I9GR/VG+9F6KyrrBX7AncCbxqDQp970AZJ5lMX/oIdQra8JsHz+pbqC8w8pw3tN9H
	1XmoCJ0vJaSD3WxwgFsIPhs5DZM0rqtFPsVLoTWOE67ml93Z9QMjKGnjfzjFkp7tKSwoQb/NaFmqO
	vpJPAX0rHWcuPyk9mpanw5VlXI9C+walZmGKx43x3B4qKdRHfbk7zncEeNOSDX7yxpDuJMvp69gk/
	UorH+N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6m-0000000351O-0ewq;
	Thu, 09 Jul 2026 17:00:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6i-000000034x2-0AEu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso70533f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616414; x=1784221214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=DTbokrYwyFB/c9am4LJ/3wLcJ+MmGs5AySgat2Ob2IUOjnxw20ak7OzPEDL/HLE3QV
         vaPZ2tb9/PaSARcOiVdGb5ujCyGGGAETN2pgpPp26LHYCkHnanjyHvo/5fxrkeOhJdUq
         v37h7YSlxMa+mBCyK2h3T+hngB2y7VcCBnU72JUDVGBOQcmOanEdrQvPyf06jUuv5G+S
         KWuKoRRjTvFLr7fpOPSEBy1zZneTKkP7taj2pHOk61xHoe1jm4J9oDMz8kGy34hYyoV1
         Ac2AvtueLuu4a8G8Cp6qqrDNirGGikuQY3PbkpYsEgF9gx/DRJcUYKFCCkOyRgXVmpRg
         Mgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616414; x=1784221214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=o/0FbqJrxsOmtJA27fWZBhG9mov8SPKL7yyin60jjn4AXc0v81JZxyJxBERiBGJncH
         hFi1ldJHFXjYy2XuVHG+8hVRj1mP1H9gsOi6r/g6W0lAdKlsTsq30/+UBPoQctIh8mi3
         jZEdxduPOdNZjhCrOP8ZYu1S7X1ya1oZ2VCKyLmlMe6GYpQZJ0Vkt+Gw93q72MP6iSON
         X6ZTfnDjwYWPmw1WyD5C06pzNHydmzUc0BWy74ZWzfNv/TOUIDJ3DjpnOwC/Mux0jKB1
         +Gh2FUEkpy8Pos+Z5jzOWK1d6uQp4ozWcIBvFc2oskLIXufTyj0IsJtcnh2ndrBhdMna
         5IyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh+XbpT/xFpB6mjpCXTuOZkh3sVTvEoE78lULT79w1J3su8iY4TFI4uktRS/tB84O0YMWHrYMeONWW/E25Wcol@lists.infradead.org
X-Gm-Message-State: AOJu0YwZlZnnzivtzDm34xvRDUdrQ4tkcZ94CX//6PHEm4ZXHU/v0nAA
	SRRxaomi2fdRs+DJoua7NMgDO57vZpZtTpsaB98oTAluFEE5IseYX9JnOU7aapSIFyA=
X-Gm-Gg: AfdE7cn/MNr4GOEfLBxbUF6qkASM3Z1tSRnE+f4C8bEf8kCinwFCL2RSeS7G7Olp5jr
	wOikmJKBrv1hpgJmxCyCBoo5xglcyqGiKJzsqqfcURNFSp1C+efzXu1s3FqwZQqr0xu6c6tTZnj
	Pkm2XsQR0LqUAoTljab3twycbgmO4xCz/ns6DjR80/X8wABRLoEgq7TIOA5Brs5jKGBeNNhluzq
	lT3GOrl+QuDUwQLi62w9ZJwBzi+7JGIp06FLo2l7e4+PrFQURmS3OoL+7zJcil4Fo6y3WaWq+zU
	/823YcK9gnz/qcoiygbkP5CD0E3fxvub4jYtnm718KfyWIf4DrBsHv3MljqIbt0vTEAPBa/Ag6K
	azPfqm7M4meb/HJXi9WVBLKV5MDWmIRJiDH28fgJ/jK54TydcFBptDURYyhKgkY5AKHhuXhgTwa
	pbkesVIWNBJSwZyc1bLrYLWu5+V1sqAjAD9wNBPJSCJlyS+l/jAWkU1zMHlY/fPMkmfD4JrU4B1
	t6TzJOs47jfypc=
X-Received: by 2002:a05:6000:250d:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47df076bed7mr8665982f8f.38.1783616414070;
        Thu, 09 Jul 2026 10:00:14 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm52656885f8f.8.2026.07.09.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:13 -0700 (PDT)
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
Subject: [PATCH v3 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Thu,  9 Jul 2026 18:58:28 +0200
Message-ID: <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NHV5ayzaHMTRxZ1vJcj2e0Qsq0ixb99y703 8QmdWEAqi6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TRwAKCRCPgPtYfRL+ TngzB/9bn2VMOHKirYtFbVdvBGptXo3gP9q/1WjUMgg4jlikAF1mRjg2ik2hDfikend7CJM91ve q70Q/wAGS47iHurBLAuL5F9ByDCPX5cWQGQ4kDEBvqebOSC3WBIx483iad/iTQpqONljRVR7PN5 /cZ50Aun/PhGW+qYbIMVb+bDaQSwfjkaplQw0OF5a8YU+wafd6KpidbAK/81W34gpJCoJw8lOoW sYNr6M2uqqwt2Z0ROgI4YbPy4dkgDod6o/lgn8xfxOUcKLmGejaeY/3cKKEweD5tsSdG6jEnCxp 7W4F1KeRPdtXTR64Zj0tvpKocYUOp2Vk/2RBeyy6ZbGr/H15
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100016_088643_7D4544BE 
X-CRM114-Status: GOOD (  14.76  )
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


