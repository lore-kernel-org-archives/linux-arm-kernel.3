Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A91108B8E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGLNtDekxRKXdox7mzxK6y/EsZgDuny9HQCCHc8BUNw=; b=4ootOTPWHnCwTduN/+cqm9//6z
	1eoRQRe61IqBntgsvfjBpysfd866pyUXz2/NG1UyzMwvMjpOv3G2+98phtc7j060Jq+7c2Qb0hMnC
	2fwDxGQu9j1w5fNo2HKO+FisbzmVjga7hfcezdFERac5Ck+7Kvw+UivZRvz5Oh6Ewu46IofYjQjyH
	yW+OizFr7xaejiSkwVmkpNhAoFT/X4sJdNVVIS7beVV6yV3c33+IjqWsIN7r+zBEF9wopBPLrVTDH
	QnmY2smQdYXvpgcm0lTZsg2eY0K4sYW5EK4xsHftyKQF2ym59leb67SmVEw75qM25TJ/HPxMFeIs8
	CYIa9wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WOE-0000000CVZJ-1iSh;
	Fri, 20 Mar 2026 09:43:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WOB-0000000CVX9-0qm6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 09:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WGLNtDekxRKXdox7mzxK6y/EsZgDuny9HQCCHc8BUNw=; b=WusF8axAt5mFzrXG8jiFWI/wYr
	dB6HqcXS55dvrB3fmKqugTOabUgIurJpb9mfor4irdPid9xc1C4Jo2D0g9a7fNpDK+3qu57MUpuRb
	B/8kW1BDmgDIGxYeS/KBG1rkLr7jBKm2sxliLhd1wvs86Yz1MoiPW7fjp2UGnXV3J90Lwa+XaKKgp
	Nx166Tp/hJMq/int+XXGUETTmXiEitcAP7oRzJBXzIKGQ4bjldON5VLFUa/0DQ5hs5W1hQwbRhYqP
	zCkxm+jUDGk725G0xCJKoTBEj3VY8Fj0EI5Qy2+Av2LYzV7ziMQuV6gl/9VGPZ6ozxyp2PQrWCy3f
	AMGB84nQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WO7-0000000FFpl-1mXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:43:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4870206f73bso950885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773999806; x=1774604606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGLNtDekxRKXdox7mzxK6y/EsZgDuny9HQCCHc8BUNw=;
        b=mA1tWNhlIg0gYyE5bk11WlZeAp6oa6lPuWoL9s2kPHS2BRzN4X04EUqf/AYXgA+dJJ
         nYgws9crrCiLASaBTJI9XIGt7RVMw5Hp4VhR32h4xvzQ8QuPkwfEcYa/hpZsmNrMOqm/
         Sigkd1jMrrE/Txj57/c3W0m5hlJcNSFZPw45yt6piqBWAskO8r4CRageZRAY6RUsKw3J
         pVy2JzzKPlRO+AjlFzkSpEFKOzHionyKs9HLQtppPBrcgKcGs37DZ0Z620w/ojC1qGQn
         aPq7xzI6HU/q3sVrsZse0YJUiozwrfn4LLUEUoVJcV1lesFNnkiMWnpsqqVJ1ZKg3Fh3
         QdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999806; x=1774604606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WGLNtDekxRKXdox7mzxK6y/EsZgDuny9HQCCHc8BUNw=;
        b=TBZfvHqYAKYPyYYSbq4edRcf2L0G3AbRAZ8FXLQbBWm/pk3eTiS89sUG9vxrtzes/P
         MUCgKfRpregCcjpM3CtsCIZ2pNrmZEpnNL7TBris0O9mVJowQQQANBqGDA/IqwuV6vb+
         mt55fTm5Lxu5OehJx3ZFncC3OO91zYXZYinekNDQH92nbyEy3qEe11Dr4c0ac973386O
         XyAXfh2TRs+NngU1p7bnYMELLUJ9ObpcEVDaSXJk7qVgYIpNgBdwIRAZkmOMhk28dFXV
         bRK0Xx8qy1X0LDABbOJ+KW2DmpCi4T2mvv13VlA46hS+0BW+D54PCFKmtAa9+BAf+XAm
         2J8g==
X-Forwarded-Encrypted: i=1; AJvYcCX1SvSg6Mkwh5mv4U+oWNiWt0XqLvFVdQnMOw6QVkruHGuAoGtTjD4On9oqHy86+5xi1AQSjnJXCUv5fSuMLy3+@lists.infradead.org
X-Gm-Message-State: AOJu0YzPSbWplxTZ72wmZfqybfBJtd1DJorE7xzQvTUsaj0hCnqVEApv
	r23+C2CQ1WN6W0fVRwULPIT1+BVt6UHw3QKbJMogG29yobHWjp8iSvhsgkzAsAEkmfA=
