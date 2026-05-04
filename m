Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D0ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XLhkWVEYq2mGpEUiv0sqxpsGyZahR5a6SDGaVlbSZSg=; b=0zrn2lyBiodsvELh3Ha+OqAbbO
	vGcr+Cr20KgLudtyhnxquCaUFWkwWgbY7nN9tsYXaMKA05PlILZVeNrsPi87U6nBB9abAypCP8PHO
	oTdiEKlSoUGvqcJw/azzxGKB6ZV0AGBEYO96udtgqoajGffDBw1QSWPl+agawvAsCca5I04cU5eRj
	xjEyVwglQPQtSMQhjEsblc17YQbmqGiIjXzb3oH16cUiFSEqwKXFUxuF/70H2YDsZUHt5UnRKrj5R
	Ml2HwjAyJwWnFK7246d3Ln4x7r195HX8SThmissxQ1i8qJ85PX4ENnzqdoKm399AAhy8z2cIoaJhI
	oAF2bfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2E0-0000000EXYW-3vRL;
	Mon, 04 May 2026 22:57:16 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK2Dz-0000000EXXu-0dzW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 22:57:16 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8cV12VdLz9tdd;
	Tue,  5 May 2026 00:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XLhkWVEYq2mGpEUiv0sqxpsGyZahR5a6SDGaVlbSZSg=;
	b=Z9I7m6w+0Q5ZnEOQPvJ9cB6OHvDdeTbp2detkmO1Ab8P/qizHyVCnNjVffqVCsCA/M4yTB
	PgMgtK6tq+J4F4dx/xxnsLqj4Qbzyb5E6dzkuQz+IVFkBBDq+nsz9EPjfjYyWJX7IFetGS
	8GGmG6tXIbNLYgwNRczRDGBQ7HoD43gXPn5MIH6IgcDPMcs6+K9IBJ002EjN4bMIIns8/H
	Othkj3Lp4fxXyKF75ZKLBX66RjgTGm0CKiBWjWLiNILxp/FYFoiknLXEmMy4F0UcIbuZSH
	AZr6MHM0CYum1sdkcrTMJq+HdhMXgh7bR3YzfUHVfnsJQ0EcoMVcfDWpFTLiIA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XLhkWVEYq2mGpEUiv0sqxpsGyZahR5a6SDGaVlbSZSg=;
	b=OoQtm2TjtTLDJkAU9vHhj/2oSzpGyfQG4MWxxayfPuT05poELpma3EY1USJnNfmUzXnAqX
	lGr1C48lZMaC1UkQVxmx95wPL7Mk4smM/I/Jwhf2A3yVHH8XtkcMiLzlUBaVrO52tAnV7U
	7HY2JJc1yzcOUM0j4OgRTrH+b3oyA0hC0bsqRd5DUFNdGw1zsBSasyB4KcmtqHjAF5YO/x
	ujtR/1TaIpFIo1jjl9dOD6XJhvb/HX1Jer4fXwQSrxVKMVJbkbE4Rz0NTuWEywLEq4dqvm
	Ds2h4rccXRexutsBJtyLaswLE+VEqbeGx+2VCfdo5i1LInTop/DExpATT8y0UQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:51 +0200
Message-ID: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d6f30ca155c2f1f8d80
X-MBO-RS-META: swbnshd58iodsxtxnznbst6hew8nyzrm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_155715_359222_A7DF9649 
X-CRM114-Status: GOOD (  10.59  )
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

Use standard clock-controller node name for the CS2000-CP.
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index c83c97d991133..c9c5c3ab06c38 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -435,7 +435,7 @@ adv7612_out: endpoint {
 		};
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


