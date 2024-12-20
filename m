Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC3E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW+UtVxBTIei8COHkRsDNzEfLN3gFvFH+d/3sNPCK9c=; b=kEq8g+xb4El8UqFjSFU0cGKUD8
	uK1mpxEXxDMosAWzZrhriGcK7h4H1YVzfXYlzX/QuZrdB+H4c+Qp893z4t5rho7RS5xTejgA63LmE
	cyh8bnRHNLM2EtdR0RyuunO/BMDlxWb64ihrnnOwaj3seJVhBzmbDk+IeLjTJz7U09hpedBt5RX8i
	IULEuf2uDJ5ovHz5dWsqGpQvtPzyB3chqq0cWO9Rf/7JXbdRf6PKGHxKmAQMdR6RFrbxFpDPY+/Rb
	O67CberpPbXC8mcRpK4beUWZ6b319uTxtUnaTS+HvHQ2kT4fATNV41U5Q+aBcpDckwHGBcDNtObNZ
	NzcvzA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavb-00000004g4h-3kgE;
	Fri, 20 Dec 2024 11:12:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaCc-00000004aIN-1d4X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:25:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3862a921123so1221953f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690349; x=1735295149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tW+UtVxBTIei8COHkRsDNzEfLN3gFvFH+d/3sNPCK9c=;
        b=zhVj26d37F3YREMrYBFXjqNea4unzhAOZ/S8WkJmhmnoHTOS9K3WDgy9PWv4+NExEw
         uOyZQZmrQ1kC6gXj3qBEpBoXr05E3ZPVHjlgKyvYeP/kq5nOiqgrtCxQ4rnvFBgoMnZz
         Ggvrh7AXqtt5cOASJ/1EZyGlGm3G7x0J7a2QyP35O4eM49BbWAEulUUsCBaViO+8wOfH
         SwCAD8ukgzvi3wTkB9QomZwbvA5rzNvfrONIWyH+M8OudikBxLD15WDxV1FCAGlUxucS
         T57bIDFA2AUlzp2ihTGNL0pEwp+1iZKWwflN4LZJ1/1zqxHsNAQM1Vvvi+PsYNqU3zU8
         Wmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690349; x=1735295149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW+UtVxBTIei8COHkRsDNzEfLN3gFvFH+d/3sNPCK9c=;
        b=huJE3AJ2/ntey0AdS66DbyQ6AsZJUzuJ0Dkz9I5xahTtPG0y0CsZ409R12bJxmNRv4
         LdaUCUB+I5fjcdkzWYE6e9Qnhv9PGP5W/eoPb/PWKwJp+dEbIgzjn3FQCjJ9ya5nOl2M
         gx3+HYnK+QyVKF1n/YzfojyIKUwiAePpNra2gh3Xn5g8qSUnoFV1fy6AzFz9N+7Utyu/
         w/N4v2lHyOg49SPlYUm+SoZeTOH3fo3bLWAwsJ2jPl9frm4ljx/GTifrIjAAyEE+ojyi
         0cxjgwpyxoHqfg7oCxEue/WuRaZfOyCQCWxF0N4+OQgWbMfNKw/yZUfWqy98nTvAka3v
         rC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqOiFteSrkLYEPSwuCQ3PARfqsRS6A4NSM2XkoBlwZTcHV6QixeFOsWwIrTzdy7KYVDvsxviiXQJ23cLoSSTiP@lists.infradead.org
X-Gm-Message-State: AOJu0YzszNqB/spPQUGlkP8hyStJLXhE54S+uUmge4gitsSgEVvW3V8X
	avXQQTjr/Viqf68DLUZlnkkAq/5RomdHScWkWkPeR2Ul442f/37sGMJ+X2NK9wM=
X-Gm-Gg: ASbGncs3uLlHD5LwsbEhTAsojVawHfha43DQCoK6oY9hEko22zyrceeNKWGHVbA1SUo
	ED883gKGYViIzXsQtIIJ1uiEQ6kkUyDXj0Cqd/VW84IZKhKTUsfWCgSNKtmOK9l1W8zEuMYBOR9
	qB/5Z/CE/RdaQ08gfTEjMr6oB7LbJPN/fmPcA7eCBAnbbKrmZoxDQs9NsKtMLvKV8L/NvIYi3LC
	/u0AvLo01uAWE97hnZWyVdlMinFcpfcfm8CQvsnuTkOfMN47UaBvFZmb/MonVTGYnwx0hM=
