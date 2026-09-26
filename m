Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6608C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQIwLtwiv2GNar8YmdrUtxZP0jcj02NoHt6505OGaXA=; b=dFQfvl7KIsxivCr4Jw5T90/hqk
	zqXVXc/K171LF52ae6DwK4mP3H63z7ScE0EQtdHtb97qJHzCz3H4JcfVUvkh8tDy8NmSgQol1jSt3
	I+R8s+3rzdfkpbPWfOGpvLW7f9xhcNxMv5LFZRKko9DwTTvfxA460N/LrZO/1pkIIqRzrSR0Dg8Z7
	9XQOYIrvspjMVvuQ9ban2deZYizDWm/0SXs0bOdZMEOYDNsicNlRPyKwABBfmurDamdshG5PDBjSa
	XJBDTmHTo65CMJ265yEs9yEGkIpR59VHlAivkwST6p4LPxgMTo295uV8UhHzqhLjV1Dy19jKEhkzm
	L4lHfz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQUO-0000000FJum-3XTd;
	Sat, 26 Sep 2026 11:22:44 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQUL-0000000FJtu-0bUZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:22:43 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939656ff6d9so188438985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421760; x=1791026560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQIwLtwiv2GNar8YmdrUtxZP0jcj02NoHt6505OGaXA=;
        b=JPeSk7ctUx2VK/cSTOUWmLHTZhzMEa8A/vzY+YpSVQDkho1A4M9+tWdFEzA2BusOmQ
         tZMfL6vFAgoA6Ptv66d9wrSle0T68a+KTT7oX95W1M3FZ9RAsgLcrwUf11lqaD6vsu5V
         X3Xt6KTg7BYr7H0M2cEGkcRqSwnpFZhVr1YQy9uec6SoYDDH7d9/Speogi3F0fc0cIXF
         lf2uyli9vtcBL33gCjJn0NsmgxGasHlzGXf+IMA6hkS0m7uL3SsjqC6f8M0GvLgnPjvh
         fxJBfYq89T8wYwUWot3RMKPQfX52QSzK4z8C5p3PbLzI5aKyFl4quQRXA9v2gt2ABjXr
         3f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421760; x=1791026560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQIwLtwiv2GNar8YmdrUtxZP0jcj02NoHt6505OGaXA=;
        b=F/cKnGnzke2OXQ1ZcI2Gw3cQKeMxiDVD2ETGD5X88m+1pDNgQ9KF4DXvCxtva6b48g
         SJmbOqGmOEt/Tm41wMe6yrd+UkRr40Hh8y+KQfutt5b8rJANiWD1v5m4fyVIfZx3uj6L
         8XqiFuPJTtg96LCOfkRnJM43Ma0gwQF5FeP3Dmp8bmiJLtL25Ne6kMvziq79s6A1qCY5
         OQOIONAWhykB+PAPO+mSDWjKSRnDY8+XsTXb7iPIW37DTClUrZGRZKvJqHGGPfV5j5S9
         BGX35FWYukW8J4Z59tbi6RZbwRxJGBPQnNj51Fj3pqYiVinvmsy6rwKzDDHWjRroGvp3
         RZWA==
X-Forwarded-Encrypted: i=1; AKwUvByomtcZXCufoffdma2iCo8MQ7TRzeGlePvyrsSu1CvQtQ1eG8OLe7L2hJ3WyXC9tI4Nip5u/gupTJ5NtGd3LuZD@lists.infradead.org
X-Gm-Message-State: AFuF++mBHQhnHkEERTcvU6ObhuMzXPUXvulxc41dQMuBxib4l8IwTEDm
	3bp6OlJ+1ICKmSBS2H1k4VcvslKc2HRR0/IK5XgW9p2pZ6pEsGGwsaU/M2pPHajc
X-Gm-Gg: AYBFou28ceDJ1aU//Dqll8yTB0/QM+kGZrmrz9vZiHL1LBuYccRfJ13C+sACzF4KpJR
	Hx5CobabdcPrb1nGRcf/vXtMPNTRxCnkvFpsIH6PyjW6wUxkuWrobe0ItkYLlMr9N+u0H6fYXYu
	D3E7dRmVIIYv+uum7Y9It7+zVHInswIP08FY4klwmDfs5I6Ss1frQ5aDcnzZvxJ8NLLioeiHoZV
	yS8kr7Ti3ON3lduDHg2VY2rexcgU4sQGYLSgFRV6YXDfOL2Ra5dZNingPpQ4rBI4s3KHKSLH1u+
	UXHame4kfqNQPOuRZVEcJ3AYF5eKez9k+PGL9/c9OzK9mCl2o1dNAu6cFgSgHvfGpWNc3tonlGl
	9RR2SEUpsfKJjZJ4wPtV6C2yqH4evhFhFPUc09/2ahsBxFysmQLFZ8RMZRHzWNErnZeN5aH7HYx
	ix7Y7Jqc1lyDuDzgmFRdkbH2AClz2NvS9VlMEggNfsuQ6745yUhWtJAUVUbOfhQrWXcAHYSO/TA
	acXHoT4A7UfiMBL4QzdaM5HiG3G8GU=
X-Received: by 2002:a17:903:906:b0:2df:8382:9181 with SMTP id d9443c01a7336-2df838294f7mr66998555ad.14.1790421262728;
        Sat, 26 Sep 2026 04:14:22 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:22 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:14:00 +0800
Subject: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_042242_650854_7E3BEAD4 
X-CRM114-Status: GOOD (  13.16  )
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

MT7629 currently matches the MT6589 fallback, which exposes reset IDs
0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
register and cannot be requested through this fallback.

Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1b95392c0f78..ad5f8fee0abc 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -69,6 +69,7 @@
 #define DRV_VERSION		"1.0"
 
 #define MT6589_TOPRGU_SW_RST_NUM	12
+#define MT7629_TOPRGU_SW_RST_NUM	13
 #define MT7988_TOPRGU_SW_RST_NUM	24
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -108,6 +109,10 @@ static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt7629_data = {
+	.toprgu_sw_rst_num = MT7629_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt7986_data = {
 	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
 };
@@ -590,6 +595,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
 	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },

-- 
2.55.0


