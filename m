Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80853CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cM6T3JboLweSs+J5rPXUUdgy1Wperx1vRoU9nQtE5kk=; b=DBHP4bGwQoTrohx6q24K6Fmz+i
	VoA3GXbSa02EV9OO3UQ506cgmkxFOGSnpoFzPFlCRvNJtLdG+9bPihsmuRzFqBdtUkym8oJQKU6Do
	+oavpKs5ayD5SZY/IveFFofVTPc4A4mfmOxIBjj83W9DdOsaAFNZp+1oE/5jXM8KXWnBhIpf2K0Nv
	hsitWEgMO+bP27lKPcny+w414NdtxPQ0CSGd6D7HDuULQCIdOGecDDhh4RvxflKuoMrU7V4u/IWg2
	D8zm6v2/5XOEaYIJWuuJ509ZqAr9zBNQiIK1EzjWW8zpzq8rXGXLQMid9G0StkLLsQD0mXSZ3FI9K
	fP9tWZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhu8-00000004oHs-2LDR;
	Wed, 20 May 2026 14:28:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhty-00000004oAy-1x3D;
	Wed, 20 May 2026 14:28:04 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779287278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cM6T3JboLweSs+J5rPXUUdgy1Wperx1vRoU9nQtE5kk=;
	b=NcuEc5osdAfjz8c5aFfFsY8umChOIjYnsUKSsAGUBvK67JTppF4Sb44DUBJBbX/x8QOdC4
	GP1vWVMIEAiaAMV7uzyTxCkb4Ww6ylkZO2o5ByPMGqP2up7wAmpmzoZoMrniJN1D7QUGEx
	ymA7tWjujqVldSFOy6FoEJxetATzJLiyOvmkJ2dmV6Kk5PoawMLQAek+aDRwjpS+y8cve2
	E2EV9y/+BdeY801AcLzsaoCj5QwPSr/x3AUjoEBCEx2rr8BqlFVFw2uZP8qI9n41Ta1+eV
	pB0iLJNrgIUMzeueyPBOzH1PcVKItb3A646IlBNW/8RUe4WbwXot/VQmNA6eFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779287278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cM6T3JboLweSs+J5rPXUUdgy1Wperx1vRoU9nQtE5kk=;
	b=Wb3nK3Y+Kv27l/Xl2g/kmfvzfCEv7Ct5zl4MQ9nVHYftOQ2eBWxx8iWkdeRVR/QPSsj4LM
	ZqXoKEXec7MViCBg==
Date: Wed, 20 May 2026 16:27:53 +0200
Subject: [PATCH v5 1/8] soc: bcm2835: Use IS_REACHABLE for function
 declaration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rpi-otp-driver-v5-1-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
In-Reply-To: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287277; l=1327;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=au4xWUMxkrQnvU1u6IDdk6ABFJbLPtkw+ui4+y5bLec=;
 b=fcW6MCbGz5a3dOo1SLrPb00wjdsHCrmhO22EfAVfrMuIRE2/jZfyBmFX9zpHH7HH1iDSVSLM0
 ynv2Mv3YtUNAraVhvyXd8GNweutT/mpp6VVswobWeJT2/w2eu495IqI
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072802_650849_4F2C1AC0 
X-CRM114-Status: GOOD (  12.23  )
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


