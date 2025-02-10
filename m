Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F73C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCNlscT97V9uOIoODPoJkucU+X2AI35SBhIpZ9hJ5mY=; b=NBnAOKIOYGp1lFRyO5Bx8zeEfb
	2Jvdi0P+6NxB0f7Vy+RdFP+KeLON14zpwjMoLEEoDE4oMQyJ07KKuZgKio3UAqUZtyCzwIW3OHuHA
	dx4LHZyRxuQ3sk5Ypgg2urHUKtEQPFRURK02Y8kBJDYyKIIKeIs5IpB1QjluaxcdUS+G8r88qASsV
	E7Oe1HS39yFChncWA4qF8cgWPQCn/bGrRpiqsDTiaAu6x0Z3J9cH3meMKqzm91ElupkBYYLOn/N65
	yfAy+Cv0d2YqoYW+MESi+MQeLLKpvkBTbBtXUx4k9f878wboGCWNCQWvRdUfIJ8VqCnrlsbZ0khT5
	ZQ3074fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQCX-0000000GqMI-16M6;
	Mon, 10 Feb 2025 09:35:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ8S-0000000GpKQ-2SZa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:31:25 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30795988ebeso41022691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179883; x=1739784683; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCNlscT97V9uOIoODPoJkucU+X2AI35SBhIpZ9hJ5mY=;
        b=Lvtw9hE1HoOKbMU4oOXAYRYRHLNqvNQpofolqVd1DLUeiObuaw3VxvIcJwv7R7i/DQ
         FMrwZ5aTSRrpRrrkv29KEt7Ueu6yxpIALZ/7EG8WPvrwh7muM5gTnl+qZbuFqZm0kXmn
         6T2ajwCg6P77VXVWGXqIMj+oijJV1CC1+FTPvYJjsqvq2gMV8imxt5ZDDP8gxB1tkaUt
         Nn+FiE+kzzAU82VfgrNqVWfU9R5UvOeFVstlKIzpq0xhxIMU3Q0MHbrqZ9A1SaAREuVj
         fqMjYEWi1FaGglZ832cpSQRyv83w0dKFNQ8lNVBdAulL6XwfXEIHPEz0rxa1Zzz6uN8x
         Sa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179883; x=1739784683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCNlscT97V9uOIoODPoJkucU+X2AI35SBhIpZ9hJ5mY=;
        b=bI7nOGucmudWANq4/jGpL5xo0JHRh11ivWqXAcAGlMPPMGESqQu4CmaLJLIt78h9Lo
         lcbxICR+OHYkfXNu1K3Il9DMErutQIIc1Cc35HsCCtTugthY/3Om9+bB+3yz3mnMwa6j
         RcXMM974Vj+mELrDOgwiDHMJccZB3xJxpdzR0IlfCpgKdcVodRAZO1xMHEZkthBDjFLb
         I1Ann7c6X4GnvDK+vBo2Wh2sB30GQuczpI5p+40tmIGmSVydULQIJj2DrDf4w43bL9Gc
         FKIKLJ4FLH1LOPN0ZHi/R/es79b6Tw+2Ru+FTqXTCAxUxMWQzlaVoP+0H47+DJxF26xe
         DZIQ==
X-Gm-Message-State: AOJu0YyuW0M5tYaznqexbNawH74qArghPpiM0asuxK725wPVjw2Vc1pN
	WwtAe5V4/ejjvDITOXsJekVK0QgEWFPpAvMKPbtXo1gD2a8Okes21c+Xiw66CWc=
X-Gm-Gg: ASbGnctsYZ7lOrtD3c3HMcbQMhSXlVhBNXZ2DS6XZM3UdC1/JiVdXYb8Akn5Ma+qOxp
	4fuJUZbWRtbzSDWxbgopT4RWSfW4e4NyA4K6kHHD1I9VDckNYpUGHgpKQqMZ5SjZs7/HMmy+tU/
	IcQ2cXIu5fZbEL2v+LkIj7G4eapRgqCz7D+jRUM71FnqVMYLvDCLUuf9kFTMQ2RJy0sz3uVNbxo
	d/LsPfxeXWk6J7CkS4tdaxu+wnRwvHrLixGtO4JhuV9xyIJWzOAoQ+AJx1lZIUHAzVaiYakUH9V
	Ff8DDelKIjx/8KRzvy0Nzwohww==
X-Google-Smtp-Source: AGHT+IF0ul+u2dEeOp3LqnjYMyturrxBFsVvJjJz6HlDQToqwwLAAyyKMNFXqRlaK4DudcIvgifQSg==
X-Received: by 2002:a2e:3502:0:b0:308:e54d:6195 with SMTP id 38308e7fff4ca-308e54d63b4mr16025771fa.24.1739179882786;
        Mon, 10 Feb 2025 01:31:22 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:22 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:16 +0100
Subject: [PATCH 2/3] ARM: dts: ixp4xx: Fix up PCI on WG302
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-2-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_013124_631507_7048135A 
X-CRM114-Status: GOOD (  14.13  )
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

Looking at the board file for WG302 v2 was not a good idea
because the GPIO IRQ for slot 2 differs, and v1 uses GPIO
10 instead of GPIO 9. Fix it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
index 19d56e9aec9d89ce0ad109fbc6bb6e26327997f9..af7b6a976d3dd61f3c6846c73b8788437dea20e3 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
@@ -57,7 +57,7 @@ pci@c0000000 {
 			status = "okay";
 
 			/*
-			 * Taken from WG302 v2 PCI boardfile (wg302v2-pci.c)
+			 * Taken from WG302 v1 PCI boardfile (wg302v1-pci.c)
 			 * We have slots (IDSEL) 1 and 2 with one assigned IRQ
 			 * each handling all IRQs.
 			 */
@@ -70,10 +70,10 @@ pci@c0000000 {
 			<0x0800 0 0 3 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 1 is irq 8 */
 			<0x0800 0 0 4 &gpio0 8 IRQ_TYPE_LEVEL_LOW>, /* INT D on slot 1 is irq 8 */
 			/* IDSEL 2 */
-			<0x1000 0 0 1 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 2 is irq 9 */
-			<0x1000 0 0 2 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 2 is irq 9 */
-			<0x1000 0 0 3 &gpio0 9 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 2 is irq 9 */
-			<0x1000 0 0 4 &gpio0 9 IRQ_TYPE_LEVEL_LOW>; /* INT D on slot 2 is irq 9 */
+			<0x1000 0 0 1 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT A on slot 2 is irq 10 */
+			<0x1000 0 0 2 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT B on slot 2 is irq 10 */
+			<0x1000 0 0 3 &gpio0 10 IRQ_TYPE_LEVEL_LOW>, /* INT C on slot 2 is irq 10 */
+			<0x1000 0 0 4 &gpio0 10 IRQ_TYPE_LEVEL_LOW>; /* INT D on slot 2 is irq 10 */
 		};
 
 		ethernet@c8009000 {

-- 
2.48.1


