Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35ACF64BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF/HQIOynCm0t72RaSXKVxc7uoyjtBGo96ikoMO3RzI=; b=P54wYqHb5pZhJAo2qYpRrSMbgW
	C22i0ehnH0novTMF1Ges6jilV+NmyagaM+VOk/0Oqr1n94nlkse0OUUF9r1suFJYV3Lqfh1FKn3Ly
	G26ui58lqoUu/88AHWtKpGcnG8UEj3VNuJ7To8InbEwX9RxWBADHOQsjzed8IfSlqPBr5p5woLwC3
	s3bh2Vnoahm0TVNbFyxmxnrIWTxkAV+uaM7tHk4p6xIxubwIxgrV77mGxBJ+r3/XR6CMdZ7hRKCB1
	mJygDtDMNubFJiMrcOYddl03yZbrnmNWfd6ZGjLJuPLTYIeAEi+7w2QLsLvu+IoszqH8GfJDg6Q2w
	F/IJ+jgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBd-00000006BBQ-3b23;
	Thu, 20 Nov 2025 05:26:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLxBQ-00000006B5n-3F3Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:26:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2953e415b27so6073685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 21:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616376; x=1764221176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF/HQIOynCm0t72RaSXKVxc7uoyjtBGo96ikoMO3RzI=;
        b=WcFuHMhOX2i3KRZCO3ybl1z/ciE/PMFIY0BBb80HZxdXEaa2HQUtX5uk6av6Rs1l/m
         qFTuGy0DU4rXLOxCwNoORkAYuZXd1J5AeRlJ8fhQFMaWxAxnyaZQ03pplH9RggSKJ1up
         xOtaD8Rd35Gr4FS+HCoc74JKBeMvKkL3rO4rHNwW/BEGRlyT4mUdNkmNpJ6Xz5dnkHaT
         6+MVDSVQrEdd9ttEv/1ScAlg2+kQ7BDVVcHNVGn2FViq/BLoUbcbMar8fcAWpkIl0v8O
         7z+GGuZ+B7qJ9XyN2cGgl6UqJnLUOVwRJKVlCDbJ9aJAubgP4shCHe3Vzgct1eC+3OZu
         hPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616376; x=1764221176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qF/HQIOynCm0t72RaSXKVxc7uoyjtBGo96ikoMO3RzI=;
        b=vlGPpXq2mpwpkfBKxug0QASO2DevnkHNUo8vVrKFFb8Tq/laNaFiaBgFUnUw5FVoyn
         fNpUQ0HA5guIBqrdJZInt5DBZAq2faRXSO+VZQQKq76N+s0aAgGQ6VioulmYVpVaeFds
         hJI1AGcTgOkL2Ewujk96aPJSuYrPxgcWLspb43WpWzIEqMiJGe8cY/xV4ZhCPm7F+6k2
         oLoe0opXIVRBwfaVN0hJPcqG5SbI+BhPxUv7R2GBMHMIAz6NDbtp6i/AGsCfvSiyId30
         /q5GoXXCdjmdfUTHzjGrS5BDKmmexlWt+Mc4EjzS/mbOW9TFfk4UuXp1RE0JaURUZCjV
         vn0A==
X-Forwarded-Encrypted: i=1; AJvYcCXDI7Q6QoM+w/eTZUFZQb4YPMQNwrxl5M3NzHdbhCV+KTBYZIH6pttmg1ADCc6c7DJD9SiQChx6rE5UkEO9YFmD@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQrC5Q8Aa3skoCKjJoyqslzYjdLfhRyCtcA8EyU8pUKylBXNt
	BeStwPnRCoab5B8vrLP2zhngMOSwx/4N3mLXYoTOyiPw3PxBD0GxRcog
X-Gm-Gg: ASbGnctUUgc71bzmpcD2NwN1WmoM3EQ0iCzZsKHNu70Kzl/kjstmKOfE8JWLshEnQi9
	p+f1snB1rfi8xRQFEFxkSvk7qC2VRpqP5wOnuzleHHzGhUAkxlm6VjKQhqtfO/MKkOG0/RD6dET
	/5RcRDr6j6kjbb6HAUySrHvNkfcLbVB27tGXVOY1jXn1fsSczeNi+JzXXo0m2c/gePNRD1/F9MI
	MDu2FgMhsPW7r7SQz3x170G2DLnXEDPPfeTH+Y2Vam6cFGLEJ3gm8Xko9814DFUFVRFlo+xnRiF
	FtfI473ndVxiuSpeuGxGO+B6/UIrpTK0gvr4sgSa4rY19+G0A3XGj2XMT/tj2l+dvZNdfZRoz39
	cKyP0P8u5vplfdg7xNvPzDr/zZIZiSQhyv1gE8vwd1OwBcEJOH6zTPMte9t3ePEEnk85SzQQeEI
	DccTXaaUv6WXCwIo1bUauakA73PiWxVbe12XcNzpP0Gat+INbB1/SK1l0W5+1DlpJqHoEKHJkN4
	9eWK/LATW7Xhxc/lqocpE8crmUufNIhXrULB4b5b1HMXzj5UYVxVExUr+WyamXajPVmsW0M7fTO
	lkQxLX4DypED8mEBgdhhcQ==
X-Google-Smtp-Source: AGHT+IGJp8Cd93sU3s6BBrNTH9o8Scku4SN9E6zIdoS1tC6GjkQGhpnvZ3DbOoHW82d2G+ALkdH5tQ==
X-Received: by 2002:a17:90b:48cd:b0:340:d81d:7874 with SMTP id 98e67ed59e1d1-34727d50e86mr1936462a91.26.1763616376006;
        Wed, 19 Nov 2025 21:26:16 -0800 (PST)
Received: from 2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net (2001-b400-e301-38bf-be0d-b72c-6bec-2812.emome-ip6.hinet.net. [2001:b400:e301:38bf:be0d:b72c:6bec:2812])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1221342a91.9.2025.11.19.21.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:26:15 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 20 Nov 2025 13:26:01 +0800
Subject: [PATCH v2 4/4] ARM: dts: aspeed: yosemite5: Add ipmb node for OCP
 debug card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-yv5_revise_dts-v2-4-4d7de701c5be@gmail.com>
References: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
In-Reply-To: <20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763616361; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=ttl/th87rXvNyHmcSwWPnJPpHSYTR2HIKjXWUQwTrdM=;
 b=JEsyeMSA9gIhSSUyjpQLiUtfsCFoU+UZynLjaWaM6x/TjxUQxg8e9xdI1yHXyYRZzvK5xSzVp
 nPAWG1911ZqCjSlQvVZErHuhB5TxTtt6NIApPgyBuhQC3d0mB6JC3RG
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_212616_823290_2F9FB7C4 
X-CRM114-Status: GOOD (  11.61  )
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

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 060757b7211a6da777c51d9f0c886796cf2450a4..b4ae1628ad5a8f8b5283f88760877846862b3835 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.51.2


