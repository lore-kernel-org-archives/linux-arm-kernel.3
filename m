Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8462D109E547
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Yjg699K1guUCSil6ihgIitUGHtPaDTqoF3Mueo+/+Q=; b=QQXC499Utrd9lpCxUjBlnk9LVH
	rmoqTQ4Qlkx8h3dojJXRWeRAzpsD5yy/bujj1ixfA0JSyMprsyns6bs3PYDKdwuRDvZy4u6pdiQRE
	XiTMU4F8Jw9FWbxU6rU9saOJpdMK9rdbXvGF44Z8LwdOBGFjIMl2ACHl5Xy7qdmERtzxia3iSJLLN
	MF6bgKEx9VWxVjnpg1VFLi0bjo1z1ARQm58Z3+uAvol5I8+1fJFmMk/6xPiWea+2GoaIX7uD1TClU
	YH8hNOtimnXNNfKxIgPAMnAtA/9ZlWeMkC8FniiokvpBPdFJ9jYDPQVFh99tf0le1BORZOYp8bGJ2
	m3RQNLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGt-00000004ffs-3k9F;
	Thu, 26 Mar 2026 04:24:39 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGi-00000004faJ-1Pgb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:24:29 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9f101CCz9tSk;
	Thu, 26 Mar 2026 05:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Yjg699K1guUCSil6ihgIitUGHtPaDTqoF3Mueo+/+Q=;
	b=weFuP+PHNSeuZk4Z99AEBsWnE1KLjin1uPeE94rpz85KUqqE670Iz0puCjdh1F5MBTeSnT
	EtMqZk2QgrFzGCfCW+JkuDBjmzt7guXLzW55N+mvmhh8ks6JiF304BFab3Uqok6w3MuXuQ
	9WSnOv6sp3XaT+X2L+6BQuFhZMnTxJC7IH+sDijp9oQYlP6PwCOoRValPXVWv4SAOFjgJw
	quRrZfGAVG4vROOmx6q6VWdzHNaLT+qQuBB1iRDQCsDKUVv3WIjiiUF0fSgtJ2zQQq97IB
	yQqiyO/KswRdyx7pJ2OcsG4u9Bety16d3Dzi5QEgGw5weMoigaEwr8D0HiyCVw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZnwIR4Fp;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Yjg699K1guUCSil6ihgIitUGHtPaDTqoF3Mueo+/+Q=;
	b=ZnwIR4Fpq1ARCLO51BFuLsW27v5pKmwXW7P22hwspsjS3xvOWtqepXTKgWEodUO4yKt+dw
	d/xbidZ5HL/54LGYcAReumVGIavwypoP0ypjIQJUYnvIp4VhglNyMHvPa5uKtaMMgI4r46
	2y2/DeEfpMJJcKDiGtvSL4mqKGBRbW5SSG4Zn9Y3zcp91hsd94EaWpdzDlllwqMFOgaVlB
	yZR31Em0kcUWne46oX5PTT/E6Jv/79ri3uhGJouxcRc+G0P30H1QycO7dhfB8VKrWYyKSA
	BR3lOWuQuQAFYcFn9mDY27xdolhpv00QcKXEWg4bFTaw58RJvF2iRW75eUMTgQ==
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
Subject: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in Salvator-X panel DTO
Date: Thu, 26 Mar 2026 05:23:59 +0100
Message-ID: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iyhmj9nocri5atxhy5ehfp61iek7ad3f
X-MBO-RS-ID: 09bc90222f0c3f5806e
X-Rspamd-Queue-Id: 4fh9f101CCz9tSk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212428_521732_6E9AD223 
X-CRM114-Status: GOOD (  10.49  )
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

Add missing cells and reg DT property into Salvator-X panel DTO to fix
the following warning:

"
arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
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
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
index c83a30adc6adf..7807c3f80409a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
@@ -27,7 +27,12 @@ &lvds0 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			lvds0_out: endpoint {
 				remote-endpoint = <&panel_in>;
 			};
-- 
2.53.0


