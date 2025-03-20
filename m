Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBB6C36005
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhPGWpSJf4aEvLnPhTJquxIyNv0KK5Phy3xNH0kC5O0=; b=JJC++J3gysmkMRL9cVXwdPLdSz
	YhoMhdluVi1SHYpI/U9d6jxYoY45N1EeI84zpU2pZYREo/pFxXTY9a0zfrjNdWnaAcadRmNhF/Zs1
	3Ujd+JiJGH9tMJU0kdekB7JIo4GeUeKOQ4lBlvA/HqXWbGmF6k/yCyiV0PdsTJVpi0HZUh4YxW1VO
	/KGmIPLxr0Je8+dFaMxgPRUNgE5ccg+sYQsx1/RcrzH8dPVPlWQD02bd65dd/TEwPv2sFKAeL1FPK
	qHU0rvjQVtBtAesiS/imW5x0sWl3WcLDbTtaE2vVb7m4T9JvPL8BJ+RIYavIl0AWLQe5WhIT6Lw3l
	NT+ZFYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM7-0000000CbrY-49KB;
	Thu, 20 Mar 2025 16:02:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlC-0000000CX3t-1v00
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2260c91576aso17301425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484282; x=1743089082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhPGWpSJf4aEvLnPhTJquxIyNv0KK5Phy3xNH0kC5O0=;
        b=NVQupeB7zvKITtcV75pWYV4VAzpU5woZqyYO9tzDY1vQtGwLPJYm1XuyU5+F9/9rkY
         FxdJimCJk3Z8Uzv76c/0QAPWcP3asXnARNnpmwNpXau07lwgZp15QuqRiJGQy/oBokUd
         k5JFM+6t8iax3neukADi76KxU9/tMFvgRZ+1Augmdk9jCzVmasAsxJXrXMMHEL0GjfuO
         04zcgRpjErPU8diCUUB/QS7H2AcYnmEAI6+/DOlNy1oqdL5RoNVDw9/QS7xb1v6bIjxK
         e6AhjmEGH3KRrE304UWQKN+uUGfQ6w5JRF2Tq2sjzMPAN/qu9qnR5+8d+zXtpyycVo2g
         M0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484282; x=1743089082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhPGWpSJf4aEvLnPhTJquxIyNv0KK5Phy3xNH0kC5O0=;
        b=VaIteMpvBicy6Bz+L9bQY7uTQnplYvLyR1igvKb1cAFrkhLhjqobANC+HYc6xPNA2l
         Qrduqpah0Cwi9TqSVNuGi/vei96MQvJFzvNc9zIbHCtsOF3pGu6DYLTTAc6YiXOophuj
         kUjEKhKdyR8vhvzTEvumpN+E+6hVC5OGCocXCJNPP2RW/g8E+pvs5pkYbZNEzrk6w1j1
         WeNsov8/MCWXRSV0PWppq4XsWi+mwW49ItIWCi2T/9wU6v2c9rqnZ3bIRRlHC7sa7nlB
         KDPucnynQClAycTn1WL0UVASxlwnoUZDuPgDcweUu5XUyBx8XfLnxQMWoCyQHxCjtOn+
         YSkg==
X-Forwarded-Encrypted: i=1; AJvYcCXABGX6n+0BqhFYk6UBSNY8B1oZOOZ85bBkIg9XOKDU0LKuovaZYmcXVD04ZIp4u43dxSXR8yVBS5EJQ+faZly/@lists.infradead.org
X-Gm-Message-State: AOJu0YzyQ49WPTbyigYWd4RAmLQEf0+p34yCOnUFybMpKkEPAZPtd3Qg
	5Q8RxT3w6D1TRwvf25f0wa/ms5yySXtD8T6SHJ4eYMk3h4eGSskL
X-Gm-Gg: ASbGncuTNfDuxz2gW6krbX31bJ3qgLlEEBw2YBZFh0VpwNKCLhw5h/N52/wHuf5z1WM
	GXhq2Ve5XLWijVPTeDsfBQI5mdCmjXCxzZU5dUA25rqfeUQZol8jK2bXO235xKU9T4r0FDpC6uv
	CTQPp5f/guf6Z+HCZip5E6bzsdtcjhU3xYIhujSrFjw5Tvq/n2C9bRRXUfWifkTqdHIcb6Dajcw
	Nf3NpUYclh8MQD+xqWbi0k14dkj6CDXRRqIaWiBC3SLGKKK7Z8UA+dwgMC5jSgDYg2qbz2aYA7w
	3QuvDsaTKJMB8IeBzmV2acd9Uf02uJur78XGFqhq2PPQb3oXcyy1mx3e46QXqv3IowT8eG/qAj4
	UsU7Hiob0d3z0IN313XK0F8FL/VkOrsuO
X-Google-Smtp-Source: AGHT+IGkYoRpTwvX0SPQrV2WZJvZ/92oS7+7U7y4cTjAdvt5uiAV4eA9Zp8uehwfG/gclRTVojzHSg==
X-Received: by 2002:a17:902:cf07:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22649928472mr115859395ad.9.1742484281811;
        Thu, 20 Mar 2025 08:24:41 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:41 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:55 +0800
Subject: [PATCH v5 05/10] ARM: dts: aspeed: catalina: Add second source fan
 controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-5-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=2445;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=zyB2uaDDv1BAG0YqbiEdmRLnG2B1bXVWmRwVAs+kqS8=;
 b=yaNv8/tBD1Dp9LskMzc98/pZcRkIlWncgoAtHa/Wg9TwNWL4CEXyC5gYPtOviqhsSEpoBkEsx
 4B7gSQTFjQDDSpT4l2vBGBkj0T+OQloWQevOabCyJnZBfpDX4KalonZ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082442_499823_2893A666 
X-CRM114-Status: GOOD (  10.21  )
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

Add device tree nodes for the NCT7363 fan controllers on the second-source
Power Distribution Board (PDB).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index fd22add90449..9cbb296dcd9e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -467,6 +467,82 @@ i2c1mux0ch2: i2c@2 {
 			#size-cells = <0>;
 			reg = <0x2>;
 
+			hwmon0: hwmon@1 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x01>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			hwmon1: hwmon@2 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x02>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
 			pwm@21{
 				compatible = "maxim,max31790";
 				reg = <0x21>;

-- 
2.31.1


