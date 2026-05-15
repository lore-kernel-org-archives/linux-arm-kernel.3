Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78634CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o4VFxAX/RBMPyY1B8Q55ve0Gqxv/mNzsRTb0EZb1f1Y=; b=fwinEWVxgmRNv8MZMv0IcTaBFE
	NIGGSiaY4TNgKkdHtjx/GsadOgigT6M5aPdVK0YQOJL8hN489QdKe6zRaDLnEuUw32hXB7fLei8hk
	VgOPU9ReJH2A8ljUttMD+qtFgTBiTAVo3LAPwwk+imFz0xLgATlP63sYhBjDE5ETViYTmE++Hxi/s
	NyuZcIsacnKcfXjmxoefP/UDyDVPahFb6W1qezD7+ixVbHsg1zMHW8XE0u/iEdpgl6Xr2P4XiH6mW
	GNk6PW/yV7vNiTVVLXcOU1lH3oLrfMLVC20yUc+Af7H4FdIEvzVxlhTIYxjBNONzuJRePqiMwzHRu
	nZrEtClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNppu-000000083SF-2gze;
	Fri, 15 May 2026 10:32:06 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNppq-000000083RW-1XwO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:32:05 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so56587935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778841120; x=1779445920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4VFxAX/RBMPyY1B8Q55ve0Gqxv/mNzsRTb0EZb1f1Y=;
        b=RPZ9pnPvl9R8R79/o6vhNfi0RA44XrAzspjnVhe4nk7Bks/04rrn5V56NXkc3BGyGF
         BTeKzMcf6FA2ECUOrpf60njhikoh5eibnbEDL3DDOnJUBMUcRPrRW2rZ/oBB+oubDDAa
         oEK9jjNx2hDc+fu4S2GzEfOG9aEqsmzffep6ZtYVWc3qusoBI9hL+yXTb3DrCJLQI5Qk
         674axaqg/MchjLEZ5gFp3EGgx61qK3XN38OKtiCNXkscY/xb9kfe4i9Cc9R22op4oG59
         SkG4Elwuwtol6Gq+KM7j+vDjULO+egY4xgWvzWD96iPKwVmD/ntn9NKElFifAtvUr2w/
         kRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841120; x=1779445920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4VFxAX/RBMPyY1B8Q55ve0Gqxv/mNzsRTb0EZb1f1Y=;
        b=S9yYo/ZYnIHX3DOFPTDyo7sfZcv1jXMLOtuvrVJYSqWcfHkDRF/ajMoCJsh/VSuBFr
         EHZNcc6XYSP2qzD6GaWI3j2l7ZhEHL0MwWucwGcO8TlDNdMqHeZqubovUHkv4cCY83oe
         88mfw7MJMJCBlT/sPUz4y3pswCNSHjCbA9qis61omLOLjm0dmKDDaIQR0o24r5lfq9Rz
         o4Q7QvyHJUTH6FA9+8q3zR63FIla4so0DiM8D9IMWnt4ERRc1yJBG5guG7GUMwM3U8Uy
         1AwgsBrsHidx4syEKU20p7LdeNL7PDPCCKhx1krGxmPoLzaLo9iUEZ8/IurdaRjxCC/4
         nmuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FCO4kkcCrDOIFlXAPTdjUWqvsndmQykiERz9jqRTegl4pjvlCoGg+7GXr571A1cOfn4TdYmKcXu0ayWA4jJqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKqEzj1TzsXYS/yzbeqBi3K9GVoU31d8a7ZiqMnbJ01lWP27FH
	z/UrV3mDrCxtA5zGe1WZjpPlo6iY+tLnbaO5vmZNtQBXLlmswhQ9kWwxPqrWFbi9zIM=
X-Gm-Gg: Acq92OHS7McOHRyOXG4AtakmMngGZAfUU7d83Y1DhoMlJnE7RFIslEmodvFjT9VLuxY
	CfMok2QrEjGAPHPOA5uth4S4+uxX2+nhnr8CyJfvz1wvmW13JfM5bdf5Pc1diyhfDtH6h5u8u3e
	kjxereSZT8C13RN6q/QQWKcITjLtCcDsIvm7Hr1u6YqmxfIxmAeDGoxhXsLQhuacv0jJrsEG2xa
	+a06sbL2xJMPkwU7wEKylCjKGuInzXs9WeZffMy/JAJ8f/2IBZs3FE+c03SFEpv5ohe2Q8uMzzr
	rpQk6caBCbaBlbLIaleaJACAExeHS/PGlTKtMPTOic7GUV1Ggzk6OKRi3cQvxS8BIENs5sZMtlr
	10WL1Rn0XWiVI8r+y/6f2wVX2Wb42fCik4WQ1AXofuDjoL1GUeQY6wIZCMZRpRcdTI9MHo2XLiF
	cyt0z0hHmYjUcn1YoHpL9uTnKCp/R4AqyJI1CMCUARy65z7LD0W/tHl/BVwtkA37NAApYlBcUoF
	GUF3j8/ZXCK9lR2U6uiqSIsBg==
