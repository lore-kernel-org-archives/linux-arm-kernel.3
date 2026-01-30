Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1CCD49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=; b=tQck25xJyDRWeVFGBRyYIMwpIb
	NkEJWkEpJ5SJ4zc+p3V2IAdy7CB6k6Bk/87Utuy7ratoUwX405WNknopne45YtesR3GTjhvQVoTCk
	XuxwjoPkneDJ65CaZk3eRWcegEB3hT6OHLhc7FA5NnfcCuwsHHCAjXHmjtYaf9IhfXVFeHItR4Sml
	z4tdNXckV5tU4IRcIkXcQtpRoxDglQdaUYLbmfTbpF16oqqcYHjjQcqeZJA872GxbocTPSw5PqGnI
	XVKG6KsN6OjWGDsTJhwKEV7BWXAyLUXfF0mcLil/MPr/sov0QmOyzy0vo1cSXpB1Eebji3lTzeTTk
	crApju+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjs-00000001CPR-3lBb;
	Fri, 30 Jan 2026 08:20:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjp-00000001CO3-3xCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-823081bb15fso1026980b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761221; x=1770366021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=;
        b=YVh7W4k3QwkXASZNqXwnn0BIR0FE9VMBI8Oa6/qfhitHlpEBPoK7aOO3Xb8doATdXO
         HwfV0fbrLgrers1iJvlsLC4MCE6rtAA1KOUxA9fLARbncDTx2GlW0b6V68bHKRiHkKZa
         SOcfz723knhLUtJRVkkhaT71oI3zjZvUCQ9boiquLKGcVTQu/A/VQ4MevlVUEHjSlllM
         qau3Ny2IRpHzvJT8THYqYKWoWcCWN222VWoIM9/fY6QNiZ1VrRw8qjmLqxcIzViU8QxD
         Fjg6xUYTVhUPgB9GacKcuthMdOR+tSbOQpiYdCszEzccXVlN4/vHGS4YbxwUuS/h449d
         9NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761221; x=1770366021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34Z/wqK33nY+/r9/my4gnemDx7jJlFUXcUiWHmEPYyc=;
        b=C5Lugq6NgKUXhxl8Ywh+HvniFpdxqsFmgLRpPW8Mpous+UNHjloAnf90zrMOCbchj9
         YVBbix3E1pGFwsjVijYDh/4LtKMtDZkO0KgRCvqETq2BcsA/jGdvul7dK7P1cGkjllqC
         +eVj4CnBqgq44Uc9M0bTs4sD31dsDFExMGHzSOwmgcHxoSOtnk6omX7WkgrEMcWOWf3p
         a6AGWzvejcXDK81Ta8JhDt3AnUmuY2O8rnPWG3s9KpOmcd0w69tSt27D8Xm/d+lGwuqR
         iJLDUb5JTBuwdO3qjLv0psIq5/AGGnkQ6xPGV0SpR+IPwuuHZyTnC0J5bUZNMjF0lKhU
         y5GA==
X-Forwarded-Encrypted: i=1; AJvYcCViu5byifys/0raOApzyGttt55utiDL+l9tjbKQD8Lu96HiWG6yaJZQoMv6EmNtUrHkbWaoS8RXaVjmQwSN25ai@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5c7mFfu1P/RoC/Xz46l9cGuHadG3GO5S0v9+DDV4CEHwSB3yG
	/wWqdqsXpzasnZ5bXX2w/7lXI1JpnDEvx8xcewyFrtq1DeSN53w/jamcpMrfKQzc
X-Gm-Gg: AZuq6aKrA2Ef19Zoc8qlNchJlVJ/kW2YESVatctAYkFElu08aXQsV2G1TxyFPqx0XY0
	DgGbkOMtACxT74NZ+FCZHAA4+aEtLznV7D3MIZhPKmfzPnHJ/SipGiSbL9wGpJmMKvL1hvDfG+H
	kfKBUibqqjYy4vFb05lhO7ZPfubtftqO89QhSpjqd8vHu9NksiNDccm6ztOsmd8GnT9EaHiW2r0
	6rMA7piCgUAmb7IQ9/fvi8sDeMtERVa5JfD9QPTnjt9LtYKRFejoeUpVe4/N5nXfq0HdMplSuji
	SaYcu6WWvb58B8v5cErVL4Huvkfllhbqtxzz+36+ZXxeBPYx/3xweiY7m+1TeA4Z4PaXj8RQjC2
	vIg6ZCy/HKKXFKsRAFtuvpxWM/tahZV/eNTJ9cCLflUs/ep7xY3yxQ9SU04JNke7UqKWDgajKeQ
	B4rbuqCbImfERXWb4G+SAJV4AULZJDtjb8qhxTmAHbyGBUF6RMbz4TBbWZG1aanoMYXz86j9PEK
	ih+Zm+lK015sfh9f17au8fvzOoiFCymDH6ZnJgTlPo2J3SyIeIPpr+Ftdzsc22Q6UUuYa5HexC5
	gTe8DLL40dF2+FyVOUnqNNo=
X-Received: by 2002:a05:6a00:aa8d:b0:81d:a1b1:731b with SMTP id d2e1a72fcca58-823aa43ff6fmr2318436b3a.19.1769761221359;
        Fri, 30 Jan 2026 00:20:21 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:21 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:10 +0800
Subject: [PATCH v4 2/7] ARM: dts: aspeed: yosemite5: Remove ambiguous power
 monitor DTS nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-2-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1501;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=PuGP3tDDyva66stpyd0PfJUp+oeZiyMMNMGNoISiM78=;
 b=TkgsjuG0FPDCBBvCJEU7Gmye4sri5zyhSShXC2Zo/dGNnIavQka/xIB6cRiuAZMXqkNlek+OQ
 Mx0ZU9FdwbaBMNc40TTDnumCuh5KoS9T7cuzDeDg5RYpSsyCvgV7BG7
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002022_040000_4AFE6D54 
X-CRM114-Status: GOOD (  11.16  )
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

Two different power monitor devices, using different drivers, reuse
I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
Defining these devices statically in the DTS can lead to incorrect
driver binding on newer boards when the wrong device is instantiated.

Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
selection is instead handled in user space by the OpenBMC Entity
Manager based on the actual board configuration.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e64571631b7f6944f26213 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -674,20 +674,6 @@ gpio-expander@22 {
 			"PWRGD_P3V3_AUX","ALERT_TEMP";
 	};
 
-	power-sensor@40 {
-		compatible = "ti,ina233";
-		reg = <0x40>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
-	power-sensor@45 {
-		compatible = "ti,ina233";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-		ti,maximum-expected-current-microamp = <32768000>;
-	};
-
 	adc@48 {
 		compatible = "ti,ads7830";
 		reg = <0x48>;

-- 
2.52.0


