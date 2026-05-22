Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE6CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tej9iGmEeYL0OIyPsT8v8gtxkPYs+lwa2cRb16j1/fA=; b=LwBxjw8lQz+Q0ACRmcUy7Ey+mm
	hGBBvhEzh8dgw04zKbaJOiJHimT+40AzpbcoB07lD7KGjgPEWhz60QJLX+dMXfRUtNzvppYwjBwQk
	M6x1sAf1VrAZRxQoFgxpQZoHWcIkHtaV+A1cQN1ZVJXxwZUEPFDe3BwZlWhA6j4GUN4HqUwHtZpQk
	PC/hayopoKwHj107VOlokV77O6/6NCXvNRIjuHP32NCgqXLEMvRnTOPBEebRtgfGLkDIKVm5wkH38
	LV468oGqkR68bg6E8wtqhGx1MGf23J0bgflt0bLeX8j9bZbwl7mI394Pwmw1/0HaUDLebwK8D4pIH
	9y+F+2vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMn9-0000000ARSC-3JhS;
	Fri, 22 May 2026 10:07:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMn7-0000000ARRi-1xOb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:07:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so7647583a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444460; x=1780049260; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tej9iGmEeYL0OIyPsT8v8gtxkPYs+lwa2cRb16j1/fA=;
        b=ZJ1TVzwlIuoMJgIOxSXM4ZcdwYPmVtDbH3hYAtpUhmbLy0EEM7i5kQXkfD0/jFc0p4
         PGV2McTwJJNaiAwgF4jlg4USpH1UPQWBPtC/SNrSuNEI7H62NLnS+AFMu/Zi5vKszZXw
         Xjt1MA3Fpg9cXDdLTJyg8UVFDbyPfjMlfjyrfj/me4Yd/AMNeC31t4QHBbOyXEQeVg7N
         NWuTq1pBd2juGUcjXE4CpMlq7Efv+ejwYXie5bM4tihIBb8efnhhTJqhUx5gyQ/dM0AC
         m0Rv2FJ0l4k7k/ZsxN3O3VPGTX0dpXiEfKP2kgOLsu+hhqeBKBBAzAjwq8JxznQdZ7R8
         8JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444460; x=1780049260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tej9iGmEeYL0OIyPsT8v8gtxkPYs+lwa2cRb16j1/fA=;
        b=onhrAM7hYTyce36gI1tmwaMiVl+oPIkXqKr4HA4Fj2oBPqCbHM4xbVGe2rbhXIWWIe
         0+R1Z1T+/gN4nvYgiUUqltjBIKSd55SjiT7oznHjQ2sz1MEC2hdJM+CH7vpBxMDcCVbz
         8utIIPObTG9PZK6Y3jD5XnP1gTvE65RsZ0fw0SY2zl3C7LkNNanj3kWL2MTI/i1zMCUu
         Mq66uBY4Ai4vtxogHckOR2UGRCEi0VHKlXn7r8Mz3j/GeZw+FasNqMAxlMqGdnTk+YYj
         yoCptw9NV+09oBwvVT4NXJ9t9LQPY14PDw41jrb+nwRU/NRgDMwIkrJ8dootpOFEEwzt
         QPsg==
X-Forwarded-Encrypted: i=1; AFNElJ9hiyvXaeGRcovzTKVo/undwYGPR5G86vT3S6oTaIaCh9AuY36dZAQw1658PpDmOdfj2nvFcbCpQgJvxVzdEFfH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw09EVrzphWPYBoBDq7ijNLyI9o9TSqz5B5kpXzjb6tJ29QA3Nv
	KLRAHOCSPyZhbge/uP5DHz0bj4Wgqw+9S7GsEubFWPXvz9yK8IY/v5EW
