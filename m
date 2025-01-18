Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D977CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBcw0LmTqDL6goZ9NmYCiCMKKyclPYew5eMg6NO1mcw=; b=KIW6PavYFzODxGzCPfw72mN6JE
	yXXCUEBdzkD2jA0REnBjFyXCyO9K0PACRiceLClx9henG0cwsOr0yzibOrlREhZnwvZlCSsQZCD6d
	Kc+M9YTAB3Vlx7EVAz6nh6xr6P2L2RHGQyOPmKDBGC7CKvNWdQC3muW50g/m7/E1bscLEEDZPg5d3
	G5jj9vUXiX6kYN+1NTxzASlMzMaMMf6A8cZatXF/kOFS2JiDjYRIiFh3TmCY6R6eWiJHJ2Z3V7yWT
	omEysv7F2c2R+oYFQKaTGqKF5uCxjqFqRuy5eyztQSj06oOn+Tm82RbEFiWOpjyFMYJE/MaXQu9Zi
	msOjJCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6qD-00000002Fkf-3qB3;
	Sat, 18 Jan 2025 11:18:13 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ6ma-00000002FLU-1N7N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:14:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YZvBJ6QDkz9sp5;
	Sat, 18 Jan 2025 12:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBcw0LmTqDL6goZ9NmYCiCMKKyclPYew5eMg6NO1mcw=;
	b=FNTGPpJdjdxVi10wdAhpxdEr4KB5UzzIiYtpFOOjGX0DqC4/liMlCXf+kWOZsVvO9jk/iW
	Mghc3DbTLwVdfpY3dDzd0MB8xbOpwCrwOo0KWy+I4Es0oL6UHUjVUyD6m+VJnEuVTrNFqR
	R1xGWozMzUzxzwH8rWT4EqOD1cLmr02R9GSc+3ynyG7jdqohm9jmDpZQ+co/FMyPoCXPza
	Va6sZvZF1gKuxyzBL8AFTlx3wJ2m690bqJOCPEcSv7tia+4mJcZmvbn2N8/aRj75vFswQz
	1ruyNnIydMnh+c3pZ+rD55KoNiuZ79BZQuJOFywQraxDF6EadqYmRh+qvqbpCQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBcw0LmTqDL6goZ9NmYCiCMKKyclPYew5eMg6NO1mcw=;
	b=pbYcVnBFyvxJSQGYbyA9VxHSmYJJJZaSFbT04QNlmX52gh5Kija8g+LSA3FrPoMM1/fKIm
	phe8jrW5siwFzLpNeqgRCjH6mGXBsIMTeA2+Wk9qrmwc8niHWJ0ZFULH7W7QXSmJnMSYki
	p6OsewZMzKP5gwTtkCtYg13V5XrYf9cuey3Hp1PBw4Ux5uNKuxI6OJKiTNTDEplgeojmnI
	cZULUuA67HuUHseU4HxbxhH/6uFJ7Xc4kG8k0fzbZn3Clo1Z5EsteMyQ3I3+HzHQp+2EjX
	q1K08EkmBDIcPNwMNgEUGvyefkoxP0a8mB02ata6/vsdR/6uDhI51QUFUjMvyA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: renesas: spider-ethernet: Add ethernetN aliases for rswitch
Date: Sat, 18 Jan 2025 12:13:11 +0100
Message-ID: <20250118111344.361617-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ha87ag9115gp9iwd53pa1ae9muffbu5e
X-MBO-RS-ID: 8ec3538ef4cec32a9c8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_031428_508404_F2B4A8AD 
X-CRM114-Status: GOOD (  12.73  )
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

The rswitch has three independent ports which each can act as a
separate interface with its own MAC address. Describe DT aliases
ethernet0, ethernet1, ethernet2 for each rswitch port in DT. This
allows U-Boot to insert MAC addresses from its environment variables
ethaddr/eth1addr/eth2addr into each rswitch port nodes, so Linux can
read and use one unique MAC address for each rswitch port.

Note that it is unlikely this would break existing rswitch driver
operation in the Linux kernel, because as of right now, the rswitch
driver already calls of_get_ethdev_address() for each port to read
out the MAC address out of each rswitch port DT node, and if that is
missing, it falls back to MAC address settings read from the hardware
itself, and if that also fails, it uses random MAC address.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 069f36ba53a4f..55c7c54411be4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -5,6 +5,14 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+/ {
+	aliases {
+		ethernet0 = &rswitchport0;
+		ethernet1 = &rswitchport1;
+		ethernet2 = &rswitchport2;
+	};
+};
+
 &eth_serdes {
 	status = "okay";
 };
-- 
2.45.2


