Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB94C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=po2e3KDEsipz88LwEd+sIL9aNLzOy8JRusjq+8OekPk=; b=AmCjVePwnPpjSkBG/ixpRDEjor
	lQfjw9Pm0LUBLUa+dI64RQtQAzMLa1n9kHVEWxcgNGfLrZk6uOzvK7HdcTG8MZm9NA0ZoBNaw8hON
	Ibw6LaMU9fYu6IO6MNsdWj31QOcTWjhbwUqiegheNTsOf6e+N51XH6cwOUgU9WYhciCz/v2FvJsKm
	Vv+L2Cn7t62FPFly3XoMohHcbKRFzN3iny5nyusOtnUWXOj+THg+/AxBaqxkbjn0HPh1QpbkOLP8H
	CClGAC4iECjbwPoHFIGS4qNeOmFhXOhYmfqXgxO5WWV1KVyjcyP+u5iJClfoV3TBi1c5vXHj4fjxZ
	407/EZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWb-0000000BPmU-3QVj;
	Wed, 09 Sep 2026 10:27:30 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWR-0000000BPeW-0KjS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:20 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 4EBF11D000A6;
	Wed,  9 Sep 2026 06:27:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 06:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949638;
	 x=1789036038; bh=po2e3KDEsipz88LwEd+sIL9aNLzOy8JRusjq+8OekPk=; b=
	sxtQH3dZWxO0OFWXNQe8CnV+mnIJX4PcJohIcOoECCvo1WbuFUPWlmaNL47LUla/
	WB7Os5OwxIF4CTgGdc1KXNMNERe2ikD6yh9P/wh3tIavB9/agh1B71pdU1P0drZy
	AZnQDr12idTJct1/4tWlX5XwpOovrI3kmE+Kz/ioArN+B1F6MIiHAPypku/Yw9+X
	JvjyWHlnwtWsw85avLWjMpvPGD24PLID7ywXXrgHIw6tpiOAKtH0gcvEsyBN5i+i
	zi7Q/7w7k+/O8bPwgl3xTsyyatev+v+uCeOm5x+LFlPZT/EZIfQkXI+EXNwIwLlv
	g2SJvtTkg+GJ5jaB6in60Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949638; x=
	1789036038; bh=po2e3KDEsipz88LwEd+sIL9aNLzOy8JRusjq+8OekPk=; b=w
	JxUKfEk7ShSn7M4AFDgxU87m3mrEuDemru7QKNbc1wEHiJ0BSFcz5f4Hm1jvX/Hk
	v1glF0zmu51myH5wbKyRjbG4poWP3LzOPiVYqPqWS/I/xCKJbb78J503+u9FydZ1
	83eO4BKgKEaZ6mua91+cg3RUxWIgMpEEn2QnqK5etanXaQt0v5p5RoPmbeCkJzD8
	KlJroJ52o9G82ghVsGDaDUS1nBHtJgEaaExwlyU5zIVo4TE4xfCg+AAO7rp5gSYW
	3D/C9qcRfYx0odVyLY1UUPrgebkuWrIejbFCjdgbheFdwqYQ0nbkfG5SAlIOS3/5
	f530GH5rptT5T+9Quj8PQ==
X-ME-Sender: <xms:hjShauSlxIZn3mObSgNjW3AJjqYOVsDqY7rg6JbrfDHnCN34U4mKfQ>
    <xme:hjShajc8cD5MipyOXgmJjADYHShu6d_-ZrdAYTSuwMxRNbQCnbM1Rm6lwPE7beM75
    6RPuPT_ZRBZNTyhjhI4OPE2Dka6HP_4uiSJiH7MnqMZ04T4AzwcmyN2>
X-ME-Received: <xmr:hjShaneTDwPGnfD02i-lpf_gdjyTbcC8cu9RiXuoBGm-tx5Y97ZfZqT6JenroCrr5091lzHA3clvEP7G4Gld-qyIxWJVj-Jns4XHSw>
X-ME-Proxy-Cause: dmFkZTGOMXbzgK5txvMjH8pKfUibVc8i3pE/XnEQJYqlH+3gKudOe1y/SXxlX/ZnEXhfCE
    oFzDUWl6lza06RFl7GlhSirYdwItZEWkhfQyYw6raKRYxQzQGzqE4Ds63ecPgQgOlAIldJ
    Xu+CKf/tQDWy9y/QuKlsOFGiXxA3JxxZtW/0MbEeTIzsbzQl9pAuiItLITF5KPgHeVog4R
    Evy9tmohtCieqFchkLad9n/hNRlTvE9KWdEzv7VntuJq0Fb2XBl7ym0L/uIGETqWf5RfCP
    dZAhc/IhmaUafYYCV2/mt7tdwpZiHEkO0z7bQR3fA/EPiAewcvFUeCuWC1hByYDUYNnPBu
    yh2LNuD+dzAFB5Cqfq6AFfuvuUEEWOGRqH5AOuh8EjY7iF7YAIH9WamkdGTTG904FAnVmd
    D9vZvQDAVZ5tgDeuqWM3G9/ZLaPOBKkK97RWHZUjyAL1qWofSLf3z8YkaiuV0S1nZNOoQ8
    o6w0mHa1joXzZ95+EjFkH0DqMNJIuY+NUOFQouJNdu5Ag2AXvQ5CuTTbY+R8K0ZCav3FbG
    RJlHryxvqKvhSLR1GXzmUuxyz4I4oQ24T+KbaWcitduxjniVoyNAo9OspaOjNdHijggdK+
    tLa8RRaabzS5V/P8njxxzu5hvJDm5/6U/7azhG/9mAO0SUwi5BwvWUuYTn8A
X-ME-Proxy: <xmx:hjShal33IGfh7Kf6yMICd-_uy-K6B8fwTDYVew7GT6kCPtTDr7dwxA>
    <xmx:hjShan-z5y0_xT9vGCLR7Xge8yIBesb9yrcBEb4MbfSGqFi-iS_vAQ>
    <xmx:hjShai6iyiFSgd4mPiwfn0qxIrXxjulBuQK3hOBK5tw4sbtet4VsjA>
    <xmx:hjShanvMlZSP50oy8cTXmCX-OIlOg36Pj2tNbvDIm9h9cReuWQaeew>
    <xmx:hjShakkzIiIwWiTWPobaKqzx7fTvCl_-D7-xSq57fEPgrWMwye-fLx8h>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:17 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:00 +0200
Subject: [PATCH 04/13] arm64: dts: apple: t8122: Fix child-name-order
 dt-style-check issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-4-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=LyVLfrWs0Xm/qq/cJD1v6SmzVevdsuJAbErKmw6ENM8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpWzd/xellGwIVdu4kHL650Jx34v/LrAOGTKpLlS/
 RaaoVfMOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAFxkDsNf2WvmXpMfX3bR8NIq
 2rIh81zlIkeVlHRTObZZUoknG/dfZfinV37PfuKao87ut1n1GOt2XuC5pCvMWtasx6R2iq+B1Yk
 RAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032719_250877_FEF6B9A6 
X-CRM114-Status: UNSURE (   9.27  )
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

Reorder child nodes by name to fix dt-style-check warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index de09989c5663..481f68a570ec 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -20,6 +20,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -165,23 +172,6 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -451,6 +441,16 @@ pinctrl_aop: pinctrl@2f4824000 {
 				     <AIC_IRQ 352 IRQ_TYPE_LEVEL_HIGH>;
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8122-pmgr.dtsi"

-- 
2.55.0


