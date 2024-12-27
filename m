Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C6AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w6IDrf1UQsBPwLJSTWT95TeUNn5GWIJ2Bqwzoko6qnE=; b=d+J6iFkmQk4m+6NpzHGhJBompj
	/PyQhW1lqtjV7ApDUGO/KNGt9kCFPwKOPG98iF7vHWvj6inCLjMEiDUSRU46qeblW+fseNJGYEJ1F
	LzFXoOLtXnVKOic3/0KHRNn0vPDf9ncFqh1ilM98Q8ibhEClPUvJwKdCHObh8psHxdWL/goFOZ+UC
	qe7g3Hm5XW1fe4vCM0IQdiB6Mv8OcdlXU6hxwe54DsUphLFPVs7rt9EW+OuzregKh7mLdC1zPzjKI
	tcM9sLfqi23z2a6G3rQW4YhLMgW79+mbJLgIBdRgkbTd6P7Y8lfDCsuADcTgyN1aGkJcX7wn5RBNd
	VAhQaiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAQe-00000000IKG-0eoD;
	Fri, 27 Dec 2024 13:31:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAPT-00000000IE7-1hQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:29:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2164b1f05caso87036725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735306186; x=1735910986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w6IDrf1UQsBPwLJSTWT95TeUNn5GWIJ2Bqwzoko6qnE=;
        b=KcgClry4ICYtod4//wCA2cVEfDbn5/TQ6GXmv/owqp6NXTlH7HG5SEnEEFrygxcsfl
         3nrSlVLuNIZLu9+s+GqirBOlKJd+ypVmvPSVE0WTxQ6rigLCLqEhrpib1eJgsNLBaLYN
         HlJNBxixuoK/TdzUrkbt1wIFUsHNjWcYhkz8o2VzARD+pXdgFLOquzILveZyQLZfPvoQ
         PuGSJZ9ZWGELKwrzklATS7oiQ2aexE2IEW+ktxO0ZhZY5rPb8UuYzdjIof9/qjbU4i0g
         8ODeUvpic5KeY3CZ0vdRw5SAgjhAP+JXArB35OnSlJ5vI+6gYjwhH2Xs/MBXo71No2oa
         Q6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306186; x=1735910986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6IDrf1UQsBPwLJSTWT95TeUNn5GWIJ2Bqwzoko6qnE=;
        b=VbnmpJ20mVg/MeZ3KL66r/EGM0cQEtPSJ/EE47tXb/odMmLzCK5JTWB7Oz0yvRTQso
         Ee4TqGyuBjD2Bn+1PKWc7xFjTd+x0/12dyk1BzEKx2UyU9CXYSfq4lYJ/0THzpstW8ON
         3Blauvd1oMaPzU9L/CubLapCaILMDfSqy41Eks78WIlYMFvlz8udjuNQcUVzPMhXac7a
         Vx7VAuYMClMD64k/FCbcjxRLxUolWeDScFUjtOhtLofQjzLnSx9tNhooDXU/fF9+53kU
         rAGBL4ftcECJ6nuTNQ0TExWcz9jXhYX/++fbhRzySVcsylfyGLYVEoqsMcIJ3uo3Y5kx
         +wxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUIVEklRr9zqnbUr0glVnc1rykzl7pMO+bLcQG/Ssf0V5+CFfhZyqjV4sVAznSdIuLhDoQh02fdDlpxxljBX6X@lists.infradead.org
X-Gm-Message-State: AOJu0YxChMsg0gd94FJGjx90cRXaz+OWQb0d58LjOKBfiI4obrUDxEf3
	HhXpGMXyWNzafQfsX2w+Ordjnz1NITQZVERiBYEKnrnczBZuAXJX6MftdK6F43E=
X-Gm-Gg: ASbGncvlYDwRU9XqzFgBJaepVfhK4tv7v/vsrh8DJpVrbY++C/MksQm2RPLBgLxfdOn
	8bNZZFtD0M3Q5KL2Q1rbYP6JfZX6Er7hgx6igU5mNI91Svjd7TCzKBUTyTRP0Y2CO5hGFmp8rta
	5fbUtl1lfq83dfPKAXoiLgK9j01BKwnttoiu1Zkgzl2GQLgs2ZgIRtbR3sW57EnQZ+v9q3Q/EJ1
	5Io02cxPjjXSmCOwgtDzuOgXDfRAEieP3djuZNBm7bNysbxLAhpo8zs55LDVY66W6t1oM4=
X-Google-Smtp-Source: AGHT+IG+o5PNLAqY9O3P+IZr12zVMoET16tLK/MND1ykf51ykoLr+pbcQqxGVDb8pd31oedibkO65A==
X-Received: by 2002:a05:6a00:35c3:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72abde09893mr38212752b3a.12.1735306186439;
        Fri, 27 Dec 2024 05:29:46 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([103.217.239.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb5asm14510517b3a.93.2024.12.27.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:29:45 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH V2] arm64: dts: rockchip: Enable HDMI1 out for Edgeble-6TOPS Modules
Date: Fri, 27 Dec 2024 18:59:36 +0530
Message-Id: <20241227132936.168100-1-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_052947_445555_2DF6B8D9 
X-CRM114-Status: GOOD (  10.87  )
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

Edgeble-6TOPS modules configure HDMI1 for HDMI Out from RK3588.

Enable it on Edgeble-6TOPS IO Board dtsi.

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- Rebase on top of Cristian's series
https://patchwork.kernel.org/project/linux-rockchip/cover/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
- Update hdptxphy1

 .../dts/rockchip/rk3588-edgeble-neu6a-io.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
index 7125790bbed2..08920344a4b8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi
@@ -4,12 +4,24 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 
 / {
 	chosen {
 		stdout-path = "serial2:1500000n8";
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
 	/* Unnamed gated oscillator: 100MHz,3.3V,3225 */
 	pcie30_port0_refclk: pcie30_port1_refclk: pcie-oscillator {
 		compatible = "gated-fixed-clock";
@@ -81,6 +93,26 @@ &combphy2_psu {
 	status = "okay";
 };
 
+&hdmi1 {
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -275,3 +307,18 @@ &usb_host1_ohci {
 &usb_host2_xhci {
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
+	vp0_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp0>;
+	};
+};
-- 
2.34.1


