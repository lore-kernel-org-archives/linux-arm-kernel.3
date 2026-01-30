Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17C7D49C6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xti7XG40UH6O6PxwKMMYsKnB+u1Uo2o6K+zvBRm+Q+0=; b=y13xkr6rnXcNqTTxqHK5c8YDd6
	ESI1Mbkar3nWMcUW9JMMIY3yNL023M8VrYVL6/wPXf1gllUW2gs1F+JfH517F1uAbKyjg/haDGCLc
	XPRQwstWq0+UYnZaPhUaN38P2csdD+7XzzY97mgVp96YgyQYzrUNRTrzaIvg85w1bfGlFB7jx5wsH
	4T+nY1J3pOmN3ZLmG/UdWl15xYf1vHQY0gtmObpGa+0WDpDHmkzT9LEZkmTcgmlP/gEj6bmMyXzt0
	18buay3JPIDhc3Z+2QTISRZdwxMCqIU7F5oKlY5kEAXemFIgIadTfWcU4tJkHaPP4XfkpBd4MvzNR
	5M2r2SpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljkI-00000001CgF-2xRy;
	Fri, 30 Jan 2026 08:20:50 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljk5-00000001CYQ-2o4I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:39 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-81dab89f286so945832b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761237; x=1770366037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xti7XG40UH6O6PxwKMMYsKnB+u1Uo2o6K+zvBRm+Q+0=;
        b=X4ek7pTf2bTd9qry30HPc8JUJXE5Zf40TU/jQhGLRxiRm856qMTEpBX3jAWlNFrLOl
         Vw8KmfVWYS3G4xSHstbAxpck43umNYzvAObZKHuUQ7kUvz5fNrywzuz8VPCr8+WHGDQW
         +i2mHU3ZIkVkel8qU4v1ZK3lku2baKBk65f/UKo8brEPamnrRkqA3dzHZUOcBMIvhVMx
         60dpPGchwUypWZnILVYl0qR4lZPvkOgFjM70f9yCZQRLyfdp3CJRAVR1xMrF5TZKYvAv
         aDOKWhOP4OOzK4/k/VnSu35sndQIoHfYLPiEqohv0nIgtFwclmVcfMmbx/yQ/S70vWpZ
         IS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761237; x=1770366037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xti7XG40UH6O6PxwKMMYsKnB+u1Uo2o6K+zvBRm+Q+0=;
        b=Ok6KI8yp1LRoAFeQEcd6560lA8jCBXbGU7emBOUKYwckiKHPDl9hmQZdsfFPk1yxZr
         mT9YK6kCMCiIdSS3isg2zi+CYIpx/nf6K8+IWnCQy+2VJz/rLVueSBkcQshClCajPORJ
         89CpggFjN2noFG53b3l2yKXPwkF31DOvrr5baKG1Go5Mumo0kz18C0RnDqZmQRPWlAEQ
         Xplu5nZBa+MFWUQDwPYOIKVfQvGI33pX4TAZ7dn3Bo9yxpnKUf8TZBdW2G92WjYjyl1l
         cpp46Tf0ijHpVs4V/ZlOxL2G03wJzv/M4ZW0XcvO8CChqI8bn6VVfwrkHnb/H//iXe8o
         OThg==
X-Forwarded-Encrypted: i=1; AJvYcCVhNWwAd152gEkZgDiuaNAHUfbbNgdkirSLyWRunwe/EyFJtRi++o3x+DQ4c9WByxzcZJACc8xIOPQtn7Td3Ku/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs0+PLmq4lfp58FcQg/sWOWpYVjiKz0/7j1wZf5DxJMmb0rabV
	JUeI/C5YG5dI8J80MV1ZQtm2Q5XUxR/CsQ6ibpZDNUIWzZxIbBg71WJL
