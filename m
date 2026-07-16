Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0636C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 01:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1GzXJ02dC6eKcnmPc9kbjsM1/1xWfof1/6ku+zNwhw=; b=PJhB71i1iLZ2PG49xRjl+WSfR8
	kNaKkcXRaNS+ew8lqVkT//Jv2aSBF6hS7/A8o1HYnsNPwLO0k6wy+1mQtcZORZYob4pmVCiVUxnlK
	K8c0YwBY9fpMeAmg5fW6K1ORSzzpWy52K7eBJP/fECJdyoFQmoD6EDJlgSoVrY4gPBMt2j64XQdRE
	xFA2speKc0IRy1uICgiT0F6vKGPOaBLJRlrK0ngS002Jzra3yXhnDpe8r7HlFt7sJa6Kayrova3Jm
	nx+yiUG2Y0iAMD89TDFHfh0XH4/6Aw30+ssreDbmu4IqbuAhsJYHqLTCO985/+DHHaGugZL7Zz1/2
	lDzz3rLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAuC-0000000GCBQ-1CaO;
	Thu, 16 Jul 2026 01:28:52 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkAu8-0000000GCAH-3Ajv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 01:28:50 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ccbff2e6a7so39398605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784165327; x=1784770127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1GzXJ02dC6eKcnmPc9kbjsM1/1xWfof1/6ku+zNwhw=;
        b=lC4cM+96+Xb6wrLKlfnNrb3A6u/Kob/tRgoCWfksCSiFmozHKOnJ/NN3VMt2p+nqyy
         kIx2bhtVyC3fLOTq9mFumIszK19bJ82gGfN5MCwEGHLVhTUwx1T8d0HAEv3hRIBMY3iO
         J9nmVwNFiJC89sRw0KkCaDc19FbGCWs0yNLH28e8D2RcjutGx4Ltf/VFeNeopu0Cm2jf
         JRv3vaxDg9csgkpV3/KZUFCxifIoHgqfjbrQFylPRxnr6FgZUEPHn93Q8Dh9GgrqAWAt
         tyqBUtgBPbKmnaavS6LT/fG8cuDALR5O+TN7j4stP7iNG3at5sXUldXcTU27kiyCKJE+
         rx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165327; x=1784770127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1GzXJ02dC6eKcnmPc9kbjsM1/1xWfof1/6ku+zNwhw=;
        b=QXhTiWVVt29yGTc0G1ZpNsymgHA+rE3Cqtsq5VLbXZ7PZijcqdMPYluo7/zsgkkOTP
         zWo3Vip5J1OZQzjNAuoK2e3+2bwtv23ZeufRyanOfozM9JSCyMfez+8q9/qdQ+2iz5v1
         UDrWmc68xOQIx4wA+ICtY7C/PiFfU3k82CwSoEyQQeijXIzmS8r/9C3Oz9e+8z6leYHI
         Akc49/QDTMUXWo3GhPJnUHeLy340LAy0pLXANpGAH0r4Cfs0pw5Ng7nQm1hRLc7Bm6NO
         0yU3QPmKUaN8a2HTpbfowUMneSbsmRoj58h0YokI0TI8PcuxLiXG2mCQO9sbJrAUOg8V
         naOA==
X-Forwarded-Encrypted: i=1; AHgh+RqvQFiC8Q2vcrZh5qJw8NDT6h5lUaLyFERi004BsPAa18gsVZj0qzGGoN0wSuKyV2MWvsin+fzOYufRr71ZfYYQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4HvFXdyshHu1IGB0OhwARRMnDRkKUYLI1cKcIy+IXK0EPvz0C
	S4wM1plccNNymbdCRVpp6LWnEGv9Xu1yKoKt0yJf0yQUdCO/W+rm5s1pF2wRZFftm9k=
X-Gm-Gg: AfdE7cnYI/hg5549fS51IZgdDkYg2EySJds4MFmafO3Ip5O5FljiOP7X25fiYaVgUPR
	m7JBK7uaz0cvZ12dkPnM+pXGLJ5fI7GFp4aR74TnLXG5X1TLO2RUaEZk+ypNx3CqLRtiZpuNwW5
	zL8Ckpbl8yWiOP458WyRYp2qYDw0S2xDIe7QC7mBpXpD2o8FLp8b9Nds4xhZVHxyluqqgtzaAQj
	QKrR3jMX4MLUxBcTPwF/KhGDkmBGpvjuXspm7GUjcFHbme+u1I0zkUfDFGbFg2GP4ofay8jVODo
	RhuXiCbyrLHxwSl5GlOCh2TLfatrRCfZ7ciCdDRKlK05BiGG1D8NJrrJUO0YqHqOZgLXjCfWEQE
	qi5nna42/EW84wmW8VkEj2DRCc3N5Q14rjbdRQsNv0r70xqR5GJSBBJWLPXr/UxulykT0HsThnT
	ns+CTK6+0ULE9j9ZJtBAfc0HnsG0WTUpkkE/fjvSK60dCUQZ/DlzxOi5PDVGpC2Lb/CXD1Gg==
X-Received: by 2002:a05:6a00:181e:b0:848:587f:8ac7 with SMTP id d2e1a72fcca58-84a559b116cmr8011830b3a.52.1784165327355;
        Wed, 15 Jul 2026 18:28:47 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:3ca8:26ce:2345:363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm3901362b3a.23.2026.07.15.18.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:28:46 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 13:28:36 +1200
Message-ID: <20260716012838.2353939-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_182848_820437_816947FB 
X-CRM114-Status: GOOD (  11.94  )
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

Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Enabling it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 link comes up at 1Gbps, and RK806,
HYM8563, eMMC, microSD, the USB3 hub and PCIe all probe.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 414 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 576 ++++++++++++++++++
 4 files changed, 998 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

-- 
2.43.0


