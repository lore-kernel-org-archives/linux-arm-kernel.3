Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3CED2E9CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=; b=dGw1p+B6/fkc1bfmS4nQrP2dJ8
	yt1/B8F6ssaPfuQ4rEI+zpCR1+qmgUU9HOr+yV0pYHznZByG0e6NqdvPspt+RKQ/rSgu/GN7ZM2lf
	2LMypWEfGBJpODDbc4kU80sjPzvATMT+PPn++PuoX+QhQIujEPYmucfpOOlUPWpjifbMY4QFr9/hu
	wF7l7eq0BmFbwnp7/076+2dtirNAcaKlwiBOuaj87KpMsgOQ4wLwgaHeXSz8VgDYkgN3rw08B9HTS
	MexDxBYbGbgM7Reh9fTpcbhmV41ZOVDzRL9Xbsc9c4RVpLVgi/tr4yiuAuXX5VsyCkdaTNYTjDBPw
	qrz/DuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR5r-0000000HBVZ-2hj2;
	Mon, 11 Nov 2024 09:52:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzc-0000000HA58-3qWB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:45:58 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cdda5cfb6so43060725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318356; x=1731923156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=;
        b=FP/H7hx688IIZXFJZII1mt2yR4C9/sbWfwlSWHBJp8Rl3CpxOr05vjPJVjolNbdYzC
         86nRQE5kldFqkmHwVvFUfP6r1EQ8uqcwU9ZtlQSk/2vOz6qjzK0HoHjSGEHneEkqds/T
         hrk+NwoGh+mGGKUVxjlAnvw600uH0RNrhjVx3WI1JQJRDC6mDkrz94S58R/NmOvncFCq
         Y/cYiBYk3lWFsHK4hC07n5VUJfepgIACIAvkQq2mHEvwAw4A5x3I9kYh9wR+QmYGXCdv
         ENBXCtSScbQqgogImc52CV9TMqxQ9S8AqLPNNwXG9P/Sp573vWOydbvt+Bi4LkkNSWx/
         wSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318356; x=1731923156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58c4YWEBXyCwGMl0ggHufA6EWS8/x/3Jjol810uZQ1Y=;
        b=ptoqZD+G53Q5AriWox6NdwQ/LMV+GGFc6SGTd5/Qp83REiZc1miOWb7AeLpUZeHzy8
         nYbQx6CHqe3LgL3JypAxDKXtK6G0MMmvjCwudpPwRV7J9eJNJA++q3RpvCE1WnhUs5ur
         Zboa6n313zQkhieTg7+ijnlw/WErlMDesYs834duCdX9TJh0AGL3j0D2zOXive7RLOA6
         My1FEop6awwuP3pCMn3vfGHht0NrOEQuw0PI03wVU6fcBq+7tFEZPObLlSOYcxpNjh21
         JBHZZANwftRBCZxzJl4P9K5tnORNy94jAjh8HHvWj5W+DofwjHNj4B5wxEn2UMHc2Lyw
         /x1A==
X-Forwarded-Encrypted: i=1; AJvYcCWVyNuW57LVs+YEm9AZDj4KbO+Iq22W8PMPUK4guRMNjoz+shOPIMlrxX+s4/3QUlzesmC5gwvCOhtF1qLFAgRx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ndS7g1t9tW2TDd8M3jrJdTbhtrAl/zZhYJ/kXkl4lCfAVHd6
	Hp8BzrcpiI26C5riO6y2diSERgZ1/Q0TM0eyOgmT+UMZ6JiFexQd
X-Google-Smtp-Source: AGHT+IEX9nBe6zOXu4Czcqkfj3xLinKY8e+SL7CCUn1NiuO6HMbeZ+foSn1y1YJElfeQZ9VKBu9SKA==
X-Received: by 2002:a17:902:d4c5:b0:20e:a2f7:8ab9 with SMTP id d9443c01a7336-21183542c89mr168471015ad.27.1731318356014;
        Mon, 11 Nov 2024 01:45:56 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:45:55 -0800 (PST)
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
Subject: [PATCH v1 1/5] ARM: dts: aspeed: Harma: Revise node name
Date: Mon, 11 Nov 2024 17:43:45 +0800
Message-Id: <20241111094349.2894060-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014556_978434_C6152B58 
X-CRM114-Status: GOOD (  11.42  )
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


