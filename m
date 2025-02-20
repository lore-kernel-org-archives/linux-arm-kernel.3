Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411B9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=; b=fLHZsQt/qNYUiXYpvMp4S1h3S7
	NJuLWrJUAmMNjtDaJUcuMb4DNH1vtPoECw8vnnlfC8NQDHLf+CqrNLQtihRvTdH28HBMsBYDPGW+9
	VAVOegiohL+xIFIgOGQyXxFLQIdrHISpdTijt40kY0eZ2B7x1QCUq2qlZyx38KuHmVuUKwC49vnw/
	GN9jhwT2wOFlIU17WJ36qbntnqQbf+3Brz2gEynUhnjCu5jx2Z3mPauGNNPapZIyG88zU++nJdOKm
	L0gFsj+PSnpEP53FBaYStqTwszf/3SQINU2r+hCKh7xvjpAgmKxCUYZ5G7siQLqVI/Y4mbSHVkBaM
	XyrKfpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8z3-00000001jHf-1khv;
	Thu, 20 Feb 2025 16:01:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8qE-00000001g6J-0rhm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2212a930001so29108975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066717; x=1740671517; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=i7Y0VVIS8XRYMAZPWhf3g0K8rdSMUm2+rzLkb6L5OCNgcNAYtn2icyriZIWUWBJc/K
         pxnuknnZiy8ZHXYsYeoSgQy4yoz67wdYwcn6Rsftje/OOTEwXi28k6Im9y6KcA3Qo9F5
         E7Bobj9a3B8sKZ/VAhtClkG+cdh9x3iSi44DMJbkScfgQWSoPbNsncrGkInVIyzgT+nA
         qbtSEK72Fo15hW058+NNgFHi74LfrTZEY6AOrxHeHFrq/wsUcEP3UYbA98xsxaz5TLJv
         eg0x2So4CM4npoC4bXrbug0ekSQUkVRa2kCsk8mboK8dS5kAM1xvc7QB3iF10nRnY2mU
         XbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066717; x=1740671517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=szgXfTd7Urm9W9B8kSaJBfQOlx07Sz8CBc4CD9ejprSCdp5HGPDv9ILC2q82u/9So4
         +GRHmLFz9JOmcFuV/iOu3hGaciGluDUJyQeCldYK7heevssW9sbGQmH3KjV8VmGCGxe1
         rNCiFuW8AE/BXz598IChJFERynb3xjlMWIoBs2sFxa51Tmml87OLnm5BEmGSlN5eNMES
         e9jta+wm2CfIK9O+tcYHCz1+JXkBqFGifoHRgtsNcHK8nO0u36s3wLQ+rMhxGVpmNN4v
         Z4j1zX9L+JCQUsRhT1vD+uCgXdJtObiT+yItP4EFXjOLO8qq81udeMrJRb5C/xfQqvnC
         jWjw==
X-Forwarded-Encrypted: i=1; AJvYcCWYApUWg2/E4Oc9cuNeUSvnwW8Y0rjCqVyLaMaiDZP0sAm/KCZ/haYtHtSEfCbxvjztprB6SpTOhhv1Wh3Me4eD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYQuT8CK7HrpAwsPNHfcsp8xYV9cr3MhUgX5QOrd/aDKdfapu+
	hAmAksBjERn5LKr5SRpRuYY2XnS3iK0TUQYZ8U7wzYRvQS+WuX3h
X-Gm-Gg: ASbGncucmuAuMrd6BNKpEJEw5Q1oiwVKRlC/Z038NrLn0uYUseeHYfIupfxLwukkJLQ
	gnBtQvWkURRpNpAw3VOFjgSQS9fJ3aL6BOWSxnzlVzHxfTEqSUFqOHtEY3BdOuo6jwSaMy/dE6A
	RtdZfZdn3SQ04LeaTBWsqQttQ4vkLyHaOLBwu5MF0mLbKlrdtc3oq7Tvm9kgecGiuMnMWm9o3xa
	K319xg2iy4JXPpEHAkYrTkeikhMN9absh5zPnOHg+uqJ027x2q04huef8EncOchiZeB0Jaj4N7H
	a+A9ykCZTGgc/rlFSQ==
X-Google-Smtp-Source: AGHT+IFZ4waWbLP6Cecv/2VqnWVBd26xIfd6Cc00GYuO0UcuzNJuDEqe9P6MhtWqvvfa4Xee+Dfqyg==
X-Received: by 2002:a17:902:ec85:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-221040c0706mr332046705ad.45.1740066717220;
        Thu, 20 Feb 2025 07:51:57 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:56 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:07 +0800
Subject: [PATCH 5/5] arm64: dts: apple: t8015: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-5-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MPQ8JTGw4F5YzGUBWmHCB+DlZx7fcvvsKk
 sDTlG6+i/OJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JDl4D/400FHyrq6Eb5o2/1uOVNJxJzFt+ILrPpy3mk45/VPqv5iGiCQWyWjOzJEACVEawuTnMe4
 jX0nylQ2XiadUBbVmK2NwG9ZVV6xh7TeQ9wqcY4aaDG/nEgCMraDMuq8VwyjlHIhxCUBEN2uDMQ
 PhYrBy5HzYkGjwzZYyopVvIg99vh7RJTZNYpnIQxZGZbnnefmdhT/o5bM+6osTPjzkL4oviftFn
 fulEaLRpzYEboa2SKzGoD5+oPJG1q+65Cf5gZT9m02bgyRpZh7K+6B6ZVUAkbSNgl+gJ6XccqDJ
 FgPNEkgEVvEByBrpLhwFD+DtIBuOjypVNQbRd669Z40i06IZp8BdQ9a2uqNoo4LeKObMsLRq5ev
 6/O/GnIWT7zHP7kJASGdy8H0X86I0WeMwimQQyK/cpUT9WLmdwgShldHEcvoonhlo8g5Y86hTg1
 CyNf67bs4tpZdfOB4NPjabnuxKPzalO4sKXjQ3ivKKlq2+R7EnsADFDAHe3ZHagFrkoKUYFh/eO
 u06SkuOcTm6+OhyMy/eU/dEtJKbEZVzeekXz4cV4I5pXNPhSm1LwwOF1FGpfbkg/qdtK+RMiXwX
 jXdeMxOefrBZDG4wRbpsB4mjcsHsU0AHdyROEc0DkmmX7uqlwtLnZgfcdsw+mt8zab5cDDOuQG4
 IYk3b4ZngcQhmaQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075158_248435_34159436 
X-CRM114-Status: GOOD (  10.88  )
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

Add DWI backlight controller nodes for Apple A11 SoC, and enable it for:

- iPhone 8
- iPhone 8 Plus

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-8.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-8.dtsi b/arch/arm64/boot/dts/apple/t8015-8.dtsi
index b6505b5185bdd728a7416efaa3dd53d1c6a5fab9..0300ee1a2ffb7d2bd0558f6cb6f86514f4b433a4 100644
--- a/arch/arm64/boot/dts/apple/t8015-8.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -11,3 +11,7 @@
 / {
 	chassis-type = "handset";
 };
+
+&dwi_bl {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..4d54afcecd50b50ed1fd386ccfc46c373e190e6b 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -262,6 +262,13 @@ pmgr: power-management@232000000 {
 			reg = <0x2 0x32000000 0 0x8c000>;
 		};
 
+		dwi_bl: backlight@232200080 {
+			compatible = "apple,t8015-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x32200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@233100000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x33100000 0x0 0x1000>;

-- 
2.48.1


