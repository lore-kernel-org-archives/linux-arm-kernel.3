Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC86C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZpy5GPgAtfFVvCtInpJGMk0J6F8LViPBE4i9el70qY=; b=oOLHlxOEISbPq6widDk/soi+Hr
	fzKc7Xs+717mllDhrfHbLfNZ/aUYdq9RJ4J/wJmnJmkUY+j2fQxnEaK0BQagGvGkrN8sN97yarvhY
	RJbJNc9hPk10y0u06eIBp3Ma4aI+0UMHXDCfRiNebG5f4/ljqadwZV/5yzKnf61sRPNNgWpAYEUiB
	MciVTG2UAv58LoPysbGoxN8TbRaexPzgvb3B14od3/1xcuTBW7ppC/r6Xvas85dGEToeY+qUwSK0N
	ydZ+IatW/ZHDtoxXYVgvjw0JFy+eEoIihSsUGi7h5ZO8WV16QI7NMJexeBrZ96HdOp4TWdFIzLXJy
	x/pf94sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKv6-00000004eUd-3Vra;
	Wed, 26 Feb 2025 17:10:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKg4-00000004bLr-1z70
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-439946a49e1so387765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588871; x=1741193671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZpy5GPgAtfFVvCtInpJGMk0J6F8LViPBE4i9el70qY=;
        b=kR+qHrodVtYJhRtN2hJkyIObMyDC5auG4IdmaSoq6zWuB7ArWY2X4cfrmQXvEhPjGh
         HuI15h1lcACXtMZYVubxxMHv27ixC+EZOj7rsLfinZEzCnEZnLOqzENlRAv4n/PY5vDP
         SuISZv5W8zM4E/mlZu6kmlzAsAXGCf2QH6+mMX1ptK3WBbA699hvUTdVSJUKgrJ7e6e5
         Ff8ljf9f8qHVwKuUNqz1Iht8/sRsreDapH1v0rtniRkULMBD3sFwPa8ywqB8Rg+YuVH8
         RSOpzBQT2lkJNunDS9Zo+q4DEnJruH0TQ+uP0CI8s4kE7gziUE4wv2L5NuPPuKAjzWVx
         iY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588871; x=1741193671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZpy5GPgAtfFVvCtInpJGMk0J6F8LViPBE4i9el70qY=;
        b=V+j5eXWyStdOj765MVc696UndoevHe0fo6q0qqLpqaKBFLUjNiYvPtgY/39XmMs5Se
         skJ6Ulo7vEIB4L9JBbbnUplZ6AMXMx0wbSEOUF5ZK/N/viwP2ARZgRwf7hCa1Q+1LAKV
         GDlLRUnSuuaLLUGVzwjep9FAoJJyhsg5HG2qqRcpqXnfaddZxhiWMUyCrUIzI0sUeLYe
         +3iDzGvI24AHvbksk924zcnSF1SkvVJlafm/SrgBD3BMmaD/sYbPgEvbrBEnSB4pnNeX
         HmKkoMkW13wFAQtIZHxp7EqEYEpyDEh8rRHzDEGPlmITU7pPV6WFEZRaviR+HO+tt0aD
         /CuA==
X-Forwarded-Encrypted: i=1; AJvYcCXmBMmUM2740DFfrc/45+Teua+EDqii9MYTuEatQU5W0zFG0abPgUlooF/7bjStUQrJavPYUH6Lgv/2QkLiyVKv@lists.infradead.org
X-Gm-Message-State: AOJu0YyyPmS0L3kWUbZwA27qYYuSdk/QfszVbxa0VyN750rr5MjctdKn
	a1uKuPx1cADXgcutQyLksrFCaMSWJnHWixsAiM7ekfPHBVtGUWUb
X-Gm-Gg: ASbGnctZmaxaxiGv5XSVvFmZU1rBiq6o/wm7gzpciB3rMS9/sTzMdUR0zJVrcao/RBE
	r0fDGm5uR6VyvbeoMZ190G0wUKmoMCrFchRA14BFslMfzWTJmbks9UYfxBgPu75MVAL60xwj+pp
	H5FlEMuVqzTdceISys8qMzLmnjYaZp2X3UsGOIZTIIgWPFC3Ba/rLwV6V/JZcd6AgWvBoasthCH
	tdf7fap5Kuiev45DcKTkMOO1Ckv9goIJGfND6aL0eNCVXxkiW6VevoE8uUbG3S9WLmtH1MBeAOK
	rtrWr7YLGIzkGohuLs8Q4+gY6u12b7sbplYWrWogXDk+Q93N28gklOd8wCAxbWpe
X-Google-Smtp-Source: AGHT+IHImZk8rItKoGgyrvgUbtToZbbr8RHyX95hu/4NZrjTjx7+3Bt9rfSiRS3zYUPBD5ly6hBYtg==
X-Received: by 2002:a05:600c:5123:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43ab8fd8ee4mr38322665e9.7.1740588870582;
        Wed, 26 Feb 2025 08:54:30 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:30 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Wed, 26 Feb 2025 11:53:14 -0500
Message-Id: <20250226165314.34205-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085432_512383_E079194D 
X-CRM114-Status: GOOD (  12.18  )
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
index 3097acb4bd21..3550e44d00b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2423,6 +2423,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


