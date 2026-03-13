Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC8107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JNJNBe744ZGzg9YjQ2tzTZC5HYngRHwBIcHZRRMHlWs=; b=SjDTk2I1XbbVkduvOmtnc11KAS
	ieuxzZdUMOLuQ91wQBpT6KbMm0bYjgRaC/AvokHifZ8nUiHDCG1lVWpRt4tltksaXmPqyxLnZmOIB
	lWql7/yMONxdSmJbjbBu/6d8+bH3+DsAlmV5jcPE1z/iclZycQ3GNKYe2doG3CE0mug/Av+8IwJl8
	ADVsyF4CZAwOYl34E7VMUxk/j3XvKa9Bl6CW0GNkNW9GDZ6QJ1I/B2HVVIVL8qqFnyblEQyq+rWid
	efzTNoqJHWAsPpDH04Pg4/hV30nhbll0bWeuRV/9JclUvwDptDfeMjOZJImGowG97Mm666QD2ukX1
	NuwGF29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z5-00000000fNg-0U9M;
	Fri, 13 Mar 2026 16:40:43 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15Z2-00000000fLt-1oNb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:40:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVbD6Vkcz9v0l;
	Fri, 13 Mar 2026 17:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNJNBe744ZGzg9YjQ2tzTZC5HYngRHwBIcHZRRMHlWs=;
	b=eYQEFcPirCKORhXsborpIu+UncfhB0e8PsdjV6dPalSujgIrHJ/U03m3ODQgq6yismLwnT
	L7EZvmus6MTNbpEBt3FDd+I9TSYhCUpUGVddJobsSXcv8YYozesxujSndFTwo8UaVI8Txp
	Axr5ReXic9C55x+1ueCLwKs+4d0nRYqAz1WVUeae0GaaFL9UPwCkk+RpUG4ScZ0zAPgFX6
	ApADSt4m/gJT/ipqbXtOw0DeBsXmVaV3ZpVw0Pbmk8wybDlpT5xtTTCKfXADVXxOlwHI45
	qvv0EFFrW+51GTgbevnx+ZNu5oes6dL53VJaPcJ930Fm96spFDDmRYZOHfgKTg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=muToOyAR;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNJNBe744ZGzg9YjQ2tzTZC5HYngRHwBIcHZRRMHlWs=;
	b=muToOyARr9J+fp5D1Xw6JdAqbemighDb3yVmE4sIyMqOsFFgUU1q7NXvTwAVephyWIDvns
	x1buh3bgFN922iSjxV/GmnvIS/LWsY9B4RKdwuuM2rOf2yAMHW+cG+ubIDOwXJ2O7w9gsj
	dKA4CuzDWsgTn6Oyu9/TbppeprQVsrs2odQa8KhrU04uNFhO2E8t2orbyK8wRyxEK60g/A
	+GNFbjiDrRJB9c3H13qnY6PcO32Rxa8nQFiUUSIBSSZjKvQGmoRItcTAEmMrgBjjF6kZFn
	t9kJS/brZT/kcGgIH5YisIIuRCEom1p81DDmWLgucuvGTjAKsspNCIBQ75ZLdw==
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
Subject: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
Date: Fri, 13 Mar 2026 17:39:02 +0100
Message-ID: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d6638a3d09f41d33cf0
X-MBO-RS-META: qicis6mnxoqgbbuayxctnws8fx9coqp7
X-Rspamd-Queue-Id: 4fXVbD6Vkcz9v0l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_094040_747735_58AA5D6B 
X-CRM114-Status: UNSURE (   8.69  )
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

Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas
indicate that compatible string "ethernet-phy-id001c.c91[56]"
and "ethernet-phy-id0022.1640" must not be followed by any
other compatible string. Drop "ethernet-phy-ieee802.3-c22"
to match the schemas.

The KSZ9131 schema does not document "txdv-skew-psec" property.
Fix what is likely a copy-paste error from the "rxdv-skew-psec"
property, use "txen-skew-psec" property instead.

This is compile-tested and schema validated only. I have discussed
this with Biju and they could perform tests on real hardware to
assure no breakage. Please wait for their TB before applying.

Marek Vasut (4):
  arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
  arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
  arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
  arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi    |  3 +--
 arch/arm64/boot/dts/renesas/cat875.dtsi                |  3 +--
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi        |  3 +--
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts      |  3 +--
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts |  8 ++++----
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts |  8 ++++----
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi       |  6 ++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi      |  3 +--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi      |  6 ++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 10 ++++------
 10 files changed, 21 insertions(+), 32 deletions(-)

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
-- 
2.51.0


