Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549CCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2/FZLzoVxADBjl0oAzsk6lNUq7prryi/YMGy+b9ziM=; b=Sn4VTcn4oj06WV2BlrGs7Sm0RI
	6+wMA3LnJLuntItF8N0NXJutcISJl7Y7MFWuncwxmwflcryGklu0YYB1qvLQ0ghvVjtXvGOWVtICk
	9Dw1+aY9P9rCTzNVVqeDBpCCBYGdH2jXLgRt4z83KS+VRL5nqO3Q+pT+WlkV/Yt6Aoukaoz1ENuoN
	ns1lrGs6yjrJTX/Mnd4EeEeElzKJutWiQfmxb/GD853gwlEeDZiXImEzrRp/Mvk8OeYY3ZtEDhH2/
	jWLQB5EApEWwiq9zjkFtOh8ei525ErXeW4pz8Bwdw5ZzAnPfLhUX2F7ZDsvieRWjASEzkgZrFC6HA
	G9DAvpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Ms-00000000mvf-1lp0;
	Thu, 18 Jun 2026 07:40:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mp-00000000muS-2MI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:40:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso321462a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768451; x=1782373251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2/FZLzoVxADBjl0oAzsk6lNUq7prryi/YMGy+b9ziM=;
        b=eawvzXMvCpIb5sZhZYToA01XloBwhIyxcvx25pdKZdixPka/eNd3D1jK+P3j7F9Eju
         xjbMhEe27k0awx+H3ymbjWKyihMXZux16TwCv1nu5W8L6kxxHPJytbh+wLcgHSO6g7j/
         aX4jAaNfMnDvGpLz+RibrMXAUfyv9TIkXPCOhNwAr9ow2CTRWjhUobm7D265AqxbUvOF
         PqUgcn5NX3JILv87jXWwnGndKdt1bl9i4dHKn1ypZhwsK5pvpvlxBpB3aQP9r+TjkgbG
         eVP48EknD6psvbzBeZRrvIhmWsspTFzXSiyjgyzv/0uoootK903RDLocArb5+y0U7yuL
         NuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768451; x=1782373251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p2/FZLzoVxADBjl0oAzsk6lNUq7prryi/YMGy+b9ziM=;
        b=bkp8KN1ayPOe1CLNu6U1P+5se28NpNvSj0+/PSMhsZm3ZRqnpDRsvnyuWGPT3EyTYM
         j+Aq9V4f6V6tEQQdi95QQ7m4rXHp/PJc6pxo9JX/6iAjKvg0c34v3pql/09YwE4eQQT3
         2gCKp5yuLurfbXZoSLYPFJxLTizjlGz+qnmjLhlfAX6Cmw3LmWDUXjhfaVACQwkaZcgG
         T0UF0EmQPkhJsRTFcJmfAP2EgX/QlsTr0t3Z30Ls0FD8m98qtenlDMto319h6qL+U/sC
         LemICtqVzyB1N0y6vZJs2fgVazA6iQLFCfjh1ya5XKP2YK9bVaPLpQnKZbfkGShY7TmF
         kS7w==
X-Forwarded-Encrypted: i=1; AFNElJ9SZJtsOC2F56Mme5YX3SduEwY7fxM9TzUz7qrWOUA6W0Wx6EBQl6f7kgMmZrl6OnmfX439o1vSAcP1TiLVV6Fa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8hu6l8UZkctALWfEuIwDFXQryNa8dVqvdwn1lwi0JqRe3KdmP
	5XofCgsob8RLCV7Ha62Kg8DM3IPnE4aUECPPK2RoIQmJ7XDTgFxh8GhN
