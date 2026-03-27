Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9432F10F284C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=; b=qhrA8c0g8RAcyPw6CLVR7tk5LO
	10b+H9i+gErf5oL1yeNOIdVeIhx4E2OCadUmB0/Eg06/bq4LLPMjNpQQ/6J1dGsQa7c36HlxgQjGe
	mOYEBbtpWpLPOHHwTb/rsvWM2Xlp3/OWALPljSmAxlHfTDOznp2sOjq002D9R1rGE8ov1KhfCA9QS
	wBx9/6fi4EGuMGNr9gv4FCMj+wnNmNBjJTSz6e/OcZnsxuxAkXdpM6ghmOVcuQC5OeOKj182seqAl
	rFSXHlqTEghv/29cUkafgc2xA9m0oNYs4R3/Rs7bkdu+kqQEimUwdABmFLcVvKFHyRcseuntyvkum
	bGsvI/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6A7R-00000007mZB-3lCu;
	Fri, 27 Mar 2026 16:33:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6A7O-00000007mYe-3T8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:33:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so22690585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774629184; x=1775233984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=T3Hkt4yQ1qDmbhWhNwQdPceXjXN5D4k/JONt1rRORuL8Ca/rbHRcsVKH/XkUAHJfZ5
         u8O2BdtK0bLjZjsZNBu8QQNTLb9/3a0IThX2JaD3uVdwQ3f2/v93LxPiMnMZAZ16PAig
         Z75SzX+JCqTHBwcTA31oVDXo08LycYtOdNbbeEmeikz14qqYRAHuYF0OjWBjiwBACD7I
         F/JxItyTWJgzKp2z65/HfTVRr7T1ZlcZIdWJjFWFa5/bqg+IqEReqPX4+iO5AA+EJHij
         lwtQMnymF0RWFabiaiquFrczWFFE5NiCWyX121/OCenwwBNSfZYcOYpAUhk0+DRnzIAK
         fG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629184; x=1775233984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=bc4mCQkHBX+1rOJGlUZIgY2LxmUgHiiaLkzOXAdOPWqFr8nlq3wUkPA4frXcDA+dlT
         mDD6VhfYhaScHcRQZK5ABwJQeCO5vVL8XyJdvkch+Yb1WU09SPgpnjF4wmOAf3VScVaG
         zeA1KXy4OxJ2cJnlXJuf1hj43urUJUeuof+vti1PLT//OzG8icSs7E9XyYoN28zNh2zV
         Ek5C3SHIzyWKICxiaLhK0iq65by7aPL+wdNKsAetzrD4KEBAqC57VujH1v4ZEIFPBG8U
         2HC7j4+tyZxw4oDxAnlfW2bbZ5EYIBcVL20tdi8cA199Tu8YQqrWuK4SHE72uaEYXKK6
         Tlrg==
X-Forwarded-Encrypted: i=1; AJvYcCUDfqEk2ld2jdmdkNLZu0n0ZebDlxndoIBzSF+cePj87D1+F3yHLCdZJ5lsN6Utkx1hRLyJgxJUsfulwIi/i3ag@lists.infradead.org
X-Gm-Message-State: AOJu0YwkPRdGvR6PKSG3jNEdDcFHdPpe4Nfl2cf3g9TMKhABeKD9KIJu
	YRDqhPDEmmsqGnwyBvJ39ynhSm3FtvgEz5PkLzpWJ/QJn23rd3pz+2/p
X-Gm-Gg: ATEYQzwSMH16VD/kt0H/6KBVIj6ILVWWdmG6nc/i7ZEvtl7jvqbD8a/HBHlYhxHQP9O
	NU7dGs66ugmUVeVIZiUzEcjePKn6K1iHdmuh8oLhX92JPjTHgcPQj4SsOCkUf3xUjsg7bx6UTHg
	UqXD3bHW15t9OIqqI9uaz52NnelQKZFD+BOTzjlQryLxOJicFiIDmE7Em/6lPSb/Wy+BTfDBeG1
	y+bAX7c2XHbpXiqts3f4ysQzlQVTGTRcqpzACpL+J99lj9Qq0gMUri2Pw/4c/2P7iDDLqac+o7t
	HRevjP51AqUts//jsmTa5fQ7ubgw4OAr4cqbvocGv+iyOtC93JgKGKZakPSAypkj/K8fNo+skmm
	zcvXzgBjs18cF2WvYcQWPJbArMA74M3CE+wZQMreHe1/Yz9FoYPJMVlCVqON3CTx9719IoMj8yJ
	S3zg2MFhBg4bQH4wLql4SY39dKIS90f6x9XqcSqjDcZIyL9elPB5N2uev7MPv77wcnQMVzULjg3
	AYKP08gvQfa9VOa/QI+I229LgtbZmj2rOFB
X-Received: by 2002:a05:600c:8b41:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48727edf577mr52913915e9.27.1774629184028;
        Fri, 27 Mar 2026 09:33:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm193697875e9.11.2026.03.27.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:33:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select supply for PCA6408
Date: Fri, 27 Mar 2026 17:32:43 +0100
Message-ID: <20260327163243.17334-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_093306_928291_C3C845C4 
X-CRM114-Status: GOOD (  10.81  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

RGB_SEL controls the routing of some carrier board lines on the Sonata
board. The two PCA6408 GPIO expanders depend on that path being enabled,
so describe the selector as a fixed regulator and use it as their
vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3b5816884f24 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-sel {
+		compatible = "regulator-fixed";
+		regulator-name = "rgb-select";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3


