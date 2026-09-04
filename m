Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9373C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRH9NLWj3veDgRtEBUkvu/4GOMF1+Ix0zuaRZ5NgKNI=; b=saCfLprVUk87YSAmdCsbbmFz+a
	Hli/WHP+4YNHtUEfK/VkATQiV8xhUCZyniB9V/ENBDf10LWSh5/cB2XU0EQuz9VBDApMorlKGlw96
	U0t76HwNA6K/+vYhggrjIfXc3NKFbEuz0meMyz7JT057SI2HDDaC2o9gmUKAsY3s8MX6Nvzm2LojB
	yuI96LKlAiKqqvcAuFPcZ35sqK0L2E8Gd1ugcfUwBsLhUyc6IJY/cEzZ8WsS9gtVo0Cju2C159eZg
	EGdGKZWQzg1HTX2JUEhrb0knNtPRPq5k0IARC8Lb6DL1jbWlJiD7PR+eTr5bQ0HnJLL3H4UKqY3UL
	Ty0FfFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rx5-00000001nrt-0kxx;
	Fri, 04 Sep 2026 11:19:23 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rx2-00000001nrO-3jAy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:19:22 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so848206a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520760; x=1789125560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRH9NLWj3veDgRtEBUkvu/4GOMF1+Ix0zuaRZ5NgKNI=;
        b=cnj7V1JwuTpvsCpDgUECmTEzbEpRuZTHDzTKPgsHqINFVbY+LLH5jCT6U4aMrkAENl
         UQJ4lv26lDrhL8cSwKsYrdrwl6n3KVqqoQ4g+yZOlBnQZZCU5nHansmiy/ZPz3PXNRek
         NtofffnnnjjVjcZhYHRnqscYUA2KjRXAB4Llkl0KrohcDhupG48gagcYTRjSU5pZVerh
         ecsuiRfLptcaDrQMp9TWwXEqo0UyIzG67Uu4sZzX43cF9hC0kFNWiyJ1QBBbnK6iKLK6
         a2BmsUKrlvHNOMJEMR2KJeF8hh1H5iZnsMLpqlJVwc1jQMY44EsxP/J4AQKtBUG7VJy7
         kiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520760; x=1789125560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRH9NLWj3veDgRtEBUkvu/4GOMF1+Ix0zuaRZ5NgKNI=;
        b=d6VdojNcwg69yg+Uo9/rMp7qydP/xl2bKXYkqkJBoBlx48ISImzj4w7+6hSqJLi70h
         ncMt/2w1TCVdMBG6+jROOMsIwg5bv5PmvV8F1IzdqbgLuJwi9GqvjL/BJNpRb2Bo7Nzq
         5ZSwiShupQQ3RDVzkEVM0+Cqd6hKZkUUHqBaEWxo5WKHORXO62seFhgrP0gfvfM+8tc9
         N/ZlfAFwObROLOA0ijKR23F3Ob6hqUcXythkidbTevloUEWZWEK/ITB5waWMBX11wEn2
         49+k6zyGQ/gCq0tuGePLYJ4e6tt7xj7MQj7pxSvSoLni9m4zHTVBPLWuIXx0ATmHfmd3
         x4dw==
X-Forwarded-Encrypted: i=1; AKwUvBzBupxGeDjIJgJjbJm7KW0vs6NlPKM13fEcrsZ1qAnVq6xwJn98otJ85ZXumrU4XObE5+LpXZpjVZGiy/SvxJXt@lists.infradead.org
X-Gm-Message-State: AFuF++lwGLYgyZr2EjtE+0CSr2suHW25rIymx8xb1sf8nmptG/YdQevB
	EE0vYCrRBSQfKAXZalGLLaStFujy/iIvGbAPMkippCBIFyI/BfQEfYNu
