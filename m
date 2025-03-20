Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99034C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQzvCjPUeOUJnukhemcSwQyPEPsAauix1Um9a/NqgjQ=; b=JKrl+j26EUqFcFj/DujCiASxBM
	zmX8FDfVJXNBDicxAMuhWD8ks/8HOZmLetKmBxxQ+zzufj6Y7BvMha6+kspOSlBmlhgCN+yR9DWK9
	R5MHJeWZJYSOa1pr4XtNI7qWLSnxWhYxNAYmIJPW3fudrYYoV+h7aOa7wabchA7BGSwXiHJXAJE0O
	6St1MfltmL+INHFhAqNKW3iGyJSdFwQ+8edmAcoVDd2AJBmC27nu1zs9F/SgizbWp4iY0SaDPeCKw
	Ec2Ug3c1BtQjSEut+64CGHc0HiFoq3tMXe9Ie4wgJ6fZ8IZxLINbM9mE5I5JQSeHUMy6/WvnvnipA
	qciXkdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIM7-0000000CbrQ-1uTb;
	Thu, 20 Mar 2025 16:02:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHlA-0000000CX3D-0hBp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22580c9ee0aso19764305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484279; x=1743089079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQzvCjPUeOUJnukhemcSwQyPEPsAauix1Um9a/NqgjQ=;
        b=hITxBX0k3dL/uADweIEMZjlN3iKuDuHfR60vd2hnSK6oeXi1SuRUxXKhzhewS/hEjN
         3j+FDWxvUpZW4GVfNfw91QVLcEGnYbMNxpOZ7okS5ZlZ7U9+GqX0qtz1/Q/JVrEWP4Te
         YKh+xG3pxBJKKAQKkTuSz37veCh8BhRm0ofceV1fTFPwZCpyHQbFvmPhf/JnALVJAa93
         Ys5mtaNqLYqPS6Km9P84PUUDrwxO6nWp9Bj2Pe99QrP/6gvdkq9UP0pKyz63s/6nHDtm
         82sRro+P8bDYbNMIw37MMRnyaJ4Ry3TFj5wxM7TceS1nW23PHeVwm2L2CJiD7bAVjGHn
         64Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484279; x=1743089079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQzvCjPUeOUJnukhemcSwQyPEPsAauix1Um9a/NqgjQ=;
        b=DVKXzIyIDs5T384BSZVNw2GusnfMGpvFbHMScOrdz6r7S3YX7fbsChOEnd1E6WVOen
         A6NFg3TJux3zaogpcPfyfw08qD/6B12Ng2Vk06J6WETtwm44zpkfCsLirTUcHQ9hAmlO
         gKDJ6d4OrgmXqqxCxNuTTmFB6aW01pJJg9hkeU533zKoPkYQkmZ/WdG1jHhfAX8MCN3H
         DwoSGNLL6giGDd2noJVOwhAh1BUUYnWYshoMq7Qh7x2ZWLp1p3ZfFJlvVk81+X27/xdJ
         yUD/URsPyzuXN1lZkBZ9MrUkJmoC+vTTALHlAbDzZaB6WzzLm4YlEvlBZez30hz0iz+q
         H4mA==
X-Forwarded-Encrypted: i=1; AJvYcCUfazNG2PWkH9rMIqrLZZrZi+9iZK3JOemtCSCJn3NAtXBqOqypZJVXtHB8mTpG3mfGVZVbhc9O3zELFIiIYX96@lists.infradead.org
X-Gm-Message-State: AOJu0YyJSIx3ALav6eVqGkEcpm10wurYrNn5Gur4iKZwKhKPVlOGTqNP
	xBa+i4xwhIu1zPHmIMLRkfiPgZ4hIu+yFlfP8jntpP3vmYMpsruH
X-Gm-Gg: ASbGncut3WYLAEoX5+zzsJOhgJNOWIXDno3aOV0dSBCwQQfHZJvfC6/xw7I8TC3iTy/
	90u4RDNeKvxj50qX1kTkd5CUw1btGpfjLSJ0LPkvOOVY5DJ+Pkf3/NlTqTpUJxxTTcs+PzuMZ8t
	mVIsy3CWWglAMzwoEgp5in8/OSh9dGSWTkM2kAbrKBQCXXtd+yuvix8UBDenIfEuiojPrDcLTQP
	CslNciUAIEQIsLg6HDFYxZz1k1hTX71hOJnir1xJzAPvuftVn4clHq1su6QusgMctV22oh69Unk
	ykaMczIRzjKtPdv8DVBPUnsRy8JO2PLyShZh+P1sOrcOuA4Z9nYHmcFM+BNCa4j55XUX6bMJ1j3
	o2J4LcQ+rkQlSDyaQ8pj0Lg==
X-Google-Smtp-Source: AGHT+IEWWSWYQnuesBw9k5f26MYFCg+MyUeosBtDDwCduhJQbl6yXVq5xhb2uSlQ3VFKw1iUppK38Q==
X-Received: by 2002:a17:903:2985:b0:224:1943:c5c with SMTP id d9443c01a7336-2265edbbb2bmr58534865ad.15.1742484279224;
        Thu, 20 Mar 2025 08:24:39 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:38 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:54 +0800
Subject: [PATCH v5 04/10] ARM: dts: aspeed: catalina: Add fan controller
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-4-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=1019;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=tF3QpIdL5ecs+vvtM26gTlh5RwwxqroHT4QqK6Ir0Oo=;
 b=kiFXK8/gH/YJo/qFRHAElfjdPtoGC2XzQKFNmKfgU23jH0UyyUTD0SljFBP6KSEHH+MbMRgyc
 GBEZb9rT6+rBgUvAvOaS8LTT/r3wVhpMpx+DxUkuO6im9ysNBDbQLfC
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082440_208901_54607D30 
X-CRM114-Status: GOOD (  10.42  )
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

Add device tree nodes for the MAX31790 fan controllers on the Power
Distribution Board (PDB). These nodes enable fan speed control and
monitoring, improving thermal management and system reliability.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index f5f47245796a..fd22add90449 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -466,6 +466,15 @@ i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x2>;
+
+			pwm@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+			};
+			pwm@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+			};
 		};
 		i2c1mux0ch3: i2c@3 {
 			#address-cells = <1>;

-- 
2.31.1


