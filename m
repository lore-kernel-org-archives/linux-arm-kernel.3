Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9567D4923B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEKo1LnFlWDTdn6dZMAURbf9LKsxfQWrYSaiKgMPlwU=; b=y2IFNXglMErrNfL9xdmX20BGvJ
	C6Hawg/E9nqjwgU9BsT+Kpk1Q67dC/FbZ2UQK9L40UZpQ1wMM/GH5KdVsJu1wsaSS7HJmvZGTGpCc
	rbLwUGuuUeHIcRjWWriCVad1aZpMLIQw4ORdzzCiuDThg2MQSe88UGyN+3rr4ZR42+Nm1nEOL923T
	4bSvdNTNe81VmpdL84pwmIAvhdyWTFQAxEYvopW9SVxpMMl2uU3pgdrOi0kcpcdmyR+sfZ6UVAaxv
	bPn3/y99rghk9EuxFVt5tvXquAjqSKhe4Sb1Yx4N7OAkPW/igOO15w7riULmxQVhC+dwEzMSPQYQr
	Qh29Uqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3pL-00000009woR-3RQJ;
	Mon, 18 Nov 2024 15:38:11 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3ny-00000009wWU-2MCp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:36:47 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6d42518f493so5196316d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 07:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731944203; x=1732549003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEKo1LnFlWDTdn6dZMAURbf9LKsxfQWrYSaiKgMPlwU=;
        b=lxF3jrVKn07RVfKfcflTHxXyhmdsArEHxEPSRFadzKDyV0gtYkD6D0oXHvoxKr9vp2
         TFmnHnHqydfammpt2H9zTLu2OEaIkVl9wdzaXTH7qS7ZZAWM6ceyK5MhQK8lKe0BE7uw
         +4sI2nMHBUfpi2+NFLJTJfwkh0sM4k918Nj4E18TL1+QLTlaKtmTZQkkNIkzNql/NSUO
         hGM74KLxfSANUqLTJwsGJoq3s34Tv4oW98dk6BRWUzLincrwB3EkOnmdWR0c/9I7OCD0
         rf/sZhUFeEKw5U2dRFMzq6SbOkyZSaugMsvIIVXdNQ7JSElnaMIGACReRBUhFusnO/MU
         DYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731944203; x=1732549003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEKo1LnFlWDTdn6dZMAURbf9LKsxfQWrYSaiKgMPlwU=;
        b=blcNHYcor3h8NYwnRLa62CAhKb+OJaQ1wmQX9Nrs5rAtaO9X6+g7hmgSU+14WCwILG
         aP9x4QBwKAZyny8Hl+2wZVP0XnymcgI9/fYvVy+pnUYHbcRvatAiZQKM57+B9U7ZbH4Q
         pk3NWfE+hjxgvfanEzoWsW8OzDVMZRpbM7EaCpw8bJxhQkXpzEgWiW73HMmAzNVxdaRd
         8FfRL/Wk72K2YucfsUITvGTLCHSgI9mVqx/bMaPpMn23ix7B/LbtBHXV4iqMh6aH6i7E
         q/hBBI8cU4v5vQuPv4bubHYxcx7clDuAo2kCl5wB6BZIdS8CH/a0P+SPq84k75Brw8pT
         wKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/o+6d96Fbouvw9sN6RWNmkyHlPhyePVrgb4ZgQ1Y4hXmT5I4JqgVx214ibH637ZR5QyoUUw6esyPPumbj2yxM@lists.infradead.org
X-Gm-Message-State: AOJu0YyHta31Ql8CnMShQyaLUuuu0aNqWlBbuPN3ikXPI1USKtwuCCU2
	IXGmIFdfBhWOHweb/M0lSqZn1uxtiyfVa1eHa0gB3rpaUTmRC4Ib
X-Google-Smtp-Source: AGHT+IEcd95ubIBL37xxzdGe7timBRl38iQzblD35wsDcgC8b8s1bMJjKf/cNrXEIvob+2HTG/uadQ==
X-Received: by 2002:a05:6214:c68:b0:6d4:10b0:c23a with SMTP id 6a1803df08f44-6d410b0c389mr93755366d6.3.1731944202927;
        Mon, 18 Nov 2024 07:36:42 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dbffff5sm37044146d6.34.2024.11.18.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:36:42 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <jesse@rivosinc.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>
Subject: [PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
Date: Mon, 18 Nov 2024 10:36:41 -0500
Message-ID: <20241118153641.3775085-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_073646_597735_079E0493 
X-CRM114-Status: GOOD (  11.22  )
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

From: Jesse Taube <Mr.Bossman075@gmail.com>

One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF not
IMXRT1050_CLK_OSC.

Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
index dd714d235d5f..b0bad0d1ba36 100644
--- a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
@@ -87,7 +87,7 @@ usdhc1: mmc@402c0000 {
 			reg = <0x402c0000 0x4000>;
 			interrupts = <110>;
 			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
-				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_AHB_PODF>,
 				<&clks IMXRT1050_CLK_USDHC1>;
 			clock-names = "ipg", "ahb", "per";
 			bus-width = <4>;
-- 
2.45.2


