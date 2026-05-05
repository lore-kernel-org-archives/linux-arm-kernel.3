Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D57FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWuHnng5BOFVjspVoCh2CO/fn8L6gvKLnoeyOZOicYU=; b=vXfU3oqoexTYOUdVwhaUzkCt77
	yfgwPHt/H+/PJdY9zgMReGQXOmF+fs1q18TiZ198kVvMnuOyzyqfAi8M2vCp+Ior1ZWACKVj1xQ6u
	8OwwW2pHXg/pEDjSBJBk41cCzDI/CB7pX9R/uW0R+3iTi5aeUAc4suWzlqFDxNPoXYGtJqCTW2FM2
	4hVUZy+9kx4N2b9TEbi+yu2NN+63AJ8x8Ia+IfnIKT3ByLUi1TNm/ymj8v5GGmeqANaVMaN1v3KJG
	Ln+B/wZd5zvNBu4lq4WUGJES+O/oObHzVvfYq56HBat6qGaw/JYdVE2FmKUDJVG8pjzBh3VdiIgYu
	XFEofgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hL-0000000F1r0-0Vhz;
	Tue, 05 May 2026 03:43:51 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hH-0000000F1oY-0Vby
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:48 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krd3jlgz9th7;
	Tue,  5 May 2026 05:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWuHnng5BOFVjspVoCh2CO/fn8L6gvKLnoeyOZOicYU=;
	b=GglVB3tfnHbt1lRx1Q40TFoBY68Wqj/MAuW4UhAuzpX0+s5vN5+54B4roCzyzct/qPOMaO
	dHrvcgB+HnFJxrmbGOHjYdDZhX7hk/tHQylLnloTjWdM6JmU4peAfiDpPN3OGEwmOiPLRf
	ji8HCO3oaxIFu6HusTfNHDTavQyhgTx+rw8EHfz5BUP6cRUwLkkCvs9SJjHDLfU9uzoWKk
	0/rP66vfZtu3Rov6dn3IANh5KezBOCNQ82Sgu6QW0CeEp68RhA34UrZxBeXPOHgzImQO8U
	3N5pRNiAvrKetwr5oZ2n4smOZS4e/txVOqHm3OReVqY0fiI7D7DUaOjshyZLTA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mz+uOm0S;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWuHnng5BOFVjspVoCh2CO/fn8L6gvKLnoeyOZOicYU=;
	b=mz+uOm0S2YOmJCE8Q08lFXGXe+cEYLd7C/jKTm25LDIvA3KIA1NIoiM84OuwqKsKg8lQee
	saqeBS3aT2A5e6lGi/ugDOGpzjw9aN3o3LWBxILrH+mEbumJxYHjJYwUb2QhJpdvXWWkmG
	QaT9ZhslCz4Rc6eFY6C7KU/I5orJ7F5SevSU0ngrOwZRE7g9jFOQWrHBx77gTEBTvyKOJg
	M/DF4LmvadMHGahfE0lnaupUeAP2xkcNLa1SDIc5Lu9nOksCkK8lFepXnTiKsBcYe67+Y/
	B0SXLyNghReT+ku+icmLXa1DzTqREom5ucjjjsC4dxTLBHHXDrh02zoFARF18g==
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
Subject: [PATCH 03/11] arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:44 +0200
Message-ID: <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e4826d3424b96bfec04
X-MBO-RS-META: ky1ycbawq9mcw7k5buxkdftnypnozhw9
X-Rspamd-Queue-Id: 4g8krd3jlgz9th7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204347_455539_043A4DA4 
X-CRM114-Status: GOOD (  11.14  )
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

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

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
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index b26c5a7097771..a2ad79ddf73db 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -113,6 +113,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


