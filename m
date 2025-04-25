Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49FFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l94fvJs4daZVvI5xF47uHe2QvDzbrKRGqVtD3TI8CH4=; b=JZs1+R+EUUFKUQtKZ15kxhhysi
	46qSUMRlpunCrxQ0RSmdl61tHOUNLS1EAftAY0UeVrKpyOv1bQVkEmn7DXiAqN93e0oTMeZXHxxsY
	J3qLJhKTfqJ98RJ9zV3B4iO14Pu3yy2SNouIfKRp4Q5X/KdI3RiBkBDacQ8PpOFCSLo/yv9hK0nFd
	P/SDXL2MQhmtQdW2GsrNaCRcAj7NqAmJ9Wz7o3g3gMJsODox0LtgKb8ohMcYwVuDM46THM+15/w+O
	57xvvWjYTw0q08k6NhS37EHOERBySdU2/F4NQIAHS3Fw8ik5u66X2KcP8e71JFkG7nIroE35h36MU
	0L/npbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K2j-0000000HRMP-0kSK;
	Fri, 25 Apr 2025 14:28:41 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6S-0000000HHJf-46Fl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2750781a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587708; x=1746192508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l94fvJs4daZVvI5xF47uHe2QvDzbrKRGqVtD3TI8CH4=;
        b=lskEtMgrPf8qW9cuqYr6p6R2APY89ira5slZ84BjSMbTjmW6J3nIwXAabd4MXfzbGW
         1QOWNd6DUC2wLjHkWyCHTh69h9ZTOstliy9cnuZ797i8DUtLywR9MUZEMUF/YlkCOdcv
         7uIAY2fQ6pWGOPtqDuiYS4xU9+bI7wqOio71RLRHVjlO9g1g4r79lm9RkSgi2SOeARYw
         zxnPIaGiz1ELzixbsSR1dhOhL4btiuw7+JLSV6Osaw1jY7L3wsGLJfMZz+xgWF8rR7hz
         Ej+f1jcDoIAdMhwRHyaMceIgbcVGjyZX0/x1YvZ7fnf1LAGtWWh4jdDUIb0xFNm3STdd
         3BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587708; x=1746192508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l94fvJs4daZVvI5xF47uHe2QvDzbrKRGqVtD3TI8CH4=;
        b=t72AY+dPUxNYPeCvMFgBVhc+greRWRf0YbwoZhA+BlQa6oCskgWq3YlUr/uIVkaDIy
         Cd8VphhqdjZU+2Al7wHjT0wCAIYsjbqjPASNOOYngiazFlXziVGaJeegU8533q0uhUjN
         YIaq2rpmB6i6Chmhy0RqRlqOYWVVcUIusjQ2TeKHXHHZ1ha61PpfKj95LM039cVU/ohR
         Jw8tbYmesbnc4sHrbSvYKKpfsow1rs/+dG0Fhy6pwDS/HRMBWM7Y2M3kbGM2xG0cvfUP
         /bMapVCkpLshR4nGOs3icRV2X+4/lnFu6kJ62EkCLocRGgfdSCHzyuKGz0eJJZA14X9T
         X82g==
X-Forwarded-Encrypted: i=1; AJvYcCVbMp+ALJntULA7tbaDLoB2MhVc5OZ6f5pHqPB6t35FFb/4iyVDH4owbnEqTkun0AJoGtC4Ot4eJYkrKVQLP5pU@lists.infradead.org
X-Gm-Message-State: AOJu0YxKHHzF9Qsy/HeMR7ixw21xz9iP0aQc+KYS4TX8IaIxdZckjQ3s
	wF7v4kMD09QE0cvuW5MSLFLzRVHfkQy3y+A9kcKa2PG2D5cylxZO
X-Gm-Gg: ASbGnctb8PR61AQq68NJz0QPpPSpdzCJU4BjcctIWNAgznr3fjkEAcIZ6rq75QcmuyZ
	Iq/QqAlIlZeeNIVmggEaXnBpxAgJ32j0j/kYM5FnUjYVvaBOXBdxPhfTTSAZikq9EXAAZZx4Llu
	mR3apRVyaMNDUeWZj21GvVrnH65ELCwhqLqIOq8BxjV/eJUJKkcu1WP1ytFu3onVJXBT5cc9mW2
	tl6Zx802Jvt9Y4c87aUmfAM8v/04x8FDXv5SjYD/3pyfoZeD/06euNMkTMtACvHTBziAAxg5nSC
	z25RsFZj4/zxTi30rNnw9Io2yydVx+9+t9R+RqU4ew7IpPSWgycAqQ==
X-Google-Smtp-Source: AGHT+IHZk//aX1Nythqxr2CigBoZw9Zr8jeiTQwIrF2Sb5trevqSTK8qfuMg1eiI7z5y82nmYsHj7w==
X-Received: by 2002:a17:90b:2705:b0:2ee:8ea0:6b9c with SMTP id 98e67ed59e1d1-309f7de019bmr4539523a91.12.1745587707978;
        Fri, 25 Apr 2025 06:28:27 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 05/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 p4note
Date: Fri, 25 Apr 2025 18:56:25 +0530
Message-ID: <20250425132727.5160-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062829_012382_928B4E72 
X-CRM114-Status: GOOD (  14.87  )
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 28a605802733..ad0abe8d9e30 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -432,6 +432,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "ldo1";
-- 
2.49.0


