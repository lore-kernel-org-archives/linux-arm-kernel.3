Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62700D2F009
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijzQ3M7lt9WAX5q5CUpCK24yq70OEqTIHjDj8vXYSxE=; b=mKfa94/6Ar7ywZAHAZaoGX1Ydo
	EdpdGI+Qk10Upl167+bG86lE2rR8se/YNAHdbTh0zmvXJKbDfbWibPeQqghczwYxPTgqEO9MZrRBT
	r1rs9Zdy5HLsU5JKb18U6n5ddnWQ9it2aiiGA5AUnvRYKC7cdsuvnaN7syuDPAy9t8zj55VZNKgzJ
	0cc30C4ee350GcTIyT1BH9fG8tlQ/44vBKP4nUtiCUoiu9Gpxmu7OPbSwy+gSTcI6NUCzyXrQoYjo
	4cq0WgPnqHTYii/d08tC5f6g3kLlw1u3jzXCiU/YctDXA2hUg2jWvlLnUZ+H837t1gh02q8jRJV1s
	6GoDrX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki5L-0000000EEfy-40c0;
	Tue, 27 Jan 2026 12:22:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki5K-0000000EEfh-2drq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C89B560007;
	Tue, 27 Jan 2026 12:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD8AC116C6;
	Tue, 27 Jan 2026 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769516537;
	bh=0Gx6pPflLqJJwsoKgpHrXwFKJ2Y0GepGl3Xp9DuOrhs=;
	h=From:To:Cc:Subject:Date:From;
	b=Tg94wtaB3LAy+HPZvLBVT+WKUJwgHhRSg47z3itDhL/7Lba/FMWRY1rE/NRmBbypu
	 7ZV8K3K+Dk9VYWAHwwglk7meODtyGSuaNAHmYNuXHfOz/GLu9n/HaqYuoJMsVOkS/9
	 Zt85UsuoMocgQFWvQ+9koRIW1hz7FchflaqDIuyzIl14fKSzsILCbJo8KKMOYGHK0o
	 YA6vh56MJsbnag+EeLq20PqcoLBBmOfRIjI3zU86t1iudeyPF+2mnRPY1YA0hIP61V
	 zVidudOySRAq9pEAV5EwKcsmc3P8Tqx+9wRcBZK0+ewqHVThbX4kaEJEU0INzmIGss
	 eMbODG8zeWlQA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Udit Kumar <u-kumar1@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am67a-kontron-sa67-base: fix QSPI flash timing
Date: Tue, 27 Jan 2026 13:22:03 +0100
Message-ID: <20260127122211.1064546-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The boot flash is connected to the QSPI bus, but that bus is also
connected to the edge connector. To prevent a stuck bus during boot. The
signals to the edge connected are guarded by a FET switch. This FET
switch needs a setup time of at least 80ns to disconnect the
passthrough otherwise the first few clock cycles are still visible on
the edge connector. Fix it by increasing the CS-to-clock timing to
120ns.

Fixes: 1c3c4df06f9d ("arm64: dts: ti: Add support for Kontron SMARC-sAM67")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index cdc9b5778041..9c0489514e04 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -957,7 +957,7 @@ flash@0 {
 		cdns,tshsl-ns = <60>;
 		cdns,tsd2d-ns = <60>;
 		cdns,tchsh-ns = <60>;
-		cdns,tslch-ns = <60>;
+		cdns,tslch-ns = <120>;
 		cdns,read-delay = <3>;
 		vcc-supply = <&vcc_1p8_s0>;
 		bootph-all;
-- 
2.47.3


