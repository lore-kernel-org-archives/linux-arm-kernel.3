Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E507C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=flkzUkiWLWcRUIyHVsR1WaXcCtF7WMzEBAVU0LhMkI4=; b=sUO97JfgEvwwavlepOnjMot4so
	ZTe3BaU1EgLDo6HBkku0KMJQq0UNLI6dwW7hdVX2bBEcw4Nhd/XsLPNSDy8eBzarr6Iixl9FYbkdi
	+aKBkmBpDbgFNX7hQumTfvBHBpzJGxc+q3NVscvIttOlaMKqm3pH9i0GX70YLfDdS3nq5i8zdM/IF
	N8c6gIpaRF/3aiJP3jpHViyL/zZPp1py4VRgv2PVBLFmjB4Fd/M6jJ9d6lKuqCRzv0lfWAh8VAGG5
	chbKBwkx9AKSAteum5JEWnuguqcUvrQojZk8NwfhhEsfR0ipop8Dum9ye8XgJlG60D0EG8SJMHIXI
	1bwzhrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybh-00000009ddF-3orc;
	Tue, 08 Sep 2026 16:23:37 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybd-00000009dTT-49c6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:35 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hfTl54WJYzKmsk;
	Tue, 08 Sep 2026 18:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flkzUkiWLWcRUIyHVsR1WaXcCtF7WMzEBAVU0LhMkI4=;
	b=APD8CwNDttg9oKIo3v4USOZYbSVrALPOmSCOHHoiVIkMuWlVoNXIwq2Ltb4OlTfRFzDgXp
	zq64NXafpSoSF6RKKY8OjVfE7wR/Mx6K5njK5JhK8GCNItK5csBB3mAWDoK4ZGMi2R01Dy
	SoErdqhFKdj+8wlAoIIIK64hhzDY8J+RE13kHvRgKOz0xsLUw+jh9qG9hTuOyyxx8iNTur
	aoz/J7FQM4pnMKg7UDLJY114T/fgsp8MfhkaVPJAiBi8YwtaU1wSallB0qBtgfddWHqWC/
	gi8EvqGrA5NscqXSVWK5Uu2Bx2XKcb6tiQNk/GUEK7ZZGiZUD2OOkQ4eww33jg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TjwP2Zoc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flkzUkiWLWcRUIyHVsR1WaXcCtF7WMzEBAVU0LhMkI4=;
	b=TjwP2Zoc6O6R5Kpzkk14RSoK1QHbTJjL9LSBz6CrMj4LVWe9UG44E1XLG5iDqMijbsjJy8
	y2CHGQpCCMEKWg/U7hIaDI84pn16oZVPmDFkf/Xlq9uwQdTrAVnHX0ljVRhRYP4eFFS4Wx
	sHT8GjwIlS4VYuMX08o3ABpZLOKBCRwJqDDKpL3Pd91IuLes/ZqoX1bpvY9h+H2HRPhnRo
	ryrlRNrI+0T2ZbtZC5AzIaBchdrf5muXsQD6NZWOTN4OzbS5DDTp18Mrp6LfYuH8Bagl/z
	77y/K1idW06YDVl/FlX71Qr/GpN0jbjydQTQZjuQN34XY+ljRBzcU4bIbEhvGA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
Date: Tue,  8 Sep 2026 18:22:50 +0200
Message-ID: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: z33uh44ze4qchqiaf9gykhaqshm67u1o
X-MBO-RS-ID: 2225b73f969bd57e180
X-Rspamd-Queue-Id: 4hfTl54WJYzKmsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092334_172412_C6290290 
X-CRM114-Status: UNSURE (   8.73  )
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

Fill in missing #msi-cells = <1> into the GIC ITS node, update
its-parent phandles and fill in 1:1 msi-map .

Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ea6495261c2bb..ca17bfbf83fdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -809,7 +809,8 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
-			msi-parent = <&its>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -857,7 +858,8 @@ pciec1: pcie@e65d8000 {
 			resets = <&cpg 625>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
-			msi-parent = <&its>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -2165,6 +2167,7 @@ its: msi-controller@40000 {
 				reg = <0x0 0x40000 0x0 0x20000>;
 				dma-noncoherent;
 				msi-controller;
+				#msi-cells = <1>;
 			};
 		};
 
-- 
2.53.0


