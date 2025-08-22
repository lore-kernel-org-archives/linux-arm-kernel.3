Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C22FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=; b=uhGyuYMDevUv5EMWncVGCuHbxv
	eW5Ujp4YRvbKLpYuteojdHkjnKSnod7GmR4BCkEWalO2Le0tN1MWjT5M64O9UAYxSGPeiKtLLPpq5
	ncQl9XEclynjS+CVB9FbXT5y14y9mcK6ez77mErtxeBpv5hJbUoWhN+/WLBCGkgKDxnOBw1u7zlYk
	TN78ilmwzL8to4Q+lHLYYOXVP+mFVQzLizOiVfEC9SHRWfPotA9QvhaSisRJHUzu98oxKcdSTUOPw
	2Rf4JRKqfbERmrEz5JPZqGUPanDlguXPebBReN2v+VuL5QvqRhHAjtNXY75v3Al5lcOZOxJXgXmo5
	yuSzMCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSbM-00000002ktj-1d6w;
	Fri, 22 Aug 2025 14:18:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL3G-00000001fd0-1yuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:15:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24456ce0b96so18502725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755843302; x=1756448102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=;
        b=gNn9aLeYzLDHtn1P/3DGI8Io/7gSP51LP7cNAYkh3zlBcF/HW4Zj1IeNjnmRWBV53n
         aXe3v6+TOlP9HZ+9iEDbQAPHOAVcAAS1MyrYmOtHsvhoe/Rfz4LIamht2XQbCV9LLc/r
         Ww1y/gXpDD7wXqhDJSg9fHZQThrNZeTFQreG4k+GMlPhFDfUetotZVaPYfr4jPrepBv6
         mQQAgoP9+nLPodF9jzJSq1Ifjh8mhK3duduQJc4rPlAXmgKXEJArfBuV+TLojbswzB7r
         c9jTU+53iZF3lbJn5GV3bqb40vi2E1Wm5ZeR6YhkkjcO3FBE2li8s6PmyUS/qsh7qRaN
         IBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843302; x=1756448102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4Mp9ub8voKbHs9L0zRZ9WclG4wR0S5cTRrb6q1ZcxQ=;
        b=I/m9lueCRxsLaiMjJqzCqGTyxQJm+2wUjwK6yjMv2SjeLqttl6VwbiV75IiO3YH1Mf
         D1FTWYaVpwWzYgg0HNKL1EyoIQXROxDXlPFwijVpWZfzaAI2kX435yZjW2ilk1q9tZG2
         L7ixYxE1k7dnNE7qoqVMqMfwvGJvMjlrN8hfg+EATB6cjpjdz5RovXqWtfV2S27WAjrg
         Tx8c7ri0U66ccclyRlOvQbxkkrCcHDZ8PqDTubvvgXgU69QPM++xgVPgwBfyTz+ijS9y
         LU+xhEaFpBAZFuFtNVhblSldWjayjU3w2lRBnk+31S19tutUsgI9GZ0DL8ldGiQI6LXH
         Ajhw==
X-Forwarded-Encrypted: i=1; AJvYcCWC0tcUAlPNcB3X7RCpznQaxIO3Q4UqAKo7COQFtIFg0Ufy6H0fGk8DBj3RFN0gm3rpY5M12bj/446T9UxKU71G@lists.infradead.org
X-Gm-Message-State: AOJu0YwOTO3KZm8LU4gJQqBf5J1LKux3lsVg/HrshebSnqNCpuDa2jlC
	lRxixWO3FsfDpV+voKmpqgFzMO1MkuSFYuTVa9aHEuXenTG3Pubkbri7blSrRg==
X-Gm-Gg: ASbGncuxSFQjlRfDTYAXHUkaGoF9Usp21JqOQeE2oxJln1JBIAZdJIenArAMeEeQsxF
	YjenTDlBrbfRrnvflRipqLIUNHgwWjHNc4s4tq8nYpMhRp6rnVnCvK3d/Y/AO1o+ZCrK1HihXQ1
	qMmYzS3mbShz+E7gnu2SmzcT2xQYv/Qglq2m+9DaxgtqB1zac9xvmhOlxV0DG2gcRfKzmwOj13E
	CHx6klOWX6O9POaV9d1nRIKZlFDnN2orT+CTtgQR6nsxQtMN58wyPIRbZ8nu7ufk20gx79zlpSp
	TIypMXWDQEfBXnLD9LztgzWrm4fNCUkz3h25EMAki+YXhlqZZHJnSWF9shlsTCeCCb4ae79sRuK
	nmJmaZgVR4Zg4RDChTq1pqJCRr5u1aW7gPHxmKfDdgK0s5pircj4nPvMsu3JsYC/BCToCANMAak
	mg6DfSYeu8JKg44UT6O0dDu2VLnVGN
X-Google-Smtp-Source: AGHT+IGcphv3Y4S/+8hBXnAifQ0Lugya7F08rZBSa88ZhxJo9tLkgsV8/t8NAnzRDkBfLXViimjVPg==
X-Received: by 2002:a17:902:d50d:b0:245:f6aa:1cd0 with SMTP id d9443c01a7336-2460245b0fbmr71854855ad.17.1755843301678;
        Thu, 21 Aug 2025 23:15:01 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e35d-8041-a0f2-62d1-f7aa-e5b7.emome-ip6.hinet.net. [2001:b400:e35d:8041:a0f2:62d1:f7aa:e5b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246181c48c1sm28660385ad.116.2025.08.21.23.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:15:01 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: aspeed: harma: add power monitor support
Date: Fri, 22 Aug 2025 14:14:51 +0800
Message-ID: <20250822061454.2610386-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
References: <20250822061454.2610386-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_231502_512513_0EEB2E50 
X-CRM114-Status: GOOD (  10.76  )
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

Add INA238 device on I2C bus 4 for the PDB board power monitoring.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..741d2d9b6d03 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -373,6 +373,12 @@ power-monitor@40 {
 		compatible = "infineon,xdp710";
 		reg = <0x40>;
 	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.43.0


