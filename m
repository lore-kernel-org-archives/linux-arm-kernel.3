Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA7ACAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=; b=l5Nv0lTPuVUCSyS0k+b6tMe+At
	We0q6t8VjDChU/ABsfhtN84wpcsGax04szM+G6r7E3fv9BGMckx/aXv2x1o/2qFa5O/K6l+GU3+sF
	eA/Y+c89Tw5N0mdqKKXe0UQSMHxNIXr1xvnsLc2bBDlTNPqJjrDQdZHLn28j8jlBpHcyLdt6R07UI
	gVyK+qANjhFS/CT951+LXVWDGcFmpMBLwWJ3ynEnmrbWWx6jwHDiJu33lzLhu236r///amnh2jx5E
	vodwL0IFcCYx7To2GpRBj8JZo0yI2wzL0Dg641MNcJYtQ505hMs5NxXHFbUiih20lioADzeD/zd71
	nFnB1sAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvac2-0000000GqiE-0TZJ;
	Mon, 08 Sep 2025 12:04:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYgy-0000000GEC0-3laS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:01:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3553588b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325704; x=1757930504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=KKkfISMTAprHEHomuw0rbyO84BF+zoav0gDGiNKqk3Q/2u04BWWDnc6uUCjQK7GEo5
         bQdkx50Bt/6Vr7qjcaWi/ZZl/EN00DczcVvp5nFE9D8smSqp7y/UhsHMBXiRxrYA7Lsl
         e3QCwtZCXIYMM6S0GnzSJsw/o0jAU0W+yD/MHp42k4cfJXGi5pCnhuSxHwztDQ81UffT
         t/5HhZyq111SR44UbYSwFOkGKZ2f0KZIzWm1FFB6/fwbByQGNfA6ZNIoIRapy8nVKnT6
         JPvzDL468Uh+cP0oKgzioD+BTOElqSVztjroOG9yzr7REq5Qw/dE56YZwOZm458P2YDU
         TXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325704; x=1757930504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=mL9OIHD/Yyt5Ry7BN6vFmd9vDe26k4vqybc0oEEKgJkVJGPGL63dFmaalFUIBrG7W+
         C5DeXZMX4hNsuZx3xuNhz9ovPm+wijd83G+5Vc/JO2J5elavpwRBf4G0xuerrLK1QVm9
         qgL4hQdY12CG14BIu+HGgRQxFj8pmAGgc5+O/3+AjokcVj22ZGxMDfwLeFz5cKqbsgev
         NqGeo+qIXn2HblIAmQ8KdwKYuk9edXRFUkUoYi2ddrIb6gTGiGWR1VFrQlBXyNQ6nRDp
         aKCNUF7Xh6sbA339a5ywUWTi1nZjuXyWxldUaGGYZ90dosD2nu9cRxmtsVHi8jwRSGXV
         HinA==
X-Forwarded-Encrypted: i=1; AJvYcCWd9WBAr7mX7MCF4wNtTYBvgW6FQlqZuVjPHpzAAfJRgMM6g6cPsqNqL7FKwpz6TT68cH71jJ4MlWky28cSQhSL@lists.infradead.org
X-Gm-Message-State: AOJu0YwykIEQNa9s5jeZLbkPuAfBjZnLQuRZSIXfh3FFO9tFak0kgLdx
	el4AsPKpyqZ5nvbceak6+Y32aeDXkMGSm08YBsZxgs9eSeXp7IsJZtDm7oQtLZQ+sx4=
X-Gm-Gg: ASbGncuNKwU3TCFeUs1Qq/4J1ylmdbTa41OCtsr5nl69pT+r0+j+trBaso0rO7Wctly
	lYRNTfGeC63l5n49FoNUm6dH56JagAjCs4JM1IzVrdquhXIWukuZSpeTvJyWsC028ZKQCb05hPc
	c/S7J2GmFdjNsh5BqNnPwomaSYW3CY0J2EV17fxBfehJNPbnyybUGqGm7fMrgdK/Q4iZy4/ICve
	E8hyiNFqWA1A5RrGk60mz5sF7sj8oJ15F+sKbtpu0U/Cb4LNpk6wvNtwG5m8qhGcTgW1uW9FS7n
	84q8sXJsNwx+egHVscPYrDH22lZOgMrf+tVdj1cGZ9Jt7aT2cClC4ZO7kcUAQzcWi6/eV+HSSyX
	DeBQOANq+yqLjri7jfBj8VxZfXEx7le5N6MM3yw==
X-Google-Smtp-Source: AGHT+IGWrFFeN5OuYsc2+jqffuPG2Hr5NStgaizfvWwDUNYrjOwOl9gETEIxQibCu9QxuhZoPFAr1w==
X-Received: by 2002:a17:902:ccd2:b0:249:f73:bb9a with SMTP id d9443c01a7336-251759a7cebmr75603215ad.51.1757325704077;
        Mon, 08 Sep 2025 03:01:44 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:43 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:37 +0800
Subject: [PATCH RESEND v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-13-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEOIKfaiGjiWT5qhlwzLyEPVCQY/VJwPgay
 fLx6J5fMyWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JCK7D/47hGQ7EEbYb3RiVEfPUWL5oGTUJJuyrEfYATok2diZbfaO8vsmGKTDnEmqtKb8gqU+2n7
 Lp6zjhh9oEjKyRrzDCkkkklAINjLnHxx7H26yAlasJddrqlaH7kCy8plaLF2XJ6M6QSaN8QTqOn
 lzyI1mnllthTYxE/9HN9qXHReNQDyfU2DBTuI2W8eGaOZ55tqbCkrqUJ9eDRzcDs/teI6Mog8tF
 uFUki4yo1nji2ZfM5tYEPEWsq/cwKfp2HLbHO9HGORcl++fa0ulK1l2lFsCHGXMhFpsItUoATlz
 /yel0bcv+HY7DXJ6S8fG1IHJPp+x6HSki6RiwuyHZDON21iabzcb1AuMF2jeYGPASvBBDSxyFW4
 J2KgywRdiPunrkLovWNtePU5yquVzgqW1TaTA+B/mtDJYmbgGfucHP5QF6DsJJVXOgMS+ZqbEPr
 zaF01qsBjk/QutseSkV90pKuIUOGYFJ0zFwPF1tXd30QXJ/+4ZJhq46HfG4/+1POdsdX1VAMhz5
 aiOFVzqmdR3Q2StZuFBqPGJN7fVpDeEZ3UFlyBzKkXEOS1edsss5HO+qklSxis7yDADLnr5A6Bf
 YQ93e8rBpV7P/nz4rlR9VEV04XXOdzT20JF9LIYVYiMdOlZbu/iTrBqGWOP9TwzY0MCU8j12Sz5
 dOTPL8I5jJybKiQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030144_941356_E6AE3CC4 
X-CRM114-Status: GOOD (  10.29  )
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

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..1a3a90f7b9ded42e371ef0b41057fd3081579615 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -151,6 +151,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.51.0


