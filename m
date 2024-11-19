Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BFFD4414B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er+AsLhMmoQb4c74VNmXVPpV/ppYCKL3aZ+biMnCroI=; b=Qg/b9y9xaNcksjgC3ypaNifEMV
	fA+HIxHbVvPNzuiymazXzuk8UjLzzeT4Sv5lqyMZ3iYbzU+QpA6ckBDhrMOtHxuRCBvmmrEHE1ZUi
	y2umXYgqLCO56ySZK4NFP132DnBtG4C7glBzJU2toMZQge989s6+E/f2SeQEvNXgmGadUL3B0uZ45
	jnUMB4oiHuU9DLMdkYTDC7GK86Ca2EzvaxPnAM+BpgY6A91YLO61vc9XQXBwQu6ech5H8ecoTO9an
	ilBfIgEzXjtVOYpa8HvA6LHiRRC3xkBdqZURJLh+rnlwQRK+95IrjyQWnsFWXDkE0Twp6CqIolp+z
	MB1mNJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMYX-0000000CEwf-1x88;
	Tue, 19 Nov 2024 11:38:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVn-0000000CEH6-1OI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVk-0004ey-8U
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:12 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-001Ye8-37
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:11 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 967F3377056
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:11 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id F29DA377036;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id c96e1107;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:00 +0100
Subject: [PATCH 3/6] ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes
 for multi function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-3-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=lUNKFRhW2UkaCb89yA9/rUW4JI9Xi4k+6AExYcnVVQo=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfnm9EuEwt/tRjFfIpjwQLdKwYSVtGSwEc4T
 INmRMDHYBSJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx35wAKCRAoOKI+ei28
 b7VnCACKzGe+WQG3WTzwPAJ8bAvxWc0tn9KthZ6HijeH8YGh3eY2g0+dkNbiwbC30Kht6kSM4wH
 5bjigA6PKRkuNXk8GtlIr4IFN9jSRxXcER+mhkjqKRR0wo4GYDI2/G/69vjq+RDfCnj1/HEGo9l
 Q2N3IuOjB8TcqSbdYwTOUMuUC6v+SqFPP1g4MuIgUjiDHU5IU1z99ooCsJpH/ASF1G116e2SkrP
 ujCcRSsgDJ974klH+qgKEkMHyEf7RutseXpdGeN0I6VJjUDEeC4AoF3tkFuSlSqTMlqkrpP0tyu
 8YWauqDNYKq/cP0uCbcB9G8Ac9vldsuBe62Z/gpC78URh4/d
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033515_372525_54B4A40E 
X-CRM114-Status: GOOD (  12.19  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

Allow providing the Ethernet and mass storage functions on the USB
peripheral port at the same time.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index a97708423ec8f2ee2c471b07ff9dfac19e605b3b..d9b9d611a41e8b4ca35ab771d26fdf9067d73814 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -580,6 +580,10 @@ &usbotg_hs {
 	vusb_d-supply = <&vdd_usb>;
 	vusb_a-supply = <&reg18>;
 
+	g-rx-fifo-size = <512>;
+	g-np-tx-fifo-size = <32>;
+	g-tx-fifo-size = <128 128 64 16 16 16 16 16>;
+
 	dr_mode = "peripheral";
 
 	status = "okay";

-- 
2.45.2



