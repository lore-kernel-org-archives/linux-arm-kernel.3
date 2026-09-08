Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3738CC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 06:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=; b=VC3VCgwhXGdc0kHxmH5QI+Br8Y
	5SmyvPuTaGUInO1OoZdH8ivxmGuel314mNqHu3w6lI5h1bNZj82gfeLfh3jhOdUAuY0pqZwmTCQdv
	F/2e6Gq3zpATFY/TmxmIZMRmkzKXe4STRiMKtX3eoxLr/w7N8zGvMfAP508PH9mR8v2jx6YRfqk9C
	EUlbPFPoHYqM63YEiqd6fjeSqeYiCnKwY+GwgZTBxu4OHFCmR7mSvjmnxq+iL4Wv0b3auxIIacL07
	mkLUDmUKLQk1H++tFUjb/Bipkm31ABcl0FX8s6tAkbH++eDNloi3bsb3izUOm36VLsX3ycaaliEGk
	r455K+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3owp-000000087We-06RI;
	Tue, 08 Sep 2026 06:04:47 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3owm-000000087W4-0da0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 06:04:45 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-939c25604d4so10618685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 23:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847483; x=1789452283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=p2I0pAmatYxtxdy09eLlT5ZxNDCoHmfBKGlKcGxsCdxxr7m9VxCQN17wsVzYH0o2Uc
         DNaKtFrkxR241PTRu4Ubskpq1E4q5vhzjmSDWwZqr2LCPbg36yUK9uGmeWqoJwR4EsDO
         Hh89TnTt/O06d+Pyjdh8hyJTcxHDq3hwD3GtkEAzqKZJIgw+7XL3UmjSEnwEDvewSxu8
         weLcjU/ZKUONVjG0G77FdXsxMZO3d9K0uH/5IY67M82vdiEXZPndHESMuOj4UmtzgLOo
         uG36BwD0D+d9L0DcgVt9k6Q7iv5jvXuAvJqoivVl1PfMVPAbJaVY5eN1tDKz0rd9CFhf
         h/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847483; x=1789452283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu1eV+ojnBTJPL8f3pcCNNrGxkcxWdZpDJsAdQaiRXE=;
        b=JklzfRA6EZwm8GwgF8BWYfXdmzVSFe3plvRtCm7xyX38I0/WVW6pgnCDiumVSD53gF
         6IyZ5nw2MVu5CxA4EbMezGzxkInrPlQ2+FGADzmetdpuOrkk5fcGW/bxZ2j8Z3V5lAU0
         5hU5IFxP2G+lTykCeRa9CJieGM27TsD5PD339lAmuXBmE/1lVYnWDxKI6tk4hw6elF51
         a0JxlYXgKv+qKx1Ns7a1p8Ql7vDFaYEEkwOq+cV/8YdWoMm/U5ETrX8+JjBUeuHTl5Tr
         bse2VCMw6jUQ/+kRlavaWQMFh42qhQKNMS5C9/WKXbZ6Onpq68EIjXfiUsuzB6UhFRx4
         usmg==
X-Forwarded-Encrypted: i=1; AKwUvBxua9gxgm4tWpTc7mDrqgPvbmjsrgSlRlhkyjfNsuJqV7DQUKXevOrx3SC3O+TTl+5nHhEhCg8E7gMEe9rLteV0@lists.infradead.org
X-Gm-Message-State: AFuF++lHxcn/hehRW6nUJMzMwRwDcfbzxPC8AVPlQAiU5j/BOkH4KFEL
	bEy+F4GlVuikmXB1tezWh2FmS12LUZTd+iQqoFVLYbY+kXAlvEAmpSDI
X-Gm-Gg: AYBFou38UUoKJho0iJgKOKnJctKLVU7SH6tfIXXtncB257noXBHqoqymvJcNSIAa0zj
	TK5gZTRC6OV6La5B+3yN1YiKI41k8gVHot6TavVqlS3FdQSm5lRX+kSTkz7gTR+7GqLPRGOlCCa
	ub94RCX6Ngq9ZHy3M1/RC4np2omT72B3ckUq1iPI9SNrDNTEfB6x7MGINasHrW23eRlseaFfU6B
	3jySZcQRHaFcw+0hk4W7L1MI8H5VC0v+rPAcIaax6UVwg+o4Llmml2GWsbhBTZ3mA+Wink2ULvd
	/+MaMH2bYdMGCqFoWjCiIJ+AGAwl9UA3TtXbbTrxS5VN0rioB7GHDwc2oz07yG1k7ujH8ydxsP3
	WOn9d/cjbEdRBZD6Dc57DY9S6v9SsYBOTo9rlfEQhcGnLCn4fN0VnNgVedS4KXbppHvWRn/4Y6E
	H/vf31KJ2rNKGDtYD63lMtRrpIBO9uNBsn8WAXYNrjygnAbR+vKXlgxrAwWRw1xne+PbqEX+HFR
	mZJRNDQXi/DVU1Pq25a/VXTD+ML545M8m0sYAGLHFFhc3B0Hy1bNSgT/7SFFnb4PUjdk3UydR0H
	G2ORYY++jHTUmFpWL3mq7QEkEQhhY23os7yFntamLpSuETiy
X-Received: by 2002:a05:620a:40d1:b0:939:8c80:669 with SMTP id af79cd13be357-9398c801af9mr1048705185a.42.1788847482693;
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939bcfc56dasm108701885a.6.2026.09.07.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:04:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: marvell: armada-388: use onnn,pca9655 compatible
Date: Mon,  7 Sep 2026 23:04:38 -0700
Message-ID: <20260908060438.43338-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_230444_222368_AB4FC70F 
X-CRM114-Status: GOOD (  15.53  )
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

The PCA9655s on the ClearFog and Helios4 boards are
register-compatible with the pca9555, and the gpio-pca953x driver has
matched "onnn,pca9655" in its OF match table since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655").  OF matching is tried before the legacy I2C ID-table
matching that the old comment alluded to, so the restriction no longer
applies.  List the real part and drop the stale comment.

The I2C client is now named "pca9655" instead of "pca9555", but the
expander is otherwise identical.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase.
 arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi | 7 +------
 arch/arm/boot/dts/marvell/armada-388-helios4.dts   | 9 +--------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
index f8a06ae4a3c9..4a61e9d1a2c0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-388-clearfog.dtsi
@@ -131,12 +131,7 @@ &i2c0 {
 	 * 15-SFP_MOD_DEF0
 	 */
 	expander0: gpio-expander@20 {
-		/*
-		 * This is how it should be:
-		 * compatible = "onnn,pca9655", "nxp,pca9555";
-		 * but you can't do this because of the way I2C works.
-		 */
-		compatible = "nxp,pca9555";
+		compatible = "onnn,pca9655";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x20>;
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 39b2d4fa742c..bf6d70e2078b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -160,14 +160,7 @@ i2c@11000 {
 				 *  6-USB3 power
 				 */
 				expander0: gpio-expander@20 {
-					/*
-					 * This is how it should be:
-					 * compatible = "onnn,pca9655",
-					 *	 "nxp,pca9555";
-					 * but you can't do this because of
-					 * the way I2C works.
-					 */
-					compatible = "nxp,pca9555";
+					compatible = "onnn,pca9655";
 					gpio-controller;
 					#gpio-cells = <2>;
 					reg = <0x20>;
-- 
2.55.0


