Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyQp65YrshJlf/E9g4tBCluPHZ0bWpe/t0XipA0RiBk=; b=UTCutvLzeNR0oEE++f77XZKZ0i
	F3KbcBLhHx3EETWxlJNacdm7HP9e33TwYP1NrhAcaq6E6T9Dt8b2Q6UzroIiB/Y8svZGP7VMpkasE
	RKM9tiQnTYWHfmERoaRl/D27AG2s+pl1dUxuH3HDOFibynQ1iF8xYobEnc+xuObjD0IY2v+76eQfo
	p/kCcUfNiwPLPBulvQWLq1VgrmsqjupLIsgAaMQyA6ZxjLRlT535SnT9DPDcWzIMSb3LALfhbxqdk
	uKc6/Cb45LmUbUOOyrupjN7mDdm0g0DLVWUOomXgJMJjS9LzZCJ204r0kw69Tc5psGsO+Hnvb1CXy
	VF46+/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBc-0000000AOgW-144R;
	Mon, 03 Nov 2025 17:17:44 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyBa-0000000AOf4-0weD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:17:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-781206cce18so5007630b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762190261; x=1762795061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyQp65YrshJlf/E9g4tBCluPHZ0bWpe/t0XipA0RiBk=;
        b=Bma45gJjirvmUMo1U03y5XGXnnSyMxfEwcglSzufeLtZfrLPR/Ba2QhH/h+h5rOZBW
         RwLh88GSOTDNigb0J8OeeWTOJ9UHB+V9s/hAOeCVb2sa3g5qwVtmaWD7ylSuP8dzZSSM
         2c6cPF0L9KjaONehX7gwNcaB6xyN7N+pQOr9hEHTQshtqzIH7baoqRFrGobS4iEFgYY/
         Q7W/pcMLhprKbtJUp8v/oq3U74c60PpCsb94bKlP94RFV8LUs8+Qq8pvvu3hA5rTvBwd
         l/4RqhTgEa7/ELv6i9aNvqpXHpZXbP4KXmj9xCFdqZaVOU0ONXSe1smqtbyKnuDFh+qX
         l0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190262; x=1762795062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyQp65YrshJlf/E9g4tBCluPHZ0bWpe/t0XipA0RiBk=;
        b=iMgufccDUjyHTOgCXAKddN/jukx242pVpPDVuKA42wgHMtzFs+MSbuyNBBQmPrzZ4U
         YiaATdMgHJe3wkoQWVLcesi/yzUDugOr1XV+mASOb/Y9J0BD21QNxDSDysXfA3nMOgS7
         cLmFEfn2pHqUyMnJJTz8SvL4M+KQtKdve1CvttUu9ucnnnXMipKIWHvJPqNQrFPh2px/
         XJaUu6tOG4YPfa9SJY75B6FfdwHX3g4Yi9Uj3s7e7VvZwGdbYOTDd8k71IqRPRPH9/L3
         IW5EjiSpPndIfeabeBrRoucrZpUY9X7joI6VXm3oCkVOEzYnlTdgDkEqq1YLtNRoOAYJ
         tuRw==
X-Forwarded-Encrypted: i=1; AJvYcCVvUp734gJ//4bbR7tAOp5+R0bNGHPD1ON4LYZ4Ppf6mgyKpbR9u+8o6UmRmOppAsjXhqN7S99h3UF7XQHtT057@lists.infradead.org
X-Gm-Message-State: AOJu0YwWae63f0mW4QzETi0JzATLra5VjcXPHwKABNBXWwRR9qvGwTKw
	TZgYhS1JKTk5FGtuzZtJHM6ZrnVMprYjZNe6HI5nFPcjCTVtjL+7tb1p
X-Gm-Gg: ASbGncv9x71WvH0iPC9fKyoJm3p/nshUqiAWqClUQnffUhEz1xeM1KrFATqY7l97upX
	ERLl/9Vw2YKOnhf7wIVKQLsz6aKx0BHeHm09gC39z2gVVJETfUPMWzGMklunXAFheSWkz/3XUpy
	Dv1r51k/elGEmSiBmuMVWIk1FGNnUQ0yzP4L7Cak3Olacn3tQM6xRE6uvhu0AiU7dwM33FtBw7n
	9vpiuediMBc8vJHBWecYmiHdYc0FlSXrNrDVNHXAHrk5rLQZQBG/DTVhD4RY8mPqOXAd6dMtA0t
	bK09pHryOfSfg6Ejxrj+BGqOZb/kLBiEZDdBGltRm0MoQiDdd1oTc8TdpBGgseTNOzIH3B29tzT
	oVocKmAp/cBSHIVRgqoaNRxH3QyNctrDbZEKWXaQ/kQoyny0LaJ7Y/Wb61BhqEEZINGZ2KgXfRN
	lukx1GF02QPA==
X-Google-Smtp-Source: AGHT+IG2SBCsPp3obcuh2HPn9F1zioqp77l2USqTslrv2MAJmfMr3FJvfEFhjKUR1CAermd0xiOHng==
X-Received: by 2002:a05:6a00:2e93:b0:7aa:a597:6881 with SMTP id d2e1a72fcca58-7acbf6ab4ecmr204256b3a.4.1762190261426;
        Mon, 03 Nov 2025 09:17:41 -0800 (PST)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db28d3fbsm12148112b3a.43.2025.11.03.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 09:17:40 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add 9Tripod X3568 series
Date: Tue,  4 Nov 2025 01:17:01 +0800
Message-ID: <20251103171702.1518730-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103171702.1518730-1-coiaprant@gmail.com>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_091742_265406_2FDFEB30 
X-CRM114-Status: UNSURE (   9.10  )
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

This documents 9Tripod X3568 v4 which is a SBC based on RK3568 SoC.

Link: http://www.9tripod.com/showpro.php?id=117
Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8ac..9b9b3d2c0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -25,6 +25,12 @@ properties:
           - const: vamrs,rock960
           - const: rockchip,rk3399
 
+      - description: 9Tripod X3568 series board
+        items:
+          - enum:
+              - 9tripod,x3568-v4
+          - const: rockchip,rk3568
+
       - description: Amarula Vyasa RK3288
         items:
           - const: amarula,vyasa-rk3288
-- 
2.47.3


