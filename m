Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E8CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zlxz3Bt/5n5+mM+hnvjVuEoeVfHELml3tumeQTe5OCA=; b=FGB//ksS55RXj1Yhx8j1M04+rZ
	gnEVGRTMq74cwbFEf+/ayzPrzyrFSNu9xUeav0hjPZGqyWSy0vd04GR9eEEF//be2H1rLH7N3voEE
	obIpTtE/9JKbD3YRjNvh+//KibFk7JFnLg+ikoqIYrngQumdF4/xTS9QlQkWf6kOvlqQafE9QmJsq
	LWr2L/wF+yvW73CE2GSQneIAUN7PH7AKgyZNQ3qZiUyWjw09ieBmxo0yUli63zQdZS2nh7xCBfLV8
	BUtFGrObBg22vjPY264/g7fBjrPdeEtznQYh6xOnBIwW5BuJarMZbrrGbqBDfI5tgKpmNfKND9DPW
	z29bUhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnVg-0000000H3GY-1g1k;
	Wed, 17 Jun 2026 10:28:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnVd-0000000H3GB-2eUG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:28:39 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45fe59255beso3146107f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781692116; x=1782296916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zlxz3Bt/5n5+mM+hnvjVuEoeVfHELml3tumeQTe5OCA=;
        b=NeXGNf1Nh0mXQAtgjbQ/WG/DOdpIHxwL4ptJl2YTYjRVcTMZNAqVZ8Quw6AO59OYgQ
         n7nrskcQ7ESXA7+oqBTbQAgEIBA0fpSV+hGsptK1GCqTne3XPPRzEKBMUtdQjSl463yD
         LYLGJawXFbAq/sqFvmUGSe3lnrEmVJayZbM/dT8jxxv1Ikf19yAvMlgEAnYwF7JDbGIL
         KdXHa3XZUwxW5mUbFAq3L4CWHu4ETPxRyiDPgP64H5XvacOVjI1QfDr8ErATjAMjz3l3
         4n2TKTu77iXn8uDEPvMN1K5UapLnITnZavtmktE1ItKiPy4CVKksNZWNooJy+ayFkX1X
         pBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692116; x=1782296916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlxz3Bt/5n5+mM+hnvjVuEoeVfHELml3tumeQTe5OCA=;
        b=XO6539LucFC97VnrQv2dwCZvcP5xt6HHksMUURTo73AoWiEISpTm+zSiIVYLQml2wu
         H4J5pPt4MmPOpHk1iYK+8MV1uF//a+4Szvw5yMM+hqvEoTXCDkMSZDEdW1NFOayodchK
         5okdzCfAhXGOQBuEdDYdvPL9Utq9v39fG7n5dStkZnFwjjH3btbvprYAWVHZYINHyPA1
         tXNVl2m+0QMIqqMy+DE8ZbBJOwkaS0PVNiFgswCQZKjn+gAYiy7XxHPlcAm4uHqIiZk6
         LhXz4fKkFCcrTWC7p+dTGo4mtTh87dLyiZUvW1Pf7Vxm8/H73/k9S+LK4ngawtYtEouL
         u7Fw==
X-Gm-Message-State: AOJu0Ywr0a2uvhGhDgzCBfdgqOjpxvmuIlIbnlG6iuLXyJoxg6z0c/k5
	cYjNiwA1eHRlSuxhjMmruX9615TFUJsWiAcr90NLqO1YNFCzPs88saaS1PEQEo9zxLg=
X-Gm-Gg: AfdE7clEOo/ohkYmz/3D8/DKfMnZSOX96Is4Rn6lZRw510+V/zV8bpaE0337tYPlF99
	YaRaow5qQhI9n2hjEBVTGJ0Yh0y5cKKh3DC+VO0l45cC+gvvZ6uXwi7H52HCOInwQa/lhZZgYGo
	PaqRbemwBKi1hBGbWMoiF3hAuwWtCIt3BLI8m4mvhZWGdXJEsvuUJcTZmu8c3qkTcl6nY3WEs4y
	g6ZLLfJ7yueY0huVuYIMZlutTp54cFHVDI6VD6bDtfHCDBY+DhTpFlvzLvyjQFf1Wz/R3gdf3XF
	nq531J2Ah3hw4w1zj8/LMuyOwKI6Sgnh2JSCPqulBmmUVbbU0cydEfKtRVEUP97qUUsY0SXAoTJ
	sDd7KyQLIEfJbuXrmFB8tEsbJhKfP6jFN5FJbvAoBUTHzA3+tvH2Ek2pMkEgSXrWQE/9f1iq4j+
	oHSc9CWvFP32pIqEvRMEmcskKslLiUFaahXjkfuOUIhxO7aEYRC37NVR0KNdROIbU33VUmwqz3L
	/cR
X-Received: by 2002:a05:6000:4007:b0:45e:ed10:8dff with SMTP id ffacd0b85a97d-462410d3c3dmr5581827f8f.24.1781692115610;
        Wed, 17 Jun 2026 03:28:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04bc2080ea3c93ea6d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bc20:80ea:3c93:ea6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4619b9b7750sm24616628f8f.6.2026.06.17.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:28:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] virt: arm-cca-guest: Drop unused assignment of platform_device_id driver data
Date: Wed, 17 Jun 2026 12:28:26 +0200
Message-ID: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=m6kOgAsyorGWKjGknyKm9JIY19RH5b+1zNzb/E8dCKo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqMnbLhs3K5QX4Whr0FdDDo1OwFCWSzcuYd10b/ BGeW2LFfVqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajJ2ywAKCRCPgPtYfRL+ ThFIB/0QlZecuODpHiRkKhIWysJG9Vv+9YLUfKpu4ybJ53oxEonx9Jz3yP7p4y+AgD+rxWSsUR1 jSARmg/za8+JvfhYyyognO3GLsa0Axs3DRoUlT2R1QdXC5vsFwynbPIkemIosnesEEvYQfHe90Y T+38FGcLbPCU+mnjH8V/GNmV+QTBP6J5DUPRnlXXdIzEz8+KS2kYwqLVxBhF3FEyBe4d14UDmI7 ZRTVgTwF9gPwr7u7XRuu6WYC7EnBdrqGGMob+jIHQPmhSZTU9ueqVBuVv+ePkghDKn48VsQmbU9 PPuDwfzmCIMrC2QxN3ZUPJm7zRsPo2RMZfyQIEg6pOAVr9+u
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_032837_686596_65F94FD5 
X-CRM114-Status: GOOD (  12.76  )
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

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

While touching this array use a named initializer for .name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 66d00b6ceb78..6155576a9711 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -223,7 +223,7 @@ module_exit(arm_cca_guest_exit);
 
 /* modalias, so userspace can autoload this module when RSI is available */
 static const struct platform_device_id arm_cca_match[] __maybe_unused = {
-	{ RSI_PDEV_NAME, 0},
+	{ .name = RSI_PDEV_NAME },
 	{ }
 };
 

base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
-- 
2.47.3


