Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0191CC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=; b=wlhsFDwNpWy49S7sv/E5kmEpbh
	VLa60DXrIE3ZCS8SPUfwm6yrv9DnUJjIWPd28nOfHJ7yujrZ30zqPmqbcUGmqVrgXx0tRRBibi4NA
	ABLSsosNJJN3Z2GXyenyLx6TX6zrkeXrJ+gWI1Tgrgi9Y77O398c2JIGzsylkfa1DKRhrcPTyYVHS
	9OaXo3S2APngen0prCFok2CRkdbu4z3fAYr6Es6oEkzRpCSSQnw18ce1PndTZi2FvtyUB3cua/W/+
	oHHRuC90cVYkAXawa+iOEDdKUhZEC9VtWmU4vu67R20s9VtTP4QpVcwOT2p5eo7pM1OYjx2vl85Jf
	W2XXkoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7V7-00000001IeM-2mK8;
	Thu, 20 Feb 2025 14:26:05 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7NC-00000001GSp-11k9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so1702954a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061073; x=1740665873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=Ukiz15mm1YC84k4JopZJgNSIoaZhIQkV9NXXbLo48Q6uICVCPqnNqrhuaMb9LwvJaI
         nI/l8GDuvh9teNbTkBFw+lpOeLybK8sG1WhVdfgc0L/6WxSBEg5mN/6y7cHvK3d59YnA
         GgTVlJOj4p+6e4KqxSSBvlDaKmUtBbSQTLXVFIWhxxh3QUReXIlxL3IQDbuv3n0KlXFc
         by+sNh0mIHPXkBIr4DJQlOzyKTIiSnKFblFyGnQ2N3c0Jhj4vW3jAuen5QXc+zOuuxoF
         pCvzGY3qYvDihbNr3iwE0K7vQRUmkyADmkW532Op3iHJsPKLHdkN2U/ZGmu8E5tUQ+PZ
         BQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061073; x=1740665873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=fo0sDqvT+hrvuKASJakYQwouCDfvcHR7r27My2mMSj0xyWsajRuU1DZWUp5Sg8BYNP
         M6Gk/hXbCW62T/Q8nRMIAbFWVBHAFfd4jK69TnLPUAEZM5u0RQuHPAvyQMstF3xkAizh
         igXGFs+N8MxI7GM/0L9msO4dvsKRMv39uzJqloCSV2g5sjgXNMFZEv0ps3sdmycnFiCs
         LbeLWQgHwp1BnaSe1LnlNl+3OzldDxzZ2pOkjQ8tUIMmvxjtkzuGY/hsooCtk3uCHSyH
         iPGFtsfE4gqEJDyEHze9GTqkcuFKSC0m6SWafOuIasJKQs02TM8frckFdlOQG+DN7ei3
         4w/A==
X-Forwarded-Encrypted: i=1; AJvYcCWyG5mIDmTbf429H1EMQ4w74tk6Z3/W8i7iTe5zolI7PIFntNDQkQVYXZ1bE+RUHd2YQB5QnO+wdku12M5tjG1g@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7r9fQmWgVcx/Bq9NIaWFIqUT8uwd0IAggGMXb7YB34G4TOvuL
	o0tajl4nmS1XXw79ztPU8vFSqgf32Npu6fN9N7ZyPoXxsx2qQl7l
X-Gm-Gg: ASbGncsPttfAwcfNJsZX0PC5r8EFNRirs276xVzq2MxFaiMfIh6QXPkxTeuF5ZDetUr
	hNWMFdYoBIc1G+YH+MHk9/0zTQHcTtcCxHKRkgDiqYz1rWiTlK5qkRSMICgmSXb1oTEDetTEEOR
	ruJ+58MSR1bq3RHffY+Or/BI53zoCNDU39lzNHoTufBP32M//8WCC9kKkbO65+S2Tu4pGNMJgKW
	YyX5CBCaV2EWZ8KriP8Kb4XGS8bAB8qaoTvZf0H489wb0yRDGDJptm4UYPjEXmrjfQD3wKhZimX
	hjfbek3MxgJ7yUqH8tJe5PBSdE6t
X-Google-Smtp-Source: AGHT+IFJTXX+DBbct/Jp9j7V17SgXIyxDY15+dtpRb6rLc//WW+3bSD4xvTcn19KGL1thCMxcgoDSw==
X-Received: by 2002:a05:6402:268a:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5e0360b4cdcmr24048577a12.12.1740061072625;
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:25 +0200
Message-ID: <20250220141739.228714-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061754_282300_DA460138 
X-CRM114-Status: GOOD (  10.24  )
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

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0b..766b0e5fedb05 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -66,6 +66,8 @@ properties:
 
           clock-noncontinuous: true
           link-frequencies: true
+          vc-ids:
+            maxItems: 1
 
         required:
           - link-frequencies
-- 
2.48.1


