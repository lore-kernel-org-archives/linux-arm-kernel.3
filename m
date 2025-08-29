Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFB5CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=getXY6n5cmVJNwnrUl8uG3DyV7kHjWYHn6/PT6xrbnQ=; b=qOcnaF+xHGnM/nmwdYZKoEDmd4
	jw+HbtO84mP2f5UvJIYNO2dSrEf9blyirPU3LNCtSNf77t+S7XJyneFY1gLhdkCBp9vNfqXxZTlrl
	ihAgHsBm1Aj/YnLiN4rFyRVetFbtCK82VLZ5ZmO72pNdrBjfqavL2+XoZ/KyAIDcnMZY3GFJY3H2s
	3f1xoS94JN2O4jralhhsxwIBtj+DoSbJjg4BoGTU9nKIu0xlbbIqPqX5VcpCSMcK1Nc/2VcoWgfp3
	Oxz+pd+LiF858pX0SbJ7IGe0Hmd3O3Z5tX6gdddxiCcMNKgtQoIknwrLhCGKgeW8si9tQjN7iCdH/
	J73ykZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvzV-00000005FlE-0rmh;
	Fri, 29 Aug 2025 10:05:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urumf-000000051Zi-35LU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:48:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-244580523a0so19342445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457313; x=1757062113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=getXY6n5cmVJNwnrUl8uG3DyV7kHjWYHn6/PT6xrbnQ=;
        b=KMn5BUO3e+6fmLK3O1eTkaCjTwJquanFyvfBvOnkNEThDZlBR430yKytJT48R7sOeB
         cI2NIUYE51iZwTV3tGSkxvxsihk3iqkYdKcPGQQHrZn8FThB2IGWBKBdrxqUb6UDrjnE
         KPbrt7FAHGHnoamM5fBfmgcFMvEt8Eq/sJiev2Tt8RZ8BRF55Rx775VS/0F3pIBufWFr
         KlvwQje9wl9UlxrcuwLXVgDpeRPj7bB3Kuc93LsOV1CRWw8iIsetQDDGIN/9mGvg2G+0
         ACbbbkesIbQWjHT2T+jrMxU7HXVlnrPbEgNsbiN1RwmxUc/3zsZzPkyQi8KqxprtS1D4
         FViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457313; x=1757062113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=getXY6n5cmVJNwnrUl8uG3DyV7kHjWYHn6/PT6xrbnQ=;
        b=tvH5ND0RCMSOvlrloab3vdjCqJzsyDHwMiXMOodvga1S8oRSMj5tPcmW+P7PZnp2Xu
         t9CNWh5fR8eV1dc5VU53TwkXzZor8BCvotfyHLA+ZCSyo5ans+Qt8mPwn99wv1BiyN5n
         Lq3F0ioh/QGVrxq9UHEytl2Tllnq6kMzhxtC5zubT4dTi++KN71HfF0T0VTF+xC515uo
         lHiei190IZbVs/Qxndq5dBBH1LQsPRmB+ThISCY2OD0vdx6oIkYfL0TG2qGJ4yjT07xU
         8H4CQ/iGH7dAjGMEWQtKZ/ZLIlw2br1HkYasMnxEurzYa3iFenJHevChk7K4Br3rrwxN
         LExg==
X-Forwarded-Encrypted: i=1; AJvYcCUoE4enJi1XNk5mcYnEddUrxgLAT+MvCdusna9QvttIpCQwF1KrXug4Mz0uOuuHSrFwcDLnwzbtTZ4FO7NFxwIX@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqcTBGkMCc0sAQJIZJICBZIwMg7QKFSCuHgItLc8luH246TQA
	5qL6Ur77AC153VG1TxPoJiO26E/NLhkwaZYUyKxSO1J4BsLlml7qKEmQ/JKXgz/EBfg=
X-Gm-Gg: ASbGnct5sii08b2XDQ4gGbVjz3m6rXAxyJ4EKS5ST1H/kWi1XeLAL0al4vBqJ/l/lkn
	sQU/guiEHl3aLBpygf2F2zyIqA22b4pvFYXvr7aDt6rzjT7e26p9XpLALyR74EKUZ4BYDZIxWh+
	UP+w0kAWMBIn4ZBVi9XlFTgWikRUscJSqYa7lb0+Ju3QWDOmKouwvExp3dcNJfwob6LGuaVVDKA
	PiwHsveHK0QPy4Fe301S1VAsALzfx///prDkBT3qhiQdCvUcqcr2znIxnd78gdXETEnKHKvSXkV
	xq619xYF3W3pHRxsepM7GOvA4DtvwR+tc47SuVmL4eMzWkoTfHG1NEB4aOn1ByuOtG6hd98zUB1
	WLjW8t40ThfiqEdirfI4KxaFodRA=
X-Google-Smtp-Source: AGHT+IGhBfJCAXApPTnMOx1BPvVN1cE26lZrndFkg1B8ZF/ybAWF0/Xb4YRLny1z0qgLJdczsbr8Gg==
X-Received: by 2002:a17:903:1248:b0:240:92cc:8fcf with SMTP id d9443c01a7336-2462ef53d83mr382357425ad.49.1756457313105;
        Fri, 29 Aug 2025 01:48:33 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:01 +0800
Subject: [PATCH v3 2/3] arm64: dts: apple: t8012: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-2-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eza6FXzy++LDogP3zcMgk9YsALnXaMYkVZLvx8dfpus=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlUs0lzltNT/qLaVfaVX4h2HZkQ1Ro4GdE8q
 ftk/g4gb8KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVAAKCRABygi3psUI
 JMStEACNFIJqKRV8SftSpcWaUUIKtllDistXE5BdZNVP0LwmXOfPJsANF+Bv3e7GoZHyw4qsUpP
 BisVDc3DwBxm/j27T+jODKwyTRGatj0p6eSb9gnhu5TB/Zzo+HKzrykuAeoXPGvM93eJo6kbd1y
 a3N6bbGHwJEE+IBgBEPyzhkkpfCh79U2O4F35oE+6DP8uiDVZx4jKqGh10lpRw/jU+qPm4guh1I
 TsTeC0xqHnUrwj5BeRpPDVc446vPSpcs5TpG6adyOJL9geeqj7e0aXzgB4ANMp3uB8ng7POUfX1
 JKd26yBgfI41vP+297ZHU/j+3YkczirTylI6ZIalctUJyT4eBWN9xUaIwNOcGQL7Qul0ahX207C
 CtDKTPLlRGwjUC8QlUceiAqe/DrV5CwjCOXDS0loUqQBK5LQXrXTR373gGq7iW/x5X2iab3Iaj0
 k7+bIQNpIcK1iUJaL8NLnYCkM1Fdp7jDx1jVLv9U+4QGYxrIAC3BWaR055KPlWK+8bk9Z7nIKKo
 D8bjio/WeXujyhxuoRhOtcEYH6drV1C2/YfVkpzHZOorUze3wquLDORn25JKDeljXMxt5RWYF2n
 jIRst+/f1v0Y5vXXvBXctdm6IOB82jilGlg4ugsQWFiQwqrcmgNXQOYloQPdMGipSHC2GaQQ3eZ
 VS8PtnsIwjpYhzQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014833_788179_8920D5D9 
X-CRM114-Status: GOOD (  11.28  )
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

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..164940757d446fd314154f83d49fe8b308757199 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.51.0


