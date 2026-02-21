Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E8CC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1C6wqAZkg+qYLWxDPzpBxDFvacIIFmmcW1UcM8dpNUY=; b=zr0T85ba0WkXJIqIP1UDMX3wvZ
	BpuPOSjUyRCSLFNWfQ/Cfe6zp+DdaAI93+kevPhEviJM1y8/69wgBHAnkREpbEi45vp/vKy0i2ayy
	XZApJSk2pRyGpvOopDeIlBUMq54ePmncxqT9/yXGAg7VeMbTTnIUyODTi73CAkDBuXSAX7lpRfewT
	SWLIaw8l8WCiW9PeWSi5Iy4TKCxGsnlE8bP1zT2rqxWhvLUw7KT/gNnPqnX4o9DaBru0zj7/4dmFe
	gi15XxdV2ri74AAwt2X5dXpKPQAfsDvk+7n7r4Ihw37i7kuzR6UaXQnWtJKzKbkBrxJ9mdpfx8AR3
	pO5F0LAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtp3b-0000000G9B1-1i1B;
	Sat, 21 Feb 2026 15:38:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtp3Y-0000000G9AA-0lMw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 15:38:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso25776265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771688286; x=1772293086; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1C6wqAZkg+qYLWxDPzpBxDFvacIIFmmcW1UcM8dpNUY=;
        b=A97saW3wH0vniQleRcEJnY1Xe7OIDU6r7UI2aV1qDMBq1Qe/xNVIFpiTOwXpa2U1Sm
         8TSH+kqzaZSHSLfjhzpBaTRqzwu9doGh+ZHanV0nsyodcp7CZCMKeKxlrESc5nxRz7Ov
         pb0kSZtdBIgseGtX1NpmpipF98JOqiQmXzINUIN9f1JxG/rj/G6iG98Sf85FfhVHe/VH
         CSAteRjfNZz4pZHcE/9AjRIh5nqUSnVI7Y/XuUvuly2ONwvUhUEwb9BCwdUyII+4u9k8
         7jV0G4oMcsa8HX9+k3nIe0IdGAUkz8SPr/6JbsEI8+f5KIcLufUvFgDt81WlKlvFF7NE
         6Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771688286; x=1772293086;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C6wqAZkg+qYLWxDPzpBxDFvacIIFmmcW1UcM8dpNUY=;
        b=WVQ6L3LtK7fS+/NtRWdswcnZTlSFIyymPn/ZADxPTTXFTcwjNRZLcfNcV35XLPpgVU
         /gBEnMP7Rl0pIxUWWI+h0654zv1MSIYCvDQnUNH4X0KAUKb9EEvHbwUZp9gp+dDq/dl8
         gSe7dbYaXg0MWjDZ8peHO3AH7RelMbXrDzxW6Of4L5tdeL4X7jbKMubUeGHYtu5Jx4K1
         L4F+NaJQuJpCtb4TC5fHFzLvW78jgnd9C7fjVdhA/L8hI1R+tX7z33Tzh1sF79w4AXtL
         crGjsaf9/RiBKL+JSyhQ/92S91XRhVfVY8rmaMo727yDbkPSIJfD49L6IUx6YOz5Cl/Q
         zCsg==
X-Gm-Message-State: AOJu0Yw7/o3yY9dPwSgkqRHruoN6LIiiYGzj3f785ZeL4qChUPBPoPIT
	mAryT7L7s1dgEHdhTyzN/Qz/5FWuPfE28RSrXlukQokl4T64psbv0a+u
