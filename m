Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B102CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A139N7u8LP+PVMXYdMyToSHsPMkupLAjBa9WZQYT4o=; b=rZ6CJqDBJwt0Ed+aMNoEYI9MJL
	hsuwevpxmZC8hM4XRrut/TwCLGuvyKjANX9LzgI27OOtJbhxEKsMDRpAMbs9gSIOqkpH3+DrPc5/7
	cmt0QLbfMkg0SGxJdExBSCSxkV6xNVa/gZA4EHXDS/Pi+drtYy5SSTorX4/SF2X7uCy7pLige/dFR
	Wgof3QcRPqOheUscckPLHr66ERdauT9L7md7O4W9CytC79m1dtbRc6OUuWsOMkeojZUGAhS6frj6L
	B3/unrx6KWW/BGLtY0/WSwUoZWt6LvkAS/VAX59ruszOWsiRHOa9QA08CJx7GsoU88NKBgkqzh4z9
	6yw/0Qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOu-00000002VaC-34wi;
	Mon, 15 Sep 2025 01:53:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOr-00000002VXI-2zFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:53:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso2238182a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901181; x=1758505981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A139N7u8LP+PVMXYdMyToSHsPMkupLAjBa9WZQYT4o=;
        b=eyevsGSo1galUhjMVHBfQtpnICz1GRUytN0IC1Nxibv/+kPN0+k47Res4trEHraoLJ
         4oUK/0OCxOjNo1JnlSMzkoKiFlugWIpl0kyU7VsoRaBlpaay+LZZFuZl0JbnrSVHqOFo
         5XTngOvdtjAIUj9Np5F+Bvsss/5EX5z9HtwHijxDegp5DCxyKwLgxSC52w80Q0ua1/Xm
         VOd/6svC2dgcQ7kce34Q5IbXpX6BpWvGy4O/gi9Iu7mwr1i3OTRX1wLiSPb7/YjnSo9n
         eCYv4ngAQHDesoRLV92WwOsr3IAj81vUHjB7MIdluSq1Q19NfPNXLeSXKMRg9LF+bCNm
         FHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901181; x=1758505981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A139N7u8LP+PVMXYdMyToSHsPMkupLAjBa9WZQYT4o=;
        b=GCwg9q1iIMfHSehaF+l+jHy3Ooi9q53UyT4yF6JCqOaQ5ENvLZHeZjpUVvUHpQKMOe
         5SLOx/aeqIcr9LgdFPSX6u3b8nPNMtBnQM7OFvp9z32hD4xL0eP6LRO/LYFXd5DW6IUK
         7N8vjr9KHy5VwTAhIiTOGaw7H7zDOFw7921IfyV8acab3Zh1Exm8WV5K1ZC8ZDdR3h4H
         qUkHp5inpfePIZ1Eo7gg3Ktps5Qi2lE9Flqp9c5M4gjXbEaw2lsfogaG3svO76+fFpgJ
         uG/KiZfTMdRY4pi9oaNSyIfNAmQahW0A4nH7eucnOf9Ba83kNU6/m9Lue8y76Qh26upN
         1FCw==
X-Forwarded-Encrypted: i=1; AJvYcCWjxbAXR6UxD2MQOWwBI2Rvy5bTzqUxGkDytQedBk3/OZalwIxB4QIykUaLdTun/mgeU8wZedFfWwLwEKOFApk1@lists.infradead.org
X-Gm-Message-State: AOJu0YwsGMOkoNU8O+qNFQToK6kBJuHpqSHFr4Q6sCRJBxODhNuHp8hO
	twWhfdl6schz/LMReu/RtQtwoQUo+dhkmoKtqws1gvDsQI79UfcghFDe
X-Gm-Gg: ASbGncv5KN2i5ZuvdS3PwixgbDMEmegkMv9M03iS4JMibZcJlVb5IHBEpblovrCPCqW
	jGLbI+IWm7elc+s+hRPwfpABU72mvKXWD/C37wG5H/v8HpizKicCnHJv61hRsWCMhf64ssHt4Vu
	trXkaXJvqehomitgHZB6Zr2Afp8WWa9P6dEqkARM64DZ6DaTOkYesrf1Zg3u7+4F6p3O2tIyWoG
	+JD4nwRglmIgN1zFEDbftXxNilbuYgOakFssWDozvryBkrntBiTh/0Onvqj2EOCQb9ijEnABkaq
	zGcmBGUNpTGcDV7Wp7J5SxA3+E2/wiAgFb4OawBOJs/2041TvgL3kBmNl7Ttx1zhXZ5tCPJdzSi
	Tx7+o+PHPskpqWUgxBrgV3F0k
X-Google-Smtp-Source: AGHT+IEiIX4HMezHoTHcpOx6Y7u2rWpvSIWej8foIoPdV55AIR8hCDNmJ2lq50k/5jhrKKdyqbQP7g==
X-Received: by 2002:a17:903:3c4b:b0:25b:c709:568c with SMTP id d9443c01a7336-25d24cac4f9mr113648065ad.25.1757901180910;
        Sun, 14 Sep 2025 18:53:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:53:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:26 +0800
Subject: [PATCH v4 3/3] arm64: dts: apple: t8015: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-3-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=JIsMKYVvFErbnKFHO1CrIUXDSj+IhP03g/zRcyQzRCQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FxPxpSPr9TPi3OX9425fiwK0FE73rPO/i5/
 DOT1UnRyX6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcQAKCRABygi3psUI
 JLb9D/9ZAEHklb2IiKDO8EAKTpsHj6N3G9FkJ943XH+Xa5OlnHu82KUqRtL05LGK2mPmJkSmpzY
 4TOTy++CXi6R2VL2nhM+XNPf0Cr4seFYc1JupRSW0jrVOKZH2QIJKgZ1jQuUh3E427XtRSrP+kA
 m8nwdmr6foVBiO3VYAScQxk4aHvaBHPLN4enotjeAIp0NrxBbCneARqAcQmahYopaQUSRgjKkjS
 0E+GbN416T6sw/DNFiwhUBix92nuUeXdz75Mb4xjN7TcuKo/U44oe1dbWJzC+MADrZOGNKvZ1nH
 F/KCHi8eka794nMEIdJiNdR1bJ8CYgL4KIF6Gyut47kUHhHcVBD7cIeWeHOfMa8lAbQ1YW38I/n
 I2Elwxit5ziXKe4N9OraDKFwX2yzAsVb5Hj58DEubfnu1gZgfFsyAECECZIEnuDQhWsACgbQlLR
 ORSsE4Rmq7sH4Cfu1twXJrQzqZbdv2RbCP8/hii7vbC5rH2sYGfaTS78chFENQw9E0go1gsjFfp
 4q2BPEw1oCW6XkUe3ea3BRrOGZC1zMJg3kniWPuN8QkcoZ62TfXj5Bi1KA8xvk6KWA76MIM/x+t
 csl7DCjPToSCDMPgRkWQPN9ZU9Pc+gTfV+Q2LD+DtgApqhkrHHTRVNId9gyeMBZovag9sW5X2q/
 J1LiTXb5RxjI0Pg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185301_759901_75AD2BDD 
X-CRM114-Status: GOOD (  11.35  )
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

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..4266667b23c1c851540a4a68411c50234f228071 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	interrupt-parent = <&aic>;
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.51.0


