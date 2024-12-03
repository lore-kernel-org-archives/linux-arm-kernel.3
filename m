Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472B9E74AC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOMUcgoqz3eKJZEaHEZrInZsf5nJ63PkT5MMHgVc0S8=; b=MVk/hqOPxinTpPeX2FhfxRcR6K
	ClsaOEQ6J/8Q6LZuLTfTR7mAtPLogwnmP0NwEuMOttxKXmhB5CQLZFkAbFqKaOBswSm5qOrSItOI5
	afJ/wK54uBg2/nC/dLFByKHxj1H8w8ek7LzhJjZV8GP0LMe7RIGk71SQ6+xkKB2NvduZwKyNuMa9u
	udyJRl/GOij0RJ+JsM0PMMo6ytyZSr03oQ1OVBJA3XIqJ9l8e5ztyN2J2PnmHnoixQtDMLc96qgwe
	JqW+MxwF2UCrpeNTEqUGPEq5+wsbEYgBfa+9+qV3X6xbOi6NA3/+tGMxuoYabKUvrW1aCd2IFrkhn
	oePF5nfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVj0-0000000A5al-3Ac8;
	Tue, 03 Dec 2024 16:26:10 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVi0-0000000A5W2-3iyl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:25:10 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by andre.telenet-ops.be with cmsmtp
	id kGR72D0043sLyzB01GR7Ph; Tue, 03 Dec 2024 17:25:07 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVhz-000DUP-3v;
	Tue, 03 Dec 2024 17:25:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVhy-00ARCF-Ve;
	Tue, 03 Dec 2024 17:25:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when compile-testing
Date: Tue,  3 Dec 2024 17:25:05 +0100
Message-Id: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_082509_068294_F2393020 
X-CRM114-Status: UNSURE (   9.47  )
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

Merely enabling compile-testing should not enable additional
functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a60bcc791a4803b7..0bbbf778ecfa3e4c 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1316,7 +1316,7 @@ config RTC_DRV_SC27XX
 config RTC_DRV_SPEAR
 	tristate "SPEAR ST RTC"
 	depends on PLAT_SPEAR || COMPILE_TEST
-	default y
+	default PLAT_SPEAR
 	help
 	 If you say Y here you will get support for the RTC found on
 	 spear
-- 
2.34.1


