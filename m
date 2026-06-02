Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7897CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=; b=RKUoorQkdeqbned3RxIcpUXGuw
	XiKeAR+griTIh8i8LhSpgvsqute0cOCofAtFS3ZIFEVEa5diO/RBkGCOCTgDShm1JBBD72Y2hXeBf
	WwxlecBKBzosZtTR5YJc56ZPK9mWy61Mgn1kUQVbAmzCyXPCiieRhhLSmdEshFSQZNHMKv2e6Wf2j
	7gM/bEgQteotszIsuRVQ7r2jTvbqKz1+eFI8xShkn7mh0WceRibEotHxDlAsKM3N2JKPC0vYQX1eH
	NOPt2kyCzAlLd9vgwnekIc6//xFEU0+a52ighZBviJXTagd0uzye32dbVLNSDkFEVW918ON7inEVe
	lcW/mWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAt-0000000CkPt-26FU;
	Tue, 02 Jun 2026 10:16:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMAq-0000000CkOp-45eF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:16:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c3543590so15890955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395400; x=1781000200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=qcNRcidrxqqUoMWeMfdpxmKOezW7JfGm6cQL4+gry1379aWNrAMudzitTMtEqBom2f
         mylyXo7mrTbE7pv6KhZQHYD+sBXoWGItfj9T/dI3/yoi1aoSSYV//CL6zIwm6Jvs3okD
         zbNLxc7zlXwmpMoFT9dziaaZBnselBOBgN+FNuIzvzUe+d7ngIESvTfa7HO92NJBRZa0
         wXRDQaa7fuxuRPfgz4DYe9Y6YTHbFkNORVL+vfBz/hKxGtixm9DueEYWdN0wQdvaBdSe
         K0VcOtZw+s0aK+5WLIKcpI5tFb26WMDB7oM/F57QIHxvmLeqoYgqoxokiMDL7Sp5HDTY
         z/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395400; x=1781000200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=hMxaUMxFy+TwOvmbHzqJr5AzBOXFhz4LMnLMugGlY2vXp9dEanwx5LgG4NQCagI8b4
         YWzzZ21Wzs9DYaGjOnza3na3TiZ64wHWZ6BvCws8YKYwVp6soW4cmna56LySX3G7XAOh
         TyHNFEf85muisyv1NrXRbqeIfDMsE5ZYPoSM1run7/XlMQObqPRnqCsjjIFe75jqma42
         kcev36EPi9kTZJvZmPTX3ALpn4bouzWA6IyoojYRoUZIXHfR0CGjWJlC08XhT6QbB0Mc
         sDlwbQDvGRfLqxcRDWjWddWwdzM7Wes6O2Gr32enXC+pTFEhxtKQr8MjRLMCMTdItKlG
         y26Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xK2ioUPFwi+79g2cLK7N2mRg+kEQU0n/cc3BajAOdaPceIx9zm/zU/QQn0rUXd6mDXmHDxNooVqhmV+tRxyGS@lists.infradead.org
X-Gm-Message-State: AOJu0YzMObUiaaAlQc9o+eZmrtsDRK8hJKBx+OMuhL/BJiuvQ+/6NAHy
	qL5T9rP2VeB2peEjZ3DCDQuF1KwXDyYF+IZ5qS9WmPU9d5Fy9+nszEN5J+37Sg==
X-Gm-Gg: Acq92OFjoc61ytt9bi8Wj/ttzbJ/AVlBBhB9Z78eA4h9oIIqSYeSvTqDvj9QoInXoSM
	H25Lus5QRDx0NBAJOD9tiW0/+pzSMz9Ok6uk4rnyfSexXor0SXxMQ1mMbG1HSunLfcm60TfX59D
	rKUigMmI9nfC+ra0d59PcOBOW2tBOHdxwY+MbrfsKEjkKiqJntAG6A1JXHLFfMo4PR3Ka3+Ci2C
	a2y/g/PicELJrzbzLpXHix51vITfCzgQ6FKy+bOTnUhq3NxBEfxSaAVQ5oPuUsoRroDobiOXwfx
	TxTZ2pLAfF3nSMnYtlbqiw6jjGVApLfqNuueiop5aN+XfEcX+xjJ0vAgAz/Aofn2mPoi4u7Tob/
	wA+2ino9cCwbKWCaCop6zCyUZeVK+DcseQgADXbUiydtTi7d3D9KQfdzGN7ayhNE9rX1kx6/mdV
	8f0whYtjG5OT8y+NPpQFV+4qyABogSYYf3m89hPPBlQI4CuXulewHMB0lSDKneM6cYhGRl
X-Received: by 2002:a17:902:e88c:b0:2bf:30c8:bfa1 with SMTP id d9443c01a7336-2bf368bd8aamr168629675ad.41.1780395399946;
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/5] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Tue,  2 Jun 2026 17:16:04 +0700
Message-ID: <20260602101608.45137-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031641_020589_1D8993D3 
X-CRM114-Status: GOOD (  12.29  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Update the binding descriptions to match the actual clock usage, where
'mclk' is the controller clock and 'hclk' is the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
  - Update commit message based on Krzysztof's review

 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 502907dd28b3..b174d7498029 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -45,8 +45,8 @@ properties:
 
   clocks:
     items:
-      - description: clock for SPDIF bus
       - description: clock for SPDIF controller
+      - description: clock for SPDIF bus
 
   clock-names:
     items:
-- 
2.43.0


