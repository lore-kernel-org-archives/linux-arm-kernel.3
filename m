Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824ACCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNwfswXuk6b86cUinRg+xMrD56clpn37pgGLAjruqJQ=; b=g9DIoyCqSp4f5KWhQonS35I7eR
	yTsYoLsQL/rOHBjmR6cEIP0x0hWemFWyP/8HKJzPqv02OkJLNTXs6YvgYy708b57f0N36Uyn6rH4D
	BCNfdsjEAybZaxIxJPu1oI86LLFZ9k/g0rL0Pflu+YV8ivO/242CkKJqPL12LgMByyz8npD01Uhed
	IpoDH1duyFF9G9jX1L7uCErFP38Y8IVk4fBxeDssBdtNtBkHYU7VDmeYlvN7CikrbgJ+j4ikGKwmj
	48kXYZY00oK5TExPY83e3SBmruxS4YTAgl7re1gzbAVicre0c+bnv0/TBE37KS8SAVVkgplCQnyxC
	Ifb0j+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUHQ-0000000B4lz-1glG;
	Sun, 19 Oct 2025 14:21:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUHN-0000000B4gc-1spN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 14:21:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so17796655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760883657; x=1761488457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNwfswXuk6b86cUinRg+xMrD56clpn37pgGLAjruqJQ=;
        b=BApcxN5HHbFwCosuYAbTRiWV24QwWA8r7xGpWzRIB2doum4+FUpIy7i5NmX66JOmrl
         ltNdX4sDKHEZBdxCBQvOuXWl3g/qFq8SHvtWE4Mk6ixVNwA/ax23bl+y1X3OmbdHmJeN
         Spr6/pSTJKGFGSLjWn5Vr8NGdzSB6X1ECJgiOB5wvMV0CDWzUZd4ebin5bxOkQNjE2qT
         9u2mr0QIJjX+X7XcM8FE1sixy/gvuQxnZw8t7/MeGo1mgcJCVCVjjTfqjJ55LnVdssc6
         U6ICdlG8tcIdj+MeQ/SzO1ZrmD0ZqSM5wKvYhNGZMfOdhqPLRpwoeym8kQ4cs4EFIkia
         YDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760883657; x=1761488457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNwfswXuk6b86cUinRg+xMrD56clpn37pgGLAjruqJQ=;
        b=mjUDlxNNaPCtkiiDkwEzOVWKhIZzKD/Rez2WSGHqI2iIQOunPJRIHNRkuCMoAAZI2K
         bKwjltsZbL9ky9Xoklvy+vQt43mv3MkgySggdfdUMY1RLDIjY8MCFsxtQ78/X72Merqi
         a2JLPXj5Ylr/6aUednmwPAYsscUuxOmxqvNsWMpBomw9TQXZCQRvAgTXpKQcHV9VJIdK
         3Od6dgZOL6MZtY+lILPU9IxtZAj1v+4Y0G0ccQgIQ88+V00JOsHt2bvQgW5Q82jEeRuC
         Y9predBcpzp5FRysjzmt/vx+ec0LTpYldF4D5ig0FQoDwHXCUrO4C4pi2KJKquwWM7OI
         9Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCWRpTXUzUOj6pu6MWLI0c7UP0fQewZoG9QdFi5cK1X8kKLyXDeNmijzB5/OKuPuj8XhcVnEQChj8LslWZJUEbl2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf1osbMbnF9qOhjXzf6+BwfyT6CXVZryu3tBDHAUXrewctgAsJ
	ncfWEPoggjnfsA3bfxWwFxplx+4RGqfh1puiFI4WXg/HUV1oGQlZOyJ6
X-Gm-Gg: ASbGncsRABadNbH7orNPTj5YdlK5eWv6UmwiMFbWinqa02x8zLOEDB3FbAJQ/OOMf1i
	P75uzNmMN6yge+xyW3b0T+MASg4zm0gLKyRPy1NxhbOqMaGe0PqlrN7whO8/m8UDe28T7VkRdRH
	CSEBFActF3FVGQukaLKDz0nn1y0mJm04GuY1BT9M5zFg0bvA0z/85HKGoxUlCaJc/oLsvsYBrBZ
	81lmG96cGOLa3Y9aytIstceprTAUoBc1wIfFWZKJQDWzsJSIuZyOK8ozKJm5ZE/mi5YC9o2Yt41
	JLlTO1NE4DcUg6+OQKyTJ3B8j7vPt3AEc0EJ/+jxYYM730E8bYFJoT3ng3GA5s5N3D9Dv/LE4aa
	yv3OLfijQ2uUv0DVXpOOWWCTGfxw4h2ooYEQqTdkOd2OtT+vekFaZHTz7X2zrkx5svsgR
X-Google-Smtp-Source: AGHT+IHnyvRQso2sIdKSn44sYHdiDNSMWI71jiqm7/h6dk5+/XYFEPh2AXjuBP/zzSUTKQwjNh/YYg==
X-Received: by 2002:a05:600c:19d4:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-47117901801mr68374015e9.23.1760883656886;
        Sun, 19 Oct 2025 07:20:56 -0700 (PDT)
Received: from debian.. ([95.88.133.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm182002285e9.11.2025.10.19.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 07:20:56 -0700 (PDT)
From: David Petry <petry103@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Petry <petry103@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Enable second HDMI output on CM3588
Date: Sun, 19 Oct 2025 16:20:53 +0200
Message-ID: <20251019142053.11047-1-petry103@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_072101_523025_74F1180B 
X-CRM114-Status: GOOD (  11.55  )
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

Enable the second HDMI output port found on FriendlyElec CM3588 and CM3588

Signed-off-by: David Petry <petry103@gmail.com>
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


