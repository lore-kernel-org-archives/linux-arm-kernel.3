Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683BCEEF31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLXMGyCvCYaOpNewWGAXwBi4Q3TPN5Jmwds2Ju3CvEs=; b=LZeKy+Uuac1mua+dk/PW0Jj9b5
	ckob12jRpNLypWHXBcQBZiGi1NBFtoQo3jnWs1ThXBzPPZnFvtD9d7PzpOOlcSCQHMmDmb7ez3Jec
	wjoqgxQMocvRNoyoR70DIWrXLypPLRBG246Yc6eDVTxW9lYbed+GbkAmwDC76yxsCD/DD6OqZhPnA
	XumrssO80yOjo02Jk3pne6E6jHAlDQcTFr5ATTn1tjARo4QmPzROWLj5DSpriS+NyNqWK93jcvuGU
	9Ol1jtRhf1xmpZJveLBLTtBkiniKC0hlp7V5ZbIy1i12On3EzsKJxwoJlM8zJ/0jSPBSXh5rorNnx
	zwyhnVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4OB-00000001Erk-3lZA;
	Thu, 05 Mar 2026 08:48:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4OA-00000001ErH-0vb8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:48:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2addb31945aso56868765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772700537; x=1773305337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLXMGyCvCYaOpNewWGAXwBi4Q3TPN5Jmwds2Ju3CvEs=;
        b=Szi1HFNBVFvWEAZYzquNxetbXPqCpqvlXLvJ1tgN0cpkmZxjmTaq7SsBH2XUQ/3AKY
         dI/PNzi3A05V6VLWl+VACOf5P3kvJD0EwzW457ETKYMenfoy29o1zaKTD234BlKhPxsO
         dNQepZb4EJYy1qMsNmOtvwGuA9RgCDiaL2fsDZie8pB6fDM3y13rm296DKJIqjyqyTGG
         Sdjbq5fun/+LzaZreBRFd4ZOqKA98R6SJaZrXOHQio5Bbu63fyIp8aPYgKoNKPlLzkEC
         pJo9C3tIGUJlDfMay1vd7a8puNweYDbYeTrCmt0H15Vu/qCmsy5lltF+3PME9jCzHuiT
         7H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700537; x=1773305337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLXMGyCvCYaOpNewWGAXwBi4Q3TPN5Jmwds2Ju3CvEs=;
        b=XHonweS/njZpBDdW48P0lDiv0/qiHELh0JIkY5syrQxKK0BPvH3EWHlRBetjm7/zDu
         tV61vMXYNnpDg37ppUHYz6nxokr2uC+msrLcQ/NE8X9pXAcj73qxZ7Q+rGnqMFHewviH
         tMDiZMlWM5D8wgeBMaI6EZKMYPKwPT3gyAqydb8uIldy6qgk1puMol77ekT5uLquzbbZ
         84jD2GO22uW1mmpChnGIkyZPdwOFe86m93pX05zIu0uQnQ3i744hvxExpa5G7MTuQ02P
         JiLDvsARv01z3zhbcwdo6fA6q649apkwm1VHGYk2ckgY4kAhY1Nlf4uZY1xqCc0CbxfG
         E95w==
X-Forwarded-Encrypted: i=1; AJvYcCUfC9AEeKoYnDZfhHLdaK4jUrGJGzGj439/Q1ctfpIbApxtg5ACn+WVReMLhmRWQUmRfOJw5HpLlKAfHFi9sKtv@lists.infradead.org
X-Gm-Message-State: AOJu0YyBsYdYBLyTg1R8/dtl9adySD5LLOTWkh/1uAbOq0i5YVNOE8yn
	SHIoYE+W6aumPMklJroVV2FTw0PJhbd6UYORz25HetvZfjFY+sEz/ErE
X-Gm-Gg: ATEYQzyRnBjzAlxOt5xnMGe/QZmd6OU/qOL3/sjIWaOXScdXnT/TT5wHlAVUJMrssEi
	JpS8qSdYyM0OHqIH+3scpCevD9lqH/hiJx81rPSt8HuGGocAynLTFa0fED/TV5L0pIpjjlGgzH5
	OvWHMEqYK9WxG6RZBoX9e9TNIqLvK+hmizLzFOhGfK7gZILV16qMa+NSzn9RhwsSMifsCy+Et9U
	XaHHFtbxyE26Ll1bv/Ey9Xugo5LWlfcRxeqsMUNPwYCtjuLIYhfYsmzCaZlkbHwE6aZYFYZWCmK
	XKcut14irqIkwIl/1IZSNshZyufldf9ac+Dl7kybxElWrnheYrwP9lbk+xbcNMYjYclGEdU9kMM
	0jbJXduSlQ1IWQ4wfZdS8eP/mq6rkZRD6liakqPnIhohGD35+AjKOZHsNytJsdCd7Jez1YCejwc
	UPUf/udIfsdt6j9JkvUPF5yKTIjaiWfRAvYof0blbo4UbHAxDMAf/uZ5m9I9draqLoDuJbIu+/5
	uCBcGPB/mv6Qv4ZZJzyUA==
X-Received: by 2002:a17:902:d501:b0:2ab:230d:2da9 with SMTP id d9443c01a7336-2ae6ab28e3cmr48197565ad.48.1772700537028;
        Thu, 05 Mar 2026 00:48:57 -0800 (PST)
Received: from bu9-daniel.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f277sm289309515ad.55.2026.03.05.00.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:48:56 -0800 (PST)
From: Daniel Hsu <d486250@gmail.com>
X-Google-Original-From: Daniel Hsu <Daniel-Hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Subject: [PATCH] ARM: dts: aspeed: yosemite5: Add MP5998 power monitor
Date: Thu,  5 Mar 2026 16:46:50 +0800
Message-ID: <20260305084650.24511-1-Daniel-Hsu@quantatw.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_004858_275225_BC0C8A46 
X-CRM114-Status: GOOD (  11.75  )
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

Add the MP5998 power monitor device on I2C bus with address 0x46
for the Yosemite5 platform.

This allows the hwmon driver to probe the device and expose the
power monitoring telemetry to userspace.

Signed-off-by: Daniel Hsu <Daniel-Hsu@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6b..6287f80d70d9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -422,6 +422,11 @@ power-sensor@45 {
 		shunt-resistor = <1000>;
 	};
 
+	power-monitor@46 {
+		compatible = "mps,mp5998";
+		reg = <0x46>;
+	};
+
 	power-monitor@47 {
 		compatible = "ti,tps25990";
 		reg = <0x47>;
-- 
2.43.0


