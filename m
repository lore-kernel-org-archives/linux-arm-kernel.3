Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27750C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtLG5gR3sMthibXuvk5Bd9l4Kb8kbXsv3wJprPxhgBk=; b=1V9rqBURjhBTy0XTHpRGCB9i7m
	zqk8nsZ0aFVH61vFkqdzZXbVdS7Pw5XnQYRoycMsQMQQJk2UvPLoZtNSlK+Nz+eFMnnYVoIouOjmu
	Pk9Cqi+uAFSOUcQ9EY/ZmNAYMuDV4kDrprse/RcAYc6g2CNoVeYnTcW0OJnHYETNZS83aQ+V8Z7HX
	94zV2ESVntRAEVODZv7KXA96qujP8NVAOUyxCVlXTHUlZs5wNS4Utq9EMZgQEQW8CAYOtPQRfjWdn
	u5HhIn2k9tpJOjo8kvgzeKaqvcIaYn9uB9jBSaRPphKGbh/nAvRrr39KIlfpyzktqf681H8nqOHT4
	D1URrlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfgR-0000000FXAP-4BS9;
	Wed, 06 Aug 2025 15:04:04 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfdt-0000000FWgt-3not
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:01:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxtlq558Dz9tV8;
	Wed,  6 Aug 2025 17:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtLG5gR3sMthibXuvk5Bd9l4Kb8kbXsv3wJprPxhgBk=;
	b=GxLzgTIpVQILsuTwSC9mDg7HXtxDFE2egKGtcC2QDylzjVVIu9gwzs+BXYh44z5wIV46EO
	0ot9/AtTjpWq/yOWqezrFMYkc285yN4SGsvLMbwrWPoCrZlvlAUH6AxRgcRnnVmKzW+k34
	iinKgI1s/1/3YQ3HG0NGHj/mKqCMWbYOik6U99OVJVvmeGR2AVTeEKy4igl79jOz0KTqzn
	JJ3E9bO2j0RWmY5KY9Km+72k17OtqrW0CLn2LkZ06mSJ3I9f6kb2Bj+hK4PaIm7Qd9ms+q
	EU81jAqOABcevJgTDYayfpcTfmF+zSBsu8Y1LrlScuI+EyLxKKSnliGKKCdDIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtLG5gR3sMthibXuvk5Bd9l4Kb8kbXsv3wJprPxhgBk=;
	b=VFxuh2X06o7Id6jccCf4sMfDuIW6Ehqty0b4/dAdAVc/nbiYf0pjOvc512u0miDl3P1W37
	lacnMBSLzB4PvbfRd4qNOFORC0VTanrJ4HT2w0a2TSJ46LF2frC2+TS6mHOhUnwtTlxbG6
	75iz/ijeuDUssbF6T8Jngk3gASdNRQ35ks5vGAQshLOEgo1x9g9tvJQhO9FYTTS5wmEwCg
	msZwG3bZy7AGZhCT3DUMVqGCuYqvuuJgnCMftk1jThailcOiFxzUCWOUdCK+muRamS8Epx
	PzKYawMvNh9at7vZm5WtyiDeq5aEDh/tzz6USohT93T7nbKKzOjiiN+5Btc5aA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Describe generic SPI NOR support on Retronix R-Car V4H Sparrow Hawk board
Date: Wed,  6 Aug 2025 17:00:36 +0200
Message-ID: <20250806150048.9364-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qpdbkyocr5pt4993qbeqcmi5bda499ok
X-MBO-RS-ID: 89bfb218fdeb541d283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_080126_084295_10FC727E 
X-CRM114-Status: UNSURE (   9.10  )
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

Retronix R-Car V4H Sparrow Hawk EVTA1 is populated with Spansion S25FS512S,
EVTB1 is populated with Winbond W77Q51NW. Describe the SPI NOR using generic
"jedec,spi-nor" compatible, because both flashes can be auto-detected based on
their built-in IDs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update commit message, s@spi-flash@jedec,spi-nor@
    - Add RB from Geert
    - Use capital f in the fS part of code comment, s@S25fS512S@S25FS512S@
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index ba81df3c779d..a40b65a35ab6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -757,7 +757,11 @@ &rpc {
 	status = "okay";
 
 	flash@0 {
-		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		/*
+		 * EVTA1 is populated with Spansion S25FS512S
+		 * EVTB1 is populated with Winbond W77Q51NW
+		 */
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		spi-rx-bus-width = <4>;
-- 
2.47.2


