Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D6EC1E89
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/+UNv1yjJPaLGJLxmiYByirfIe+2Dioc065dJfSUTI=; b=dMJlTG0pKL7ACkXDSFyMeyjBXM
	OunC/KSU1vt/ghsUFWForlOx3T4DQ8OsNZbue3vHX8lN3tJ1a8TgBsfNgoongov2RdByvFkhgWhoz
	sT5sSl0HoCOO/UwUIazMfGcc4YfXqQ/huhJEgFF5m4VvxeM31zBeyX6xEpQGjkh1LwEIBunHZQLCy
	omtwIhQvD3cHLPRTQQsiimU/UPar0HMwVw1tTeJNyL98mveLdR5Dow6x5gRBc0v0FLNqnCpWbrHdh
	yzUDHVJS0/aBULOMNvUdI83rsOz/AKwamWTUkNnfOV+JoscTiek1sVxduB6mrASTEma1r1JC/Abfu
	RFN5t3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwBT-00000009kP8-2Uac;
	Thu, 05 Feb 2026 10:01:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwBP-00000009kNE-3N5H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:01:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-432d28870ddso511513f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 02:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285714; x=1770890514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/+UNv1yjJPaLGJLxmiYByirfIe+2Dioc065dJfSUTI=;
        b=TnWKCAc5QMdFG4ztWOiQBXH3ncHTb8Lwcy3VBYwRJbMj0O9jEHWiFatr4lXTlldrMU
         ujAkuFL6r0DXQKUuI0X4inyH9EM20i6A0zkEOzq8WN3TgMw+e6EhoCyDkvZlI8Beoxak
         4UU11O7ODMzwxyiNh3wuhoDfwSh0rfLrNbH8n5STTuK+bY+w45Kicy45s2yoSP+qhyCT
         2U4ALYtH9GJWQe6XQGj3MXMcXKZlfJjMJ+I0VIPdKYhj7b0opfd+rc+V321w0mvk09q8
         DzxlYG/U2QqcZdLWZkm85671n8bzfup0kqbi30wnsTVyOyR9TR/yDm1GJh/rd18kzH36
         TR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285714; x=1770890514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/+UNv1yjJPaLGJLxmiYByirfIe+2Dioc065dJfSUTI=;
        b=cGYHQLxAOnXam4uPj+LpCSQaLw5OFSC2KOuKFqbqgbB4qcrVvfyAmkPFTvOs2z7XQb
         fnVRkNNoRLsE7MnuLzsDLBxAx3MKU5U84YEgjDI9UbhlcQNtwMQxYMtyLyaeQP+RybKG
         y7SDJupIMeNZfkmAIu+BkxS8X9L8TataE8pc6At39SoTfGWLNdPEh5tF6Ic+iwVM02Rz
         d5eBIQmGPByVaOiMceGmlucYjrA8eUlO3EA6hzBY69nB0iGN9M4EOhK+gDGoT7I5crju
         XqPYHLOAVDT0WuK7HOSm/SQV/FWplVVE6cAckkZ+ARnioYYUC4ndwcYYE35GEi4mcYOc
         FGWg==
X-Forwarded-Encrypted: i=1; AJvYcCWT99Ey/TjwmrdhDU0XbgrlzrfTMMf8JQaWnFonRtGR5K2zvLVLM/5X2wzYtTR2PkyDeIxw/A8AiejtMmu47goJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwJbTdZFGla8fjocnSaXN/Z/am4QVxPOM9DddTCJkNVscsIAlc2
	p4Qj25/VxmhZH8Zwp2tb/rm8AjWA7QQmCsc4aNWxBLM2pQ28w+G8blhz
X-Gm-Gg: AZuq6aIYamwBi8yvbMgguqPy21mVi/8CCPdZoJPqRfJwiYhfqBbopIKZmDN16B+Fc58
	yQujsR8OxokH6zIJx81GiVrJpPvjwq6GRGOAV7N3ycaU2xrzseB7PAZxaPWfSDrCuY9aFnKGybB
	aXWjvjnzCYyHWJ4jtaYL8ilSpuBjTgOrWSUghQ3I3x5bTRL1Yufj2VnIfa1lMACYRzXG2/L92cL
	DKeDCYOIIfuep11tt/fgVUlmF/0tLEysVDlUHWMQ5KS83NGYBdXzvLWyGet6E0vnKgKOaaAht45
	W9KYbclyHzMs1VYlAZUgRTau1ehEKqqBV1IJqVfuiLBlnZQl7oKSGXNOF+DirH5fPXKznersW3V
	djwqdBFotEmJTLmCS4eZD9Xu3GJmsIOBy4sGYGVvwSaEI6dSA6R72fzwOkpGqKlnb/5TUaBkVtk
	x4VLJdl2CkQZ682NMsCH66bcnCor/vmK+WD/xcs/1VGSaDGo1kIkSu3cRHCQuzaMEQtwnUUKWl1
	Q3wRDBseNR0uksNeFL/WoR/HIDg
X-Received: by 2002:a05:6000:2c08:b0:432:5c43:76 with SMTP id ffacd0b85a97d-436180533ffmr8287887f8f.39.1770285713719;
        Thu, 05 Feb 2026 02:01:53 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fbc5sm12025466f8f.34.2026.02.05.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:01:53 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Thu,  5 Feb 2026 11:01:23 +0100
Message-ID: <20260205100125.9095-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
References: <20260205100125.9095-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_020155_859637_2F092575 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 336669e16d7a..4c200a67600e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1524,6 +1524,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3


