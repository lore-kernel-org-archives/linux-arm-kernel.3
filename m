Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE06D75BA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=; b=WKNlsOS3V+tExmK/6MsSVmekqS
	R3kArRNAVx11vu3c/UYcHGQoPb0Jf9bbQDJKUt9Yu12YfEEf6pMapNoaLCqFlAl6EBJ2U3EGQ6dmg
	8D6tbcRl+t6/fN6Eiwr5XB44qXpOxjnpCMcWc/WLRQ/eC0miKomOHwBDtsyC3NS1tkgSkTL3M/lgE
	/lKrH60w57hPT/SL5ZxvW2cZtWmF6KaqUd96l1vHLXUYCqQpLH/UhoS0EeNznT8M3z//uw81m5GrZ
	TrcY5u5LTzqeZkWHZv/O1xrTfdiYQpC4eHM+z01sh+ZJyNsUiiXzxjC0VQYOxu95MKrkjgLhIO3+W
	ctJI/72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxLr-0000000GdaD-0mf4;
	Thu, 21 Nov 2024 02:55:27 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxK1-0000000Gd9W-22EX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:34 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6eeca160f14so3901827b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157612; x=1732762412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=;
        b=jkm+QvnNkDvw/KV26vI+tIvV/PdPxSO1prNZUNTTemgjsJk0YLMGPyLtYbw4oUZfyL
         AC0WxQ5xCs235EUgCe8xkKaPUywWx9D6EdWzLNGmHfYBc3DjX60RME781n9EWT44SrXy
         L0Qt8tNVhHjcnOadd2FkzOT4iPwd4gC34XkQnAfjiPjJrT8hUxPzW9HDSZ1bTwWHR0aO
         oyeSIhGZNPTcDcL1cK6oNRipETcV49l+GHoY349qwlmszYvchEaZOaQM5g8QEmVQ8YBX
         xXHnQQrCsb/Ybt5OWQodqERSN+a/VeS1k2Cg7qDpDyPVeBSmt7SYDirWRsCVmaR2Ve7i
         wktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157612; x=1732762412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=;
        b=MoLdqIJDO5T60RIUEEEVbk7xO23xo2FpYVc9bSOJiwE8h99lAtMBT4fBf95riD076N
         fm5Dg1lysrx3ntWNKm2zwrvzSs0LcoRWTbiuRWmw5w4ju1C3luv3DoJZKKmQKnp+rV0I
         U8R2FnbbUWen3//Xz7tbWI7sf3OREo0BSFsRt+4M9T7FmWFHnu9wz0d3IHXjo7ptqPzy
         wz7EIlkX4RAuzf83Zna1WjyRSGS2cx803K8/v8E0xeYB5q4v2wYMofsqd5BUQkDromPp
         YXQXEprok4Ckqr/a8fVzzXNI2Bdm+f0Kkj8zALkfy0uJePlZcVBul8Ffl1Etu+ItcUWW
         tUCA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5opozWdlJeaJ6EK9pS/rXJ0Bxd3kytLTEfqux7uLdg8eVWXi18kSQZB8wdI45eX9RD9DlI0xH5Um6kGsX9GI@lists.infradead.org
X-Gm-Message-State: AOJu0YyByybM36bMLe3s1dODpOL3Styt3jOO/EzCyE3kUMNhFrcn+v3Z
	6KK/aFHQcD4a0ZQXPII4rZej19IDq+VlIHMP+CHtURpfaDLEkAOM
X-Google-Smtp-Source: AGHT+IHXjRyb8nS28IN/wtJ8a+jvzEJ9+GyffRQ8T5afNpb4mgS2TbqNu1e0VRuzfkOWg4BumlDkPA==
X-Received: by 2002:a05:690c:4c0f:b0:6ee:b8ab:56a1 with SMTP id 00721157ae682-6eebd17f2a5mr59339787b3.20.1732157612091;
        Wed, 20 Nov 2024 18:53:32 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:31 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] ARM: dts: aspeed: Harma: Revise node name
Date: Thu, 21 Nov 2024 10:53:18 +0800
Message-Id: <20241121025323.1403409-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185333_528181_927B47B1 
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

Revise max31790 and delta_brick node name.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d175e37c45c1..ccb45ca840cd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -183,7 +183,7 @@ &kcs3 {
 &i2c0 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -238,7 +238,7 @@ eeprom@50 {
 &i2c2 {
 	status = "okay";
 
-	max31790@5e{
+	pwm@5e{
 		compatible = "max31790";
 		reg = <0x5e>;
 		#address-cells = <1>;
@@ -311,7 +311,7 @@ eeprom@52 {
 		reg = <0x52>;
 	};
 
-	delta_brick@69 {
+	power-monitor@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
-- 
2.25.1