X-Gm-Gg: AZuq6aIK0mHbm96EuYzmHC9tgLuGp+KRsinBWx8mKQ0+A7fpW+S8A2Ly82L9eSD4qFN
	4O//FPrcAZGdWooBfNFiXmkTa9SO5JxqO/+U+rKIHjltVq7fRRNsEiYMdAMFd/4jFO3heKajM38
	AtXH+cxPMAoiW6AiCEW+xvBtm1bcD3Un23Xd737GjJ1V/aQK2xucqmv8Ec25xNIII+LNI1i4gh2
	KpV7iiqR0IJ35192temy5kv5tMyQRIRuj8bySyRCyUoQCHoOKpKC5sZHqjjTg6MZqektswNdDR1
	MMM8iXS4yz2TmnS7LPQK7wbe0+ExOCUU+mGBzqbX3RwIVxJMZvaLqN2eiYUug5gujJPAr3TBfCL
	LifQfivIC0imL25RjcND3PzRhnaEA03NdbMC1wHSVhuqmLc1Bkfkc5L8nBFziSz3sR6L9tZdzjB
	nQ9EReKPRnpJarKR9OD9b22ugsxIivJ421acwhMw2hyptVHISbyF9mEIAZXjyYfAQrMSxbh4v9M
	q3rcOcAfLWlyxO+ydatNlYT6zMAL8I9irv9gW279Zxi6HES/7ZDPzUon9nJ/Om8mnpIw/dfdb6h
	X4OUyiVzxH7r
X-Received: by 2002:a05:6a00:8015:b0:823:1570:1e81 with SMTP id d2e1a72fcca58-823aa931c1fmr2112930b3a.53.1769761236703;
        Fri, 30 Jan 2026 00:20:36 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:36 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:15 +0800
Subject: [PATCH v4 7/7] ARM: dts: aspeed: yosemite5: Add debug card bypass
 GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-7-4d924455f3a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1580;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=e4DAb0AqZOq3AWW4s/35NURRVqdT9q3pcfBbOpjvHRI=;
 b=yNNqOLbWXzjovfNGoeiqX69Gh4ImH0IhqpGS9SQJLT5J8mWHP8GLT7wzQeD3n0ODQnXvqfxFA
 zuNXkioHV+6B/q378yqFfgfHcbHvMvs1UeN6YOZWw4vWEQGt3bxi+b7
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002037_910924_E139B62D 
X-CRM114-Status: GOOD (  11.64  )
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

On Yv5, the SCM CPLD bypass OCP debug card commands to the BMC.
These commands share the same I2C bus used by the BMC to access the
SCM CPLD for firmware updates, which can cause bus conflicts.

To avoid this, the SCM CPLD provides a bypass control GPIO connected
to GPIOO7. When asserted by the BMC, this GPIO isolates debug card
commands and prevents conflicts during SCM CPLD access.

Add the DEBUG_CARD_BYPASS GPIO to support this behavior.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 48f864b52d1a22b12f8a39ba9703a90349ed930d..61e78d5e712ff45e1a0691979b9b36408404cd2d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -166,7 +166,8 @@ &gpio0 {
 			"led-postcode-3","led-postcode-4","led-postcode-5",
 			"led-postcode-6","led-postcode-7",
 	/*O0-O7*/	"RUN_POWER_PG","PWR_BRAKE","CHASSIS_AC_LOSS","BSM_PRSNT_N",
-			"PSU_SMB_ALERT","FM_TPM_PRSNT_0_N","PSU_FW_UPDATING_N","",
+			"PSU_SMB_ALERT","FM_TPM_PRSNT_0_N",
+			"PSU_FW_UPDATING_N","DEBUG_CARD_BYPASS",
 	/*P0-P7*/	"PWR_BTN_BMC_N","IPEX_CABLE_PRSNT","ID_RST_BTN_BMC_N",
 			"RST_BMC_RSTBTN_OUT_N","BMC_PWR_LED","RUN_POWER_EN","SHDN_FORCE","",
 	/*Q0-Q7*/	"IRQ_PCH_TPM_SPI_LV3_N","USB_OC0_REAR_N","UART_MUX_SEL",

-- 
2.52.0


