Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8095C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fab+B6DpklLJbleoaQwJy6LvQvPCBOraz+yzqnQYGfQ=; b=jstT2ZECqvuryFVl9UXrwXCySf
	/28q7XWgwrotMBacGtJiiOxywaY4XW+4HHWejYsTgyJk8ROVlqUl0hbyJv3f75LETTnGqiVgWIjGU
	Teo1PIflzA9LhazUCWgR0k1Y1Rxoimbu0fbuTMMQKXSfvxM1LBVdGnOfr9pgCswH2+s0tQkh35kq6
	pGTqYyqibRLI62x2IWaFcKEmY7s91bJUJpxu+h8dfVSTsYOdobc1nFazUDOfp5Er9GqLazZ7ory9X
	O1GBxm74bTQsqtn5d2EtUkVtJX5j0nyZitlF1PioSawdNT3hA4U/0U/mfjpnbcjtQ8AWNMnzIUtQj
	agiGl7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7tK-00000009iEw-25nA;
	Tue, 06 May 2025 02:18:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4ie-00000008uEO-2qho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4805A629CB;
	Mon,  5 May 2025 22:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900FCC4CEE4;
	Mon,  5 May 2025 22:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485727;
	bh=KCH91/zsYJ4aTUBVAhrrGbgMbywzpLFiEgK6TFB6SxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gpeJ4SI9iXaSae5UtWgfzH30ggObgB5odAgcQCxPCCsIsCmq08KRRNfl9Ol78TABr
	 Wl7VZUcRkLU90w8TdElWZG5mPp4jwv0hP8hzdK/H95uADvNHWuLkAT5h8jAnlp7kd/
	 x7TjBu3MnJM/Wlrth1NBJsG4gYQ5sYZsg/5nxwWanRXXXv4iyTwlcdgAxJigCPl+p1
	 YeJpGP/6THFm4meXh4ATf6tvUwo/1uL3VqPXuDQNRZ9oVJmCBL2UoV6aJcP19FFZ2D
	 xQTGylI43UdNt7IkBj3Nqenqd/sPuJzCK5+K0DsLCP0Rp2bA6B/YL02I8KPGHfo8iS
	 jgDgtLXiJ5pGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Naman Trivedi <naman.trivedimanojbhai@amd.com>,
	Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sean.anderson@linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 447/486] arm64: zynqmp: add clock-output-names property in clock nodes
Date: Mon,  5 May 2025 18:38:43 -0400
Message-Id: <20250505223922.2682012-447-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
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

From: Naman Trivedi <naman.trivedimanojbhai@amd.com>

[ Upstream commit 385a59e7f7fb3438466a0712cc14672c708bbd57 ]

Add clock-output-names property to clock nodes, so that the resulting
clock name do not change when clock node name is changed.
Also, replace underscores with hyphens in the clock node names as per
dt-schema rule.

Signed-off-by: Naman Trivedi <naman.trivedimanojbhai@amd.com>
Acked-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Link: https://lore.kernel.org/r/20241122095712.1166883-1-naman.trivedimanojbhai@amd.com
Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
index 60d1b1acf9a03..385fed8a852af 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
@@ -10,39 +10,44 @@
 
 #include <dt-bindings/clock/xlnx-zynqmp-clk.h>
 / {
-	pss_ref_clk: pss_ref_clk {
+	pss_ref_clk: pss-ref-clk {
 		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <33333333>;
+		clock-output-names = "pss_ref_clk";
 	};
 
-	video_clk: video_clk {
+	video_clk: video-clk {
 		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
+		clock-output-names = "video_clk";
 	};
 
-	pss_alt_ref_clk: pss_alt_ref_clk {
+	pss_alt_ref_clk: pss-alt-ref-clk {
 		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
+		clock-output-names = "pss_alt_ref_clk";
 	};
 
-	gt_crx_ref_clk: gt_crx_ref_clk {
+	gt_crx_ref_clk: gt-crx-ref-clk {
 		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <108000000>;
+		clock-output-names = "gt_crx_ref_clk";
 	};
 
-	aux_ref_clk: aux_ref_clk {
+	aux_ref_clk: aux-ref-clk {
 		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
+		clock-output-names = "aux_ref_clk";
 	};
 };
 
-- 
2.39.5


