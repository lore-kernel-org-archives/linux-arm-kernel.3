Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47892CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I+ODemdtelodNngZ+cnMjkBp0uDC6f3Gz3zokiA/WGA=; b=F1X4ifTmCA7q0vmHCdjbr+8TWo
	B0WQBaarxAX4V8Meqk6H59k0LH2juKFj6M+ABN3LRwrKDFgvbAHOSmg3+XMJ+QPo9JPqeDIyHdqPP
	I6H6QAiLFBHYhWU/u4BBF8RDvNu7CBzs/B0mqbO5lnWtp+Q84mqNX/am1dCz9M1kAC/h+1G1bf2Yq
	tPphyliWbDJ+jUS225dZCSyMRLVuilC4tmFWrdIKvvNQOY+CZwZ70QJ+SxW7n+pvNnT2xCYD44SMe
	Z+L7RT9aoOpPkhBnbnz2iSZjM5A9D1xOdbQfefU+BS6F7AM6k8c9N0aMPtdKd/LtPersWmM341kLu
	y1qF4urQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEsL-000000003AJ-2Q6W;
	Tue, 21 Oct 2025 16:06:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEsJ-0000000039B-24Su
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:06:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-471075c0a18so60862805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761062773; x=1761667573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+ODemdtelodNngZ+cnMjkBp0uDC6f3Gz3zokiA/WGA=;
        b=bvR+DPzJHYPbXL3RMJMVAlDGt3fJT+jna/JfiJiBJqBMSviY9dKFYMv7JJdIzwMoil
         FPpP5ylR2ZYXXVtp1sJcxX0vr0MtG3Y9DswRjOjr10ZcZflu8i6poOY1h8nRMIcAIKnR
         CX5pk+7Bq7lH22PhqijHOKQPrblZdUoFJuZCFzntFLufNHdUbKzuGM0mFbdHCWL3iOpq
         Zza5Ax2u3HxWYrUahKu27YXeHZOeO7hjoiQZi65o7jbJXCQmct2CsBSNP7Gg9jWmS23w
         DeXXiJzrk2kDVCifBQl/8gQ9nL+XVPE69V5tpmvka6sN+ZBp9I+cDuAIUAFapYmv5izu
         iQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062773; x=1761667573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+ODemdtelodNngZ+cnMjkBp0uDC6f3Gz3zokiA/WGA=;
        b=YGMugNoWSvApaO3JCW4pzK2otmwinyauPsfbcgDfRuqDE5nHVbODEujHpSUAV6ARl6
         cgj4L0SAVC9QdLvaulvBSP6VPePiTscOkqj7rOwVMbQVsqBXVLgQbHKWP6el1FgzXNaF
         mhsWund9xbqJESyvEHDRoWy2ingSqPVT6hTV9eKoymmdRmrcDq9JqwHBu4DYb9z1ujcZ
         OXlWXhMWDCzMfXqCv/kpVu5nfgYhvJd2cWWYd3hG5A9M8P3bQh3WRrkZjiqKtGXwydjf
         gThhJaub/atnyeS7ZoYpKjjbVPfRRtcHhsKY3rAdAdqGzey3vyPyTTpX5gJJGZwDQ+Bb
         XUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaLLLSFH7y2iIiWiedP8tqEPzhHqwOOytxX3Z9Mt5KKt+f7Z2jgq2jo/BjovYQokUn5sTkZJzzun8t0EaS3G3T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj6fZMUwzcK28Az7ht3TcDEJrqBWM/DrSXHhePdnrYtzVHNjkg
	QExz7CHX7XWYr/QAOkbri5IDUdRRpjuy50fxnMacOGpLCsyLtBKjic7j
X-Gm-Gg: ASbGncs65ADUs6J8GTppSSJUaNTuAFmZymaJW5HxEdSimo4VHIH5/d/q4Ong2REOSii
	kYsjV4GRSxD2qCsttppbWsVCxBLsR+vRT3QzhjeR2J+7saRb3390owFokA6LMSLEWpURUPOU/Fn
	xf5Y4HE5UedUPfDPKcICX6hOUIp48kjvL1WiyloiqS3Uw50f2v8XHzAADUp0FJ9QnK673ihBePL
	sHvVgaZ6L27j0zsrAsNlAvhDk/tGXAeaFbtY3Ocoqw8pgkfWLrAjnI2y/+ipZ1jIjFfL7QdsRex
	NG3y2rlqaYMPs2u601BleQZibIAMDHv2eD8eu0B/Elv+wqeU52uFtWZRl0CSdMd6iDOraKjAjY0
	QWAnD7AN75bQwLlYsml296qHC0QXn1+4vBRcNHg0YCyQUTdPG6LuaaYMBOaY1fhjGcZv59a9JdK
	rv0/0g
X-Google-Smtp-Source: AGHT+IFJFL2AbUhadEu3zoiSmflGJqqKLGGnSqi38T2TvHgGSGw3DXC14Yf1ANAfxEsqrqF6d4xXtg==
X-Received: by 2002:a05:600c:450c:b0:46e:38cc:d3e2 with SMTP id 5b1f17b1804b1-47117906a23mr136429645e9.22.1761062773077;
        Tue, 21 Oct 2025 09:06:13 -0700 (PDT)
Received: from debian.. ([193.42.96.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d26affsm18543965e9.12.2025.10.21.09.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 09:06:12 -0700 (PDT)
From: David Petry <petry103@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Damon Ding <damon.ding@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	David Petry <petry103@gmail.com>,
	=?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Enable second HDMI output on CM3588
Date: Tue, 21 Oct 2025 18:06:02 +0200
Message-ID: <20251021160603.96934-1-petry103@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_090615_544476_E3B10ED7 
X-CRM114-Status: GOOD (  12.82  )
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

Enable the second HDMI output port found on FriendlyElec CM3588 and CM3588 Plus

Signed-off-by: David Petry <petry103@gmail.com>
---
Changes in v2:
 - Fixed commit message according to feedback from Heiko Stuebner
---
 .../rk3588-friendlyelec-cm3588-nas.dts        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 5fbbeb6f5a935..10a7d3691a26f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -101,6 +101,17 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
@@ -335,6 +346,22 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdmi_receiver_cma {
 	status = "okay";
 };
@@ -350,6 +377,10 @@ &hdptxphy0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 /* Connected to MIPI-DSI0 */
 &i2c5 {
 	pinctrl-names = "default";
@@ -840,3 +871,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.47.3


