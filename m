Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73523C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=; b=Rw7Kl67wPBMx3brSnXjXYhUnes
	omDPeYvR/mXzD114TQ9r1MWhjeMlCkJfW9mtHDrgxN3Yq/r53sHXEmtdZo8ZJuJted/da6SNNJi+K
	NsjDcCEsLU812a+A/G0n94YU0CtW0MKcl54JxbpLO9WbwG9FtOgkGvOtbr4Riv2tCyRHMKtO1tFaU
	PdmFJrE37jMjQcpUOGQbjC/kOR08hltsOOpy4hKc0PdKXl4QP0e3GdHgCLIdZQPTntPPZ2WNavE9N
	GpZq+5CHzlggAdaWlIba902QeX06OrpajqHUXVuJ2iS+3NcEkxIyBFTSuILx9wFsUp6UqZ3JUcjCl
	WPlmPowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cUX-00000008I99-46Cc;
	Tue, 29 Apr 2025 04:22:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9bti-00000008DGP-1nCm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:43 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-af28bc68846so5385761a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898282; x=1746503082; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=ZJxxqKWpa+stggFnYIhDlY1njNJAF9yzrVspGQJQ+Vt71i041N9yurBVLVHaTFQWoZ
         UM/10GJTLJUmYa0tDoZss98XoNLPI//dehHX8DOTdi/MHxF1QpQxBdgkcNgHehGHmK3j
         7yZkrPQjCANBxdVAacd/EkqVIciJUDAgKx6OFupGgsYWuLG1Jjy94B3QfdrfWtY38baC
         BVyoqrtvW8AGDjWkGm873erN6sZ4TnAMNHCow9cxBrdgLwp2ehqEDOKDRlVuU/d0QhG+
         NFnIAT/PIgifrA0u63l5oxVqntbB0bwNTjzj8RVefm9iL6fmDKuTk0Cn7Y/+BElHKUuE
         bstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898282; x=1746503082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=GANY8aMp/U3aP82Rkx6m1IYsBeS4oyT7BF30zfgCLcpgM5COqJ8ZNougECVmaeA+Lj
         IpWMeFyALYh2LdrKweh08O2n+VPocWKQBEKEC2IuhbX82iHKhPYxIB0Qt9kHnKYsynQR
         0xn0TVrEk73rfF0d2UhycpVSulZYvICaBtd3U5paK8PXPvehPQjrXXu7Bi0AyluusoqB
         e/b1qvT+VZLiVhrhzpVku/bC7mSJr2uPgGUWCTXKqii8uo7tOpT2PxVTb+k77MizZ/Q0
         ZxSul+SFg8At6QkKDjiRqTT+u4DzbO5DkIv3Jcwpd1DHmjvcoTvTc0F3KUfBgRszo2jJ
         Rj/w==
X-Forwarded-Encrypted: i=1; AJvYcCU7fjxEAtDv6+JmtzRkoOmwlu2t8PY1OZmJ7Tp64KfoodVVF32BsaRxu5+Cxs1a3fJCncnzz4QC/wHiRHbNYegE@lists.infradead.org
X-Gm-Message-State: AOJu0YwxhVrV7WltjU+0FerDSjO6iNJmQhR/OphFc7X0oELszpBb/FXc
	/fa3nLFR3qh7Gy7EEz1v4Js51Uold5BUYXHz5hSJK0O0x4oo6AwQOBajww==
X-Gm-Gg: ASbGncvKDYrUjmsXjzuWo1bK+rVOM8D9xsVFE9m8ulG5SQZKcnO7nBd+0+0fLUkFxBN
	oE0xtRbJf/YeelJGmLgXVCi8bdKCYZWnf5GldrwwnpVT0z7vFBLr0rvt/Z6gju+l4XlhnMDaiOY
	tNOq6EL0IZnc1/H9meYH5NdllwbUfCUhu67o1DSMqfVgpNvwoSXhRzo4wrsEaeJ01vly+0xNe/r
	37iwHzeF+XSK4/zf9iDBqQE34vPLTWtKbamJz0KEUdWsXhgQQajuj89G9BEPOrq0sk657WME1Km
	uH6xA7zrmlhWgCo7RAbA2kxqYehItIonXjSHG2wcLXllgwIy6EcXjBt9pw==
X-Google-Smtp-Source: AGHT+IFzFXVneivf9OPokQY3zw9bSNPj8zkSDTlCOwbCoaI+2d7wrwaio94T7tzORQTF6aRrfbAhmg==
X-Received: by 2002:a17:90b:4984:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-30a21546c8amr3148992a91.2.1745898281922;
        Mon, 28 Apr 2025 20:44:41 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:43 +0800
Subject: [PATCH RESEND v6 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-19-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmhAaAeRuhpFbi6gLnsvgpq48CyERFohMo0
 o05klQB3lKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JJ2oD/9vTAubABP6miBhIXITGpYPldj+/FlKBXzefi6FCtClttM1Vh58xbYEO36GkrWeGDOZ7jZ
 VhKAap3FjIz6Umg6gO3TTPtaEgE8lxoACUUkB7d8EjXlm4BGIhELKMdlVu9hNqNREMpA0X5HoY4
 5IijZygjLtt1g6wP8oa08TSi7CApM9FILAkaYRuKNzXh/1BfWsslseDmpJ7VINmMzmmZEUtS6sC
 fVZiehj8FMwcwjFLNdf6/NlPaOmes9aIl5quoIC2XH30LBCY4L0Nt95xXyDMldkLtkCI51Zdpgs
 9fyzSeVjf0YH42rkH0G5tdytxLMUuyNigaoJLaVD/nQWswN7QJGhZBWcpOt6XC9xglliCFjvZAS
 mF3lU+nMuhA/u3qscGRrck8aTS46io12eWrAmhUEHp3hQC3jn/9S1Nu1Ww4ivON7v/EhxLxSaie
 12QNz5nlzAYQQcCOz4blxc2AuNxVJjYi0W1JvIHfNuOwPR5Jhy1bEcF+kbBLvqp7q7B7Ux3cS85
 gaCa62HWVailnmqVgkzLbav/DevA8Swc6kQ1k2gq2vqhsiorBqsOTWIyl93SHM2Ub/usGbdQCn9
 8e5HIvILx1jjsNBP2LRBxpgORNuFYqgu7hrHnh/qA0/muSE/IHnIHY+io2RhQBnLuQc4V31Hzsn
 cKZ6gFO450NZrxg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204442_469195_329C650F 
X-CRM114-Status: UNSURE (   9.51  )
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

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.49.0