X-Google-Smtp-Source: AGHT+IHNHc8Exy8WvIm7auYFTudT6vC7NcI8W+IOnuoZKBIcVv9XpVb+nroKXjYEhD1E+1wL9opJ5Q==
X-Received: by 2002:a5d:5e09:0:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a223fc3d0mr2630378f8f.48.1734690348184;
        Fri, 20 Dec 2024 02:25:48 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 11:25:37 +0100
Subject: [PATCH 2/2] clk: amlogic: gxbb: drop non existing 32k clock parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-2-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pjbHjEyvAPQg8xcHFTDpuSFttT8eA1MfiRhiLNmBp+M=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYoWqwNK0m6lGtma3zHCdJr4WdFQbjpstf6M
 NT7ktMFNKWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGKAAKCRDm/A8cN/La
 hUVUD/4isn20TrQjB+fmFaSq1xSlWcpPgFcHvJuxR95RlrgousUI48fqZvhvGIL+njYoZeObqbb
 SHLywnkm04pRxi4Y6Ay7mNTjQ0aTdyjJg6Tdpsg30z8O0r2ANI3lG3E5n4EU0+kwbu+3ySasFeS
 x2naisfqrFsb+X44XwyxFIdilsExWUgnDkwa0viM1GxuIGl7HBucFz/e2kAYnu0az5DR1jXv5hL
 Ljxi+HzcSctiJAovQ3jrrBw/p2jvbzqZGAP2lRDLrKrG3iPjYvtA0e8xAXNZnORmu3flR33KBUM
 aEdKXbCKEhfG7aQq5UJU+pfshiqKbwv770v113dN91SdJdjnUMLc13BPSzN/NZ4+E/6+7JDGQNl
 BbqFB1HspcnKRuAbIzv0HYkqU1CbqQu+WT3FMRGDsoCm9UDQQ27CAXnHPZY9xj3YpfAHlWZmS48
 e1SZC86Q5+dwGao5a4GYy0wOUxgTnxrsKrp8OC8YctSks534oWxskMdGKz1ydCCIXV4S1I+9l6/
 ej0gPrZ3TX+n5lUhg9FCmp/XObOqxAB4GTkwDWmwf/aJ+Jx7DcKneiGbcpYKUz7PGoJd7CTD1bI
 yFdTGbhMH7IDVtc4B8ietbyCfJi/5NLkaRHN1IxVnFevjHQeP3k7n/fv9cd/ZImVHGbHB7Y1DRJ
 kGHADgAUvWjNxoA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022550_437102_E2F51184 
X-CRM114-Status: GOOD (  14.69  )
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

The 32k clock reference a parent 'cts_slow_oscin' with a fixme note saying
that this clock should be provided by AO controller.

The HW probably has this clock but it does not exist at the moment in
any controller implementation. Furthermore, referencing clock by the global
name should be avoided whenever possible.

There is no reason to keep this hack around, at least for now.

Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 62494cf06e7d775bdb18b2242c3d45bf246bdd0e..66f299f6fef1442ead5e978c1d3750b55b800c2e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1266,14 +1266,13 @@ static struct clk_regmap gxbb_cts_i958 = {
 	},
 };
 
+/*
+ * This table skips a clock named 'cts_slow_oscin' in the documentation
+ * This clock does not exist yet in this controller or the AO one
+ */
+static u32 gxbb_32k_clk_parents_val_table[] = { 0, 2, 3 };
 static const struct clk_parent_data gxbb_32k_clk_parent_data[] = {
 	{ .fw_name = "xtal", },
-	/*
-	 * FIXME: This clock is provided by the ao clock controller but the
-	 * clock is not yet part of the binding of this controller, so string
-	 * name must be use to set this parent.
-	 */
-	{ .name = "cts_slow_oscin", .index = -1 },
 	{ .hw = &gxbb_fclk_div3.hw },
 	{ .hw = &gxbb_fclk_div5.hw },
 };
@@ -1283,6 +1282,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.offset = HHI_32K_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 16,
+		.table = gxbb_32k_clk_parents_val_table,
 		},
 	.hw.init = &(struct clk_init_data){
 		.name = "32k_clk_sel",

-- 
2.45.2


