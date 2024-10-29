Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82DAD2AB24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 11:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Zqi6Sl+Kx4Ji1QwakjgbRzaeDN7PqxTEdUVl3GZZf8=; b=XOmK6RiGx3oEHAmI1/x81ycJsw
	oz6aXDQrtqPevaXol/I1aYqMV2ZRdPiFztngbPEJsIVxDuHQAsp9oFyWY8fdtoHN9FPkUMWMlvmsI
	9a7UcD98QUCuj451AlKl8L+E5tc3R9xo/5bqMEfwOyx6U47jW8v44kfR2a3tatLktcReCg7sTm8/f
	TLSk5YPAQ/XoTvtOLDaOO7l+jM6CnoV2GR0hsBsHzgcs+9FjPN54KQIoQS1B/0BsDqFv0eGhwgC8C
	VnQd8O3A9fTsCqDThQZIsi/q3sG1NCHBBaj03QQGim+hAEYFg38wW9BQ5/dN9/9KLa5rLK+FwGr9i
	ymchU9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5klR-0000000EINx-080d;
	Tue, 29 Oct 2024 11:51:57 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jde-0000000E48X-2DVK;
	Tue, 29 Oct 2024 10:39:52 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 23B966164E;
	Tue, 29 Oct 2024 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zqi6Sl+Kx4Ji1QwakjgbRzaeDN7PqxTEdUVl3GZZf8=;
	b=T4tW4Pjh43l3XljyaRqU9KlcGnR0fhiX2E9UWADtycYVAGuymEwDQK9AL5m4dyWr+zAOR2
	jNpJMwSUvdbLtsp56XJyzF9xDuTJIOOqyI1Z+6xv8zmXV/X2Sw6fjO1MqPaHOv1FcyDPRq
	alwwm7A4KHF+3xfeMhtOiarqJjEjEfE=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 892EE36037C;
	Tue, 29 Oct 2024 10:39:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC v1 08/14] arm64: dts: mediatek: mt7988: add fixed regulators for 1v8 and 3v3
Date: Tue, 29 Oct 2024 11:39:27 +0100
Message-ID: <20241029103937.45852-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 351e04a4-f535-41b6-80ef-f6eadcd15412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033950_739401_C24DDF42 
X-CRM114-Status: UNSURE (   8.52  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add regulator nodes used for mmc.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 639c307b9984..7371cd80a4ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -62,6 +62,24 @@ psci {
 		method = "smc";
 	};
 
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
-- 
2.43.0


