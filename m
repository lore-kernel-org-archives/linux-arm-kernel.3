Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24D3C71137
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I+hVnlp/X/TkATZYjX+CShkKEuzenHvr6Gb9nlaTMQ=; b=tL7pgMZY77VJpmwa4JXCvDZDhB
	SvJtoztsETDoXJqLAJ+RBekQOfYqm+eXA1414vVN9nGkJkgXYdZnBks4PAgMfxfCI86r/GKtDrVas
	AP2Pv98kJogQep3c5gGPpmcLM9HrcdVDrp2kv9lI1plT82cnkX+d2etyMr9ZPl5B2GdjXZn6O4lC2
	QgxdL6BDU6RC3cjVSfi/bhAslzRgTiMQTrOKcAmsqJIMDt8Wg0Gk6yEe4ud+NO7iR7ZNUVB8iVFgi
	0QxM14Si4INeyEVMWfd0MF+oP4yIEukwbvHbwII9maJ+nNILjANyQHAZgRdL+4wSuLDDTmkzvKDDi
	bYw/zkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l7-00000008EZl-437X;
	Tue, 10 Jun 2025 22:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yl-00000007QoK-2uOq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0I+hVnlp/X/TkATZYjX+CShkKEuzenHvr6Gb9nlaTMQ=; b=MntOKC/uEwfw+xMsnXJd8Dkv4c
	vxf8WybKOjneSSZwMRRwZvUEkbZDDzavNqwN5DF2bre3JGnLkOFuXRCQrlPoXrwxv+SJCmgruH2J7
	5jh39VSbPHQ15lqyc63ZFmPtZZ7Yvc6Ne4r+23liMOGnu6RExn3vxCUoqt102JduTM3XfGAZFdnfz
	ZNcfJX2hPeMJ+V3uQqY/I54Ggd9yIlltCxnXUqWiCI959e3oCfKCgpFCg8+pEQzZytan6loJasrNO
	Hxb81bojyxH5+EU3btpp6rEQ2UFc5zyRIjEtFfBLfBGFk0SweiPcJAA64YAcjyjAKZYsLKWZXIw7K
	i0IJkR2w==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vX4-16iE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 472B7A51472;
	Tue, 10 Jun 2025 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB432C4CEFF;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=LdciKIEfC54OCN+wMLcJhY50a3NMkpFHdd2g/2anl9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a914ghSCSV5MYU7MRrFjBqsWJsL3SNYntH5veWnmyeMbmPccrzknKBcMvMI1xzUid
	 0K9+qvSBPoU3go9gsDKmyvqEQm5RGzTQldPsuYwg1sfCOhmbFsUJbxtc7Y1yVxOujC
	 CJ73KNWg32kpT+X+la67f6kvo67bR1kvDvctKDoO922CR9hoNO0hhZQGAZcz04NR4J
	 UmQSlwag9RvgA7gyBKk9Cy8QaYJuwQLLJyUUSVvmRkaj7TorwM2RxUYBs+GMBKR91I
	 +aDLWHWRo6DsxOyRBpZc1xqr4SMBC9QSkOKilIDsFRuvqYxmnTY5TpQcaVuaIAjAEN
	 RrfDnm1kZW1QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D239BC677C4;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:50 +0000
Subject: [PATCH v7 09/10] arm64: dts: apple: t8112: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-9-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=PTk+uvBuZw97L0oizh86ZFF+DstpQe37103kl1wYeLQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf1X8+/2HbrJx7drvnmkZHHDTaw7vUobpE5q/Trnf4
 Xdt80W3jlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBESo4yMswoKZi8wYHvON/9
 rmcGLW82dRlor9t86NtRaQtulU0R7ysZGTps7FVMkkwlGa+IOGTdfHDvtrJfyOntl46/2yf6u2t
 eNC8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_637209_C95354AE 
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

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..ff059fd5cd799e0ca7271ddb3d94871e36035109 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -839,6 +839,41 @@ rtc_offset: rtc-offset@f900 {
 			};
 		};
 
+		smc: smc@23e400000 {
+			compatible = "apple,t8112-smc", "apple,smc";
+			reg = <0x2 0x3e400000 0x0 0x4000>,
+				<0x2 0x3fe00000 0x0 0x100000>;
+			reg-names = "smc", "sram";
+			mboxes = <&smc_mbox>;
+
+			smc_gpio: gpio {
+				compatible = "apple,smc-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			smc_reboot: reboot {
+				compatible = "apple,smc-reboot";
+				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+					<&boot_error_count>, <&panic_count>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+					"boot_error_count", "panic_count";
+			};
+		};
+
+		smc_mbox: mbox@23e408000 {
+			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x3e408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.34.1



