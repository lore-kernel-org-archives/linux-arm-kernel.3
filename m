Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91374F483DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=; b=CkzH0kyic1lko0+KJMMiuE0H9S
	pzMb6Zpw1AQwM47jTLmAV9wfYuoiBDm2UsN1Lobu/pP+2HlQKCmvsKUR4U/l+c7zLAKyophUcF+fz
	3dknhSnsmzYema+tknCrBSI4xWx8BmZzETJVpmYiUzlkun66XYyKFOaCrS8pGll2/Uh6EqOY1bZe8
	DFq22emh9q7qgsPZauiCKAGkAOnEz3JjArrfoicJJ7BX8fB4AthrErGUHs1JYIayxofgprJa0w7G0
	mwPw+7U7s8yglfiAd9VZLnUHUzerzXHt7Fwg+HoPuISgEq5yXUqDBWVtcwByLeuCIZdOC4RDZ9XkD
	ORTNX4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZy-0000000HI9o-2JO5;
	Mon, 23 Mar 2026 18:00:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZv-0000000HI8K-3Eqy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:00:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fb112c09so28072235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774288838; x=1774893638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=Ile+Bh1QUV6lhI8HAfb0sV3LtWj2uGBud7e+KzN2V/0tdlsMDlt/MNBDZkRLhh6Zwi
         5GnBUH20XlmlA95ft1o9x0Z6jlH5uHmJyrmfrFpnEw1IWIh/A8tnNFcL34VadxIn2HWy
         EaIRanw4k3hdUV6ud/puMO1P3riOu0b56OnNbP/qBuyORb9S2dibO79p/dPQrBRqJQCS
         oU06tc0avDTZfHRB8TDe0jRpXOse9b+2hYc7lv9wBvlxhjMVWzuAdhHlogjpUkJPU0d4
         ZqN6ShTV2vRMurHyQ3a8NAHYkuCcGRelsbWZFS8azbbtbRHOls0rRg3Zo52nOwSRqEKc
         CsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288838; x=1774893638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=iZ4/w0PoJHcWiyh8yhgtyvO9Q28UrzYsFXsZg/i8k+BNg/9SO3eCKZJQEux4sjD+Nt
         VM79XIY/stpruqcs2b+1Wo1BPZ1x8e6RLLn2Hx30WeLoPn28jTIKTWMFGzdyEVjcf/uZ
         pEj7sWrLcMLRTczjjItIKYS/d9YsCXc/K0LpSulubBSKdRxrGBWi7mCH8ws5KIL9TLoJ
         ukGolh1QX304PcJYDHwaKGo9KhBVzaqwE5JM4YP84UXgkGEdm99BsKi7pfLTTyWNfstR
         4WbatuctCI2FM4/8PYOM8aKEUAqqp78S4gvaMl84x1+VA0Top7zUkeny/8ZJxM6YFP2K
         k4kg==
X-Forwarded-Encrypted: i=1; AJvYcCWgZr/uRY76Vq/GS8OA8LPR/9ldUOtEd0Tupemnh4pRK4Xx2K8gISbpNTKTNIv3FI8puaaOmYmQjL3L7p9z4oOF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+kl2QaqirtYp9cT7lrj0MUzmwdDoVfHKv/wkP/ejDckOTJRBB
	2Xd2wNkvi8KkDNcgNpJGorZyNkACG0edpP/GYrzNITMbZiTGmtfi3WCX
X-Gm-Gg: ATEYQzwHYN3R5TU9XvRUXMDD/ak8JgEjokNh7sXeW2821iAhlAwgNa48btLWkuMRO1x
	+5XfDFURxceVq/R9x5o1pAge/6Xtlxz4vm53/jKwbZI+sLInEmL95wuz4hKIMPMzbRJFEmxR7vB
	Z4i7VP1qb/BKVya8A2rniF5miJNp537rnBJRKasDI29mZewEP3uwv+RkL+ZzG6FdAwhOcwYU05M
	UwEmXVGDMxIuC+3aceGU4NBGIDsgmKEFrN1GzcLjnTZqQZiFDk5SSlBVBwOY+oAXh0cVozYXv5K
	n1EP26K64yDTNQ/H3Y4bUYiCNavNvyHPHooHAXBb8FHlq1hUsA7DDhew+MuSYrFjBjxdLK89APf
	YCKedqg3+yVhWIJoKkvl7wpxh05GiMF9XV4ptXUQ1cMdMxdUusosW6rUQx6k86OrBGLLbvaZ6r2
	hFk3x7M97Ml15P
X-Received: by 2002:a05:600c:8b24:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-486fee0fcf6mr185652555e9.21.1774288835808;
        Mon, 23 Mar 2026 11:00:35 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:35 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
Date: Mon, 23 Mar 2026 19:59:45 +0200
Message-ID: <20260323175948.302441-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_110039_819930_D9D97563 
X-CRM114-Status: GOOD (  13.10  )
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

The Technologic Systems TS-4800 watchdog node was previously named 'wdt',
which violates the core watchdog.yaml schema expecting generic node names.

Rename the node to 'watchdog' to fix the following dtbs_check warning:
'wdt' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 5118a68db..3610ce395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -155,7 +155,7 @@ syscon: syscon@10000 {
 			reg = <0x10000 0x3d>;
 			reg-io-width = <2>;
 
-			wdt {
+			watchdog {
 				compatible = "technologic,ts4800-wdt";
 				syscon = <&syscon 0xe>;
 			};
-- 
2.53.0


