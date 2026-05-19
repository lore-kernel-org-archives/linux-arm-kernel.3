Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D811CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 00:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=; b=c+Mz0uXNULojM8b6pj2FC6njru
	uj99Gtr0G4lB9bxcrIv0BOAj0EBtol9+TRwhB2nIW1+Ft4DWj+41ShNk67ia26fm0/zmrB5NB0WhG
	YOsB/OQFAaS6T2y8sqVwdCYbZYd8Fqj94Ie35NJCUKUDnrtm8QeO2ixY7QG9QRUPGtYkktgYt0k3L
	5dMWR9o/++rZB0DcmFJDkDFfzoRfMDo3yqfRlkOeTL2CmI8LN1ErHtcATIC+P1vpQvC2zheNcckrL
	pbxaskTjD0OSts0M261UswY33uijnUFxY8Ap+KxDte4MUwonXFeIUdgk8b63eNXrt+9qed7SuIweh
	ZWFANxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8VH-0000000HHpu-1Ryt;
	Tue, 19 May 2026 00:40:11 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8VF-0000000HHpU-2Mmm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 00:40:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so1194321a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151209; x=1779756009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=ma9GFah2Xfra7AqhDCQ3AIpRMjl8w9zNzftMOCCmEAk0D47TbGDirWVWi2uYoiPACS
         ejd7UAyW/xCr1jD/UNuSXLepiWsbfoz1mn/ZFZ+mWCmQf5ydOJeAucAqmxUU8SiPROwK
         BNxusa7mJ7rcCendmOrq4eFZYs6QzN3KdHCs4x3tLM4K5jn608dztAdFJpyUd8tll67U
         09l6R+rBaEnubqk4iZelSB01KeBHkZRGUj/qg6EOHS4F40Y4qAFO4wE4c41xhRkydARP
         DVR3Gg2cs8is3EFhMd8pZpL9MJlLGuwHDnXIn8jFZwolWxICQbbX4frS/WmHu3U0Uk0G
         zBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151209; x=1779756009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL8R42vUa8OZgmzVrA9ew7tVcpkru1FmRyxgoHHAOI=;
        b=Pca9igJDaflzYaLqDPPlSZktPi/AlamQZWeDk6TSQwKQp6qnwUDxvLopt+qT/T2iMx
         ZFXKaL26f02RI4+rc95y5Yc7Y36XJh8zaXePWg+M1ErLs7ZnZYEChv/cDPYqwj5Q0lqv
         Vql1dxI2FnLy0TzkDaY5ZlFIExOa/jbENFwh6Af//6Lly89R3qR8/APZLei4P78WIFWh
         11ktQsA6CDkl5xZGsELurfvsCGusXJ9tvZVTHjLFuHrum5ppl0ja9fhiYL+PvC/T1Gs6
         FO4mSJKuHiiEHgdho9javEomhu4Pv709K+tmQVDRCVZA3r4DyVXmnMEHdWg99TN6EEMB
         4TSA==
X-Forwarded-Encrypted: i=1; AFNElJ9033d55kMI5SNzJVCYIMgIsNY0m8IXNq2Lo2jcGMGMa9XqUUl6GmxqeGMNxMhXsg5M88T/yC10WirZMwL+y1Lh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/5hazR0FASWrFAmkDxW3SqtUeMvsg38+XOFM4h4s8IpKs90bD
	AdsQV7chv4lEdFqNplnI/JFwRFghDkPzbKR9ufx4GxstnDv7bvATAXJn
X-Gm-Gg: Acq92OElRWe8qbw4btp4ZP0mr2RNeMcxJ0GfREA6CAjF+3sk1L5uQtN8MVqL8FUqJ87
	aTx0g3g3wer20clvpMkVSnZTE8TbF4hAbClVLo+o8vWQdy3MNOfe1gYgHiuzAXTLaMH0VKx6qVQ
	2TqaCGPLUnPRhbxmMJBv+Cghe+2EF2RDhU5DwlW65M6vHfLByAmYGQQ05EUVIc03NLWn+Y9qr5m
	UIi60eCGsh0HiUisJMuwht8vZVZBh8fsncjerlOaKTwXA9wIgcSaV1puxodmcj43dyiNfVndXgP
	ZXcEF8ynAguNWUalWDK0YnYb7ZCC0NuIPzwDNF3M7KAv1IxaAk4bIJhKtZz7bDjoBnS95x8DN3F
	ZngsSu74U+m8MHINXin94FnR+rAalxpGDfbnEShBsdIJ+ENifBLKxYRZTyfc8Bld+ogTXPwb9cx
	LigQQNUn5cK4Z4nv7watDDaIw6IN0/fBMBaF/SZU4e4abHHY6DjcD5gLx4GSyIVfVKhAQxO+ODc
	0UxAXIjx85u/GmxXyz6jI3WHlBxciPvSGiZwjTjTSQjug==
X-Received: by 2002:a05:6a20:72ab:b0:3a3:171f:6aff with SMTP id adf61e73a8af0-3b22e6685edmr20892462637.2.1779151208559;
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb062695sm14473479a12.4.2026.05.18.17.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:40:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Date: Mon, 18 May 2026 17:39:50 -0700
Message-ID: <20260519003950.626727-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_174009_605045_607D54FF 
X-CRM114-Status: GOOD (  13.60  )
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

Use of_device_get_match_data() to fetch the RTC CCU match data directly
instead of open-coding an of_match_device() lookup.

This also lets the driver drop the of_device.h include.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..a3cf0dde05be 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>

 #include <linux/clk/sunxi-ng.h>

@@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
 	struct clk *ext_osc32k_clk = NULL;
-	const struct of_device_id *match;

 	/* This driver is only used for newer variants of the hardware. */
-	match = of_match_device(sun6i_rtc_ccu_match, dev);
-	if (!match)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return 0;

-	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;

 	if (data->have_ext_osc32k) {
--
2.54.0


