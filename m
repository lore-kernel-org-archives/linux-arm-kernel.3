Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AACCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuuQ7S4ybXTFvfChB1I/Sfk/dWMuL7wWCdzzVYhLuhg=; b=ijU58SlXCr8xoxKbXGmKDg9goz
	x1ruMO1y3s0ZI6BN3r/7XXBJD/5aLZRqj0QXrQ8EShqLQ4wRtdAZ3rqpG2MYK3OIxhXmlnP95Irn7
	M9unGhkbB+qxHoG1qd+RT0gnvkfbzlbRmx1fLpYDd7zwub5q15N2bP/5q/36swElYqxmRPVgWHd0B
	5dyXWCW8LDN/q8H8x/cORdZxNXt3sM3gxuDA3EUbsHgo2HJTWqiO2aMw70aT6BGd8Jqic9yXBnMPi
	d4huFhkvWOryT6XU4XOb+XHgNC8xcVu7T+Llzw9t1OhStYXqi2Iuzs2YVELgC8ZwJo6rGemxnWvOo
	AozCTdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZVd-00000003BDN-3FSK;
	Fri, 05 Sep 2025 16:41:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuVxr-00000001oTe-3LE2;
	Fri, 05 Sep 2025 12:54:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24b13313b1bso15867495ad.2;
        Fri, 05 Sep 2025 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757076891; x=1757681691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuuQ7S4ybXTFvfChB1I/Sfk/dWMuL7wWCdzzVYhLuhg=;
        b=jw+NER7EbKghgRv08lQIQrq4vVAjojVSNyk+hJQTaPPJzVjQzE48OE1eeyom7/b1r0
         w8lOgVOAg1VYAv2bKAv6nSeSho/W9Tc9nci9j8LRGP2CjNpvbm8rf/rvT8S1nYcTrPhl
         fs6UUDdad0m9i5QnAIT7pkO1D4vtytCWYRLef40x5gUkBlHU+t+O3K71u16CwjouSQkp
         G5DOvUQWKA8Nj1B7aV+Jbj0zuprcX9MiRME9ddesQPS1yVG+A/uQPuZFWk7fKBeJtQFh
         VMerUjP/W8SuRneNPDrsTEFOKvdWH1b6ZjHVCr3oMUEojogkNB7veny8sq8CB2cP71Tu
         rQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076891; x=1757681691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuuQ7S4ybXTFvfChB1I/Sfk/dWMuL7wWCdzzVYhLuhg=;
        b=SpmO/ljo62+znOeMt3fDp7igpRttCaCQSAxWc6CFF0WNri40izJ1trXlJV7DyEp7il
         chpzyViBgvPpX8+onRCBMtPYTRqzccExz2l2wWZZqKcNi+qW7mF9daDUPNMLsIFFS/Sg
         QId43BybQ1eXwNLgsR3HHtl18W+NlMMDFCtAG6RWT1yf1YKv5yq+Jw/y49/dN64aFclG
         AzOZckdfl1dwS4JWFqPoQv9/Op4eCfLL4pdd1rMRuXZnUGyIWztGHlYCn1zKGq38QM0/
         ghyNM5m1uwM4lUIZA0psXZupYdKmJ1kWp1cajtje5fzEaPTwSvaHctPgzl377b+DtZ+u
         mvRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoFbqA+TprZMNiurhN25Bgk+yHsY8B93jugyd16/Nm/Qr+UM+c2mX+HuImqW9cZj+FQ08MV6yBJPdJkELq4TpW@lists.infradead.org, AJvYcCVKZp1710clzDaDGjqkyKAm2LP6R0g9dNBI4Ru1sTX9RGUor6Fx/edKq7+9OZn29AeG0bHhxQad4mWkkykv+Fc=@lists.infradead.org, AJvYcCWWymMkSb1XFmFHA0GffD+IGPg2u5uHiYAukLkEnnOrdmP0CTxAeI5XqgN0BnwU4lLPbsSjkTAU40+I@lists.infradead.org
X-Gm-Message-State: AOJu0YwXVi3D/a5vGp0O25Y0A9r3qHEAk4Md6oARbwI3ppuo96A93e7o
	lodDtpjUCAOX75Ej98XAiK9asQ6I9i2CM1LEZ214MSHicsgzpdS0KPcf2GNXErKsExM+J+sr
X-Gm-Gg: ASbGncvC9dtTkGqxJDmumigktUnasLc/0YpL4J6xW0gbie4pN0p6EgnRFiA/robMYDE
	95otvID1QpAWda1whTCp08+mo3pOf3GCsOIyGYusiA0Rn4eocwMF0YDSKsv4NLNHJcKdhhv9SlE
	xirkMtlhihBOUCfdhvu7n2E6rfyKO88pzb/++myutSg4alWI/Kq0TxJ2dyhtYQK0YJHthqMBYH5
	oSwKrgoU62u2zCaNcfDnYoLBasiMerfNxOjPQ+Mqq7XbJGCvOm8AStHm7DzmQd0DN/kH3S4wHg/
	DTGLQH0o35Erw41rruduhaoKaN7k4Kw4Hy4coZRJ+SJXz/5oS0Yy9vEmtPjsTSRMsV/Wp5Nd46+
	ZvNCxsPPSVKw=
X-Google-Smtp-Source: AGHT+IEtbVAubtisL0GupY9TFnD4SDR91Dvehih/Ojj5VLnQlx0AokWcZERj3KwO9OcTwoM0fMvPXw==
X-Received: by 2002:a17:903:1b6e:b0:246:648f:80a3 with SMTP id d9443c01a7336-24944b5734amr277215935ad.50.1757076891018;
        Fri, 05 Sep 2025 05:54:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb98f9f6asm4992305a12.8.2025.09.05.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 05:54:50 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: rockchip: Add phys attribute of USB host node for RK3368
Date: Fri,  5 Sep 2025 20:53:17 +0800
Message-ID: <20250905125318.7956-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905125318.7956-1-cn.liweihao@gmail.com>
References: <20250905125318.7956-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_055451_836459_71D8B18E 
X-CRM114-Status: GOOD (  10.72  )
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

RK3368 has a USB host controller and a OTG controller, both of them use
a extra phy, this add missing ohci node and add phys attribute for them.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index b09e431a64..cdcbc0a944 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -503,9 +503,21 @@ gmac: ethernet@ff290000 {
 
 	usb_host0_ehci: usb@ff500000 {
 		compatible = "generic-ehci";
-		reg = <0x0 0xff500000 0x0 0x100>;
+		reg = <0x0 0xff500000 0x0 0x20000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_HOST0>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy>;
+		phys = <&u2phy_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host0_ohci: usb@ff520000 {
+		compatible = "generic-ohci";
+		reg = <0x0 0xff520000 0x0 0x20000>;
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy>;
+		phys = <&u2phy_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -520,6 +532,8 @@ usb_otg: usb@ff580000 {
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
+		phys = <&u2phy_otg>;
+		phy-names = "usb2-phy";
 		status = "disabled";
 	};
 
-- 
2.39.5


