Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC73BE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2vVKZ6E3yqlSTMvSj3TrmKQh+r9SzJHEpVVUrZRg/A=; b=YaPP56kFBKlXpK9AX27/P9P65e
	LYe0KIfxQKZq/rlRFwll3/qMPYZCJf26TK7JWmQjC0P7cjchoFoy38FweGuwVtR9hV3wPKmddDhZG
	/APKbzEqtr5Cm7mQl86rjpyov2MXvLwqnN00I1JbiTpLGzKMA/8wSSXZ72SPpAP5i19CFpMAwc/pL
	4MwxUPfRCVmp3XLwKefqeTEEWvJlNO3wpOZ3YqI/OJITuO7129hOVUoBdz5CV8R/g7uIy9NXe9E30
	Vi9/rrmwyGeeUZTO8923ksnz0uEv6V7YwKzG9qNrxid1U+O/GpvoN8W4DSF8ph6X1RGypppba4nol
	9GBs9fXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslBN-0000000A9qk-1z5U;
	Wed, 18 Feb 2026 17:17:49 +0000
Received: from mx-relay129-hz1.antispameurope.com ([94.100.132.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslBJ-0000000A9nB-2P5H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 17:17:48 +0000
ARC-Authentication-Results: i=1; mx-gate129-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=H2vVKZ6E3yqlSTMvSj3TrmKQh+r9SzJHEpVVUrZRg/A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771435056;
 b=s8WeAK6doktTw4eYfqboG41HYZwqK3cEc58jyf1EQxACa9IvtpwAVRvJtidDRZBJ89jb5mXN
 0AZTpSMm7j6Dqzw5COnIeIX32CI0e0D/otpIcOjEoic7DYfbI18tNO2R+Iuj8fxBz5D9QO1XGju
 Iwi6WYHKMXSvOFvxFYp8zU53ZT6i3p4FKieA8PZZDxr4qyxJsA3IK9hIwzK2fUsgiHaxtz9uSa/
 DNVj2ozPf2Teq5+XC27AOgomKwWSrnf1UsFdIrxP+8XiK+v9X/aw408CnTafXh8yVBLVmVK4IKc
 W99PXwujuBVKEjJl5skcsVyY9OrStlTui1LcCUvh/qWtA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771435056;
 b=dJOawu9uk/nxJ57IezzJXdCnDkl7wt5GNEQyO8sMyQWprQbcozYCYLtdoK1embjKsc4mktY/
 vCEnvsmpwHithIhBpRjNtUNdRYZbGQieknZ34F/lwdGCaqSCC3rteGfuiNnQ54z9rios63IT+zM
 OGzcLV9drLQVUGIqEoulsocMzAO0dXpXV6zH+Y8oVP4wLdtfgqRtWymqV5VYaI+QX66R2RYKoQT
 nMbwuASPxzONlEHTBk3Bz5cOWhtpMlliEnNYuZ4etTL3TOY3DUwGv8CIH9BtnlBQMww1Nhqy6r3
 wJ3XVo/2i02Eivdm3PTHsHB9hTQeXNDF23feSC2NHJafg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay129-hz1.antispameurope.com;
 Wed, 18 Feb 2026 18:17:36 +0100
Received: from 10.1.31.92 (unknown [10.1.31.92])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4E951CC0CC3;
	Wed, 18 Feb 2026 18:17:19 +0100 (CET)
From: =?utf-8?q?alexander=2Efeilke=40ew=2Etq-group=2Ecom?= <alexander.feilke@ew.tq-group.com>
In-Reply-To: <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com> <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com>
Date: Wed, 18 Feb 2026 18:17:19 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Alexander Feilke" <Alexander.Feilke@ew.tq-group.com>
MIME-Version: 1.0
Message-ID: <19fdaa-6995f400-39-279b5680@147531990>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/3 v2] =?utf-8?q?ARM=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_imx7-mba7=3A?= separate =?utf-8?q?BOOT=5FCFG?= circuits after 
 boot
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay129-hz1.antispameurope.com with 4fGNVR4dr8z4FgGF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 2d2b41fe47441c95072726fa908a7ece
X-cloud-security: scantime:2.174
DKIM-Signature: a=rsa-sha256;
 bh=H2vVKZ6E3yqlSTMvSj3TrmKQh+r9SzJHEpVVUrZRg/A=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771435055; v=1;
 b=F8/D/Xa7YNsFlI8p+rlwXKDdHl5kO8qEVqdt+s1RAiQq3HQ7Hc8vKOe8FwLUCnKcU8gNDIkC
 GvtnWsxHODcPttj7lJ6OSaYstglKI3lkyeVSuZjiWMTSF2Tl73m6dN27jS1Nr5Ajf1+dpdIp8GK
 UwGN04QGYfOxSfuX0QjCQ3ltUumkbg5OLc7NUA/7RJaWuOtaJxttQ0FR8XCsaMuTE+N1MXlEYsO
 PMKOpBRvX2QmF01tEFW+5ZFqrryGpx16jEdqtK2V8ADkXKVX6UhZNsWLUezC+JI1IakbqN/1vK3
 37RXoTIom1o6uhtm2wDyv7GsByrz+H4H+wV33MykRzUyw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_091745_867329_02918B17 
X-CRM114-Status: UNSURE (   8.23  )
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

Deassert BOOT=5FEN after boot to separate BOOT=5FCFG
circuits from LCD signals.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
---
V1 -> V2: Updated Commit Message

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/d=
ts/nxp/imx/imx7-mba7.dtsi
index 03f2f2cbdfbc..4192adb27223 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -287,6 +287,15 @@ &flexcan2 {
 	status =3D "okay";
 };
=20
+&gpio4 {
+	/* Deassert BOOT=5FEN after boot to separate BOOT=5FCFG circuits from=
 LCD signals */
+	boot-en-hog {
+		gpio-hog;
+		gpios =3D <3 GPIO=5FACTIVE=5FLOW>;
+		output-low;
+	};
+};
+
 &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible =3D "national,lm75a";
--=20
2.43.0


