Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28EAC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtV9SMxOKB7GoV+djrIvJpFf2SMA0j+XNe47HtIbik4=; b=n2VH5mjCSj92JBwpxWbWAaYE2/
	0+baBy6ITkh3m+2q3/yJfIwo7vQMIwGQJcwgDeaatHN/ptZDxx26HXLX/hEXHSaKSC33SFbMqgUjT
	Q3vjrG2sPW7D6k0E9lu1oBfSKjunSfLj0GtUJLQfxvacV2/6gMmGhC+xMxGlxZNOJ5IfA/4NBkFYn
	zD92zu5A7lXPlWN3V49BOW2mc4zrRfJTp+sGIJf4iU9BMk3FYqLBpSI2d1PMNkkmGBANGrqh0ZjkA
	MAFvQT9T50UQsp5JVwPGg+WbGM2acCUfQMv0CCVBVzZTqJfaDLF/nDOH+mfd+XRKDP+YgxT9XXINC
	SWCVelUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9F5-00000001gL7-2fZS;
	Thu, 22 May 2025 16:58:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9B4-00000001fYF-1sKn;
	Thu, 22 May 2025 16:53:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so67238665e9.0;
        Thu, 22 May 2025 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747932833; x=1748537633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtV9SMxOKB7GoV+djrIvJpFf2SMA0j+XNe47HtIbik4=;
        b=T+k6fXq3egFQgM20RbgpP9oYsVtcIjC6Fq4Vc3DtXv3hutAcyjPXxxa7ZDaeHCR3Lj
         Ya1hpoKIKnx1xKBDfZphb0ivCTql8aHqjQuMCPM+tdSyCRIDm6WKS7rT+mg+MLxL79Mg
         4yA4LHbAgyTETqUfxyKAwRd7SjoHv4SeiuUPXZtj7NpT2IMcg4A97WTlhqKQBM0xqyUd
         lBVRTr5iYyr+CIqhBJmpudzotVFrntid8xy5LMhSshU7ZyU1oMs5PjtC2Q7VciEKZ9FV
         JVfcydbNitsY3vyVaVZOG5SJPkl12dNDjV7+ib9z0TeDCQ0eWYWrf1R0XpfLDMayjKjl
         EZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747932833; x=1748537633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtV9SMxOKB7GoV+djrIvJpFf2SMA0j+XNe47HtIbik4=;
        b=SBMUNAUc9lZ/CFcVF6puUZF1ZfO4QcuyeImAnrFRw6xPb8SZ0eRQTYD0bEgMFDwjkz
         r76DIXYlNQywk2dn/2BvdHc1YuIRJC1Hv6Yi9476JnfqWlbBVlb7IAE1Aparp4J9173r
         7OpvQM59r/iuqeZLjbA4w9Bk106mTUU36K/didyqbSkuZDso3u2aBaJtsDUAn1vnxHtv
         fqciYD/MFHQApf7SZ+E+KVBfHSsqWjqB6U4f49sdtqSdnLiTy4ohd55GxYcuCdbwtXDa
         VpKESAXBtUFf3kDsNZMnY1bDIxhg72q5Dd98jIZhDwxQQlwqqMpIwx89CNTUDCZNW+tp
         dzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp6VxHq5Du583kjCkHx9TIHI4/RcC1tY9NuZAiVoafHHjYfZRPOD/bADQ5c0D+uR9x7MVEzcha87t8veOtwAE=@lists.infradead.org, AJvYcCXJCUX3vs+yJGkg12SIQuII9eSBBkOIfFzeI2gEODAsWmA+ShKvWKaHgMVbddyzMtJMJu4SSHVud2shSLlrujzS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp4Ybd3AQCUk5EiDwthTGJ2cX68nYXpHkhkY5XRzz+RMNMKs/O
	M4pPQQucxBnGS5R5myZtKUAizJnqF2/W5GdDAEEcEGSgOT+PXXcC+Hnq
X-Gm-Gg: ASbGncvVFBsN0YeaRT98AsUkhkoPdnBfHcCCf0GowokjxsC0ewEPTcyNZqMJcf2A2yO
	jBogZvuLteoOCHrmCK2A0b+2hm7kCYscA+5eI8R41h6Je3pOxVtb/MSgzlUInkIf/3oKy33RSo6
	N28+o1OwN/NYwFg7b1NSJ2IFhvbIDwYeb8D3pON3isrpE/aDfUh+lyt9O3ibkR4C06ADYEiVawM
	DwbSwW/AWeQQUNQ045K1PqG1ieT5iaPLkI6cpWRNhtBUEvZ49UWWtnPq4nxkT9fjczEZDM0z756
	KyTIqX4ajWpOiqCKjXyFH/y12NOC4J2MozjOHVcluFJO8ja8Zv5TnEJHiq+EHDxi+RvW14hMnq1
	eyks9W082LVyRB5p7sSRXHje2nbTdi3A=
X-Google-Smtp-Source: AGHT+IG1T0G5yH1FK1thK1fMxhgoOJ3qYtDlQkaBu0K+RUy9jpWdeT6ZDqtYAcPVISb4W8cXirC8OQ==
X-Received: by 2002:a05:600c:8207:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-44ab9e44edcmr33448105e9.16.1747932832294;
        Thu, 22 May 2025 09:53:52 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f6b297easm118737525e9.6.2025.05.22.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:53:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 1/3] dt-bindings: net: dsa: mediatek,mt7530: Add airoha,an7583-switch
Date: Thu, 22 May 2025 18:53:09 +0200
Message-ID: <20250522165313.6411-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522165313.6411-1-ansuelsmth@gmail.com>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_095354_483106_063160DF 
X-CRM114-Status: GOOD (  10.92  )
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

Add airoha,an7583-switch additional compatible to the mt7530 DSA Switch
Family. This is an exact match of the airoha,en7581-switch (based on
mt7988-switch) with the additional requirement of tweak on the
GEPHY_CONN_CFG registers to make the internal PHY actually work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index ea979bcae1d6..51205f9f2985 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -96,6 +96,10 @@ properties:
           Built-in switch of the Airoha EN7581 SoC
         const: airoha,en7581-switch
 
+      - description:
+          Built-in switch of the Airoha AN7583 SoC
+        const: airoha,an7583-switch
+
   reg:
     maxItems: 1
 
@@ -291,6 +295,7 @@ allOf:
           enum:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
+            - airoha,an7583-switch
     then:
       $ref: "#/$defs/mt7530-dsa-port"
       properties:
-- 
2.48.1


