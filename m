Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB54107BCCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmfDud7/vj53ZDYfVvEyX3xy5JPfLlI3+SZjlGxlJLk=; b=dwMU7j888JwzQ88RzEzrTevow8
	4JCjokf6ORs60gpNnjgcvBHwYBAp2OXXaYsMMQ2Pyv9OVzFD8/E1TbeXYkL7F2QqIRu5jAtHbPPmN
	aGjYbIXooTMSCmb15WsI+VEa0HJab46bmSSCp/r8QBmHT9gEUp0R+nOQDCF905FV1YMfhU1BgBslG
	FaN3pT+4AppVa01vDjXjdfEVxpyI2o+RboUb7ebZqMeon56q4n88mu+7Y8fMyxTuytR95P+kkon1j
	zwvGJjSl/gLAsUO2f5kmrtrTdbgRAoWkQAud9ktggbRSgRungxlnUqrn6eNPwtN/T2jdwA1W0DtF4
	4DSTMkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15ZJ-00000000fVL-3Wh4;
	Fri, 13 Mar 2026 16:40:57 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15ZC-00000000fMv-1Oec
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:51 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fXVbR6WXxz9vC0;
	Fri, 13 Mar 2026 17:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmfDud7/vj53ZDYfVvEyX3xy5JPfLlI3+SZjlGxlJLk=;
	b=ZGj35T3tusMVvrO6yQWyfepb2e9Hm/oaOWt8/hvNNQSjB2ZKk9RTV9hiN8BJYkUI1ZE542
	xeJs/keY6e4NKNNW417gDBmOmfh2WdiI1H1G+x3qkO4cq6gmR4OWhsEhH7zoa0t12lGkj4
	AdyHb8y7PG3b6pap6MBqwnFpmJWdhbzARi+2UWLfonXQT0agXbmoAeyziXj4zalyzpjG2G
	gxKjbHd+eWBaqzrWWWjoNOqPas+jRo4X/QmPkQr3VSbhxRB3pDYgek5A7WQAbxJmrBsq1z
	IuXD99MF8mgjm8MW81J6K9o5R0FemDs47NaYKJFyC5+Ty/luGrIIT1kdzWGJbg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=o218skv+;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmfDud7/vj53ZDYfVvEyX3xy5JPfLlI3+SZjlGxlJLk=;
	b=o218skv+0Qm+US9vfFfa7gbYvOVg83V6U96J6ZxyTPs50Apw9bPb3wGh8SdtKgtqVEitwf
	y/WF9UYOqvBTF9uVLoTaOabrzYbZ123MIw4RLXDnQHFF9sCm3TPjB37S1W4J8tV8NZw/bw
	jCQ5uebtY/JN5b1sVV4RO4d/yEXl13aPNNfalEhJ/mjaK1ZzDWg+c6uxdYHolv7JUDU4QZ
	pPaXBWQT/UbYuUF2D9HHez4l57MP0M2N5SzIwdbiEemk4d725txrQoHAUJwXu8LY/HORPJ
	4OsX9ULBOVRFbua95R5uGXuMu6yBsr5MeEL/Xr0Rpee1r72S1zlRcBs0PBzQaA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property
Date: Fri, 13 Mar 2026 17:39:06 +0100
Message-ID: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2c656e22b26b43c5092
X-MBO-RS-META: a36cx7pc3wbwhupfwt86kx9gr1emr6pg
X-Rspamd-Queue-Id: 4fXVbR6WXxz9vC0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094050_533735_ECDA55B6 
X-CRM114-Status: GOOD (  13.10  )
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

The KSZ9131 schema does not document "txdv-skew-psec" property, neither
does the kernel driver support this property. It does however document
and support "txen-skew-psec" property. Fix what is likely a copy-paste
error from the matching "rxdv-skew-psec" property, use "txen-skew-psec"
property instead of "txdv-skew-psec" property.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index dd5e4b13f0f86..00e5455ea5abf 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -265,7 +265,7 @@ phy0: ethernet-phy@0 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -284,7 +284,7 @@ phy1: ethernet-phy@1 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 8ae7b6e3d712e..4643c61cf06a7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -286,7 +286,7 @@ phy0: ethernet-phy@0 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -305,7 +305,7 @@ phy1: ethernet-phy@1 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index cb5066443722c..880bd3fc9da18 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -142,7 +142,7 @@ phy0: ethernet-phy@7 {
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -162,7 +162,7 @@ phy1: ethernet-phy@7 {
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
-- 
2.51.0


