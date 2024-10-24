Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943AFCE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+EvwIl0i2dXYv6BLBgJPCfDIwpV2bZuK0eg1elGHAZ8=; b=41ctMQBQNbnelTmv8faTL3+UWt
	Awmf/fYYi+WFU+PgAzGZuskl+rwt1LweQSdGZ06PGMJHgWvpil1I4DvSjSQlFs3NquaSb+SShX03z
	SBvknrDWoQbZ8upn413oKiAnF72A6eJ4AsCTP4RJykpBSqn8yCh/84zu4+IsAU9DDuGMaK6XdjkM+
	UFGW3smqeHHh8kuDsR1btNs6V/0Vl2AmsTVA3fWGutDddqopoeqQtJ4zhA19D++zQcjIeNM3nc55i
	ef6BJg4Ubab+jwR84uDFsYkWB24c3wbk2l8PEQQL4z7yS1NEMe2j3jxg4OpzqkxAHU+RWdvJiljY7
	P/8ZhX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xaR-00000000Rf3-49qR;
	Thu, 24 Oct 2024 13:09:11 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xY3-00000000R5g-042x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:06:45 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B61E1F8C9;
	Thu, 24 Oct 2024 15:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729775196;
	bh=+EvwIl0i2dXYv6BLBgJPCfDIwpV2bZuK0eg1elGHAZ8=; h=From:To:Subject;
	b=uVfTJ5M5yT9Yv80i2dKk8hEu6wlnSTFJ0PYJDkquaGC6izPRnR77NPBch7AUr2vbG
	 ELEzHhA20Qo/li95Ca7hp3gBxrH/TQgZJrKP1W5TuKRygGfUpm6MMOL2+Rds2RQspL
	 sCEdrOY/uu/KsCeH91cUVoxR0bKxunh5kEWDd3EF1vjNlZD4cW2xhtyhYe8q3gBs8Y
	 wjV9zucSpYcFSe7+nnoAZ1+wJOwOh6g1qMAtxKYv0wfJfUZSbZz1A7VvHM9d9y3OCU
	 U8Nu4v+mVJtda56jtA1z/uVeKIz+NfYhobyjnw48Va8B0MquvDavO6dGnVtJbej7WK
	 Gt0y/Cu6I2pCQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay
Date: Thu, 24 Oct 2024 15:06:28 +0200
Message-Id: <20241024130628.49650-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_060644_170797_C57C97F2 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The power switch used to power the SD card interface might have
more than 2ms turn-on time, increase the startup delay to 20ms to
prevent failures.

Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
Cc: <stable@vger.kernel.org>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 5bef31b8577b..f0eac05f7483 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -160,7 +160,7 @@ reg_sdhc1_vmmc: regulator-sdhci1 {
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "+V3.3_SD";
-		startup-delay-us = <2000>;
+		startup-delay-us = <20000>;
 	};
 
 	reg_sdhc1_vqmmc: regulator-sdhci1-vqmmc {
-- 
2.39.5


