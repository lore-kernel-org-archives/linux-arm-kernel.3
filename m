Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C5DC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=ICkvhQxauM/s4dlVnB1EAKu1Gw
	F+rXvYYjAEgOtTnOLHVeOtBSKZjMurJ7+ESbuiPKaz3Ggpxq3T8kkCXrx711cmQ+B36gMY+7J7ASb
	+2O/9DYRdqnuZ0RnswX619PwFRVtsBBin5e5esMEhzv5rPoe6PZrrIU+SV6gU00Nk3gDA2knD7XWq
	hEGLErYHcBgGWYMDOm/Fy/6P6vG6SO7TFUtbDmZypT4GPqzERW8nuDYuMPWOE42Mfq8Ndf4zzLvRs
	Qa6sRizI5T3pKU5Gc8360DWlmVjOTAeKszxq8D19B/0V2AQWrOOF5SNau/Xo6hpDc3aDhv19QSEir
	MGzLV3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrri5-000000054Ej-0GoL;
	Thu, 06 Aug 2026 06:36:09 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrri1-000000054Bn-3J6v;
	Thu, 06 Aug 2026 06:36:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 995101300165;
	Thu,  6 Aug 2026 02:36:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 06 Aug 2026 02:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785998164; x=
	1786001764; bh=sgu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=1
	puoFuVjNERzwVWN0t22cIXz+deO4xgXn/Yn+6FkOmLHlXm7cnNgXO0QN68aO9ILC
	LoiLk/7MWB9BDccQuLdx8iZlM8QB0Jg7YbzKXGuaMx/fTiGSrFIbyjbeKPFn1Hfy
	Bj+DSKqFdmB4Y+W4TlE9mHo4istLQZGxbOp28FytrB9vz/A6I1uXYfu3sXedhMU7
	jDtyFyVwjHm961xc6jzuZoa7jiKZlbM5oalpIVzDOaj4OaaT3mc0Ia8aaoWE9dDw
	Fv6/nkCs/qPc9rLzraCJg5d77l4fW1Wm4Mn0SGsA7Z7rThzisURGdBadHAh9kS8p
	NtUfBxsEp/Nrd10GoRg0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785998164; x=1786001764; bh=s
	gu7nAbq8Yx5koaOMKJWboxHdobCAGSow6z6pMfKPGU=; b=G9C2+b4UWlPuB3JYP
	uLtmvJRPN4B6+j0SXyZff2fi/mbZNtkI5BsPTzii57azW83r4JPGnJn+oP87LlXu
	uzMK5FoIAp78F9XIfJDO/Bc9TlUCyZgtBB6LtaVq3KqvNDVgGlARRU9ZcwA03RKc
	fWAVBiJLW510K8TZ0MmP4hqyECLKIb1p7Y2Nbjl2fdlg5z02GLLJHkfNvfKTRbOf
	wxXfrhm2EfTTc3PgIb+AdKudyla9JZYzs5kR9mxlMLYtcjNaRG0cRj5wEtQilaQn
	FRPxJxcXywGFvrJ2OGuDbUWjgzaHA8gAmW5PpzvYkkuFUuEqE/XlrdFVAAT3z6+A
	2n0zA==
X-ME-Sender: <xms:VCt0ast72_PppLC-vbFNWAr4fmvLj9QXF77FP7toQlx2Tuo0fLzMzg>
    <xme:VCt0allGcodj5pUuAqPS3BSQ7an4MpprS47MBseXp7PZ33Qu6kor2-6nd80LEMab5
    dZxXofTHPGKHO43iIf56rsw-fz1566dDA6MgxrLIGnnlfeKCaE__UaS>
X-ME-Received: <xmr:VCt0ajk2MoeANJT9Wdyf_MA9nQ9R8p1RXOvXsjkJUd5R6CK5bMjlsYAnEc-dHw5vdIcMhPYTjg>
X-ME-Proxy-Cause: dmFkZTFONgeA2O3pwjIbPcMCTqIJqr8rt4x9wj1HWpKtWqUM08CHxAytH4b3Wcxne+7M9Y
    PXPM0VguFKPHRj7GsPgHOCGdBiHCvhUSS0VPsXiwRKvCWrXPAstwqnluAM2XfUZr49eWpS
    e+UecSjujmJ2AT270+mwV76lh/D6/9znIOY6mQx5cMF79T+XdTHspX14zKQTkVq2imOTsH
    vp93U39Lnk9e3xSvtrqjBURQNo6oCQMtbFhYzXBG6dEvWqKT8clHR5x+RedZsGjCkMON3x
    w67ON4vBChW2U2GPv48gIMgNJJLmEWZg5zEIGItcQU7FX5BKLMjAr+kfs3S2cJ4Ku2vNei
    eTyzZo7cemSdKbqcslTdF9+Fnu6Wnz4g9+SP/0PbxOIZE8eibAnqIUUyYrpwfADWd8/jkQ
    lyZiACxDgx6oXDCrfC75glZna01b4xAevCxCiaFfAJqGJP9faeFM9Zqtowd3xeiNo9JDG8
    sQZoBFeT/sjP33Sq6xmNDkviAk90SnbPS6sC/dCYlVmUFCE7qI6m0SKYsfQm7Z5BG1nfOl
    I3/74cQkajuQVirurXoz2U6V0p2pKZC8lAqpTB9XLjVAYR1m08HfIcgnKVrE/pnSXn2IHW
    kgORTPywBrs6TDNtcDLqwDCpnKfCeAZtwCPFUjdUjIzIasboxPsOfrMoZgqg
X-ME-Proxy: <xmx:VCt0aojnAKsgkWNOX9a1LKyPFFgx-mQSnCJBRtXQd3VwGT7-mJ96lA>
    <xmx:VCt0atF1xf1Ud6hOaB97940z0VNbJ5I2zp9gom9BP1Cd33SsAsOPrw>
    <xmx:VCt0arblB6kuyR8R_IRRsl8evZYmQ2Dsa8DnadgUAAlAa30MJRqFpw>
    <xmx:VCt0aoOv8qyUnC-n_2c3zzJCIcFdlDdVGqC-7N1M-nCs7C_2ygC27w>
    <xmx:VCt0as3pvbaerTG75kRiWOpxwx6SbePvKk0caBaqAS4ASjQMqc-0KdN_>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 02:35:56 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH v6 9/9] arm64: dts: rockchip: rk3576-rock-4d: enable NPU
Date: Thu,  6 Aug 2026 18:34:13 +1200
Message-ID: <20260806063413.350184-10-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806063413.350184-1-gahing@gahingwoo.com>
References: <20260806063413.350184-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_233605_858691_B68EA0BC 
X-CRM114-Status: UNSURE (   9.94  )
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

Enable rknn_core_0 and its IOMMU on the Radxa ROCK 4D and supply the
core from vdd_npu_s0.

The supply is marked always-on because the NPU power domains are what
gate the block here, and dropping the rail underneath them takes an
async SError on the next power-on rather than a clean retry. Only
rknn_core_0 is enabled: the driver binds one core per node and the
second core is left to whoever can test it.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 272af1012..965e0906b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -442,6 +442,7 @@ regulator-state-mem {
 			};
 
 			vdd_npu_s0: dcdc-reg2 {
+				regulator-always-on;
 				regulator-boot-on;
 				regulator-enable-ramp-delay = <400>;
 				regulator-min-microvolt = <550000>;
@@ -869,3 +870,12 @@ vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi_in_vp0>;
 	};
 };
+
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
-- 
2.43.0


