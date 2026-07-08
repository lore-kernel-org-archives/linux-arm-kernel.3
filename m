Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E55EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=; b=1S/O9O26hA0y2Z2sFEFnwCl1sm
	/nn7wD10nYjYGDZI2egjqMoBFP9dVlpy1h+JNwG0ii3azPJ8twxSTb3G3jLIaPSWj+ltesYO2ZYjK
	FgOqbw2InEblJdYcQ0QGneKgZqDsT+cACP4L4+vM2OHbEHNiHKX+OCCicX+/Vw7J8sFkyAR9UsUqL
	lrUGCtx9m352o9tsAdKialsmn+TXXFOlWYoQ91ZQTs9EMOY/HPGNlfdl0Zvtg+Z7vLzNUB2LjIzJ9
	5B+feAw2LVJlDbwFHMLgjWan9JBkuJ9rrKtDe3amPjs/z8qQy0X0qVobt9fwZB8rKO6pO+NlHwYCi
	zei9Nufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH7-0000000Gywl-0Dkf;
	Wed, 08 Jul 2026 11:17:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQH4-0000000Gyse-1h17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:17:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493c83474ddso4873065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509425; x=1784114225; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=hRyXAlSmkMp/IcY9menciLDWpLOkfwLr4CRdd/xVIReGipRjx/hyleT/iBiES6sfl5
         RYtXvWlXPhWqn9PUCCLpRxa5WgCTDBNbAb7puSydAYv33CMv2zLfMuJxkLcvasxK9XTm
         9GJUlnaSnQOnM/pBZ3Rum6SjkVjfvhr1JojrRYpRa9IdBio1wyOkdaKfofi+yZJaFw3H
         r+5HDnapoNO0EpJv3qaCPrnJXpxHGtCf26BhL7BVuzqX8mVXbkzb01inn7baGQSfem/s
         SrQZkuSb/vIySW289ju4oU/CVQd+lLyBS7cmGtK8MIdb/lKF5L7zpc15jJj7Wo1tTiIB
         8z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509425; x=1784114225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=Oio3XYFipvLEO7WFW7kX3R46iLK4YSArzga886OiKNK6JB9/MFezl9P90R4v+3USTg
         kfEcEmMYeLT0YU4dRaPTg0Uw/ZGTynepWuOB+Wp8r4+1UzM/4LwOIEUBRaUFLrJvB+Av
         UfD0cEipWiNn+fyLnFYFctSLgp/29CnXUzySVPIEipTNFqgVklk2WWNIu4MU8YxLvlFF
         BqihUDUg8Ta6feIsACjSa1dnbXUdmwCN7VeSf5MvUehmC3affEaNfT1qibtCnY3b/GqP
         TjcFVkQRDd0QpGE0GU5lvxfY7g7iPu5NoDCGhMQe+PNdCKQ3PIPmXLGy5L6vd7YWTAWp
         hGdw==
X-Forwarded-Encrypted: i=1; AHgh+RplmQ8qpMo9VNHezWTmOo8c7V/ls/PXCvSGkuRojaWYWNAwYwFYDbm54cCECIUDY39TytmPF5yB5SMCMTcv5rJ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7hids58jOIHFiPsaC16oQNXdg/2qUVXQI59qt6lYLIVcT8vlN
	12XDfzoZ5WNv9gqgRac9VBRLJSzQebS+f1kfg9Q2veLaINyi/Rb9apoBxP+wNiKQpjo=
X-Gm-Gg: AfdE7ckYB0/3iPyc8vA6ONPv0Phte2mGJQpAbnnPmsP5rhkpGm8aVw3CU7GZ92eAGub
	3Cdpi9Qd2mQcVQuuvcJ11xVtbh97pu+rfM6qiVLYIleTTXN9ohzI45kDJ9EYXOPu0baeG5NOVKA
	h++iqMalfFOXdbL5nYcir/T+t+/XhRa6+27c6EjnyijMY9c9Zz0eE505foroE/JUY4YjXOLLNkK
	pyyUP167JA5Co0VXPu9VRONtKgQYwsP/WyIU8xMTjI0dqgsPHAy/Olr0MTXFD3Uw8+cDG+1lY3e
	sKqiADmjlNUKDMGQ5IBRuncRwHvgGSNVJFEuUiTnodmuvP77tJjX3+iOaUc6BJ19Aa3RAW0wzHF
	sHsn5CEVh6ws57szaJZ1RZo7oetA/B+1Z2Ov8eNVlC/BjYkSfGHk1YhJHixoWBZdC/U8r8ZzE3s
	qNbx1aYrjQW5wX9gq/YglCHgXz/5YvX2TwrnVuNCKsecMoeqHm0OjV+pI42MUjrJrnd/QSmzsD+
	vXZeZaETyTDy4U=
X-Received: by 2002:a05:600c:8b2b:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-493e79edb81mr14329665e9.21.1783509424549;
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fbb410sm134582585e9.12.2026.07.08.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 16/23] mfd: Use named initializers for platform_device_id array
Date: Wed,  8 Jul 2026 13:15:23 +0200
Message-ID: <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFzyT0ZErsr2QqgUI+ds7aThxCts2E7ekkXL BACi/D+1X2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xcwAKCRCPgPtYfRL+ TvLFB/9hN+VB2+hmD5mjaItFVbgfdSMKak8oAIsjfT3yy5d+i61CICxL9i+805fBO8WayHEw0J4 WWVSFrgdv9eWp60pkSg/voFbzW8yf6/lYZDDMlbiZzrL2qi/A717lcyifJT1aDB1ZCLuO6rijK2 SCC1e2pwmS5uh5lZAvOogmiDKp2ywDkbkQfcJNRk2cAAJ1ECRb0tcmjBh8fKG72bGDEenli4yN7 OMDXv0I3ISleKF6I+avOCcNIZXa+ycqDnLzR14Igy5ifsu6sIQhY0TmY/RdOe0hlDal6+N8d1nl wGO8Wq1G3/uz/qGLVcyHKpv9whEa/ciwhBlEHY3Jii5OmZ1h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041706_467631_8CFDA91F 
X-CRM114-Status: GOOD (  18.42  )
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

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..7c00c71ca4ba 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1250,10 +1250,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a933cb936da6..baa6487abf9e 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7987583afc60..7bbd9b730b75 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,8 +429,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.55.0.11.g153666a7d9bb


