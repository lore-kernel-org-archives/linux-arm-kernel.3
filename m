Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77ABCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxHa2Wmn1MoHK9bZLKpvY9RuFSQ5tI5HQ0tCKRVlQEk=; b=anN2caZ0/jr53H31CExoCbDd4B
	BE3hfpAwFr3+4Gh0xbcWSiLrxahpuT/or5/FJjrcskxeOmMe3Ujc94WhN438GujC1lcC9LIfAA2yR
	MaVWohlFMncjlN+QgTqHvTBqkZmcKx6sit4WUgxQ+ABRKO2ScitEJUVbaxrdqa21PqgVG3X9QD6wT
	g/J0wBT9J79nBI2PmQZEl10YoTy5hyInK2WQeec4504Du9dDLJzQJGCwqFNtE1ns2EAgGCzGMRsu5
	70Xcp1W418qBnrmm0jtlOXFn4kO+ohjoM1TJPraFSIonlU8ycU4VarYnbtI1wI4gK5HUpKIAjWi/C
	XNaOUgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HR-00000003hOl-4C27;
	Sun, 21 Jun 2026 02:51:30 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HD-00000003hJN-0kbT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbSK3Yzdz9thY;
	Sun, 21 Jun 2026 04:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxHa2Wmn1MoHK9bZLKpvY9RuFSQ5tI5HQ0tCKRVlQEk=;
	b=sS26STRXYEc61YgG/vikmFYHix3OgOu7ZxewIGN5fijpmWdF17GDiQjTg5mcmby6Zksvm/
	uMpM/6nWoGkNkw7LVQepdsMzQWKf+ReshT8X+10kM87HTOmfIstxvSf6HIMSfRNJ2aRkAG
	GD5usOy+zVY4+x1pUaz/PtUhVd/fr6QDsALkTgL+MDKt6iaSTAQpTbjeAhDw+ea+bCpZ5a
	lbtHOS1WFiHiZCmnxz7XhwtenrWQjAc9jYne47BjBDSwjXmuRo3qYi6644zm/8I/HJmLrc
	9OvQBcKgagclBlcb4lCJrnj9pv1WHmS5sRBIgSodZQO9s6KklaHe7LXxBZAgIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mf8JOBie;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxHa2Wmn1MoHK9bZLKpvY9RuFSQ5tI5HQ0tCKRVlQEk=;
	b=mf8JOBiesDgD5q6JhJoBsexdYZ81tOfMZpmcw7g9cF9hexrf8JRv998OD1pn84Y1N+Uhy0
	3Hr4BvSzB3/4eBoB0LVFXFRdkc9WU0j0Up6xoXFwfVYe6obtBr49mxLD2MfFdNtKWDLoF0
	Qal2CodYCxznQW/BX2lSnNVfa5gsmuvsLWI6VUloe4YoCyZlQBFljMdaxX2wuPdI1wPGlI
	7lbLqPY5SXywZKCrM3axoMS2/wuQFHTdrCa0p4ENsO7QPZmAcI9wMf9GSKV8FPVJmKhYJF
	y6WdshglspW2PWeb1kKsLVOLtJB851hnNSkVvI+TXuWyUr4sGDkZ5T/gZ48kFA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: renesas: r8a77970: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:27 +0200
Message-ID: <20260621025052.406507-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 785aa8f8b571b4c167d
X-MBO-RS-META: aiqer1mfhcrqxy6taayzeomyyyjzqdqh
X-Rspamd-Queue-Id: 4gjbSK3Yzdz9thY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195115_377243_948885BB 
X-CRM114-Status: GOOD (  10.66  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

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
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 1f6676e2795a4..f7f1f280fa0b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -91,7 +91,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


