Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF46CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=; b=uuZTT9vHEXf/lMtf7DkafkWYji
	TF/CxD0s4Vr9l1EZoW4jCoJPc0KTq0VTmcLV8eF8nAfhVfCnWBp54Iu0jK28lFHbdNMjl4hndQZsV
	qAb1CcBXD7ThcVJxTY0jxTaZtz8LaDIb2Aka3asiAVVDRvnVv6Kl6FSqy/sj9LS6bpN+eENMZ+0L+
	zFqqCNjGhFZfpC25hLDy53EajWO23lWhEDaKwLUjZF3/eYn/TwtTFCSFspIIcn9JMwA9OODuYjIqI
	TUb+kAL6rEkRFQyf/03JTW1ega9tN+fV19Dms43JVajVF6ulQRcTYDz56Lv7NRJre4Au69YI6pnlu
	gvrDzq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeJR-00000000UBv-3YC9;
	Thu, 14 Aug 2025 20:12:37 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umeGs-00000000TqI-0o1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 20:09:59 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-70a928ffd37so15167716d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755202197; x=1755806997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=KD5Bm99mJz55bds7g8oldhS6Fy5oQF5E+KrnjbkPjNiJ4d5VOZiq4pdY/o4XCUXM6z
         ZIwbYEpfUKXmI+3Q5LuuqGD5LgrC6Puyeu12tb0KtoDk4K0NwsqXbjB2Lg04W75qP21J
         FWTdBSxJ2anzgKEncJJMrefUA7qHQkjG6fLKjGwJdCc8bvAbA/qGveUUwJXSrOdbJKdW
         aJ11D1Oe4zFCHqayvAlaXDHntTzgqWdAatdWLE0s8+h16MmisaU0/qLLxgPsOQoe26P/
         1D4kiz93hcfUUOrwpN1xvgEJCLYFcJeMBrneGHoTJBSbfP1TtMd1z6Y4k9QevkGBwWrC
         rQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755202197; x=1755806997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OonhXd2J8nBVykMZsnyPIpsB/2woXa2NsCt/BWEBOM=;
        b=ZKAYfTy7scDwQRsJBTD8Ie7cJ7d0UIHkakQ7Q8y5Ig8mYWO5S0pDSJ6qZa8Hrucsc6
         H4TZQFjb+JlBI6SyglDT8FitkfrS60ZWrfziq5qBfjEFowjuKCowCA7eagytNx8rHP1j
         qTGv3OQqZgvB23onozh9o3FD1NQIBibfmAgeoCLRnV00G6vwL+NYh6BZ50V9AJicOOYc
         66SCM+Avc7WuEOydMU3GPOXx1iimerZFs/Rz0gBC4+mV7YaVDs7Vox0+HOtSKBqRo8dE
         S/wS+KQPRW4DmwwjUgq0PvjWJRNBpbMmHb4YTkAtOQEvFItfpjVALND3dqxTPWYLjIVO
         qh/A==
X-Forwarded-Encrypted: i=1; AJvYcCUtDMtp9LvSzVqi7zbIB7pwHkxF5Nsequu3h9WKZNaUFmGnP3Q0jjxDECDiqTNWKa181n9BTAz274F4x9ZX9LX4@lists.infradead.org
X-Gm-Message-State: AOJu0YwwUGQNSrndPJYuekpFXB83+9UHrFbPnXtz45IEAHi4VWQdde2T
	+2DkHPchGJVtUfOwyTwVl/0s9QGyU/MvlLXa5ejUN+4tBnMtiUB22XA9127sE9tR3Q==
X-Gm-Gg: ASbGncso+UFQulvKUr5+oXaI7aUltMDiTn2NhhIvhD3r1swykMLCgfoz0VeHG0r7BZY
	GG2TtrNzN1KTCyM+4Chmnp+M1BXunUTlQY4HOS92X+3jNmOODkFZ8a4g+vzhYKtXHksa1r8AVs7
	/I0YubwnGmnrtL670lYxqr9btwonEH2/0AFJNYkTTXXytTvJpfU7u9Foo4C/29lKu41C5njIU3+
	GD45xbSWxkqY6Om1gNecBLWAGoWzAFqThNKAzFHk2YkM411MsFBLyT/VZU4i18ALqVmhp0VTMRl
	QVEFgxrw44yzQMwyG0va6/DaEyxpX4qTMrEQHIfOj+d6XW9P8k2yTQXfQAAv5FQAMdEi4Ibti/F
	Z+YN5+ZaLLRdQDC2qURhCSaLGyfM=
X-Google-Smtp-Source: AGHT+IF9yvU2GiDOI9/uRKPRYD6OuBCxZE7IqB303/rhDfSaT/Vz79QLGfLeMmb2anmChCdl3JacAQ==
X-Received: by 2002:a05:6214:1c8d:b0:707:4daf:641 with SMTP id 6a1803df08f44-70af5b2d44fmr73346196d6.39.1755202196510;
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
Received: from localhost ([172.56.29.94])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-70adc1cd94csm17651476d6.14.2025.08.14.13.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 13:09:56 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 14 Aug 2025 16:09:53 -0400
Message-ID: <20250814200953.1969944-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_130958_513764_B29B6D45 
X-CRM114-Status: GOOD (  12.25  )
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

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 19:0 for FIX and HIFI PLLs to match datasheet.

There's no frac for sys pll so add that as well.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2


