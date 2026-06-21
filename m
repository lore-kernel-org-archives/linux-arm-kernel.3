Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A7FCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKuXq8RbfvkC0lW0DYT2gTn2jf/chp20OOtUVaN4ri4=; b=Ct0AO3EZfMhlU6bjVjvam9dlHn
	InrBJ89zN59AfYRzWu5EGvi8Cj7AqdEQs1GPLZNUtUMoGiodrB3OST44jdxpYNkLNVntYOhrDDOHo
	cv64VP+zD0vvlnbuVSZLhYSzC2OHOfzGGoyk61/eZD8poaGRct2QVr20Ssegbip5lYlF3nsGINpuc
	UnyqJlbFmBHeXtbDzo5tnwI07+5gHaSbBJuFA4d62qjTVPeyD+TUyg4kj7yt65GYbsiy5EqpSEOT0
	i+iGO4ipy/XSWjLyObyEQOavuubb4vw5iFI+swfv9f5DYlOgz/AS7mvw+8BZJKfjZRMwJPoWDCxLa
	Lts6hdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HS-00000003hP6-0OrW;
	Sun, 21 Jun 2026 02:51:30 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HF-00000003hLB-3fWZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:19 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbSM5ZQ7z9th9;
	Sun, 21 Jun 2026 04:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKuXq8RbfvkC0lW0DYT2gTn2jf/chp20OOtUVaN4ri4=;
	b=TnKTaEF9OqqwCHw25oSNGzTlhw/esnIR49BuSg/RIYIUtQAw2ak0TkHWhMYE5c01JsXOYF
	jk2DQFclaKeUSS6uxnB4mvUoUHJKMnoR/lFc1hrEAFlvxuTaQTWMckiSQvgwej0EpdnFX+
	ykb7+AzQItubBzGyV1DVHJnoO7u9cEyZyc3Eu107QeB6yPDXozbYLcEUvKW4jngt71dCM7
	+vFsJSZtN8ahoItL9DBni+/yU1V5xyKnpC5CBHYWBV3U+c5CmI/n4gURvt5fZ5sAVhqGaI
	qxDIDuXEXkduF+Khp29xOGFR2vhRG3Y5w/8y0MIp7ZTr7J493psUdseOXlNZJg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MKsbY6T5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKuXq8RbfvkC0lW0DYT2gTn2jf/chp20OOtUVaN4ri4=;
	b=MKsbY6T5YjFqb/pVSBs5P5jQPYkdH/CTgaC88kL2kf9yg41EyXR4kazYPxuMFSDEXJKwgH
	dV6U6pAWlo+hqzropgG5iHJaWWF9PqTDTye1Eqsbp4y6iOvugNZyJTYh2J9FwK8tbHqDKJ
	syTa7M/8L5Lmiu+EvtzqwJSYS7c50o6JMPs3PwbnZqINMiUtThVD64HTmWDw8EsqTrKCjB
	vQuAPw8Coz1whdg6G0jtSclQdjtFoQ4LTlfthOTVqEZdy/Uuw2KzQhncr5PsmxBSMGnLVV
	NeyPoXxw81uNeEt5WaQLXhcT5lxglO8M2gpZvvMH2dX6ycHDB+5eSC1rdJuUyQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: renesas: r8a77980: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:28 +0200
Message-ID: <20260621025052.406507-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a51831f5e06d2c34085
X-MBO-RS-META: hbxon1izeimnesuum9jbd455zegf171b
X-Rspamd-Queue-Id: 4gjbSM5ZQ7z9th9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195118_078581_9982BFB7 
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
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 86b7792d68fac..514dafe344786 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -120,7 +120,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


