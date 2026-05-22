Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA62CD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqxlm0R5Wd0RrDJc5qf7hWcJWc/FoDh8Mkn++k5Hxho=; b=I+cBe0pySGzlwDjTZ2OjKDy/bm
	7mSYxeT+nd0QpLku8PYGZQ+lgEj4iGlQCT4xwwu32b0blCylrGdmkue9tnpfIufwRKlFfqVvpU7Y+
	1e3Kx5m6RPFes3PGi+I2qfZ+mzng0mQJMd9rpeerg8YmxWvCogK4yXx47adSqhrqQMroDulVj1zlY
	VfU3RgLoa1PRcrDPh06BH7KXhuNsdEBD5fhakqxpzU5y1kx/rMfQPnFdmZkKQ2HKTikafjQCTNgqh
	BFoTZl+AEm7cHbysdWfkgLpYVAS1kgAtvGsTE21joX38rWNZyqbIfgBllk5epk3Tv4HS4zkRIhfWu
	znTg4alA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRzP-0000000BIEp-1mxv;
	Fri, 22 May 2026 15:40:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRyw-0000000BHtC-3RkG;
	Fri, 22 May 2026 15:40:16 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqxlm0R5Wd0RrDJc5qf7hWcJWc/FoDh8Mkn++k5Hxho=;
	b=PeW7RWXtB8dNpBjtqAuzknD6YIeNWIlj560/kokuYKeP2iZfGvG0ZyjC+K6m9aHmLAWtjY
	HGrSqN5ATspKKfezk3Z798vb/AnFsFS/cNAQKLEha4UMnu+vSHLo6HWdMWisu5K75sL3IZ
	vcHiTHA9A51VaN4c8WOzn+li1R+wLLp0MVA679JAiCuvBrOIXGdrBISOdx8lle7Fy0WGP9
	KkP4bz6hB3+NxHhvTOnGxdj/7ui/VuFRocx5JvfNSkydi8Kba8VTm3E/pEU9wLEzJkdxt0
	+N6TN0JK3oszZlI/6GcQUSULe6gTxkmUV5ofqmnKZ77CPYYtWVgbkIDnT98Y1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779464410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqxlm0R5Wd0RrDJc5qf7hWcJWc/FoDh8Mkn++k5Hxho=;
	b=FP20AERFPEgsCyqxYTObObpLvBVoVITO2G4VKGk81EX0Ss4ym6WmwVvnBAQx9rMWhxEJx9
	Xznhv0ohlYX3ROAA==
Date: Fri, 22 May 2026 17:40:08 +0200
Subject: [PATCH v6 08/10] arm64: defconfig: Enable the raspberrypi otp
 driver as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rpi-otp-driver-v6-8-b0eac97d1428@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779464406; l=987;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=W3od+N7ms8LBhCXN/JpOtSic+LkKIcRVMQF9+TfNOg4=;
 b=El25Y3nV3USsdO3HnhHOD39+moGC7yQlHwDZobn7c5IdnDfIhTZ7J2pDbwLYYkAZGn36W34UG
 JRg3YhKIVJ7BjoGaB8DBBtdyq7P60+jVQ+6AWkc9K0gqRvbgf5iQDn6
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084015_072365_81473C90 
X-CRM114-Status: UNSURE (   8.15  )
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

Enable the newly added Raspberry Pi OTP driver as module to allow access
to the otp registers. This driver provides access to the OTP registers
present on all Raspberry Pi boards and the private OTP registers present
on the Raspberry Pi 5.

Enabling this in the generic arm64 defconfig allows standard upstream
kernels to use these registers on Raspberry Pi 3, 4 and 5 out of the
box.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812..3abb3ca34c708 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1849,6 +1849,7 @@ CONFIG_NVMEM_SPMI_SDAM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_UNIPHIER_EFUSE=y
 CONFIG_NVMEM_ZYNQMP=m
+CONFIG_NVMEM_RASPBERRYPI_OTP=m
 CONFIG_FPGA=y
 CONFIG_FPGA_MGR_ALTERA_CVP=m
 CONFIG_FPGA_MGR_STRATIX10_SOC=m

-- 
2.47.3


