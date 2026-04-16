Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26F5F8A171
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q12w8LhCi0sIhDoWQ7WEXGPR91dwA3x1q97ei+JcRM=; b=Vs15uTu/qkjeiqpSIPwQVZQD8Y
	uDfRltFyODEedxjGQMIumuJkFKsfxwgHEcjrSkGeL7kbpj6YjY3C14+eXzxnYRpcJKB4/kUSBKXy4
	2lsTgAnpCHqnYSgH8nZFatTqd8t9hGVSSZwRbW6V39Yp2ilmIAiIyMThe5o2PxCCMU2sbarUGI8mk
	Kv48innphV4knZrr83DvdAssOq+qn3s+s1nMf6PGQauD2K8+s0EOjA9gruvuc+U9uscUYzBXGFrtB
	3w1ZZ8qU9gBSJTHwfOI9+H1jzIn8SnFjvVRyHIG4c9SjAV8nCBqSHHzUBhVMG994H8oiTwLAZ5wnx
	H68507EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMxz-00000002VqD-1LYC;
	Thu, 16 Apr 2026 13:41:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMxv-00000002VmV-17wC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:41:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 988A91A330B;
	Thu, 16 Apr 2026 13:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EE3160495;
	Thu, 16 Apr 2026 13:41:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D61102F19F9;
	Thu, 16 Apr 2026 15:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776346864; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3q12w8LhCi0sIhDoWQ7WEXGPR91dwA3x1q97ei+JcRM=;
	b=er+MOTyG13sFk5ZCYAQklfOLv86NKfdW0OK/fQuEzKXXsATeo38kJk+Dd9sIr6cEUW7Fmb
	RWY9ahnf2nFmSr+2vK3BGdRW3Pv1a1bKNB6qRRaYgmU+pFB/EHkdpWVU0AQ73GJw2nbI2x
	xMdD4EVsZIhOFPq2/QZT80kkeLusaQJcAsJAEShlPOnFpqhcJZmLMSex09yPnxu7ov/Lwx
	9cMffwrYfV9JTARSwcqGF72QrQxTvM0XK62HbWEC+1IUf2on4Ys4YuEsj0v2aDfu5QHrmr
	v75t5OqQRpwJRuON5xCnqgxr9wEQhVoLoTlHIGvH3EHh5cazzgmnjgCT+ik3eQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	John Stultz <jstultz@google.com>,
	Joao Schim <joao@schimsalabim.eu>,
	bigunclemax@gmail.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v6 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver
Date: Thu, 16 Apr 2026 15:40:37 +0200
Message-ID: <20260416134037.3160537-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416134037.3160537-1-richard.genoud@bootlin.com>
References: <20260416134037.3160537-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_064107_514410_27119105 
X-CRM114-Status: UNSURE (   8.13  )
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

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..256ab8be19f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -912,6 +912,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

