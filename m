Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B7AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PrIwQHjw/p9hrLI0cyhFU0inaUVzxNVCt/CIe/61mQ=; b=By1hc822OwRaebPjq/+MfWWh5H
	2z7rTEg3BRIQTUDizt+4iM+35CHmtOncZsEKOcbZE+1nyQXjytZqJSHSwiDhXL4PydWApxHBFiQ2F
	q5bXuSXFD+Y3Vwj4JNhOor7NrS5RC3KHRxf+Y0QPGruWezfEfVUuLV8AueGreELb/ueiE8iVeJsN5
	YS5szKzd/9iPukVGiUNGHgjeOzadolF+MIEAKDUhGoBe7mwNALdK48Ltqp50NM+T1koCGVQuRT/DP
	EDM1dHD8a0MZqzDYq0Y8/SPK1aOOduHw71ds11yZg0QC2VmTqeFTNS1b9889lTibyYUSCg1LaaUtm
	3aA1Wy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZpk-0000000FSPK-3lj7;
	Fri, 20 Jun 2025 11:23:00 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ6p-0000000FLil-2CaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:36:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so1246734b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750415795; x=1751020595; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PrIwQHjw/p9hrLI0cyhFU0inaUVzxNVCt/CIe/61mQ=;
        b=RZUDMf/NQGwQnxVFiQo4Xf4VPen8oGVagbNsoVyncTvvAAd7Dh2bKMvHsei604lg02
         43V6XJM9PrBPrrWneC+3GBSblbSUnCBs3qZfsWswfkDXJvR1OrO+kjO2FqF6Fe4aQBtw
         s2BV1HplmZmLMMmNxmU/PHKpNhyD+fZOZWteBK3OwaIoKcHDuMrD7wBHgqg528+wOTEt
         G7+tOWBNa1wg8GQzmrb7RNLEZYaeOL6Gl78ah94EaCF201nW1BvNEeZyjVq1otY8TpQE
         mdwDQ+fKao4RAuXXl3dzHcFJ/YZfc+kmsBRKz5wCS1jBLiG5pISPkp2N4N9GbXJYZkhO
         K6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415795; x=1751020595;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PrIwQHjw/p9hrLI0cyhFU0inaUVzxNVCt/CIe/61mQ=;
        b=CVk23ooHOLONqSiJZqEhmQvtk+xwXuhxDObq2Ngk83+eaMoX54Cj3IItwh35APIpOu
         Ya+B1nqgOVgXUNNCY6U1GdD2AGxTfjss0y+5oM1++WdG73jxirKdwLHpioWvR5AjsrO6
         B4+9C5Or/d6NIgzmsUpZ4KiK10wAj7pqiyPfYvx9wrFY+2RWHzlWyW7Wp69tWWcIhOEf
         VIIXoCmHAadvek1TMjp1m/0NLWmbD26ic8uOqFGQ2F/kiDcpWForfSxZLoYMvM/t2QF3
         3EhUDY/DG1xnxAFIk6voDrKClI1wfQOo4SyV5NRM8gemiceN1YkMmZ2l/qcR5v59fYe7
         kEOg==
X-Forwarded-Encrypted: i=1; AJvYcCVmDQf2hBh/EVG4A7mJwR6LKbCUmsOJadnSJ1vQCSckYzvxHd+0N8U7cssLA9j5t6dbIaDmBXxBGnmzwyzFRiH5@lists.infradead.org
X-Gm-Message-State: AOJu0YzBSU8K0nX0fBTVcQv/1LZVZS9ddtc5gJxKzfobWo8NzcW+ODhc
	sw2dIhaOW8Ac8xcAE0zY8LCR8r3iW5SDPQgsHfWbk3Joq2RO/6rh1IsE
X-Gm-Gg: ASbGnctV90D4uSgeAzsiu/f0KyBOUTkRrrLHsHKc6sGMhwqG3XTpR6ClXHtO3K+m0pw
	LkgYo2+ZcabRUa10rJgfJIBcy+uqlV0efq8gdO1HlTzmxnw8nujTYupG893UAvM6hgCWwHTbpx+
	ag8b3qj50+VbGX6l/YFxZbjF/UoEVm/MSK5Yu8JoQUE+rlf9PUomeDC/4qV5F9wp8qsOhCpSkfm
	FQlZPS3cvDhxuoH8JQk/+FFtB7J6SbqixkA5XIQnzx8WfF+m6e603cqpnL61rJ/RWQISa24Pjwv
	XCBNFHdBskHK6fbk5YskdJ6EOItJukBE3WxDCMfJX6rX6veQScgt0yJb1BH8QNBWPWDl2KBhNrC
	AMn40pMUTNZg=
