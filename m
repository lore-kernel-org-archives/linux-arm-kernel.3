Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB89CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=; b=AsSwC8I5NuukzhxQ6QMb90ZdQA
	8wfDNbQ1Ys78zqKVRrP1CLpjy6B96q919MxuyD+B1r02V9BtkUjsTVVz23PILUGKUdfw8I6f6o00D
	Ig8hJNKAPvT/lt5sMyuyx3oFJU4BREtXB1x/5hCM8Lt2iw3teH2pzyCkThEGeRaYgOqhSNKngZC70
	UxMS7pE6uarjBubtuJARGY6/fkqZQ/TB7P+j/ktaMte+OD6SIZzxK73IDGWzdiMAhDgfPAoVxJEp6
	UwQqAg96dNU4dpbbih5Qy0/sa/pz53lFRxhYTdo5diox+Hi4ulRWjeuqvpDGU4WzKsCcDoqbh8ZcZ
	8j+8VoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBo1-00000003xO1-46Vm;
	Wed, 27 May 2026 10:48:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBnx-00000003xKp-2y56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:48:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso31824435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878883; x=1780483683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=CVNRRdhdWBJWy56w5Llc/1JqfTICqP4DuGYvIF4rf8wy/n8WqeEdIN7QbkwSTre3BX
         ov8Qkxx5ohMvDGeHHZm9A7gVBwMf0HUieneJIWMpOQa9kV4wPSQowyQ5BTSautgCJs1/
         agZKYGKQHVPBESCN52nz+5+7RXL1VgH5BuTwljck0ukpLOx1y/hVaYA8yYFNpR4nJbiR
         zuw5+uTHK5e7kf/fjd3Q2vOZ7JoyXpq/bs/SIEnTgcD+1G6eU0RCXSLxsuSs2HlNJFSR
         3RUCmECLDiHw3ye+7bs6RatIxo8zk4FU20PgTD1GUhD7uYiPFQHcmmxjbnq0jVzy/0kE
         R8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878883; x=1780483683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=r03ZnBrpmtCdZAmSJnMY06m7QJD5kploJCJ2cO3vwsG7+73KPU4x+3PpptMs+zfZ5s
         wbitMGgi3JIHSWyXLCwmQ7rkDJBpFo2vC92UrAyAGcRbRPC0XttAf6qvXtYSNtDjpDPc
         0A6OMTICKB7dM8v0fJFtJHvt/HbAryfa5s7LghYwG3ubP67/yWG2qwO/2yk8U9UswQE7
         yYlKQDVa4IzBHcx7Qsb4OoVauS7E5F/ZXil4I2RX468B1iJ6jWyYYNiXcNGd1uiwzXSt
         7RfqZjQY6RyDou6T8gsBPvO/qPK4+qOAJCjAKR4aRuGwwkdLfrJGn3XYN5HrBeNVKJEl
         NZ7g==
X-Forwarded-Encrypted: i=1; AFNElJ9zqYsFIcFDDItLzEiymYi9xIAqvhSYx6IRBSn44c7OqKT/V2tIxdsEarR62QTyyQe2sqogkVy8+1o/M5mhNaqt@lists.infradead.org
X-Gm-Message-State: AOJu0YwgMfqPDTqO4RDGf0TdvyNLFz8TRehgXQR+AlvkpngXAfj13ikk
	J4YY7IE91Cmw2pvfO5Oy8NO6BBGkPLbSwIj5GNkKvoblr9k73kAJLzVoNgNXYgDh8C4=
X-Gm-Gg: Acq92OHy7KAEO4XjcrBYb28pZ2sKRMLo6npTpekxdVOoPP85j/kWv4Q2DVzsNiproA1
	ahUYsY5WfFeFO6AcDz3sEHAQFDLZrQQ/9gzc1IC/s7FiLTMC7XeuEtA70lDr0peTVh1KjcL/K8E
	bC3TYR/F1RxnRbXET7rONvxcthAoswQBe4K3x0asRCuzuZgC7Fx1S56514YBujFtSJFlttXPwFm
	WBCQVMjqL49mVcalK8cTbm0QNfI34KmUfwnRTaeQYH7nOYbvDqq6JM/FEWjqb4uZQyDIi9Tcjth
	d2brEM6nc707szk4TyUUEi6ekl7OkggMCaob8qw1tA7ID3GnBgFJipyl/FA65vQUGCS1SatRxlm
	KgP5FkvvRuvuOW07u+yuP5KhITD44otyuNY2+c6H6aBEp216Y9xBPRGFEk27KqsoYqggcNd6MxD
	vEPyWt797T5buAGx1e6QBiF/B/SzgIJ2iqSqSGDMHkDsNGZrCWE99raNg3kYTZ/bHKX5nJZKUTp
	A+e/cH/vhC9J7nz05SmPlGsKA==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr362404855e9.12.1779878883413;
        Wed, 27 May 2026 03:48:03 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527526dsm428217795e9.4.2026.05.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:43 +0200
