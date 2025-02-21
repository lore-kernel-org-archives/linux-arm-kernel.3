Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9783FC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=; b=0mkFkYvV1oyQIQkexNokCQekhH
	cpGF02GZWfnRYPj0xwUc9Wa9RENokTKe2EjV52O6gZ0IuKW4mpPWL7Rqdw6cxSBfwTnMm15Fl9IJF
	y3QKD5ml5RTJVQ3sNbZ7+bO7WVKct18Lf58JCT/FbePJsMLI1Oj3a8oebW6/zuuYsO/tIET/OJZuk
	hLzsILC/rsnJLkUOZ+Tbp61WWsapba52dFIjSeQltPc43jcS/awhPoY8+U7tr6Oi4RodVKXHG5nnJ
	JMFZbpW1AeLI3bl4j4Mt09mQujDsAkxVC3aLTj+26tR52vnBWIBqPvkXv7P5HqFfNbr6XN986QEqy
	UGvKIbng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZqM-00000006pXC-0xxr;
	Fri, 21 Feb 2025 20:41:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZhd-00000006ns0-0kXc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:32:54 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso4729754a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169972; x=1740774772; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=C92htwrlS+gg1GyvkJzl98Lthr8OBNjL05oP1IZ9BUBfyldMk4kBfFcZ2Tam7NhvRe
         52pqbCfHoWSfEy5bzITSG5tWG+KRg2zpDf3pTNVt9wJKv+M0Shg3rVlFV7YCI3PvfAHK
         C1NqlPIXG3jSZeNs+aRntaeUjv2nHBU1QqGEfgHNdztQmc7WdF02sryy2aNIwl/EM+iY
         XG1IExQMI8ApifFw5IFbCE2GRwgcG1+UvnyDSxxQEVmQ8bX4K8TYXExqSosICOu2ZVp0
         n177Jgm4S1C+Ft8YBQ2F7qBefBnwDz9+StUvkBxXGVHxosR8IJmr4yEeN86fDXJYdZC+
         H6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169972; x=1740774772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YQfu5eAZOpEQuO+Sfc4ihsBhzM3CKhym7/o/Ff/aLE=;
        b=elB5Qb7oK10cxGU7zqZf8GiRzbomysDBx6WAiEFH+hTGjcgRf2YhzI2A9Ow93lRKxH
         nOceYJVcZuBnJAXAoK3VL6KPImtdfcPumSkBQZZN+h+zkudQCXnsxJptUk0duYM6jooK
         L/BIJi/iT4rvQJM6LoP71FoSp706+y/llHRx8Bx+54pNWoxDUZS1rCaxYC4J0C4P+iu/
         /NfbZjSNgfmLQseEq4uzn6iqjX9fNpE72/LIDTMMZw447pHANHjZOBNJTzrV1tfEanDO
         mdJlKGdE6+tj07blHShrkqaGTHRQkeAnw3on0RnGlOm2eA/hz4Mm90ZwOXQ+Itm34CEx
         6J9g==
X-Forwarded-Encrypted: i=1; AJvYcCX16T9KKp0AgZHZ/atS6xDCYNiCpeHpX/kZmCPoCaJ+GPgya6Ap2Qdy3PQY6rDxUqP7NvrcOU9iTb72vrfh04zF@lists.infradead.org
X-Gm-Message-State: AOJu0YzVRARiZeeGXcU6KSbsyYr9Rs9pSE+Ez9ufvQrqALIwM4Pq74yc
	rNjKUOlXlPDIfNq5DU1Qlb3zl4/QCWEg70XXatp4ddIQEwkQA6+wgqiAqw==
X-Gm-Gg: ASbGncuAPs1gVnUibT99BbCp9Bzd7x8NRq5rQISlF2XhvtqUPtFNVUp2gKSONn9TKBK
	Lg3Etg4Oe9KGmGbGuUNUF4OpnlK9JsySN7lWxdn9MFD2oQtWiOPJqH5WWuG5OK1YZ8p8aURBF/y
	NpAp5pe+UDkCX3Yz8ofU/JN/FjLvtWfqRW+kmPTdUj2aUQ6R+8SnxFMSHT1ep8R0Ch7r43GuQfE
	+uoO3W9zkcPfVYMANHD8t4K4zqVaLEy1YpI8nxcZJeuqIA9i+hdvfKugQjP30PQy+E3ukDpxsUx
	9Jtnv462C70DIJ00ayAvq06K2zR3IBN1xNWcV1yGqm3Gyt7i/cWUD/POnCDI3w3JGdU+Wmv3
X-Google-Smtp-Source: AGHT+IFX16OnZk9d1DL8WxnUdqDk352LK10QFk5bhYj/vuHbbpoHUx8vxoyOPPZmEZpTd3FXudXcXw==
X-Received: by 2002:a05:6402:388e:b0:5de:de30:dd0d with SMTP id 4fb4d7f45d1cf-5e0b7248363mr3572711a12.32.1740169971704;
        Fri, 21 Feb 2025 12:32:51 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:41 +0100
Subject: [PATCH v2 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-5-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=896;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xRQ8Om8ehQPvJHYxu39ZbgjQg1cKM3esiDGEfRR8xBY=;
 b=imTpwTI+Jp+A/uOxco0Ul0XB7DjOg3uyuqGuJeRn+bIitq+0cRSB7FHVyh6HSkhgxCIe5UP1C
 dCspq25gqPyBmoECI0KxT/cToXGsSGsHmG69DnJQy0vRcYNrYHSRGJs
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123253_225203_BD310FED 
X-CRM114-Status: GOOD (  12.26  )
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


