Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D3CD3ABD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuwG52/VBZoIAELJNnOz0xD1tNHC8lVIM/18UIXkAKA=; b=b3Il/gQ3fSbwtV9D2BwDfrnOa7
	1SDH98Fri7WpLGoDdoZCaxuWRJPKHyDr0AuC4/zGrE0jJcXr8cGyr+jT0phEc3nL0Fi/gJBGu+25u
	OmUNk+wHgQ+u+JlfDVbzVRHE+FN9poRcxtvJ4CZfaMK7g4bY/WWYHqngSx10OJg016EeOcdFKh3ho
	pCU9rA421c20EBbfRwWnR3JGRC/12u7PmjsybNnouayAcxlvOOpS/NPL1JUwSsrzG2g0dNVQ2GLaN
	cUwTsL/UWX0+FM4J5Bk//d+Tae0E7mP5k5+put8TDSBPVgGbzYygKfx4CQNI57WRAxQ66L/jQfE8n
	VnjxRnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXgG-00000000dgR-0rzi;
	Mon, 11 Nov 2024 16:54:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXcm-00000000dAJ-1ZOX;
	Mon, 11 Nov 2024 16:50:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e4c2e36d5so128275b3a.2;
        Mon, 11 Nov 2024 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731343845; x=1731948645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuwG52/VBZoIAELJNnOz0xD1tNHC8lVIM/18UIXkAKA=;
        b=IA4hVpBZ2itKYSfxCc41fxQmTcbsfUe9+TQjoQpSgnwb+9oXAX8B+j4/xwPYy7OwqU
         DIucnFhmt3Q8ATm791e3/Wr8p2PIH6fFV6cIoHjNo70El4lfpdmQGvnfaBRgufGjSClL
         G6MU0uFtstyy1z6iSafr2+QHOc8epsAXtytKlWqEMKw3BQMBIIdtEhQwBIdZ6F4scBrV
         Li/TDNA52q1d1P8xOdF8Tmk+CBIS4qAWVJVFC1Pkk4oKJMjKyZ2ibh/rCBlbrGeKZCSF
         gYzmP2ieU0RpSQk0kslbJ2duFN9oszDmwHufvGSAGsvFg/gYD69F1ztXY04GYEyE5c6d
         Vmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731343845; x=1731948645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuwG52/VBZoIAELJNnOz0xD1tNHC8lVIM/18UIXkAKA=;
        b=LHdcVG1Ck0n7H7Hap+LDz8ZthpjegnfVSo3fWW1E8cF3ka50RyD4x3NijinNJo5XGb
         Jj9zW8SRFvuVwiKrSl+eGKAB3pSY7F31dJ6eY2GfVPq1dA2XNGci6VHl+3flvqHLiIme
         tTaGZ22Oi9bJv5ubdKXIHyLr/2HbBFER8Btj2D0q1eYCNYvlgs69jXVgC91jCRL6R70e
         967b9Dbj3exqsERekQP9pPyAb4tFz15H0CuXBAbJfoatIKw2/efdVQAHC6ZqLofUB5c2
         peiV6u4iH58mWbVSkjweOF/pX4SxVw6qG/kN8vFUxpQRRRSprT+CJ+I64e0ZJca6UZ04
         lm0A==
X-Forwarded-Encrypted: i=1; AJvYcCWr5dchVSz5nP9XcaZV5IirhJU+rwS9TCOqRSrLU0hmyfmoCtQdlXB9rZ6dIrC747pL0fTJwOVZKPGy8ZDrKtaG@lists.infradead.org
X-Gm-Message-State: AOJu0YwL249JUByGeSfXtZeRWlLOBeXQTV1zX+cjG3IagizM4omldVBU
	xqADjNoEphN56cyEwGc1lRBh3uYv4LdM8AlaOEV3W7o2nYh9L60l1a9H8Hrk
X-Google-Smtp-Source: AGHT+IE47aehOo9+5XJxP7J3fFZt4ohbuOovj+8Ybp+54UpV5R+tuCYOcLUSE+OW5HQpnHd5TS+I5Q==
X-Received: by 2002:a05:6a00:1828:b0:71e:66ed:7bd4 with SMTP id d2e1a72fcca58-72413263f12mr7087915b3a.1.1731343845448;
        Mon, 11 Nov 2024 08:50:45 -0800 (PST)
Received: from rock-5b.. ([221.220.134.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a19dd8sm9401955b3a.157.2024.11.11.08.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:50:44 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: Enable HDMI0 on armsom-sige7
Date: Tue, 12 Nov 2024 00:50:03 +0800
Message-ID: <20241111165026.60805-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111165026.60805-1-liujianfeng1994@gmail.com>
References: <20241111165026.60805-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_085048_436714_1F21324A 
X-CRM114-Status: GOOD (  10.90  )
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

Add the necessary DT changes to enable HDMI0 on ArmSoM Sige7.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 .../boot/dts/rockchip/rk3588-armsom-sige7.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 08f09053a06..b3e9ffe5234 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588.dtsi"
 
 / {
@@ -33,6 +34,17 @@ analog-sound {
 			  "Headphone", "Headphones";
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -164,6 +176,26 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -723,3 +755,18 @@ &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.43.0


