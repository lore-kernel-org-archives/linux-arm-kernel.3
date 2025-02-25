Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/wjc6HAO8My2qmZX7jkTzIOr+95GymwnsKmZhebKWgY=; b=l1iVwB7QPJRL9iSMsiA0ANdDkA
	pMTwtg/FNlGpjwMD6m0B65151HrrpwJQNxHoIW6Koi2uABdvo8tt9XLTOPKjE2k+wSUJu6sX/DoZX
	5n4LFnstWsOPvWMwr1XsyGo7iCcK230yFC828I049rSZkG9LZeWN5XcuDrvvtNLb1cQWDOknwxwo8
	t0mP7J+8tF7KXN3G2kRtX6HabTB3MPNx946BEI0I3cEvHWm4SVTmbP8hS33blD09E2nvWjgvhCOq3
	qVuPARBXvlgH2YcE99Yfw/NwgxuANrAah1ludz20vUV1vJNuHm+mRE97yZn6ECzoeqyY57ktKLrPC
	WdI2TTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy6u-00000000S5B-0teU;
	Tue, 25 Feb 2025 16:48:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxub-00000000Epd-1pNn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E852E5C598F;
	Tue, 25 Feb 2025 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BCDC4CEDD;
	Tue, 25 Feb 2025 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740501360;
	bh=1wLbTyZpyrnh0HaPTC3hRYX/EzNCdBJG7jxtJKU4pcs=;
	h=From:To:Cc:Subject:Date:From;
	b=nZcW+nm2jbZiPBblDJ54HjvOIhO0EFCkMKSZanOXkJMza/OcPcMa18XwYX2IQf3IB
	 dkEaV8rvCk89y9gUdHKH+InPs+gp+EXT082UMXe8MP7dibogBEpVJ+cSk/6oOJGHVz
	 9QJ2YM4TZLWbuR3w/Nl/iCl1FIAUm/SIqnOzYK/6urdND86Vf2ZHJZ260k1jV4bZMv
	 jZvf+WqqAgKDCeh5IXIvsypExXR/A/EYOOfpOWIuU618tgxySjIBwd2dBCLtg/MOIW
	 c5xu+uPPzg6cvfxcZT9QAW5var2YzMSFaAqqPo0Y5VWkrRPpcV8hV3ADEbC88xcOG+
	 VJAlOP23LQeWg==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Petr Mladek <pmladek@suse.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] tty: serial: pl011: remove incorrect of_match_ptr annotation
Date: Tue, 25 Feb 2025 17:35:37 +0100
Message-Id: <20250225163556.4169086-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_083601_530444_621F8E7A 
X-CRM114-Status: GOOD (  16.70  )
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

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows a warning about sbsa_uart_of_match being unused when
CONFIG_OF is disabled:

    drivers/tty/serial/amba-pl011.c:2945:34: error: unused variable 'sbsa_uart_of_match' [-Werror,-Wunused-const-variable]

The driver is not actually used on any machines that are built
with CONFIG_OF disabled, so using of_match_ptr() won't save any
actual memory, and it can be best removed.

The corresponding ACPI_PTR() annotation does save a few bytes on
32-bit arm since CONFIG_ACPI is not available, but for consistency
it seems better to remove both along with the __maybe_unused
annotation on the ACPI table.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/serial/amba-pl011.c    | 6 +++---
 drivers/tty/serial/ma35d1_serial.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 04212c823a91..e3b8590bc880 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -3001,7 +3001,7 @@ static const struct of_device_id sbsa_uart_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sbsa_uart_of_match);
 
-static const struct acpi_device_id __maybe_unused sbsa_uart_acpi_match[] = {
+static const struct acpi_device_id sbsa_uart_acpi_match[] = {
 	{ "ARMH0011", 0 },
 	{ "ARMHB000", 0 },
 	{},
@@ -3014,8 +3014,8 @@ static struct platform_driver arm_sbsa_uart_platform_driver = {
 	.driver	= {
 		.name	= "sbsa-uart",
 		.pm	= &pl011_dev_pm_ops,
-		.of_match_table = of_match_ptr(sbsa_uart_of_match),
-		.acpi_match_table = ACPI_PTR(sbsa_uart_acpi_match),
+		.of_match_table = sbsa_uart_of_match,
+		.acpi_match_table = sbsa_uart_acpi_match,
 		.suppress_bind_attrs = IS_BUILTIN(CONFIG_SERIAL_AMBA_PL011),
 	},
 };
diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 8dcad52eedfd..285b0fe41a86 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -799,7 +799,7 @@ static struct platform_driver ma35d1serial_driver = {
 	.resume     = ma35d1serial_resume,
 	.driver     = {
 		.name   = "ma35d1-uart",
-		.of_match_table = of_match_ptr(ma35d1_serial_of_match),
+		.of_match_table = ma35d1_serial_of_match,
 	},
 };
 
-- 
2.39.5


