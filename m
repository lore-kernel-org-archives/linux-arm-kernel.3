Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A1FC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjB5CGDy56iSBUj/onMIQC1Fw0WRXap96Du59NyDvPE=; b=UYKuAg1YEYtpDQW4CRMhrgVJey
	NUYadsSsW/g4MEjaZM0ViLWtkFiZkLYUbHDpWMAy4e0W+DFN7vPNUYe+oEB0fBvxM87Gsbn8RVssN
	7ouCdejLlotu29OpalS9vGYNA/WXzrH+A0/8CnoBmfHKwEylNACU1ZmOV5vPdGiVRaZ58+EiOzEfI
	LP7AltJv5eleaA2Pdfza6PEMy6pBbrF9oo9vH+vmwHNNREQ/j5+2bFdCNMydXXuWCXRqfF/ZFisvU
	9m6C2SHAqTL4PG0g2Tu5lgkAvq2TuX8i5Myzb60Op9HxRpluHZjwyN/4amAYrW36XpO/YbfSXOyE2
	qQzNXdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4V9-000000063i1-3nhP;
	Tue, 25 Mar 2025 13:39:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ML-000000062Gr-0rxc;
	Tue, 25 Mar 2025 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XjB5CGDy56iSBUj/onMIQC1Fw0WRXap96Du59NyDvPE=; b=GlY8YTRvU18vwIk4wZLldqpVDv
	aDKjQUHi+AGva8s1E9hXBTGhNJdzm9DV3zGHtvnRwHt4/2b0OsYu9bpkde5Sfp7uBbKspHlkIlSyU
	5GLatTC10GN6ewX3uVoGgG7pDrtB7cg/NUZSspNH7DVKFJnyFcEkLORWr4Uzi3hU96uG0xBo0sTUm
	nmShV6ZKyAdjRxDMdgL4+OLPyEGfEpyOKF73kDwoUFn77+Whib+OxQZwqNGPRhp5lB2iItkoLK6D3
	3qRPZUnVnLEZSCgMLUrH80h1rp8xNm6Aq9M7bZwYEHWbxH/+ZSsFjQSc7bgKjX6s2dZY6/pbEizvE
	Hl7RocMQ==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4MH-00000005Snl-1yhT;
	Tue, 25 Mar 2025 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XjB5C
	GDy56iSBUj/onMIQC1Fw0WRXap96Du59NyDvPE=; b=lSMIlPKBaavnVZ2+ML+uR
	sMEo+rGV5CvITGeiAufzj/GX2TxZ0m94rvlK8Bu6zxgsIx1vLIbpeNJanvOFLON5
	CRJFXKa50V+dEkyR2P3t34H985oSIW/pOeznLZguap7Q/WcDmkOpu/m2Z6xwg4/f
	wySlR1QbqSEbJB0LDkzvSA=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S7;
	Tue, 25 Mar 2025 21:29:55 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 5/6] ARM: dts: rockchip: Add ref clk for hdmi
Date: Tue, 25 Mar 2025 21:29:39 +0800
Message-ID: <20250325132944.171111-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xJw4kAFWfZry3tw4xWFg_yoWDWFX_t3
	WIgw15GF4fGrZIq34Dtr4UW39F9w4fC397XrnYqr4UJF9aqr4UXF4kGayIyry5Jay2g3sx
	CFZ5Xw4aya1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Jrc3UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkB4bXmfirygTGgABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133021_986814_FD7EACAA 
X-CRM114-Status: GOOD (  10.13  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be
enabled first before normal DDC communication can be carried out.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 6039a0908af1c..22685cd23a708 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -403,8 +403,8 @@ hdmi: hdmi@20034000 {
 		compatible = "rockchip,rk3036-inno-hdmi";
 		reg = <0x20034000 0x4000>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru  PCLK_HDMI>;
-		clock-names = "pclk";
+		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+		clock-names = "pclk", "ref";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0


