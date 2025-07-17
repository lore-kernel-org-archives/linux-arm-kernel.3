Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5CCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7wZY4iMw3S+iyFocZDdAUMBd6mAxDCSWG7psuC77bY=; b=0SHt5R3qdhdsBlXjefB4AtjyhK
	8/KZpuq1vnw/WGX6EXcIwlrW2zn7+xKX+nTjU0J7VCed1hzwj+aVD9uhKYG0nc01CtJrU/KsH9m22
	VuatAR555cRbiZVCJcqn32oLBNDZ/wExYUNVCjkF45d+ONCt3URbB1ZJ4jpFkg1Whxe+8wk+5EFb0
	1UQvY6h3G+3ejkDs2P1O2YlRjjq3zJfiWv/Yp8JjKvPG2owiN7p/4nTp1zTP05dkMO9QLx8Hw7c4q
	KqoytOlSF4w/n58SR44uZ+xSt1lAibQU8gffixfEUza7wbcRCPE14WnA80AWpNQDc2H79JOwSWlGJ
	5hmFzWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUFj-0000000B0uX-32cf;
	Thu, 17 Jul 2025 19:26:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU63-0000000Ayxk-0Gh5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 19:16:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a52874d593so1048721f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752779805; x=1753384605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7wZY4iMw3S+iyFocZDdAUMBd6mAxDCSWG7psuC77bY=;
        b=HOTN270VzBDzSYFsJshNQbJ13ELZx67Ea9uRXzGc2j3TAGA75GV/+bmHfBEy34qXGx
         DetgPt+xV0+oEsyt19QBSyA/zAVtDFePZMFy9iyyi+1SqtNKOFLEEGBqWxlTqP2DUALX
         soFlgAE3ZhvMftqiMlyuYryNZNYZYZRHUrM7a7Yp6dxB6v4JJCi9hs/vxJnbKnPLA+8Y
         ob9HgM+oAmhJFd4tXY6ftx+ASFcX1R1h/ApRiq7TwAKd3JH59h+CJL4qZjIQchVuNXYe
         S7JXdzpY9N5JpYBdxBJBF7oRTir1q29EbQga0/RS8H5s5DDV6voCrn14+5nqfuQdk7/w
         kl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779805; x=1753384605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7wZY4iMw3S+iyFocZDdAUMBd6mAxDCSWG7psuC77bY=;
        b=MA3cyYMoh2mUPHF34qDpK6RCquwEkk1wDGss9GQy6QUxpraQVPScuVqJ6UOZq5InCx
         h5npNQUiSQypU0no3tA7KUIkqW95hz+YLTJQuvGObgljNZYSq0fwYQtfP/3EJbjGVsQu
         Z0cRZrvb/NVGgu6MB7qvWb1t8OHycUVLcm8JSdZVjYNw/Xyg3JE7jpErg9EvrTMeZG41
         hubzJhPa/fooeJJXPutLseldVLLKNZANT1jCh+3vPi8dNwlPjaovveHVfekmhCIl2Cy1
         ZsH+7DazLjZlIZDalEYPb9smOOTprXDRpRUn7s94I2cdE/IChwG4Zv1W0utGLHqtuBt1
         lqUg==
X-Forwarded-Encrypted: i=1; AJvYcCXFIaS2CpejtEFtNVPpS1eILalhbujF6vQT4rhD1BlBVAzccXJLaqW+4wlkp42zgzlDi6a3CLUhC2GZ0Wiggdgg@lists.infradead.org
X-Gm-Message-State: AOJu0YxZnacBOqg3sUbgMA21dy8x9WbV50IovrJ9NCBPbdyAQdNnECFg
	aQFHfB/MhhgMjm3yxWy25vU7qo2yBE3QWfyYdy5yos4+wLDyAAzUb81F
X-Gm-Gg: ASbGncs+pa1YROy+NOlVaGfXpP5w4w96VNEftPbX5H5JF65XHeCo2JTcQQ3UlI10O+b
	lmbqHb08UXfX9O8PlPR22w9KL50OqYivBSSYEqyk06EniZZ6mOkYf8vHlcqT+5FSHu7bB5MeDiI
	D+K0wbVBy1zOmwdHvrNicNZCOORWAtC+eLHBoxDx40QM316JFh3SrOJqqcS7sVm8yV3FwaEpfGf
	BqkMSuEG52E6/C1mmSxA5nsPtn08P/5gyZrBerSmlbo3kvcheNraayTQ7LwQYPI5/aJ/pA9xgfm
	5EsAJeUVtPoblZU2ff1Qx3p/yADQY3CRTNsSHx/RctbfOv2niEzsPh/nbj8YHeMK5Och/PW4YFb
	kMzRXskIvC8YDt/G/o24/iw==
