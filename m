Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6341FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/+rrjhna+/Vax4rD8HC3TVO3EBLeff26p2DbcJCfS4=; b=W0pJd4rMzUx/jWwV8y2qu/PGgs
	0cabkMxrAIdxwVNQb71lwdssixp60pkdjRNmWZ16gH9CjcurrOvWH/irVXbNzzIOik9qtZvtghpNL
	eUaymUmT+utQJ6IhNuR/Zh7NNmLshAAnXIMGD+oQsrwpj533Tr88P/EqaJM3jtF+bZq43DxJRHWSP
	1SU5odJw6hoBZdYDIBCqqBMaqr4+w1Jo5X1TDUkezdwejgTxM9GuUUHnEBL2xU8bfsFdpvHZ0KtfQ
	XF0ZZczNQhHGVB1NB35MgQ/F2s3oOIMcprQozun4VhXETX5ezC9cxuM9CfEuHJU7oHiwnwB/BhMJP
	wsu3yl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUKP-0000000BZce-1mme;
	Wed, 11 Jun 2025 22:53:53 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRuM-0000000B9Dy-0CLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:18:51 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-400fa6eafa9so154079b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673129; x=1750277929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/+rrjhna+/Vax4rD8HC3TVO3EBLeff26p2DbcJCfS4=;
        b=07/elMh2WpObbAEtBOBDCVxvhQ752pn7iT5auVkTS+tIsJhq1JVVCag8GDCEFiBMSL
         TxF6WV5d04e+V6HvqrILNf2GUeCvoVjf0TSKGOAaIkXNcr7ul7MNZbWaXbC8BGvXXWSl
         zpQddTcGIAOAxAwsPBZduVFg12yPqL1L+J3WwXCUWRtURsLnTEzCppdCJUsFlnRc/PWe
         UeZj7mwkqVcu1pnkK5Xi0kTZ/UPQBgOvkvkj3Zgl88Ep0nkfhLhzoZIaa3mpFfmMkz3c
         ZRKJn7bQ9aNPUtTjpH/DG7fIHF45JRSXAsN2bGRLxuFhYHnZgg+s05OUt2mBBFUbKD1A
         ubQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673129; x=1750277929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/+rrjhna+/Vax4rD8HC3TVO3EBLeff26p2DbcJCfS4=;
        b=OFItczQUHQqKP9SxDUzaeqPtt8PzlPPhkB/eecJ94Z16l/i8r4o94H2y8XFZFQy7HU
         7P63K35fhJALkZtth3V8ZV2X3T45lZvmxxO3VVNGLeVf+10yZY0xXigUz7Jq6zGuyIbf
         aMA5C3mDD0wdgPvm5o4IN42kOVAoZ1lkBVzWkkUy46UBSX/WjowzSJHG1E8I2C3PlIoI
         RZvWdAobn2Cqe2aKOkvfHXiHclYbxWc5x7VkDPKVxuHwADDDqh5p2bWw33giT/P9rILP
         GQboOVDPE8Im3dXzHQOgjBrETJjn+Tgpx4jJ2xHIBJTE0ueAlFZwPCV+pVckqPhIs85Z
         b1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEYeL1cdd6yaOi7COgrS5emL9NyFnThDKDxVdFjnrAv+PYizjVeKiyBTDkPLcDdyjTgOPDqu8J9TSeCyE0Z18t@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrg/oNFFhViuwqMo+I9O6iPHvvojwutOAdXi+Mm0nPVC2TbfAX
	HR1DPOeWAi8EVWCo115pG7bBMhAtgNRc4AtWqvf5exeTKZUy4c3UXhWajGPjNBsfnT4=
X-Gm-Gg: ASbGnctr6j+y/mil56Gj4YkDuLTd4vHaveMPx8qZ2N0+Yanv2KIc56wkeQbwsTJxNJJ
	k5etHrGsYjzY1bkQzlP/evQ7VSExEUHHyhPTFouTUODIVad629VD46bJyiPKcJWfuil9wtW+Ycy
	MIjQs+0LVG3SZmsgXFFHY2+2lkNYuhCS51GXj9WbS9Pi10idQRIfoK09+T9QnZxZK8AEKy0HURi
	9J71BZPC/QUsJXrfK0EyqPoY6LdaAoaGrkkiGw5Jfu1YfdJekHdNGJDLEHffUmwBfUU4X1Me3LA
	BbniyKr2ARZUf4KIJFqQt3D2bOIh3j22fB/MmaaazpE46QRc0hIPkwgv9FLCN+RWqVam
X-Google-Smtp-Source: AGHT+IGD+DufvyN+5hzy7lg7VM5lfJsR43tAUQCYEJ3xhmONm3bDhzEoWmouYj722aMk3p5q+QWyrQ==
X-Received: by 2002:a05:6808:80a6:b0:406:6d79:49d2 with SMTP id 5614622812f47-40a5d14fa9emr3327936b6e.26.1749673129216;
        Wed, 11 Jun 2025 13:18:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 15:18:11 -0500
Subject: [PATCH v4 3/3] bus: ts-nbus: use bitmap_set_value8()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=X+l1siqRVwIi6D1PzhyWFvmI4xdYsdCpoCSsUZIeM9Y=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSY/IJ6nkRrANAy2h70ciXzsWX6tvkao1sxD
 4OB69BklISJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkmAAKCRDCzCAB/wGP
 wANcB/wM1esoiB5PaiuSRQBoxKnk8REf7zJM4aV0H6/M2/3mbM0ehJVngqtwdJ0thNdO+U0LWG6
 XdHZpt4wJR1rc00U1rqILg0nxcEbrpOJ06KpGyloyzjGzRnx/JNr6ZIzsdNFGh7juRM1HaD7h5Z
 t47OOLSzgr1s9sPy03/lg3kuOK6BKfkZy8h00F0HnfgzzSFvFKxBn7Z8Ct4jyCVpDiq4GaUwpej
 wH2z0XaWliiQPfYo5AB/bGlE2jcnSmAn5hleY65LDObf1MpSHQaUT8/GGXYZHO1Jnl8iGZvFYx+
 7212QTKdyNcP98xvaCHkgAobE2zpI7HZeiHiP/8C6jzd4AnQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131850_091005_58D18321 
X-CRM114-Status: GOOD (  13.51  )
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

Use bitmap_set_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

The bitmap has to be zero-initialized now to avoid a compiler warning
since bitmap_set_value8() does read/modify/write rather than just the
write that this is replacing.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
v4 changes:
- Fix typo s/get/set/ in commit message
- Zero-initialize the bitmap to avoid compiler warning
---
 drivers/bus/ts-nbus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..17540034e64a4e591ea61b0b4eef86a2081b02f5 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -105,9 +106,9 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
  */
 static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = 0;
+	bitmap_set_value8(values, byte, 0);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -149,9 +150,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0


