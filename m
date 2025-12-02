Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E255CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZDya2k/Yjfepv7ReGX1uQwDN6eaLjy6or2qHO9jgaI=; b=O8SSFZXG/f6NpP/dOwuaL6Z/jy
	INHCbOboP5vBemIoaNQeu+yg5Of1/McGzGMIhVJfVty2ZD4u1rBdRmQ2xOlWH3UKZJ9OOHjgXSakN
	Fjov/UOxy3jGpxe/mp14OzdLkhBwSJksQNDVaAmXS/HNph+HRm41AB/BxunCJdfgtjJFDkiFuiAo7
	YUklw/LEclzpZaEHDB4IIYAb84L9ayHCJLYcKwntpiRlrV8AJFSx1581d/qXLIcsFgdsptFJFV04Y
	IEAKbxX96zlPT83YGIfGZT0Z22Gwu6pEcBmhL8v7gqEpGOZXMBUbQ7YVsba7TXcKp0LS80Lro3jrq
	Zh34CJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMia-000000056vH-29E2;
	Tue, 02 Dec 2025 09:30:44 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMiS-000000056qv-2fwJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:30:38 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251202093028epoutp01861cd893ebe5fe6dfc2b04ebe2ab0545~9XApxYDzK1958919589epoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Dec 2025 09:30:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251202093028epoutp01861cd893ebe5fe6dfc2b04ebe2ab0545~9XApxYDzK1958919589epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764667828;
	bh=PZDya2k/Yjfepv7ReGX1uQwDN6eaLjy6or2qHO9jgaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZ84GIUkF5asheXkAvFAlWhNkWa2rTUYAgNY0uIWHpPBfgJWwGmaxWzbA5pUBgNJ6
	 Ddtc2j43/Jgnoj8Ft9E0sCQ4DCV1cfx2ZwdhjfwQvQYyRMoO2vuo0PdZwkm6DxdyQJ
	 zpjCGMQE1BXDm/Y6dCGxYFUrCDJkcZSQrGe9N+m0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251202093028epcas2p113b36be20d716c9d0f5e9cfcdc8be883~9XApOaajS0392003920epcas2p1N;
	Tue,  2 Dec 2025 09:30:28 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dLFqm07g6z6B9m9; Tue,  2 Dec
	2025 09:30:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba~9XAoWhUGl3204532045epcas2p2D;
	Tue,  2 Dec 2025 09:30:27 +0000 (GMT)
Received: from perf.dsn.sec.samsung.com (unknown [10.229.95.91]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251202093027epsmtip1760f929e4e420ed1eeae51c14a6f265e~9XAoRHBfV1240112401epsmtip1t;
	Tue,  2 Dec 2025 09:30:27 +0000 (GMT)
From: Youngmin Nam <youngmin.nam@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org,
	semen.protsenko@linaro.org, ivo.ivanov.ivanov1@gmail.com
Cc: ryu.real@samsung.com, d7271.choe@samsung.com, shin.son@samsung.com,
	jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries on
 Exynos2200/7885/8890/8895
Date: Tue,  2 Dec 2025 18:36:09 +0900
Message-ID: <20251202093613.852109-3-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202093613.852109-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013037_026341_74E1D2F7 
X-CRM114-Status: GOOD (  16.48  )
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

This patch corrects wrong pin bank table definitions for 4 SoCs based on
their TRMs.

Exynos2200
- gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
  'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
- Per the SoC TRM these banks must use the 'alive' layout
  (.fld_width = {4,1,4,4}).
- Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).

Exynos7885
- etc0, etc1: update bank type to match the SoC TRM.
- gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.

Exynos8890
- Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
  a non-external interrupt bank.
- gpi1, gpi2: update bank type to match the SoC TRM.
  exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
  exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
- Per the SoC TRM, mark etc1 as a non-external interrupt bank.
- apply lower case style for hex numbers.

Exynos8895
- gpa4 is a non-wakeup interrupt bank per the SoC TRM.
  change EINTW -> EINTN. (The bank_type itself was correct and is kept
  unchanged.)
- apply lower case style for hex numbers.

This aligns the pin-bank tables with the documented bitfield layouts and
wakeup domains. No DT/ABI change.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index d11b2d4ca913..b4a7d86b82fe 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
-	EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
-	EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
 };
 
 /* pin banks of exynos2200 pin-controller - CMGP */
@@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
 
 /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
 static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
-	EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
-	EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
-	EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
+	EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
 };
 
 /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
@@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
 /* pin banks of exynos8890 pin-controller 2 (CCORE) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
 };
 
 /* pin banks of exynos8890 pin-controller 3 (ESE) */
@@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
 /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
 static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
 	/* Must start with EINTG banks, ordered by EINT group number. */
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
+	EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
 };
 
 /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
@@ -1544,15 +1544,15 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0a0, "gpb1", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpb2", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0e0, "gpb0", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
+	EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1a0, "etc1"),
 };
 
 /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
@@ -1563,9 +1563,9 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0a0, "gpe2", 0x14),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0c0, "gpe3", 0x18),
+	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0e0, "gpe4", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
@@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
 	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
-	EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
+	EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
 };
 
 /* pin banks of exynos8895 pin-controller 1 (ABOX) */
@@ -1695,15 +1695,15 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst =
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
-	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
+	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2c),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
 	EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
 };
-- 
2.52.0


