Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABDCCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 04:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=; b=RYotB+fPunBdPOXzKXIkQMi2Hc
	Hh/PrCc8AoHIwSeuXtVG4EdaPO8doeIicr0xunonvleMFpmL/C1NP91TaDkXlThlp1CO0uePptwBC
	fN1XSbqJg1YT8yLzvBC6vnwk8geBWT+DbM8huPO9EaCAS8+4BR2pJuvtyk/4o2zXWes+g041FkpMO
	n6ZQ0TaHnG0Y0QIA/KOPaV1NwkFTxEGXUOwdnczOTCxq10Y1tdsdNrMrSgXxIFhQcR4n1w9SJoE31
	FyNGr98s3jgMb+/h20xCee8c2BiyfOmYWqHsYts9/Yebrq7MO490Ex1sK/UHLzRyFZ7lIKJiu6xSj
	PdevrZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HC-00000003hJo-2jOy;
	Sun, 21 Jun 2026 02:51:14 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H5-00000003hGt-3YqL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:10 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbS94Ljrz9tg2;
	Sun, 21 Jun 2026 04:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=blZ3x85di0Mc+8DspDB8JvOLib+SYJtaijiVM7iFGt05YDPjHvwtzoNL6u/eNZ0EdrQeQ3
	OE9Y6zqqqqv26yNtBNMYO2HvNruTWbNPn9hlKkZk9kSkhvOh2tIU2/ddkXXkSwwDAQ0wBj
	JPdYb4QB76BzuBCETFNjLnCw10ZsoKfQfRU6khb+0tVlEqvzZwRalbvQA+fA/IAFLgvYYK
	aVWKQQ4XU0UZyNHT4WX8MSa5Ehv/oPUZJPHQicFUyf6Nu47iWmmenH49V622lgc3idgWqe
	1JR6a/NzKzltYBZZcQDNVs8DTo3P1r/RFNXhIx6gMglCBSrIA+HjPpa9yNH1QQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=kop7N3tb5P52tgfdugkvynN9OQOUzztGStgYOJtjV9QyXUn1pnmVP8dolDLB2PlQ6cxEqE
	/FzyRaTZlwWLZoXfeNg3og0sw9fUvsnjah3uRorGGKNhsK5ofCP2HpqIo6gq+fanibz1WR
	5KAvKZHvhtZBErGODNlAXH1jKtP3k6c88MReV5uX7lYAy8Fe3n2v/bIfd93jUsNgX56stv
	XmyPveN1S2RzlRl7X9bpTRYudJwbNq6DLmGcqCYUp80OM4/CTEfio46Bv/L/bE99UXy0TK
	9+S+1iaNFJB4nm6+edlAh1QxJoYfhVqg7+tSjH6Ul1KrOXGbQnrVEhSTMIdY7w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: renesas: r8a77960: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:24 +0200
Message-ID: <20260621025052.406507-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ba4zb9oa13djny9jfwb6adoethxgwh5w
X-MBO-RS-ID: 00a4af7481a848232c8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195108_052664_627E6414 
X-CRM114-Status: GOOD (  10.57  )
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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index ad36aa8e75435..4f9989b5e77a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -311,7 +311,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


