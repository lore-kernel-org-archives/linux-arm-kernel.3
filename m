Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14519CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=; b=l56Lt0fMwjPqi4kSOioUPJh/e9
	E7yfpqMO6jDxdAWYZQsCY9LWbJFmwL6rNVrI/nBIecyjA7c5r0TJKWg1QHJhEsrYRS9jWNKcb9BG9
	Zqk6/fsyiPfbyc1zaPceyoLw3h+UxtjOrKPc/61DF5LgYhZbT3lQ13t8hagv7eQkTtlwAnMOpb1ZS
	q0a6eGcKiYuyrWdQULRvJsujiQGqC6AKJBHUxMg9r4q0vGyu0Mz1dpLJFwW8eNsvqaVKlKTX91T7s
	GSHZ8fE3LntCFYncoYnF+RFNWZj7ueTInZE2q4quc6ZnU3/KltPG86O7mtdLtrZr8O7i0vZxbyGjj
	MNxufbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd160-0000000AgLv-34HI;
	Fri, 26 Jun 2026 07:35:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd15m-0000000AgFM-0fvX;
	Fri, 26 Jun 2026 07:35:15 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=n3vHKV2+xyyd0FcD/B/ZRr+mENG/2UskwZQsL52jvLLvCg3Nf5HhURbSZKJG5e1kI1k9Xc
	WoqpsrFqthiHF397xaPv3ZSYqyGW8kJTmocpyzUHaS8pq80pFtoBlAoVTm5g4cuuDAoG5p
	Xiu95cpTnAScvQVn6+WpjR/XT9uYqSgZKAeiPn1dSE7DVKE1gB/C22ZsgTLZHDhBNM7JPg
	xqUcx2Jv0YyZXgQ0RqxdGaGQi5ikBBLqEZee/4MvSE6UweDkWKyN9hkP3qI4ZTVZmd/Hn0
	fIMu4UR/icihYh3jk0m7F/BPhG/2YIfv23O1DmtOM6Pllg4k0PmNB4//+oKqNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwt/kxlU0Ywgyydlp2eJ2vLoMTfcjLWZMUoUXLH7s2E=;
	b=UdKKD7nH7jwPMpCuF2zQyM6eSag1HbHvxmhpIW6pgZKlqJ/8saWIn4BeJVqhJctwB6BeqH
	H3sLvvJpcsRMnbAw==
Date: Fri, 26 Jun 2026 09:35:07 +0200
Subject: [PATCH 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rpi-tryboot-v1-4-490b1c4c4970@linutronix.de>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
In-Reply-To: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=vDH7xyINpB8aIhH1p1k0iDI8THECYcbWKH4TgFUwSIg=;
 b=DMU3jwcQAgiYGwTw+ByY8t8n4oB09PTsBDQ/38EeI5tZNG33/zES84FT5LRHK5fgWTU1olYYR
 OEgslcJPBR/CR1sxonPSrQzbFAwJaiKjCNNIkvhc/gnqYa998iYvrZp
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_003514_377240_8F16A0A4 
X-CRM114-Status: UNSURE (   8.36  )
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

The raspberry pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..67095c7ff770d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -49,6 +49,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3


