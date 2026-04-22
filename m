Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E73FAD3E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lwLMu1S7onZGhcBEnPy37BZ83bFz3InaGZ5ATIAgs1o=; b=KNdKpQ4P8IYEUoXZdo5HKzX8/9
	LPyvrdKHcd0rr74YN3mpatpbgtcbvPcDJACER82/PQDM3bD9Y76ZJ7UdTh8/z2GxcIMimlnP+DDMW
	DC5//l4U7yWbZ8GKKao+kW5E4p8G09CHhRBPPTsL1TzZdXGxNVfloTimUgNV2QzHq9g+izo5H6h7M
	sNSM7/dZnptbi/DsrUNQHwMS60FxoT7jwHm8fNUEDZl2u/m8+uo8PMPFup0fTUIyinxO+1ukchnw1
	ZfoDTjOAOhvRVTT2lv96MIkpqPe4ElOfFLo42WiyVhIVrE5Tp2LvuxugHJ0k888Vwzbmme3Y0O27k
	EKq+z5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh8w-0000000AqPL-3EHv;
	Wed, 22 Apr 2026 23:38:06 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFh8s-0000000AqNe-2FZC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 23:38:04 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1FyV6vdTz9tcZ;
	Thu, 23 Apr 2026 01:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwLMu1S7onZGhcBEnPy37BZ83bFz3InaGZ5ATIAgs1o=;
	b=F2MxnzWjr/rjOlLjFLJ8lDcdUBJ29FAPq/f1uvVSSPdb0/oqAhkewuTeIgNixcwib9BH1F
	ufGz2bfdFUqDZkCvE/fhWHsTBZ4dOZUVJwLzeEROAYG1zuRwsURPvRG4HDpDo/LlFje19T
	Bf+WzUB6INHm7vlXbaVbJHoVqeGMmHMlGzT5t/nSkNoj8fjn+a/nv0CYEt09Ch+mcGig5C
	KjK6GdoQSL/SeIUnAhEPZVdRfFcsc48RgrwogIomyf75J7FT9xhL11UQqHYzXt1tVzxVPP
	DT+8ets89793rX9BLAqgYy4K84r272bsjtmKPx7GVdOBDAr8f9jNU/K5DFTF0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nC7PllBi;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwLMu1S7onZGhcBEnPy37BZ83bFz3InaGZ5ATIAgs1o=;
	b=nC7PllBi5zm8q4iK4aQ1ZqWpqfffTF0UOAGn8p92TVDRKGXcLr1MgSJApe3kC1AhdQjJNz
	VZqOmlx6giciwQn0oezLGcBjlSEn2Ve5YykcANjhNEKVyBu/Bn+Kdl88JbubOk7eLO4VJ4
	DasG9ipzW1jla7bGtdc3qPtNMVwZPrhtsEIRKoeu9O9IJn6VW9RyYc0nsf5H6o98rmAum5
	XQptR1/oMs5n6+QOMnzpWMhjK8eMuRHIm44aBaioYXmx/WEwRi2j+xAm9rTij6sHx32hm3
	xWd2lap83nZOu1n3KBQEIDuEVSTE2ISjtDYK9O8+m931SbUp3MDCE3ru/CjOrg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/4] Describe coresight on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:26 +0200
Message-ID: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 05b81d60baa4b6aab34
X-MBO-RS-META: stzf5gfauquz79qbem1ishg3nww1im6x
X-Rspamd-Queue-Id: 4g1FyV6vdTz9tcZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_163802_724619_885402D1 
X-CRM114-Status: UNSURE (   8.66  )
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

Implement support for ZT trace bus and ZTR trace clock on R-Mobile A1.
Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile A1 User's Manual:
Hardware , Rev.2.00 Sep. 2013 . I currently do not have access to this
hardware.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   6 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 116 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 120 insertions(+), 6 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


