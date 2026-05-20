Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIg0eXBcEZ1WbS9twEGYQ0DKLtIZsDqQu16FcfETBjc=; b=f8YJBiYdk1/2P/Lat6avIbIHJd
	8hNMKzrjYUawi30vzniAzgjV7wSHtlILlnI/74vg8DD3VdOzP+JyzYJL9O90J7/n5Y/2WxUZvAOHY
	IjZIAOoW++d8xdnWHTCJrZVYIApYWig9AgRx8fdhMB6BpwxG48bNmmN1n2jEfXcVEfwigdkLgr+4Q
	ebYTf1RWNmB9bTDIwwFXkNn8o1X+0MGCwahbHOKrcLg7CzIFmtte3QCN3UWP5Mq/6eRVjt0VP+Veq
	bQoRMUSgNnXTcwyvggz8Hke8d/UCNR/JrCt8WG1EPo5rJPgnDgIntwpDAHJB9K7hT6K2e9cZHlnPA
	VsjBe7Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhuT-00000004oWm-3jkA;
	Wed, 20 May 2026 14:28:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhu1-00000004oCw-1n6o;
	Wed, 20 May 2026 14:28:07 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779287281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIg0eXBcEZ1WbS9twEGYQ0DKLtIZsDqQu16FcfETBjc=;
	b=PIAvbeo2slSRFIm4bEvFlsDU0yhrl2ye94bZe0Wevq1YcnHq0DfNzxtvpGfBmtnXwUL9ro
	W0FYEu6ndLKTOa3PyjjpebtbtMP9eCoFCNOne62NOtDutTXNoGaCydbPeyZPRJfPmCW0uO
	dUtKaOZ1+iGC0Xuhy6z1UvEYNyhMZeNJnCdZKhBdH1CqxkE3VJEXWAwJ/lAQxi7fgbCVHm
	0srzRXqbUclykB47OioTatGvPbXmFMyizqhsT4Jzw4QobxJlGXseRQ7wULg2aN4LX0BC5k
	SnvD9ykRLVP27UrSu2xJKahLMRcnb2dx5JHWPjZ9mWxmqztIXBrXJV5IKKzVxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779287281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oIg0eXBcEZ1WbS9twEGYQ0DKLtIZsDqQu16FcfETBjc=;
	b=p1QkB7/XhCF6iMMCWfcVcWhXyu3avpuT37ei72veI4LttLUgbS0gcIw1FZr16t4IjoHerk
	rcH5TLUafbkROzAA==
Date: Wed, 20 May 2026 16:28:00 +0200
Subject: [PATCH v5 8/8] arm64: defconfig: Enable the raspberrypi otp driver
 as module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rpi-otp-driver-v5-8-b26e5908eeac@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287277; l=689;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=sxQGCV9Bg6Vz0Ph0j26x9ZfnN5Zu1SLYraSm4g3fJ2A=;
 b=O7JTUaJejsAQjydEYZ5zW7PCjzoARjdxd349iIcPWPsReeRusOdJ75TtqkMzzA55Z3QsDwONc
 xyLgJkuS2LqBD7vL5cJxVnM9eeURsAbhDN3v3dZ6LVhI88zsqMbrVox
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072805_643813_63743865 
X-CRM114-Status: UNSURE (   7.50  )
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

Enable the newly add Raspberry Pi OTP driver as module to allow access
to the otp registers.

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


