Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6480DCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=; b=g6rF78rqgXNP0SbJNnGfrIs0MX
	8D7qOav7+RM8v0UTaG1rpjJRcsS5uD435qJaavu2kzSx79w+NZ1amZRl6/H5knFkBbTQ8dRjb5yU+
	GP72Z2aNcJFQ8vb34dOzuvoOHaPLhPDLp5wethiM4xcVbD0p6ArpXTnt8t0d2SmIfPH2as5c6k/OX
	y4SL8PTkOulzg5DXa5J8xsSf0PTGugrTbYwDYYetbqNG7rybBk8q7R9re+TPxWrNzrFtoy8Y2xFiH
	8xCToGDBExIFXNoYItUhhAx43N8N+LDCj0khzGPj/uCpeisWNIifCrPYVYRHl0AiOttY+HrBuAowl
	SyPZJiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj88-00000003B1x-2HcV;
	Fri, 16 Oct 2026 14:41:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7n-00000003AjX-24qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1523839f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161693; x=1792766493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=X0B11ri5rWbhPBu32ydwJhWj+fYxkotu+Kl9UYYn8gFJiDhhNda5qFgw5kV5HSxjzp
         oZJgRcuA6tVMrBqBuTZ0gSKVpXCzH/0i2kgjBhEtdzr1ZZXf4bSF2W2MIVtvCKMPIxRc
         6PQaGCqJqFR2s0gQlaFbf0anjXw4j7Ts1VW9MiSvN/ipEPvcq6mCcIcEsX9aZz1UYR6c
         FtmK9bNxJyzDXivNH+croCCtub37iaZ83AAbhi3tuw+BNteo8xh0NymHTFs0aBo9rV2/
         BF64MI9Qw6bTc5NU6IBRStjsWdSq2t78JwsMCp3L+6LHp9A1Jmp0CltaG472qLeKgbhv
         6xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161693; x=1792766493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4FV3FRgo5Fq9ibwyvwR+FrSwQlHm1b1ksNAl+GUkAY=;
        b=nsxOQ/HQhefwtja6fg2tpGWucAce4D682i33/vX0G3LAtUTkAMrZO4Euz4x7qkXJn4
         pr1bP2et1jO3i1U2IsMDlCOjnb3ckEJauC/xAi1KVjVF3HmEey0i2htygrVKwljh5JLW
         DZIu4zfZDKq8vjdWuFBgwvK5ZGuA/OSEUKzmaw/BBxlQa+F7gdNe5hB+zqEFTVUvojys
         SLtYGMrHbATwR0O4RmJQAWRa1Pos9MqvB56tboIKj1EOrYNQhHkiCmcdbVT8M2jDsLCr
         G6xjtYVY29nuLZpfxjrkaZHm7OUfF0uqJaObrG4wagrE5HlVAhkfzlVlNbj5YYe6aHpC
         1HDg==
X-Forwarded-Encrypted: i=1; AKwUvBylC9mAmyJ4v6MsyLyl8A55f95ZiE9ueiVJGyC/Pjn1Oal2RPSM5pMa+mIh0TgR/jw89npTQQiTy3zG/ChA+vG8@lists.infradead.org
X-Gm-Message-State: AFq9FYJd4fu5NiFk1KX53QlKSLOFXEMTK2Kl69Jwi0fGgYr78aGpe8X3
	SuVOUrAgJbW2ToA4+03craGjS8Sla3WrrFinzzOkI2pOoGmgFemI92mpbBbxOItTx2Y=
X-Gm-Gg: AYBFou03unziw3j5+gbloL3QC09a3McrFSrhZw1MZvsGZ5iOjPUR+xHbg1tnNnQFkE+
	o3xrXwRKPwl/mUUuMHB5RmLmVMNseOG0NHniGiYS5tXXtDuzM1DrnHtQG1xDeShIJsdd+uidgCp
	OZpkX4BY/jxqTZao7ZllxySA11ehdWbvRpOxnidIDzcjZoCxP0W29knCLeDA0q0Cto533NWTNbJ
	meik2nhXv1VkSee1Nnhvxg1pkjZ3fknN76D/GNuGF0CoBFjWvots96xSGeDT2yVt7pZejJZhPEG
	rdJxNr2CmdJU/ZWFm6jLnjz9eU7781ZtE7HyW4R3ZjyDtZ+c+VOWqTUDBkPQ5oF3IdZeVhHK2Cw
	mLh7WCFCyHawYnUDtCr2FMR9Dr7hKPZqPUmwvKQMgmindC24m7QlKiu0rsqtO13SpxdMvpUujui
	B5Nn8kN9758s6eZJO5WBke5F7mFFoQKYAzfdr7UiL6NeEtOj897zzaw3+v3LK8o6MszehAOPieI
	bmOToKTBcOnearX/SXAj1XcW1yFCMSMV6djyEATac7T6nL1LUes/KcuUFhDsKxhjU55qw==
X-Received: by 2002:a5d:6f13:0:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48dff71e2e3mr4135577f8f.7.1792161693523;
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:33 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:24 +0200
Subject: [PATCH 09/10] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-9-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=2104;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=X4wb3xiiISYs6tuR/KwDk67KeYlf9Jq//WgEqEqzrr8=;
 b=A8n3VCROf6Kr5krycQ1d48B8SRfuPvwxe+ZIq5pENuMZnmBMSwf4Q8JrQ6EBlByjeeDxMVjWi
 OyHPdjXZG25B5q4bqtX9PIxqh81UtNS5KZj6mYT6wuQlhP936n3mKJx
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074135_575568_A998BD66 
X-CRM114-Status: GOOD (  11.53  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0


