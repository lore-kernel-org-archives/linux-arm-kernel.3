Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99061D6406D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KMCfTLhRPCYocCD5Sa4l3D1sRENu2ZmKQ37zZUrHyM=; b=TCmLEUATjLUukzM+qu8BuYla3y
	lfbypk2r5QiG1E/Cd27088M3xdRLJ5FYt8diwoUbi4Uw9yVi26Ej8EeDrFeAjw3XKtIhfTlu4ocPQ
	QfbxHeHbWHIMmtQ0wUK7pQGwIELtKUzMvxsJeFQCg2y/Gs2kFOTFUG/fBFylYD+TKN7cH+Rvo+o0S
	vNQKSwSAR+HR+q46+gWeyHaqgOTj3o1Rv5yLPV14vpm4EcRqyrZ24whJIZp1+K0PwJg/z1l8/NnNY
	UL1VmoE7vX2fSEwlndCr3lHZB2b1a1iFX4nGKrQgbFdqv6xvb34WjPH16ndxpGDphQdSDXz4W4UQU
	5qFmbXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUn-000000064Ma-11Rs;
	Wed, 17 Dec 2025 02:42:33 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUh-000000064J3-180Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5693271b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939346; x=1766544146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KMCfTLhRPCYocCD5Sa4l3D1sRENu2ZmKQ37zZUrHyM=;
        b=dG1F8h0yHSCiUUVw/pb+Kq0tArktWCOCryorZpR2o5BgLzyetyRsaWOGfMkfZYGbOP
         w6pKONepVpsAbp5Jr1fXuYmeocSKxNk0oHHW1lhcA3fPuJscw6Dj8A9nHV5Qy1w+zU6v
         hFoMqAnB3A2IziSfpNdurGyh5YdI5kc9TfCK6YbQNsw2F/B2PS9rIKMXOCfIS2eNIueL
         /iCYBsPt4bCrEksaC+tWaFZh/NhFVQW0qG5+2146veEJn/Qki3gMbuL8B9ZelNJwUdQ9
         ZTYUX1UH7Ddy+JoY+06CgF8wSVPV46n6Etpu/F7tW8rysqWokqd1KCFh8uNIBAZjA3Mb
         NO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939346; x=1766544146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KMCfTLhRPCYocCD5Sa4l3D1sRENu2ZmKQ37zZUrHyM=;
        b=v0L39gojGtAg8jYmEmSTNwu+4eycP8i2+EQpdZnwqgjBfqVKjbRBJAu9RKcGaj/Z7b
         DfYCOTnW0BeRT2yar9ZAwsbTL2IAx/ymHU3GyRUoCfz6fRhc1FAKj2s0ad2oBYDnhiLv
         RNq8tl2fNKDlhcFVEdFfJ3KNFVTGXcaiFWB5LctBD6cejWsAWxHTgfKfLQXOrQYamTZc
         0cxgIuJUR1RdYtlfbqtDGfLfVKucOCwNBVqNPQhp8u5wjfP2+TKeG3UEh6Zsc9J0v08O
         tizHZukQ2IXu1z7vSnETwIWuDM3sCuJbcZ2WCO8Io1CPEwDsiM4PAOkH4rP+vP4kOjIF
         X9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXQN71JGS40tFeA2sq51d4u8cwKtc5WBf1aiDkAvshH5SCIoS0WIHJvNbn2bi07PKT1/Opd/JmQpsl/t64WCdsK@lists.infradead.org
X-Gm-Message-State: AOJu0YyFScoD/6CSrXdIcXn2Tdmomw5yqLuCDiYsn8sIe5Yh+hMm34xs
	UW2ZvZI6pDokCXV87NcDCzrJC7VJfKhDGJroEN01r2vw7IC/BZbMcFqy
X-Gm-Gg: AY/fxX6L9hS79/36hQs6anT1DJQ81Xj/I96m639K2yhvI8CjuhyLTGw01tjurbW8l9J
	jOVpaSLheMA/WRIPKc4bUIrzAEkAdlTOEBkjOOCI5CeURD77ssEXyqovsN1Gtc/TMf1nu/pSzA9
	PN252DZSfxw2mAAlXhP7IJOucuhFZVbhMkLYbIFM1rpo/mTtZsc+F8iWjWS7io9aPcThUJsu857
	8YsLsgS29eTGTysX8Auye3z7pMOniUI6Q7yrZMyb1uvlii3prysENjOfrQLqQVmu61/Y7crfdQH
	Bf5d5bE5Tfwm+2pHyZy5ezZrAyQx8naAiXZ6zLdLokJSfjBGtnC4JdLSyLGBRmtDAL+1J8eF9Pm
	h4acS0GFID6PxWe4jGgetWZ+2mG+Ya479Wed0uptFRFzGW4lQCi7imFKGF4iL4bT/Eg4LM0LwTe
	jx7bMOfv+x/Afw+R45fiEtthHsWLMrGaHeNDFSP0iJlTgSlgcyNYwfFFr2RMvtgYrPdX1TXdtlA
	7cOBW2xS8abvCg=
X-Google-Smtp-Source: AGHT+IFxLVoztRFrvzcQi+RXpwRMMUWexU05bJJDnAS8n7MfeA0BGia80wGlDQVbtEkO9IYQg3sFkA==
X-Received: by 2002:a05:6a00:b904:b0:7b8:87e1:a62c with SMTP id d2e1a72fcca58-7f6702be6e7mr13723830b3a.31.1765939346329;
        Tue, 16 Dec 2025 18:42:26 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:26 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 4/5] ARM: dts: aspeed: bletchley: Remove unused i2c13 property
Date: Wed, 17 Dec 2025 10:39:37 +0800
Message-ID: <20251217023938.445721-5-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184228_327769_4CCA6307 
X-CRM114-Status: GOOD (  10.32  )
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

Remove 'aspeed,hw-timeout-ms' property which is not supported by
the driver and causes dt-schema warnings.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 8df145d2bcfd..123e2d1891f6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -962,7 +962,6 @@ fan_leds: pca9552@67 {
 
 &i2c13 {
 	multi-master;
-	aspeed,hw-timeout-ms = <1000>;
 	status = "okay";
 
 	//USB Debug Connector
-- 
2.43.0


