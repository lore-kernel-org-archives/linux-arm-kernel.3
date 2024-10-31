Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5CCE68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjzuNQrgmCWWwAR2VCUPLI2bDsw2f8qYDuwbs7Q6Ruw=; b=PILrFSMG1Aw2qkolA0O4+VAEpz
	NrIrT8/jJ9JgwsQpGuRkBia6xsXz1X/0ueweiCQq4odGCe/M0WDUv1ZpotYJj052PNGXiuW2NZITW
	e+nyO8X8pdaRx2EC2f1VINMYR9ym+0l96CxYfE7LChVa/JQpYBxfFgZ/JznfyCxauNpfbTKaYQKCU
	bJoeLN9Epxu2Ptstj51n6XK1xez7txeca4i7zP7PKRaMLv74VU6NHNk3sq9GpBKSN0+gSztM6eAZn
	p8AwIlpRqUSqCn1B0pTeXS26WT7aeO0s7PkyeXsR66Ji3yzy1Lw8nNuM5fDJudQpmk4zZf2+/Bhzl
	/vX2h/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PTk-00000002nGn-0BKn;
	Thu, 31 Oct 2024 07:20:24 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDO-00000002kVn-28ps
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358205;
	bh=gWgh78qYIAfAOa8H5RFKaOcp8FXFvpf47/zA/jM4dGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QM+yJxZTgU8QBuzMFjJT2Q5MgjOwsMRUAAEx9Y0ZPVmxoBEWSw1WC2z07YDGB7Zup
	 X+fy/B07X4jSRpwUAJz31K6/lIdrYc/j6Wf5o/2r3vG88JiNI7LwzYstgnudHG1oTg
	 yyWLso51ZQwrfa6tsZumZj3eKMAW7e/nszZ5eTlsPfjXhufW+iWHEt2r+o+Y9ljhJO
	 dvoNpGXKL857H1sJ0w2q0ogRxjq+6Sw5TohkwJwwaFPrWVjUO4lukVzev/Vdb2QcBd
	 Jgg7k3Qm8uU5QeYxkL53OMqPvFTy2DqD7Qdm7MMeoXTTd+eTh/QJUmbplq3Yi+/xwJ
	 +igzx/0NjEarw==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node
Date: Thu, 31 Oct 2024 04:02:23 -0300
Message-ID: <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000330_769740_B790941F 
X-CRM114-Status: UNSURE (   8.43  )
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

From: Yangtao Li <frank@allwinnertech.com>

A100 perf1 hava MicroSD slot and on-board eMMC module, add support for them.

Signed-off-by: Yangtao Li <frank@allwinnertech.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../allwinner/sun50i-a100-allwinner-perf1.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
index 2f8c7ee60283..d418fc272b3c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
@@ -39,6 +39,22 @@ &ehci1 {
 	status = "okay";
 };
 
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_aldo1>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	status = "okay";
+};
+
 &ohci0 {
 	status = "okay";
 };
-- 
2.47.0


