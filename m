Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A62510F287A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uxIhcQz+uY8xYqeubQmy4zBk41bpC9NrLZw4sfycZOY=; b=opwoXIekVR2HweOFbu7CjwECew
	QpCa8tgdWZWN6EbmETh7ZErv7N1n+x/Uy1OOQz0k1UFhIfK6oU/7TFsH7MqxnAbEFoVL5ErpzTdv+
	Fm2yiRUfRuvEKrhz49XZWwPCHEua68435ER9SXZMScU87yuWiyj+DT3g00iXNff1UT8zwGR6MRNXf
	J4Q/O+nqP+djVuf08g7W87DxPzjV86R5p7LZJdJNS067fx4texC8vvQFphHcwl0wEWI5/ZO/FKbDS
	d3TDQacNztOeZXDdY7wutsOXtbWv9NHuuIcQ0jDVz55pG3tcoUH9yFvRJ51shNww2C0/k7fcp0vQh
	sDe1P/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6g-00000008Ldg-2wEt;
	Sat, 28 Mar 2026 00:00:50 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6e-00000008Ld7-01q9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:00:49 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fjHht0Prlz9tRh;
	Sat, 28 Mar 2026 01:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxIhcQz+uY8xYqeubQmy4zBk41bpC9NrLZw4sfycZOY=;
	b=LzNm66ylRz4LcX64+RAFF0FHI2UPUtxR/N47b5zpZuBoGznrWTYNCqMRaa4PaLZTUsxUkZ
	wBrSZ4jf5RrdH52gHBuEhVpzzTC0AtfuRfBsxnEWQdvkB/TZsTu32eNvx4p0yygGwvXtEM
	U3x/j5zSJoDBLgO+aobn5OOl7VAzZWofC/CtaYF0s7j4Pdavl9X7Jc8ZOwtSwVUMk0Mtux
	Vn8mDPto9JElZiYS5OvTm735TVWL91VymMNrvU/iLc/ATZKW9W9TMmoOjue5JVNCh38YnE
	vhX5Lrd8GvsY50AX6Jq8D5t3DCB4XYs4yYW2l4En/nJswsOwObT/QHXSCpS5IA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxIhcQz+uY8xYqeubQmy4zBk41bpC9NrLZw4sfycZOY=;
	b=eQMABPFXIdFolBWrjZe5+adNdsZNjOLepTSQBJu1X8Ui+6OJLSG+YGVqxPsbYoBK7or8Vs
	hCO+AWJq+UNVKbEdIiDDAWtUe9KPFt2mTGpQ5s6QQOMum4XAgrQLbO+rTf8QfhBcLS55Vv
	J+qWGlxJ8lJRtCSkXubDtWx4EZsXzFuTihmmjGTzhdHi4IgFrmzT4+xWDqMc/IRKtIUTaW
	O5RgKbYz15SIYRxZ+XyHeRW4I+NBE12bEzKtANYkmFDKprWw3h2gGDVWzK4W9iCbuw9yjZ
	+bF+9zg/57yEHhVtdLUxNgcfHkyIqF4jxy2kX+Ekc+dX36sIgWhtrbujc+DtQg==
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
Subject: [RFC][PATCH 0/4] Describe coresight on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:17 +0100
Message-ID: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rn6667sx9porg5ch1mgt7kwc9376sh86
X-MBO-RS-ID: d6eb57af618263a1f46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_170048_191398_3518E5B3 
X-CRM114-Status: UNSURE (   8.82  )
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
hardware, therefore I am sending this as an RFC patchset.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   8 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 120 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 123 insertions(+), 9 deletions(-)

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


