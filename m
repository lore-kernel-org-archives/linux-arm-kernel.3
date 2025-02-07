Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2309C0219F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=; b=h8paKDH82nSOjQD655X4SYNZlR
	p3Th62krTEk+NHdHA+Ex3CGhLJs/Si6FF/uL4HkF0lJNrGaDS+GdWSTAKN8jskeJR4zhHwebgVnn0
	Pi9fIMUY44Lbk3QLUtkXIZ63Qii+IsqgB6EYquk3YzDoEknfZ8FeTB7329X8g4YXsPQctC2/QWWGX
	3khOj/RGEe0WjYTC4MMUbIXuib4xRmSidojSXDccV6UypgaLZ7iEjQq2ZzP4y9UbbpD6L623Z1GYq
	BYtOFqHI30QhuLcuD4loQ1X6vtyYD4rVCY+cIt54z0uZ7G5vFG4oObPIUnyDgJxFlC3MD++3aIjCw
	bDylZ+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUzL-0000000B4xK-2UhH;
	Fri, 07 Feb 2025 20:30:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgUZ0-0000000B0QF-425Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 20:03:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5dcea56d6e2so4544324a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 12:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958577; x=1739563377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=HEeZ1HKrW6MB+TmEB6PubSis6RJJSYtdYZgi7+Qw9zaAQZS6yEPhf5YIhtrQ4b1jE9
         NC8a3Jdyv0iWIqV5Jae1w0n8vpv9A/btT8kb1dRIqgv1FNtQ2n8szOvdoTpxvD0m7oMl
         iUAFWs7VoBwgPtNlBgizwCGqXREHHHyrH6XfzCRRywbueSUuUF1e+9nBtIgGZvWCuKRh
         HB8+PLYtMA7SXcBQtBPvivF5E8c9tyr3yH0J4qoPOSKxK4Aj7pwmIUV4d089yCeYQC0q
         hVSA6rXGZZkQgwJ9CXw5GkCOaAa++aIvd7e0m6NTcqcsEBnsciDtVjDo+qo340PTrwJF
         gYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958577; x=1739563377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=fT9dIQNVUHosZMl9rnfek81DmOqoZhkwGvRC4wFO+9hnaibw8Pvq7fPEH6vv/CsHtc
         buzqxdyVBW1WeF5O0afifSvH/93bOqf7r5/a6YLBKTCL3jnOvpWOGxIxYtYrdJGoM5ZA
         8UjaEKxM2SUdNqKoBtPOmnR7uJo3GieVo9yF861fjkh/xATOGlvNC2EOxYS8Ml31SegR
         apr6280hScie1ZeT0GgrRWyLmLXeJNPA176p6WObDtV3xQvmTKkyBVv+gIhG9TR0eRAV
         AcMBvIuEEAO1TRDq6kjZ2mZECnEZlEnJm1sZLO1ju44D5/JiVzbWkumioPCEfSQMOcCC
         cE1g==
X-Forwarded-Encrypted: i=1; AJvYcCWto5uXYYbiG+8xu/3fisFzg9DZuNVa1kAUYXrfzRdE1xOiAjR9OzRU+qLMR5LulCwGcJp2JYvxOM6J8JH0+Jy0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05lOgO07mCpuLAdVZeQdXgUNxXA1K626erZfPAO0W1FrbNr1a
	Tn/yzMRKQnfOt08cCRfpp/V/0k1fT6khcNOjPJRMdCk/WP5WRi8a
X-Gm-Gg: ASbGncvLMeHvaMbEez9WVWROwI/vZ1McAAmTenskqlDDm7cAJKjZHiGLXeeOcWpTJJ1
	KZlS1kx115vXJaLf2+kTYBqTWgspLt6af/hT/urYeuTjpGL1dIqiTriqpeVwWTJbZTfjoEQUhHN
	m7RsBYbwUCZyq8eV1QDfErVMgOpwSHGh+Njng02tFaH4Cz0LTIoLSHhosbarlQTggHrOKC6sxza
	nvW5ZQd8z368V8uHiKBQdpPvlf8pUE9Ezv7thZ9dt0IBv6d40OXP5vQYOGuxZ24nDaYmr7LRIQ+
	4BwOPdLZPP3rL6RCDUkei7hJJynyRZG47gebx00wpkpu6+OwIO3+vKpJ
X-Google-Smtp-Source: AGHT+IGArd5o2qj6FwAk4rsMGV7oNGar9jIgapAxx7P2O7Qq52Z6y8B+OG9m+chp8Y9vTLBqHIGQ/g==
X-Received: by 2002:a05:6402:13c5:b0:5dc:88dd:38b3 with SMTP id 4fb4d7f45d1cf-5de4500570bmr6006538a12.12.1738958577134;
        Fri, 07 Feb 2025 12:02:57 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:56 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:45 +0100
Subject: [PATCH 6/7] ARM: dts: bcm2166x-common: Add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-6-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=ME2xPUcnl/FnRX4iZX+HH0rzRwVkalggFVStR7ufRE0Jy5Hs4Kr1KmlbvGiyk9yFUh1XD9qge
 0bkt7oiEe7iDA4YqFr6lYcmFOGTUdshsElxxrS7QdA1CAt0FFP2lWv2
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_120259_002458_F2086983 
X-CRM114-Status: GOOD (  12.37  )
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

Now that the pinctrl driver supports the BCM21664, add a node for
pinctrl in the DTS to allow for controlling pinmux pins.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index 87180b7fd695e65b52c52743e6315cbcca385fba..d4b412ac8b0343bd3773f50c59a20fa00a3923f8 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -46,6 +46,11 @@ gpio: gpio@1003000 {
 			interrupt-controller;
 		};
 
+		pinctrl: pinctrl@1004800 {
+			compatible = "brcm,bcm21664-pinctrl";
+			reg = <0x01004800 0x7f4>;
+		};
+
 		timer@1006000 {
 			compatible = "brcm,kona-timer";
 			reg = <0x01006000 0x1c>;

-- 
2.48.1


