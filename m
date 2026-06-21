Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A786CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwm+MXScOQYnctLBwyL1CzuVFN6zERU+XCvjLpdQOgA=; b=16+yd5FbwX5TDWGubhV3DGnckr
	iHXOjYodXOeOwuzPs7VaGXHjO7PKK5dEnrq5BhPndONvSERkjXhRe1s2FT+vwBIGyhV7VFGy+xmHV
	yKFoRhvf2iH3vgXjajWz18zLpRWaJXIipf4i0stYMHTrq2VrC7FTYht11A/qIum4rN+Zm/31Xz3c1
	BiTzP5OuLv4POXfgn3PWGRPRfMQKIIFSIzSlgPWV1C0JTK1T6mdJBfLArJ1nvyQ3SxxzSfwr2aoUH
	aOjqrRHJh+j1LRw4K19S9Mu31UG7+9n3GrugqKJwM9INXGPV8MYRr8mWQe/g1bN4JCXMTDCGqLsa5
	FjLkW+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HS-00000003hPR-0z5K;
	Sun, 21 Jun 2026 02:51:30 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HH-00000003hM1-1vPU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbSP6HRNz9ty9;
	Sun, 21 Jun 2026 04:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwm+MXScOQYnctLBwyL1CzuVFN6zERU+XCvjLpdQOgA=;
	b=yd6QlJTaw2Ca8T+DBj5AIlo+/P1YAifatdblwos8D0SDFERUupFKf9E28u8i33aZuuIeSd
	6NxSsrJsTKKQMbt6rmtuUlpaQZLgRhdOcjVaKf1RvALScRfLgADCt2EhCzM7EHyXcO2RkO
	EBiqX/wxrhSwMfO4r7jzWJf8lG+Xb6d80sYk+KUd9epuzE94Ll2MVAQYvzLmKu79P4PgHp
	7S4HRC64ZHorq1Y+15ZU43zdlDJ/zdwUPwKK6Uyf60WaznzoW+FqiqDNSNICR3ZcerfXh+
	2328dtCI5XH/Aqk03o5LhjrwXPZ4dMhogblTeCJ/Vh8bqr5BJYCsMwoz/RDrVg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwm+MXScOQYnctLBwyL1CzuVFN6zERU+XCvjLpdQOgA=;
	b=bPEMMCdOrciDHvwYBfgBrOszoFvfEQpA/IpfQtsumHpioa9d+cfDVJ7WJnJdFXEVcuuuXH
	AyU/A6H4Jcf0un2hG8txAYfbAhHPyNP5uW0ao1IY/tr5/qlxfBswJs0uaBCajr3DIHx4kS
	9YXJJ/Xm5mEJ4o5JdU4fAf8x927yNG4idz22DT+UWvsNu1kuPwG3XcIm78BT5IIq4u0eF1
	7eBU7HyWiAZS30DIBx3ApA618XVV8gppuG/qFlJmP0+2+jvExIEA6TJQG3w9o76So9wSuN
	WDtJg+MlmvBVh+ciDVIT09+ZGZUKHxWPTcO+ai5kjxMfSs9yrz+C8QsOfcS2lQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: renesas: r8a77995: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:29 +0200
Message-ID: <20260621025052.406507-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3dsxrsw5txqre8wsqoktfo4tfuo6ukpr
X-MBO-RS-ID: 62e3300bd24bf859acd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195119_647575_D33B9270 
X-CRM114-Status: GOOD (  10.66  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5f3fcef7560cb..522a49db02587 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -85,7 +85,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