X-Gm-Gg: AYBFou2bCH6hTv9f8hVlCUcdrgpXYySHucch9nxHCEfobyt4ynKDWk7VVvBJvDTyZ53
	lCPdIPzL7krkHZgZlXCptrLU3K7ECWMpjBDrkL7XAK/fIUPTKecy0rnhZhBopIf7mHE/7zxg/wm
	jYzJqIDyGneSrzbEv/0m34O9eZtFdvwEYy2vzI+OUd4mG4z2GpuadtnGwo8VRd1aLPK9KXN+SI7
	nuNmzqtyu55PzxH9T3yPmq3FdoFIdABr30wnBJLIAvNsQXbr3TzikM48MdGfeHO3iX51BUxFC5D
	R4xRVeWBaS+9+xjnje41TsCIMVLr1A2xAM5BRAHmWUI9/8TeqZTeY4tCGTfLkIizOHE4pxVvYDZ
	aESSIzBATqRX7klnAVpWHtvxza/YDDBtd7LGZ+QmOpuPwReDflQL8OqjLqwshdl+Gk9bWqJ0YG3
	AGHmtNv5QopIqR8kwvGqhYbXmELaV2wYXWB3lVNEkMdpLf4IRe3gIv7veWKx0LKdDtKO1qBtgUy
	zDix7GRQ78IPb7VzsRYUnAt9HgnnTUVtBLhOw==
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr7563823a91.10.1788520759802;
        Fri, 04 Sep 2026 04:19:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5190103eec.29.2026.09.04.04.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:19:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] input: fix typos in comments
Date: Fri,  4 Sep 2026 16:49:07 +0530
Message-ID: <20260904111911.32224-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904111911.32224-1-hemanth.selam@gmail.com>
References: <20260904111911.32224-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041920_927825_C3200AC9 
X-CRM114-Status: GOOD (  18.74  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/input/keyboard/imx_keypad.c        | 2 +-
 drivers/input/keyboard/pxa27x_keypad.c     | 2 +-
 drivers/input/mouse/elantech.h             | 2 +-
 drivers/input/rmi4/rmi_f54.c               | 2 +-
 drivers/input/touchscreen/exc3000.c        | 2 +-
 drivers/input/touchscreen/usbtouchscreen.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index ccde60cd6bb3..9e0898588e06 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -396,7 +396,7 @@ static int imx_keypad_open(struct input_dev *dev)
 
 	imx_keypad_config(keypad);
 
-	/* Sanity control, not all the rows must be actived now. */
+	/* Sanity control, not all the rows must be activated now. */
 	if ((readw(keypad->mmio_base + KPDR) & keypad->rows_en_mask) == 0) {
 		dev_err(&dev->dev,
 			"too many keys pressed, control pins initialisation\n");
diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 4519eecb317b..320021e9d81b 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -522,7 +522,7 @@ static void pxa27x_keypad_config(struct pxa27x_keypad *keypad)
 		direct_key_num = keypad->direct_key_num;
 
 	/*
-	 * Direct keys usage may not start from KP_DKIN0, check the platfrom
+	 * Direct keys usage may not start from KP_DKIN0, check the platform
 	 * mask data to config the specific.
 	 */
 	if (!keypad->direct_key_mask)
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 571e6ca11d33..a2ab57a11b64 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -57,7 +57,7 @@
 
 /*
  * One hard to find application note states that X axis range is 0 to 576
- * and Y axis range is 0 to 384 for harware version 1.
+ * and Y axis range is 0 to 384 for hardware version 1.
  * Edge fuzz might be necessary because of bezel around the touchpad
  */
 #define ETP_EDGE_FUZZ_V1		32
diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 6c6cdec7da9e..43a4e262cd2b 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -193,7 +193,7 @@ static int rmi_f54_request_report(struct rmi_function *fn, u8 report_type)
 
 	/*
 	 * Small delay after disabling interrupts to avoid race condition
-	 * in firmare. This value is a bit higher than absolutely necessary.
+	 * in firmware. This value is a bit higher than absolutely necessary.
 	 * Should be removed once issue is resolved in firmware.
 	 */
 	usleep_range(2000, 3000);
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 037bb35238a3..e18e74781c58 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -406,7 +406,7 @@ static int exc3000_probe(struct i2c_client *client)
 	 * ensures, that the device probe will not fail for temporary issues
 	 * on the bus.  This is not needed for the sysfs calls (userspace
 	 * will receive the error code and can start another query) and
-	 * cannot be done for touch events (but that only means loosing one
+	 * cannot be done for touch events (but that only means losing one
 	 * or two touch events anyways).
 	 */
 	for (retry = 0; retry < 3; retry++) {
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 0bbacb517c28..81d24f5fbcc4 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -51,7 +51,7 @@ static bool hwcalib_xy;
 module_param(hwcalib_xy, bool, 0644);
 MODULE_PARM_DESC(hwcalib_xy, "If set hw-calibrated X/Y are used if available");
 
-/* device specifc data/functions */
+/* device specific data/functions */
 struct usbtouch_usb;
 struct usbtouch_device_info {
 	int min_xc, max_xc;
-- 
2.48.1


