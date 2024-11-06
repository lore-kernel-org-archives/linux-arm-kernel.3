Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11675D44D4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8f6EHwbpuXfJsXd4Hk0fYwMmDt3B1x7ZQQNymSJp28=; b=wcKc8IYuBPgs+9eQTFbBCdEf2+
	Z2mY7BYhhM19BJNv1qoe6ZnFZlrXSWBqmy2RzUwwcm+3J7WrAKj5umAjPpwFqMTl/BFemNC2esSce
	V8p49N5/LlMMxnNds6o+K4+DtVmRzAfhDcp/J5g0OEAHoiX+2i4E8nbIoUfbmkYKqD8XQpl3apsRI
	oFdeYvnRcqJ9T8ejDkdHFUye4MS4m6+XEqgi/oSYNDrXe3y+qYEMmDhsyoZ9gIX5Dt1GcZg6kvgML
	g3RC4XXWNT6bWrkh4bqek132Zy3tFGUtl/14otN9ZMw4HzXQdA5/yb/KDgPoZKnRcBjpxBEbC3Ig0
	X6t+NA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8e73-00000002uNU-071B;
	Wed, 06 Nov 2024 11:22:13 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cyK-00000002gzS-2Bah;
	Wed, 06 Nov 2024 10:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887746; x=1731146946;
	bh=w8f6EHwbpuXfJsXd4Hk0fYwMmDt3B1x7ZQQNymSJp28=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cyj05UIYud+EGWKbDL/T2w+9INhPklVEKHI7ivjAwEMZIpfgBI6O9maYfGY2BeIJn
	 e3xIn6yAisX2lPmR75opQnoz7GMJ2S/KNG2Qo9ewQI4O6cqogYLD7pJG1ScG3REj//
	 NZzqL9qRna02ShS2BgJRkRsekOqZOioNym0LPxBW/goeHMxnPTYV1zK5mPMAA77qkJ
	 mh7X3MIlRHqUe0PKBkIl74IAuZuFzPd3vtVR1fcvu4fIrRZGaWeDgFcEUcZkMeRY8E
	 u3sYeIXcsBq78bbcgYYL0HrEqdCJJ9oEmlUZ/7coCy2sH9uwvhan6wHDbZnVuS3sUQ
	 9gMd2/JqodGYQ==
Date: Wed, 06 Nov 2024 10:09:03 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/7] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Message-ID: <20241106100741.173825-5-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-1-y.oudjana@protonmail.com>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 16d86c1d179cbb388235fe4342731305526f5975
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_020908_731094_E3450745 
X-CRM114-Status: UNSURE (   6.96  )
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

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts=
/mediatek/mt6797.dtsi
index 0e9d11b4585be..a786d1d08f683 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 =09=09gpio-controller;
 =09=09#gpio-cells =3D <2>;
=20
-=09=09uart0_pins_a: uart0 {
+=09=09uart0_pins_a: uart0-pins {
 =09=09=09pins0 {
 =09=09=09=09pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
 =09=09=09=09=09 <MT6797_GPIO235__FUNC_URXD0>;
 =09=09=09};
 =09=09};
=20
-=09=09uart1_pins_a: uart1 {
+=09=09uart1_pins_a: uart1-pins {
 =09=09=09pins1 {
 =09=09=09=09pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
 =09=09=09=09=09 <MT6797_GPIO233__FUNC_UTXD1>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c0_pins_a: i2c0 {
+=09=09i2c0_pins_a: i2c0-pins {
 =09=09=09pins0 {
 =09=09=09=09pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
 =09=09=09=09=09 <MT6797_GPIO38__FUNC_SDA0_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c1_pins_a: i2c1 {
+=09=09i2c1_pins_a: i2c1-pins {
 =09=09=09pins1 {
 =09=09=09=09pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
 =09=09=09=09=09 <MT6797_GPIO56__FUNC_SDA1_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c2_pins_a: i2c2 {
+=09=09i2c2_pins_a: i2c2-pins {
 =09=09=09pins2 {
 =09=09=09=09pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
 =09=09=09=09=09 <MT6797_GPIO95__FUNC_SDA2_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c3_pins_a: i2c3 {
+=09=09i2c3_pins_a: i2c3-pins {
 =09=09=09pins3 {
 =09=09=09=09pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
 =09=09=09=09=09 <MT6797_GPIO74__FUNC_SCL3_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c4_pins_a: i2c4 {
+=09=09i2c4_pins_a: i2c4-pins {
 =09=09=09pins4 {
 =09=09=09=09pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
 =09=09=09=09=09 <MT6797_GPIO239__FUNC_SCL4_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c5_pins_a: i2c5 {
+=09=09i2c5_pins_a: i2c5-pins {
 =09=09=09pins5 {
 =09=09=09=09pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
 =09=09=09=09=09 <MT6797_GPIO241__FUNC_SCL5_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c6_pins_a: i2c6 {
+=09=09i2c6_pins_a: i2c6-pins {
 =09=09=09pins6 {
 =09=09=09=09pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
 =09=09=09=09=09 <MT6797_GPIO151__FUNC_SCL6_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c7_pins_a: i2c7 {
+=09=09i2c7_pins_a: i2c7-pins {
 =09=09=09pins7 {
 =09=09=09=09pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
 =09=09=09=09=09 <MT6797_GPIO153__FUNC_SCL7_0>;
--=20
2.47.0



