Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512FED75BA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 03:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dXl5oVn1MSHtvZwlH+NvQIwSyHnFTQpHuAwir1q04Y=; b=fPsTLr3ngmCeHzPAOr4jd1dMMY
	dpcd9G4oUNxEeAPAPVQ96MTd6luRWCEHnKjN9zCJSlu365eNnZ7hpni+HhEgJv82zyTjfkAL5A8RL
	l1hHh6rh+hH+WgA56z3nMEM3FNbpNICjR8RaCtLaGnS5DK4zF26Wct0o7xhSZ/4l14P4r47WlP1Or
	bgQQqX8FvxfoYjpGvBCPvw+dgEI08bDLxglSjd5bLm8FqweoPZtdyv+OuhGZloPwSQ/n6W0FDkSBX
	H96NRmw+JXZ0W1bqQC+IlpIhEJqbNqRRUq5+iH6ytNqUrGEvfQd3q/yaRiqVwxawEyTC4OyLR2SGc
	Ecg4IKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxQN-0000000Ge9P-1UdE;
	Thu, 21 Nov 2024 03:00:07 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxKG-0000000GdDQ-0EM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:49 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-296252514c2so385330fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157627; x=1732762427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dXl5oVn1MSHtvZwlH+NvQIwSyHnFTQpHuAwir1q04Y=;
        b=ld8h+x+YuH1lds5LLykBWGyf/Li/dIkuv56JZtetZUZi49UBPEtkzdjjwXeaxFFFgr
         M8TTwh0cmdV8ywaqny4ZvOZIeFw+14/AfLwiWAj4086zJdIPxsUQi0nfPn03vWdwfXDh
         a6rkcvThReopMqwQaIjvFrhj05khkfMBLmwqpItBiqjRMJFi869T8/EdFGQDEx5Dyv+u
         /P9DTuA0FoW09MY3nrP2c+aGHdeo6ndw4hKCkJ/3mHCbVdOvVQ1eroZY0tuQArLpXy9n
         7/W8sSNo5df9/JWN0BtqIq/UTe6w/LCuXPzb6ZKzIezV2p8Ng0ITwAZfBXMiTxNcfUic
         xlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157627; x=1732762427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dXl5oVn1MSHtvZwlH+NvQIwSyHnFTQpHuAwir1q04Y=;
        b=F8TosDtVLLm3sqamJ4I3kP/bojTTkXZgkOVKhryFcRTjTnN0xXTfzyPyzXXFpbW1Q/
         Y5Mts9/FyVagswK3duMKz/cE7SbZNTtjDG9FcUy6adt7a2hHGhnYllJps4XC0KKjGVSn
         IDFZ7IeYVqZowJbHdJ3NcTV1Y+FaTBFdfCbefu6wkPuh8MdEFSmiBJNpbD4+w9iY5mQd
         sKqA3zCfAapjhZxgDX+EhMQnlYjMYkx9lVMDAHrfc08e6xL4R4UQcoMhAk47VkNhhNaO
         /1UT6Bcle0NAmjj3WKlzFBGWbzbjsVeM58sCxQwO4Nu3Pp7mysvYZmS0SGCouaWWBlyd
         AC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN63qEI9kwJRgEBR08h3Zv+6C2eTgRPm52l7k+FT5VElVJ/cIhYi30xjhngdoF2Z4p5N4K8K+bj7I4CaQWBLyZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkM9QFMbF2Il2LJ46YtV4kwBbbNYBdfvQW85ptud5IP+FKr08T
	r+4FfBOBfaLqlcZX45GvKaDERSfB2XzMARbaqDZRseUHlidMgzkG
X-Google-Smtp-Source: AGHT+IGfUxN+yNPBtbcXbTFe/qYk+jbA7fDrMhXuaqkExtEYuXDRgyQhDfpiy7nwzeimN/QIstDcWQ==
X-Received: by 2002:a05:6870:d24b:b0:270:1fc6:18 with SMTP id 586e51a60fabf-296d9a6957dmr5514274fac.3.1732157626867;
        Wed, 20 Nov 2024 18:53:46 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:46 -0800 (PST)
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
Subject: [PATCH v2 6/6] ARM: dts: aspeed: Harma: add adc128d818
Date: Thu, 21 Nov 2024 10:53:23 +0800
Message-Id: <20241121025323.1403409-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185348_091918_69699045 
X-CRM114-Status: GOOD (  10.74  )
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

Add the ADC128D818 to bus 22 and bus 23 for voltage monitoring.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-harma.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 58eba5fb6262..947622ead349 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -529,6 +529,19 @@ eeprom@54 {
 				compatible = "atmel,24c64";
 				reg = <0x54>;
 			};
+
+			adc@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
 		};
 		imux30: i2c@2 {
 			#address-cells = <1>;
-- 
2.25.1


