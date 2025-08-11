Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A3BC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njXuK3euMe/kZMogavF3/6ffW6FWMiYEAwe6fdu8xrI=; b=lDghlhpbBEk0v7QZnGelsQ5d19
	Yb+8py6nG5jPfYr4ZVVkOVu73JkWojgx5EBQ1hiuRCBU1+VGDAzlke7w7prczsq/rGoBXGaY9mq50
	xSKz84KbvcF+XuNgCLm4gA5hnkjIqaMosxprCOVgcF+gXd5gJ5hwjBc978vfjt1Bd4lNRedLnM2oI
	x/BX7DhgzlNIO6Xgp3V8pl4tq/KA7Q+wO22aiZ3fkZmzFG2NJPrh/6Mxom99EE49jtKqQu0iDXR0Z
	vi7oJKfmW6vAsZmjrme8IPbYhY0TZgDyMQaoD6MAJ2AWzjn4N1jTNBQZw6b6yc+NHHRYpgi3j4skE
	nC/IPcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTcx-0000000832v-1dgj;
	Mon, 11 Aug 2025 14:35:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSyf-00000007tgZ-03Tl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:54:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2403ceef461so36738515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920456; x=1755525256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njXuK3euMe/kZMogavF3/6ffW6FWMiYEAwe6fdu8xrI=;
        b=bD1Atxmnc1eA6/R9EnbtdEcQG9mSM5U9F7N2PlFWYg775MYjeoZmxKPMUsu6GckDPG
         hR+EW5m6es2wlSaAWvJqLu562gXofqDMG31qMuZmfcSHBsLTqDgWQSQxOvBX+82jrf8B
         UMOGMMU6NbNZ62VGNgyGZurucLvsE1Shm35WgjLmDanLYHKADNTNAtb2fmVBb0Y81yYC
         RuzWc3kad4x/19L+Wkqwv9t6JiQrfLotN95due5V5lRwBD/DNBDC2e7wQh7Ne9phUeOe
         L0o8aWSrLSL9/zQ1Gs0TS1y8HN+MvQ1nWjNbtNJPNH6Oy6v6XbjHHg9NvbnWTgc4V+Y/
         /XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920456; x=1755525256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njXuK3euMe/kZMogavF3/6ffW6FWMiYEAwe6fdu8xrI=;
        b=FjlF2saAumzPZ7BkLrw2zyLgh1GaFMVP4obysNSiRBCZdGgZfTqzI1sVrd14NSZ9tV
         09ln1/MJEfVFY3Rw0yWSPD6dyX3Jpaq57AYBUQbuviz/550tl3lVOTBkNAy0jW7hvuZQ
         6VvavfSAS8MLe80idDswlGUcfyHi9CNTQhNnbWzpofh1H2rFPvl4irzk/93jnDXaACER
         I0M10PgPJkLDeTBA2LFMfr+pLEY1COOB6YWoJHb1WafPfpun+tqF6EaneHavb2eJ6K5i
         LhEDnMJr5lUBqLujQeu1/kSzwOigDTE/oc9VwICCfMa4PJ+7HymRZsJezfHMVbhU+KXH
         fGOg==
X-Forwarded-Encrypted: i=1; AJvYcCVrDILgPDhwzY481FtG0mMF/gwYsNf2x1nz/0gwU4HtBzjicDMNMGtf3LukmDHmS/YluryhdDe/GJ8U5nBVGGnx@lists.infradead.org
X-Gm-Message-State: AOJu0YxxamuYwekFf/H5Ezxz+9ihhYf0mZdcCFI0KAYW7e3FeniMd4wt
	Gx8EIuko5iNhFXF6gTuy0tbRWD4ovxF6xCQL6Apw/aQgvZJDFkVm4pJ/
X-Gm-Gg: ASbGncsiMyyz8bklrx+t0u0JTvjGXxXk9R0/LUX1lE8JJfUqZrjHODJvkKJkzHZsGWd
	kD0/ALQVK2K0kk+CSDE1jvpJiEarPmCBVmY9ChKtEpElBglHihXzAELBkXAege+yIVEnaM7xc4+
	Jbl4c+EGLbW72rX9FynQaDh3omd75vqS3NYUNTbBEY26BMIzXqMrqAhc3kBy7i32mrTq09+Dn6R
	kaZ0CsC+7qL9oYEuU13B08Bomhv/cmNexKz2RJItaQKYZMIsuq6svYnPfZuOjmaDLWA3/cLMqaj
	fXe5bVhkz9S6By32rX0hd3qfy8AzjV+PmRgEKxQTE7BcNZDEkJ6QgQpAEd52DeUVYKrSmG8MCQd
	RVWuylwdVdhp4YW3ujflhCwehMd2VLjEkCj6I7Js0j0Ou2rj85HepPH9HUA==
X-Google-Smtp-Source: AGHT+IGrScjZxGAQoVeES5vrMAAEiXvuJkpocuymu0hQtDgdymNeonp6DcM+OcVkEjVZPGfSG1hQvQ==
X-Received: by 2002:a17:902:d481:b0:223:619e:71da with SMTP id d9443c01a7336-242c225767emr203264025ad.49.1754920456171;
        Mon, 11 Aug 2025 06:54:16 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:56 +0800
Subject: [PATCH v2 2/3] arm64: dts: apple: t8012: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-2-a291acf0d469@gmail.com>
References: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
In-Reply-To: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=RyAP4l/zPWmcwBSNE2d6uKakntoPAmdHkSji5mOR/zw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX87iL2CjHFNJCuJQ9I4roFaqK+UKkKCXZJx
 eKPQUxmTHaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1/AAKCRABygi3psUI
 JP1TD/9HPeYKU524PqwiZmBwkDCq4p3VGO0Y7feNyOfszAdgTCzHKMFxXVxNIbjTE2PyoF5ugYd
 Nss2mwVjRBWFrg98bGdvqfnGKoPzsHoujiO7GqB7kfaXEy5wWrvc5dvZTEnfTWnA4UX3waSf3bG
 JG3+/Pnj86EBtI3d3EVScr00gzR2GfHcnQ+ehDSJGAN/vIitchqqXFA2yzve3RrcVFT8+iGRJNV
 tFSRdwXoTHO/92gWj/aqc1DSRJIh45dp8NG1NgqARmagCTv/L5Jt0d3kuhE9xLRi6bo58k2ovPQ
 iUWCm1ip7nLi1qMIQ3yGbBOeLxowWukg4I0JMf42tft7Ag0mjcDj36eHhCG+RsTVHFoCats4bsA
 eGaVPIugyMROrTHnY+ZIcN/LhEmF6hZabljg/2mbGOaAEnJqadlpfdgcYXWZyf0eTuS8iQo3I8f
 PaYmpt8XhCFtxklZb3Gsv9Pcmu5RxCnuJrVwNGvrmWryUVNoTfciFPPHVXqoxONZR3R9ZPFp2WP
 /sfAOHjRL8atEQLJ3eExfTopY55aU/GKORZqDRSMs5b/eVPw9AEXOUc1M7D+claCAT0XW3Xd2/f
 FaZxUUMiXmaEFe3mqMR1HO4Xuoqwd789Da8hqwgG+d1R5oknCUERY1dQK6WnnqtK1DTSn2fZuWy
 VULoEGS7qpip35g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065417_074831_5CC9DA51 
X-CRM114-Status: GOOD (  11.36  )
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

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..60e73a0401a80abd03f82d24845dfc12d8770ebf 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.50.1


