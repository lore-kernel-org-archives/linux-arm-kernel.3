Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09502CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIgb7J1F10HYxfdjdkrY8eTpLG0sHZrvPdCfUXjCXl0=; b=MTNsLcIl6P/PFKUIxLys1DQo5M
	Ko1aCoR3RWCHaeaGNs4gMZIhIXEffMP23bkmZCbn7qaqxBPgsrqRE+3VktNNe+/bW22yqHn3l5PF3
	fBjv1bP9U3S0LaIHObP8wFevO/DFXlSKUQLBzT8v/IMOiCQ7ArCaV7YhS+Y0kjhshkWaAnH8YISfI
	xNzu1KMQnhLT4GJJ318VLdfE8uiiEbzdBkZUHjfGfccW2IpCcGOZwu4w7EDabLgzFVjDxM+wJStV2
	KfbJOxJHpvdJcFQZGME5isXrec7U+9c73+DzbNOKWpbP1T2xeaRczo9k+hdjlvqkKIYMNdvb+NIph
	05dSk+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Uj-00000008D3M-3Uwu;
	Tue, 09 Sep 2025 15:42:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLJ-00000006Hv0-1Dm7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so38099175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412772; x=1758017572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIgb7J1F10HYxfdjdkrY8eTpLG0sHZrvPdCfUXjCXl0=;
        b=RnYZDl/S/nXxL5BL93aFu6GOQ2ccM1sXOcbVK5p66MoNY/fyS6DXOcMFnT9nJst+DW
         OzgvXIZuhhOtFycNv3bg1AHijg/cvZGAFfyQK8msqhUfSssa7PENMD92SvZGqqNCYqru
         VjTnKdSLKtyRuCXGhsd7Q39Mk6xuNAx5tOP6tkhePF0RJzwd+wQFqg3dDIq8Y6zFcmjm
         P8ELv33FQSXlT7NoqR8UuT8SzuHhVOQTDSMBN/QYJTytAMMGhUWYTPfCsRz3NPb6kzbv
         PesLajDag8SXWshU6pZO+gmICVluXRnqhksSQzzpYCuiZFbcHnppXDNGwUvptHYlEJwm
         qN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412772; x=1758017572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIgb7J1F10HYxfdjdkrY8eTpLG0sHZrvPdCfUXjCXl0=;
        b=Rp6YbYmu340+a8aFJU12azSRQ7OIuTgM8S/+DVyol1R1/4MjykxTxFam441OAW0ndl
         C29dKkNfY7yriVVV3chgwICPU5Cj+HzSJ7a6KUf07NG3X5/HLBKns0ZTwPWQ4zvB6D87
         PH7RpH49jK+NMVFQkIoWbiyXgRenCaJUHVC2KOwo7E3q63H2Lv1/NUCLjDX/Tk5TGbsR
         CsB+G3jst7NnAS5IdkWtw+PgVG26XEOXtgDzRCznLJC8Rtyi23PPUuIVm94/BU46IcX/
         A5YQOrH69Uh9edc0d1PJrzeIL6/IoKMJ+KkDgyJ0Nuy1UND2nxWI0Hh1bmduxUThD3cs
         csmw==
X-Forwarded-Encrypted: i=1; AJvYcCVxuLLlRw9GJpT1/CTEvZgibkMrcEi2QUcP9fk3hfjDGP82rIzM4NGDh0ESjdOKg9y547vcV4LS/Az/RuXJfJD0@lists.infradead.org
X-Gm-Message-State: AOJu0YyksXobsKzIowS6mvCJr+aMKfzIxJq+1FEuflBz9HiwON2Jxm6m
	zsbAY3VM1F7KSvFi97Do0sY7OqDSe/imqp8+Rews0LPKstPJib7rrWwx
X-Gm-Gg: ASbGncuo7NuLdvWzY6At9M1MHEEfrPHlQtFCZUNZWpxZapk86dKZM598fzLL0zxns8M
	4UGcqiyP9QPOp7xgDeEuNRo8YPJbh2BZ/8wmGMpMwVwJMQnvYlKiMfmIfTJ6Np4Vx7lYE26xjyL
	aRA3n0ClvdSGudX5UHjyeoe11rkOyACeqkoj0gvNUmYVisYzE+NCRUcEUXEkBB4rCMXd3A5SCec
	xXrG33R3qRSdOBmxDsVWhujPGKC/02fRH9YwM63fo2lfqst7vCc8ZNVBVPfOcj4joGBuXsZutJy
	lJtWOM0UBiO3NuPvHWd9oDyqMqZ+Gs/uxpM47H21zPrepIItfug+RrRzJYi8rp9iX19cd0MMu6M
	jOWXhH4WdT7lZxo/r1yjKiIB1BY1pLC1+wyf5enk5fg0b6vfhudqk1I4H84lV8aWDQHLxG5hCgD
	UEVvhndbb4K3Q8uBUL1SKyqWrGww==
X-Google-Smtp-Source: AGHT+IFVsl0KBBNudami4eVXse3EwUG6m0w7N65Hz7CHd/3ZnVXJY+5tMMekyix7eYIjIw4+THAIGw==
X-Received: by 2002:a05:600c:1991:b0:45b:5f3d:aa3d with SMTP id 5b1f17b1804b1-45dddeee57cmr87267925e9.21.1757412771663;
        Tue, 09 Sep 2025 03:12:51 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de16b8b58sm130632525e9.4.2025.09.09.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:27 +0200
Subject: [PATCH v6 20/20] arm64: dts: st: support ddrperfm on
 stm32mp257f-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-20-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031253_397662_51FE2177 
X-CRM114-Status: GOOD (  11.52  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Configure DDRPERFM node on stm32mp257f-ev1 board.
Disable the node as DDRPERFM will produce an error message if it's clock
(shared with the DDRCTRL on STM32MP25x) is secured by common bootloaders.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index c4223f06396a..c685a646a21b 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -130,6 +130,11 @@ csi_source: endpoint {
 	};
 };
 
+&ddrperfm {
+	memory-channel = <&ddr_channel>;
+	status = "disabled";
+};
+
 &dcmipp {
 	status = "okay";
 	port {

-- 
2.43.0


