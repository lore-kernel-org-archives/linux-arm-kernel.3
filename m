Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD98CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; b=E7Oq/vuXdsnfPhqzmokVc0uDNG
	idHtewuoAVBwKu4AAXDyDdobVhWPoWepDwNy2zJsFMH6OA1NmkPNhCouJX0kCNQwxme0nlnR6KFp+
	91Lp4Z4+Vu0coMz7/SNK1F/u9oOlD7gHZSJHAEuPDFigSSykbFTMQuT9DGH0Aey7l/cYZxCco10U2
	OlA14B0J3oSgjkIdgev1ZneuGxREr8qXO6uaOtiwbpOEDl+OXPdmhOiT8ecQfdBUoAVyfUQECJygm
	wZDynAW0/NftQ9LQPGnp6qXn+2pBS+57J34AbTkRiN4SYl2YrzTmbbXxhaD8kI3ud6Ku1Oymt+CZq
	BiWBo2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU4-0000000G4lj-1X38;
	Mon, 17 Nov 2025 12:37:28 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTw-0000000G4hd-1RRz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:21 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383029;
 b=Bq9IaxTlyp9h5HOr06OLwfB8yz7Mt3cB2BT4Ghj2UuEjln8ixYYq1tymrYxUoVw6Jw0cqhpO
 FK1DAvqlCmBdSS0xTPf2SvW2H7w/Yu1fKbj7H6gsmcgyf2lVruoHyz7SilyT7j5vvfbX3HGijtf
 2Y+DWLkapQeB4F5O3qXdTDHOeeWNb2bAAsD0ezJ9n5bXO+A9XNhi2m1rxIE57lCQZcYzhgKC2xc
 xgteSPWWtlStEPW2UH9YAlaO/q/3nPWRaTqb6aj3sMf9Rww6pC9DkSV2lc7SRFYSymmLTLmuM9G
 aeVW5IHQkzdYvVh8ETeYzJ39kfnRz+Dam/WCwlu3O1CCQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383029;
 b=etlRTWyJ+ztTITTu/vJ40CL2iOovO3r5lwyT1ERGotpwAacZRhxcSVfWHxHWgorbtdkZhgU2
 0Kn/ialUt3a3eVgDbdRcfwybWvYJOITIVbZYGECId6krlfqWANNSLcN/+Lq1hoQL39bSb55hBZ8
 YlFROazR5jXOFokc0/6I5hiQp6YXJT+ZSVn9EPOvkAzaXpbpi3ZVItIwTvzj+0jPIcWalFwIu3w
 aER4bq4W4gWgis0oRjjSz9k3BS2rcSQgS1j1viqKKYJnesPJBsvMTtKr5naNr520KM23QB3VMUm
 5MAOI2qP/NDS4/hWGGQ2q9rlAd6ZTKCYBX37C0NNP6bBQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 82C15CC0E8A;
	Mon, 17 Nov 2025 13:36:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
Date: Mon, 17 Nov 2025 13:36:31 +0100
Message-ID: <20251117123643.711968-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4d96gq1pMmz2nHWF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 963b827203f1c42a2a4c49ed014a0b11
X-cloud-security: scantime:1.906
DKIM-Signature: a=rsa-sha256;
 bh=A8W5mptCdk0S8QGbadr+z6jPfJ8L5En4UezduXTQKbg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383028; v=1;
 b=ldlcl0j+1hvN4Artbia28Oom/VAcVAv6mrK+8wkV+0cFI42cOk2/VduGhHlyAQdP9KROkpb+
 0OmE7Fj984g7a8aJvZuLIzbAXhg3LGCkzawrmS+8nFBCzi3zUbDO6vO0HpbQcccITiNgj8dlUdy
 VAwhlVAwZ51ber5Cv1+tREuKtiUmxSSrB1KDoPwe1nM+1UOPKsbM9aQSavNoF4xvxNosHaGdtcH
 4qXjL9qOg9R10in6GE7hFk/vMJUoejnGVQ4uto5l5Ym/E4XAzNQjU/Klo4hIL8lWNT5HWy3EVBG
 /vOl/m77xv/c07uaMIimwfS2QvKMAzJ8wmYZ+epTnPBPQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043720_521080_51E8BD6E 
X-CRM114-Status: GOOD (  11.17  )
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

Add the HDMI audio soundcard and enable necessary nodes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 03b75d4cf699a..ac889a69da69a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -248,6 +248,13 @@ sound {
 			"Line Out Jack", "LOR";
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+
 	thermal-zones {
 		soc-thermal {
 			trips {
@@ -290,6 +297,10 @@ map3 {
 	};
 };
 
+&aud2htx {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -486,6 +497,10 @@ &gpio5 {
 			  "", "", "", "";
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.43.0


