Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3029CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=; b=M1gahbkfUkNNEYPb/XuVit1nGX
	qI5boZxyJSQIrRUVBmDAieLUp8A2ml31vjHo/8XOGXqdiYZtf7Xs4kxjte0WF6Esu8ucPVvkPBRRz
	4jiS26FeEfaMpJCl2+gy4R9YM+B4seKnO+8RDw918y3hg/tGIo7vnDwtKqvbQ5MGOQiT9EfyQurje
	chupzCUTBAu7OmxL6MkOCqr6ocRj3gj8G5W7XtWWbpyoh127QC91hdRDVGfDQFbATF8RqB++4Ivj7
	0hHtRabRjyrLdNrgtSN9he2P7EwkQYYpszA/AbkdeP35GVy/x5jVp3YON0+fm92MtHoWJIi2z9Cxp
	3uOZLOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJj1-00000006Oqb-0PAk;
	Fri, 08 May 2026 11:50:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJiz-00000006Op7-0sec
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 11:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=; b=WxJqZlL3rFWmv9E9l0gNxFlAW6
	niYeM3T/KgYkLu3b+zzR//HuRhmuoBy9FUC9VYky+k4/2o6oqNh8iAffEJEHSIm9b9AuJu8ONBNBc
	JRenZzoG/JME3ErdOyT2ssGr5f1uOgEBOsZ6HQOJVDg3aZj/+rlXKEgiAA1lSsZjA0qvwuOrz8zsr
	4sWqu5atJhdNe8qOJRN8m48cIUweOccFc0QB6qLCDAq9xbgcsQs2InsWG+J47p23HchCf/D6wxazL
	pdER+BvOpbrL+FoamjeAU+0KjRSQH3KqUFCK7hGOzaGyW2kGvpms8DufdlRTQe+cyU3Gem3jgHH7n
	GY8jXJhQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJLu-000000063sd-25M3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:26:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so17562645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239601; x=1778844401; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=io6uzBXc1BKbHVSnCSmYkTdbWi0S9/BVyQJsXg39LVrZLNhR+W/Fg9Lroij3sRhLJ0
         DwetpzHuBovheDV/SVv644eY9jUGiTy8BxprIc4AezyyMH8WTeGLhBu6UIn4Qwx/R8Mg
         DqiAktSYItjM+Oowwe/WPib4H9tRhE2qni/vqdXdZxy+h3x8povFeQo9EXslrq+1m1TU
         rN89xAFcA4Ifwjk2wkr19100zx04RhBYeqmrghvqBpZQDm0VpEZUkkDYusMyy3Rjd18w
         N5FLwUgzex+E1JJ9hnEG8q+BdHnGO4EDjqBtclwsvOJTxifi3SWoxylD6iB+YbsN8CyP
         s42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239601; x=1778844401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=gBaqI1W75KjlPl0a+RyhNd5r/nv2m6OJhuWMNlPrOKStwb7Z+9Fb6XDoENbqgwHlzD
         ywBphDf25oVx5vmy3N+8OT7IG4dGP79xZCeIX/4J1ytXs1VaLBQAdccHIxbxgB+c9gAN
         6P/t1xHAVNZVv0NUdhDKB06caYUPIhy6H4nE7+YRcepNdvDYHBMYl7l578OLdaj7/3OE
         i0ZLEv0zHXToARKYKCTHH6zfwnBTXoI3s7YbfFNJa5nQzYlh/MBVKPYlRPu2wcZnz/AP
         vKkhV7a5jw1vbwrJnpptInXFOs1GxbYfA5pcsn/fNZOYI/KnGScmGforJ6d7t5C2zG4D
         XgrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VAW2WKLDtaVSM673pqcXKsrNOIidLC96EQ1lZpEthSmAgtNidGdNgp2Ej5YynlPK38sg7kc6/tW4IMRKGDyMv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+J2e/BaYwAo9BSB8A+clX9bDV5Yz+PtJ2zU4MIBG+IdhQ+e9
	//VQnuUacTtc5yVlkJU5aBqqPjZSAbJD5sp4WIuuT4eIT8wB0EEiheTR
X-Gm-Gg: AeBDieslJayabwpoHpZa0FS2pqaJrVzpdZs5IkeTjGiThNGVsmXS8p0ps4kffOBu9Gx
	Tmxwcgy6UBmU6/bPuApupgEsRmu1PvbZz06bggwBVB0SBqi6mB7ZsOkKe3tTf5+D9qadCZeBUZF
	sMaLz8nMx7WTCsyl5MLjUtfTDoBkNp6U3riQ0rIoRIoJ/F5FskG9QCjSbZPY+s6i0x+3fc+FERz
	kugfgWnz/ogkbeIDmknt1o0ukOoQLC7wjq/01+MzkkbXbviHjc0+K+1anQw9adAygO9f8iI2yZa
	4oxFCLX9Ezj1NrX3ccq51elMaAhQ7TR5FpmnW9F/7rBaXP+1ZeZIqT5wRGnKswszguxa4gT88WT
	hXEH+YGLS1m2fdxiRiK1kDHNwYo/cuzFbOXlEwUfsMmczRspK482EHmriuiEFwCpAyyWwOWMHRM
	Rhk8uIu/y54WcDrqDK+TXbG015VhQavoeDE+ztHRUtmCHgwu7Q2i+kSU0LS/++9t8TCHP+SyjkJ
	x3Wb1PfE9HpEEFZ+t9OKdbGBgaW2vUpGZAFLpYjfAygHeRv/Hc=
X-Received: by 2002:a05:600c:3548:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48e51e097a2mr188764295e9.1.1778239600520;
        Fri, 08 May 2026 04:26:40 -0700 (PDT)
Received: from [10.0.1.145] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68edca90sm58547205e9.5.2026.05.08.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:26:39 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Fri, 08 May 2026 13:26:36 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace
 deprecated gpio property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxG4atI1gbSEUV6ldKFHX81UJyQKaKId
 +/g8lu8d1KGKzI9q5Mcm2ZNa8GjriguwzqDdSymIKGTVnp22HeI4Nk0sXky+O/gsQufRgRxaoR
 Ka45J9/v7el/XH5R0UcFnAAAA
X-Change-ID: 20260508-replace-gpio-property-d62b300ecf30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=AB5PPdLVkqMs1sCS4RHSNfyDkv2JV7ytgY+zBknYgik=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj8eyI/eeLEqoz2PwW+K+TerhSMbTm52LC6oSnAW2BCx
 PSwshPVHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgInY5zMyzNbV9tFsTAvgXb5S
 lXdmpsGr09s4RT9JxixdvnOuAEtXNcN/X1GXxEDZZWkn7l6RO+hUlKvxrLl9h+5jTvnUd8HSBdf
 YAQ==
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_122642_876768_6D0D8FEC 
X-CRM114-Status: GOOD (  10.96  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Replace deprecated "gpio" property with "gpios" in
regulator-vmmc-usdhc2 fixed regulator node.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 8eef26eb0f87..7d760470201f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -113,7 +113,7 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usdhc2_pwr_en>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		off-on-delay-us = <100000>;
 		regulator-max-microvolt = <3300000>;

---
base-commit: d570a0d019a3d84832bfc6867647d3581b0052f3
change-id: 20260508-replace-gpio-property-d62b300ecf30

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>


