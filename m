Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445AFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2MYMZ5GH2aKaBSXKUqmZnIp2X6lhxbwqG/MojCQ8J0=; b=j61/JkIdLpWqAARBD2zK3kuhhl
	CJYHjMzT/D1WMTxyX2CUh2MGAAJ62KRRXbj4ZE6Q/yi9glHQRwDJNYB8fhXh98SUehygnFH6+gUKt
	O9HFTPej5E8YmqvYPy4m7H2VvKxtrglmRudNGRFvTdeJCJ5gwng76+A2RynLq7cI2qPg51ORqidzx
	r9wPP6N2rnLH5QSqXCmicuYJdqUgokge253uCpYH96XDXR53nOGRbQ0jKuWQcLy3W2NB1VTcJJcW5
	PRUwpFAzf0XH482c9tp2XHdS2QTxI9FB9wdqlLrrORGMlOOy5wACVGb7IvxjEl9B2LEkfZD9bpQWp
	4UuBR+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4G-00000008zYc-06lb;
	Tue, 16 Sep 2025 20:14:24 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc4E-00000008zXh-09d3;
	Tue, 16 Sep 2025 20:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053322; bh=m2MYMZ5GH2aKaBSXKUqmZnI
	p2X6lhxbwqG/MojCQ8J0=; b=N9avug74FsHmuT0w65ICc5KFEzuRYgwfWgK0aZaQwGjCm37Ca9
	Atc7UgHQmB5KL86/zV2wSlSOBGf1x5V8CCmqGyuq4FA7I5fryooCeWijBjsUJxxKMvkIbPB2JKd
	UZHIoxbdpKtp2eyY18WMDtvZ7uUBkiO+oBtSwTpMqZpgjAgKxFG+PI17ssuwvb++wnqfzpC88Wn
	uV2WWfDZWo+ZvSZgx6d5nD5RzLy4HmVrDO9KeSqaHTWjy9x5ftoIfDaI5o/7axwkl5CZ7CMn4IL
	4kllWiDcslB9ImPM0HzsEWLi0Q4hTVJVxz065jR92DjmgB8Dlj984ONiTJMBVLHAc8A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053322; bh=m2MYMZ5GH2aKaBSXKUqmZnI
	p2X6lhxbwqG/MojCQ8J0=; b=+UEbWfglRYL7StMUczR+FHfgFwsYeVsy51nLf+5LpO5BnKhFzp
	xpKbfFEhFi4KXFCqCO18t70nbIKRYNl3FeDg==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:24 +0700
Subject: [PATCH 07/25] ARM: dts: unisoc: rda8810pl: Enable Real-Time Clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-7-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131422_219203_62A5DA4C 
X-CRM114-Status: UNSURE (   7.57  )
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

The RDA8810PL has built-in RTC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index 6553fc102c6751696e75e4de614fc3428d182061..609359aa91537168435934077e736b216adf50f4 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -39,6 +39,11 @@ modem@10000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x10000000 0xfffffff>;
 
+		rtc@1a06000 {
+			compatible = "rda,8810pl-rtc";
+			reg = <0x1a06000 0x1000>;
+		};
+
 		gpioc: gpioc@1a08000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x1a08000 0x1000>;

-- 
2.51.0

