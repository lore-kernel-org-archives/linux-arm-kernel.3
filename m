Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B803810ED65B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d0XRUkzzW1GJz/dTVYQ6PaZQddfUNmSrvZmLTzAfyA=; b=OYgjyeC0jDbdY2a/MBc/pmVkjr
	rvlir9NOZ8l/u2at7YiK2EvGyo4+hbzu4pH0djq4Q+Y6N1bisf8FuqczoaIynlNiBXZ3YITlvO/Mp
	ngxArRio36N2v7PI3J8R67jpgBWAy+rYrSCICgvnSgs6agQ77Hota8TN0oGeC5Bvwv8Ic+nkpeBmF
	fbZSMRl9l8W3dZtEu++E1MDTB+y4XzLVhFGUYaeDVRJLTxHwCx+8KlM/WrO3MG6vvKp7xdblGJv6g
	xZldAy2Gb8sKkKpw4HJ106pTpa1i41USkGGdAKLPhrrApqEzHmpaUpkAWtX0dr7B1FXfw2tnacUCz
	QYK/SpyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Gpg-00000008KVl-1iXR;
	Fri, 27 Mar 2026 23:43:16 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6GpU-00000008KR0-3EPY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 23:43:05 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHJQ2xRtz9tWC;
	Sat, 28 Mar 2026 00:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d0XRUkzzW1GJz/dTVYQ6PaZQddfUNmSrvZmLTzAfyA=;
	b=DsYv24j6NH4sSFkMofAM6W9GVnlzi09/t9/0trnmoICTCN0DGvRtwPYwdF2gJaEpU5W4z7
	Ed1riJrEBUY1uEzLr6YtLeziO/i5gQv47DDDi15GfEz2MQMwxHb00cjfQ04Z6i6Dm5zJVg
	BCoohlk9WC6vLH5S34trntQpiPAeVBTw1n7fhhdw3E85pqFBOq5cxYXhAImUvx98yM4GYo
	qj0D+7ShTIGT3A4aZb8TlJ4CpYIa/Ifl/odtAgOxgpHn7YhodXUt1prZCUhKZwb/XR+046
	OuqSKwUjODL8skStpflxVDYoMq/sadl/DLueazS7eKeG0LL7RRW72hHhWo7MoA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=cEswKJzX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d0XRUkzzW1GJz/dTVYQ6PaZQddfUNmSrvZmLTzAfyA=;
	b=cEswKJzXEjOrGkMo/KMb+Cow7dkBvoROupQtW7uPDZs5IHHRJFNlb1DF9o6ghGwHt1xqV6
	tQZHXv51Ej75hvIYucw5DGiXmpHH+IK7O3/VRtxAmLSWaqP3IXPvEDCzoAowT5QQuFouwO
	YJfqm0q/q4YqZWlptK/Paj/hYqW+PcRIGCinrXV+pVJ2jJnXgE+aaitRjq5aZKSEUaaAZY
	/+sJvFhGOykxPqZDAr0Qtrrdn9K7jGtLos9EwhmOwzaMXeXMa5CNQn3vOpMUEXY7ZgAowK
	kXig7CdUuP/7Ftqi9eXVgSpgHesNcYwHJDqTOOO8PavXdbgntvJuTPCCJ7gbNQ==
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
Subject: [PATCH 4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:09 +0100
Message-ID: <20260327234244.91707-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d36fb0b84d85ff3c2b
X-MBO-RS-META: jiqqe6t5uem4snfmxsmqg4gppsi5t4ss
X-Rspamd-Queue-Id: 4fjHJQ2xRtz9tWC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_164304_948799_C5877520 
X-CRM114-Status: GOOD (  11.74  )
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
arch/arm/boot/dts/renesas/r7s72100.dtsi:40.11-46.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 245c26bb8e037..6ec57ffa72e87 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -37,7 +37,7 @@ b_clk: b {
 		clock-div = <3>;
 	};
 
-	bsc: bus {
+	bsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


