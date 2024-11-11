Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC324D2E9C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=; b=J47CvGgFQm0fC94id85ESiJgaC
	mGFRJQvyo/3fv05U4pQvoCTmgJJVcaBt7FiMzaKvophWQfkX7V+azzbeoPzGD2SfKnRpR4UqBE9xS
	2J85qadC9MiSOoyEv1TqMIpzvP+2imbRGeVcyFfFWcihMM97WfneTgT8THJy7iM1Yy61S4LTKFDBg
	oLPY/OHlZ9J2g6oIa58lSaCu82mQwwlHO7Mr19Bt+ZXOljpgPdE9cGY0HMpD49rGtoeV18IvMq6hu
	BXGYryoe1QJfuH03fjKVJIYS6IIsQt7U66D0Gb9CTKu77Y3oyk4jRIpd82E/qg9HE2I9BRLqY0TRB
	qPFIS9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR7b-0000000HBiO-1dhK;
	Mon, 11 Nov 2024 09:54:11 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQze-0000000HA5a-3mW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:46:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-211a4682fcaso2804065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318358; x=1731923158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=;
        b=YnLCuPvwnu1MbskANwRL9OijJH13IarfM65+/jJMe7r+Lp/EIm0J1DBpGu6HZ88Aik
         LzIzGsY8z64zwvqCF86Xl7iXVQDfW93BBdIfcUpzgGxmXaUrnK1GilrikjHwDcjLaQyG
         9kEErFjoL/EXiqPMFoTqD9MtC5k8GFVZ8tD1zXX+dEL9er0wt5in2iO7bd198kbqY889
         BoLQXGtRZU1grQzwJyFbBTIQiwXe6maI7gHVjCVxvISaNknj7QbOGm6f6f6BPMX0GpJb
         MbVsEYSIIR/cLmKrG/JvCTu/cmSUPT010r0pqabwlg5tHFz0V1SSSoaEtTWGrh78I3HB
         5k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318358; x=1731923158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh0sbGLe3R9T6iLNooRlLszG+yIe2rtAwnz37rl7QI0=;
        b=wR8HRYO3GZDcXyDzOxmip2RQtsrrspMDt4XiM8eJHMUVcOboHvfIUzjSCof7Zwe8zI
         pX8kpP1hVRuk5Y6HNfurQqoIHZfTbtMpWT0NK94ygkXhJlj37GjusiR9Gy4EOye7lNcG
         AAQECqq+nWCLnQntxJOim4j3Z9b50TygImVYMewjIpjsu4uujbEX7PI1NSQ3zX4PHkln
         zPmrpKbvvQsWfkqQ55Yrcco/pf8VwLLKRBoKcks32mB3izzhomuIoFjQtjGaBBPzHulP
         FivMMEsv+kRPQaG8onoJyH5OOd5mYS6hmanWRGtXlMJEkY8S+Pbxgxwo6oWlkBHdbagV
         eh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiBbQNe8cAxccpart/VJ6Kbe4zHOoEH6c+G5jKlGOeYJh16khp1J7mI6AzaUabBMU1xOGuIGmHq/5aEWQnZm0p@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZn9vxqkQFiD+WJfpXHOaGXwy1EZXb8RQMEpFixJt6PdIDi+i
	L+IiQ41PJdjByRy/nupHcdaRfnpBeo9BhJhwmhelv/ay67M8iRSy
X-Google-Smtp-Source: AGHT+IEduPFER/8zbCIpz3Qeo+YquIeSgZo4edxmkNCTUQhErCW4SvbzAD9W8yw8RfIcEx/aOFKrAg==
X-Received: by 2002:a17:902:db0d:b0:20c:6b11:deef with SMTP id d9443c01a7336-211835bb654mr154930535ad.48.1731318358386;
        Mon, 11 Nov 2024 01:45:58 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:45:58 -0800 (PST)
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
Subject: [PATCH v1 2/5] ARM: dts: aspeed: Harma: Add retimer device
Date: Mon, 11 Nov 2024 17:43:46 +0800
Message-Id: <20241111094349.2894060-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
References: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014558_959194_CA55C2C0 
X-CRM114-Status: GOOD (  10.39  )
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

Add pt5161l device in i2c bus12 and bus21.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ccb45ca840cd..fd85d5e34a55 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -299,6 +299,10 @@ imux21: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			retimer@24 {
+				compatible = "asteralabs,pt5161l";
+				reg = <0x24>;
+			};
 		};
 	};
 };
@@ -429,6 +433,10 @@ eeprom@52 {
 
 &i2c12 {
 	status = "okay";
+	retimer@24 {
+		compatible = "asteralabs,pt5161l";
+		reg = <0x24>;
+	};
 };
 
 &i2c13 {
-- 
2.25.1


