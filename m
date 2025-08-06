Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99D2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qx2Ii0d1wljD8zsF+sV0ysqIc18W0P+YNJtBHNs6vYE=; b=jGQiSeZidLaVo5
	6UoXtEbfocYK3uhaerm2Id892VZAXD+AM4PkGiP8O/l7rWq/bqVZiOeJBFBCbg/hGTuRMPriizAe0
	0/0/rP8+7DIC8XY3fSxTEqRjofU3GtpWGy0Yx+pMrSyeXbEHOHIu+BM1AcRVtR3/5abzIYLWyJqs5
	cMGLG2aOnbv2rUR770mOaX6jNWrKWl7IPiHNKCg+BBVgLS36Yz1y0c7+RWmEexWKT6Au0YHflZLi+
	kqxDmZhtpVcaCSqHS760vzE/NWoT7Hv8yeOckiz7C6qnxY7w2ByYKyLlVuaU9ylEMt5w1THrg1/v5
	rQHt4nitUVNp2/NSn9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj89-0000000G6oZ-3G2I;
	Wed, 06 Aug 2025 18:44:53 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji2k-0000000Fwli-1XLg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:35:16 +0000
DKIM-Signature: a=rsa-sha256; bh=qx2Ii0d1wljD8zsF+sV0ysqIc18W0P+YNJtBHNs6vYE=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754501629; v=1; x=1754933629;
 b=HJwTOEJxUjB+/QELnjFqLYBQX+JIpaWvXeeqLVvIJj1AVY59iHTPBDigBXMwQrrfr4xMH0qk
 T3bT5cKHUXhs1X/RlWiF0ONRKcUl6PBvjemjfhnJ7on67AI3rLyQ9MzI4Qx0ooJvoD31hzK1pZa
 Vr8i4kXyoMqkyhC3m/ccqAitSaU02qoXWE/7jjaCJK8BVKcl7MgOwmp4z3D5fdJBKrmDAZzGzEd
 /KScdYwRAPxnICkA4A0X6t3FLlJ5RMFsXV/enWKoAJz8nk80cFlL88CHS3aKBoJWJiKsTsFvwMd
 grfib+8lCt7LitH0/y0CujI/07yy40RNyjHcDYbS6DkZA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 956df8b5; Wed, 06 Aug 2025 19:33:49 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Subject: [PATCH RFC 0/5] Marvell PXA1908 power domains
Date: Wed, 06 Aug 2025 19:33:19 +0200
Message-Id: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOCRk2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNj3YKKRENLAwvd9NS8ghRdQ1NLQ4uUJFMjM4NkJaCegqLUtMwKsHn
 RSkFuzkqxtbUA71DEAGQAAAA=
X-Change-ID: 20250803-pxa1908-genpd-15918db5260c
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=OCq12Yc0a/7Oxk3oGpeH/45uPJl+C1Cx+HEhTuUSHqU=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmTJ/5+vveagHOXpQ77hDM6N5mulE4R2pU1u/O2wE2Xq
 K9CFpUeHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCRJYEM//NXlgqcvt3dv/LQ
 Xet5C40ecnn4z3dpiD4qkfD6nbNjWx8jw6Z9Z9NdBQsdTcosQnfdXBO4c+mOGT8/qG35lL3fWfX
 IbW4A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_103515_413962_D1871E5D 
X-CRM114-Status: UNSURE (   8.04  )
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

Hello,

This series implements support for the power domains found in Marvell's
PXA1908 SoC. The domains control power for the graphics, video and image
processors along with the DSI PHY.

The series is based on master as the MAINTAINERS and device tree patches
depend on the very recently merged initial Marvell PXA1908 support series.
That series can be found at the following link:
https://lore.kernel.org/all/20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (5):
      dt-bindings: clock: marvell,pxa1908: Add simple-mfd, syscon compatible to apmu
      dt-bindings: power: Add Marvell PXA1908 domains
      pmdomain: marvell: Add PXA1908 power domains
      MAINTAINERS: PXA1908: Add power domain controller
      arm64: dts: marvell: pxa1908: Add power controller

 .../devicetree/bindings/clock/marvell,pxa1908.yaml |  36 ++-
 .../power/marvell,pxa1908-power-controller.yaml    | 105 +++++++
 MAINTAINERS                                        |   5 +
 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  36 ++-
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/marvell/Kconfig                   |  16 +
 drivers/pmdomain/marvell/Makefile                  |   3 +
 .../pmdomain/marvell/pxa1908-power-controller.c    | 347 +++++++++++++++++++++
 include/dt-bindings/power/marvell,pxa1908-power.h  |  17 +
 11 files changed, 561 insertions(+), 7 deletions(-)
---
base-commit: cca7a0aae8958c9b1cd14116cb8b2f22ace2205e
change-id: 20250803-pxa1908-genpd-15918db5260c

Best regards,
-- 
Duje Mihanović <duje@dujemihanovic.xyz>


