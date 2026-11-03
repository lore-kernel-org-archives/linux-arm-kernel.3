Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3A5606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nbQ2WwGU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJfw3FSF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=; b=nbQ2WwGU1gABpn
	ptljHX3loQXx9t6Cqh7Ex4rnhjoA5M5AIiS4gV/yDBvS169Op+VUx46Sllz38fky0aD5pMLVzrJic
	vJx06MxLo9vWKH2F5M+HHtcuo/k0mTRD9SfgoDWVBS8xrTv82CMOfBKyhdiqGRuv2r7zEhdmFHhCz
	rMNMASkkyag8f5doyOO4LCK00YvJ9EQQm+tsH94ezk0CZFsohP9gE0y0KHSR1df+27GNQdfBWtMYM
	r1r0J6IhsgJ24lrQzEXc6wfYqDuA3495XW4R4QJtYHivKfrP4WBHfPv70jZs0r6tfM+13L24Hpgek
	DYZsMdUJppLqJz9ZBV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEy-00000003jeh-23Ab;
	Tue, 03 Nov 2026 21:40:24 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEs-00000003jXh-0mhg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:19 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-53ec92375d2so31499b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742017; x=1794346817; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=sJfw3FSFM4s6f0a+kyw0XOJwZgE5y0xJTjZ5QJ3W4zP4QLUUet2rV64T9VPxdavf6C
         zZeYxBtBQDz4Uzx1GZTEXvegdLiIvDNX4K+zF2cDWWwKHmEO6Ggd8SyEwnOZWW3Mq7hQ
         eoM5bRWdMet+cCF74mw4jq1PvNdnhHhADoKBNdqzts3lloUK776XeaJ/gPazexYtBiw3
         TzONyIWa/na1YpcMxMV2SNIc3fYz9Z1wmQ5CiWq8QKmiUwxRalos+Wxrp4sMElfl11lC
         cSh1k0Ea7xzIz8cy12t5CIqaGLBGr3skWlNW/qOPzuB55kR2Slf1RTLDEwYY9UHVgSX5
         JJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742017; x=1794346817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRqQDgQhXtc2io8t2nwzRELQbWhBlZAnTMTGCqc8nfs=;
        b=sAXiPGK0RahsZgB6Ddk51SzFq0hWMaBoP/eWTWvABbs6h4BgsRp37ZWhV/+IAIQFll
         pMjQM4rvBVCNduktryKKj2hkcodMckNVuWX82fe6MMxDG1MB3Pg27mlOoXVzvB4pML9u
         aMdb0m+WaF1FYi8FaP29bKtIQ4mU4n9rhRqpAGB2GBvlgtegjzxbUwaDDskTlrZ3bCPA
         EdA5vsoRPyiS7i0F2WErIIIdtsHXPakPXq0NYUuPMH6LW5nznz0UEu2LzduTFTEdWsNL
         OW/ER0AmAiRrzdQc/TXs9LEsRiEF9yz0wi1ne0Bg8ogUx43nMAX9GBwtryjKdyGSDPtK
         rUSA==
X-Forwarded-Encrypted: i=1; AKwUvBw1Py11aURI+xmWOayNjVDibEB4NRC3vONo/t5qxVMeBSgAy1O8mc4y1Tb1/c3Zy6RKkvcRBjGiJfJlaBMDr1xL@lists.infradead.org
X-Gm-Message-State: APuU4Z/qJwzlMUkr4JD28Hvjf/Y9O33q3e7GAoBnVVsixdUsc6cxF7qG
	CATvl8xHn1rvSIFtghzwlMnoScngaVjsbABVSMREVy7E4tXZoPmVhSQH
X-Gm-Gg: AYBFou3pI7FZgMwqQUr8zNMR75KKdHShmrj1Rg92pU2kJkhNrID8vFL/PaQycXoV0v6
	+EXvjE9vLFqdjOAbMvkfhdq/1ONtXLUA3kaCc6mCZzvqw0EwZ0zIQkn7NQMiF7yEFyi+a+O6eJn
	E4+9I2d2UVgbmVZ1s9jfst8JcjKsnIpJMAkrX+vka5zSNnzP75+nrrFdzgOhGBDWu4xWGNsBuN+
	SggWA8wrHDD4hGIjyvQ69EB5kNM3S/OeH8jotGztXof11QwRoUZgDEdtokW7oXVnUfqwn7meWD+
	WVIiR/NgWEHJKy/GLMqQ4KESjkeeGf58lNnpO/h1w1MljGlQWh+/5r614l5ofax78p0BNWWwHKJ
	8lr3mAnkvXF+Q40BLVVjGYn7OwB4NHmIS0Xep+FmuRIcq37FtL6xTcG+2vg1K604h/SrRmiCdZS
	CKtweh2LE5wioHy5wFzquWTVMVvpUFJOMoFt0ccdahy6IdrQB5mGE3rSGUmivmOpo7VJqbeQu3B
	9bb5OYsuO/osB9pcG+QN4268QstMxynaym5pqqZldFe9mkqUoGNrmMgnUDfYxbX6i1TOfErNn/l
	B00HpZUW45tt1VvMEBqvrRsCvR0angeWm9RkssrMsKL1Fy1bryqJTpbvRzdmpQ+kqzhOjgClLh0
	K4UMSXYXqDjHvPSLcKH0BwiCtffjTbSwms7FdMgA49wWtoZL9ibHFJIT3QgAzc+8Z5LujbzUj1z
	HjUuA03svRpIm8DYsn3e4ZssOs5oRXiRtUIqYi0u1tLOSsoM0OT2cp
X-Received: by 2002:a05:6808:66c5:b0:567:605a:b8a6 with SMTP id 5614622812f47-567605ac3f9mr743665b6e.41.1793742017040;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:04 -0700
Subject: [PATCH v7 11/12] arm64: dts: allwinner: a523: describe the UART
 integration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-11-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_134018_249200_C228496C 
X-CRM114-Status: GOOD (  10.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Identify the Allwinner UART integration on all eight CPUX controllers.
The specific compatible selects FIFO-depth discovery through FCC,
allowing the driver to derive the shared DesignWare receive thresholds
from each controller's FIFO capacity.

Retain snps,dw-apb-uart as a fallback. The common SoC description supplies
these UART nodes to the A527 and T527 boards as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..23340b9f58cb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -390,7 +390,7 @@ wdt: watchdog@2050000 {
 		};
 
 		uart0: serial@2500000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500000 0x400>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -403,7 +403,7 @@ uart0: serial@2500000 {
 		};
 
 		uart1: serial@2500400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500400 0x400>;
 			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -416,7 +416,7 @@ uart1: serial@2500400 {
 		};
 
 		uart2: serial@2500800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500800 0x400>;
 			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -429,7 +429,7 @@ uart2: serial@2500800 {
 		};
 
 		uart3: serial@2500c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02500c00 0x400>;
 			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -442,7 +442,7 @@ uart3: serial@2500c00 {
 		};
 
 		uart4: serial@2501000 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -455,7 +455,7 @@ uart4: serial@2501000 {
 		};
 
 		uart5: serial@2501400 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -468,7 +468,7 @@ uart5: serial@2501400 {
 		};
 
 		uart6: serial@2501800 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -481,7 +481,7 @@ uart6: serial@2501800 {
 		};
 
 		uart7: serial@2501c00 {
-			compatible = "snps,dw-apb-uart";
+			compatible = "allwinner,sun55i-a523-uart", "snps,dw-apb-uart";
 			reg = <0x02501c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;

-- 
2.53.0


