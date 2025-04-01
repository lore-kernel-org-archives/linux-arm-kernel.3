Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6572C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=; b=NTEfSzlVC4bH0oa7y4CH0OrigJ
	ISxqHBmXi1idYGMaUUGZMU741BsK53g2+RWdVediYFT2G8VDCfArj8kueJ0u38xr/nkCvSw/BrLvH
	wFsRDnniXwwQY/j29f7BOETt13jUD1IeIkArlE88X4XlnZqHGxHUyXmXoWdU/zAQ/N2V5fDoGfpgQ
	4rCnuWHwBpibdfVj2WFtaQcaQy/MAleToM6wALVPJ/R9XHjy6olrFPXhQ8uawqOIvwTduhqrcT+Xj
	njKdWBre9m2aZlEwsGLe5KyOXqFP88xrK5d3X/cIUpCDHKwFJGib3Zq9KDYPu1PxMj02KFrHEvXED
	pExXwGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tze4C-00000003o4Y-1VyQ;
	Tue, 01 Apr 2025 16:02:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdoP-00000003kz9-0nAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 15:46:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso41902875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522359; x=1744127159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=WTnrPK9plhnJtIvVJWojnbVzmFSVEGK1pXkCgfxtVAZjOg6pLStBuTqF34+fWGF+J6
         17rWVDsz+VthYeHag4Z87VMp2URzwkYfCYX2kj76bI/BPdto0/i+4XS4sY3Vj79H3CO8
         JCUv+w0KWIfnXZZo4Dey6IPoMbIEcO4FNZQI5u6RQVP8M/u1LAD3eAfnLKI+E7FA/j5s
         T6yM9Uf4NPZoHXqseMnC0isgost9ONiJc+pD+ckXssGDXDZZAw1mNrNLiZuw/kTCKlVR
         PpPrNhZikKoBoEX1dEUaiRLgpDfYrY8pDdxWDQx5+j8gmP8RJ1FXtA1ZRdE0QH0IQsae
         CsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522359; x=1744127159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESjB9FswjsXqDkh+hAstUPSbEKWZtoMzCjv/1OB1iXM=;
        b=DVfJAJ0yVU2aT2Mm6lrORk1nG5WnvOkpXhd2NVu/Te/DR9h71xjW4A38rCMOMWOOwZ
         jVwX+0d4ptJWBRIoke1qOLNMNYbnKwIGEnGIrlMLPa9LKRTls7RM2IDGKoybrXxHZGWU
         noIBeAtpHTRThtafS6MDrFk7S7L0IiQMrDT2t3dlip0EvNdLBUJ3D+i+JIeDBTTv7Vgg
         YClsDReYxuztG4+VnrrSFHBo4UL3ByQZV9UTHHVTbP7/44o9Z84tZmUSiqjzsRSV9Dgv
         Mo7ZrFTD6DZL9v6D8ftc3g7Rk/RGn4oZTaC6jtfLFasUlp5joRhJxTQzVYpFk1sTZWcf
         ULuA==
X-Forwarded-Encrypted: i=1; AJvYcCWrnowxW2xX4sM00tH/JGd1oRzfhiAn+Z8NFWeb3/xtQptMgoUQ/xuFy+GnEG/YpT6tzAKpIjIeFl+sV1jNJgVk@lists.infradead.org
X-Gm-Message-State: AOJu0YysPCsVn2qclPdkHGZwcx0WkJ5LB8kh0Gj17d7sZRSy9QIBPnRg
	wZ8Z7MFPxh4TGwvdCFpSHpDGPQ8uEddjz1EBWBtKY1TDYZaR76QZ
X-Gm-Gg: ASbGnctX7n4+0WMwVth2iHh+7ml/wj4Rmsuf5CyHG1YjMB1v7O/uDBVgX9Kdx2Q3rzI
	zSuqPhQNHJVbrWJmi/LnPVPyt/ANdWxUgOeFTUsAUa+PIXxMCsnszA9A53QF9eARVnFCj4Js6uV
	W6ZVAvciwYzHg9unw6FevhXT2pPYpA3ijsqMr/Spk8UfF3qO4YsjHdgsBJCUSc+jFjwTVlM0JZ3
	N1zRXnNVjGT91uxDZdDPHKc8+ywefH+vkd7pfE0x2sAHiVLsNRGBrfM7ODQcbEQuev1NNPbPzp9
	8FQMgPVtOrdnUeuhAYlGClxHTVfI+h+qJqGlqGFttsCPuWR9g5yJPeLQ219S2BBD2hgYQfHIbi1
	xWMIIpOmp5gY3VWNWCw==
X-Google-Smtp-Source: AGHT+IGKhtb6fsJZMzdARBi+gb1FIGOla8Dmwwf9ptz7h3kdFPWq1TAOfA22Dh/s0xKKlSvTPmHHiQ==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr5198566f8f.2.1743522359440;
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  1 Apr 2025 11:44:04 -0400
Message-Id: <20250401154404.45932-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084601_245627_4A270C3B 
X-CRM114-Status: GOOD (  12.96  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


