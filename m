Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE8FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+z5ks7FycyWyhSB2oeVofN0AVLQLkvT8Z6YFVDa6do=; b=xCQSCWjW496kSygqxUxCQHvcyT
	qABZACG5Cg7kwODERmZlSQshN+3wPI1rws9BAds+exVPuBnY9nzZjZp7AKDaAd/U2WpSVfdYKQ+Rq
	CH/I1qmOXL6YKKITJIuULNaS51h4+g+c3unt4dSGxh3J3RVMn5v0xkkRZIuhWVUvrTyEmyU1mjFtV
	lavYSu5mfRPcurTxwubYS0/1LMkHKPLTLCKVBNkvJ/C7lHvybEdbfgb3Udn70EoP7ZBiIA8VR4kKL
	0NZbdMwqDEpHQrD356yM1gGlxvxWbVUm0m/IDW472nVgGl2Ma25iWxMV4JrbBe/gvoyFKyDEQve5G
	sFWJe/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6u5-0000000FrAn-3Ve7;
	Sun, 26 Apr 2026 21:20:37 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6u3-0000000FrA8-3NSU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:20:36 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12c8c9c4cd8so3591775c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1777238435; x=1777843235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+z5ks7FycyWyhSB2oeVofN0AVLQLkvT8Z6YFVDa6do=;
        b=hA+RSOYkyouhHpQ5zkKETHvuqX9y62CbqgkiQkN2pdOvb732mflboNDUEndrrQTsl6
         cvzt/CpPnoIM+dyKZK4kJ1+Asi6VCgWkv9B343SEIiyRpzwZCll6jNtel+voCELXVrAi
         sPArvQlf8JS2JNkllba2TFQpQdnaivWmrLekVPJcD59ZtC/09eh6HfER7N5o3ypcx9gZ
         U706hXupyVbTs65yDKeJs8IYXRgiVFSfJsIHDvzkTReMZ13gBFu7pA0URg0Ge2ueANMu
         mAKfhNzsd/6RA+ztJwV1beZckq7uh1/oRsFDLRSpzVog/dSGYDzRL0CozmwsHkWyhikQ
         th+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238435; x=1777843235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+z5ks7FycyWyhSB2oeVofN0AVLQLkvT8Z6YFVDa6do=;
        b=hTOuhDaE4iSnl1RkQVhTSDYRoA4WkrpZpdRdBWLmh++Js0IwDASOfC8hF9Fo40cWrS
         7di0o4KQuIDXi89qf5XBVomVSzSFmKWBbYo9tZtCVXClPxTJYXhi8VjeJp8OrVJPRNIn
         3MI/Oi3BUsr34E8xI/817SnlS3OatDikPhJ6LlUw+Fw3b/zqURH6Rvjcr8xP6LIFha5A
         2plN3I64hK7co9hG3fahB9T+Zekoh+P+2SRIPiemxwTzRWIRhY9gXZorO/x8bHkeGjnf
         aYpNmIcPwvqUXd0d4YAwe7VZasAGqgW08eTyfTrWOXGvRiCk5tM6W4FctdjXbh+E0FTz
         LgyA==
X-Forwarded-Encrypted: i=1; AFNElJ+zCV3Y4lWoSAVdShSZb2f6TIioIggL6pVhkvxhwJ2Yqn2D//H5hREXCIUUDPjZy/Tf3eN2f2rNpmWYvJ+1jGF1@lists.infradead.org
X-Gm-Message-State: AOJu0YzYzkJ9oCabTkx853rIEnNxlYMCGWbx5QLn5GWAyFiP+dcxjyT9
	FDugt9P/THb6liqYZ8fz34/xccp/TrPpbSALXClLJmH3cMCRSi3wrRP/zyLsV9aAo3s=
X-Gm-Gg: AeBDievvT3vygoMahftVv+zpbDrPus8dsRX09F7HeRCAva/47+PWY3xH4In+1EfumI0
	vpeRNptp/JE49KIB0RYThtthAhnwzssfI4AMQfWvLsernUUWKA8C/J5yulU6bmfhae0gAGjUVAe
	aYQB/zTLNtL4oprhrNzpHvabHMLc8q5XyjK+VJrhsAGWUOtao6T9978qiI3pSmH4EZ45JoN9+S/
	oRt1Us1ipRW7oGepo8fTQGSajDV4BcNJLh/3fCZBg3wxh3Ia10JM2jH6YMm9GN3ksVmaWiL+9u1
	1RuBwxBP2vaBvi5+9SMm6V3orU3Ol4gOnHfP9L1ftz+LWisIVD9TD4x9dUYbFe28HR96SAoZzGh
	AX+jwI7VRtsZkUBXKTtTrfgxq4LmFLmcar8PJZ69f1Ku+qQwbtdQzQfiHygGyjq6BU33Ci/lwF6
	X6K2edHf8hUxdhmeeGhw1NhGGebeke5bes1X38JydfYw==
X-Received: by 2002:a05:7300:dc8e:b0:2d9:db50:c6ce with SMTP id 5a478bee46e88-2e42c348309mr15335715eec.3.1777238434861;
        Sun, 26 Apr 2026 14:20:34 -0700 (PDT)
Received: from eileen ([38.10.153.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm40799122eec.17.2026.04.26.14.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:20:34 -0700 (PDT)
From: Caio Morais <caiomorais@usp.br>
X-Google-Original-From: Caio Morais
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	michal.simek@amd.com,
	nuno.sa@analog.com
Cc: Caio Morais <caiomorais@usp.br>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH 3/3] iio: common: st_sensors: fix includes with IWYU
Date: Sun, 26 Apr 2026 18:18:02 -0300
Message-ID: <20260426211834.3318306-4-caiomorais@usp.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426211834.3318306-1-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_142035_845465_73D8626D 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

From: Caio Morais <caiomorais@usp.br>

Signed-off-by: Caio Morais <caiomorais@usp.br>
---
 drivers/iio/common/st_sensors/st_sensors_i2c.c | 7 +++++--
 drivers/iio/common/st_sensors/st_sensors_spi.c | 9 +++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_i2c.c b/drivers/iio/common/st_sensors/st_sensors_i2c.c
index 7156302fe..04d106def 100644
--- a/drivers/iio/common/st_sensors/st_sensors_i2c.c
+++ b/drivers/iio/common/st_sensors/st_sensors_i2c.c
@@ -7,12 +7,15 @@
  * Denis Ciocca <denis.ciocca@st.com>
  */
 
+#include <linux/device.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/kernel.h>
+#include <linux/linkage.h>
 #include <linux/module.h>
-#include <linux/iio/iio.h>
 #include <linux/regmap.h>
 
+#include <linux/iio/iio.h>
+
 #include <linux/iio/common/st_sensors_i2c.h>
 
 #define ST_SENSORS_I2C_MULTIREAD	0x80
diff --git a/drivers/iio/common/st_sensors/st_sensors_spi.c b/drivers/iio/common/st_sensors/st_sensors_spi.c
index 0da270139..884077d51 100644
--- a/drivers/iio/common/st_sensors/st_sensors_spi.c
+++ b/drivers/iio/common/st_sensors/st_sensors_spi.c
@@ -7,12 +7,17 @@
  * Denis Ciocca <denis.ciocca@st.com>
  */
 
-#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/linkage.h>
 #include <linux/module.h>
-#include <linux/iio/iio.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#include <linux/iio/iio.h>
 
 #include <linux/iio/common/st_sensors_spi.h>
 
-- 
2.54.0


