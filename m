Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D15DCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev2lsUYzchtqx04itc4WRveJiV+KtXF/+FGSTUlJCjc=; b=bCpujqWZ8IkNXB6MW1hP+jiJZB
	n4GK4eJH86GpMkHSfPsOQfLZz5blAAYAo8Zjmmxz8EPWrjUHeTaef+kUnaCmePa1F7HdyPPLqqrYr
	PtFq5zyYCqzvywoGnqr4VSgklVl/uZZhMtr3wCVnhpr3wrOpJmCkMuAJmO/RJAs315e2apJyTI4dp
	Ofopb+DBHiAvZsc4UfUmOuEb8gN30/1mp8CagF/8ILdwH89EMLknZQFBW/RvoACm/0fTqaQ+e0sz4
	7orR2lgA5V7hcXLblk4kE6xdZRO6bSFptwakgFlPPTqXYa8T6b9vuARRWvnhynY/VyeQJ3/X58/vt
	DGFZO2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRz0-0000000BHxO-0pdN;
	Fri, 22 May 2026 15:40:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRys-0000000BHqU-409D;
	Fri, 22 May 2026 15:40:13 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev2lsUYzchtqx04itc4WRveJiV+KtXF/+FGSTUlJCjc=;
	b=kj3GdzKv+tvO8VLWkvZbkt+rXeiTvoIyU0DG1IrGIjtH2aX79Bpqby7Oo+i4Hd/jb49Ukn
	PECz+aTg2dj3L4q1m34IVriaZK72PkQHkZ0aDnCpmEudOneUiG1bG1AlMRj+Vdg3ZhzNfa
	/fEaCkub91WTEAlG0u1WR2un5XBWw2VXXVmQDL8n6epEjiMBsjhklD5YMPM5+Myz8PKOIj
	HfGQRXbOu77l81Ndo+zpFaITqaexMkty04Wys0ENG3iTrczR+3kTbg/fklapb6u9TwSUgF
	bc73nzVrsYSpEiigcIa3Qhfnqwyq189kW4TBg/71HnUYR92ppZPrAKv8WrEfpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev2lsUYzchtqx04itc4WRveJiV+KtXF/+FGSTUlJCjc=;
	b=gNPPgvlHlTrdMFlqBfmn1BphNAqyf/TkB9WuDdtsQ/EKSxgRkBTs3w5HasA0nxs5Rv1n3h
	oW6klMniK+9vAyDA==
Date: Fri, 22 May 2026 17:40:01 +0200
Subject: [PATCH v6 01/10] soc: bcm2835: Use IS_REACHABLE for function
 declaration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-rpi-otp-driver-v6-1-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
In-Reply-To: <20260522-rpi-otp-driver-v6-0-b0eac97d1428@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=1460;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=+yF/ZOGATgT1knyeuTiskzGTPk9VvxbdwCVyBSDY6N4=;
 b=iBRNzAlQd69QIz5xYGgMSpngrsfvUlezpxd+TjcIp9dNS/0nZ72sQWYLTAj2wt9qFhqMZPIK1
 LQZHpvWw0XaAcJukNOejh/LfP6Iez/UUYSNnll/EQgc35e18HFRGZM0
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084011_131151_AAAA19B5 
X-CRM114-Status: GOOD (  11.56  )
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

The drivers that depend on the RASPBERRYPI_FIRMWARE use

	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)

This should ensure that the driver is not compiled in when
RASPBERRYPI_FIRMWARE is 'm' on COMPILE_TEST which leads to linker
errors.

The same can be achieved by using IS_REACHABLE in the
raspberrypi-firmware header. This evaluates to false when invoked from
built-in code. This way the Kconfig can be written as

	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST

Which is a more readable variant.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index e1f87fbfe5542..eb33838e0cd10 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -174,7 +174,7 @@ struct rpi_firmware_clk_rate_request {
 		.id = cpu_to_le32(_id),		\
 	}
 
-#if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
+#if IS_REACHABLE(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);
 int rpi_firmware_property_list(struct rpi_firmware *fw,

-- 
2.47.3


