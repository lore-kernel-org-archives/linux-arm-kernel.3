Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD510606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zzeMpSZO;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V/BVk90d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=; b=zzeMpSZOm6NuHP
	uAUyly8i0BDdO+uSq06PEMKIiwSMPwPa3EdPfXq9oat/L62DSWVS3aVx4BCQJhqPrGq376nQk9x43
	osfRdCau48knJMXWouDMlJFnBOF/Izh2ROYJofA6ve38Bi6A9+W680Muv88MOdjM/k4/xxsHgz/Xn
	sRgPZjr/i2c3hz9oEWJLRwKGV5Wf52fVlK+11nznm/kPoymwqgFplfLygDWzVOTdOQ0omqKyR3tGs
	LNK5zQt0Djn30JdUeTaeyEHa1CdWA8jiENbNIeY7xyrOVDMCeNPnUB+v6Q6W18Yjfa9shh88EbFgN
	HZ/0eF61EVlH9g4h6xCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6D-00000000DNr-1nhp;
	Mon, 02 Nov 2026 19:53:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy64-00000000DGD-0pV3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so35661985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649214; x=1794254014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=V/BVk90dylJtZUqlcaQTQYD2wSJsYM70fvQq5xQR2DvSfcG94LJL2hoRlkb+oTCZ4M
         1Xyv3EVqXPC3dR6oFg20CxtnZkS86JeK2hIPxTgr8kau3oQNaVAxOrzw54wgntGgXiBw
         i/LtgDkjSi/rdnp9/vr5n09d5a7RUsgxwmZ90OrFTlCHly8WUq4c0InV5QfD68N8Cqff
         N6jpwZH+VkjUtMCas95ERUzn9uNqbyHFGWk3LPL/8OIscboHWTawX0Atk7uSXhUbQmMa
         P7YCnjZHbhkq9IZsb5AWHLP7is7qhAxbl60tb8OQev7euYb53MvL5LDlKN1QhGIwI6xn
         sb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649214; x=1794254014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9P+XFabd3/lMfZildnkql+5b4VafOMg3FdmCUFYRsA=;
        b=2LKA2HyTYu4Z1ynRc/6h/gvlS4zyu+o39oFwbUKoIPJwyISP0E5tzZ0dHGpFcuDeCl
         eespfzIs8LO1wmOvbqBPQK+zzUmXQdkPl9OmPWZutVCUhnhm1ql49FnHTYyetzQ9nq4m
         FtPhSZgd7soPS6HXsrp5Nbn+sPbAwIo7WjgUxxWfktNp4FqV4RI890sdHQdghtBvNbwB
         Kh018Bz4IwQzl1q7md8lze765DA2b8vkzDIal6vPziEoz1gmD+FLpvxN6GN4nedU91wn
         Cvre3iet8Nff8yz8Aewe5yKtnif00V46QLyttthZO+FYrXwNYm6F0cZ0X/bD99wG6If/
         D1CA==
X-Forwarded-Encrypted: i=1; AKwUvBx5gHVouhqg/5BQUL0Th2Pe5h8JxhA9jbpOjA6k2l/AxcrxpGiSbsc1bkMH8aBFCSubydK7cpxpoaKr15okofAZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJrpgGBiys7/UeXZhxk+PEZwP5sozzGy+a809l93+z7kvjLy5UO
	9uRjDEyJ6UWqb9g0N292V3FauWA2gLBXKz/wpJ6rsaz4YxufyWkLJcuBZrOYwPM/QUI=
X-Gm-Gg: AYBFou2qyElvPQLYKn2qKdPqL0jj/mAonmCt6T0oE7vcRqtLjv/Zawqkoq9zHn9csO/
	51kCc7HzZ8w/z+TdvKl59kDu86EEZQOEUIg1c1IA3+UEwLvSLwsks6UbKzTcPnc8wYTU2UlosQB
	QXupkMTftuLIjF+nePQyECd6cGzhQD1Hhc1FxOaaIfhkWLUEECSOjZrs8C9HiH7z8xGETN/FDvK
	jNPpNYyTT7vRofMec+mfrBw5e0yTUYtaS6iG4odf6ix78xDmbMqTL9+aEnt6UM/cml3v056CWdq
	xbgM3xpv4vOaDEidYlVSVKabwuoQvlHp5Wz315GLwXj8LwtmPNowgVr3keiQw1JDS5HEx1wHW2/
	rlCy7jeucX6n+tpSvu8uktLXoExSLaJ4vnyE0bHAQIiXnJvjDqnn/d6Eq7s/CY1UJZFH4RMPBEI
	Tu0yjAHpxRCiOuudhIx9A9qnFVlNFZoM5nFpD/5IBctvDOoVXJmDI4TUoaCf8tLiDLB/uD1s3cS
	1dpDrLqTLozzY5uyOWpFjGJZrbSjX36d5esonlBckkY8rchuaXYFg1CapZt+en6EzWy1jJIBJB3
	L9aGtIDXUZMdKPinYUVtdK/69YR6H7KFF0zEk/6UjO3gzXcyKrObu5gWM+SYcXhEazZMKq6huTS
	qxyytUypFmei9DfOD0rv22Ic+wbc=
X-Received: by 2002:a05:600c:1f96:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ac185bd363mr252112485e9.35.1793649214314;
        Mon, 02 Nov 2026 11:53:34 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:33 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:50 +0100
Subject: [PATCH v3 4/9] ARM: dts: omap: dm816x: refactor and align MMC node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-4-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1985;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=5OVt9RjfkAFqWjQ3y/ErVKQtmPA4J8c1AJHBN4H3pf4=;
 b=AtG3GnlBQFbMH1PqTI381XfB9i4KjV0cI4wKuxJY5/nlIHUOkkQSmKRvpDLY3ROqT8xei72e3
 IwrjiwzwAOnC35m2raB40VjsNgf1dswgTA6Jx6kpswL9jPVXjmTUIhd
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115337_234763_CE2CEFD9 
X-CRM114-Status: GOOD (  12.57  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Update the MMC node in the TI Sitara DM816x device tree to align with
the structure used in other similar SoCs. The changes include
refactoring the node to better describe the target module and its
sub-nodes. Also removing deprecated MMC `ti,hwmods` property in favour of
ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index fc124f9ecfa1..1e8d225dfb2c 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -423,13 +423,33 @@ &edma 20 0 &edma 21 0
 				    "tx2", "rx2", "tx3", "rx3";
 		};
 
-		mmc1: mmc@48060000 {
-			compatible = "ti,omap4-hsmmc";
-			reg = <0x48060000 0x11000>;
-			ti,hwmods = "mmc1";
-			interrupts = <64>;
-			dmas = <&edma 24 0 &edma 25 0>;
-			dma-names = "tx", "rx";
+		mmc1_target: target-module@48060000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x48060000 0x4>,
+			      <0x48060110 0x4>,
+			      <0x48060114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
+					 SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&alwon_clkctrl DM816_MMC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x48060000 0x11000>;
+
+			mmc1: mmc@0 {
+				compatible = "ti,omap4-hsmmc";
+				reg = <0x0 0x11000>;
+				interrupts = <64>;
+				dmas = <&edma 24 0 &edma 25 0>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		timer1_target: target-module@4802e000 {

-- 
2.56.0