X-Received: by 2002:a05:600c:3104:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-48fe651b57fmr43050765e9.27.1778841119922;
        Fri, 15 May 2026 03:31:59 -0700 (PDT)
Received: from localhost (p200300f65f47db04b9fad853b28b1de0.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b9fa:d853:b28b:1de0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe5694fbfsm93991925e9.6.2026.05.15.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:31:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] regulator: Use named initializers for arrays of i2c_device_data
Date: Fri, 15 May 2026 12:31:50 +0200
Message-ID: <20260515103150.164887-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=31528; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=aA+OthxxiJ6r+sFyl2p1Ok9WVo/khYHXmfKCp/p8qhY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBvYWHXe0AjMkzLf5qeqgQYDNYReZpWIGfHqh5 bFuwpHQ1X+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagb2FgAKCRCPgPtYfRL+ TqwKB/42AKoRVSPwcCfZyvkO2Xd21CFmj+Mmu9vALJqi13gU1e2kg8GuPblFtsoLPGetjG2qjmo HIWhX7woKZgSqHIGC1Ix7S1OBxn1Flj8ViQ8FMBM9QlWuB8Bb1kO69O7HJ0cHlrWro2JXt0Cv+B NkIdvgRxUGYAcERSCeF6MD/8UvNtRab5JOTC/JY7zCrLrCzdmc8OeWC9d8WzyIsuAOw9YEbGMpe WpGZjl942a2WeLINLPMI5b9GF6V6UQlAbrWPXUb6niLF82pa+xgPUqa2bONFo+uyqCk/hmQ5j2t /dI+oUlqt23SnBLm5nTpl3y/IQYy6PittO3+rN04Sz/6ZzJz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_033202_611456_4DB1276F 
X-CRM114-Status: GOOD (  23.05  )
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
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..dfb0b07500a7 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
	 
	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
		struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
		struct regulator_config config = { };
		struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-			(struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data;
	 
		chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
		if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that.

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/

 drivers/regulator/88pg86x.c            |  4 +--
 drivers/regulator/ad5398.c             |  4 +--
 drivers/regulator/da9121-regulator.c   | 20 +++++++--------
 drivers/regulator/da9210-regulator.c   |  4 +--
 drivers/regulator/da9211-regulator.c   | 18 +++++++-------
 drivers/regulator/fan53880.c           |  4 +--
 drivers/regulator/isl9305.c            |  4 +--
 drivers/regulator/lp3971.c             |  2 +-
 drivers/regulator/lp3972.c             |  2 +-
 drivers/regulator/lp872x.c             | 34 +++++++++++++-------------
 drivers/regulator/lp8755.c             |  4 +--
 drivers/regulator/ltc3589.c            |  6 ++---
 drivers/regulator/ltc3676.c            |  2 +-
 drivers/regulator/max1586.c            |  2 +-
 drivers/regulator/max20086-regulator.c |  8 +++---
 drivers/regulator/max20411-regulator.c |  2 +-
 drivers/regulator/max77503-regulator.c |  2 +-
 drivers/regulator/max77675-regulator.c |  2 +-
 drivers/regulator/max77826-regulator.c |  2 +-
 drivers/regulator/max77838-regulator.c |  2 +-
 drivers/regulator/max77857-regulator.c |  8 +++---
 drivers/regulator/max8649.c            |  2 +-
 drivers/regulator/max8893.c            |  2 +-
 drivers/regulator/max8952.c            |  2 +-
 drivers/regulator/mcp16502.c           |  2 +-
 drivers/regulator/mp5416.c             |  6 ++---
 drivers/regulator/mp8859.c             |  4 +--
 drivers/regulator/mp886x.c             |  6 ++---
 drivers/regulator/mpq7920.c            |  4 +--
 drivers/regulator/mt6311-regulator.c   |  4 +--
 drivers/regulator/pf530x-regulator.c   |  8 +++---
 drivers/regulator/pf8x00-regulator.c   |  8 +++---
 drivers/regulator/pv88060-regulator.c  |  4 +--
 drivers/regulator/pv88080-regulator.c  |  8 +++---
 drivers/regulator/pv88090-regulator.c  |  4 +--
 drivers/regulator/slg51000-regulator.c |  4 +--
 drivers/regulator/sy8106a-regulator.c  |  2 +-
 drivers/regulator/sy8824x.c            |  8 +++---
 drivers/regulator/sy8827n.c            |  4 +--
 drivers/regulator/tps6286x-regulator.c | 10 ++++----
 drivers/regulator/tps6287x-regulator.c | 10 ++++----
 41 files changed, 119 insertions(+), 119 deletions(-)

diff --git a/drivers/regulator/88pg86x.c b/drivers/regulator/88pg86x.c
index e6598e74ec94..8c25a1db412f 100644
--- a/drivers/regulator/88pg86x.c
+++ b/drivers/regulator/88pg86x.c
@@ -92,8 +92,8 @@ static const struct of_device_id __maybe_unused pg86x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pg86x_dt_ids);
 
 static const struct i2c_device_id pg86x_i2c_id[] = {
-	{ "88pg867", },
-	{ "88pg868", },
+	{ .name = "88pg867" },
+	{ .name = "88pg868" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pg86x_i2c_id);
diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
index eb2a666a45cb..0123ca8157a8 100644
--- a/drivers/regulator/ad5398.c
+++ b/drivers/regulator/ad5398.c
@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};
 
 static const struct i2c_device_id ad5398_id[] = {
-	{ "ad5398", (kernel_ulong_t)&df_10_4_120 },
-	{ "ad5821", (kernel_ulong_t)&df_10_4_120 },
+	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
+	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad5398_id);
diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 2b150bb4d471..8155f0974f7d 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -1195,16 +1195,16 @@ static void da9121_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da9121_i2c_id[] = {
-	{"da9121", DA9121_TYPE_DA9121_DA9130},
-	{"da9130", DA9121_TYPE_DA9121_DA9130},
-	{"da9217", DA9121_TYPE_DA9217},
-	{"da9122", DA9121_TYPE_DA9122_DA9131},
-	{"da9131", DA9121_TYPE_DA9122_DA9131},
-	{"da9220", DA9121_TYPE_DA9220_DA9132},
-	{"da9132", DA9121_TYPE_DA9220_DA9132},
-	{"da9141", DA9121_TYPE_DA9141},
-	{"da9142", DA9121_TYPE_DA9142},
-	{},
+	{ .name = "da9121", .driver_data = DA9121_TYPE_DA9121_DA9130 },
+	{ .name = "da9130", .driver_data = DA9121_TYPE_DA9121_DA9130 },
+	{ .name = "da9217", .driver_data = DA9121_TYPE_DA9217 },
+	{ .name = "da9122", .driver_data = DA9121_TYPE_DA9122_DA9131 },
+	{ .name = "da9131", .driver_data = DA9121_TYPE_DA9122_DA9131 },
+	{ .name = "da9220", .driver_data = DA9121_TYPE_DA9220_DA9132 },
+	{ .name = "da9132", .driver_data = DA9121_TYPE_DA9220_DA9132 },
+	{ .name = "da9141", .driver_data = DA9121_TYPE_DA9141 },
+	{ .name = "da9142", .driver_data = DA9121_TYPE_DA9142 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9121_i2c_id);
 
diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da9210-regulator.c
index 39ade0dba40f..9154e32bd745 100644
--- a/drivers/regulator/da9210-regulator.c
+++ b/drivers/regulator/da9210-regulator.c
@@ -202,8 +202,8 @@ static int da9210_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da9210_i2c_id[] = {
-	{ "da9210" },
-	{}
+	{ .name = "da9210" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, da9210_i2c_id);
diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index d4f14d7ea8cf..9cf713755636 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -522,15 +522,15 @@ static int da9211_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da9211_i2c_id[] = {
-	{"da9211", DA9211},
-	{"da9212", DA9212},
-	{"da9213", DA9213},
-	{"da9223", DA9223},
-	{"da9214", DA9214},
-	{"da9224", DA9224},
-	{"da9215", DA9215},
-	{"da9225", DA9225},
-	{},
+	{ .name = "da9211", .driver_data = DA9211 },
+	{ .name = "da9212", .driver_data = DA9212 },
+	{ .name = "da9213", .driver_data = DA9213 },
+	{ .name = "da9223", .driver_data = DA9223 },
+	{ .name = "da9214", .driver_data = DA9214 },
+	{ .name = "da9224", .driver_data = DA9224 },
+	{ .name = "da9215", .driver_data = DA9215 },
+	{ .name = "da9225", .driver_data = DA9225 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9211_i2c_id);
 
diff --git a/drivers/regulator/fan53880.c b/drivers/regulator/fan53880.c
index 6cb5656845f9..79ba705ec324 100644
--- a/drivers/regulator/fan53880.c
+++ b/drivers/regulator/fan53880.c
@@ -164,8 +164,8 @@ static const struct of_device_id fan53880_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, fan53880_dt_ids);
 
 static const struct i2c_device_id fan53880_i2c_id[] = {
-	{ "fan53880", },
-	{}
+	{ .name = "fan53880" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fan53880_i2c_id);
 
diff --git a/drivers/regulator/isl9305.c b/drivers/regulator/isl9305.c
index 5a234f25e6bb..ec6bd6bb9721 100644
--- a/drivers/regulator/isl9305.c
+++ b/drivers/regulator/isl9305.c
@@ -186,8 +186,8 @@ MODULE_DEVICE_TABLE(of, isl9305_dt_ids);
 #endif
 
 static const struct i2c_device_id isl9305_i2c_id[] = {
-	{ "isl9305", },
-	{ "isl9305h", },
+	{ .name = "isl9305" },
+	{ .name = "isl9305h" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl9305_i2c_id);
diff --git a/drivers/regulator/lp3971.c b/drivers/regulator/lp3971.c
index d4dab86fe385..6f830ae1bb61 100644
--- a/drivers/regulator/lp3971.c
+++ b/drivers/regulator/lp3971.c
@@ -439,7 +439,7 @@ static int lp3971_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lp3971_i2c_id[] = {
-	{ "lp3971" },
+	{ .name = "lp3971" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp3971_i2c_id);
diff --git a/drivers/regulator/lp3972.c b/drivers/regulator/lp3972.c
index 1b918fb72134..235c640ba57f 100644
--- a/drivers/regulator/lp3972.c
+++ b/drivers/regulator/lp3972.c
@@ -537,7 +537,7 @@ static int lp3972_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lp3972_i2c_id[] = {
-	{ "lp3972" },
+	{ .name = "lp3972" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp3972_i2c_id);
diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 942f37082cb1..779df653338a 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -796,24 +796,24 @@ static const struct regmap_config lp872x_regmap_config = {
 #define LP872X_VALID_OPMODE	(REGULATOR_MODE_FAST | REGULATOR_MODE_NORMAL)
 
 static struct of_regulator_match lp8720_matches[] = {
-	{ .name = "ldo1", .driver_data = (void *)LP8720_ID_LDO1, },
-	{ .name = "ldo2", .driver_data = (void *)LP8720_ID_LDO2, },
-	{ .name = "ldo3", .driver_data = (void *)LP8720_ID_LDO3, },
-	{ .name = "ldo4", .driver_data = (void *)LP8720_ID_LDO4, },
-	{ .name = "ldo5", .driver_data = (void *)LP8720_ID_LDO5, },
-	{ .name = "buck", .driver_data = (void *)LP8720_ID_BUCK, },
+	{ .name = "ldo1", .driver_data = (void *)LP8720_ID_LDO1 },
+	{ .name = "ldo2", .driver_data = (void *)LP8720_ID_LDO2 },
+	{ .name = "ldo3", .driver_data = (void *)LP8720_ID_LDO3 },
+	{ .name = "ldo4", .driver_data = (void *)LP8720_ID_LDO4 },
+	{ .name = "ldo5", .driver_data = (void *)LP8720_ID_LDO5 },
+	{ .name = "buck", .driver_data = (void *)LP8720_ID_BUCK },
 };
 
 static struct of_regulator_match lp8725_matches[] = {
-	{ .name = "ldo1", .driver_data = (void *)LP8725_ID_LDO1, },
-	{ .name = "ldo2", .driver_data = (void *)LP8725_ID_LDO2, },
-	{ .name = "ldo3", .driver_data = (void *)LP8725_ID_LDO3, },
-	{ .name = "ldo4", .driver_data = (void *)LP8725_ID_LDO4, },
-	{ .name = "ldo5", .driver_data = (void *)LP8725_ID_LDO5, },
-	{ .name = "lilo1", .driver_data = (void *)LP8725_ID_LILO1, },
-	{ .name = "lilo2", .driver_data = (void *)LP8725_ID_LILO2, },
-	{ .name = "buck1", .driver_data = (void *)LP8725_ID_BUCK1, },
-	{ .name = "buck2", .driver_data = (void *)LP8725_ID_BUCK2, },
+	{ .name = "ldo1", .driver_data = (void *)LP8725_ID_LDO1 },
+	{ .name = "ldo2", .driver_data = (void *)LP8725_ID_LDO2 },
+	{ .name = "ldo3", .driver_data = (void *)LP8725_ID_LDO3 },
+	{ .name = "ldo4", .driver_data = (void *)LP8725_ID_LDO4 },
+	{ .name = "ldo5", .driver_data = (void *)LP8725_ID_LDO5 },
+	{ .name = "lilo1", .driver_data = (void *)LP8725_ID_LILO1 },
+	{ .name = "lilo2", .driver_data = (void *)LP8725_ID_LILO2 },
+	{ .name = "buck1", .driver_data = (void *)LP8725_ID_BUCK1 },
+	{ .name = "buck2", .driver_data = (void *)LP8725_ID_BUCK2 },
 };
 
 static struct lp872x_platform_data
@@ -935,8 +935,8 @@ static const struct of_device_id lp872x_dt_ids[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, lp872x_dt_ids);
 
 static const struct i2c_device_id lp872x_ids[] = {
-	{"lp8720", LP8720},
-	{"lp8725", LP8725},
+	{ .name = "lp8720", .driver_data = LP8720 },
+	{ .name = "lp8725", .driver_data = LP8725 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp872x_ids);
diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
index 5509bee49bda..632320ba1800 100644
--- a/drivers/regulator/lp8755.c
+++ b/drivers/regulator/lp8755.c
@@ -430,8 +430,8 @@ static void lp8755_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp8755_id[] = {
-	{ LP8755_NAME },
-	{}
+	{ .name = LP8755_NAME },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lp8755_id);
diff --git a/drivers/regulator/ltc3589.c b/drivers/regulator/ltc3589.c
index 3f70c2225dba..8bae5d8aeaf4 100644
--- a/drivers/regulator/ltc3589.c
+++ b/drivers/regulator/ltc3589.c
@@ -445,9 +445,9 @@ static const struct ltc3589_info ltc3589_12_info = {
 };
 
 static const struct i2c_device_id ltc3589_i2c_id[] = {
-	{ "ltc3589",   (kernel_ulong_t)&ltc3589_info },
-	{ "ltc3589-1", (kernel_ulong_t)&ltc3589_12_info },
-	{ "ltc3589-2", (kernel_ulong_t)&ltc3589_12_info },
+	{ .name = "ltc3589", .driver_data = (kernel_ulong_t)&ltc3589_info },
+	{ .name = "ltc3589-1", .driver_data = (kernel_ulong_t)&ltc3589_12_info },
+	{ .name = "ltc3589-2", .driver_data = (kernel_ulong_t)&ltc3589_12_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc3589_i2c_id);
diff --git a/drivers/regulator/ltc3676.c b/drivers/regulator/ltc3676.c
index 73d511eb1c1d..597d20a200d7 100644
--- a/drivers/regulator/ltc3676.c
+++ b/drivers/regulator/ltc3676.c
@@ -357,7 +357,7 @@ static int ltc3676_regulator_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ltc3676_i2c_id[] = {
-	{ "ltc3676" },
+	{ .name = "ltc3676" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc3676_i2c_id);
diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
index 4242fbb7b147..e5cbc09c2d39 100644
--- a/drivers/regulator/max1586.c
+++ b/drivers/regulator/max1586.c
@@ -276,7 +276,7 @@ static int max1586_pmic_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max1586_id[] = {
-	{ "max1586" },
+	{ .name = "max1586" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max1586_id);
diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index fcdd2d0317a5..92594b2915f3 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -301,10 +301,10 @@ static const struct max20086_chip_info max20089_chip_info = {
 };
 
 static const struct i2c_device_id max20086_i2c_id[] = {
-	{ "max20086", (kernel_ulong_t)&max20086_chip_info },
-	{ "max20087", (kernel_ulong_t)&max20087_chip_info },
-	{ "max20088", (kernel_ulong_t)&max20088_chip_info },
-	{ "max20089", (kernel_ulong_t)&max20089_chip_info },
+	{ .name = "max20086", .driver_data = (kernel_ulong_t)&max20086_chip_info },
+	{ .name = "max20087", .driver_data = (kernel_ulong_t)&max20087_chip_info },
+	{ .name = "max20088", .driver_data = (kernel_ulong_t)&max20088_chip_info },
+	{ .name = "max20089", .driver_data = (kernel_ulong_t)&max20089_chip_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, max20086_i2c_id);
diff --git a/drivers/regulator/max20411-regulator.c b/drivers/regulator/max20411-regulator.c
index 6c0ebb970e90..ac7a9aa014aa 100644
--- a/drivers/regulator/max20411-regulator.c
+++ b/drivers/regulator/max20411-regulator.c
@@ -145,7 +145,7 @@ static const struct of_device_id of_max20411_match_tbl[] = {
 MODULE_DEVICE_TABLE(of, of_max20411_match_tbl);
 
 static const struct i2c_device_id max20411_id[] = {
-	{ "max20411" },
+	{ .name = "max20411" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max20411_id);
diff --git a/drivers/regulator/max77503-regulator.c b/drivers/regulator/max77503-regulator.c
index c7c94e868fc1..1cae846f96d0 100644
--- a/drivers/regulator/max77503-regulator.c
+++ b/drivers/regulator/max77503-regulator.c
@@ -107,7 +107,7 @@ static const struct of_device_id of_max77503_match_tbl[] = {
 MODULE_DEVICE_TABLE(of, of_max77503_match_tbl);
 
 static const struct i2c_device_id max77503_regulator_id[] = {
-	{"max77503"},
+	{ .name = "max77503" },
 	{ }
 };
 
diff --git a/drivers/regulator/max77675-regulator.c b/drivers/regulator/max77675-regulator.c
index af3eb7174875..4fee6d6e4b07 100644
--- a/drivers/regulator/max77675-regulator.c
+++ b/drivers/regulator/max77675-regulator.c
@@ -1029,7 +1029,7 @@ static int max77675_regulator_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max77675_i2c_id[] = {
-	{ "max77675", 0 },
+	{ .name = "max77675", .driver_data = 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77675_i2c_id);
diff --git a/drivers/regulator/max77826-regulator.c b/drivers/regulator/max77826-regulator.c
index 310bc8ee7af8..8b60a9fcab44 100644
--- a/drivers/regulator/max77826-regulator.c
+++ b/drivers/regulator/max77826-regulator.c
@@ -278,7 +278,7 @@ static const struct of_device_id __maybe_unused max77826_of_match[] = {
 MODULE_DEVICE_TABLE(of, max77826_of_match);
 
 static const struct i2c_device_id max77826_id[] = {
-	{ "max77826-regulator" },
+	{ .name = "max77826-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, max77826_id);
diff --git a/drivers/regulator/max77838-regulator.c b/drivers/regulator/max77838-regulator.c
index 9faddbfd25fd..765756fdcf6e 100644
--- a/drivers/regulator/max77838-regulator.c
+++ b/drivers/regulator/max77838-regulator.c
@@ -200,7 +200,7 @@ static const struct of_device_id __maybe_unused max77838_of_match[] = {
 MODULE_DEVICE_TABLE(of, max77838_of_match);
 
 static const struct i2c_device_id max77838_id[] = {
-	{ "max77838-regulator" },
+	{ .name = "max77838-regulator" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, max77838_id);
diff --git a/drivers/regulator/max77857-regulator.c b/drivers/regulator/max77857-regulator.c
index 1216cc3a6f72..f1410f845653 100644
--- a/drivers/regulator/max77857-regulator.c
+++ b/drivers/regulator/max77857-regulator.c
@@ -428,10 +428,10 @@ static int max77857_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max77857_id[] = {
-	{ "max77831", ID_MAX77831 },
-	{ "max77857", ID_MAX77857 },
-	{ "max77859", ID_MAX77859 },
-	{ "max77859a", ID_MAX77859A },
+	{ .name = "max77831", .driver_data = ID_MAX77831 },
+	{ .name = "max77857", .driver_data = ID_MAX77857 },
+	{ .name = "max77859", .driver_data = ID_MAX77859 },
+	{ .name = "max77859a", .driver_data = ID_MAX77859A },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77857_id);
diff --git a/drivers/regulator/max8649.c b/drivers/regulator/max8649.c
index f57c588bcf28..2d17405242e7 100644
--- a/drivers/regulator/max8649.c
+++ b/drivers/regulator/max8649.c
@@ -240,7 +240,7 @@ static int max8649_regulator_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max8649_id[] = {
-	{ "max8649" },
+	{ .name = "max8649" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max8649_id);
diff --git a/drivers/regulator/max8893.c b/drivers/regulator/max8893.c
index 5a90633d8536..7a0e44a16d49 100644
--- a/drivers/regulator/max8893.c
+++ b/drivers/regulator/max8893.c
@@ -162,7 +162,7 @@ MODULE_DEVICE_TABLE(of, max8893_dt_match);
 #endif
 
 static const struct i2c_device_id max8893_ids[] = {
-	{ "max8893" },
+	{ .name = "max8893" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max8893_ids);
diff --git a/drivers/regulator/max8952.c b/drivers/regulator/max8952.c
index 1f94315bfb02..f8b91a5701f3 100644
--- a/drivers/regulator/max8952.c
+++ b/drivers/regulator/max8952.c
@@ -307,7 +307,7 @@ static int max8952_pmic_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max8952_ids[] = {
-	{ "max8952" },
+	{ .name = "max8952" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max8952_ids);
diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index b34ae0bbba6f..89fd79d446f7 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -578,7 +578,7 @@ static const struct dev_pm_ops mcp16502_pm_ops = {
 };
 #endif
 static const struct i2c_device_id mcp16502_i2c_id[] = {
-	{ "mcp16502" },
+	{ .name = "mcp16502" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcp16502_i2c_id);
diff --git a/drivers/regulator/mp5416.c b/drivers/regulator/mp5416.c
index e6794190cb68..2948635b1b9f 100644
--- a/drivers/regulator/mp5416.c
+++ b/drivers/regulator/mp5416.c
@@ -228,9 +228,9 @@ static const struct of_device_id mp5416_of_match[] = {
 MODULE_DEVICE_TABLE(of, mp5416_of_match);
 
 static const struct i2c_device_id mp5416_id[] = {
-	{ "mp5416", (kernel_ulong_t)&mp5416_regulators_desc },
-	{ "mp5496", (kernel_ulong_t)&mp5496_regulators_desc },
-	{}
+	{ .name = "mp5416", .driver_data = (kernel_ulong_t)&mp5416_regulators_desc },
+	{ .name = "mp5496", .driver_data = (kernel_ulong_t)&mp5496_regulators_desc },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp5416_id);
 
diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index ab105ffd6a2e..9a708e826d93 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -386,8 +386,8 @@ static const struct of_device_id mp8859_dt_id[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, mp8859_dt_id);
 
 static const struct i2c_device_id mp8859_i2c_id[] = {
-	{ "mp8859", },
-	{  },
+	{ .name = "mp8859" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp8859_i2c_id);
 
diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index 9ad16b04c913..e0b62bc02a1e 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -348,9 +348,9 @@ static const struct of_device_id mp886x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mp886x_dt_ids);
 
 static const struct i2c_device_id mp886x_id[] = {
-	{ "mp8867", (kernel_ulong_t)&mp8867_ci },
-	{ "mp8869", (kernel_ulong_t)&mp8869_ci },
-	{ },
+	{ .name = "mp8867", .driver_data = (kernel_ulong_t)&mp8867_ci },
+	{ .name = "mp8869", .driver_data = (kernel_ulong_t)&mp8869_ci },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp886x_id);
 
diff --git a/drivers/regulator/mpq7920.c b/drivers/regulator/mpq7920.c
index a670e09891e7..0cbc17deb1d1 100644
--- a/drivers/regulator/mpq7920.c
+++ b/drivers/regulator/mpq7920.c
@@ -309,8 +309,8 @@ static const struct of_device_id mpq7920_of_match[] = {
 MODULE_DEVICE_TABLE(of, mpq7920_of_match);
 
 static const struct i2c_device_id mpq7920_id[] = {
-	{ "mpq7920", },
-	{ },
+	{ .name = "mpq7920" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mpq7920_id);
 
diff --git a/drivers/regulator/mt6311-regulator.c b/drivers/regulator/mt6311-regulator.c
index 2ebc1c0b5e6f..1d457d1fdf23 100644
--- a/drivers/regulator/mt6311-regulator.c
+++ b/drivers/regulator/mt6311-regulator.c
@@ -133,8 +133,8 @@ static int mt6311_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id mt6311_i2c_id[] = {
-	{ "mt6311" },
-	{}
+	{ .name = "mt6311" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt6311_i2c_id);
 
diff --git a/drivers/regulator/pf530x-regulator.c b/drivers/regulator/pf530x-regulator.c
index f789c4b6a499..e7b13d60106b 100644
--- a/drivers/regulator/pf530x-regulator.c
+++ b/drivers/regulator/pf530x-regulator.c
@@ -353,10 +353,10 @@ static const struct of_device_id pf530x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pf530x_dt_ids);
 
 static const struct i2c_device_id pf530x_i2c_id[] = {
-	{ "pf5300", 0 },
-	{ "pf5301", 0 },
-	{ "pf5302", 0 },
-	{},
+	{ .name = "pf5300", .driver_data = 0 },
+	{ .name = "pf5301", .driver_data = 0 },
+	{ .name = "pf5302", .driver_data = 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pf530x_i2c_id);
 
diff --git a/drivers/regulator/pf8x00-regulator.c b/drivers/regulator/pf8x00-regulator.c
index ea3611de42b4..c938b4632ef1 100644
--- a/drivers/regulator/pf8x00-regulator.c
+++ b/drivers/regulator/pf8x00-regulator.c
@@ -596,10 +596,10 @@ static const struct of_device_id pf8x00_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pf8x00_dt_ids);
 
 static const struct i2c_device_id pf8x00_i2c_id[] = {
-	{ "pf8100" },
-	{ "pf8121a" },
-	{ "pf8200" },
-	{}
+	{ .name = "pf8100" },
+	{ .name = "pf8121a" },
+	{ .name = "pf8200" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pf8x00_i2c_id);
 
diff --git a/drivers/regulator/pv88060-regulator.c b/drivers/regulator/pv88060-regulator.c
index ae1c4b9daaa1..375d9e759c47 100644
--- a/drivers/regulator/pv88060-regulator.c
+++ b/drivers/regulator/pv88060-regulator.c
@@ -360,8 +360,8 @@ static int pv88060_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id pv88060_i2c_id[] = {
-	{ "pv88060" },
-	{}
+	{ .name = "pv88060" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pv88060_i2c_id);
 
diff --git a/drivers/regulator/pv88080-regulator.c b/drivers/regulator/pv88080-regulator.c
index 9fe539a34786..3dc48d059791 100644
--- a/drivers/regulator/pv88080-regulator.c
+++ b/drivers/regulator/pv88080-regulator.c
@@ -523,10 +523,10 @@ static const struct of_device_id pv88080_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, pv88080_dt_ids);
 
 static const struct i2c_device_id pv88080_i2c_id[] = {
-	{ "pv88080",    (kernel_ulong_t)&pv88080_aa_regs },
-	{ "pv88080-aa", (kernel_ulong_t)&pv88080_aa_regs },
-	{ "pv88080-ba", (kernel_ulong_t)&pv88080_ba_regs },
-	{}
+	{ .name = "pv88080", .driver_data = (kernel_ulong_t)&pv88080_aa_regs },
+	{ .name = "pv88080-aa", .driver_data = (kernel_ulong_t)&pv88080_aa_regs },
+	{ .name = "pv88080-ba", .driver_data = (kernel_ulong_t)&pv88080_ba_regs },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pv88080_i2c_id);
 
diff --git a/drivers/regulator/pv88090-regulator.c b/drivers/regulator/pv88090-regulator.c
index 3c48757bbbda..ca5eeb5dfe62 100644
--- a/drivers/regulator/pv88090-regulator.c
+++ b/drivers/regulator/pv88090-regulator.c
@@ -381,8 +381,8 @@ static int pv88090_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id pv88090_i2c_id[] = {
-	{ "pv88090" },
-	{}
+	{ .name = "pv88090" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pv88090_i2c_id);
 
diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/slg51000-regulator.c
index 3bbd4a29e6d3..d682764cdbf8 100644
--- a/drivers/regulator/slg51000-regulator.c
+++ b/drivers/regulator/slg51000-regulator.c
@@ -497,8 +497,8 @@ static int slg51000_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id slg51000_i2c_id[] = {
-	{ "slg51000" },
-	{}
+	{ .name = "slg51000" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, slg51000_i2c_id);
 
diff --git a/drivers/regulator/sy8106a-regulator.c b/drivers/regulator/sy8106a-regulator.c
index d79a4cc25a0d..b2b835c60262 100644
--- a/drivers/regulator/sy8106a-regulator.c
+++ b/drivers/regulator/sy8106a-regulator.c
@@ -130,7 +130,7 @@ static const struct of_device_id sy8106a_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, sy8106a_i2c_of_match);
 
 static const struct i2c_device_id sy8106a_i2c_id[] = {
-	{ "sy8106a" },
+	{ .name = "sy8106a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sy8106a_i2c_id);
diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
index 5bec84db25f1..3f07e7da90cb 100644
--- a/drivers/regulator/sy8824x.c
+++ b/drivers/regulator/sy8824x.c
@@ -213,10 +213,10 @@ static const struct of_device_id sy8824_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
 
 static const struct i2c_device_id sy8824_id[] = {
-	{ "sy8824c", (kernel_ulong_t)&sy8824c_cfg },
-	{ "sy8824e", (kernel_ulong_t)&sy8824e_cfg },
-	{ "sy20276", (kernel_ulong_t)&sy20276_cfg },
-	{ "sy20278", (kernel_ulong_t)&sy20278_cfg },
+	{ .name = "sy8824c", .driver_data = (kernel_ulong_t)&sy8824c_cfg },
+	{ .name = "sy8824e", .driver_data = (kernel_ulong_t)&sy8824e_cfg },
+	{ .name = "sy20276", .driver_data = (kernel_ulong_t)&sy20276_cfg },
+	{ .name = "sy20278", .driver_data = (kernel_ulong_t)&sy20278_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sy8824_id);
diff --git a/drivers/regulator/sy8827n.c b/drivers/regulator/sy8827n.c
index 0b811514782f..a1cac8cc3d96 100644
--- a/drivers/regulator/sy8827n.c
+++ b/drivers/regulator/sy8827n.c
@@ -180,8 +180,8 @@ static const struct of_device_id sy8827n_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, sy8827n_dt_ids);
 
 static const struct i2c_device_id sy8827n_id[] = {
-	{ "sy8827n", },
-	{ },
+	{ .name = "sy8827n" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sy8827n_id);
 
diff --git a/drivers/regulator/tps6286x-regulator.c b/drivers/regulator/tps6286x-regulator.c
index e29aab06bf79..1ab53bee9f6e 100644
--- a/drivers/regulator/tps6286x-regulator.c
+++ b/drivers/regulator/tps6286x-regulator.c
@@ -145,11 +145,11 @@ static int tps6286x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tps6286x_i2c_id[] = {
-	{ "tps62864" },
-	{ "tps62866" },
-	{ "tps62868" },
-	{ "tps62869" },
-	{}
+	{ .name = "tps62864" },
+	{ .name = "tps62866" },
+	{ .name = "tps62868" },
+	{ .name = "tps62869" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6286x_i2c_id);
 
diff --git a/drivers/regulator/tps6287x-regulator.c b/drivers/regulator/tps6287x-regulator.c
index 7b7d3ae39206..c0bc4a6192c4 100644
--- a/drivers/regulator/tps6287x-regulator.c
+++ b/drivers/regulator/tps6287x-regulator.c
@@ -229,11 +229,11 @@ static const struct of_device_id tps6287x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, tps6287x_dt_ids);
 
 static const struct i2c_device_id tps6287x_i2c_id[] = {
-	{ "tps62870" },
-	{ "tps62871" },
-	{ "tps62872" },
-	{ "tps62873" },
-	{}
+	{ .name = "tps62870" },
+	{ .name = "tps62871" },
+	{ .name = "tps62872" },
+	{ .name = "tps62873" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, tps6287x_i2c_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


