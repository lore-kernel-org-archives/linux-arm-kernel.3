Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42366E92714
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuD5YZ4N03UhpFzeELt8Wte/+AalKTr8rt0ghSZkn0s=; b=fE90CBnJtGaOHplkhx8KfE25BM
	3I3wfSRabEEQEz/v6aWR6Iz/hwt0sqw1urGktRO2inipvi2y1AfMssN37As8gbnZurs4vBFpGnzE6
	an7fLssibwv/g1QA0SCeC3UvKxpIIQhjuPfOp/LAfWfSAbVUMU2w3mTvyC4UmzKWJUyQb14KEipcm
	7remT5HG9Ygo32SCxVLA+HqIXkdJPuqoDFRuiyiTlUmnxzvi19seIpTK0IgzNYyc/gPwwjqk6F2qq
	LdANdhWGrQ6Ozf4Rq21rmhet6srvia0izLjAiuzRzeLpohE4wuSC/kHL5kKxPAAEGS8TduynRvIdW
	BmBsl29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9d-000000024wc-3F65;
	Sat, 27 Dec 2025 16:28:33 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9a-000000024vL-1W3v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 16:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766852905; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iaa71vAjezJNy/1pjiRbSfjHyn3IdNOUUdn/4cXs5aVq/hHhWR3ladntH/CTGO/3h6
    aiSqhfMhvAF5yFWqLzQaIo3DrFfivD5VBu46PQSazWKgPQxpGS6C1hmZxhQgA2st5kq9
    IIjHzBq71Ui61IiVdOyCLqiDFZ5w3PRy5xX5panKiIZ9WkvStYuzwstHJIQMiqRTG8RX
    5UObJ1+wWQvn7QYIYueRi2UY/Xvv5+jdULrfL8sOgJfRDgpPDpBmhsHpiz/0FnYUGD9c
    RTxXAvx7tp93RDlWasZBnoR35rtc1X7+Bd+Zg1c/MqRCFltA15OXrw5HFsPC64HRVbD4
    b+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=BuD5YZ4N03UhpFzeELt8Wte/+AalKTr8rt0ghSZkn0s=;
    b=jASsQmOGTK07y99JraOF0l9hgphZXm9vb8J4Yq4xkOD1Rl3OWTBv23ai3/gyZE8zko
    G0BlRj21ylJw58k70sacQLoqqVf1GmDoht8mVXX3M50awaOIkVQLry4nlrMMj5Zd0to5
    HqyUp9how0o6l3j/QOt1/Ig8HrKc3umY7BW/cfz5RclqmqYDRIQUx+TEBpibuvxklNbP
    v47wtMbhHPQCoLQUDACrJ0VbBj6BAarlZ3pt+d2TDedc4QgHhqsIj7EjodtVBr28S/Xi
    QoA5XbMOZzWh+0EqTSaNxKy/1eXUMVHmwBTOxQtnkC2DmA+DzJ3vXNAdPmtwIhqssmfX
    1fAA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=BuD5YZ4N03UhpFzeELt8Wte/+AalKTr8rt0ghSZkn0s=;
    b=FDbCjAvmvqCbwcOhWfjRcxcHxzdtFVBV/b2uhyVRdM58xsCYNXs+tEV6ySWZ7q/Qr7
    frHXHnre7El7un9+ytVEPGo58XSefaJmU/PSwj+mMKkt+eRksXTFDL5/yjNFgeW6b1ZB
    iqMAohVtYDa2dqJOm+tvkUB+Bggi/VcEA/BO83UPVEILcoyOS4q4mWf8SePK9Br65LS7
    MwQSJGfHyIX7FFAslh27csONq8kei/tr89AxLlESCBTnLVVUpNcWUOJeoLpfLxAuWatN
    W8IJP0fxeJQkxj1KlSkGNGbe6f5XBArjhRYeu1YRXvd9rl0SudqZ9aoRotNQz9C3M3RT
    iGAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1766852905;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=BuD5YZ4N03UhpFzeELt8Wte/+AalKTr8rt0ghSZkn0s=;
    b=bLz5xEqOh+2dF9YJyWADchR8kRgH+MArwclgvjgGugEEr9R6IXs67Onj3lPpxRNCWs
    TpsBCFXPixcbxJIqlqCQ==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQvpoIkZXd2bnfIrOV7Mbk="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec1BRGSPtuK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 27 Dec 2025 17:28:25 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Date: Sat, 27 Dec 2025 17:28:15 +0100
Subject: [PATCH 3/3] ARM: dts: imx: imx50-kobo-aura: add description for
 battery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-kobo-aura-battery-v1-3-328a90ef5122@jm0.eu>
References: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
In-Reply-To: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_082830_663418_0B9CBA9B 
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

Kobo Aura has a rechargable battery that is monitored by the embedded
controller.

Battery markings: PR-285083 3.7V Typ. 1500mAh; 575327416288 5.55Wh.

Add description for this battery and link it for monitoring by the
embedded controller.

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index b1a6a9c58ac33..dc8d9fd45cd23 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -16,6 +16,14 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4100000>;
+		energy-full-design-microwatt-hours = <5550000>;
+		charge-full-design-microamp-hours = <1500000>;
+	};
+
 	memory@70000000 {
 		device_type = "memory";
 		reg = <0x70000000 0x10000000>;
@@ -151,6 +159,7 @@ embedded-controller@43 {
 		system-power-controller;
 		interrupts-extended = <&gpio4 11 IRQ_TYPE_EDGE_FALLING>;
 		#pwm-cells = <2>;
+		monitored-battery = <&battery>;
 	};
 };
 

-- 
2.51.0


