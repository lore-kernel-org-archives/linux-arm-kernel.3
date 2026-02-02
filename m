Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31336E73147
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUt9924HsCW+kyUNL12xZ+wX+8YIZNo80+Bbnu4QVf4=; b=pqr0YjFLCv6Xa0MnsL9r9PH2Dr
	ymnvnQfkjPEVg/JqxTZfdCuU9yLYbcZdA6tt8swE1ZAcTlBK9IR7eU1UK/4z/mZF6xXb9LFIeV4O9
	2n+IQQnuay/7iFyBoROVdkf0TjULgnthcNuP/6otZKuBW19xMh1YU1AD2inICuQAaNSpTXSJ6IY3t
	6dOxvf59QieVLGT0JZx8gPrRWmIrjYSArJFJ3aq+STqQ64Vq6BEdpQPNScyEdU7G0u+luAdDy/Vim
	tPMQCT7D0wmQJhmWMryr7izCm87eknleupok1c9AgsZk5EHqA/NpwYBad5nRB5S/z1SaS0MvnPFCE
	css0/EBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR9-00000004eOb-0BXz;
	Mon, 02 Feb 2026 08:37:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpR6-00000004eMs-1Nfo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:37:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4806bf03573so19848385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770021451; x=1770626251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUt9924HsCW+kyUNL12xZ+wX+8YIZNo80+Bbnu4QVf4=;
        b=QurB8gtL+6TnT5HlH+gygJ2TCKzk83gkWqmbKeW7ESytO0p3T+oru3PKmvtDKLopM3
         mb+0StfIVqGkLtb9wVaDodBmcthb243AIuEvPuY/ajy2jQ9BD4YL1wi3SKRjTiKieAzk
         lYGxkc1O1qEeMrZwqHDvwx9S/opJ52nTIBmaarvb2hZH797gDmnKMMzhh+l/zSAdA8c4
         S7sWPjewe2/KcFwgEXRLm3HZo57j+L6ti8c8No1wD6haYRcmrXzteQXfxtZn9f2sgeiu
         e/wGretCigut5j07b2qEAeWzQ4RtjCQ6d+DIUiP4YKkgY4A+HakiWcjsR+elHUCVroHL
         0AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021451; x=1770626251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUt9924HsCW+kyUNL12xZ+wX+8YIZNo80+Bbnu4QVf4=;
        b=BssuDzN7u+cv91jycxxHiifqsu8cIpvd4EeRRHEHi7196Tj0vPfxECogQVu9zLFiWd
         qh6OX1xVlnwhiW7hEu7+Cw2sGQkUeZ5uTQcK++L/B5Z2f7xIQ0o7iiQJKq9p7MBXKJEn
         t5YMx6BEKbjDuIrU2Gurhw0T27QwQZHeSiE5rcSEicJBFDUPOPdza+W53GvM2nX+rY6s
         kIGGc3lFxlFkbhHvIIN6N1Y5Mfx3FkUcKrkqUpIsdy7LPJ0j/GuUZv9WZaNHjtHV+jXF
         ZJ6N+nw+2l6jd0uFVlzKQWQam0KMbfkm1rLQRcxqtzEwm7dZ/3B27+calaH+gkMLLi00
         Z67w==
X-Forwarded-Encrypted: i=1; AJvYcCXC4lNKOAQlHag6Ebvsv1wkiuftzgzt+kIvl3Kh5z66ZsHnTf80TbAHOBS6+nCR4clWhUapiNwPDT6Xrll9S6xi@lists.infradead.org
X-Gm-Message-State: AOJu0YwVBYo7/fFtCRiZkMh4wbUaDq6pZOU7WNVv9bzlvbW2T8WCvoxH
	ztqROQFbjgb29IlfMhqCZ+S64e0YoTS8S0qFZJdMxP8yRda1fZzQ8RRr
X-Gm-Gg: AZuq6aJYTe0T54X/vvgCkABQ5Bvb3y/LQvgoCNcILVui3B7X8RWig24GkjMeBpc51JS
	rGHw0v8VXt1cG/Wxdjs7aFJMen0nHySvxPJP+9NLO2js0aaGf1szQYYuSEnuEZHj8jpJdYlMDl/
	FxOQYOSEVPM5E8KKFT7GDctlzWuWtXc2kI5adARhRNWHOt/sy9uTxE5sot5tPJ6hqvF6XPGd+sg
	xxlThDPoLp/03401P/B7ZejF3gqX6L20CzF0TVbPcmzlLOOAbioFiyr/Mtfmq8yMLj8cUoF3iXA
	uNLHOX34mDQsWyPFIu7WFBT82BOgpOqSiL2+10d3EI0EShqjuMznm7NujaEvY+teNW85JuA3bzX
	rFQuT1d+Cic/Vlry51vEUM2Mw3tKw/yymvk+TK0kBoJNat/Ui3KAeMNji1MkOz8Y01AewjBt3kP
	T/CCL8kakDZEbMYqpZAIPO6hsLcBVapetEXd2AMv03UaCryuXRDBSfx76jpg5hglXEEX2IGa2hF
	TKXK7dAo2NV6O8+Z9O6qrSAot7AafxjoxdKu3MiwnzZG1Dsvy5zh+bQJuwnE65xRx/NcpAryJ5a
	yW4EHqDv
X-Received: by 2002:a05:600c:a00d:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-482db465540mr141701315e9.12.1770021450631;
        Mon, 02 Feb 2026 00:37:30 -0800 (PST)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm399535415e9.14.2026.02.02.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:37:29 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO
Date: Mon,  2 Feb 2026 09:36:01 +0100
Message-ID: <20260202083604.325060-3-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202083604.325060-1-fra.schnyder@gmail.com>
References: <20260202083604.325060-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_003732_449877_93D26887 
X-CRM114-Status: GOOD (  12.79  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Correct the DP regulator enable GPIO to index 21.
The 3.3V DP regulator was not being enabled by the assigned GPIO, as it
is routed to GPIO index 21 and not 37, which was causing instability
with displays connected over DP or via an active DP-to-HDMI adapter.

Fixes: 9f748a6177e1 ("arm64: dts: ti: am69-aquila: Add Clover")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index ec8ff4587715..dc0d3cf2f985 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -26,7 +26,7 @@ reg_3v3_dp: regulator-3v3-dp {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_gpio_21_dp>;
 		/* Aquila GPIO_21_DP (AQUILA B57) */
-		gpio = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+		gpio = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
-- 
2.43.0