X-Google-Smtp-Source: AGHT+IEaWpyAkfNY16SIAQ5Qr8spUGP8XPUVtJlDTbDMPM28VEWzZoDlp033KO7PNx6qhV2Hd7fPBw==
X-Received: by 2002:a05:6000:310d:b0:3b6:c6b:e4e6 with SMTP id ffacd0b85a97d-3b60e4be9b2mr6714332f8f.11.1752779805329;
        Thu, 17 Jul 2025 12:16:45 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4562e89c739sm58164615e9.32.2025.07.17.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:16:45 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:34 +0200
Subject: [PATCH 3/4] ARM: dts: sti: extract display subsystem out of soc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-3-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10843;
 i=rgallaispou@gmail.com; h=from:subject:message-id;
 bh=Wiu/65e3susvS7JkHh1yHaahU+pjFzGTsPfFYQByFWw=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYzf7hOYj6ppQRFLV+8X9OCA8WzrVH8DOrN
 W6WahlUEF6JAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tcp0D/9PM8j3Fqnq+WEeu2zRJNkflTpxsxy4Sh2KeHUoi/zsiPwxJd7hwjSmrzukOsSsbG7hth2
 23QhQpBXKwUApvtodc82b2/9FPWCTa6n5RUcUcFCFeO6jZowQg7uFozKaMSSGs6xCsQsfKrkJY6
 RPqZnZVRREpZg102KGOslpvBK0KPFxPVKufcIn6ep8NmX1XOMigkdkqW116bryrfUsaEmobOfju
 c69yF/JU0Xhf8kdCOVUVD5u0v1wOeQqwR5HHOcfQZdATU+6LoOIP1cKRP/qeDbi7cSOBm5V8ncb
 TKVHginXdiuldgvg9rsH3QWZvNEymY4fQMcuyh7cPa9S1f4etGuac45Pzo0oWElxSCQOg13muio
 2fJNY3qOBTaWxQITe8hWNUpIP5x455YuFIe/NYutGHY1HD/eazIY6aLtgTp9OtmtEmqX4daF6nO
 7tyJHhzzmxngNGoO9LIgLD1czx0Kq20S52hwwI1tzMfEgW0dWfFHRIh1EJcK76B+f2de62YkaQ8
 bPwf2hsZrbljJqHOLKp5OdH2bvyrwUlwCAH2xqiM+n0Ayqn/BVmSmOUUWOyq6pvEHiQXfu58ctK
 4tmXrxwDws3pbIrjD85aVA154ZnT6/Gi0bu99ciLCpHcMhOQbvyC9xQBR6m18ZWaSv/n/wfMiDr
 8jBo4Yt8YeOLYww==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121647_145602_8AABA9A1 
X-CRM114-Status: GOOD (  11.94  )
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

The display subsystem represent how IPs are interacting together and
have nothing to do within the SoC node.

Extract it from the SoC node and let IPs nodes in the Soc node.

Several nodes did not use conventional name:
 * sti-display-subsystem -> display-subsystem
 * sti-controller -> display-controller
 * sti-tvout -> encoder
 * sti-hda -> analog
 * sti-hqvdp -> plane

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih410.dtsi | 316 +++++++++++++++++++++++---------------
 1 file changed, 188 insertions(+), 128 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
index d56343f44fda4e9e1de2e5efc86e2d984bad14b4..47d66d7eb07a3d73d98b3e21d62b2253aa1171e4 100644
--- a/arch/arm/boot/dts/st/stih410.dtsi
+++ b/arch/arm/boot/dts/st/stih410.dtsi
@@ -34,6 +34,41 @@ usb2_picophy2: phy3 {
 		status = "disabled";
 	};
 
