Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D301CCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=; b=ANKS+b8OHW/1Io/IPH3GkKlWGZ
	R8tnA7338V/yphtcX0+6CJ2zxXhgsNOgX8oUPQj48X1qw55/o/M1oYjEKsqfl4jkaPrh8n3vhpTh1
	ny7n+4jAM7J8mX04BxxpB9tIrHVz9XRj4AnR5/ff7DuB3i+XN80VMAv0aLEpvVII79Vr2tSjTM2B3
	5zSfRRQq8Ay9ppr7+tp13zdXOvT8ucAK+o2bz0MHXm9MACJtCzLfZUT0B1HGQZdBJWvPD/24CvXQP
	hBAKipct7KVypyFE4yyn8tOKOBB9Dcti0xNXOkqxUyUuPhrvW26mnMSeEvHPxRIDit6PDi7+F0Rg0
	JOXUsNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOX-0000000Fy4b-2hBh;
	Wed, 27 Aug 2025 15:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFx-0000000FFdq-3Zb0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Aug 2025 11:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=; b=bud6insOenab5W+s+bXulQisSm
	YSO+vAcImd/HaozR9NI4wJYh8rNAmWK8vaOQZUAP9OmmaCVTUdWneLbPnKHNGW5UDTSDp2WlVbBkz
	cB9oxiWb7d55WqWLBcfF3GK4QeiHyQOleBEpQ29tONrGUT/AvaF+Ph1dIeGZLSQelT5xgf/rFeQnX
	/Xwl64u12BldID5MqJWZSHGssZ8fid7/n82qlRPDK9flq3RnNhwaIryUMQqxuEm0ObyWSSvESgxO3
	4Npg2Ei1i2Hh21HbUPeyckzuY1Csp5b37voxfoMim8IljMSDvH/VAttrVFCJFAuB44TWtWvqV8TNh
	3wNh75ag==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEFu-00000002QK5-3I95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7720f23123dso166999b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293833; x=1756898633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=erPPubz2sPH8La2lFX/pJhq9SW16RHY8nP7dpY6zRRR2o2oHhlFIiIbopLakRu0dhb
         wf5O9RcH6mZ/pdLqdvOIIlZbn+G4NOfps+vEjjiQbAseGmNLv8zPWY7kfOS+cztMN2pk
         UFFLl2Mxx6dfdC9WeRLk/X/7n3+g81AOSkMQJZpt7M6ACBgAX/mAoDIiyrLp9W/q4jxx
         l6+N0EJNy4FZZAf6C/NyB2cMQ1f5afBcFAv17KrFy2JueeBHjOfHXobC0tDReYgZ7YRS
         buW3A2v3GydCxeQTSx1QcuK+/Y8QClrj0O/dIP4USkRTjNmjanMHVN5UX6DwXjUPsXb0
         lS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293833; x=1756898633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=dAmJmh4rTiHSe8utQnyBdDaiqFDUWUhwAcooKGhX/75AI5jNZo0HQTlKmdKZpKE3YC
         ksLn0+fAzUPGDsfBEvrdFmNRPPuLNL98d+GguSmilmi5jVnY6cmBciEz91iSx4nclXdi
         dnzGYsLlTZaHY07NBOWo4WTxFmqX5aYzSsaKNi1EWztW5O85ETdZ2A4JAmvyzCQ4rifM
         j/hWwQjskI4qlJEOp0sgzPEB9a9C9v1hVEAZlUfkRxYT7GcO441vuGAdLtrezw7xWb0A
         r23zBCoSfnqKc4eWMSdVW3S4XTxSH4+VLe8Kdhhh7LGk9ncIxyhp3n2KZ9jS7GCongXM
         QoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCR0DYxRBjK60zufAOnzzRUNmiUTl1rfdYFb0LTexqHsa/suY2Nica504JfXXgj99ZTG6klrhqJM1POCp93Ouy@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZR7LuZkWpyDNrffwdaF/XyUXpKormz+ZjhAgAWGRWSWjwvZB
	5zuiRmQMsghfvPEwVWvPUfBRTOBeVKkgXsZxBy4Ds6oK5spyUCFCkUhd
X-Gm-Gg: ASbGncsTNx6c+37lQRVaBbOBc7lAf8PBzGA4IwBoVGvSYKQfsrT5cBlJMBKvyRk86Cu
	XOvN+cVQjgrtc/fwag2A1ZWAQQqJg1qApPBZJ1IXDZyZZydrU24XtVbOy9atWhLlYSOmo3f7FZu
	TCUXujDJm1Bp29U4D1h5RZ6Xyk4B7pWM+nxrwwc9nX8OhRS0OBvlBz8DpgI889Hl+VfrJGpX29M
	lFez4law9IEAHqycMRypTSZBSAU1t08aLw9WcJBeV9bGTDpErtz7B4W/xEaRN6BUTuhk2RTCUIl
	Rjc/d/zYpN6klk2eVnxKnc0eeo/A8v6UWjjRbZPjHMQ9vNw3Zig5JdeFK13yMRo929ijcVYh7Ko
	m1bnEwcKdo5gMrIy6aLEpYm3Y9SDsd/CY9r/QRNp4zpW8ppUEDqmI+WNxn/7cRarzL0qJlIWr1M
	BHMj6eNtWXjMHdv5o2
X-Google-Smtp-Source: AGHT+IHfA23MVka1pim5iO9MIi/hUTPNfKxTfEhzgcBOMzsCRxhk5FUuT41RoiPAGs19Y4m9Q2CLXw==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-24340e06848mr28004504637.43.1756293832695;
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:43 +1000
Subject: [PATCH v2 09/11] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-9-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
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
 bh=EiTtOkgByvBW2d6W0dQC39cvCK54i0Vicx+v7DF1xC0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUfqK9yNp7KPavVUfxa7HWRk22b5T/YBDZPkz4gs
 WH+q0WdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzEM4Lhf2nCvY7aB58Uv4v6
 T3+7ce3SvVZX7+sWrFhSG/9s4Z76PbYMfzjfembO15MyPnt89Y6Q3f37jqjL8hRx+joxb9V9lPh
 sMzcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_122355_011234_C3E7EB9B 
X-CRM114-Status: UNSURE (   9.70  )
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
2.51.0


