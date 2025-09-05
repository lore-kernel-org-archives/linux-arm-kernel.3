Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8068CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzt7qrENbx/8j/QYtoZElmLzncNQBAh6Evzi2YZaWyc=; b=egrgdUVg+go94Oa19qNxp2cMCA
	+En2MxNMMLmzK0LaLdtzsVXeR6KwsVxWQPf0I6KSpSBud7uD3Q1hc3VexjkePsn14k404JkPbPezD
	cV1BoXgOXHVb116W82tVifVNRJcGs/4EXK0bTPl7XmExxVPrFc1lzF9bRQ3ozN/krSuVVY01zeccw
	JE+YXVAq2FR+/LMTETliNF5hVfvfAwRGHGQqahcu2IzPGQPqJxDwU3fxk2Bv4EfA2Jv6CODK0CepE
	9LhCw7sRTa7BBXxlFJoN68yiLvTtrLOAQO5ABEu6+JWKvfbIMxnDZ2owO7liSyaHRE9+zo8LZ1Yua
	JdyRiNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaQw-00000003Xij-21VZ;
	Fri, 05 Sep 2025 17:41:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVxi-00000001oNl-399M;
	Fri, 05 Sep 2025 12:54:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3277c603b83so1229544a91.2;
        Fri, 05 Sep 2025 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757076882; x=1757681682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzt7qrENbx/8j/QYtoZElmLzncNQBAh6Evzi2YZaWyc=;
        b=Zz9Qe8IGdFxZGq1vJDC816N8K9AvYbTSepJ3aAIaXQvjWoLhbX/E7K1jwNgqS/t/Pc
         eaWjgR8s4ehPED0T56Ub25g/AtyJgLT3p2WDzmzAzpIIsAVUM5zcEp1nMegj5F0hk33A
         0VdaFiqwyrvHBRJKtYudz3TgBftaacS9T2mRpU7CcOSw7oKlWkl8GcsfoNO4BRLjM49S
         tcUHMGddBw3hfhMkAQIkCMbjc0BCoHu4kNty4nQJAIUuZ+V17+wVUwPS35xJFROYl0Yz
         rFeEGlvDDxPdeEAUY/DaNIe8Jx86ksqxIWgeMglhp7g/6RzQYlDshkhzwm4uQLeUN0S0
         5Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076882; x=1757681682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pzt7qrENbx/8j/QYtoZElmLzncNQBAh6Evzi2YZaWyc=;
        b=n/NBj6JoVmas9DpxvmVQRvHenZpfcswVntvCn55LoHgTtxPPPwP/Bq61B75WMWCvYO
         Te7BW+RziyhxA2Nvjrxtc6EqhFtDgmorxR672z2Q3dka1h6Zi92+7pZdVJvDkfghDeWP
         E+f+2Rism7ykxpv80F8+dwl/kXPbG8jerEUnld5ksbTqQqKzlApjAoRby+wzpgh8fx8Y
         oHtgWBcn6QpDOp71rRMvOua2LzOa2Dk8cc6+oOgGKJSbehwx67l+FK1+YVN3fl3DkyBo
         Wjhjrc0fU3ZvzuJd9yGmg/5s8wX5Ki2ISO8/SGEyscn83jryfSWL0+E6/n3kg+dKKMXo
         RN3A==
X-Forwarded-Encrypted: i=1; AJvYcCUQxY7Kgado4CDmkc8h+jHZvaaWMXaAg3Brs7DAVs23tBv+qgX4NicNq0xrATu65E5mb/lq5GWzjE299hTX35gP@lists.infradead.org, AJvYcCUZUjZ1OXJHCAXh18ZPkmAIY8g0mOznkS7SGQ58SwSqiQCiSM8VXBLePPz1LQCjbixr89Z9KKZegT0LiNkJn0s=@lists.infradead.org, AJvYcCVmNuxn5SxpNNY6nczXQdd9vfLmclNHvzX4o+dffYFXRs5sY9FkT7PVKn+rLhxx3MzCOAzr1pr2VgU0@lists.infradead.org
X-Gm-Message-State: AOJu0YxEs1xIe4oUaG6VZLY07v5gBNgcx+NiNj7H/1QlG1NCfA/YF/qo
	H9ODa3CeoX1fayCxiI+oZNiXPIM2J650ZxmhbsIL1/rypUXJnCcpMLHA
X-Gm-Gg: ASbGncvjqMF4yk+6atgl8/BU7uDkDA1cjAk6ql5juodZn4HT+ZaCk1Da+KgsyEWdYrL
	r2CLoYDtgbf2cnOpMYkqjcVRS7RTuFwECDshnA4vVbVjKd2i26FVB1xlkzWDRSfF72ojSjJd0cB
	vu9ZjztmxBylCCP4r2Adzg9uzzTnySd7AnGoskFujxyLonBcMS+NbV1TennZcL2oxtVWR1VvBJP
	GAIq8n2hqxPD274LYciWMLIQYEQUG4uUrpJgmLaAWG2S/3D09Xqg/PTM8ECJa+6zLTZIgyAg0i4
	nCvr3tOvPx5YW1A3Kja/AGSXleIZ9/SrJDLWhaaCdSnIkwovzu6DRGZcmQWnDFCiePF8VpOYuqu
	3z6G2oi0GyrNdKDsjPZYGHdobv9Ay18RZ
X-Google-Smtp-Source: AGHT+IGwaXpMS2RTd/sFuAtY1Bq+6bu9GKob5Mqjz6hbplf9JNkChNQZjJMmG8KUui+rta/1CzzCVA==
X-Received: by 2002:a17:90b:5865:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-328156c62c2mr25634481a91.22.1757076881888;
        Fri, 05 Sep 2025 05:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb98f9f6asm4992305a12.8.2025.09.05.05.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:54:41 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 2/4] arm64: dts: rockchip: Add USB2.0 PHY for RK3368
Date: Fri,  5 Sep 2025 20:53:15 +0800
Message-ID: <20250905125318.7956-3-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905125318.7956-1-cn.liweihao@gmail.com>
References: <20250905125318.7956-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_055442_786536_5377C25B 
X-CRM114-Status: UNSURE (   8.96  )
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

RK3368 has one USB2.0 PHY with two ports, This adds device tree node for
it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 1b21787269..b09e431a64 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -766,11 +766,40 @@ cru: clock-controller@ff760000 {
 	grf: syscon@ff770000 {
 		compatible = "rockchip,rk3368-grf", "syscon", "simple-mfd";
 		reg = <0x0 0xff770000 0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		io_domains: io-domains {
 			compatible = "rockchip,rk3368-io-voltage-domain";
 			status = "disabled";
 		};
+
+		u2phy: usb2-phy@700 {
+			compatible = "rockchip,rk3368-usb2phy";
+			reg = <0x700 0x2c>;
+			clocks = <&cru SCLK_OTGPHY0>;
+			clock-names = "phyclk";
+			clock-output-names = "usb480m_phy";
+			#clock-cells = <0>;
+			status = "disabled";
+
+			u2phy_otg: otg-port {
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			u2phy_host: host-port {
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 	};
 
 	wdt: watchdog@ff800000 {
-- 
2.39.5


