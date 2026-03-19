Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BD1090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e2Ktq5sJeaHDP/JJnHCRh3f+LsDBElFuTwB6/IOVF0=; b=kpMD77pqx1k1IBieEzZBrNw63D
	YWeRh1JO9ZLFCIInw62n3jKMBQGy23YVoikCzEYGESRPtZqTJa9cD9UAiHyS5NAw84M7brRSaUXUj
	jjbAknruCxUa/S/IK4G5sWIdWbuttB8n4/sjOhcrzU1eEM94/gAJ1OuCnLdO8PpHBihbc5cvNforb
	eKzjSVA9bEUkOW7IC+8sxoI3krYPh+Df5Ml80VxvbwG7OqF8MK+wciKHFe6T36VtSaExDzbNUSzqD
	LDPFnCvQhsxcuCLteM+rSWt8Ha0S/T4P7OKopG/2cqEqOZ3OEDXZ6Q23UIvnRV61iFSiDMsWQME2V
	j4WjXFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ehn-0000000ApjK-0H9J;
	Thu, 19 Mar 2026 14:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ehl-0000000Apis-36yR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 14:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8e2Ktq5sJeaHDP/JJnHCRh3f+LsDBElFuTwB6/IOVF0=; b=h46/8jLPEb9P6wmHjV1e2iLHz1
	IWczTtB9MZO51ZBzzNad0BDyrGZA3hPNRHq0chThjXpdXuob+8TNhcUlKrDAI85NV+BKPo4/S2GuF
	mljS5mVskCKAv+qhJzrrjQNskjNJ2m8vghWPaFkfdGt+jKycCui5NWb3Hmn7qTM6n323gd1YiRxlr
	x/jzvOt6xrgreGV05+Yb7Lk+Trn/eQVjfkei1jpluu8RUDPfs7X9edWbXv8lz3I37ujnA0h9T0BBW
	UczYRKNRh5KucTC0VnFHQfarneCh/a8cbLyRLiBSSGnXRW6aV/GCeH/AUs8MPaPcUNFLuzRNkV0GI
	nZvWIyAQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ehi-0000000Dk1d-2iYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:50:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so8167935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773931828; x=1774536628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e2Ktq5sJeaHDP/JJnHCRh3f+LsDBElFuTwB6/IOVF0=;
        b=UZpzs8YYRZVixtbxbonojpJSlKS7IVGIp2nA2XmH8VaLI8XAA/Gcpg7gQ9JvFdKLAA
         4fi1RIifjvLq8AwYmWSrWL3YOHrriHWzBCADZL+BYv3GGoN3E+AVmOEUkHvJFHHUg4dY
         tIqiCo9vOL+UZHFBxMkwT0QTzijPR3GjMSTinHpTg/TOX1XvbRo/Yia/N350JjXSLcng
         t0QAK66GZphrknVAV4qjklLlEvrnXypoua1Oy4JQYVyGe45h/OW2h30ziVgcu14C2Tdg
         ho/LiLeGWUi+Qt0OSArCQJ0ezNORYL+cIS+D/UAl9g5i97IWvqOA+LoPJe58h9XR1j9Z
         FTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931828; x=1774536628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8e2Ktq5sJeaHDP/JJnHCRh3f+LsDBElFuTwB6/IOVF0=;
        b=H/wLBgKNNc8dlZ4xd5YVjcvj6TtuvOpY2iA4bf16mjNFNAKpxRUszp6tmJpI43ugZe
         Z7Eox5X61I2lcgQpOQshTeBIF+F9krLXenqeKmr859xv4F2zNJNLAvrqwcuMUmr63zny
         Im4n6oWzSfIeuzkogO2xs9Xv97Y7U3GG8ACP2rnqsvSLQtvP5GAF9slNWiPCJA8M0nFO
         ItozCqq464QJzUCe7oCYGPXatCIUeCXjuPYnSjl/e78DhRn5mEr6afKGdpfbRid4U7bu
         tZZ2RqfaSgRnYxN0AHYsnnK+6yrivSAp/BeSZvsnduD2psDpPdNTl1QcGtZUGHMHhTaV
         A2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVACKQlXY3lZuhJXRRgDqlJMNPhCDwRBMUKKKkuqk3WKwzy0A5YLFDl4CjNvT7ePjFsUq6KFxo3uUc+QpXQG/0x@lists.infradead.org
X-Gm-Message-State: AOJu0YwiAzhF3JzTjj6WZTcAMzh67NON8QetfW2tEvmIGMatH/A4xzYT
	o3GfCqkJt3VJT5YzqXaZim5GR4hqmN1RD925nG2N270ae2z+MjurM7qHL+rTr5a2Jc0=
X-Gm-Gg: ATEYQzzytcOjCu3xwidMk7zoEuBtwmI1FBc4PglLKEREDNVv0SrwfvDkXP84gHrIgx8
	jIOpwectb2XiplQB+XC6mGZdC57A3bZa31b5k3uId3pP/CJ1U1r8Ow1WzGfQLtxnr3p5tmys1WW
	eLmF6NVIO7SMGXhDe2y08pT8CBcF8WcBfYmXNv7rFJmEWDML3MGfTElOjuHEGEVHSMGOK5m+oaq
	DU6DSx38ZbRgbfa27E7fUnkf8DCVd5v435FlRYDxXFdsErpMxU91HbpeiImntcrSKwaxcRy7V9W
	p9/TTAcbqPxj5aDg1CLRZ4mG9bbR9+bLIAb4yUbnsXujJkAeeYz2Q1oCy302bH/N+ZlsuiZI5F2
	QsPZ95tJoAsQx9P0Rwj4rDe6HL0L8EBJlxT3/2eyRg8XOGAwEDvJbcwXrnZVwRFOCH3kDnR6lfz
	lfb/Evn0kYh+oBWmqsl8Y9yLDDYOTJI8yLVcxmNw==
X-Received: by 2002:a05:600c:c491:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-486f4469363mr125436735e9.17.1773931828190;
        Thu, 19 Mar 2026 07:50:28 -0700 (PDT)
Received: from debian.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c351f8sm66819755e9.6.2026.03.19.07.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:50:27 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: shawn.lin@rock-chips.com,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	MidG971 <midgy971@gmail.com>
Subject: [PATCH v4] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Thu, 19 Mar 2026 15:51:20 +0100
Message-Id: <20260319145120.99833-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260304132957.684616-1-midgy971@gmail.com>
References: <20260304132957.684616-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_145030_818738_F46ED1C8 
X-CRM114-Status: GOOD (  11.09  )
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

