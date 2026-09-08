Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E5AC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4r9BLRd4S6GyCmxX0tVaI1kJc+BhsFxD4BdobYPRrc=; b=cda9U3f2JIBZ0lW+2Uz/aZDnel
	8QLex7PJeOHiMjNJkHeq14iBKv30tueAmpidoETJaKH5+RAiMBFu/woAdf7/GARBOcnh87kPT6hYA
	7/FvMeEGk97T918eeQE9WOmlURy4iwO9lOKJ6/1EF2LTE4MjROK1PmqDXYQpVa2FhePR0Ycbw3vSo
	h3R52vDmrnWiLAQMnZiP14RbuygcxkpvS3RfUDMD3d/ah0Y5ZszIsqmWD5t7X9IMgosUiMLTxm9iC
	sHuPaA0c/7J7913WkJQLKy1yzowEO3nKad7alqj3A73FKNuBt9pjD+WEGQ6yyaaWbm9IcRMFKDFp/
	o1QNJ+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGI-00000009Bf0-25th;
	Tue, 08 Sep 2026 13:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGE-00000009Bbh-2bZa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q4r9BLRd4S6GyCmxX0tVaI1kJc+BhsFxD4BdobYPRrc=; b=ibzcXTp4Jn24n9x6peE0iSiM8h
	brOtcnX4ripyp9WaQhguqn5oWX/ojWpSvznoRyR12Q73YmVQz9bjJdjx+LypTOha44itEd2k24z3k
	GBCgvAm+zAksbaRsgTuL56tPBbas1JbfmXnyI7VdB4GtC29vz8zm4a4tiFLHBchrgWCAdjckJ8z1y
	K4yBLcea4Tqzq6PQTUG1uDGJDbzaKanTwkXx7ZvUxoMxYdzfRZ5m9TFiS7pFlopq53PHBpwFu0NWk
	U9chsEhBmYcPKE03V1dq0mbk6d4nYjh+IFkQn6RBLyGGj1y/nX+3n2TUkJmXv+q6Y7JlJxEt3G++X
	hzZwbZcw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wGB-0000000HUgZ-41l2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:17 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4r9BLRd4S6GyCmxX0tVaI1kJc+BhsFxD4BdobYPRrc=;
	b=2i6Kxo8z8T2mdCvSKqHiA31Ycex2ZF5Ha/q/hx2Ncf5lpzInAwIyv64YdEpZUg43fb70ag
	J72pupOgdSl6laI1wskBdQ3xQZ4Ul+ZAxCVWYiMwfMx12e53OJ2N7fZyUCGdwQOLwxG55V
	gbjzgAn4RhuLhfpsdcAoiJRPFjdmtGkGcjlI53PLBSOT97bOdEKc0cLB3+VJ9CoOwfgonI
	5BKbf7dHRhwbQsluNGxMXmTyuBlFwWXYQL3OqqX001cDYEOyleTK3/WGfuPRYsveigWUf5
	ojeSKuXeAWburAwKlbdltrzvaiYLixm1Gjx/t0UehdxLsZO7HHjiW22QFE8XPQ==
Date: Tue, 08 Sep 2026 15:51:55 +0200
Subject: [PATCH 8/9] arm64: dts: imx8mm-kontron: Add SPI EERAM on BL device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-8-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=wxmv+3IKiPf8etyakSY8wg6YcKR53nL3E6fskoVc0yE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsLPQ1Uku1u0CUitZGAtNns2a4fXtx9+Dq2cXXl4t5
 a8ouT6to5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJf1RgZZm+/4bj0oG3bO/Ht
 kQvWr2Je+LzU80tq87evjpV+3k8uajL8lba07Pfa/q/sn1ahUQZnEc/ft9cvRtTPXJ+XZT79R1s
 JEwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145316_143710_77DDA0FD 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Recent board revisions have an EERAM chip populated. Add support
for it.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index 72588af057d2..27bfad56dbe8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -123,6 +123,12 @@ &ecspi3 {
 	pinctrl-0 = <&pinctrl_ecspi3>;
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	eeram@0 {
+		compatible = "microchip,48l640";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
 };
 
 /* ETH0 */

-- 
2.55.0


