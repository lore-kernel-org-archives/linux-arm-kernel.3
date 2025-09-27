Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B2CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=; b=F3466ArPVjzHZn0sUN/Xe+osor
	wykObW8lT52c/hqiJK+34BItmUDwq441VG5tVdndcW6y06i58qE6ErVYyJfTS4LIW0kRJlzcle6TK
	eowQDdyWzUWIcfnDgYsgLKMMwkoY+LyCzYJlHXNZRgyGoBZY96tVSpMWDNs6UI9ucqR6ugAi56ZM4
	gtd3g2ob6hCHPeTVvojGG0nZUxiI6yXCMCOsAd3oPpIb3iyf6nnPNnNT2QcZ41hIgVcUV2p/IuQjJ
	zFRPVfyxLpZOmhgJR6W1nhr/O5zW+wi+lzpXlt96aLy9N3FEMT65LyjghZzJs5g12zn2ieTZxju7D
	TjNoYbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UZc-00000009rnO-2xig;
	Sat, 27 Sep 2025 13:02:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2UZZ-00000009rkl-2L3e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 13:02:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so29328475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758978164; x=1759582964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
        b=aH+Ue3QLx6bRDlrMqC4nUnWPcWcfC+ytw24vnjlMofhrsjdnOnJ6pnEqDr5JA84fyW
         fgO0RcIQETIs/1tjHUV/joxyS/c5bYUym960uat04wTV3RtR9wssX+e+7D41VIBB4z2S
         K1Fv3xiZqwzPWyAT31fk+QJNRYIyJXiNJoF+ZRVuc5bDSSupXNjvyFEqarjJCQAKlbPz
         dl1q4w6ZS4N3Nk1kTYEmuy6X5IJo8UQh0be6FYaMw5q3mjaMUNKpD2OQpdsTOlgfaNIP
         k9yzCsG66lKXjminhFOEn5zQQcBdPnAHz/mrmazN2LeVCA+xfgS6/q+IdrS2bxJqyJ3l
         eMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758978164; x=1759582964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5S/zRBKTkSInAQ7R7zklKxxLF5akYgcZwi1P/3w8im8=;
        b=S9FBoMM9/fsJ0Uh0YZXxhCsiHdWdVDRLCSiGh3aMhA1E7Gmfx0ksXtYYv8iIyLKPKp
         HhidyMqSyWV9zZ+bSFC9BjypDudjctdlqtJU0j5HWSW7rCRkpmCnk71U4FJd/HkjEgxr
         s1Upzeuv6LENqIiyovGSUQ+yCy9ezRuxb5p8SOfRMqdVBBwUwOn0kXrt7N73nZAjQLFl
         pL+tRD0mEb/uBlyGidjW5QF4ISWnovLAsg3IGIbFAnBXveWOtD4t6z0NDCs7CzC0TuPq
         qAEO+HeOFnJ/vWeQ3PVlkNa9eiGyr3HuXOvaWj4PDm5ir+uZHaMS4d1/piXE79QsoEOO
         ql5A==
X-Forwarded-Encrypted: i=1; AJvYcCWaRisJN/Z6ofTyAy/hPGSxdlbFIZG59djpdnyshJtespEh2oWLelX603zGIdyftM+F/lSdHXRD9ZiAPlw6jMf2@lists.infradead.org
X-Gm-Message-State: AOJu0YzxgjCZkwHJFtasx5AQjiI125gobdjEO6oJVk9sp4WwDwyZuhXe
	5iZSlh3KONnrvGJ6O9gPJXragc5T992pgkfiAMwj+SzTZfHl6uknik0z
X-Gm-Gg: ASbGncso6cHW4tqcTB0xNUgeym2eZJxS85P825F9xRHVQHB0r0VPykD6eKVpbYIYBYb
	5zPVzngnnA6zMBGEnouUANwChCSopYsPTA3CRdGkop3tldWJfnPGyl9zsdje4W1FAu4EHp4QXfi
	6cZpHO/Q7sYHeFbz+YeVGWJBaLKNZHAOfart3TwLJjaD9KU31fCkmL+Z9pyeRnyB2jq4/gNxoyI
	OVbLBs1N5ufbFmQViyPM01uMpflInNR7vRL0sdIPH2YqLaohycbm7at8XgKtKQHHNDH7qckHHaB
	vSYcF3UF+4OdLBlyOyZVwBiPeYR0EZOsHoxZ5Nj0/V9r/5wxkL8W6SXvG35/ZUWd0wSVyuOZ045
	LnSl3iaXULwYiAXJ64Dg92IQAwiao/8pyMo8yCQ==
X-Google-Smtp-Source: AGHT+IEylPzuTSyMe4S/LKg6ZM9MgQ/hgdwD1nLSuiRnhYfLcu58MW722RoLbdkug9nm8AiwOWmzHg==
X-Received: by 2002:a05:600c:3105:b0:46e:1fb9:5497 with SMTP id 5b1f17b1804b1-46e329e4d87mr104992895e9.18.1758978163470;
        Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac5basm177274005e9.7.2025.09.27.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 06:02:43 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH] drm/meson: add support for 2560x1440 resolution output
Date: Sat, 27 Sep 2025 13:02:39 +0000
Message-Id: <20250927130239.825060-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_060245_617222_340D4708 
X-CRM114-Status: GOOD (  12.05  )
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

From: Dongjin Kim <tobetter@gmail.com>

Add support for Quad HD (QHD) 2560x1440 resolution output. Timings
have been adapted from the vendor kernel.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index dfe0c28a0f05..f5385b3e3796 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -357,6 +357,8 @@ enum {
 	MESON_VCLK_HDMI_594000,
 /* 2970 /1 /1 /1 /5 /1  => /1 /2 */
 	MESON_VCLK_HDMI_594000_YUV420,
+/* 4830 /2 /1 /2 /5 /1  => /1 /1 */
+	MESON_VCLK_HDMI_241500,
 };
 
 struct meson_vclk_params {
@@ -467,6 +469,18 @@ struct meson_vclk_params {
 		.vid_pll_div = VID_PLL_DIV_5,
 		.vclk_div = 1,
 	},
+	[MESON_VCLK_HDMI_241500] = {
+		.pll_freq = 4830000000,
+		.phy_freq = 2415000000,
+		.venc_freq = 241500000,
+		.vclk_freq = 241500000,
+		.pixel_freq = 241500000,
+		.pll_od1 = 2,
+		.pll_od2 = 1,
+		.pll_od3 = 2,
+		.vid_pll_div = VID_PLL_DIV_5,
+		.vclk_div = 1,
+	},
 	{ /* sentinel */ },
 };
 
@@ -894,6 +908,10 @@ static void meson_vclk_set(struct meson_drm *priv,
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x8148 : 0x10000;
 			break;
+		case 4830000:
+			m = 0xc9;
+			frac = 0xd560;
+			break;
 		}
 
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
-- 
2.34.1


