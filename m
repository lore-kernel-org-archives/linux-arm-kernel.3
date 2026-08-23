Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D7DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 22:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=; b=V927+86buMd+ZsBRA8umuR3uz8
	0LeJqomccGFtl9SC9TfIkQ4Cb5DH+vZF4uMVD9y6J75wf9mgCZBARm7oEyZxl8Bqwiu6FvFhl3tvt
	tjfzqZYUWy76tfGx2gjb+AzA2G8qHs2kKcdW9Rlvcsioj9/S1T3u13PeodbmEyO0UzzEZT1aB7LtU
	jPS9uVu8IsN9BZMf6WNrnrYiYDfUMAQkhWa4NOUdE+0muibhO0MfCiT3J1Hob1LfDW0PdSEubVXqi
	8F65SmktVqXwqr2z5BedUCTKzTaSKK+9oGV1Kxbya0YTkQt9X9r7fvpNTyazCpBo/3vjGh4eHxJck
	sl3jiMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyH7x-0000000FfKH-0D0r;
	Sun, 23 Aug 2026 22:57:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyH7t-0000000FfJZ-3Exj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 22:57:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2caea3f742bso44859945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787525836; x=1788130636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=KBAhbstVm5Fru4EFgonDqYI+JVs1f+6Ny0MCq4YRJYOS4fFmZGscVDqYChRWNaMAGo
         9sQX8r4rX8hCWoK5Y9Xj+juLXPLvro7E4fmqAif0yXrMQdaXeGxoSYMBEr0r0Osn93QI
         iHIv/pXSTbJtenPqopfES2FcMqVKeP4z8cZsakNRAswCHjUpgNsiYRKPmp9T5p7JBQp9
         W2Ro5BDvpPQhUIpq/O6VACkU2HmmUHXDHis7ixAtHFyLGpS/5ScXvOA7Cjux6Z5uR0cL
         eTsct0RLNUrArC8egawe+NbbxYdM1j8XFlrUmGPKjnE4Qa3NbdVtZM8L1bIJaIV3XxvZ
         1Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787525836; x=1788130636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=OxcZnI/SQB0CDSkN0ZFkn3KCsIYWqVVTxuMOXNC29FhcPL1ss09dP/jOtucVuJmEad
         hlOCiwiz8mz5rQNHdJJEw7JbOYKl7BrdMzvNg0D39nkotq1spIUCLwFUc9MdrMCKCMKE
         WRPQfChsBoFwk6/xb16m31sJ/pb3he4buWl3Fdx1sFru10C5h6J+V2mCzdl+xZJaK8d9
         5nqctFpm9Xq7Ahp1ki/pV4OIU6kc9fBNFwc8CgqM0VjcNY36zCwOL5Bk7KLGup4chptA
         KCDV/5634zJXtFgj2tvO8JhxGWeCTQu3F9VkcaKe4Gnbd/sP5U6rZlOLDCg0mGrsn0qO
         E2Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2fA6F3Nfh/lMJ6v8YhGEaZTA3cWWhfL9W3PJ8ivwo4lOh1pHzj6c8DO3IpryrfGVG9iM4ZOI1XPWXGE7g1hHQ@lists.infradead.org
X-Gm-Message-State: AFuF++naJe7jQ0f2ObFqUU1iUnykOqyRhqk2pDDfOkG6KSu1V73KWfSi
	7MxaImxJ38EugafnMzco4pWvlaecmsCAu1cGwOlKBe7WBcgg9x4rH2kt
X-Gm-Gg: AR+sD10Nj1CuraAfZsDyMM2oLWDi7VFXdFUB8tLZYEv28OrjbAF2p6RopZiu+lJJKtB
	u6tvHVbspy94Nfnqc3uXyR1rcAPNLLi5LkOPrcMieM+xD/KAbdY1RNCwad/wC+s/LEobjxuUujT
	/gsCrU3rEKKm/NTN3Ym/CaqpaVcdAyAwB81TlcQdMQHSYToRnDFZbnFgkAVN5wiPv+nf7szlkzW
	OFz+qNOy5jO5uXvogzEov8/E//thgLd/V8gCKzsUHrgVFqtp8Ej+GgH5VWi7kaujVw9wCOFPKtk
	HDRmbANVobCGStzEMjX5PAS/EisRuUOjAdbt8PWAsiflVO8IN1Q7mDDyMi3n0OAM8F0K3jDQpkX
	IC+x/hHrW6oUdAsSgxdU9F1HC1RrGOBmJhZ0zGb9knrLILVNT2P3kZPIXJ3zSu56yVcWu2fvBMs
	z28ovZ55zjEkVEUh3jvMXq9u+KxI7ARrlD99rWOkwowN5MuxOE2mtEpiPFO0joGEnSEmj7VkvGd
	mOTEYmBP5RI0ffTvpczNxfAlIFBeFI5X7JafORx0Y1qedrkTlQPfCgLIjIfphsVoNLIWMOidePx
	uLR4PDyMHp/dkrI56ekCAEgJZzVxtwCsyW5lNkXVhFCl7/0m
X-Received: by 2002:a17:90b:33c8:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-395c397f4ecmr34800142a91.15.1787525836228;
        Sun, 23 Aug 2026 15:57:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9174be7sm3416564a91.3.2026.08.23.15.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 15:57:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix lm75 supply name
Date: Sun, 23 Aug 2026 15:57:14 -0700
Message-ID: <20260823225714.33938-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_155717_815061_DCE919C0 
X-CRM114-Status: GOOD (  12.51  )
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

The lm75 driver requests a regulator named "vs" (the +VS power pin
of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
of vs-supply, causing the regulator core to emit:

  lm75 0-004c: supply vs not found, using dummy regulator

Fix the property name to match the binding and the driver.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..af96d27e7159 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
-					vcc-supply = <&reg_3p3v>;
+					vs-supply = <&reg_3p3v>;
 				};
 
 				eeprom@53 {
-- 
2.55.0