X-Gm-Gg: ATEYQzxf+ZIuv/m2c0tPGSfgWLK0kAaew0IpTbsbSX8Fz0BY76HGrItUUbhxffknBGZ
	jZFnIXLlY9lI7Z+ojZGRzgjBEr3StHgya5YJ9gVLFHsnmc5UKyW+37J+2qAeADX9GODVHa1xzzX
	1otNJfTro1k0PXjz4mtfMt/ufqTCvpyIuvJN9nYi7BaROkdDn8+iPbrp/KD7Y1gBU4ztyvfYprw
	8mPM5vRXBrCM8PNwMO8oNhfbQzOFrMTvhy+l3Pe4OYiuNz5si1l8lKQNnyn4wDJIMiqCkC3Xi3F
	hcvtymGjX42HTu6YBtBbhCdwHt0Jn5sX7I2Qf5MP0nS3LGpoiQuIDZgyIQz4bXZS1slcl5dl4w7
	bHhgE9UMI3ZfFxQ4xd0FQtytXrOcFnRKbgjJPIRyz5+E643oBUYjev+oleYX0K8lBL3xjU5IUr2
	4WH7aUfW3nq03R0lzERQUftMUKE12Tixim5wXMyg==
X-Received: by 2002:a05:600c:1c0a:b0:486:fbc8:8dee with SMTP id 5b1f17b1804b1-486fee2dc56mr30563635e9.33.1773999805228;
        Fri, 20 Mar 2026 02:43:25 -0700 (PDT)
Received: from debian.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fd9845a2sm114372145e9.6.2026.03.20.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:43:24 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	shawn.lin@rock-chips.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Fri, 20 Mar 2026 10:44:41 +0100
Message-Id: <20260320094441.128263-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2053182.usQuhbGJ8B@phil>
References: <2053182.usQuhbGJ8B@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094327_829196_26310959 
X-CRM114-Status: GOOD (  11.06  )
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

From: Midgy BALON <midgy971@gmail.com>=0D

The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to=0D
provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.=0D
This chip is currently modeled only as a fixed regulator=0D
(vcc3v3_pi6c_03), with no clock output representation.=0D
=0D
The PI6C20100 is a clock generator, not a power supply. Model it=0D
properly as a gated-fixed-clock, following the pattern established=0D
for the Rock 5 ITX and other boards with similar PCIe clock buffer=0D
chips.=0D
=0D
The regulator node is kept as-is since it controls the power supply=0D
to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node=0D
references this regulator as its vdd-supply and provides a proper=0D
100MHz clock output. The pcie3x2 node is updated to include the=0D
pipe and reference clocks, matching the approach used in=0D
rk3588-rock-5-itx.dts.=0D
=0D
Assisted-by: Claude:claude-3-opus=0D
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>=0D
Signed-off-by: Midgy BALON <midgy971@gmail.com>=0D
---=0D
=0D
Changes since v4:=0D
 - Fix From: line to match Signed-off-by (Heiko)=0D
=0D
Changes since v3 [1]:=0D
 - Add Reviewed-by from Shawn Lin=0D
=0D
Changes since v2 [2]:=0D
 - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)=
=0D
 - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks=0D
   override (Shawn, referencing David's patch [3])=0D
=0D
Changes since v1 [4]:=0D
 - Drop phy-supply approach entirely (Jonas, Shawn)=0D
 - Model PI6C20100 as gated-fixed-clock instead=0D
 - Wire reference clock to pcie3x2 controller=0D
 - Follow pattern from rk3588-rock-5-itx.dts=0D
=0D
[1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971=
@gmail.com/=0D
[2] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971=
@gmail.com/=0D
[3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee4717=
7829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1=0D
[4] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971=
@gmail.com/=0D
=0D
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 ++++++++++++++++++++-=
=0D
 1 file changed, 20 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/b=
oot/dts/rockchip/rk3568-rock-3b.dts=0D
index c5f67dd6dfd9..1a2b3c4d5e6f 100644=0D
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts=0D
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts=0D
@@ -56,7 +56,16 @@=0D
 		};=0D
 	};=0D
=0D
-	/* pi6c pcie clock generator */=0D
+	/* PI6C20100 PCIe reference clock buffer (100MHz) */=0D
+	pcie30_refclk: pcie-clock-generator {=0D
+		compatible =3D "gated-fixed-clock";=0D
+		#clock-cells =3D <0>;=0D
+		clock-frequency =3D <100000000>;=0D
+		clock-output-names =3D "pcie30_refclk";=0D
+		vdd-supply =3D <&vcc3v3_pi6c_03>;=0D
+	};=0D
+=0D
+	/* PI6C20100 power supply - active-high GPIO0_D4 */=0D
 	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {=0D
 		compatible =3D "regulator-fixed";=0D
 		enable-active-high;=0D
@@ -553,6 +562,15 @@=0D
 };=0D
=0D
 &pcie3x2 {=0D
+	clocks =3D <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,=0D
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,=0D
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,=0D
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,=0D
+		 <&pcie30_refclk>;=0D
+	clock-names =3D "aclk_mst", "aclk_slv",=0D
+		      "aclk_dbi", "pclk", "aux",=0D
+		      "pipe", "ref";=0D
 	pinctrl-names =3D "default";=0D
 	pinctrl-0 =3D <&pcie30x2m1_pins>;=0D
 	reset-gpios =3D <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;=0D
--=0D
2.39.5=0D
=0D