X-Google-Smtp-Source: AGHT+IFc4Q10D8OQtMZi2Dtm3qf1ST8pz1u/NxWiETOVzSYrkkbcHnd7yIU8yT784naKdOMQMa/5mQ==
X-Received: by 2002:a05:6a20:1593:b0:21f:54e0:b0a3 with SMTP id adf61e73a8af0-22029176202mr3058959637.2.1750415794665;
        Fri, 20 Jun 2025 03:36:34 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7490a674eb6sm1779230b3a.144.2025.06.20.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:36:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 20 Jun 2025 18:35:36 +0800
Subject: [PATCH v2] arm64: dts: apple: t8012-j132: Include touchbar
 framebuffer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-j132-fb-v2-1-65f100182085@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHc5VWgC/2XMSwrCMBSF4a2UOzaSB02sI/chHeTZXrFNSSQoJ
 Xs3durwPxy+HbJP6DNcux2SL5gxri34qQM763XyBF1r4JT3VHJKHkxwEgxxyvXyopxQ1EF7b8k
 HfB/SfWw9Y37F9Dngwn7rv1EYYcRYOQhldKBmuE2LxufZxgXGWusXVoRMD54AAAA=
X-Change-ID: 20250620-j132-fb-d7d5687d370d
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=61tzGfGbgQLnSFeKKZHQCEC5cxZqFDsy8PIqZYAdbrw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoVTmpH7C123HN9er4olInMFkdcbOHWIYV8pnYG
 B04Py1NkqGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaFU5qQAKCRABygi3psUI
 JEsjD/48isIZsVW9mZVR2PW1U4M3BDzHiqAL09krcSNQRq8Wcq53au1xxRfYAmRdGhkH0W3wwTG
 TUx9cjx62SnX4s3VXjucX222dQv5r5eU+sAQQj9ieFpkV9ssSUJGFTySHsoLwOk/2zFXkA59x1g
 TeQP+zVBjd/W7PXMH/mgav7rUs9UarxEhVj7LjagusBrW+q8s4d2Du1X8xwLFFZkX6o8nbat6JR
 Mh/VKvCxQdn49CFCzS6fN/Hj6C/IY9+luO9s85wGZdFQiGrprxHXpjiZ4V3XkJ5kpK/GE4jgLid
 16SjSvlUYXyUENw7UoFU7MUTUZ6fP5aayAkRqHqEIyhQUeHAVP9ihEU/U9RUviiPfE34ug+AVrU
 5KxK+1ZR5E5m5SlfLt6qGiF9fXCS3W8gIN3+LT6mlWcECfky17dqyUMHuWCABXKv6musUoKULgn
 gAeFjgNG5KdWdv1UMnm4BNtxW6RkOo/fTruFE/wwHyqEuZ7Y+qf/2ax13g15oyeXp/61+Z1BLi6
 DaD++Se1zd7eYOe101biQdLG0RbPyx30VBMz3PC93RlR67JuxKfrTcYYOYw4cumpJJQ2DTmXlV5
 3o3bHjRMgAcDoTR+q/PrQmVyPi+5rPnaK7Hbc4/uN4FNxtXaWKh1A+zQqJgxe1j8DBSHt/Qeg8o
 ukrsyXeu8tnx8jg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033635_578731_EF41B370 
X-CRM114-Status: UNSURE (   9.04  )
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

Apple T2 MacBookPro15,2 (j132) has a touchbar so include the framebuffer
node.

Cc: stable@vger.kernel.org
Fixes: 4efbcb623e9bc ("arm64: dts: apple: Add T2 devices")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- CC stable list in Sign-off area. No content change.
---
 arch/arm64/boot/dts/apple/t8012-j132.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8012-j132.dts b/arch/arm64/boot/dts/apple/t8012-j132.dts
index 778a69be18dd81ab49076fb39ca4bc82f551e40f..7dcac51703ff60e0a6ef0929572a70adb65b580f 100644
--- a/arch/arm64/boot/dts/apple/t8012-j132.dts
+++ b/arch/arm64/boot/dts/apple/t8012-j132.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "t8012-jxxx.dtsi"
+#include "t8012-touchbar.dtsi"
 
 / {
 	model = "Apple T2 MacBookPro15,2 (j132)";

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250620-j132-fb-d7d5687d370d

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


