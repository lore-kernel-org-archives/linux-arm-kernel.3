Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9DEE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yK8Ib4fw8NsyzmJDMSwKub58WZSMVWEX4G9CGBONcqc=; b=cGTWuto3UiBbvbfkvPRACk4XvF
	IC8bZ0Js4RhdB5j80JE78MB72k1+jzxC8RLrCju9ZCmQTe/46p0lKAWZgmjGtx4Ja5UHcQzbPsheW
	YJOdsrAOnTGy/3bwpTGoGoBIVBxvPnseGJyn8yBHyCLsHlopTBaABz7RfkbvFiXOb9kqyu7JrKooJ
	vbL5bNsuS1LJM+QACvu7xE4B5i1462YluowpK+liEobH/yvaFnFHtl7OcDX3zIrwBWYojjiKHcub7
	YLLSNTvYSEkCRks9nIDDkFupHrPCm4SHIJsYjgBW8A2p7FbVx+Zq1Dm1GVk8XspZ/UV8XcH6aiHWV
	0Q00J1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxJ0-00000002h0s-1lin;
	Sun, 12 Jan 2025 12:43:02 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxHg-00000002gnx-3Kog
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:41:42 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3eba347aa6fso2151848b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685700; x=1737290500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yK8Ib4fw8NsyzmJDMSwKub58WZSMVWEX4G9CGBONcqc=;
        b=QRzSDO9vwSx/F+Ij7P8GqaO6y61YMKHg+7s8w5+mhCGgZ0xBT51DYgY+JMFVgTEa18
         L4pRHUOptyNYPv9PXL45dTI9Qfs5DBScDFF43ptHYmLy5tz3XT5YYTT+OrWFAbrvNeFC
         wWNccYr2K5GlvLtdCoc0B2qRtuOGxeo3L6RzKsrDyT5Ue1ckq7H0uXq8GP08h3ZPGsG9
         al0qau9QcbOQvONAHRCC6U0Jss4SGR0gEYNpgjqqv/7BBgMn9Hvin2TOswUzv+FzSk4C
         jeUBxGFi8M3twdgMVZ89VwyYaE6/jbBpWIPeTicUhUh82oQIfCjjQSmCu0dGYZy/KVNe
         31Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685700; x=1737290500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yK8Ib4fw8NsyzmJDMSwKub58WZSMVWEX4G9CGBONcqc=;
        b=PHT7XhOSMxSdqR4gnoeZIDchGWZTKTjUOqGJ+O0pqbJf5a+S27/ba/Hp2O82ep6IYT
         4lcGSyyZdsbRV1gt+qzN8eOgiS7YDE9nBv9qYpsDP9G+aiupmWIHbc9fSI8RTOJ6MRy8
         DrdVFllJ313YYiC1L0niZ2CL09J2QVvsGCTd52epV/ltFA31HtGz1SFzjDZ8qNVEZwv5
         h0MSN8I/jMDG7CVd43LwenPWlazdUOgcxCjFdPXSbrvdmJ7K1sIEm4fp9qma+QuWLvUI
         4n/7/Bkgqs+G0Sgs95s3sXsNwU0Vow7Lr3Akpx+hCWlMNdSai+gUUR2Jc+hXjQamRwxS
         Vq9A==
X-Forwarded-Encrypted: i=1; AJvYcCX9NBMmAgi/uxh1Qlexca6rLE2mrK7t6foK4JQrtez/+1D/qeIFenpjNHK/cRhkKxAvkhwyjk5gLv0igqJPrQ6u@lists.infradead.org
X-Gm-Message-State: AOJu0Yy62n+Yps3uRFPXebhOfmzPZUIYD4YiOiY0GdSv5K9wvIup4Z7+
	N4QRgFOX2Z6EWsviJAFeRq0nKWOxHURDrV90VHzwvbthJjf36Low
X-Gm-Gg: ASbGncuYwPbLr93Wjlvdgk5dV+Jb0SQsdTNcArOTfJQN4DRCopBGAVbA7pxeT7ck34X
	Rfg11KJIsSKuRUIRlui8xDrwFasXAPCEgJ1pgCjtwcOIo5OaVdIEBQwoM/sh/a350KZ00/EiDW6
	Oi2Kr7aY0NzldxY4jZXkE59JRqDL14J8E/nk/JTCmM8GD91OLgB+bWql9ga8B9aJ4aYETrzf21Q
	bbcqqZJ3VL7ZPhwlarNWdO+I92emhHpyk8k2E/F0L/CB2VF+AZ6U/DPJdd/rZ88/WNjYQ==
X-Google-Smtp-Source: AGHT+IHFr0aj/z+89tWIhkpVoC3SkOL7MWt04vlkUhov0KBX5ymEsZ1beGz7jSVZU6bNnGc2lrRlYg==
X-Received: by 2002:a05:6871:a08b:b0:297:28ec:9b26 with SMTP id 586e51a60fabf-2aa06945c60mr10074338fac.33.1736685699705;
        Sun, 12 Jan 2025 04:41:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80a527fdsm2816771fac.50.2025.01.12.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:41:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: vfxxx: Fix the CAAM job ring node names
Date: Sun, 12 Jan 2025 09:41:27 -0300
Message-Id: <20250112124127.994141-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_044140_891625_9E14519F 
X-CRM114-Status: GOOD (  11.68  )
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

From: Fabio Estevam <festevam@denx.de>

According to fsl,sec-v4.0.yaml, the job ring node names
should be 'jr'.

Change them to fix the following dt-schema warnings:

crypto@400f0000: 'jr0@1000', 'jr1@2000' do not match any of the regexes:
'^jr@[0-9a-f]+$', '^rtic@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index acccf9a3c898..6334ad4aec4b 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -725,13 +725,13 @@ crypto: crypto@400f0000 {
 				clocks = <&clks VF610_CLK_CAAM>;
 				clock-names = "ipg";
 
-				sec_jr0: jr0@1000 {
+				sec_jr0: jr@1000 {
 					compatible = "fsl,sec-v4.0-job-ring";
 					reg = <0x1000 0x1000>;
 					interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
 				};
 
-				sec_jr1: jr1@2000 {
+				sec_jr1: jr@2000 {
 					compatible = "fsl,sec-v4.0-job-ring";
 					reg = <0x2000 0x1000>;
 					interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