Message-ID: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvQ+3pUGvYbTzMBf1U7HpUNs0YqKV82qCwBE o++WwMTehGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL0AAKCRCPgPtYfRL+ Tr6TB/9tVIDirqaIFIr+cLHvFRjr/N+HTQz/62BiICc2JJZjFIxmMz6KGMb9PGbAjW0SSau/dN4 zcLMGrCLoC48OmtmlVPfz+h8PG49qdmzJoQkLg4kgndLfg39qqbcPsy5OhkrlgPPzheAU6T3zrm 0WxKp6Wr3LT/anxmAVOQ5FtwjfhMonlFOEOipHYnM2hSfShJ2Bh1eE6IBZytU+c7SY+/nNNsB/D ZC0jCfekfiHdSj1sMmpvYw/JsTRuvgZI4wfY2r4DqR7oE0TrKI5jZLonpB9QKDQyLjLXmkS+xzK bbDtl9bNcjm0Hwz5BysWpXOKEc9oARJLfgXY+NBO7kgQGcRc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_034805_795371_2832BBFD 
X-CRM114-Status: GOOD (  20.18  )
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

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..b84881f32444 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -610,4 +610,7 @@ struct dmi_system_id {
 struct platform_device_id {
 	char name[PLATFORM_NAME_SIZE];
-	kernel_ulong_t driver_data;
+	union {
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 308279b31fd3..6bbad1f1ddd1 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1211,7 +1211,7 @@ static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
 	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
-	struct bd96801_pmic_data *pdata_template;
+	const struct bd96801_pmic_data *pdata_template;
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config = {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -1224,7 +1224,7 @@ static int bd96801_probe(struct platform_device *pdev)
 
 	parent = pdev->dev.parent;
 
-	pdata_template = (struct bd96801_pmic_data *)platform_get_device_id(pdev)->driver_data;
+	pdata_template = platform_get_device_id(pdev)->driver_data_ptr;
 	if (!pdata_template)
 		return -ENODEV;
 
@@ -1329,10 +1329,10 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
-	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
-	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
-	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ .name = "bd96801-regulator", .driver_data_ptr = &bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data_ptr = &bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data_ptr = &bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data_ptr = &bd96806_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);

which allows the compiler to notice that driver_data is supposed to
be const and thus requires the first hunk.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused assignment of platform_device_id driver data
  regulator: Use named initializers for platform_device_id arrays
  regulator: Unify usage of space and comma in platform_device_id arrays

 drivers/regulator/88pm8607.c              |  4 +---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421-regulator.c      |  2 +-
 drivers/regulator/hi6421v530-regulator.c  |  2 +-
 drivers/regulator/hi6421v600-regulator.c  |  2 +-
 drivers/regulator/hi655x-regulator.c      |  2 +-
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77620-regulator.c    |  8 ++++----
 drivers/regulator/max77686-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max77802-regulator.c    |  4 ++--
 drivers/regulator/max8997-regulator.c     |  4 ++--
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6323-regulator.c      |  4 ++--
 drivers/regulator/mt6331-regulator.c      |  4 ++--
 drivers/regulator/mt6332-regulator.c      |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/mt6358-regulator.c      |  4 ++--
 drivers/regulator/mt6359-regulator.c      |  4 ++--
 drivers/regulator/mt6360-regulator.c      |  4 ++--
 drivers/regulator/mt6370-regulator.c      |  4 ++--
 drivers/regulator/mt6380-regulator.c      |  4 ++--
 drivers/regulator/mt6397-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt4831-regulator.c      |  4 ++--
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/rt5120-regulator.c      |  4 ++--
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mpa01.c               |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/s5m8767.c               |  4 ++--
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 46 files changed, 95 insertions(+), 97 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3


