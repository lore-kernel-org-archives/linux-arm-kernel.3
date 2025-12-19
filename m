Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20802D711D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=; b=s5QW/5xJ5XeKZPr+39pr52necJ
	alibxtw7n8SgninJdHf5L60EzNLifMCPZoU6X6H2IPfLrZPXd/T2VX1SXcOMMvc5x5F91g9zhMpRZ
	lykds+CmyvqCszrkjgkBcKgAYa5+90bLcffl6gTynRjDqrpEXYGy2cQ/Umen/HFABiYAj9OU/vXPx
	j3cYC0waxYs8NZ8N9LbwSkhM8edmMUY/akF6AEBKqHb6sz8zRqFVCw5y7DmiQgwoZqadIuU0kiBkp
	IOmaPQE0iAh5R+KuDF9noZM8hQbE1/eHIYfz3PsO4+Piun2vMn+Gt4yloHevvnJbKcWWd2YoT6sXB
	DtW5tYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYt-00000009o6v-2RQd;
	Fri, 19 Dec 2025 08:10:07 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYp-00000009o5E-1cPV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:04 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1300997b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131802; x=1766736602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=E3p1AIccjlEm/tiG39PsLAJ+aRYO+AfigrJKQ9BcQkiNO5PRxrQ8VdmstHRKYfWkx7
         mXOeGnfCB8z+GCdYYmJrh73oVpopRCqTP5OASccd9zDdBlAg/u9ETadvKzTzo4Crk3dq
         c3mZ9Vktoh6yTrbOz2K720ySVJkgtR/PnUDvW/87p7OTQ0EsL+wfVr11hMP/A/U2zr6R
         4gXCQTZve/JQdpBOoaDRdY0iwpol42IC+8lpYuN5lsGUUK8698RGBLdAXugSIrbEPiOy
         1FZZMF/JKH9r9/U3xMSW9JGwazrv5HggMWpJEaoSvf2VnUN9lC2TG3lewLWJsU74BUtW
         qKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131802; x=1766736602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=EAf5szj9IKRUHUjgwZrJU260uaxolPQTLNr3Jq7k4KKowIVd6kUMpnoUoCWCAVTZFq
         VyuZk3gZ0AQIaY3GzW3HJdm/yyiR9I77nfRmHLK6QeRrrLNmh5NVjI5fauwWt6C5MrHN
         GX+5t1tDMNhl6t0S24bmbsDlr4AC3irX+90skctonWbwZ6/qreQqDCvjgV54orZtZCu7
         9RFRGttLagsIMm1tq4IXjao62l0mdsmOqaukzUwLSKZuZv6xUWOjzHdNbxOON2VJ8VDD
         wS8KM3Lo2MropnP/673O8D/wVyv9dxiJ1pq6ube7N0fNPwbwwO/sMQr88nukwPa+IZpH
         4RhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQCIWlVD2Badep6TBtWAT8Ma8AknHUgk7KRZ0ltCW+ufgu6omnfJRgFoPRxnAi6BtZiN6a1lNuDl9A5hHvm2yu@lists.infradead.org
X-Gm-Message-State: AOJu0YwuZMpkyG8V6pYVw+qqJFoD1vLV/yK9KPo1PUzPAb335D5yMbkp
	19lv+5ejmuH2U3Oj39cgynYXx4ZbZnMT7w9t+K2BhB/ySDNgnSm0AzPF
X-Gm-Gg: AY/fxX7AB+uKXidCR/3UCTlEKOErObRpD0rtYaF9YR9SEi0UNhZTy5UE9EAMIIqHYAJ
	7CsZk0FWc3q72rQDBi5PUSwY2C8K4Mij4pCAPbab8MF1jpq6S5/9coiYGxQh4O3a03ml88TKMJg
	5Z6rEO8H84Pus55WyUInDTuAN9xWkAD7Yrt03uOvD42U//NZOoo4oMCjv1am62VQXvG+IjhlGWh
	eFrZop6dncBGU/8WlejuGrWXJkcGMqwTF+sUOSHKk1ffWIU7qXDdz4ysoe2yVJ8YfYmb4KpBSRs
	nyKcP4DIG3irP4bP5vdzdnULvQfIuTKefzrEQduyPPl91j2RZLOTTWId3PJlBNgYdxucfyA8O6v
	QBxKzlkjA2Kn1p7B2Js5ppwN5JXb+aIQj4/CgqKfEXhpjEuZ/+DYbXkZ4qbMDWPVc4mcA7O4XsQ
	zcptx+kOUjgYXXn+qe2QIQFEfQTe6CwsVnYC7nkCAVU9RnoTx2rzUKUM3ijlGcflSSSgdSLF3aS
	6rqkFm6S56nH9qMigQwBzr4lupleoyiWwN637Ra02uldgDOkV9dlY5rUxoyi1Oh53dHUU+Vv+XL
	i/zNStE2vOE=
X-Google-Smtp-Source: AGHT+IH6O9k87iUuZRQCfjVUNtyzbvFvDBUF0hfyDpwm5q4iSnF7KU2QOGhjZzrGAX94hmXJlBmPPQ==
X-Received: by 2002:a05:6a00:a882:b0:7f7:26fe:c92f with SMTP id d2e1a72fcca58-7ff64cd5fcbmr2018064b3a.29.1766131802504;
        Fri, 19 Dec 2025 00:10:02 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:10:02 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 19 Dec 2025 16:09:54 +0800
Subject: [PATCH v3 1/5] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-yv5_revise_dts-v3-1-ca1d5a382013@gmail.com>
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
In-Reply-To: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=hdlRtRi9TLU18op7sSDjRmIwRirYAAfHoP1MDNioDPo=;
 b=iAJWJED/ZWZRo52wpqJhzFlhUoPTycBrTupcQzGdg/tHGBb9ORmlnq+1D0gO/nkszCJikiMuv
 +qDp18nvbegAk/VpV07EyHZlegt87Eor/yxHAO066vJpbUXe7X48Vam
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001003_433058_095F5D99 
X-CRM114-Status: GOOD (  10.65  )
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

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.52.0