X-Gm-Gg: Acq92OGgTmVEXqNHFGYNcSg7EPCFIx6XcUfuufulkcOMNSvWK898hEPU2pMZwLyu7/B
	AMhNHyRzV7LvK+A5oClxF8B5oQuCDWU6imEZ1OhE9ZdSQx3id47zPn7bCFlV+cOV0q9fi8pg8bl
	azn4974/p1TD0n7etsSmRb6CDqIl+efWbBzB+Mnr7H7iE7rhOryY0mn7V04GvESl1UfGlQO3bH+
	UfacEHIezrc84yXS9TUdnZyfU2syHUDP9FNfexvmWaTuJdbrVHaVu5k+OHMeM6JLqSqoMdIsKEV
	T9uNgeGJlVEA8cFg6KiTtEzF15ToSAnBWuwMgmOUiaJ/l3jHI6mqLtQEc/tCsMIuo6prbW3ptFv
	0oUkZsM0dzmu3oo5AQpz/y4Y+dCb12rS/jPZHYEUMOG71CeHnX8OA7qVYkHzmSkijjhUY1zBcsT
	byoTHH7/hy9HfE4E/Gbnb44v9Jjcll7MHpLyf/CZc24Owm8fgjI1wDremma+RRsYC0Kw4=
X-Received: by 2002:a17:902:da83:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2beb06a5ebdmr30510285ad.18.1779444460119;
        Fri, 22 May 2026 03:07:40 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm12578965ad.27.2026.05.22.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:07:39 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Date: Fri, 22 May 2026 18:07:59 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-clemente-dts-remove-iob-nic-tmp421-v1-1-ee2509a71502@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP4qEGoC/x2NwQqDMBAFf0X23AWzWKv9leJBk9e60CSSBBHEf
 2/ocWCYOSkjKTI9m5MSds0aQwVza8iuc/iA1VUmaaVv7yJsv/AIBexK5gQf96rEhYNaLn7rxPA
 wiphlHnvnHlRDW8Jbj//kNV3XDx3uQYl0AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mike Hsieh <mike_hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444505; l=2434;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=wtlP5mDXTH5K/7QxsvRUAfm1OYc62utepzzfVM0/B50=;
 b=KLgj3/Kt/F4ZL7TX8xSgNpcSgNFF5ozk+usyLONCgjiPTj8WwcI44UHldShUeFupva5JOA4mc
 aO2epW3mC0lBf/O70Ti3tjy+UUJ7hC8IXmOe9+Kts9QgvR2Hyd6G8Bl
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030741_515647_AF05B713 
X-CRM114-Status: UNSURE (   9.34  )
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

Remove the TMP421 sensor entry from the DTS, as it is no longer the
primary telemetry source.

Accessing the CX8 NIC via I2C while it is powered off causes voltage
leakage on the bus, leading to EEPROM corruption on shared I2C devices.
Removing this node prevents the BMC from initiating traffic to the NIC
during initialization, protecting the integrity of the shared bus.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
Remove the TMP421 sensor entry from the DTS, as it is no longer the
primary telemetry source.

Accessing the CX8 NIC via I2C while it is powered off causes voltage
leakage on the bus, leading to EEPROM corruption on shared I2C devices.
Removing this node prevents the BMC from initiating traffic to the NIC
during initialization, protecting the integrity of the shared bus.
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 2aff21442f11..820d39a92974 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -443,11 +443,6 @@ i2c0mux2ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			// IOB0 NIC0 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 
 		i2c0mux2ch1: i2c@1 {
@@ -466,11 +461,6 @@ i2c0mux2ch3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			// IOB0 NIC1 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 	};
 
@@ -637,11 +627,6 @@ i2c0mux5ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-			// IOB1 NIC0 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 
 		i2c0mux5ch1: i2c@1 {
@@ -666,11 +651,6 @@ i2c0mux5ch3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			// IOB1 NIC1 TEMP
-			temperature-sensor@1f {
-				compatible = "ti,tmp421";
-				reg = <0x1f>;
-			};
 		};
 	};
 };

---
base-commit: 6779b50faa562e6cca1aa6a4649a4d764c6c7e28
change-id: 20260522-clemente-dts-remove-iob-nic-tmp421-89221ba96dd7

Best regards,
-- 
Mike Hsieh <mike.quanta.115@gmail.com>


