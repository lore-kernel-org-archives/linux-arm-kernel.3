Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E210F287C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1/FPoQhoSRcFGUM/A96CeIQjrOtIjqWo2SkIO9w56Q=; b=j2ppVOsuxD5CJXONDugCBm9dSu
	DoI8X72DNwE8sZK2543tzroCLRfru4dDgqc+ReZGTAwKN9oPixmdLj0TXN19+R3QAg/+5mwVC5Xxf
	d4Qe8GBpb09EzDt2bDaueJ3avhlbLOwxX9kTgAURYw34nxqpYoLPAI1XLBPEYypMAZZaedHoHTX6R
	Lp4s2iseLxxX5/py46b2TdvptXuw+GAKKf0PegVRTfp4SwGU7g048CRegNnP9ZLNsD84Dhb38jJbe
	B2vF/amkpic5+1h6qO9LNWy8CrKz34LhQOEvUUQMSC/K7TR8/c/mDrSDK1G2y0IUP/ypeNIqpR1Hq
	3HtEOenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpT-00000008KRQ-3lzD;
	Fri, 27 Mar 2026 23:43:03 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpR-00000008KQ5-3Qa2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:02 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fjHJJ36l1z9tCf;
	Sat, 28 Mar 2026 00:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1/FPoQhoSRcFGUM/A96CeIQjrOtIjqWo2SkIO9w56Q=;
	b=cl5My3rmdWoPU74+2Q387hWbL5mAzm4v+eiLM4FmBAjROobAfyHhM536kD+WDZUHEo+erz
	/F2RW6dfYzODUxoTBSpW/TUh9JgAv7BC7I6+mKeB+JCrjHMImijp5TUEwVNGn42/BOcaRu
	6s0otIfUqhWhB85gafUO5xy+mu6+gcfrtlV8SQoy8s6UVQ/626mij+MbGgH35k9oarlUSC
	94W8i2YBQuu6zdYdPLV+l1hWhDD5AdkntenY9ZRMyTBYu/uzpoWujfP4WXGqQDH7Fo+fId
	Ad8IrdFRO8FnoOoOw5NVAAahzLb02k6uJ/bfsf3JmlA9MTmVvmbL9E3+KEF15Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=PQoCh8C2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1/FPoQhoSRcFGUM/A96CeIQjrOtIjqWo2SkIO9w56Q=;
	b=PQoCh8C2G2LimjyzDy9CMHSzRCGL1ASMPpzt+IaRaX8YoDwv8s79Ogbtl3p+FkRk1lQ6jX
	iImMPQRDukARFDqPVXwEtkzHRiEqjT2hMyQrnLlTR9Ze26IFQLgbopWWWnmoK6cmxxP7kq
	EW9obBXyRVOgCaHh2ExETuT+V411C9wTL2nVT5xKNFAGkaV37emAIANHZdCmXPuBGjS2du
	Sg9J+ST5VeT8yy11eFPJd2jnSknmzTZE3nAnKv39mB0G8ka6b92Hs4Fnrw3mXZT1f/QGfw
	fuLVdpa5aKG3zBm15hMG6lpe44/mjguYSi3vOzLCyuz2qJfeqDTPZCFKL8euXQ==
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
Subject: [PATCH 1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:06 +0100
Message-ID: <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 53e9acd8f93c1fde79c
X-MBO-RS-META: 7hfe3ahzxos9eegf7wyzf98mst8ab71t
X-Rspamd-Queue-Id: 4fjHJJ36l1z9tCf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164301_997019_509ADDFA 
X-CRM114-Status: GOOD (  11.80  )
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

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

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
 arch/arm/boot/dts/renesas/r8a7778.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index 859dd29dfce3b..7db456b19795d 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


