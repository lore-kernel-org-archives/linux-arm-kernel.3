Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DDCC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3iZk4OWcdg0+cXmzhzjzSGUo3JXPkTbXucm5mccprQ=; b=GJ8I1zaBKkSQPMkLd24rQ+T79C
	48+nHQSf1qwP7VSdnSxJb2sAVaQ7JguUUJZmdJI5AUQHbCvAfz2WwTJTK4HGyYkiSWkaPkoxhb1/j
	W9rNrofQl/9KxOvJcaavV3nIXZ2JoYTkSsNlGiEKeeWQRwwpF9PpBl6mEchhsAqk2vjXcrAAqkLju
	T/dGxIgjQk3qmv+RGSGB+TcrcaGGLsUptCv3MuDCdE7FxxCjienmlTRLRgiQSAAWTVzAVA/Z+PezK
	Kb3mxQ/Y3KcYWKwo0JJB/t0P3e0t33DNo7nnsz+Tynx14ky2DRwLSvU/H8Y3uYZtd3sFLaSlWbhAQ
	cTh66Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iUG-0000000EOGa-3ZOU;
	Wed, 02 Sep 2026 10:46:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iUE-0000000EOFr-3hKB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:46:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso6067155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345993; x=1788950793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3iZk4OWcdg0+cXmzhzjzSGUo3JXPkTbXucm5mccprQ=;
        b=sjzTc3T6tHvZp3qH0i/0jgaUet1H5RDp9CmAWfAX6n36J8FhNlKFgguzUUDcwnCFYG
         DL0k12FtGWxXmomYZOYY+yuVm7HdVt2Y/mfAjqstwjuaLsxUSdsrl/JoGHu8E8QcW3dK
         hcUBbb3Yk9IXAt+yzrjzLCd4mmigZnzdxUtMuQCJQ3EK20niTPJzhi4DCiuVQ/EovJNJ
         J7G25yj9Jw4TpX0kl/qi86PdWe4p20iXDbhJMzPZQTGwmmD7HFgMZ4gEQyF955A3Lwkg
         dzcrHJiagTY+klp3XgZI1usUgWwbu4sUO/dKoPW3vbrrZaDWM9pJzM1oTrO46tjV2987
         cfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345993; x=1788950793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3iZk4OWcdg0+cXmzhzjzSGUo3JXPkTbXucm5mccprQ=;
        b=S/mkiKknXHS+BkpN02Uu2p277+H2obKa0GvpeQhqkglYiwpXrTEy4ZLHJKvfNPZEWI
         u2mNfuNclpCS6T4NJMc21cFXcyZqDPxwEYrV7pUMPkViJwDms+iOH8YvpLA35CuSEoVr
         rdMHrNq80w1p69FHHq1O2NE0d2ctk8y+OU+kkwoL6AxyQY0HFzFT6a3tarJry558pSCc
         Dnf6Rna2XC09XWxFCjGpg+8ayQpMORvABOzKotJjUsVUoTpfkT1BdF7v4+sTT/+4UaDX
         KwYY3Zfo9hv4Viffq5EXtNKCdCfMcqmMr7m8Ccpmm/y4OUfylBUUYe+aHvGcL6dkex53
         LiNw==
X-Forwarded-Encrypted: i=1; AHgh+RrP8tfP4tqug+buVVSPe0jQz2y0eXAB85TaidDUpWJxd9FuEGCQ2KLfTrFMYCpkpN9oMdfQ82/tRQ2oJI3jvrWt@lists.infradead.org
X-Gm-Message-State: AFuF++n9KgypSq1FAc16vTQ8D6ZcPfhcM/fTE1zTGFw4bKyFDq/HWGsK
	U7fcbueApdgT+OniFc5slVchGGb/OE3wTqLVl3Vj5cIhLtfOnXHFGziSdm9clZBDb88=
X-Gm-Gg: AR+sD11l7s1CTlsf/bExahHYB9Il4opfNZozpM2S7PsayCKZNFZ1y2ohfjHNyRFFkFc
	AVnEiyzBB+nRh37dcuDF3O3DN4g5/BYkZM0qLNEU8FR3tqo9LOYJrO93oGngjGfkGW2cb0j64gd
	981zvcP3lV8nmSpk0WmSjldHPFetDoh8LTa0HM+i6hNJ13WsevPAkuiyX7ugqovqHTZnLT8MXkd
	Pwl8C2Gs/VZ8aITFKKo6UvtSizRXry64Oe27o/bjjf+14schU0xazg+/8Sctw4D+Dp03MI8Gatv
	B6O7FfTjwIXtwtF9DuBhXXheiAkpILsXHhFKgZWZ0NrW/Oqtd5bU4XAae9wBCKZ38A8FCult5/z
	d1MSksyVDJCwBIsmAXRjRcdL7vHj6+RsCRh0vueug2LYDL9YReM43bMWAaiz7dAHCZfRdpFcnnz
	XZKSOFMvrvca10tgSgQz46+Df3VPWFqlLRcAH0KmP8IVWNxbcK6LCsmxFz65zuSlLGkySQOEEGT
	SzGIuXyUwGEJUoxq4OjXJ4=
X-Received: by 2002:a05:600c:8b88:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49ce581a0a0mr75334855e9.7.1788345992988;
        Wed, 02 Sep 2026 03:46:32 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:32 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 1/2] arm: dts: sunplus: add peripheral device nodes to sp7021.dtsi
Date: Wed,  2 Sep 2026 12:45:44 +0200
Message-ID: <20260902104545.67794-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_034634_962808_03DE16FF 
X-CRM114-Status: GOOD (  11.44  )
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

Add device tree nodes for SP7021 peripherals whose drivers are already
upstream:

- PWM controller
- Watchdog/STC timer
- eMMC controller (mmc0)
- Ethernet switch (L2SW)

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..9bb349a5542a 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -291,6 +291,54 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			resets = <&rstc RST_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&emmc_pins>;
+			bus-width = <8>;
+			max-frequency = <52000000>;
+			non-removable;
+			disable-wp;
+			cap-mmc-highspeed;
+			mmc-ddr-3_3v;
+			no-sdio;
+			no-sd;
+			status = "disabled";
+		};
+
+		l2sw: ethernet@108000 {
+			compatible = "sunplus,sp7021-emac";
+			reg = <0x108000 0x400>;
+			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_L2SW>, <&clkc PLL_E_25>,
+				 <&clkc PLL_E_2P5>, <&clkc PLL_E_112P5>;
+			clock-names = "l2sw", "plle_25", "plle_2p5", "plle_112p5";
+			resets = <&rstc RST_L2SW>;
+			status = "disabled";
+		};
+
 	};
 
 	leds {
-- 
2.53.0


