Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3393CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=; b=nl6FRV32ajRRvOjT6wPBAjpoOK
	mWCiitZBXjz0yJ/6+QlOo2z69n1qx6lfMdDu/px5+WZkeJufNsQz5DLCavzYPlY01AZDPOPKMENI5
	GSpEgscjoqVAu37czKw/v/AXEkeoKVabLYA83+uFy9N94jC5QjqksEBptNj0YA6/BrMNJmXPn92bD
	9H7LOC4EBoE62zoTr1kB8dOS5k91F7wGJJOdRlfyvDyjsl+Dt39VY8Rgn0m0PiuCHdQTQzdn7mnBA
	NDV1BxPvQTXdAwurvlfiEIdJYSwOD3yEEW+00YOGKfPva974x+1XzcgY7orlDZH8ZkNZvRuXJvG5P
	0TNxyYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNNq-0000000AlLv-1jZs;
	Tue, 19 Aug 2025 14:32:18 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKpe-0000000AKs9-3Hhp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:51 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2e613e90so3746415b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604130; x=1756208930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=bjdhrMUZDXR47yXgE0GQEfG3Li0ZmGK4KTMrt66MWm6LXBm6MTHRRffGLSDfhE1LCt
         +FyvAiZdZADH06gh+UNOOI2wqCj6qtpZ5KgCuOQ5Dd2hZdc5lK/Y27vaVIXk6VqXcgip
         A1VVpumbSnK6idkNAb7McFiGptu8Qjzs2mkh4RIEFkwUTm8bTSOX/HwhXq1PP2dFa/AJ
         A1b2yO/7ZPDvH3plD7vSdPuRB7cG429BvV//loc9V1usSuD0XBHQLpy7xO2IujPjd4eU
         xc5A6uoO2nWbWvxC0G88AkyFC9+YMJ75bFUi8Sg6cCLQrlovwlHRdut9CJgovW3hYqxR
         PXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604130; x=1756208930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbXPkuhA9BfPbnhdmw51sj156sf1M0M3soMqtM7sghU=;
        b=tPNv2ieoZNv0GlRhfZz9aNCC80eYMNXc2tR5vDDJNXqzH6yAeK09CH+8rivJumYcCL
         p022/qV4gpIVXJmYc64S2f7y9gSI3BI6YD4KCVC+vevXVGt9qZzlp0oXFDWHNkUC2Y0e
         wNB8CJ3srRmhxsJumpbW7CaoGYwydRkdDvEbhebLMNhLs7Ojxm73feeSHafLJygaYEP8
         SOBSyZxqPdWdmzZbqqsYH/0f6BfVBZe4caFo70BZeldfwhhQK7bK44xCQVhHEQLhEGwP
         VRnOxiF+TwrdBISThj//k0XM+RXtNIkYqHOLv7iLifWq4vf+/w0/an69HfvlOcMhVEPK
         /GRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqUlQh7qAHds2umens8Cw4ntAZRVS1oxRhKLINZQqNsPcBXL24Y2UVAQBxbdaL6V5vLonotBM4kzkPzBgLyxp@lists.infradead.org
X-Gm-Message-State: AOJu0YwBYuWxNRlfG3JwyzPVp5KxV8VZgWd3KIRWg80P5IEWRdF29Rmh
	7XUX8AQG6J41hnsw/a4oRL+bgPoHci77drgDQEciBaie/5vMIO0agoiZ
X-Gm-Gg: ASbGncuDczfF9ozW/h4X9DkAXxKS0FdRHByKwPrBr60uYbv/ETKZ0poctMvnhKXVAs0
	cSc2WyTF90BMB0Dk4a+lm05jgrjjCyxiq4XX4seBGqEvxyWs4jYJPPNIy+ZZMTgKHy7I1T49cCn
	dd64QzUV+PoGFsWmAJ+fwdGrVtmvdHIYA5Hpd1yFuM5VUD91HUyK4mjm8iKEtNMlgaBhcwZkRAy
	+3ClnFLqOMNuBTum2LrVQd0La2rgiGO5UNpwlrJG+L4zxresRg1L+d9D3QgnljJwAoJus2prLK5
	HLm5fuAx/NJjr2E43yR3VclP1vU0nfTKAq82YdaAh6BoHKSsQfe2wLSxICkM8a8F9YiuT+MY5+5
	S729jvXk22JfJFFifbuPwzsZHxSAxjZ9bgxSZlzivRYPVjtJkFM0R2bpedsnRm7wFAx65L1+QEm
	wKNGB9uW5Rtsjiv8TpjZ3L4m4m+A==
X-Google-Smtp-Source: AGHT+IFQNdCrZjHseP8SjURS8RzkWDQljSWopIJBsCZNBWk9P/4UAE6BKrcOCRHnIvQBOQaytEz7Kg==
X-Received: by 2002:a05:6a21:6da5:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-2430d36f5f3mr3185360637.13.1755604129897;
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:58 +1000
Subject: [PATCH 6/8] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-6-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t1iXcsQQKpcvwP43mtFXoSktvnFhTteQzSXrmNnJ3bo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvL3rGR+/Crup/Hxy3uNklbMV1z7xmOFF5duxUpzH
 +7d7BotHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk0TyG/5FfJxbnH5z95bbm
 PS2F8nP/G+oOyu1+0rrsr7mOe1eavh7DX4Hw7YGiK+Ju3fir9Wqa7Y3O5HSBG4c6RQt/hz5d7/p
 anxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044850_826525_4AB8C320 
X-CRM114-Status: GOOD (  10.04  )
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

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.50.1


