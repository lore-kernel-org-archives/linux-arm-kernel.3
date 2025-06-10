Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F10C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l1SAMsGs37SGD+chia/RQyRlWwAaxqTB5CEOsEmZAX0=; b=SUxyvIY9c9jLMTeDTpX9/PGOxK
	lo+YBiqDuLSge7SSGw0pchS7lVHtxhZ36SD9Tc6rh/2Qh55+JhcBGIDzSyuXqGMEDR4KjDfWBZANi
	0thzCd3puMVlirdzHKa8eH8QrL9yr5a0NJUcXhRgImMjSvqAsJE6fmo2f3MZSSEtDSJsGUSpX/4eC
	IQpemUdlNTeeh6T0HADroeA5HuNIAeOoMJU4hznv0RXWUGezjxNJCCAGsiXfcomS9fm+ayAaKeMkR
	+RIcKGAJlRJP4A8AZUPidj+lN5Esj3fVX+u+WAeF57rHk9JxI+1c59Psl4vcJG6MSeO054QYq7adI
	NtjmyD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lC-00000008Ecb-0Sx9;
	Tue, 10 Jun 2025 22:48:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2P3-00000007ZKx-1DnM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:04:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234c5b57557so53443225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749575088; x=1750179888; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1SAMsGs37SGD+chia/RQyRlWwAaxqTB5CEOsEmZAX0=;
        b=OM/ZUVDzxCONKUZhuQOKyAEs4TFyu0KUfVgp1b8sdJxHXGFyZHH+G1O5ZG2+h8miMV
         cTp9Yd2AeaCBqwDgDIoObSdblr5zT5vspBtTIm6D0cqmD5tIIUGJMOQ6Rml7LYvQV7yB
         lFmo4nASn8zjdCIzzQvfACvMPhjCrrS5dtP50eqeyXnd54Qo4q33QKGY6g/N6u8ORUnl
         OaO/Ppd5nbJ8chCsVv8JNcZvwl1adpYa+P+tHXWz6DDpUyI+GAy685LL9E2L39xQvm0G
         llzu1lEAIVvPg/8s1EN5w64IrEqCSlLu/OOyiTN1WLV8rYrv+jteRnKsigBpddgp2F+H
         ZZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749575088; x=1750179888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1SAMsGs37SGD+chia/RQyRlWwAaxqTB5CEOsEmZAX0=;
        b=r96kovHNYCHLRbMfikX6EMWGxcD01c3ebe+yJfFunCI8Ta1frdizVNX59Ej6gGv9NB
         tM1fyy1RtSjjbRBm+YmDh62us5PuTS1IDG6RuSmADAAXp4YJrukcmFkW2BLZxRGPJuEc
         qQU+GXOHhJojtaY4rdb646rJ+pPsPU7V3UpudIpwR3SUwYtXGo49XlZSQiUQ0xPL48V7
         lpK5JSkb2HYYllg5OpVSm68mSEJw16DR3Xv+v7SsR0jvdfCvLtTHn2jhc47V88c4Jqsd
         1Yb81FeA7FgQ4PkV45kBIEx8JsNT0l0dFYK7s5B72Z5cqbgLnp0X3K5vPciCzBkVI38R
         yB9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAR5x9NS7kmeNJZ+ZiWujMBrhsnVZcj7OsnTzz0qZ1Fb8sKLp0pzD28Nrh0+5O6g5mUaro0O9OFBfSDbUBZNAd@lists.infradead.org
X-Gm-Message-State: AOJu0YzgdbMEanBzPozhEa3Y7lq46N87h6SXXHOTedDf1q29NqW6jYWw
	3N15cMBe7KY8MuWdOBkc4QC0nxQcCuAScXkFRxbvYNP9D0TyHUExLltMizjwRA==
X-Gm-Gg: ASbGnctvj67H9Ok/D6036I9Y9A83Q7XJL5XwYY9ojAm/rVMAIYOs3fQh4H96jqQoiE7
	11au1pQpl4UemhHtYlFHqEtYuWNdQzxwdLpoqZOCKnB/rP4wAiIuLavyPP6ar+kTy+vdRmL1QyH
	0nRf5cvG+HBPcYnwdqoiGFec9nY/pijiN53HaHsvYweahsfZRumXKO7iIERhIuTVLY7uuua0qvS
	lVRC8JSkmfN6BDGgkPztP+P7iVUO41MsIZZfLXeAlrqtf2YMpNujI5itj53HlpkvEjzZ+A57lbH
	UzMNjgCTli0KyO/qJ2rnLEm1ZbZ0PrPqXaSlj0No66eLFT68PksXlwtykJbBUi9GGEkTsV6VJ1U
	YVnn6NCMkRGjNuccay8hxNOEXUYZrXpGQ0EBqpCHssOAl4hDKBg==
X-Google-Smtp-Source: AGHT+IGN8fWm1wd/rYS+vEB4RxNmREuCEW79sACTf92qnjh+StZfwWgh0XTKc+e8n8+kZsmS0X1KRQ==
X-Received: by 2002:a17:902:c94c:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23641b26eeamr523415ad.46.1749575086817;
        Tue, 10 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034065edsm72958615ad.185.2025.06.10.10.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:04:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Jun 2025 01:02:09 +0800
Subject: [PATCH] ARM: dts: aspeed: catalina: Enable MCTP for frontend NIC
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
X-B4-Tracking: v=1; b=H4sIABBlSGgC/x3MSwqAMAwA0atI1gaa4v8q4qLWqAGt0hYRxLtbX
 L7FzAOBvXCALnvA8yVBDpdAeQZ2NW5hlCkZtNKlqojQmmg2cQZ3G08UbZEUUontWHNbFJUa5wZ
 SfXqe5f7P/fC+H35ZZLBpAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749575084; l=1422;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=FeGGqTV3hMLvtuAUwQjWTQyZXr9HDJB5RrZEzdTh77s=;
 b=lRWcKzdCWOshs6fYek3iMrxbKcUD0Q0b2Tn4RqRTi0y+t19th2ZR1mJJ/o5nxpConHX4xZfj9
 M55WJ2w/KdyB4EiBoVxPni3QOtFCBWVk2dtVdkjJqPvrVw6cQn81u4y
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_100449_333191_500869F6 
X-CRM114-Status: GOOD (  10.14  )
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

Add the `mctp-controller` property and MCTP nodes to enable support for
frontend NIC management via PLDM over MCTP.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Add the mctp-controller property and MCTP nodes to enable support for
frontend NIC management via PLDM over MCTP.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 5fb67ad2d777..8d786510167f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -797,6 +797,12 @@ eeprom@56 {
 
 &i2c10 {
 	status = "okay";
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	// OCP NIC0 TEMP
 	temperature-sensor@1f {
@@ -926,6 +932,12 @@ io_expander14: gpio@15 {
 
 &i2c15 {
 	status = "okay";
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	// OCP NIC1 TEMP
 	temperature-sensor@1f {

---
base-commit: 4d75f5c664195b970e1cd2fd25b65b5eff257a0a
change-id: 20250611-catalina-mctp-i2c-10-15-9b7e94460bf8

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


