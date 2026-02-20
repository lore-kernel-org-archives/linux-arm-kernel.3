Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD1AC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=; b=vRmCIGw+uOPxwbtmaNFzZSfMtl
	VhjRyuzqSqDJW5llbIETtB2ZO2WboJkKBFfp/NIh4MhkAsf7SiozWy0hqDngvNzYLBZc1yMirlO9H
	EMbaXFL7BBked8zK0pbk6oJUhR523o4RCacMRShIEJIEW5VRDrevtktQHqc1uRRTl16kPQFvZ/yBq
	xyxyUoOm88gAJHn2FmbDq+eXPCAtmW5gJL4jco72R6agtfh3mwdb1dmGYFRaZc/8ZVZbVKQuNKpqR
	zxYJse9z+8K2LrMfrFW9oT6UQgYD94uNdlZfvaD8HmSSh47rAtq46gZYwSIwqM8R8Ht1cHt637WKs
	AFVs7AxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG25-0000000D2dt-44Vo;
	Fri, 20 Feb 2026 02:14:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtG22-0000000D2cC-0lJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 02:14:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso1049715b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 18:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771553653; x=1772158453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=;
        b=lPbpJ/zXNE/PqHUlZD5jwVrziXODlIEMfAcwmWP9WNtVkyRVNJ92nErxfhjj7QuxOn
         4cvc3CvtrVSx4AB81UZK1OkCQITkDY9DwhV1VDM3zF6Ys+IU0LGvhYkGCMBfA+iFo4Gj
         Ldn9ryBDoU6v13S0/WcZAnoCqOgiPMki4oNwsHtK+d/AqpJT7c+HfnaTvUcx6EgBjUUw
         12DK1Anjf0cs4IO3jZyX77rPUMcHFi6T4ldvs40w9fECXJ3zDvE5MVG/EB3TlNSSBI10
         yrW9gRbCiqeQ2CAwzMv/KbShe4VXAwozAJBqJ9E3LKA2SfUakODb8uM0AHvLKSzxv+g2
         uk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771553653; x=1772158453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVIVsn7FhVGEmmpQd3To+p0nhAO6o8stxUyzkQjrFx0=;
        b=pjfxiYg+fwIYP9wUaZgIR7S4JFXmv3sz4u8QgUWP5NaDX/Y7AiEfs1ceipx+tPK1JA
         /WgP9+2qmbLqjfJZyTVBUs+pn1UiYRJCbI5/YAICCSgwwpbPLVbu+6ECBmhX0bOIhf2v
         l+kJBHcjFV8YH3/Dv9Z/saM9VlvLR7e/SvGJzmJg0vBWSiNQ/OBikcZrl8NU3qptAEuj
         29VrFdoZ1gQAWW5VUw+Ebg/kQT4OXR8R3wMFDPY+I6IgOsm5J/STeeqVgJYvrFSq7Mox
         lpDuDAO0ShsvojSPIH9tr9hBRC9iQr+2L9EvZ1f/812VP+XJsRjbR1oskYkaM4eEi8vV
         541A==
X-Forwarded-Encrypted: i=1; AJvYcCUgNKxa4Rrfi7RSVhmkrAF2kAyE9KQ5Wm3o0xn1eBAOSJ5aokF3obhK3bi+w/zE3dMlNt8DugV1fgjQm8V/z428@lists.infradead.org
X-Gm-Message-State: AOJu0YyIH0UD1fAh2L5tdYGUn732Z1/tm7d1q+TyQG3aLZtDvJhGGLLm
	8PTmtRjopBO/8xKl2SXsUgh4x+x3ZT/auvtoiQe3aj6y7vnX5snJ/AeX
X-Gm-Gg: AZuq6aK7OV6+Nk1CSGq+qr/tU5d+YPlEk+yP0hkS22FblAg4ohofj0vPyVNqXvJOZf3
	oMRXQXSso/zTk3tc7+8AiooH5bjmwO/8HvkK6/H/6/UNgBP8eBORg7mqk1YkGG7nQI4d6SBubcB
	JBg31zPcbJsHQfjnoJMfKfqJpgfV2zAcOGpwMk4K/OqqqjTMvkjZEbqLNLAeCnPya8rj/7vblZx
	unCO7A64WqqZ3St1eujfLwZpp4jrXwLHJOwSc0AcUkJwhh54QYh/VFA5S1FOkhr9/vRFWaWJNl7
	acpMJK5RMzm2y9RnwbbWxrGnBsjzlw2cKrqQ+xzbzibBiv6xH4ZDpJrc3v1jwCJ/QPemH9l7P8I
	HorKQ06KComhd+VLdOPPGMX0fwDviXlmSBXoh9pk1GVEaPmQoZ7G3hfNBhJX5BN//Bnrp
X-Received: by 2002:a05:6a00:4616:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-826d0950c17mr116197b3a.51.1771553653221;
        Thu, 19 Feb 2026 18:14:13 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm19607225b3a.30.2026.02.19.18.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 18:14:12 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] ARM: dts: bcm4709-linksys-ea9200: set WAN MAC
Date: Thu, 19 Feb 2026 18:13:49 -0800
Message-ID: <20260220021353.40554-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220021353.40554-1-rosenp@gmail.com>
References: <20260220021353.40554-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_181414_217265_3A77F670 
X-CRM114-Status: UNSURE (   9.88  )
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

The MAC address from the stock firmare is offset by 1. Define it
properly to avoid having to override it in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 2ba5adf2b7e7..7c6ad7787945 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -25,6 +25,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et2macaddr: et2macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -70,6 +74,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.53.0


