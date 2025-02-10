Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0D7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=2V2aVbXhiI6+7Yd7GVY/GAEeqp
	cKcm0Eb6EaV2arFil452ITuQw9VvWzVA+fTX1U7plvonfFP9PLYlecOqzrxM7MydXxN9dry2pYAIW
	Ji6gq4r5blcKhavDSKGMPst/USkYv1nDUd8XZyF7c8Itr0iSqm/t8PdMYZKWHpSafQzNIqgKHrvSj
	Ih16hINJXVNj91h1JBae+DnyU7SnC2v9r0vZdaIuXSDRTi1CIqgQgjqmRTXvTnGd6FxeYyL+CNZ4q
	OKvrXq+JAUFLGvxCL0N+wd9tVOjufiddY8RhJv7sg0wnksaGZRWpCgUFTgUdU/bhQkyJTV2sT8Gtf
	MppsSZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcvn-00000001nc1-3hJF;
	Mon, 10 Feb 2025 23:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWy-00000001iXO-2xvv;
	Mon, 10 Feb 2025 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=Cy7De8FFtPJMswIG7j45sUa8mJ
	WThE/UbyuDzDlZwzydn9f9p3QEqQL1PksQve+u4i12G1z3rxR8zJ2ZQFf9Ee1BSHInQaAE4ssB7Y2
	jBKmE3pkzeCgi3mrdI7XQ38lGi0LbXbcC3WWmsdWLn1n9RJIwOo/DIxucBX2zKqR86bD0fPJBZgG0
	jFY1R/xRDFEynsFjp/6eUhDGHBFLva1Xw3xgk8vx6L5uXnLUQNtHHnUTjvmKzwx5LlIRqre6Jg7nb
	hSbvw+wzHIR+wPFHK7KFBR+VGabIi+bRz7hXOhiCeErUCXo8znDypc59fdcQozzYPe+gB8sdRLYUI
	8jkV65mg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWs-00000000L4O-11WX;
	Mon, 10 Feb 2025 22:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=Cr23s9depxi0kBcC4raALGKcHz
	sq9N1ty8NzSvYSLJQrG5nxm7l1Pv9TDBaP3vs/zegJ56U4C4uRdTvlJjEQIXJgXTltEt53S2tkXJY
	uo/Qc8vjNao2vJcT3Ba2lCR1r55gvrlXESqXQHXR1KbjfgPRYgYE2c+vSzRuCQv8jXz4LntSqmwfL
	mgYrEBCkEpBQe3CTkjEN4lE+JiP+CIXX0dmdOw3xUMMjvDwNhgPxsm6LxXgLMsUbZJL3xx7iDzOWu
	qkkJUSvTPQfQrxlvsAqsng9r2o9AKyUrfTnCxjWhXTCfvQefIRsE7+zDW9HtERNfTIvBBPrzOUI9I
	KLMd6x5w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWr-0008Re-CF; Mon, 10 Feb 2025 23:45:25 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 6/6] arm64: dts: rockchip: add rk3576 otp node
Date: Mon, 10 Feb 2025 23:45:10 +0100
Message-ID: <20250210224510.1194963-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224528_198028_F90F0A6D 
X-CRM114-Status: GOOD (  10.70  )
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

This adds the otp node to the rk3576 soc devicetree including the
individual fields we know about.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 4dde954043ef..29b47799849a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1260,6 +1260,45 @@ sdhci: mmc@2a330000 {
 			status = "disabled";
 		};
 
+		otp: otp@2a580000 {
+			compatible = "rockchip,rk3576-otp";
+			reg = <0x0 0x2a580000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru CLK_OTP_PHY_G>;
+			clock-names = "otp", "apb_pclk", "phy";
+			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+			reset-names = "otp", "apb";
+
+			/* Data cells */
+			cpu_code: cpu-code@2 {
+				reg = <0x02 0x2>;
+			};
+			otp_cpu_version: cpu-version@5 {
+				reg = <0x05 0x1>;
+				bits = <3 3>;
+			};
+			otp_id: id@a {
+				reg = <0x0a 0x10>;
+			};
+			cpub_leakage: cpub-leakage@1e {
+				reg = <0x1e 0x1>;
+			};
+			cpul_leakage: cpul-leakage@1f {
+				reg = <0x1f 0x1>;
+			};
+			npu_leakage: npu-leakage@20 {
+				reg = <0x20 0x1>;
+			};
+			gpu_leakage: gpu-leakage@21 {
+				reg = <0x21 0x1>;
+			};
+			log_leakage: log-leakage@22 {
+				reg = <0x22 0x1>;
+			};
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,
-- 
2.47.2