+	display-subsystem {
+		compatible = "st,sti-display-subsystem";
+		ports = <&compositor>, <&hqvdp>, <&tvout>, <&sti_hdmi>;
+
+		assigned-clocks = <&clk_s_d2_quadfs 0>,
+				  <&clk_s_d2_quadfs 1>,
+				  <&clk_s_c0_pll1 0>,
+				  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
+				  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
+				  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
+				  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
+				  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
+				  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
+				  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
+				  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
+
+		assigned-clock-parents = <0>,
+					 <0>,
+					 <0>,
+					 <&clk_s_c0_pll1 0>,
+					 <&clk_s_c0_pll1 0>,
+					 <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 1>,
+					 <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 0>;
+
+		assigned-clock-rates = <297000000>,
+				       <297000000>,
+				       <0>,
+				       <400000000>,
+				       <400000000>;
+	};
+
 	soc {
 		ohci0: usb@9a03c00 {
 			compatible = "st,st-ohci-300x";
@@ -99,153 +134,178 @@ ehci1: usb@9a83e00 {
 			status = "disabled";
 		};
 
-		sti-display-subsystem@0 {
-			compatible = "st,sti-display-subsystem";
+		compositor: display-controller@9d11000 {
+			compatible = "st,stih407-compositor";
+			reg = <0x9d11000 0x1000>;
+
+			clock-names = "compo_main",
+				      "compo_aux",
+				      "pix_main",
+				      "pix_aux",
+				      "pix_gdp1",
+				      "pix_gdp2",
+				      "pix_gdp3",
+				      "pix_gdp4",
+				      "main_parent",
+				      "aux_parent";
+
+			clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
+				 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
+				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
+				 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
+				 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
+				 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
+				 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
+				 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
+				 <&clk_s_d2_quadfs 0>,
+				 <&clk_s_d2_quadfs 1>;
+
+			reset-names = "compo-main", "compo-aux";
+			resets = <&softreset STIH407_COMPO_SOFTRESET>,
+				 <&softreset STIH407_COMPO_SOFTRESET>;
+			st,vtg = <&vtg_main>, <&vtg_aux>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					compo_main_out: endpoint {
+						remote-endpoint = <&tvout_in0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					compo_aux_out: endpoint {
+						remote-endpoint = <&tvout_in1>;
+					};
+				};
+			};
+		};
+
+		tvout: encoder@8d08000 {
+			compatible = "st,stih407-tvout";
+			reg = <0x8d08000 0x1000>;
+			reg-names = "tvout-reg";
+			reset-names = "tvout";
+			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
+					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
+					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
+					  <&clk_s_d0_flexgen CLK_PCM_0>,
+					  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
+					  <&clk_s_d2_flexgen CLK_HDDAC>;
 
-			reg = <0 0>;
-			assigned-clocks = <&clk_s_d2_quadfs 0>,
-					  <&clk_s_d2_quadfs 1>,
-					  <&clk_s_c0_pll1 0>,
-					  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
-					  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
-
-			assigned-clock-parents = <0>,
-						 <0>,
-						 <0>,
-						 <&clk_s_c0_pll1 0>,
-						 <&clk_s_c0_pll1 0>,
-						 <&clk_s_d2_quadfs 0>,
-						 <&clk_s_d2_quadfs 1>,
-						 <&clk_s_d2_quadfs 0>,
+			assigned-clock-parents = <&clk_s_d2_quadfs 0>,
+						 <&clk_tmdsout_hdmi>,
 						 <&clk_s_d2_quadfs 0>,
+						 <&clk_s_d0_quadfs 0>,
 						 <&clk_s_d2_quadfs 0>,
 						 <&clk_s_d2_quadfs 0>;
 
-			assigned-clock-rates = <297000000>,
-					       <297000000>,
-					       <0>,
-					       <400000000>,
-					       <400000000>;
-
-			ranges;
-
-			sti-compositor@9d11000 {
-				compatible = "st,stih407-compositor";
-				reg = <0x9d11000 0x1000>;
-
-				clock-names = "compo_main",
-					      "compo_aux",
-					      "pix_main",
-					      "pix_aux",
-					      "pix_gdp1",
-					      "pix_gdp2",
-					      "pix_gdp3",
-					      "pix_gdp4",
-					      "main_parent",
-					      "aux_parent";
-
-				clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
-					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
-					 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
-					 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
-
-				reset-names = "compo-main", "compo-aux";
-				resets = <&softreset STIH407_COMPO_SOFTRESET>,
-					 <&softreset STIH407_COMPO_SOFTRESET>;
-				st,vtg = <&vtg_main>, <&vtg_aux>;
-			};
-
-			sti-tvout@8d08000 {
-				compatible = "st,stih407-tvout";
-				reg = <0x8d08000 0x1000>;
-				reg-names = "tvout-reg";
-				reset-names = "tvout";
-				resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
+			ports {
 				#address-cells = <1>;
-				#size-cells = <1>;
-				assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
-						  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
-						  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
-						  <&clk_s_d0_flexgen CLK_PCM_0>,
-						  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
-						  <&clk_s_d2_flexgen CLK_HDDAC>;
+				#size-cells = <0>;
 
-				assigned-clock-parents = <&clk_s_d2_quadfs 0>,
-							 <&clk_tmdsout_hdmi>,
-							 <&clk_s_d2_quadfs 0>,
-							 <&clk_s_d0_quadfs 0>,
-							 <&clk_s_d2_quadfs 0>,
-							 <&clk_s_d2_quadfs 0>;
+				port@0 {
+					reg = <0>;
+					tvout_in0: endpoint {
+						remote-endpoint = <&compo_main_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					tvout_in1: endpoint {
+						remote-endpoint = <&compo_aux_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					tvout_out0: endpoint {
+						remote-endpoint = <&hdmi_in>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					tvout_out1: endpoint {
+						remote-endpoint = <&hda_in>;
+					};
+				};
 			};
+		};
 
-			sti_hdmi: sti-hdmi@8d04000 {
-				compatible = "st,stih407-hdmi";
-				reg = <0x8d04000 0x1000>;
-				reg-names = "hdmi-reg";
-				#sound-dai-cells = <0>;
-				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "irq";
-				clock-names = "pix",
-					      "tmds",
-					      "phy",
-					      "audio",
-					      "main_parent",
-					      "aux_parent";
+		sti_hdmi: hdmi@8d04000 {
+			compatible = "st,stih407-hdmi";
+			reg = <0x8d04000 0x1000>;
+			reg-names = "hdmi-reg";
+			#sound-dai-cells = <0>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "irq";
+			clock-names = "pix",
+				      "tmds",
+				      "phy",
+				      "audio",
+				      "main_parent",
+				      "aux_parent";
 
-				clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
-					 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
-					 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
-					 <&clk_s_d0_flexgen CLK_PCM_0>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
+			clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
+				 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
+				 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
+				 <&clk_s_d0_flexgen CLK_PCM_0>,
+				 <&clk_s_d2_quadfs 0>,
+				 <&clk_s_d2_quadfs 1>;
 
-				hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
-				reset-names = "hdmi";
-				resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
-				ddc = <&hdmiddc>;
+			hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
+			reset-names = "hdmi";
+			resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
+			ddc = <&hdmiddc>;
+
+			port {
+				hdmi_in: endpoint {
+					remote-endpoint = <&tvout_out0>;
+				};
 			};
+		};
 
-			sti-hda@8d02000 {
-				compatible = "st,stih407-hda";
-				status = "disabled";
-				reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
-				reg-names = "hda-reg", "video-dacs-ctrl";
-				clock-names = "pix",
-					      "hddac",
-					      "main_parent",
-					      "aux_parent";
-				clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
-					 <&clk_s_d2_flexgen CLK_HDDAC>,
-					 <&clk_s_d2_quadfs 0>,
-					 <&clk_s_d2_quadfs 1>;
-			};
+		analog@8d02000 {
+			compatible = "st,stih407-hda";
+			status = "disabled";
+			reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
+			reg-names = "hda-reg", "video-dacs-ctrl";
+			clock-names = "pix",
+				      "hddac",
+				      "main_parent",
+				      "aux_parent";
+			clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
+				 <&clk_s_d2_flexgen CLK_HDDAC>,
+				 <&clk_s_d2_quadfs 0>,
+				 <&clk_s_d2_quadfs 1>;
 
-			sti-hqvdp@9c00000 {
-				compatible = "st,stih407-hqvdp";
-				reg = <0x9C00000 0x100000>;
-				clock-names = "hqvdp", "pix_main";
-				clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
-					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
-				reset-names = "hqvdp";
-				resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
-				st,vtg = <&vtg_main>;
+			port {
+				hda_in: endpoint {
+					remote-endpoint = <&tvout_out1>;
+				};
 			};
 		};
 
+		hqvdp: plane@9c00000 {
+			compatible = "st,stih407-hqvdp";
+			reg = <0x9C00000 0x100000>;
+			clock-names = "hqvdp", "pix_main";
+			clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
+				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
+			reset-names = "hqvdp";
+			resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
+			st,vtg = <&vtg_main>;
+		};
+
 		bdisp0:bdisp@9f10000 {
 			compatible = "st,stih407-bdisp";
 			reg = <0x9f10000 0x1000>;

-- 
2.50.1