X-Gm-Gg: AZuq6aJKvnngZxsr0o0e2oowcyScIkV3tac3kVAogFYYdLj992OUbJuB/iurdude+87
	gMzobgBCy/Sh2out8uta4UsX29S9WMJV+z13TEJgOTKLkEZuLl9roaaZI7EYVdQwV4bguiPgpVz
	HduifY47jzjRdUAkcePNmzvHCKLs6aSx/QHRmYeBhK6N/JTIuLVni7b4WdODOSp1lOkdrWaUAwx
	3RnlpVWfJFw2SjmAEnEnGwbldNyYfYYrbMSL61pO/DpHZMz8NkqqtbdiPm/7CYiFTK90y0AAcwJ
	CYVpADAmcivWL36fBJATuQY2PvzqZu8P/q2Gud4AQg8gsAdJsdujmQ3d5f3zkcotH3SNYrU144u
	0g6teyw1lMoSIZ0bLBgeCMwpoVumVcNb7mgSaYe9uFt4pQBPijoq7G3v9+D1CEeyZsL8R5Gdc5b
	sOYInGEMekfGFVnJb+Zy5+/gkB8/5uuWrtkGAf5XdXkFqF48SqmFRKsw==
X-Received: by 2002:a05:600c:4454:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483a95f89c2mr59922825e9.9.1771688285478;
        Sat, 21 Feb 2026 07:38:05 -0800 (PST)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm86456335e9.1.2026.02.21.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 07:38:05 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 21 Feb 2026 16:37:59 +0100
Subject: [PATCH] arm64: dts: marvell: armada-3720: drop
 'marvell,xenon-emmc' properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-armada-37xx-drop-xenon-emmc-v1-1-3110e83091b8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFbRmWkC/x3MwQqEIBAA0F+JOe+A2mq7+yvRQXS25qDGCCFE/
 550fJd3QiVhqvAbThA6uHLJHfo1QNh8Xgk5doNRxiljNHpJPnocp9YwStmxUS4ZKaWAX6vfYfx
 YmpyDPuxCf27PPi/XdQNoR81SbQAAAA==
X-Change-ID: 20260221-armada-37xx-drop-xenon-emmc-9514c385e766
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_073808_300769_F4BBB662 
X-CRM114-Status: GOOD (  12.13  )
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

The 'marvell,xenon-emmc' property used in some device trees of Armada 3720
based boards is not documented. Due to this dtbs_check throws warnings:

  .../armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
  .../armada-3720-espressobin-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)

Apart from the warnings, 'git grep' says that the property is used in
device trees only:

  $ git grep -n 'marvell,xenon-emmc'
  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts:85:        marvell,xenon-emmc;
  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi:81:    marvell,xenon-emmc;

Although handling of the property was there in an early version of
the 'sdhci-xenon' driver during the initial submission [1], but that
part has been removed in later versions.

Drop the property from the affected device trees due to the reasons
mentioned above.

No functional changes intended, compile tested only.

Link: https://lore.kernel.org/r/0390e7a05b6163deabb545f93729ea615eeaaee2.1477911954.git-series.gregory.clement@free-electrons.com # [1]
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts     | 1 -
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts b/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
index 070d10a705bbdf74cd63f6229f214b945fc78699..a313d5687789e349a1a25d69ab4bfbd0927dd060 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
@@ -82,7 +82,6 @@ &sdhci0 {
 	mmc-ddr-1_8v;
 	mmc-hs400-1_8v;
 	sd-uhs-sdr104;
-	marvell,xenon-emmc;
 	marvell,xenon-tun-count = <9>;
 	marvell,pad-type = "fixed-1-8v";
 	vqmmc-supply = <&vsdc_reg>;
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
index fed2dcecb323f0541d076988164f12e68ed37fcc..37e16fb3a3832292484d602c386ec7ffec1f55bd 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
@@ -78,7 +78,6 @@ &sdhci0 {
 	bus-width = <8>;
 	mmc-ddr-1_8v;
 	mmc-hs400-1_8v;
-	marvell,xenon-emmc;
 	marvell,xenon-tun-count = <9>;
 	marvell,pad-type = "fixed-1-8v";
 

---
base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
change-id: 20260221-armada-37xx-drop-xenon-emmc-9514c385e766

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