X-Gm-Gg: AfdE7clluNRnIi7hX8XmqYu04EHwaw4vzbZuOJjPKHWrPNh6xMeN3zvXVvZkZHHj/8w
	Nm7g043mXd84KrMhzheBAiyIwYj+ewpdyJf4CBl7KmVCduF/TBlJqTrkJPs2KE1fu78/IHZCbH3
	pS1qcW6BvplKJfbUs/xkH7gUwKlh/O741o/StwPzdcyM3TUKtMwFnit11q7gKtPxzRE425dAZzh
	klj3PsT6TcSctmsy94fnGHoCLXW3kGkLPwOJ3w6oHomxJVpK5NLoKHNzEoMZ3hndVrUSRmrmdOt
	2Ivd9p/+PjB4QA4EjMKtqLpvjubWjZJPZm9PrRB2rFXs0j08jBXeBu7tIxHno8bOvSTB1woGy/K
	aLZ6enMLDcJG2FB8KeePPDDYf3EIgkeGfgseTb4Ri4hojDoudGTXxmbwKOBYcDOG0/uioOj5fyW
	ua7z0viuQ/8/6TcAqUvH9l7sgk0777Y+cM/lPA9MX5XO2XvF1nTTb6JhH7
X-Received: by 2002:a17:903:2990:b0:2c0:b9a1:6493 with SMTP id d9443c01a7336-2c6bc0b5814mr75341575ad.10.1781768450629;
        Thu, 18 Jun 2026 00:40:50 -0700 (PDT)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm170465445ad.39.2026.06.18.00.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:50 -0700 (PDT)
From: Mike Hsieh <mike.quanta.115@gmail.com>
Date: Thu, 18 Jun 2026 15:41:44 +0800
Subject: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt
 resistor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Mik Lin <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mike Hsieh <mike.quanta.115@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781768507; l=1735;
 i=mike.quanta.115@gmail.com; s=20260522; h=from:subject:message-id;
 bh=IGy8dSwMRvN0RUNzS4yQN9vBjblujibQ6wVZmTxzM6A=;
 b=cbfHOcPtJb1bDBHBy3LMkGMxGonf7vsB8e3wJhKElSpx0qCCCNUODeAjxlx7HFfDxdrU3ZWvf
 Iz8Tq3lbjvMCBCJfUp0WenMWljz5JEkNQpngeuvlpn5ytFygSFQaUon
X-Developer-Key: i=mike.quanta.115@gmail.com; a=ed25519;
 pk=DRIErV0xX0KMBlR/irAsbuN4L3egitHbC8FHruUH4HE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_004051_610651_BBE32CDB 
X-CRM114-Status: GOOD (  10.48  )
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

Correct the shunt-resistor-micro-ohms values for the four TI LM5066i
hot-swap controllers on the PDB. This ensures accurate current and
power sensor readings from the hardware monitors.

Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..3faac0925a79 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -450,7 +450,7 @@ pdb_mps_hsc1: power-monitor@10 {
 	pdb_ti_hsc1: power-monitor@11 {
 		compatible = "ti,lm5066i";
 		reg = <0x11>;
-		shunt-resistor-micro-ohms = <763>;
+		shunt-resistor-micro-ohms = <1000>;
 	};
 
 	pdb_mps_hsc2: power-monitor@12 {
@@ -461,7 +461,7 @@ pdb_mps_hsc2: power-monitor@12 {
 	pdb_ti_hsc2: power-monitor@13 {
 		compatible = "ti,lm5066i";
 		reg = <0x13>;
-		shunt-resistor-micro-ohms = <294>;
+		shunt-resistor-micro-ohms = <321>;
 	};
 
 	pdb_mps_hsc3: power-monitor@14 {
@@ -472,7 +472,7 @@ pdb_mps_hsc3: power-monitor@14 {
 	pdb_ti_hsc3: power-monitor@15 {
 		compatible = "ti,lm5066i";
 		reg = <0x15>;
-		shunt-resistor-micro-ohms = <294>;
+		shunt-resistor-micro-ohms = <321>;
 	};
 
 	pdb_mps_hsc4: power-monitor@16 {
@@ -483,7 +483,7 @@ pdb_mps_hsc4: power-monitor@16 {
 	pdb_ti_hsc4: power-monitor@17 {
 		compatible = "ti,lm5066i";
 		reg = <0x17>;
-		shunt-resistor-micro-ohms = <381>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 
 	pdb_ioexp_20: gpio@20 {

-- 
2.53.0


