Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F5AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rddRhEyNm+cHGcl6W9b9fz+6Grp56+sqUxbZNOKqBrQ=; b=PY+F6YgbcbMJNKXr60Z8VQB8I6
	a5Cva8ndl/VubtaGHQ1/eiLyV7fX9n1VZSh6imv2iNA50chJaLLqQO8Ifszma855FXc4HLGDECMY7
	nMrPKfVgA4nBO5rdGkJ85+Tx2v+ZxtDmWVPR/Z+2nzoW610afoLVwA8ns1Ubd8YLqGXG2EIdu86v/
	/XaphV05VXDXPcNKjfqJGCkAHPOM+pu+XKrdRUwZi6W14H/vKZw9xLW/05b05+Gm7kuAWC2xZMEJR
	C+crNblB89D1zY23WwZuAmfAbp6V1+RCdrH4Fd0tJgFbLWeR8ynM2CAExKTxImHxl7A13FkJxeWD9
	mfJolpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUlf-00000000fch-0Iln;
	Thu, 13 Aug 2026 12:42:43 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUld-00000000fc9-0YxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rddRhEyNm+cHGcl6W9b9fz+6Grp56+sqUxbZNOKqBrQ=; b=hYHSTQ4XzFy6oYDSSmGkdsiZFN
	XgdKIQD8+iV0XnVg1srGuWTLTnO3ZUXEajag1C/UpbeuM9w2EEqPRXqltRFlvqmabT0+v9wNFo/+j
	EqDuDRbG/Pzl9rkg0+8FOlMGmrbDBsb1qPtgyjouuNEyKVyNILvhoeeJiBCp1rl4TYKqf8G7wwdFi
	/tgPqZ+yBJWtGJR0otZ1BHJ75apOhyUZzJRYuI3Q1oGVC74gmFKTSNtRdHXkQ9ZMSm42tNZUe1rlM
	j2JDfiVnhp7VkxGnP+g7XQnotCLw9E3g4qvhIbJy9IUwZvhgjKPfIAPW2n2fHasRRkd3cyprHC4XD
	SqfxhY1Q==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BWz-1h;
	Thu, 13 Aug 2026 14:13:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-0005zb-36;
	Thu, 13 Aug 2026 14:13:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
Date: Thu, 13 Aug 2026 14:12:45 +0200
Message-ID: <20260813121250.3993187-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_054241_173157_18A27DD5 
X-CRM114-Status: UNSURE (   9.67  )
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

With commit 417b0f8d08f87 ("gpio: pca953x: Add support for level-triggered
interrupts") the GPIO expander gained support for level-low interrupts
required for Ethernet PHYs

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index f0f886f2b8cfd..dea473f660f91 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -230,6 +230,8 @@ ethphy0: ethernet-phy@0 {
 			clocks = <&clks IMX6UL_CLK_ENET_REF>;
 			reg = <0>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		ethphy1: ethernet-phy@1 {
@@ -237,6 +239,8 @@ ethphy1: ethernet-phy@1 {
 			clocks = <&clks IMX6UL_CLK_ENET2_REF_125M>;
 			reg = <1>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.55.0


