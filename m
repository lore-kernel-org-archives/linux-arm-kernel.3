Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5A110ED67B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUBCuiFj2jQH/vG/0JiEgrYYd4IkCs61DMQaiB7hWBs=; b=26SrtTn79yKPQDYikpzK6j28RZ
	LG98Mr8PyXStND/V4kNzlbFAhpCZop2H4xiWK5bf6WqD8Mz5K5Q1XgLHgAPVoJeUa5tZbE9U8KRnt
	IcAIz2F5xGqEtyUm0R6+438mitMHB/iXSCu3oxETzO8UNkqPnAhIYyQFL540O1q7ZPfk1QsrbqmmK
	cCzEWDxt1rY0qtM/ctkyrIXwfd6Mp6pnOcuc3wlP05fZ1rILqpvn1GCbBCztYTifonzZddOcvYimb
	sxu7b9FL0gFzwBW+8AcyCMjJsEhQuw4pPx1ZSQP2xhWBwJmUddmRSlgO5e1jiR/IJBh9f29pKA7yw
	DxhbvWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gpf-00000008KUz-3La0;
	Fri, 27 Mar 2026 23:43:15 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpS-00000008KQ9-10h7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:03 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHJL1tfJz9tKt;
	Sat, 28 Mar 2026 00:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUBCuiFj2jQH/vG/0JiEgrYYd4IkCs61DMQaiB7hWBs=;
	b=dokoWRF0T3TZnLtg6qSMh3TdwrLgiI93tpllmobUTrJP7HGOZA/4OjQzVZ55kh/FkEL0yZ
	7m/KSwp2H3HfopxWj6tf3aWYv90kLWlDJOHbvglqTSzUXXhl7k6XNRLh6i5ixw59zNWJJb
	HTHGNvTot9XVqHsofupYyNTTqzTNKbF6wmGNRDpDiWZQkSEQ6EVeuoLuXXC3iRhdASLqXd
	dgueUbdfitgBwaI9zc3Z3fIO8D7Tmn0PuejEWnCY4yX/rnH7QWeqVCVhFeEZBDP1fo59D2
	dX1EV15ACYsjsb47Y/y3O2hLBhvS+0Tu7NqYIKQ1lz4T6LtgwaSL0ISUtP5lxA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=T1a2DREo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUBCuiFj2jQH/vG/0JiEgrYYd4IkCs61DMQaiB7hWBs=;
	b=T1a2DREohxpg08+jjeGqcNCp+e/p5hCvN7+22waD8Bbpn8itdbbReysoMpQ5nKPAQAyHl/
	NOShw5NFta/w3cTiOfGDi1pZX7FWzqO+7iMDnSkey3IBQZiwMUJ7JKlNBmVNokdRpyhf01
	acw4pan5WN2T+LhWl/+AtmUGzVjR/Fh/sXaR15o1YT6CwWJyoaYZ4dn8RzTluJ0s+Qs8QO
	y6BsQVyNYEHfRmq06w/WhzsoumbKIb1zIC8LSMTXtL1ILgZRC9tC+K40IMDEPoMGJPA2ph
	BQQ7V4YsgVKL50so0Rv1lAXg6FOG1p8SP7omnhCSQNmdtmrwtOPgq7L/l3AiEQ==
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
Subject: [PATCH 2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:07 +0100
Message-ID: <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2c540faec03bcd9413
X-MBO-RS-META: qq75x81bpe9i1tbfcrxtzq5qhnm9a5jq
X-Rspamd-Queue-Id: 4fjHJL1tfJz9tKt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164302_421969_D59AD0EC 
X-CRM114-Status: GOOD (  11.55  )
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

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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
 arch/arm/boot/dts/renesas/r8a7779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/renesas/r8a7779.dtsi
index e437c22f452db..9e8a7e190c89a 100644
--- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
@@ -704,7 +704,7 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
 		};
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


