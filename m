Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BE0C02188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu8ULTNQf6vReHQonx+XmcXAdagv6ur9LyVq1l1Nr9A=; b=zrveJUhx5D3wIupkyXRBV8nbmF
	CvF1qjn3XXtY6JaeCmsc31+13qejS4PzHg9xO9+uIEvX5c/Et95/cNsi0438QBz4C3Ge60pUHEhvb
	3tls84cRPnjpW4sW8W9hOk7wD3NdUYdWvkEwfU1LB+BbnKu2XWL1C0wk4jVBRi4GI3HuTdhhHweGo
	uO5QYwIDE+EoHRcAhANbpOBQLH6BpNIVO053VOn+HhpwD9ouaDlyKAxkSXPmcW5HfNJRxjhvm6JKB
	Y2WRiAvAljjgCsX88zNUUn2gnAk9McRBragnFniKJykbEVndfdP+H+oJ7ZhaI87EOZ3JOuR7dCjLl
	iKQFX0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6oz-00000002FbJ-11Ob;
	Sat, 18 Jan 2025 11:16:57 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6mU-00000002FLc-0kVT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:14:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YZvBL1CXJz9sn9;
	Sat, 18 Jan 2025 12:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu8ULTNQf6vReHQonx+XmcXAdagv6ur9LyVq1l1Nr9A=;
	b=WXq69I56TtPOVHwVlMVNkzSrXAmlxZQw+cnib3TSYv4E+W+pgyxbhj0KzbULwi+cXLcQii
	iMZLnBBQtwbK6oB02vm+oAEUck5HZJoY68ic8dW0f7sY5hEu0JXcJa6SXF+Y6r6rZhBhhF
	Mjlh+VmXHW2biGWSipgERs/lZcqTrkrjCuYZa1j7iwYblxMJ70duT1dGk5HIjs2R9Tj6MZ
	ToAXfhP8e7Mflh8P9LMfl2tZmP50wnD4qInQMMMCH5lccjrDULWP70mzLC5bYZyPYm6omm
	pJQhRGTZZBg4jYc10YK2EG8C+1FT8UE8iB6qMCzd8reCypF3TRUWabnSY5yw2A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu8ULTNQf6vReHQonx+XmcXAdagv6ur9LyVq1l1Nr9A=;
	b=R95BPdnST0g3Q47vJix6hYztsLpN65YbPVQyhgqlZaiGpeBbR/x90BmeIV0ISiiUFJXulQ
	SA6pnMWD3HxGVtnbO/ivKDPx5fdahAwj2kO2/dZt2RRQw0VHCo89okK96wcVz55z4qoog/
	J05vRVC57dDebOGeCtOuvCiUfGKqXBGaRd1QCWCSJ6/QXk7UCGKz+lvAcDJzaoJTfHazXE
	tVHJ1P+TfrlSp6vrjcbkO8l3oTOjIIUPf894G6Yu+LtdrdVD3NhNhDXeIVWh9BCYFdlUPs
	kK2Viohu0xvDRRQJNXzWEVqYOJYPPNZBFSZAJy3U/6WVFIhPjGfA4OPatcIEjg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch
Date: Sat, 18 Jan 2025 12:13:12 +0100
Message-ID: <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xhjmjm31tqrszmahhujpwwp7xfygckr1
X-MBO-RS-ID: a579b2b49b15999622a
X-Rspamd-Queue-Id: 4YZvBL1CXJz9sn9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_031422_361856_2F509182 
X-CRM114-Status: GOOD (  15.01  )
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

Each rswitch port TSNn has a dedicated MAC address assigned to it,
so does AVB MAC. The MAC addresses for each rswitch port and AVB,
four in total, are stored in the FPGA populated on the board and
can be read out via I2C from bus i2c@e66e0000 address 0x70 offsets
0x58 for AVB and 0x60, 0x68, 0x70 for TSNn .

There is no single MAC address assigned to the rswitch itself, there
are three of them, one for each rswitch port. Instead of ethernet0
alias for rswitch itself, describe alias ethernet0, ethernet1 for
each enabled rswitch port. This allows U-Boot to insert MAC addresses
from its environment variables ethaddr/eth1addr/eth2addr into each
rswitch port nodes, so Linux can read and use one unique MAC address
for each rswitch port.

Note that it is unlikely this would break existing rswitch driver
operation in the Linux kernel, because as of right now, the rswitch
driver already calls of_get_ethdev_address() for each port to read
out the MAC address out of each rswitch port DT node, and if that is
missing, it falls back to MAC address settings read from the hardware
itself, and if that also fails, it uses random MAC address.

Fixes: 412f2224b3b6 ("arm64: dts: renesas: s4sk: Fix ethernet0 alias")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 4bf526535ee05..86a1945127529 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -22,7 +22,8 @@ aliases {
 		i2c5 = &i2c5;
 		serial0 = &hscif0;
 		serial1 = &hscif1;
-		ethernet0 = &rswitch;
+		ethernet0 = &rswitchport0;
+		ethernet1 = &rswitchport1;
 	};
 
 	chosen {
-- 
2.45.2


